import 'dart:convert';

import 'attendance.dart';

/// Formato de intercambio determinista para eventos F0.
///
/// NO cifra, NO persiste, NO autentica y NO autoriza sincronización.
/// Sólo debe entregarse a un almacenamiento cifrado y aislado por sujeto
/// después de aprobar SQLCipher/Keystore y su contrato de restauración.
abstract final class AttendanceArchive {
  static const String schema = 'jornato.attendance.v1';

  static String encode(AttendanceLedger ledger) {
    return jsonEncode(<String, Object?>{
      'schema': schema,
      'workspaceId': ledger.workspaceId,
      'subjectId': ledger.subjectId,
      'events': ledger.events
          .map(
            (event) => <String, Object>{
              'eventId': event.eventId,
              'workspaceId': event.workspaceId,
              'subjectId': event.subjectId,
              'actorId': event.actorId,
              'type': event.type.name,
              'occurredAt': event.occurredAt.toIso8601String(),
            },
          )
          .toList(growable: false),
    });
  }

  /// Reconstruye usando AttendanceLedger.record, nunca inserción directa.
  /// Fallo cerrado ante versión desconocida, datos extra, duplicados,
  /// cambios de sujeto/espacio, orden temporal o transición ilegal.
  static AttendanceLedger decode(String source) {
    final Object? parsed = jsonDecode(source);
    if (parsed is! Map<String, dynamic>) {
      throw const FormatException('El archivo debe contener un objeto JSON');
    }
    _expectKeys(parsed, const <String>{
      'schema', 'workspaceId', 'subjectId', 'events',
    });
    if (parsed['schema'] != schema) {
      throw const FormatException('Versión de archivo no compatible');
    }
    final workspace = _requiredText(parsed, 'workspaceId');
    final subject = _requiredText(parsed, 'subjectId');
    final Object? rawEvents = parsed['events'];
    if (rawEvents is! List<dynamic>) {
      throw const FormatException('Lista de eventos inválida');
    }

    final ledger = AttendanceLedger(
      workspaceId: workspace,
      subjectId: subject,
    );
    final seenIds = <String>{};
    for (var index = 0; index < rawEvents.length; index++) {
      final Object? value = rawEvents[index];
      if (value is! Map<String, dynamic>) {
        throw FormatException('Evento inválido en posición $index');
      }
      _expectKeys(value, const <String>{
        'eventId', 'workspaceId', 'subjectId', 'actorId', 'type', 'occurredAt',
      });
      final eventId = _requiredText(value, 'eventId');
      if (!seenIds.add(eventId)) {
        throw FormatException('Evento duplicado en posición $index');
      }

      final typeName = _requiredText(value, 'type');
      MarkType? type;
      for (final candidate in MarkType.values) {
        if (candidate.name == typeName) {
          type = candidate;
          break;
        }
      }
      if (type == null) {
        throw FormatException('Tipo de marcación desconocido en $index');
      }

      final instant = _requiredText(value, 'occurredAt');
      final occurredAt = DateTime.tryParse(instant);
      // Sólo la forma UTC canónica que produce encode. Nunca aceptar fechas
      // sin zona horaria ni la normalización silenciosa de fechas imposibles.
      if (occurredAt == null ||
          !instant.endsWith('Z') ||
          occurredAt.toUtc().toIso8601String() != instant) {
        throw FormatException('Fecha UTC no canónica en $index');
      }

      final event = MarkEvent(
        eventId: eventId,
        workspaceId: _requiredText(value, 'workspaceId'),
        subjectId: _requiredText(value, 'subjectId'),
        actorId: _requiredText(value, 'actorId'),
        type: type,
        occurredAt: occurredAt,
      );
      try {
        ledger.record(event);
      } on StateError catch (error) {
        throw FormatException(
          'Archivo inconsistente en evento $index: ${error.message}',
        );
      }
    }
    return ledger;
  }

  static String _requiredText(Map<String, dynamic> map, String key) {
    final Object? value = map[key];
    if (value is! String || value.trim().isEmpty) {
      throw FormatException('Campo $key inválido');
    }
    return value;
  }

  static void _expectKeys(Map<String, dynamic> map, Set<String> expected) {
    final found = map.keys.toSet();
    if (found.difference(expected).isNotEmpty ||
        expected.difference(found).isNotEmpty) {
      throw const FormatException('Campos inesperados o ausentes');
    }
  }
}
