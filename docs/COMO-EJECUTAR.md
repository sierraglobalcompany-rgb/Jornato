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


## QA gratuita, manual y protegida del PR #3 (sin Codex ni Actions)

El código avanzado local de `D:\\codex\\Jornato` **NO** está en PR #3.
No ejecutar estos pasos sobre esa carpeta con WIP.

1. Preparar un **clon NUEVO separado**, nunca reutilizar el worktree de
   producción ni el WIP local. En PowerShell, con Git y Flutter SDK instalados:

   ```powershell
   git clone --branch feat/jornato-f0-archive-shifts-no-ci-20261117 https://github.com/sierraglobalcompany-rgb/Jornato.git D:\\codex\\Jornato-F0-QA-CLON
   Set-Location D:\\codex\\Jornato-F0-QA-CLON
   powershell.exe -NoProfile -File .\\scripts\\qa_local_f0.ps1
   ```

2. El script **rechaza cambios de Git preexistentes y otras ramas**, se
   detiene con código distinto de cero al detectar fallos, y escribe
   los reportes bajo la carpeta temporal de Windows (fuera del repo).
   Ejecuta `dart tool/smoke_attendance.dart`, `flutter pub get --offline`,
   `flutter analyze --no-pub` y `flutter test --no-pub`.
   El primer uso puede requerir preparar manualmente la caché Flutter;
   el script nunca descarga dependencias por sí solo.
3. El botón opcional `-ApkDebug` **NO genera plataforma Android**. Se
   bloquea expresamente si no existe `android/`. El PR #3, igual que
   su base F0, todavía no contiene andamiaje Android; no presentarlo como
   APK generable/verificado ni ejecutar `flutter create` en el WIP.
4. Revisar el log y reportar el SHA probado, resultados individuales y
   cualquier fallo, SIN inventar PASS y SIN subir logs confidenciales.
   Ejecutar Flutter localmente no certifica SQLCipher, teléfono real,
   biometría, servidor, datos de empresa, H9 integral ni release.

**Estado al publicar este documento:** 72 tests `flutter_test` escritos y
20 verificaciones smoke Dart escritas; **todos NOT_RUN** en el entorno que
publicó los cambios. No hay Actions, Codex ni pruebas Android nuevas.
