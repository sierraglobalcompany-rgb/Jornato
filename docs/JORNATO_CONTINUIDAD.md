# JORNATO — CONTINUIDAD CANÓNICA / ESTADO VIGENTE

**Corte:** 2026-11-20 UTC / 2026-11-19 Colombia. **MODO:** Recovery V6 REANUDAR+ACTUALIZAR_POR_DELTA. **FUENTE PRINCIPAL:** [Handoff autónomo actualizado](JORNATO_RECOVERY_HANDOFF_ACTUAL.md). **ÚNICA ORDEN CODEX ACTIVA:** [CODEX_LOTE_ACTUAL.md](CODEX_LOTE_ACTUAL.md), `TASK=JOR-H9-C2-PHYSICAL-DART-DIRECT-20261120`. **SIGUE CODEX LUNA**; después del ZIP **CHATGPT DIRECTOR**.

## Último resultado C2 (NO REPETIR)

- ZIP `JOR-H9-C2-PHYSICAL-RUNNER-SAFE-20261119-UNICO.zip` **SHA256 `6EED1CA6A13558303D20435A744F95F16B7ED5A3135E4639F18DA6A845F5F4B5`**, 9 miembros, CRC PASS, **8/8 SHA y tamaño PASS**, inspeccionado en recuperación.
- `RESULT=BLOCKED_RUNNER_POLICY` distinto al anterior `BLOCKED_RUNNER_SIDE_EFFECT`: `flutter drive --use-existing-app` no reinstala, pero SDK Flutter 3.47.8 llama `AndroidDevice.getLogReader` y abre **`adb logcat -v time` global**. Política usuario impide logs ajenos. **Ninguna instalación, inicio, test físico o cambio fuente ocurrió.**
- APK QA `com.sierraglobalcompany.jornato.b14qa`, SHA256 histórico/reportado `BEEA46F75B08CFA440A980BCEE4CC12E2A6B4C7B37A9457B16240C5427157593` (112.605.171 bytes) con target `integration_test/kiosk_flow_test.dart`; existe solo en `D:\codex\Jornato`, no incluido en ZIP. Driver `test_driver/integration_test.dart` SHA256 `2F80A384A6D27EAFF7C355E92644A0AB171504857103A4D53579236E8ECDB05F` sin modificar.
- WIP local reportado rama `codex/jor-b08-h4-domain-20261025`, HEAD `faf5fe283191f8b5a2724b397009512a2caec1b6`, status 234, staged 0; hashes PRE/POST de 9 objetivos y APK consistentes; **WIP_PRESERVED=PARTIAL_EVIDENCE**, disco D: no accesible al Director.
- `FINAL_REPORT.md` del ZIP contiene literales `$branch`, `$head` y `$(...)` sin interpolar; referenciar valores del log `p0_checkout_artifact.txt`/CSV, no repetir el defecto documental.

## Próxima ejecución ya definida, una sola vez

**Ruta diferencial:** evitar POR COMPLETO `flutter drive`, `flutter test` y `flutter run` en el teléfono; reutilizar el **driver Dart existente** que usa `integrationDriver()`→`FlutterDriver.connect()`→`VM_SERVICE_URL`, corroborado en [Flutter API](https://api.flutter.dev/flutter/package-integration_test_integration_test_driver/integrationDriver.html) y [FlutterDriver.connect](https://api.flutter.dev/flutter/flutter_driver/FlutterDriver/connect.html). Obtener URI de VM Service únicamente desde **`adb -s SERIAL shell logcat --pid=PID -d`** del paquete QA: filtro **en el dispositivo**; un solo forward del serial correcto y una sola instalación QA `adb install -t` **SIN `-r`** solo si no existe ningún ID exacto. Ejecutar `dart run test_driver/integration_test.dart` como host con `VM_SERVICE_URL` temporal, sin Flutter Tool. **Verificar SDK/seguridad local antes; esto es propuesta ejecutable, NO PASS ya observado.**

## Resultado y puertas

- H9-M1 75 host PASS y boot Laravel PASS históricos, F1 widget PASS_FOCAL; backend B21F-S3 158/2450 PASS_SCOPED históricos. C2 Cipher/Keystore/idempotencia/corrupción **NOT_RUN físico**; reinicio proceso `BLOCKED_HARNESS`; tenant/Pro `BLOCKED_CONTRACT`.
- No repetir auditorías 10 VERDUGO+10 JUEZ: V2 ya auditada y documentación preservada; nuevo riesgo de logcat resuelto conceptualmente con conexión Dart directa, no hace falta volver a inspeccionar suites viejas. Respetar L1–L6 y no abrir B22.
- PR2 **solo documental**; `main=1ee6aae821f8cf177cc64149081ad8847f7fec2e`, PR1 `faf5fe283191f8b5a2724b397009512a2caec1b6` DRAFT, PR3 F0 `104469b119752f395cf9881e732d582feab9db4e` DRAFT, inalterados al preflight. No confundir con WIP local.
- OD01–OD08 siguen sin aprobación verificada; permisos Pro, producción y release sin autorizar. **H9_GLOBAL=NO_GO; B22=NOT_AUTHORIZED; RELEASE=NO_GO.**

**NEXT_OWNER=CODEX_LUNA; AFTER_SINGLE_ZIP=CHATGPT_DIRECTOR.**
