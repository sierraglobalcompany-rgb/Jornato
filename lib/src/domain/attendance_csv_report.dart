import 'attendance.dart';
import 'attendance_report.dart';

/// CSV de resúmenes diarios, sólo en memoria y sin identificadores personales.
///
/// No escribe archivos, no sincroniza, no cifra, no autentica y no calcula
/// nómina/recargos. El llamador decide si está autorizado a mostrar o guardar
/// un reporte y debe aplicar protección de datos y almacenamiento cifrado.
///
/// Los tiempos se exportan como enteros en MICROSEGUNDOS: así no se pierden
/// fracciones de segundo ni se inventan redondeos monetarios.
abstract final class AttendanceCsvReport {
  static const String header =
      'fecha,turnos,finalizados,abiertos,trabajo_microsegundos,'
      'pausa_microsegundos\r\n';

  static final RegExp _safeDate = RegExp(r'^[0-9]{4}-[0-9]{2}-[0-9]{2}$');

  static String fromLedger(
    AttendanceLedger ledger, {
    required DateTime at,
    required DateTime Function(DateTime utc) localTime,
  }) {
    final rows = AttendanceReport.days(
      ledger,
      at: at,
      localTime: localTime,
    );
    final buffer = StringBuffer(header);
    for (final day in rows) {
      // Excel/CSV: no incluir texto controlado por el usuario. Los únicos
      // campos son una fecha civil canónica y contadores enteros calculados.
      // Una fecha excepcional (p. ej. año negativo) no se serializa.
      if (!_safeDate.hasMatch(day.date)) {
        throw StateError('Fecha civil fuera de rango para CSV');
      }
      final open = day.hasOpenShift ? 1 : 0;
      buffer.write(
        '${day.date},${day.shifts},${day.finishedShifts},$open,'
        '${day.worked.inMicroseconds},${day.paused.inMicroseconds}\r\n',
      );
    }
    return buffer.toString();
  }
}
