# Preparación local — sin declarar compilación verificada

Requiere Flutter SDK estable y entorno Android configurados. Consultar documentación oficial https://docs.flutter.dev/reference/create-new-app

1. Clonar repo y seleccionar rama del PR.
2. Verificar flutter doctor.
3. Generar los archivos de plataforma Android **sólo después de comprobar status limpio**, usando:

~~~bash
flutter create --platforms=android --org com.sierraglobalcompany --project-name jornato .
flutter pub get
flutter analyze
flutter test
flutter run
~~~

4. Revisar el diff generado y excluir cualquier secreto local; no sobrescribir lib/main.dart ni archivos fuente.
5. Guardar versiones SDK/Gradle y evidencia Android real para dar PASS. Si hay errores, documentarlos, no falsear estado.

La UI es personal y temporal, sin persistencia. No utilizar para asistencia de empleados. La ilustración de marca aportada por el propietario aún no fue incorporada al proyecto: conservarla como referencia canónica para el siguiente lote visual.
