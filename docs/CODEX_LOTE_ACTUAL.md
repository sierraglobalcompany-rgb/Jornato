# CODEX LUNA — JORNATO C2 · CIERRE ANDROID FÍSICO V3 · DRIVER DART DIRECTO, SIN LOGCAT GLOBAL

**ORDEN ÚNICA ACTIVA — 20-11-2026 UTC / 19-11-2026 en Colombia.** Sustituye la V2 del PR documental #2 y las órdenes C2 previas; mismo gate C2, **no** otra fase de producto ni auditoría. Ejecuta el trabajo, no generes otro prompt. ChatGPT Director inspeccionó el ZIP nuevo `JOR-H9-C2-PHYSICAL-RUNNER-SAFE-20261119-UNICO.zip` (SHA256 `6EED1CA6A13558303D20435A744F95F16B7ED5A3135E4639F18DA6A845F5F4B5`, CRC PASS, manifiesto 8/8). Resultado: `BLOCKED_RUNNER_POLICY`: el SDK Flutter 3.47.8, incluso con `flutter drive --use-existing-app`, inicializa un lector `adb logcat -v time` **global** que puede transmitir tags de otros procesos. No se instaló ni inició el APK. **PROHIBIDO repetir `flutter drive`, `flutter test` o cambiar el Flutter SDK** para evadirlo.

## Orden y límites invariantes

```text
TASK=JOR-H9-C2-PHYSICAL-DART-DIRECT-20261120
WIP=D:\codex\Jornato
OUTPUT=D:\codex\_REPORTES\Jornato\JOR-H9-C2-PHYSICAL-DART-DIRECT-20261120
OWNER_NOW=CODEX_LUNA
OWNER_AFTER_SINGLE_ZIP=CHATGPT_DIRECTOR
TARGET_PHONE=EXACTLY_ONE_CONNECTED_AUTHORIZED_PHYSICAL_ANDROID
QA_PACKAGE=com.sierraglobalcompany.jornato.b14qa
QA_APK=build/app/outputs/flutter-apk/app-b14qa-debug.apk
EXPECTED_SHA256=BEEA46F75B08CFA440A980BCEE4CC12E2A6B4C7B37A9457B16240C5427157593
APP_TEST_ENTRYPOINT=integration_test/kiosk_flow_test.dart
HOST_DRIVER=test_driver/integration_test.dart
FLUTTER_RUNNER=FORBIDDEN
LOGCAT_GLOBAL=FORBIDDEN
LOGCAT_HOST_POST_FILTER=FORBIDDEN
ADB_LOGCAT_ON_DEVICE_PID_ONLY=PERMITTED
GIT_ADD_COMMIT_PUSH_PULL_MERGE_RESET_STASH_CLEAN=FORBIDDEN
RELEASE=NO_GO
```

**Autorización vigente:** propietario autorizó «usa el celular que esta conectado y disponible» solo para QA sintética Jornato. No permite borrar, reemplazar, desinstalar apps, `pm clear`, acceso a logs de otros procesos/usuarios, root, reiniciar celular, usar AVD/otros teléfonos, alterar permisos globales, instalar herramientas, tocar datos reales ni redes Pro.

## P0 — Comprobación focal (sin repetir preparaciones)

1. **Custodia WIP:** constatar rama/HEAD/status e índice sin cambiarlos. Histórico, no forzar igualdad: `codex/jor-b08-h4-domain-20261025` / `faf5fe283191f8b5a2724b397009512a2caec1b6`, 234 entradas, 0 staged; marker Kotlin `.salive` ausente. Tomar SHA PRE de archivos objetivo y de APK, especialmente si están como `??`. Detener solo ante colisión simultánea real. **No descargar nada ni correr tests host/Android ya aprobados.**
2. **Conservar APK listo:** cotejar SHA256 del binario existente con `BEEA...7593`, tamaño previo 112.605.171 bytes, app ID QA, actividad `com.sierraglobalcompany.jornato.MainActivity`, firma debug, target de integración demostrado por el build Gradle histórico `-Ptarget=integration_test/kiosk_flow_test.dart`; fuente previa SHA256 `30267B4110336B479437CFFE3C31392EF67CD32DEDC684F2179EC47808BB3E30`. Si falta o no coincide sin causa documentable, `BLOCKED_ARTIFACT`; **no recompilar a ciegas**.
3. **Un solo teléfono:** identificar un único serial físico en estado `device`, Android API/ABI compatibles. Todos los ADB deben usar `adb -s SERIAL ...`. Comprobar paquetes **exactos** `com.sierraglobalcompany.jornato.b14qa` y `.test` por perfil observable, justo antes de instalar; si algún ID existe o no puede comprobarse su ausencia, `BLOCKED_PACKAGE`, sin borrar ni reemplazar. Nunca inspeccionar otras apps ni exportar serial/IMEI al ZIP.
4. **Verificar la ruta alternativa EN EL SDK INSTALADO, solo lectura:** confirmar que el driver host preexistente importa `package:integration_test/integration_test_driver.dart` y llama a `integrationDriver()`, que esta función usa `FlutterDriver.connect()` y `requestData(null)` y que el driver lee `VM_SERVICE_URL` del entorno del proceso host. Revisar solo el código Dart local de esa dependencia. **Ejecutar el driver con el Dart SDK del Flutter instalado (`dart run test_driver/integration_test.dart` o invocación equivalente de `dart` que use `.dart_tool/package_config.json`) SIN invocar `flutter drive` ni `flutter test` ni leer logcat global.** Si el driver llama internamente al Flutter tool, a `adb logcat` sin `--pid` o requiere descarga, bloquear y documentar `BLOCKED_DIRECT_DRIVER_POLICY` antes de instalar.
5. **Comprobar logcat estrictamente por PID antes de instalar:** consultar `adb -s SERIAL shell logcat --help` o herramienta local equivalente **sin abrir buffer de logs**, confirmar soporte de `--pid=<PID>` en el dispositivo. El argumento debe filtrarse en el **dispositivo**, no lanzar `adb logcat -v time` y filtrar texto en PowerShell. No `logcat -c`, no dumps globales, no leer tags por whitelist. Confirmar un procedimiento sencillo para detectar la URI de Dart VM Service **solo desde líneas emitidas por el PID del paquete QA**; si no existe canal seguro, `BLOCKED_VM_SERVICE_POLICY`.

**Base técnica contrastada externamente por ChatGPT:** `integrationDriver()` usa `FlutterDriver.connect()` y `driver.requestData(null)`; el método `FlutterDriver.connect` recibe `dartVmServiceUrl` o `VM_SERVICE_URL`; documentación oficial: https://api.flutter.dev/flutter/package-integration_test_integration_test_driver/integrationDriver.html y https://api.flutter.dev/flutter/flutter_driver/FlutterDriver/connect.html . El runner Flutter Tool es el que contiene el lector global, no el driver Dart estándar. **Esto es una ruta viable propuesta, NO una ejecución nativa certificada.** El SDK local y la conexión real son las fuentes decisivas.

## P1 — Una instalación, una ejecución nativa, sin cambios de producto

6. Solo si P0 pasó: revalidar paquete ausente + APK/hash/serial justo antes de ejecutar UNA vez `adb -s SERIAL install -t RUTA_APK`, **sin `-r`, `-d`, `-g`, `--instant`, uninstall ni flags de fallback**. Si falla, registrar `BLOCKED_INSTALL`; no reintentar. Si pasa, comprobar paquete QA exacto y lanzar UNA vez únicamente `adb -s SERIAL shell am start -n com.sierraglobalcompany.jornato.b14qa/com.sierraglobalcompany.jornato.MainActivity` (reconfirmar Activity del manifest, no confiar ciegamente en la ruta de ejemplo). **Dejar el APK instalado** para preservar la evidencia; no limpiar ni desinstalar.
7. Con app QA iniciada, obtener `PID` exclusivamente de `pidof` para ese paquete y corroborar proceso/actividad. Ejecutar solo lectura **`adb -s SERIAL shell logcat --pid=<PID> -d -v time`** o variante PID-only soportada, capturando **solo logs del proceso QA**. Verificar que el PID no cambió; no guardar en ZIP la URI completa de VM Service ni su token. Obtener la URI real del VM Service desde ese flujo, jamás inventarla. Si solo aparecen mensajes del sistema de otro PID, **NO** leer logcat global para hallar la URL: `BLOCKED_VM_SERVICE`.
8. Si existe URI de servicio y requiere `adb forward`: verificar `adb -s SERIAL forward --list` y elegir un puerto local libre; crear solo el forward de ese paquete/dispositivo, registrar el identificador para retirar **solo el forward que creaste** al terminar. Construir URI de host `http://127.0.0.1:PUERTO_HOST/SEGMENTO_PRIVADO/` sin imprimir el segmento en logs ni guardarlo en archivo de entrega; probar conectividad solo a ese VM Service. Si no se puede, `BLOCKED_VM_SERVICE` y parar conexión, sin desinstalar.
9. Iniciar **una sola vez** el driver host Dart ya existente **como proceso local** con `VM_SERVICE_URL` en su entorno **solo para ese proceso**, sin invocar Flutter CLI (`flutter drive`/`flutter test`/`flutter run`). Ejemplo CONCEPTUAL PowerShell, sustituir variables por valores verificados y no imprimir URI:

   ```powershell
   # Establecer $env:VM_SERVICE_URL para este proceso host, NO como variable global permanente.
   # Desde D:\codex\Jornato, usando el SDK Dart instalado y dependencias cacheadas:
   dart run test_driver/integration_test.dart
   # Restaurar inmediatamente el valor previo de la variable del proceso, si lo había.
   ```

   Exigir un límite de tiempo con supervisor externo estándar de PowerShell si el driver no lo incorpora, sin alterar SDK ni test. El `exit=0` **solo** acredita los tests si el driver confirma respuestas `integrationDriver()`/`requestData` correspondientes al paquete, PID, source test y APK exactos; no inferir PASS de conexión, arranque o `cipher_version`. Si error, `BLOCKED_DIRECT_DRIVER_CONNECT` o `FAIL_TEST` por causa observada, SIN reinstalar/reintentar otras rutas.
10. Clasificar separadamente resultados: `CIPHER_ENGINE` (SQLCipher y archivo no plano, clave incorrecta/no-key rechazada, readback legítimo), `KEYSTORE_EFFECTIVE` (camino real Android del proveedor seguro y recuperación, **no inferir hardware-backed/attestation de plugin**), `IDEMPOTENCY_NATIVE` (mismo ID una vez, payload conflictivo rechazado), `CORRUPTION_FAIL_CLOSED` (rechazo observable de copia sintética, original intacto). Si algún oráculo no se ejecutó u observó, `INCONCLUSIVE`/`NOT_RUN`; no modificar expectativa para que pase.

## P2 — Reinicio verdadero y estado contractual

11. `RESTART_READBACK` requiere cerrar un proceso y que **otro proceso nuevo** lea el mismo marcador cifrado/ID sin reinstalación ni `pm clear`. El ZIP anterior documenta **NO HARNESS DOS FASES**. No crear API/canal nuevo ni reescribir suite antes de obtener los 4 subgates. Si el APK existente incluye protocolo dos fases demostrable, realizarlo solo tras terminar driver y preservar datos sintéticos: stop **únicamente paquete QA**, nuevo proceso/URI/PID, readback de mismo evento. Si no existe, `BLOCKED_HARNESS`. No confundir `LocalEncryptedStore.close/open` con restart.
12. `TENANT_ISOLATION=BLOCKED_CONTRACT` y `PRO_HTTP_DB=BLOCKED_CONTRACT` sin identidades/roles QA aprobadas; no crear cuentas ni redes externas. B21F-S3 suite 158/2450 PASS_SCOPED, H9-M1 75 host PASS, F1 widget PASS_FOCAL, bootstrap Laravel PASS reportados y **reutilizados**; no reejecutar por inercia. H9_GLOBAL=NO_GO y RELEASE=NO_GO.
13. Si el test descubre un fallo concreto en el código, preservar PRE, corregir **solo propietario** en el WIP, `flutter analyze --no-pub` y prueba host focal afectada; **no** reinstalar ni actualizar APK QA para retest en esta autorización. Declarar `FIX_WRITTEN_NOT_RERUN_PHYSICAL`. Sin stage/commit/push/merge. Si WIP no cambió: `CHANGED_FILES=NONE`.

## P3 — ÚNICO ZIP: cierre atribuible y privacidad

14. Generar **un solo archivo nuevo** (no sobrescribir ZIP previo): `D:\codex\_REPORTES\Jornato\JOR-H9-C2-PHYSICAL-DART-DIRECT-20261120\delivery\JOR-H9-C2-PHYSICAL-DART-DIRECT-20261120-UNICO.zip` con `FINAL_REPORT.md` (resultados reales), `RESULTS.csv` (por gate, estado, fuente/APK SHA, comando y exit, ruta/hash de log), `WIP_PRE_POST.csv` (incluye untracked y APK), logs **únicamente QA PID y host Dart sanitizados**, `BLOCKERS.md` si aplica, `CHANGES.patch` si hay edición real, `MANIFEST_SHA256.csv` (miembros sin manifiesto, bytes+hash). Verificar CRC/8+ SHA y SHA256 final fuera del ZIP. **No incluir APK, secretos, VM URI, serial, fotos, DB ni logs de otros PID**. Nota: el reporte anterior contenía interpolaciones literales de shell en `FINAL_REPORT.md` (`$branch`, `$head`, `$...`); evitarlo: reportar rama/HEAD como valores verificados y usar logs CSV como respaldo, no copiar status completo al informe.
15. **Terminal precisa, sin PASS ficticio**:

```text
TASK=JOR-H9-C2-PHYSICAL-DART-DIRECT-20261120
RESULT=PASS_NATIVE_SUBSET|PARTIAL|BLOCKED_ARTIFACT|BLOCKED_PACKAGE|BLOCKED_DEVICE|BLOCKED_VM_SERVICE_POLICY|BLOCKED_VM_SERVICE|BLOCKED_DIRECT_DRIVER_POLICY|BLOCKED_DIRECT_DRIVER_CONNECT|FAIL_TEST
SOURCE_BRANCH=<real>
SOURCE_HEAD=<real>
WIP_PRESERVED=YES|PARTIAL_EVIDENCE|NO
CHANGED_FILES=<ruta(s) o NONE>
APK_SHA256=<real o NOT_AVAILABLE>
PACKAGE_ISOLATION=PASS|BLOCKED
MANUAL_INSTALL=PASS_NEW_PACKAGE|NOT_RUN|FAIL
DART_DIRECT_DRIVER=PASS|FAIL|NOT_RUN
PID_ONLY_LOGCAT=PASS|NOT_RUN|BLOCKED
CIPHER_ENGINE=PASS_PHYSICAL|FAIL_PHYSICAL|INCONCLUSIVE|NOT_RUN
KEYSTORE_EFFECTIVE=PASS_NATIVE_SCOPED|PLUGIN_PATH_PASS_ONLY|FAIL_PHYSICAL|INCONCLUSIVE|NOT_RUN
IDEMPOTENCY_NATIVE=PASS_PHYSICAL|FAIL_PHYSICAL|INCONCLUSIVE|NOT_RUN
CORRUPTION_FAIL_CLOSED=PASS_COPY_SCOPED|FAIL_PHYSICAL|INCONCLUSIVE|NOT_RUN
RESTART_READBACK=PASS_NEW_PROCESS|BLOCKED_HARNESS|FAIL|NOT_RUN
TENANT_ISOLATION=BLOCKED_CONTRACT
PRO_HTTP_DB=BLOCKED_CONTRACT
H9_M1_HOST_75=REUSED_PASS_NOT_RERUN
F1_WIDGET=REUSED_PASS_FOCAL_NOT_RERUN
H9_GLOBAL=NO_GO
B22=NOT_AUTHORIZED
RELEASE=NO_GO
ZIP_PATH=<único ZIP real>
ZIP_SHA256=<SHA comprobado>
NEXT_OWNER=CHATGPT_DIRECTOR
```

**Antiping-pong:** si P0 falla por evidencia material nueva, documentar ese bloqueo concreto y hacer solo los análisis no invasivos restantes; NO volver a auditar el prompt ni probar otras variantes en bucle. Si P0 pasa, avanzar directamente a la única instalación y la prueba nativa. No publicar WIP a GitHub hasta reconciliarlo, sin confundir PR #3 F0 con el trabajo avanzado de Windows.

# 🚨 SIGUE CODEX LUNA — DRIVER DART DIRECTO + LOGCAT FILTRADO EN DISPOSITIVO. DESPUÉS DEL ZIP: CHATGPT DIRECTOR. 🚨
