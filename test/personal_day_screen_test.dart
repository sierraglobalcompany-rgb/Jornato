import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:jornato/main.dart';
import 'package:jornato/src/domain/attendance.dart';

/// F0 tiene memoria volátil: estas pruebas no certifican Android real,
/// persistencia, identidad laboral ni sincronización con el backend.
void main() {
  Future<void> openDemo(WidgetTester tester) async {
    // Mantener botones y lista visibles sin depender del tamaño de pantalla
    // predeterminado del ejecutor de pruebas.
    tester.view.physicalSize = const Size(1200, 2000);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);
    await tester.pumpWidget(const JornatoApp());
    await tester.pumpAndSettle();
  }

  Future<void> mark(WidgetTester tester, String label) async {
    final button = find.text(label);
    await tester.ensureVisible(button);
    await tester.tap(button);
    await tester.pumpAndSettle();
  }

  testWidgets('F0 anuncia memoria volátil y empieza sin jornada', (tester) async {
    await openDemo(tester);

    expect(find.text('Estado: Sin iniciar'), findsOneWidget);
    expect(find.textContaining('Se pierden al cerrar la app'), findsOneWidget);
    expect(
      tester.widget<FilledButton>(
        find.widgetWithText(FilledButton, 'Iniciar jornada'),
      ).onPressed,
      isNotNull,
    );
    expect(
      tester.widget<FilledButton>(
        find.widgetWithText(FilledButton, 'Iniciar pausa'),
      ).onPressed,
      isNull,
    );
    expect(
      tester.widget<OutlinedButton>(
        find.widgetWithText(OutlinedButton, 'Finalizar jornada'),
      ).onPressed,
      isNull,
    );
  });

  testWidgets('iniciar muestra estado coherente y habilita pausa/salida',
      (tester) async {
    await openDemo(tester);
    await mark(tester, 'Iniciar jornada');

    expect(find.text('Estado: Trabajando'), findsOneWidget);
    expect(find.text('Marcación temporal registrada'), findsOneWidget);
    expect(find.text('Entrada'), findsOneWidget);
    expect(
      tester.widget<FilledButton>(
        find.widgetWithText(FilledButton, 'Iniciar pausa'),
      ).onPressed,
      isNotNull,
    );
    expect(
      tester.widget<FilledButton>(
        find.widgetWithText(FilledButton, 'Continuar'),
      ).onPressed,
      isNull,
    );
  });

  testWidgets('entrada pausa continuación salida siguen transiciones válidas',
      (tester) async {
    await openDemo(tester);
    await mark(tester, 'Iniciar jornada');
    await mark(tester, 'Iniciar pausa');
    expect(find.text('Estado: En pausa'), findsOneWidget);
    expect(
      tester.widget<FilledButton>(
        find.widgetWithText(FilledButton, 'Continuar'),
      ).onPressed,
      isNotNull,
    );

    await mark(tester, 'Continuar');
    expect(find.text('Estado: Trabajando'), findsOneWidget);

    await mark(tester, 'Finalizar jornada');
    expect(find.text('Estado: Jornada terminada'), findsOneWidget);
    expect(find.text('Entrada'), findsOneWidget);
    expect(find.text('Pausa'), findsOneWidget);
    expect(find.text('Continuación'), findsOneWidget);
    expect(find.text('Salida'), findsOneWidget);
  });

  testWidgets('puede finalizar desde pausa sin continuación obligatoria',
      (tester) async {
    await openDemo(tester);
    await mark(tester, 'Iniciar jornada');
    await mark(tester, 'Iniciar pausa');
    await mark(tester, 'Finalizar jornada');

    expect(find.text('Estado: Jornada terminada'), findsOneWidget);
    expect(find.text('Continuación'), findsNothing);
    expect(
      tester.widget<FilledButton>(
        find.widgetWithText(FilledButton, 'Iniciar jornada'),
      ).onPressed,
      isNotNull,
    );
  });

  testWidgets('dos turnos completados aparecen sin sumar un turno ficticio',
      (tester) async {
    await openDemo(tester);
    await mark(tester, 'Iniciar jornada');
    await mark(tester, 'Finalizar jornada');
    await mark(tester, 'Iniciar jornada');
    await mark(tester, 'Finalizar jornada');

    expect(find.text('Estado: Jornada terminada'), findsOneWidget);
    expect(find.text('Entrada'), findsNWidgets(2));
    expect(find.text('Salida'), findsNWidgets(2));
    expect(find.textContaining(' · Terminado'), findsNWidgets(2));
  });

  testWidgets('actualizar cálculo no inventa otra marcación', (tester) async {
    await openDemo(tester);
    await mark(tester, 'Iniciar jornada');
    await mark(tester, 'Actualizar cálculo');

    expect(find.text('Estado: Trabajando'), findsOneWidget);
    expect(find.text('Entrada'), findsOneWidget);
    expect(find.text('Pausa'), findsNothing);
    expect(find.text('Salida'), findsNothing);
  });

  testWidgets('un evento futuro no adelanta estado ni horas de pantalla',
      (tester) async {
    final demo = AttendanceLedger(
      workspaceId: 'personal-local-demo',
      subjectId: 'personal-local-demo',
    );
    demo.record(
      MarkEvent(
        eventId: 'clock-future',
        workspaceId: demo.workspaceId,
        subjectId: demo.subjectId,
        actorId: 'personal-local-demo',
        type: MarkType.entry,
        occurredAt: DateTime.now().toUtc().add(const Duration(hours: 1)),
      ),
    );

    tester.view.physicalSize = const Size(1200, 2000);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);
    await tester.pumpWidget(
      MaterialApp(home: PersonalDayScreen(initialLedger: demo)),
    );
    await tester.pumpAndSettle();

    // La pantalla consulta el mismo corte de snapshot para estado y botones.
    // Antes del fix leía ledger.status = working por el último evento futuro.
    expect(demo.status, DayStatus.working);
    expect(find.text('Estado: Sin iniciar'), findsOneWidget);
    expect(find.text('Trabajo acumulado: 0 h 00 min'), findsOneWidget);
    expect(
      tester.widget<FilledButton>(
        find.widgetWithText(FilledButton, 'Iniciar jornada'),
      ).onPressed,
      isNotNull,
    );
  });

  testWidgets('conserva el esquema blanco de Material 3', (tester) async {
    await openDemo(tester);
    final context = tester.element(find.byType(Scaffold));
    final theme = Theme.of(context);

    expect(theme.useMaterial3, isTrue);
    expect(theme.colorScheme.surface, Colors.white);
  });
}
