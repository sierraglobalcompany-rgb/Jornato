import 'package:flutter_test/flutter_test.dart';
import 'package:jornato/src/domain/attendance.dart';
import 'package:jornato/src/domain/attendance_csv_report.dart';

void main() {
  final base = DateTime.utc(2026, 11, 18, 1); // Bogotá: 17 nov, 20:00.
  late AttendanceLedger ledger;
  var serial = 0;

  DateTime at(int minutes) => base.add(Duration(minutes: minutes));
  DateTime bogota(DateTime instant) =>
      instant.toUtc().subtract(const Duration(hours: 5));

  void mark(int minutes, MarkType type) {
    serial++;
    ledger.record(
      MarkEvent(
        eventId: 'evento-$serial',
        workspaceId: 'espacio-sintetico',
        subjectId: 'usuario-sintetico',
        actorId: 'operador-sintetico',
        type: type,
        occurredAt: at(minutes),
      ),
    );
  }

  String exportAt(int minutes) => AttendanceCsvReport.fromLedger(
        ledger,
        at: at(minutes),
        localTime: bogota,
      );

  setUp(() {
    serial = 0;
    ledger = AttendanceLedger(
      workspaceId: 'espacio-sintetico',
      subjectId: 'usuario-sintetico',
    );
  });

  test('sin eventos produce sólo cabecera CSV estable', () {
    expect(exportAt(0), AttendanceCsvReport.header);
    expect(
      AttendanceCsvReport.header,
      'fecha,turnos,finalizados,abiertos,trabajo_microsegundos,'
      'pausa_microsegundos\r\n',
    );
  });

  test('un turno terminado registra horas reales en microsegundos', () {
    mark(0, MarkType.entry);
    mark(60, MarkType.exit);
    expect(
      exportAt(60),
      AttendanceCsvReport.header +
          '2026-11-17,1,1,0,3600000000,0\r\n',
    );
  });

  test('jornada nocturna se atribuye a fecha civil de entrada', () {
    mark(0, MarkType.entry); // 20:00 del 17.
    mark(360, MarkType.exit); // 02:00 del 18.
    final csv = exportAt(360);
    expect(csv.contains('2026-11-17,1,1,0,21600000000,0'), isTrue);
    expect(csv.contains('2026-11-18,'), isFalse);
  });

  test('dos jornadas de días distintos producen dos filas ordenadas', () {
    mark(0, MarkType.entry);
    mark(30, MarkType.exit);
    mark(600, MarkType.entry); // 06:00 del 18.
    mark(660, MarkType.exit);
    expect(
      exportAt(660).split('\r\n').where((row) => row.isNotEmpty).toList(),
      <String>[
        AttendanceCsvReport.header.trim(),
        '2026-11-17,1,1,0,1800000000,0',
        '2026-11-18,1,1,0,3600000000,0',
      ],
    );
  });

  test('dos turnos de un mismo día se agrupan sin doble conteo', () {
    mark(0, MarkType.entry);
    mark(10, MarkType.exit);
    mark(20, MarkType.entry);
    mark(50, MarkType.exit);
    expect(
      exportAt(50),
      AttendanceCsvReport.header +
          '2026-11-17,2,2,0,2400000000,0\r\n',
    );
  });

  test('pausa real queda separada del tiempo trabajado', () {
    mark(0, MarkType.entry);
    mark(30, MarkType.pause);
    mark(40, MarkType.resume);
    mark(60, MarkType.exit);
    expect(
      exportAt(60),
      AttendanceCsvReport.header +
          '2026-11-17,1,1,0,3000000000,600000000\r\n',
    );
  });

  test('jornada abierta conserva estado abierto en el reporte', () {
    mark(0, MarkType.entry);
    expect(
      exportAt(10),
      AttendanceCsvReport.header +
          '2026-11-17,1,0,1,600000000,0\r\n',
    );
  });

  test('pausa abierta no crea horas trabajadas adicionales', () {
    mark(0, MarkType.entry);
    mark(20, MarkType.pause);
    expect(
      exportAt(35),
      AttendanceCsvReport.header +
          '2026-11-17,1,0,1,1200000000,900000000\r\n',
    );
  });

  test('corte anterior a eventos no exporta jornadas futuras', () {
    mark(100, MarkType.entry);
    expect(exportAt(99), AttendanceCsvReport.header);
  });

  test('conserva exactamente fracciones de segundo', () {
    final start = base.add(const Duration(microseconds: 101));
    final end = base.add(const Duration(microseconds: 1001001));
    ledger.record(
      MarkEvent(
        eventId: 'a',
        workspaceId: 'espacio-sintetico',
        subjectId: 'usuario-sintetico',
        actorId: 'operador-sintetico',
        type: MarkType.entry,
        occurredAt: start,
      ),
    );
    ledger.record(
      MarkEvent(
        eventId: 'b',
        workspaceId: 'espacio-sintetico',
        subjectId: 'usuario-sintetico',
        actorId: 'operador-sintetico',
        type: MarkType.exit,
        occurredAt: end,
      ),
    );
    expect(
      AttendanceCsvReport.fromLedger(ledger, at: end, localTime: bogota),
      AttendanceCsvReport.header +
          '2026-11-17,1,1,0,1000900,0\r\n',
    );
  });

  test('no revela espacio, sujeto, actor, ID ni GPS', () {
    mark(0, MarkType.entry);
    mark(10, MarkType.exit);
    final csv = exportAt(10);
    expect(csv.contains('espacio-sintetico'), isFalse);
    expect(csv.contains('usuario-sintetico'), isFalse);
    expect(csv.contains('operador-sintetico'), isFalse);
    expect(csv.contains('evento-'), isFalse);
    expect(csv.contains('latitude'), isFalse);
    expect(csv.contains('longitude'), isFalse);
  });

  test('no modifica el historial ni su idempotencia al exportar', () {
    mark(0, MarkType.entry);
    mark(30, MarkType.exit);
    final before = ledger.events.toList();
    final first = exportAt(30);
    expect(exportAt(30), first);
    expect(ledger.events, orderedEquals(before));
    expect(ledger.events, hasLength(2));
  });

  test('rechaza año civil fuera de CSV canónico para evitar fórmula', () {
    mark(0, MarkType.entry);
    expect(
      () => AttendanceCsvReport.fromLedger(
        ledger,
        at: at(10),
        localTime: (_) => DateTime.utc(-10, 1, 1),
      ),
      throwsStateError,
    );
  });

  test('no realiza exportación automática ni guarda archivos', () {
    mark(0, MarkType.entry);
    // API sólo devuelve String: no abre rutas, red ni permisos.
    final csv = exportAt(1);
    expect(csv, isA<String>());
    expect(csv.endsWith('\r\n'), isTrue);
  });
}
