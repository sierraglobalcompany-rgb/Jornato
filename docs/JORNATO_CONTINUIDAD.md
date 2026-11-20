# JORNATO — CONTINUIDAD CANÓNICA / ESTADO ACTUAL

**FECHA:** 20-11-2026 (Colombia). **PROYECTO:** Jornato, WIP avanzado local `D:\\codex\\Jornato` (no está publicado en GitHub). **ORDEN ACTIVA ÚNICA:** [`docs/CODEX_LOTE_ACTUAL.md`](CODEX_LOTE_ACTUAL.md) — **TASK=`JOR-H9-C2-PHYSICAL-RUNNER-SAFE-20261119`**; reemplaza orden previa con el mismo TASK, sin reabrir H9-M1/F1. **QUIÉN SIGUE AHORA: CODEX LUNA.** Después de su ZIP único: CHATGPT DIRECTOR. **H9_GLOBAL=NO_GO; B22=NOT_AUTHORIZED; RELEASE=NO_GO.**

## 1. Decisión directiva que evita un tercer intento fallido

El bloqueo real fue **`BLOCKED_RUNNER_SIDE_EFFECT`**, no problema de compilación Android. El ZIP previo `JOR-H9-C2-PHYSICAL-ANDROID-QA-20261119-UNICO.zip`, SHA256 `6E58737061FA00D9CF60F630758D3C4E66CCF0F161027E83A641417C173BC278`, contiene 9 miembros, CRC PASS y manifiesto 8/8 verificado. El log Gradle **ya acredita** que el APK `app-b14qa-debug.apk` fue compilado offline desde el **target de integración `integration_test/kiosk_flow_test.dart`**, con `-Ptarget=integration_test/kiosk_flow_test.dart`, no desde `lib/main.dart`. `BUILD SUCCESSFUL`; APK **BUILT_NOT_INSTALLED**, SHA256 **`BEEA46F75B08CFA440A980BCEE4CC12E2A6B4C7B37A9457B16240C5427157593`**, applicationId **`com.sierraglobalcompany.jornato.b14qa`**, minSdk24, debug. Bytes APK no adjuntos al ZIP: Codex valida huella del archivo local antes de instalar. **NO RECOMPILAR** sin necesidad, ni asumir que `flutter drive --target` cambia el APK compilado.

El runner `flutter test integration_test/...` del SDK Flutter 3.47.8 usa instalación `adb install -t -r`, puede fallback uninstall y teardown; **prohibido en teléfono**. Ruta acordada: confirmar paquete QA ausente para un único teléfono autorizado, **una sola** instalación `adb -s SERIAL install -t APK` sin `-r`, lanzar solo el Activity QA y conectar `flutter drive --use-existing-app=URI --keep-app-running` **tras verificar su rama de SDK local y URI real**; no ejecutar `flutter run`/runner invasivo. El documento vigente ordena tests y ZIP únicos; si SDK/driver no permite resultados atribuibles, dejar bloqueo técnico concreto, NO_PASS.

## 2. Autorización y protección física

El propietario autorizó «usa el celular que esta conectado y disponible». Permiso **solo QA de Jornato** con paquete nuevo independiente `com.sierraglobalcompany.jornato.b14qa`, sintéticos y serial ADB explícito. **No** usar otros teléfonos u ocho AVD ajenos; no reemplazar paquete existente, desinstalar, `pm clear`, root, reset, borrar archivos, tocar apps privadas, modificar configuración global, publicar ni desplegar. Si el paquete está instalado o hay múltiples perfiles/dispositivos no identificables, **BLOCKED_PACKAGE/BLOCKED_DEVICE**. El propietario **NO debe ejecutar pruebas ni instalar herramientas**; Codex actúa localmente.

## 3. QA histórico reutilizado, sin repetir

- H9-M1 75 tests host PASS y `flutter analyze` PASS, bootstrap Laravel normal `portal.error` PASS en sus corridas.
- B21F-S3 backend 158 tests/2.450 assertions PASS_SCOPED en runner aislado histórico; NO extrapolar a producción.
- H9-M1/F1 test visual del folio `PASS_FOCAL`, solo `test/widget_test.dart` cambió.
- C2 readiness: `integration_test/kiosk_flow_test.dart` con tests de motor cifrado, FlutterSecureStorage/Keystore, idempotencia y corrupción en copia sintética: `WRITTEN_NOT_RUN` en físico; Dart analyze PASS previo. No reconstruir instrumentación sin fallo observado.
- C2 físico previo: build QA offline PASS, app no instalada; `CIPHER_ENGINE`, `KEYSTORE_EFFECTIVE`, `IDEMPOTENCY_NATIVE`, `CORRUPTION_FAIL_CLOSED` **NOT_RUN**; `RESTART_READBACK=BLOCKED_HARNESS` (solo close/open mismo proceso); `TENANT_ISOLATION`, `PRO_HTTP_DB` **BLOCKED_CONTRACT**. WIP status PRE235→POST234 por `android/.kotlin/sessions/*.salive` transitorio desaparecido sin atribución; sin cambio de fuentes, índice y staged iguales; `WIP_PRESERVED=PARTIAL_EVIDENCE`, **no** certificar preservación global de 235 archivos.

## 4. Gate de aceptación y siguiente acción

El macrobloque ejecutable debe obtener **resultados de aserciones nativas** del APK con target correcto y SHA exacto. `--use-existing-app` no carga Dart nuevo: el target de test ya debe estar compilado (el ZIP reporta que lo está). Separar SQLCipher y Keystore; `cipher_version`, install exitoso, VM Service o test escrito NO son PASS. `RESTART_READBACK` requiere 2 procesos Android y mismos IDs sin reinstalar; si no existe harness seguro, `BLOCKED_HARNESS`, sin reescribir test antes de ejecutar los 4 gates. Pro HTTP/DB y tenant B siguen bloqueados. Una corrección de fuente posterior a instalación NO se considera ejecutada físicamente sin otro despliegue seguro.

**Salida Codex:** `D:\\codex\\_REPORTES\\Jornato\\JOR-H9-C2-PHYSICAL-RUNNER-SAFE-20261119\\delivery\\JOR-H9-C2-PHYSICAL-RUNNER-SAFE-20261119-UNICO.zip`, reportes/logs sintéticos sanitizados, SHA/tamaño/manifiesto y un solo ZIP. Sin stage/commit/push/pull/merge/deploy/GitHub Actions. ChatGPT director evaluará evidencia del ZIP para decidir H9.

## 5. Documentación persistente y cadena de decisiones

- [Auditoría puntual nueva de la orden runner V2 (10 VERDUGO + 10 JUEZ)](JORNATO_C2_RUNNER_SAFE_V2_AUDITORIA_VERDUGO10_JUEZ10_20261120.md): revisión interna adversarial, **no** test de producto ni agente externo independiente.
- Auditoría previa de la orden física C2 (ya cerrada): [V2](JORNATO_C2_FISICO_V2_AUDITORIA_10_VERDUGO_10_JUEZ_20261119.md). Auditoría C2 readiness [10+10](JORNATO_H9_C2_AUDITORIA_10_VERDUGO_10_JUEZ_20261119.md). Auditoría F1 [10+10](JORNATO_H9M1_F1_AUDITORIA_10_VERDUGO_10_JUEZ_20261119.md). Auditoría H9-M1 [10+10](JORNATO_H9M1_AUDITORIA_10_VERDUGO_10_JUEZ_20261119.md). **No repetir ninguna.**
- Fuente de seis leyes L1–L6: `sierraglobalcompany-rgb/PingPongLaw@84e961cadf482d234f4c0ee2ca60e8c7e9b388e8`, `docs/engineering/LEYES_IMPLEMENTACION_1_A_6.md`. L1 KISS/Ponytail, L2 antirruido, L3 causa raíz, L4 UX fiel, L5 evidencia independiente cuando sea posible, L6 antipingpong. No declarar PASS sin QA real, ni inventar permisos OD01–OD08.
- **Registro histórico completo previo** permanece recuperable en el objeto Git `docs/JORNATO_CONTINUIDAD.md` de commit `af91605cd98b9a6dcc9d65b37c50659ac7bb0c08` (139 KB). Se sustituyó por checkpoint **compacto y actual** para evitar contexto contaminado por órdenes vencidas. El historial Git conserva ese contenido sin archivos archivados extra.
- GitHub de partida (antes de publicar esta actualización): `main=1ee6aae821f8cf177cc64149081ad8847f7fec2e`, PR #1 Draft `faf5fe283191f8b5a2724b397009512a2caec1b6`, PR #3 Draft `104469b119752f395cf9881e732d582feab9db4e` (F0 apilado sobre #1), PR #2 documental. El WIP Android avanzado sigue SOLO en Windows; no mezclar F0 al árbol sucio.
