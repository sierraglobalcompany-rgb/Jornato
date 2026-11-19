import 'dart:async';

import 'package:flutter/material.dart';
import 'src/domain/attendance.dart';
import 'src/domain/attendance_report.dart';

void main() => runApp(const JornatoApp());

class JornatoApp extends StatelessWidget {
  const JornatoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Jornato',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF086CFA),
          surface: Colors.white,
        ),
        useMaterial3: true,
      ),
      home: const PersonalDayScreen(),
    );
  }
}

class PersonalDayScreen extends StatefulWidget {
  const PersonalDayScreen({super.key, this.initialLedger});

  // Sólo permite probar cortes horarios sintéticos en el prototipo F0.
  // No sustituye identidad, permisos ni almacenamiento cifrado.
  final AttendanceLedger? initialLedger;

  @override
  State<PersonalDayScreen> createState() => _PersonalDayScreenState();
}

class _PersonalDayScreenState extends State<PersonalDayScreen>
    with WidgetsBindingObserver {
  Timer? _clockRefresh;
  late final AttendanceLedger _ledger;

  @override
  void initState() {
    super.initState();
    _ledger = widget.initialLedger ?? AttendanceLedger(
      workspaceId: 'personal-local-demo',
      subjectId: 'personal-local-demo',
    );
    WidgetsBinding.instance.addObserver(this);
    _syncClockRefresh();
  }

  // No despertar la pantalla cuando no hay horas/pausas que actualizar.
  // Nunca acumular tiempo a partir de ticks: usar el reloj actual al dibujar.
  void _syncClockRefresh() {
    final last = _ledger.events.isEmpty ? null : _ledger.events.last;
    final active = _ledger.status == DayStatus.working ||
        _ledger.status == DayStatus.paused;
    final future = last != null &&
        last.occurredAt.isAfter(DateTime.now().toUtc());
    if (!active && !future) {
      _clockRefresh?.cancel();
      _clockRefresh = null;
      return;
    }
    _clockRefresh ??= Timer.periodic(
      const Duration(seconds: 30),
      (_) {
        if (!mounted) return;
        _syncClockRefresh();
        setState(() {});
      },
    );
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      _syncClockRefresh();
      if (mounted) setState(() {});
    } else {
      // Evitar trabajo periódico con la app suspendida o en segundo plano.
      _clockRefresh?.cancel();
      _clockRefresh = null;
    }
  }

  @override
  void dispose() {
    _clockRefresh?.cancel();
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  String? _message;

  void _mark(MarkType type) {
    final instant = DateTime.now().toUtc();
    try {
      _ledger.record(
        MarkEvent(
          eventId: 'demo-' + instant.microsecondsSinceEpoch.toString() +
              '-' + _ledger.events.length.toString(),
          workspaceId: _ledger.workspaceId,
          subjectId: _ledger.subjectId,
          actorId: 'personal-local-demo',
          type: type,
          occurredAt: instant,
        ),
      );
      _syncClockRefresh();
      setState(() => _message = 'Marcación temporal registrada');
    } on StateError catch (error) {
      setState(() => _message = error.message.toString());
    }
  }

  String _duration(Duration d) =>
      d.inHours.toString() + ' h ' +
      (d.inMinutes.remainder(60)).toString().padLeft(2, '0') + ' min';

  String _status(DayStatus status) => switch (status) {
        DayStatus.idle => 'Sin iniciar',
        DayStatus.working => 'Trabajando',
        DayStatus.paused => 'En pausa',
        DayStatus.finished => 'Jornada terminada',
      };

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now().toUtc();
    final shifts = _ledger.shifts(at: now);
    final days = AttendanceReport.days(
      _ledger,
      at: now,
      localTime: (instant) => instant.toLocal(),
    );
    final state = _ledger.snapshot(at: now);
    // El estado de botones y el tiempo mostrado deben compartir el corte.
    final status = state.status;
    // El registro es cronológico: una marca futura se muestra en el
    // historial, pero impide agregar marcas nuevas antes de ella.
    // No borrar/corregir automáticamente evidencia temporal conflictiva.
    final hasFutureMark = _ledger.events.isNotEmpty &&
        _ledger.events.last.occurredAt.isAfter(now);
    final canStart = !hasFutureMark &&
        (status == DayStatus.idle || status == DayStatus.finished);
    final canPause = !hasFutureMark && status == DayStatus.working;
    final canResume = !hasFutureMark && status == DayStatus.paused;
    final canExit = !hasFutureMark &&
        (status == DayStatus.working || status == DayStatus.paused);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Jornato',
          style: TextStyle(
            fontWeight: FontWeight.w800,
            color: Color(0xFF08254E),
          ),
        ),
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: <Widget>[
            const Text(
              'Mi jornada',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            const Card(
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Text(
                  'PROTOTIPO TÉCNICO: datos sólo en memoria. '
                  'Se pierden al cerrar la app. No usar para asistencia real.',
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text('Estado: ' + _status(status)),
            const SizedBox(height: 12),
            Text('Trabajo acumulado: ' + _duration(state.worked)),
            Text('Pausas acumuladas: ' + _duration(state.paused)),
            if (hasFutureMark)
              const Padding(
                padding: EdgeInsets.only(top: 12),
                child: Text(
                  'Marcación con hora futura detectada. '
                  'No se permiten nuevas marcaciones hasta revisar el reloj '
                  'o el registro. No se borrarán datos automáticamente.',
                  style: TextStyle(color: Colors.red),
                ),
              ),
            const SizedBox(height: 20),
            FilledButton(
              onPressed: canStart ? () => _mark(MarkType.entry) : null,
              child: const Text('Iniciar jornada'),
            ),
            FilledButton.tonal(
              onPressed: canPause ? () => _mark(MarkType.pause) : null,
              child: const Text('Iniciar pausa'),
            ),
            FilledButton.tonal(
              onPressed: canResume ? () => _mark(MarkType.resume) : null,
              child: const Text('Continuar'),
            ),
            OutlinedButton(
              onPressed: canExit ? () => _mark(MarkType.exit) : null,
              child: const Text('Finalizar jornada'),
            ),
            TextButton.icon(
              onPressed: () => setState(() {}),
              icon: const Icon(Icons.refresh),
              label: const Text('Actualizar cálculo'),
            ),
            if (_message != null) Text(_message!),
            const SizedBox(height: 24),
            const Text(
              'Resumen por día',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            for (final day in days)
              ListTile(
                title: Text(day.date),
                subtitle: Text(
                  '${day.shifts} turnos · '
                  '${day.finishedShifts} finalizados · '
                  'Pausas: ' + _duration(day.paused),
                ),
                trailing: Text(_duration(day.worked)),
              ),
            const SizedBox(height: 16),
            const Text(
              'Turnos de esta sesión',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            for (final shift in shifts)
              ListTile(
                title: Text('Inicio: ' + shift.startedAt.toLocal().toString()),
                subtitle: Text(
                  'Trabajo: ' + _duration(shift.worked) +
                  ' · Pausas: ' + _duration(shift.paused) +
                  (shift.finishedAt == null
                      ? ' · En curso'
                      : ' · Terminado'),
                ),
              ),
            const SizedBox(height: 16),
            const Text(
              'Marcaciones de esta sesión',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            for (final mark in _ledger.events)
              ListTile(
                title: Text(switch (mark.type) {
                  MarkType.entry => 'Entrada',
                  MarkType.pause => 'Pausa',
                  MarkType.resume => 'Continuación',
                  MarkType.exit => 'Salida',
                }),
                subtitle: Text(mark.occurredAt.toLocal().toString()),
              ),
          ],
        ),
      ),
    );
  }
}
