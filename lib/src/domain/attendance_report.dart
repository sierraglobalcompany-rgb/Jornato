import 'attendance.dart';

/// Un día civil según la zona que seleccione explícitamente el consumidor.
///
/// Los turnos se atribuyen a la fecha LOCAL de su entrada, incluso cuando
/// atraviesan medianoche. No es liquidación salarial ni control de tardanzas.
class AttendanceDayTotal {
  const AttendanceDayTotal({
    required this.date,
    required this.shifts,
    required this.finishedShifts,
    required this.worked,
    required this.paused,
    required this.hasOpenShift,
  });

  /// YYYY-MM-DD civil. No representa un instante ni convierte zonas horarias.
  final String date;
  final int shifts;
  final int finishedShifts;
  final Duration worked;
  final Duration paused;
  final bool hasOpenShift;
}

/// Resumen de jornadas calculado sólo a partir de intervalos ya validados.
///
/// No asume UTC como día local, ni la zona del servidor, ni un offset fijo:
/// el llamador pasa la conversión civil adecuada para cada entrada.
/// No crea, corrige, autentica, guarda ni sincroniza marcaciones.
abstract final class AttendanceReport {
  static List<AttendanceDayTotal> days(
    AttendanceLedger ledger, {
    required DateTime at,
    required DateTime Function(DateTime utc) localTime,
  }) {
    final grouped = <String, _DayAccumulator>{};
    for (final shift in ledger.shifts(at: at)) {
      final civil = localTime(shift.startedAt);
      final date = '${civil.year.toString().padLeft(4, '0')}-'
          '${civil.month.toString().padLeft(2, '0')}-'
          '${civil.day.toString().padLeft(2, '0')}';
      final day = grouped.putIfAbsent(date, () => _DayAccumulator());
      day.shifts++;
      if (shift.finishedAt != null) day.finishedShifts++;
      day.worked += shift.worked;
      day.paused += shift.paused;
      if (shift.finishedAt == null) day.hasOpenShift = true;
    }

    final dates = grouped.keys.toList()..sort();
    return List<AttendanceDayTotal>.unmodifiable(
      dates.map((date) {
        final day = grouped[date]!;
        return AttendanceDayTotal(
          date: date,
          shifts: day.shifts,
          finishedShifts: day.finishedShifts,
          worked: day.worked,
          paused: day.paused,
          hasOpenShift: day.hasOpenShift,
        );
      }),
    );
  }
}

class _DayAccumulator {
  int shifts = 0;
  int finishedShifts = 0;
  Duration worked = Duration.zero;
  Duration paused = Duration.zero;
  bool hasOpenShift = false;
}
