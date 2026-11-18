import 'package:flutter_test/flutter_test.dart';
import 'package:jornato/src/domain/attendance.dart';

void main() {
  final base = DateTime.utc(2026, 11, 17, 8);
  late AttendanceLedger ledger;
  var counter = 0;

  void mark(int minute, MarkType type) {
    counter++;
    ledger.record(
      MarkEvent(
        eventId: 'event-$counter',
        workspaceId: 'personal',
        subjectId: 'self',
        actorId: 'self',
        type: type,
        occurredAt: base.add(Duration(minutes: minute)),
      ),
    );
  }

  DateTime at(int minutes) => base.add(Duration(minutes: minutes));

  setUp(() {
    counter = 0;
    ledger = AttendanceLedger(workspaceId: 'personal', subjectId: 'self');
  });

  test('sin eventos no crea turnos ni horas ficticias', () {
    expect(ledger.shifts(at: at(10)), isEmpty);
    final total = ledger.snapshot(at: at(10));
    expect(total.status, DayStatus.idle);
    expect(total.worked, Duration.zero);
    expect(total.paused, Duration.zero);
  });

  test('turno abierto proyecta sólo tiempo transcurrido', () {
    mark(0, MarkType.entry);
    final item = ledger.shifts(at: at(30)).single;
    expect(item.startedAt, at(0));
    expect(item.finishedAt, isNull);
    expect(item.status, DayStatus.working);
    expect(item.worked.inMinutes, 30);
    expect(item.paused, Duration.zero);
  });

  test('pausa abierta suma pausa real y congela tiempo trabajado', () {
    mark(0, MarkType.entry);
    mark(60, MarkType.pause);
    final item = ledger.shifts(at: at(90)).single;
    expect(item.status, DayStatus.paused);
    expect(item.worked.inMinutes, 60);
    expect(item.paused.inMinutes, 30);
  });

  test('continuación y salida registran intervalos reales', () {
    mark(0, MarkType.entry);
    mark(60, MarkType.pause);
    mark(90, MarkType.resume);
    mark(150, MarkType.exit);
    final item = ledger.shifts(at: at(150)).single;
    expect(item.status, DayStatus.finished);
    expect(item.finishedAt, at(150));
    expect(item.worked.inMinutes, 120);
    expect(item.paused.inMinutes, 30);
  });

  test('salida desde pausa cuenta descanso sin inventar trabajo', () {
    mark(0, MarkType.entry);
    mark(60, MarkType.pause);
    mark(120, MarkType.exit);
    final item = ledger.shifts(at: at(120)).single;
    expect(item.worked.inMinutes, 60);
    expect(item.paused.inMinutes, 60);
    expect(item.status, DayStatus.finished);
  });

  test('varios turnos no cuentan el intervalo entre salidas y entradas', () {
    mark(0, MarkType.entry);
    mark(120, MarkType.exit);
    mark(180, MarkType.entry);
    mark(240, MarkType.pause);
    mark(255, MarkType.resume);
    mark(300, MarkType.exit);
    final shifts = ledger.shifts(at: at(300));
    expect(shifts, hasLength(2));
    expect(shifts[0].worked.inMinutes, 120);
    expect(shifts[0].paused, Duration.zero);
    expect(shifts[1].worked.inMinutes, 105);
    expect(shifts[1].paused.inMinutes, 15);
    final total = ledger.snapshot(at: at(300));
    expect(total.worked.inMinutes, 225);
    expect(total.paused.inMinutes, 15);
    expect(total.status, DayStatus.finished);
  });

  test('un instante anterior al segundo turno no incluye el futuro', () {
    mark(0, MarkType.entry);
    mark(120, MarkType.exit);
    mark(180, MarkType.entry);
    mark(240, MarkType.exit);
    final shifts = ledger.shifts(at: at(195));
    expect(shifts, hasLength(2));
    expect(shifts[1].status, DayStatus.working);
    expect(shifts[1].worked.inMinutes, 15);
    expect(ledger.snapshot(at: at(150)).worked.inMinutes, 120);
    expect(ledger.shifts(at: at(-1)), isEmpty);
  });

  test('un turno nocturno conserva fecha de entrada', () {
    mark(0, MarkType.entry);
    mark(1200, MarkType.exit);
    final shift = ledger.shifts(at: at(1200)).single;
    expect(shift.startedAt.day, 17);
    expect(shift.finishedAt!.day, 18);
    expect(shift.worked.inHours, 20);
    expect(shift.paused, Duration.zero);
  });

  test('el libro retorna colección de turnos inmutable', () {
    mark(0, MarkType.entry);
    final value = ledger.shifts(at: at(10));
    expect(
      () => value.clear(),
      throwsUnsupportedError,
    );
  });

  test('misma marca reintentada no crea segundo turno', () {
    final first = MarkEvent(
      eventId: 'fixed',
      workspaceId: 'personal',
      subjectId: 'self',
      actorId: 'self',
      type: MarkType.entry,
      occurredAt: at(0),
    );
    ledger.record(first);
    ledger.record(first);
    expect(ledger.shifts(at: at(10)), hasLength(1));
    expect(ledger.snapshot(at: at(10)).worked.inMinutes, 10);
  });

  test('dos marcas en el mismo instante producen cero duración', () {
    mark(0, MarkType.entry);
    mark(0, MarkType.exit);
    final shift = ledger.shifts(at: at(0)).single;
    expect(shift.worked, Duration.zero);
    expect(shift.paused, Duration.zero);
    expect(shift.status, DayStatus.finished);
  });

  test('el estado del resumen corresponde al último turno', () {
    mark(0, MarkType.entry);
    mark(30, MarkType.exit);
    mark(60, MarkType.entry);
    mark(90, MarkType.pause);
    expect(ledger.snapshot(at: at(120)).status, DayStatus.paused);
    expect(ledger.snapshot(at: at(120)).worked.inMinutes, 60);
    expect(ledger.snapshot(at: at(120)).paused.inMinutes, 30);
  });

  test('proyección anterior a entrada devuelve idle aunque libro esté activo', () {
    mark(100, MarkType.entry);
    expect(ledger.status, DayStatus.working);
    expect(ledger.snapshot(at: at(50)).status, DayStatus.idle);
  });
}
