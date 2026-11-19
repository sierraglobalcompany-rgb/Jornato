import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:jornato/src/domain/attendance.dart';
import 'package:jornato/src/domain/attendance_archive.dart';

void main() {
  final base = DateTime.utc(2026, 11, 17, 7);
  late AttendanceLedger ledger;

  MarkEvent event(int minutes, MarkType type, String id) => MarkEvent(
        eventId: id,
        workspaceId: 'personal',
        subjectId: 'self',
        actorId: 'self',
        type: type,
        occurredAt: base.add(Duration(minutes: minutes)),
      );

  Map<String, dynamic> payload() =>
      jsonDecode(AttendanceArchive.encode(ledger))
          as Map<String, dynamic>;

  String changed(void Function(Map<String, dynamic>) mutate) {
    final value = payload();
    mutate(value);
    return jsonEncode(value);
  }

  Map<String, dynamic> item(Map<String, dynamic> value, int index) =>
      (value['events'] as List<dynamic>)[index] as Map<String, dynamic>;

  setUp(() {
    ledger = AttendanceLedger(workspaceId: 'personal', subjectId: 'self');
    ledger.record(event(0, MarkType.entry, 'e1'));
    ledger.record(event(90, MarkType.pause, 'e2'));
    ledger.record(event(110, MarkType.resume, 'e3'));
    ledger.record(event(180, MarkType.exit, 'e4'));
  });

  test('archivo canónico y reconstrucción conservan horas e identidad', () {
    final encoded = AttendanceArchive.encode(ledger);
    final decoded = AttendanceArchive.decode(encoded);
    expect(AttendanceArchive.encode(decoded), encoded);
    expect(decoded.events, hasLength(4));
    expect(decoded.events.first.occurredAt.isUtc, isTrue);
    expect(decoded.events.first.actorId, 'self');
    expect(decoded.snapshot(at: base.add(const Duration(hours: 3)))
        .worked.inMinutes, 160);
    expect(decoded.snapshot(at: base.add(const Duration(hours: 3)))
        .paused.inMinutes, 20);
    expect(decoded.status, DayStatus.finished);
  });

  test('encode es determinista entre llamadas', () {
    expect(AttendanceArchive.encode(ledger), AttendanceArchive.encode(ledger));
    expect(payload()['schema'], AttendanceArchive.schema);
  });

  test('restaura exactamente identificadores válidos con espacios', () {
    final unusual = AttendanceLedger(
      workspaceId: ' equipo A ',
      subjectId: ' empleado 1 ',
    );
    unusual.record(
      MarkEvent(
        eventId: ' evento 1 ',
        workspaceId: ' equipo A ',
        subjectId: ' empleado 1 ',
        actorId: ' autor ',
        type: MarkType.entry,
        occurredAt: base,
      ),
    );
    final copy = AttendanceArchive.decode(AttendanceArchive.encode(unusual));
    expect(copy.workspaceId, ' equipo A ');
    expect(copy.subjectId, ' empleado 1 ');
    expect(copy.events.single.eventId, ' evento 1 ');
    expect(copy.events.single.actorId, ' autor ');
  });

  test('archivo vacío es válido y conserva espacio/sujeto', () {
    final empty = AttendanceLedger(workspaceId: 'a', subjectId: 'b');
    final restored = AttendanceArchive.decode(AttendanceArchive.encode(empty));
    expect(restored.events, isEmpty);
    expect(restored.workspaceId, 'a');
    expect(restored.subjectId, 'b');
  });

  test('rechaza versión desconocida', () {
    expect(
      () => AttendanceArchive.decode(
        changed((v) => v['schema'] = 'jornato.attendance.v2'),
      ),
      throwsFormatException,
    );
  });

  test('rechaza formato raíz no objeto', () {
    expect(() => AttendanceArchive.decode('[]'), throwsFormatException);
  });

  test('rechaza JSON inválido', () {
    expect(() => AttendanceArchive.decode('{'), throwsFormatException);
  });

  test('rechaza campos raíz extras y faltantes', () {
    expect(
      () => AttendanceArchive.decode(changed((v) => v['token'] = 'x')),
      throwsFormatException,
    );
    expect(
      () => AttendanceArchive.decode(changed((v) => v.remove('subjectId'))),
      throwsFormatException,
    );
  });

  test('rechaza campos evento extras o incompletos', () {
    expect(
      () => AttendanceArchive.decode(
        changed((v) => item(v, 0)['ignored'] = true),
      ),
      throwsFormatException,
    );
    expect(
      () => AttendanceArchive.decode(
        changed((v) => item(v, 0).remove('actorId')),
      ),
      throwsFormatException,
    );
  });

  test('rechaza id vacío, actor vacío y tipos de dato erróneos', () {
    for (final edit in <void Function(Map<String, dynamic>)>[
      (v) => item(v, 0)['eventId'] = '  ',
      (v) => item(v, 0)['actorId'] = '',
      (v) => item(v, 0)['eventId'] = 12,
    ]) {
      expect(
        () => AttendanceArchive.decode(changed(edit)),
        throwsFormatException,
      );
    }
  });

  test('rechaza tipo de marcación desconocido', () {
    expect(
      () => AttendanceArchive.decode(
        changed((v) => item(v, 0)['type'] = 'holiday'),
      ),
      throwsFormatException,
    );
  });

  test('rechaza evento de otra empresa o sujeto', () {
    expect(
      () => AttendanceArchive.decode(
        changed((v) => item(v, 1)['workspaceId'] = 'otra-empresa'),
      ),
      throwsFormatException,
    );
    expect(
      () => AttendanceArchive.decode(
        changed((v) => item(v, 1)['subjectId'] = 'otro'),
      ),
      throwsFormatException,
    );
  });

  test('rechaza duplicado aunque tenga mismo contenido', () {
    expect(
      () => AttendanceArchive.decode(
        changed((v) {
          final events = v['events'] as List<dynamic>;
          events.add(Map<String, dynamic>.from(item(v, 0)));
        }),
      ),
      throwsFormatException,
    );
  });

  test('rechaza transición de jornada inválida', () {
    expect(
      () => AttendanceArchive.decode(
        changed((v) => item(v, 1)['type'] = 'entry'),
      ),
      throwsFormatException,
    );
  });

  test('rechaza eventos fuera de orden temporal', () {
    expect(
      () => AttendanceArchive.decode(
        changed((v) => item(v, 1)['occurredAt'] =
            base.subtract(const Duration(minutes: 1)).toIso8601String()),
      ),
      throwsFormatException,
    );
  });

  test('rechaza timestamps sin UTC canónico y fechas imposibles', () {
    for (final instant in <String>[
      '2026-11-17T07:00:00',
      '2026-11-17T07:00:00+00:00',
      '2026-02-30T07:00:00.000Z',
      '2026-11-17T07:00:00Z',
    ]) {
      expect(
        () => AttendanceArchive.decode(
          changed((v) => item(v, 0)['occurredAt'] = instant),
        ),
        throwsFormatException,
      );
    }
  });

  test('rechaza una lista de eventos no válida', () {
    expect(
      () => AttendanceArchive.decode(changed((v) => v['events'] = {})),
      throwsFormatException,
    );
  });

  test('rechaza elementos que no son eventos', () {
    expect(
      () => AttendanceArchive.decode(
        changed((v) => (v['events'] as List<dynamic>)[0] = null),
      ),
      throwsFormatException,
    );
  });
}
