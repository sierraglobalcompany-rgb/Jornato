import 'package:flutter_test/flutter_test.dart';
import 'package:jornato/src/domain/attendance.dart';
import 'package:jornato/src/domain/attendance_archive.dart';

void main() {
  final start = DateTime.utc(2026, 11, 18, 8);

  MarkEvent mark(int index, MarkType type, {String? id, String actor = 'self',
      String workspace = 'personal'}) => MarkEvent(
        eventId: id ?? 'event-$index',
        workspaceId: workspace,
        subjectId: 'self',
        actorId: actor,
        type: type,
        occurredAt: start.add(Duration(minutes: index)),
      );

  test('historial grande conserva 1000 turnos y conteo de horas', () {
    final ledger = AttendanceLedger(
      workspaceId: 'personal',
      subjectId: 'self',
    );
    for (var i = 0; i < 2000; i += 2) {
      ledger.record(mark(i, MarkType.entry));
      ledger.record(mark(i + 1, MarkType.exit));
    }
    expect(ledger.events, hasLength(2000));
    expect(ledger.shifts(
      at: start.add(const Duration(minutes: 1999)),
    ), hasLength(1000));
    final totals = ledger.snapshot(
      at: start.add(const Duration(minutes: 1999)),
    );
    expect(totals.worked.inMinutes, 1000);
    expect(totals.paused, Duration.zero);
  });

  test('reintento antiguo mantiene identidad tras historial largo', () {
    final ledger = AttendanceLedger(
      workspaceId: 'personal',
      subjectId: 'self',
    );
    final first = mark(0, MarkType.entry);
    ledger.record(first);
    for (var i = 1; i < 1000; i++) {
      ledger.record(mark(i, i.isOdd ? MarkType.exit : MarkType.entry));
    }
    final retried = mark(0, MarkType.entry);
    expect(ledger.record(retried), same(first));
    expect(ledger.events, hasLength(1000));
  });

  test('conflicto de ID antiguo detecta autor distinto', () {
    final ledger = AttendanceLedger(
      workspaceId: 'personal',
      subjectId: 'self',
    );
    ledger.record(mark(0, MarkType.entry));
    for (var i = 1; i < 500; i++) {
      ledger.record(mark(i, i.isOdd ? MarkType.exit : MarkType.entry));
    }
    expect(
      () => ledger.record(mark(0, MarkType.entry, actor: 'intruso')),
      throwsStateError,
    );
    expect(ledger.events, hasLength(500));
  });

  test('transición rechazada no reserva su ID para un evento posterior', () {
    final ledger = AttendanceLedger(
      workspaceId: 'personal',
      subjectId: 'self',
    );
    expect(
      () => ledger.record(mark(0, MarkType.exit, id: 'rescatable')),
      throwsStateError,
    );
    final valid = mark(0, MarkType.entry, id: 'rescatable');
    expect(ledger.record(valid), same(valid));
    expect(ledger.events, hasLength(1));
  });

  test('evento de otra empresa rechazado no reserva ID', () {
    final ledger = AttendanceLedger(
      workspaceId: 'personal',
      subjectId: 'self',
    );
    expect(
      () => ledger.record(mark(0, MarkType.entry, id: 'm1',
          workspace: 'otra-empresa')),
      throwsStateError,
    );
    final valid = mark(0, MarkType.entry, id: 'm1');
    ledger.record(valid);
    expect(ledger.events, hasLength(1));
  });

  test('reconstrucción desde archivo conserva índice de duplicados', () {
    final original = AttendanceLedger(
      workspaceId: 'personal',
      subjectId: 'self',
    );
    for (var i = 0; i < 100; i++) {
      original.record(mark(i, i.isEven ? MarkType.entry : MarkType.exit));
    }
    final restored = AttendanceArchive.decode(
      AttendanceArchive.encode(original),
    );
    final first = restored.events.first;
    expect(restored.record(mark(0, MarkType.entry)), same(first));
    expect(
      () => restored.record(mark(0, MarkType.entry, actor: 'intruso')),
      throwsStateError,
    );
    expect(restored.events, hasLength(100));
  });
}
