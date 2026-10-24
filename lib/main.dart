import 'package:flutter/material.dart';
import 'src/domain/attendance.dart';

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
  const PersonalDayScreen({super.key});

  @override
  State<PersonalDayScreen> createState() => _PersonalDayScreenState();
}

class _PersonalDayScreenState extends State<PersonalDayScreen> {
  final AttendanceLedger _ledger = AttendanceLedger(
    workspaceId: 'personal-local-demo',
    subjectId: 'personal-local-demo',
  );

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
    final state = _ledger.snapshot();
    final status = _ledger.status;
    final canStart = status == DayStatus.idle || status == DayStatus.finished;
    final canPause = status == DayStatus.working;
    final canResume = status == DayStatus.paused;
    final canExit = status == DayStatus.working || status == DayStatus.paused;

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
            Text('Trabajo real: ' + _duration(state.worked)),
            Text('Pausas reales: ' + _duration(state.paused)),
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
