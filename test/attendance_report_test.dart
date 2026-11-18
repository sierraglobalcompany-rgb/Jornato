import 'package:flutter_test/flutter_test.dart';
import 'package:jornato/src/domain/attendance.dart';
import 'package:jornato/src/domain/attendance_report.dart';

void main() {
  final origin = DateTime.utc(2026, 11, 18, 2); // 21:00 del día 17 en Bogotá.
  late AttendanceLedger ledger;
  var sequence = 0;

  DateTime instant(int minutes) => origin.add(Duration(minutes: minutes));

  void mark(int minutes, MarkType type) {
    sequence++;
    ledger.record(
      MarkEvent(
        eventId: 'mark-$sequence',
        workspaceId: 'personal',
        subjectId: 'self',
        actorId: 'self',
        type: type,
        occurredAt: instant(minutes),
      ),
    );
  }

  DateTime bogota(DateTime time) =>
      time.toUtc().subtract(const Duration(hours: 5));

  List<AttendanceDayTotal> report(int minute) => AttendanceReport.days(
        ledger,
        at: instant(minute),
        localTime: bogota,
      );

  setUp(() {
    sequence = 0;
    ledger = AttendanceLedger(workspaceId: 'personal', subjectId: 'self');
  });

  test('sin eventos no inventa días ni jornadas', () {
    expect(report(10), isEmpty);
  });

  test('día local explícito evita atribuir la noche a UTC', () {
    mark(0, MarkType.entry);
    mark(60, MarkType.exit);
    final item = report(60).single;
    expect(item.date, '2026-11-17');
    expect(item.shifts, 1);
    expect(item.finishedShifts, 1);
    expect(item.worked.inMinutes, 60);
    expect(item.paused, Duration.zero);
    expect(item.hasOpenShift, isFalse);
  });

  test('un turno que cruza medianoche pertenece a la fecha de entrada', () {
    mark(0, MarkType.entry); // 21:00 del día 17.
    mark(240, MarkType.exit); // 01:00 del día 18.
    final item = report(240).single;
    expect(item.date, '2026-11-17');
    expect(item.worked.inHours, 4);
  });

  test('separa turnos que comienzan en días distintos', () {
    mark(0, MarkType.entry);
    mark(90, MarkType.exit);
    mark(600, MarkType.entry); // 07:00 del día 18.
    mark(660, MarkType.exit);
    final result = report(660);
    expect(result, hasLength(2));
    expect(result[0].date, '2026-11-17');
    expect(result[1].date, '2026-11-18');
    expect(result[0].worked.inMinutes, 90);
    expect(result[1].worked.inMinutes, 60);
  });

  test('agrupa varios turnos que inician el mismo día local', () {
    mark(0, MarkType.entry);
    mark(30, MarkType.exit);
    mark(60, MarkType.entry);
    mark(150, MarkType.exit); // Todavía día 17.
    final item = report(150).single;
    expect(item.shifts, 2);
    expect(item.finishedShifts, 2);
    expect(item.worked.inMinutes, 120);
  });

  test('pausas reales cuentan en el día de inicio', () {
    mark(0, MarkType.entry);
    mark(45, MarkType.pause);
    mark(75, MarkType.resume);
    mark(120, MarkType.exit);
    final item = report(120).single;
    expect(item.worked.inMinutes, 90);
    expect(item.paused.inMinutes, 30);
  });

  test('turno activo proyecta sólo hasta el corte y muestra pendiente', () {
    mark(0, MarkType.entry);
    final item = report(20).single;
    expect(item.worked.inMinutes, 20);
    expect(item.finishedShifts, 0);
    expect(item.hasOpenShift, isTrue);
  });

  test('pausa abierta no suma trabajo imaginario', () {
    mark(0, MarkType.entry);
    mark(50, MarkType.pause);
    final item = report(100).single;
    expect(item.worked.inMinutes, 50);
    expect(item.paused.inMinutes, 50);
    expect(item.hasOpenShift, isTrue);
  });

  test('corte anterior a los eventos devuelve días vacíos', () {
    mark(10, MarkType.entry);
    expect(report(9), isEmpty);
  });

  test('turnos posteriores al corte no contaminan un día anterior', () {
    mark(0, MarkType.entry);
    mark(20, MarkType.exit);
    mark(600, MarkType.entry);
    mark(620, MarkType.exit);
    expect(report(100), hasLength(1));
    expect(report(100).single.worked.inMinutes, 20);
  });

  test('el consumidor decide zona por instante, sin offset rígido', () {
    mark(0, MarkType.entry);
    mark(20, MarkType.exit);
    mark(600, MarkType.entry);
    mark(620, MarkType.exit);
    final converted = <DateTime>[];
    final result = AttendanceReport.days(
      ledger,
      at: instant(620),
      localTime: (utc) {
        converted.add(utc);
        return utc == instant(0)
            ? utc.subtract(const Duration(hours: 5))
            : utc; // Simula una política civil que cambió.
      },
    );
    expect(converted, hasLength(2));
    expect(result.map((day) => day.date).toList(),
        <String>['2026-11-17', '2026-11-18']);
  });

  test('la lista de días no se modifica externamente', () {
    mark(0, MarkType.entry);
    final days = report(10);
    expect(() => days.clear(), throwsUnsupportedError);
  });

  test('resumen diario reconcilia con snapshot para el mismo corte', () {
    mark(0, MarkType.entry);
    mark(20, MarkType.pause);
    mark(25, MarkType.resume);
    mark(45, MarkType.exit);
    mark(600, MarkType.entry);
    mark(630, MarkType.pause);
    final days = report(640);
    final projected = ledger.snapshot(at: instant(640));
    final worked = days.fold<Duration>(
      Duration.zero,
      (sum, day) => sum + day.worked,
    );
    final paused = days.fold<Duration>(
      Duration.zero,
      (sum, day) => sum + day.paused,
    );
    expect(worked, projected.worked);
    expect(paused, projected.paused);
    expect(days.last.hasOpenShift, isTrue);
  });
}
