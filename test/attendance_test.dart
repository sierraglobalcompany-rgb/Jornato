import 'package:flutter_test/flutter_test.dart';
import 'package:jornato/src/domain/attendance.dart';

void main() {
  late AttendanceLedger ledger;
  final base = DateTime.utc(2026, 10, 24, 8);

  MarkEvent make(
    int minute,
    MarkType type, {
    String id = 'unique',
    String workspace = 'personal',
    String subject = 'self',
  }) =>
      MarkEvent(
        eventId: id,
        workspaceId: workspace,
        subjectId: subject,
        actorId: 'self',
        type: type,
        occurredAt: base.add(Duration(minutes: minute)),
      );

  setUp(() {
    ledger = AttendanceLedger(workspaceId: 'personal', subjectId: 'self');
  });

  test('descuenta únicamente pausa real, no prevista', () {
    ledger.record(make(0, MarkType.entry, id: '1'));
    ledger.record(make(240, MarkType.pause, id: '2'));
    ledger.record(make(260, MarkType.resume, id: '3'));
    ledger.record(make(480, MarkType.exit, id: '4'));
    final result = ledger.snapshot(at: base.add(const Duration(hours: 8)));
    expect(result.worked.inMinutes, 460);
    expect(result.paused.inMinutes, 20);
    expect(result.status, DayStatus.finished);
  });

  test('un reintento con igual ID y contenido no duplica', () {
    final event = make(0, MarkType.entry);
    ledger.record(event);
    expect(ledger.record(event), same(event));
    expect(ledger.events, hasLength(1));
  });

  test('mismo ID y contenido diferente es conflicto', () {
    ledger.record(make(0, MarkType.entry));
    expect(
      () => ledger.record(make(1, MarkType.entry)),
      throwsStateError,
    );
  });

  test('rechaza salida sin entrada y doble pausa', () {
    expect(() => ledger.record(make(0, MarkType.exit)), throwsStateError);
    ledger.record(make(0, MarkType.entry, id: '1'));
    ledger.record(make(1, MarkType.pause, id: '2'));
    expect(() => ledger.record(make(2, MarkType.pause, id: '3')),
        throwsStateError);
  });

  test('no mezcla espacios o sujetos', () {
    expect(
      () => ledger.record(
        make(0, MarkType.entry, workspace: 'otra-empresa'),
      ),
      throwsStateError,
    );
    expect(
      () => ledger.record(make(0, MarkType.entry, subject: 'otro')),
      throwsStateError,
    );
  });

  test('rechaza fechas anteriores al último evento', () {
    ledger.record(make(20, MarkType.entry, id: '1'));
    expect(
      () => ledger.record(make(10, MarkType.exit, id: '2')),
      throwsStateError,
    );
  });

  test('turno nocturno conserva las horas reales', () {
    ledger.record(make(0, MarkType.entry, id: '1'));
    ledger.record(make(1200, MarkType.exit, id: '2'));
    expect(
      ledger.snapshot(
        at: base.add(const Duration(hours: 20)),
      ).worked.inHours,
      20,
    );
  });

  test('puede finalizar durante pausa, descontando el intervalo completo', () {
    ledger.record(make(0, MarkType.entry, id: '1'));
    ledger.record(make(60, MarkType.pause, id: '2'));
    ledger.record(make(90, MarkType.exit, id: '3'));
    final result = ledger.snapshot(at: base.add(const Duration(minutes: 90)));
    expect(result.worked.inMinutes, 60);
    expect(result.paused.inMinutes, 30);
  });
}
