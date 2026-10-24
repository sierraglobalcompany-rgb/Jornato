/// Motor puro de marcaciones de Jornato: prototipo F0, sin persistencia.
/// No constituye control de acceso ni registro auditable de producción.
enum MarkType { entry, pause, resume, exit }
enum DayStatus { idle, working, paused, finished }

class MarkEvent {
  MarkEvent({
    required this.eventId,
    required this.workspaceId,
    required this.subjectId,
    required this.actorId,
    required this.type,
    required DateTime occurredAt,
  }) : occurredAt = occurredAt.toUtc();

  final String eventId;
  final String workspaceId;
  final String subjectId;
  final String actorId;
  final MarkType type;
  final DateTime occurredAt;

  bool identicalPayload(MarkEvent other) =>
      eventId == other.eventId &&
      workspaceId == other.workspaceId &&
      subjectId == other.subjectId &&
      actorId == other.actorId &&
      type == other.type &&
      occurredAt == other.occurredAt;
}

class AttendanceSnapshot {
  const AttendanceSnapshot({
    required this.status,
    required this.worked,
    required this.paused,
  });

  final DayStatus status;
  final Duration worked;
  final Duration paused;
}

/// Sólo para un sujeto dentro de un espacio explícito.
/// Eventos inmutables; correcciones, autorización y sincronización vendrán
/// en fases posteriores como modelos separados.
class AttendanceLedger {
  AttendanceLedger({
    required this.workspaceId,
    required this.subjectId,
  }) {
    if (workspaceId.trim().isEmpty || subjectId.trim().isEmpty) {
      throw ArgumentError('Identificadores de espacio y sujeto requeridos');
    }
  }

  final String workspaceId;
  final String subjectId;
  final List<MarkEvent> _events = <MarkEvent>[];

  List<MarkEvent> get events => List<MarkEvent>.unmodifiable(_events);

  DayStatus get status {
    if (_events.isEmpty) return DayStatus.idle;
    return switch (_events.last.type) {
      MarkType.entry || MarkType.resume => DayStatus.working,
      MarkType.pause => DayStatus.paused,
      MarkType.exit => DayStatus.finished,
    };
  }

  MarkEvent record(MarkEvent event) {
    if (event.eventId.trim().isEmpty || event.actorId.trim().isEmpty) {
      throw StateError('Evento y autor obligatorios');
    }
    if (event.workspaceId != workspaceId || event.subjectId != subjectId) {
      throw StateError('Evento de otro espacio o sujeto');
    }

    for (final previous in _events) {
      if (previous.eventId == event.eventId) {
        if (previous.identicalPayload(event)) return previous;
        throw StateError('Conflicto de identificador de evento');
      }
    }

    if (_events.isNotEmpty &&
        event.occurredAt.isBefore(_events.last.occurredAt)) {
      throw StateError('La fecha retrocede; solicitar corrección auditada');
    }

    final valid = switch (event.type) {
      MarkType.entry =>
        status == DayStatus.idle || status == DayStatus.finished,
      MarkType.pause => status == DayStatus.working,
      MarkType.resume => status == DayStatus.paused,
      MarkType.exit =>
        status == DayStatus.working || status == DayStatus.paused,
    };
    if (!valid) throw StateError('Transición de jornada inválida');

    _events.add(event);
    return event;
  }

  AttendanceSnapshot snapshot({DateTime? at}) {
    final cutoff = (at ?? DateTime.now()).toUtc();
    var worked = Duration.zero;
    var paused = Duration.zero;
    DateTime? activeFrom;
    DateTime? pauseFrom;
    DayStatus projectedStatus = DayStatus.idle;

    for (final event in _events) {
      if (event.occurredAt.isAfter(cutoff)) break;
      final t = event.occurredAt;
      switch (event.type) {
        case MarkType.entry:
          activeFrom = t;
          pauseFrom = null;
          projectedStatus = DayStatus.working;
        case MarkType.pause:
          if (activeFrom != null) worked += t.difference(activeFrom);
          activeFrom = null;
          pauseFrom = t;
          projectedStatus = DayStatus.paused;
        case MarkType.resume:
          if (pauseFrom != null) paused += t.difference(pauseFrom);
          pauseFrom = null;
          activeFrom = t;
          projectedStatus = DayStatus.working;
        case MarkType.exit:
          if (activeFrom != null) worked += t.difference(activeFrom);
          if (pauseFrom != null) paused += t.difference(pauseFrom);
          activeFrom = null;
          pauseFrom = null;
          projectedStatus = DayStatus.finished;
      }
    }

    if (activeFrom != null && !cutoff.isBefore(activeFrom)) {
      worked += cutoff.difference(activeFrom);
    }
    if (pauseFrom != null && !cutoff.isBefore(pauseFrom)) {
      paused += cutoff.difference(pauseFrom);
    }
    return AttendanceSnapshot(
      status: projectedStatus,
      worked: worked,
      paused: paused,
    );
  }
}
