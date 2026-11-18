import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:jornato/src/domain/attendance.dart';
import 'package:jornato/src/domain/attendance_archive.dart';

void main() {
  final origin = DateTime.utc(2026, 11, 18, 8);

  final events = <MarkType>[
    MarkType.entry,
    MarkType.pause,
    MarkType.resume,
    MarkType.exit,
    MarkType.entry,
    MarkType.exit,
  ];

  AttendanceLedger make(
    int count, {
    String workspace = 'personal',
    String subject = 'self',
    String actor = 'self',
  }) {
    final book = AttendanceLedger(
      workspaceId: workspace,
      subjectId: subject,
    );
    for (var i = 0; i < count; i++) {
      book.record(
        MarkEvent(
          eventId: 'id-$i',
          workspaceId: workspace,
          subjectId: subject,
          actorId: actor,
          type: events[i],
          occurredAt: origin.add(Duration(minutes: i * 15)),
        ),
      );
    }
    return book;
  }

  String archive(AttendanceLedger book) => AttendanceArchive.encode(book);

  String modify(
    AttendanceLedger book,
    void Function(Map<String, dynamic> value) change,
  ) {
    final map = jsonDecode(archive(book)) as Map<String, dynamic>;
    change(map);
    return jsonEncode(map);
  }

  Map<String, dynamic> item(Map<String, dynamic> map, int index) =>
      (map['events'] as List<dynamic>)[index] as Map<String, dynamic>;

  test('historial remoto más largo anexa sin cambiar el original', () {
    final current = make(2);
    final extended = make(4);
    final result = AttendanceArchive.reconcile(current, archive(extended));
    expect(result.events, hasLength(4));
    expect(current.events, hasLength(2));
    expect(archive(result), archive(extended));
    expect(result.snapshot(at: origin.add(const Duration(minutes: 45)))
        .status, DayStatus.finished);
  });

  test('captura vieja conserva la instancia más reciente', () {
    final current = make(4);
    final result = AttendanceArchive.reconcile(current, archive(make(2)));
    expect(result, same(current));
    expect(current.events, hasLength(4));
  });

  test('captura idéntica no crea eventos repetidos', () {
    final current = make(4);
    final result = AttendanceArchive.reconcile(current, archive(make(4)));
    expect(result, same(current));
    expect(result.events, hasLength(4));
  });

  test('libro vacío acepta la primera captura válida', () {
    final current = make(0);
    final result = AttendanceArchive.reconcile(current, archive(make(4)));
    expect(result.events, hasLength(4));
    expect(current.events, isEmpty);
  });

  test('captura vacía no reemplaza trabajo válido', () {
    final current = make(4);
    expect(
      AttendanceArchive.reconcile(current, archive(make(0))),
      same(current),
    );
  });

  test('libro vacío y captura vacía no inventan eventos', () {
    final current = make(0);
    expect(
      AttendanceArchive.reconcile(current, archive(make(0))),
      same(current),
    );
  });

  test('rechaza misma posición con autor distinto', () {
    final current = make(2);
    final forged = modify(make(4), (data) {
      item(data, 0)['actorId'] = 'intruso';
    });
    expect(
      () => AttendanceArchive.reconcile(current, forged),
      throwsStateError,
    );
    expect(current.events, hasLength(2));
  });

  test('rechaza misma posición con timestamp distinto', () {
    final current = make(2);
    final changed = modify(make(4), (data) {
      item(data, 1)['occurredAt'] =
          origin.add(const Duration(minutes: 20)).toIso8601String();
    });
    expect(
      () => AttendanceArchive.reconcile(current, changed),
      throwsStateError,
    );
  });

  test('rechaza mismo ID si el tipo cambia', () {
    final current = make(4);
    final changed = modify(make(4), (data) {
      item(data, 1)['type'] = 'exit';
      item(data, 2)['type'] = 'entry';
    });
    // Esta secuencia alternativa es válida: debe fallar por divergencia
    // con el historial local, no por permitir mutar un evento anterior.
    expect(
      () => AttendanceArchive.reconcile(current, changed),
      throwsStateError,
    );
    expect(current.events, hasLength(4));
  });

  test('rechaza captura de otro espacio', () {
    final current = make(2);
    expect(
      () => AttendanceArchive.reconcile(
        current,
        archive(make(4, workspace: 'otra-empresa')),
      ),
      throwsStateError,
    );
  });

  test('rechaza captura de otro sujeto', () {
    final current = make(2);
    expect(
      () => AttendanceArchive.reconcile(
        current,
        archive(make(4, subject: 'otra-persona')),
      ),
      throwsStateError,
    );
  });

  test('rechaza archivo no válido sin mutar libro de trabajo', () {
    final current = make(4);
    final before = archive(current);
    expect(
      () => AttendanceArchive.reconcile(current, '{'),
      throwsFormatException,
    );
    expect(archive(current), before);
  });

  test('rechaza duplicado con el mismo ID aunque parezca reintento', () {
    final current = make(2);
    final changed = modify(make(4), (data) {
      (data['events'] as List<dynamic>).add(
        Map<String, dynamic>.from(item(data, 0)),
      );
    });
    expect(
      () => AttendanceArchive.reconcile(current, changed),
      throwsFormatException,
    );
  });

  test('dos turnos válidos avanzan sin alterar el primero', () {
    final current = make(4);
    final incoming = make(6);
    final result = AttendanceArchive.reconcile(current, archive(incoming));
    final shifts = result.shifts(
      at: origin.add(const Duration(minutes: 75)),
    );
    expect(shifts, hasLength(2));
    expect(shifts[0].worked.inMinutes, 30);
    expect(shifts[0].paused.inMinutes, 15);
    expect(shifts[1].worked.inMinutes, 15);
    expect(current.shifts(
      at: origin.add(const Duration(minutes: 75)),
    ), hasLength(1));
  });
}
