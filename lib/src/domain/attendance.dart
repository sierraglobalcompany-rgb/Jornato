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

/// Un turno inicia en entry y termina en exit. Incluso si atraviesa medianoche,
/// la fecha de referencia es startedAt (no se reparte en días calendario).
class AttendanceShift {
  const AttendanceShift({
    required this.startedAt,
    required this.finishedAt,
    required this.status,
    required this.worked,
    required this.paused,
  });

  final DateTime startedAt;
  final DateTime? finishedAt;
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
      MarkType.exit => status == DayStatus.working || status == DayStatus.paused,
    };
    if (!valid) throw StateError('Transición de jornada inválida');

    _events.add(event);
    return event;
  }

  /// Proyección inmutable de cada turno hasta [at], usando intervalos reales.
  /// No suma espacios entre turnos, pausas previstas ni tiempo futuro.
  /// Comparte una única lógica de intervalos con snapshot() para no divergir.
  List<AttendanceShift> shifts({DateTime? at}) {
    final cutoff = (at ?? DateTime.now()).toUtc();
    final result = <AttendanceShift>[];
    DateTime? startedAt;
    DateTime? activeFrom;
    DateTime? pauseFrom;
    var worked = Duration.zero;
    var paused = Duration.zero;

    for (final event in _events) {
      if (event.occurredAt.isAfter(cutoff)) break;
      final time = event.occurredAt;
      switch (event.type) {
        case MarkType.entry:
          startedAt = time;
          activeFrom = time;
          pauseFrom = null;
          worked = Duration.zero;
          paused = Duration.zero;
        case MarkType.pause:
          if (activeFrom != null) worked += time.difference(activeFrom);
          activeFrom = null;
          pauseFrom = time;
        case MarkType.resume:
          if (pauseFrom != null) paused += time.difference(pauseFrom);
          pauseFrom = null;
          activeFrom = time;
        case MarkType.exit:
          if (activeFrom != null) worked += time.difference(activeFrom);
          if (pauseFrom != null) paused += time.difference(pauseFrom);
          result.add(
            AttendanceShift(
              startedAt: startedAt!,
              finishedAt: time,
              status: DayStatus.finished,
              worked: worked,
              paused: paused,
            ),
          );
          startedAt = null;
          activeFrom = null;
          pauseFrom = null;
          worked = Duration.zero;
          paused = Duration.zero;
      }
    }

    if (startedAt != null) {
      if (activeFrom != null) worked += cutoff.difference(activeFrom);
      if (pauseFrom != null) paused += cutoff.difference(pauseFrom);
      result.add(
        AttendanceShift(
          startedAt: startedAt,
          finishedAt: null,
          status: pauseFrom == null ? DayStatus.working : DayStatus.paused,
          worked: worked,
          paused: paused,
        ),
      );
    }

    return List<AttendanceShift>.unmodifiable(result);
  }

  /// Resumen acumulado de los turnos proyectados al instante [at].
  /// El estado corresponde al último turno, no a una suma de estados.
  AttendanceSnapshot snapshot({DateTime? at}) {
    final all = shifts(at: at);
    var worked = Duration.zero;
    var paused = Duration.zero;
    for (final shift in all) {
      worked += shift.worked;
      paused += shift.paused;
    }
    return AttendanceSnapshot(
      status: all.isEmpty ? DayStatus.idle : all.last.status,
      worked: worked,
      paused: paused,
    );
  }
}
