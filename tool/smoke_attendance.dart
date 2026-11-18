import '../lib/src/domain/attendance.dart';
import '../lib/src/domain/attendance_archive.dart';
import '../lib/src/domain/attendance_report.dart';
import '../lib/src/domain/location_rule.dart';

/// Smoke de Dart puro: NO usa Flutter SDK, servicios, datos reales ni disco.
/// Ejecutar en la raíz del PR #3: dart tool/smoke_attendance.dart
void main() {
  var verified = 0;
  void verify(bool condition, String label) {
    if (!condition) throw StateError('SMOKE FAIL: $label');
    verified++;
  }

  final base = DateTime.utc(2026, 11, 17, 23);
  final book = AttendanceLedger(
    workspaceId: 'qa-local',
    subjectId: 'persona-ficticia',
  );

  MarkEvent make(int minute, MarkType type, String id, {String actor = 'qa'}) {
    return MarkEvent(
      eventId: id,
      workspaceId: 'qa-local',
      subjectId: 'persona-ficticia',
      actorId: actor,
      type: type,
      occurredAt: base.add(Duration(minutes: minute)),
    );
  }

  final first = make(0, MarkType.entry, 'entry-1');
  book.record(first);
  book.record(make(60, MarkType.pause, 'pause-1'));
  book.record(make(80, MarkType.resume, 'resume-1'));
  book.record(make(140, MarkType.exit, 'exit-1'));
  // El segundo turno empieza al siguiente día civil de Bogotá.
  book.record(make(500, MarkType.entry, 'entry-2'));
  book.record(make(530, MarkType.exit, 'exit-2'));

  final at = base.add(const Duration(minutes: 530));
  final shifts = book.shifts(at: at);
  final snapshot = book.snapshot(at: at);
  verify(shifts.length == 2, 'dos turnos');
  verify(shifts[0].worked.inMinutes == 120, 'pausa descontada');
  verify(shifts[0].paused.inMinutes == 20, 'pausa real');
  verify(shifts[1].worked.inMinutes == 30, 'segundo turno');
  verify(snapshot.worked.inMinutes == 150, 'trabajo acumulado');
  verify(snapshot.paused.inMinutes == 20, 'pausa acumulada');
  verify(snapshot.status == DayStatus.finished, 'estado terminado');

  final encoded = AttendanceArchive.encode(book);
  final recovered = AttendanceArchive.decode(encoded);
  verify(AttendanceArchive.encode(recovered) == encoded, 'ida y vuelta');
  verify(recovered.events.length == 6, 'cantidad restaurada');
  verify(recovered.record(make(0, MarkType.entry, 'entry-1'))
      .identicalPayload(first), 'reintento idempotente');

  var rejectedConflict = false;
  try {
    recovered.record(make(0, MarkType.entry, 'entry-1', actor: 'intruso'));
  } on StateError {
    rejectedConflict = true;
  }
  verify(rejectedConflict, 'rechazo de conflicto antiguo');

  final stale = AttendanceLedger(
    workspaceId: 'qa-local',
    subjectId: 'persona-ficticia',
  );
  stale.record(first);
  final longer = AttendanceArchive.reconcile(stale, encoded);
  verify(longer.events.length == 6, 'conciliación append-only');
  verify(stale.events.length == 1, 'sin mutación del original');
  verify(identical(AttendanceArchive.reconcile(longer, encoded), longer),
      'reintento de archivo no duplica');

  final civil = AttendanceReport.days(
    longer,
    at: at,
    localTime: (utc) => utc.toUtc().subtract(const Duration(hours: 5)),
  );
  verify(civil.length == 2, 'separación de fechas de inicio');
  verify(civil.first.date == '2026-11-17', 'fecha civil inicial');
  verify(civil.last.date == '2026-11-18', 'fecha civil siguiente');
  verify(civil.fold<int>(0, (a, day) => a + day.worked.inMinutes) == 150,
      'reconciliación de totales');

  // El primer evento se mantiene distinguible aun después de muchas marcas.
  final longBook = AttendanceLedger(
    workspaceId: 'qa-local',
    subjectId: 'persona-ficticia',
  );
  for (var i = 0; i < 1000; i++) {
    longBook.record(make(i, i.isEven ? MarkType.entry : MarkType.exit,
        'bulk-$i'));
  }
  final earliest = longBook.events.first;
  verify(identical(
    longBook.record(make(0, MarkType.entry, 'bulk-0')), earliest,
  ), 'índice de reintentos antiguos');
  verify(longBook.shifts(
    at: base.add(const Duration(minutes: 999)),
  ).length == 500, '500 turnos sin pérdida');

  // GPS sintético: solo se evalúa geometría, sin sensor ni permiso Android.
  final gpsNow = DateTime.utc(2026, 11, 18, 12);
  final site = LocationRule.requiredSite(
    siteLatitude: 0,
    siteLongitude: 0,
  );
  final centered = LocationFix(
    latitude: 0,
    longitude: 0,
    accuracyMeters: 5,
    capturedAt: gpsNow,
  );
  verify(
    const LocationRule.optional().evaluate(now: gpsNow).outcome ==
        LocationOutcome.notRequired,
    'GPS opcional no exige lectura',
  );
  verify(
    site.evaluate(now: gpsNow).reason == LocationReason.missingFix,
    'GPS obligatorio ausente requiere revisión',
  );
  verify(
    site.evaluate(now: gpsNow, fix: centered).outcome ==
        LocationOutcome.meetsLocalRule,
    'GPS sintético dentro de margen',
  );
  verify(
    site.evaluate(
      now: gpsNow,
      fix: LocationFix(
        latitude: 0,
        longitude: 0,
        accuracyMeters: 26,
        capturedAt: gpsNow,
      ),
    ).reason == LocationReason.insufficientAccuracy,
    'GPS sin precisión suficiente requiere revisión',
  );
  verify(
    site.evaluate(
      now: gpsNow,
      fix: LocationFix(
        latitude: 0,
        longitude: 0,
        accuracyMeters: 5,
        capturedAt: gpsNow.subtract(const Duration(seconds: 31)),
      ),
    ).reason == LocationReason.staleFix,
    'GPS antiguo requiere revisión',
  );
  verify(
    site.evaluate(
      now: gpsNow,
      fix: LocationFix(
        latitude: 0,
        longitude: 0.001,
        accuracyMeters: 5,
        capturedAt: gpsNow,
      ),
    ).reason == LocationReason.beyondRadius,
    'distancia más precisión fuera del radio requiere revisión',
  );
  verify(
    site.evaluate(
      now: gpsNow,
      fix: LocationFix(
        latitude: 0,
        longitude: 0,
        accuracyMeters: 5,
        capturedAt: gpsNow.add(const Duration(milliseconds: 1)),
      ),
    ).reason == LocationReason.futureFix,
    'GPS futuro requiere revisión',
  );

  print('SMOKE_ATTENDANCE=PASS CHECKS=$verified EVENTS=1000');
  print('NOT_CERTIFIED=ANDROID|SQLCIPHER|BACKEND|H9|RELEASE');
}
