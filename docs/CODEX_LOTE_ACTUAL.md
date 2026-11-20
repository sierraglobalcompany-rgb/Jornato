# CODEX LUNA — JORNATO C2 · EJECUCIÓN ANDROID FÍSICO CON APK YA COMPILADO · ORDEN ÚNICA V2

**ORDEN EJECUTABLE VIGENTE — 20-11-2026, Colombia.** Sustituye INTEGRAMENTE `CODEX_JORNATO_C2_DESBLOQUEO_RUNNER_INSTALACION_UNICA_20261119.md`; no ejecutar ambas. ChatGPT Director corrigió el procedimiento al leer el ZIP del último intento: **el APK QA ya se compiló desde `integration_test/kiosk_flow_test.dart`**. NO es un APK normal cuya entrada sea `lib/main.dart`; NO volver a compilar por confundir el target. La tarea ahora es hacer que **las aserciones nativas existentes se ejecuten una vez en el teléfono previamente autorizado**, con huellas y sin tocar otros paquetes. Esta orden fue contrastada en 10 pasadas VERDUGO y 10 JUEZ sobre el **encargo**, no sobre código al que el Director no tiene acceso.

```text
TASK=JOR-H9-C2-PHYSICAL-RUNNER-SAFE-20261119
OWNER_NOW=CODEX_LUNA
OWNER_AFTER_ONE_ZIP=CHATGPT_DIRECTOR
ROOT=D:\codex\Jornato
OUT=D:\codex\_REPORTES\Jornato\JOR-H9-C2-PHYSICAL-RUNNER-SAFE-20261119
AUTHORIZATION=PHYSICAL_PHONE_SCOPED_JORNATO_QA_GRANT_ALREADY_RECEIVED
TARGET_SERIAL=RESOLVE_EXACT_ONE_PHYSICAL_DEVICE; NEVER_EMIT_IN_ZIP
PACKAGE=com.sierraglobalcompany.jornato.b14qa
APK=build/app/outputs/flutter-apk/app-b14qa-debug.apk
APK_PREVIOUS_SHA256=BEEA46F75B08CFA440A980BCEE4CC12E2A6B4C7B37A9457B16240C5427157593
FLUTTER=3.47.8_REPORTED; VERIFY_INSTALLED_SDK
REMOTE_PUSH_MERGE_COMMIT=FORBIDDEN
NATIVE_PASS=UNPROVEN
H9_GLOBAL=NO_GO
RELEASE=NO_GO
```

## 0. Decisiones técnicas ya resueltas — sin más investigación general

1. **Fuente/artefacto demostrado:** El ZIP `JOR-H9-C2-PHYSICAL-ANDROID-QA-20261119-UNICO.zip`, SHA256 `6E58737061FA00D9CF60F630758D3C4E66CCF0F161027E83A641417C173BC278`, fue inspeccionado por ChatGPT: 9 miembros, CRC correcto y manifiesto 8/8. El informe y `logs/build_offline_success.log` registran `gradlew --offline :app:assembleB14qaDebug -Ptarget=integration_test/kiosk_flow_test.dart -Ptarget-platform=android-arm64 -Pdart-defines=...`, **BUILD SUCCESSFUL**. APK `app-b14qa-debug.apk` SHA256 arriba, app ID aislado, debug, Android 30 arm64 en un teléfono, paquete exacto ausente entonces. Bytes del APK **no están dentro del ZIP**: verificarlos en el checkout local antes de instalarlos. **NO construir otro APK** salvo que el archivo local no exista y haya que reconstruirlo con el MISMO entrypoint; si su SHA cambia sin modificación fuente explicable, no instalar a ciegas.
2. **Causa del bloqueo anterior:** `flutter test integration_test/...` en Flutter 3.47.8 instala con `-r`, podría desinstalar tras error y al cerrar. Este runner es **PROHIBIDO** para el teléfono. No volver a examinar todo el SDK: hacer una comprobación focal de `drive.dart`/`drive_service.dart` instalados y el help real para el camino `--use-existing-app`. Código upstream `drive.dart` muestra que con este flag llama a `reuseApplication(uri,...)` en lugar de `start(...)` y por defecto mantiene la app; no significa por sí mismo que las aserciones estén en la app (en este caso, el build **ya utilizó el target de integración**). Referencias: `https://codebrowser.dev/flutter/flutter/packages/flutter_tools/lib/src/commands/drive.dart.html`, `https://docs.flutter.dev/testing/integration-tests`, `https://github.com/flutter/flutter/blob/master/packages/integration_test/README.md`, `https://android.googlesource.com/platform/packages/modules/adb/+/refs/heads/main/docs/user/adb.1.md`.
3. **Autorización exacta:** El propietario dijo «usa el celular que esta conectado y disponible». Se permite **instalar una vez un paquete QA nuevo ausente, iniciarlo y ejecutar tests sintéticos**, en un único celular físico identificado por serial. NO se permiten `-r`, desinstalar, `pm clear`, `--no-uninstall` como falsa protección, cambiar ajustes/roles/permisos del teléfono, root, reset, capturar otras apps/datos, usar ocho AVD ajenos o otros dispositivos. No suponer autorización nueva para redes Pro, tenancy real ni publicar.
4. **Resultados históricos que NO debes repetir:** H9-M1 75 tests host PASS, Laravel bootstrap normal PASS, B21F-S3 backend 158/2450 PASS_SCOPED, F1 test visual PASS_FOCAL, C2 readiness Flutter analyze PASS y APK QA ya compilado. El test nativo (`integration_test/kiosk_flow_test.dart`) **AÚN NO SE HA EJECUTADO**. `PRO_HTTP_DB` y `TENANT_ISOLATION` siguen bloqueados por contratos/identidades QA no autorizadas. `RELEASE=NO_GO`.
5. **Una sola ruta, sin ping-pong:** P0 cotejar paquete+APK+fuente+runner → P1 instalar una sola vez → P2 iniciar y ejecutar test empaquetado con driver adjuntado → P3 aceptar o identificar fallo causal y, si existe soporte seguro YA PRESENTE, verificar restart → P4 ZIP único. **No crear un framework ni otro plugin o motor de cifrado.** No hacer otra auditoría 10+10 ni otra prueba visual.

## P0 — Prefiltro determinista y custodia (lectura, sin alterar el teléfono)

1. Abrir `D:\codex\Jornato` existente. Registrar rama, HEAD, `git status --porcelain=v1 -uall`, staged e índice; no forzar a coincidir con históricos de 235/234 rutas. Proteger mediante copias PRE y SHA-256 **solo los archivos específicos que se editen**, en `OUT` fuera del WIP. Los archivos `??` no se cubren con `git diff`; prohibido `git add/commit/push/pull/merge/rebase/reset/clean/stash/checkout`. No tocar Docker, datos reales, otros proyectos ni archivos de usuarios. El `.salive` Kotlin que desapareció en la compilación anterior es transitorio: registrarlo, no recrearlo.
2. Identificar exactamente UN dispositivo físico ADB en estado `device`, Android 30 u otro valor observado, sin emuladores seleccionados, con serial estable. **Todos los comandos ADB llevan `-s SERIAL`**, incluido logcat y forwards. Si cero/múltiples elegibles, `BLOCKED_DEVICE`; no adivinar. No incorporar serial, propiedades de identidad ni URI con token al ZIP.
3. Verificar read-only por **igualdad exacta** el ID `com.sierraglobalcompany.jornato.b14qa` y cualquier sufijo `.test` en **todos los usuarios/perfiles instalados observables** (o bloquear si falta visibilidad). `pm path`/`pm list packages` sobre nombres precisos; no inferir ausencia del exit=0 de la consulta global. Si el paquete existe, incluso con datos desconocidos, `BLOCKED_PACKAGE`, **no reemplazar, desinstalar, ni limpiar**. No consultar paquetes ajenos ni exportar inventario global. Revalidar presencia **inmediatamente antes** del único install.
4. Comprobar en el archivo APK real: ruta, SHA256, `aapt dump badging`/herramienta instalada para `applicationId`, Activity/manifest, flavor `b14qa`, firma debug, ABI, minSdk y **que su compilación corresponde al punto de entrada `integration_test/kiosk_flow_test.dart`**, según log Gradle correlacionado con insumos SHA y fecha. PRE de fuente C2 reportado en bloque anterior: SHA256 `30267B4110336B479437CFFE3C31392EF67CD32DEDC684F2179EC47808BB3E30`; comprobar el actual sin sobrescribir si difiere. **El APK ya construido es la ruta preferida.** Si falta o está corrupto, permitir **UNA** reconstrucción offline *idéntica* desde ese target usando la orden Gradle corregida demostrada (no la ruta relativa incorrecta que falló). Si fuente/Gradle han cambiado sin atribución o el nuevo artefacto no puede verificarse, `BLOCKED_ARTIFACT` y no instalar. No volver a reconstruir por no encontrar el driver host.
5. Comprobar que la misma suite `integration_test/kiosk_flow_test.dart` contiene `main()` y `IntegrationTestWidgetsFlutterBinding.ensureInitialized()` o su equivalente real y que el APK no cambia por pasar un `--target` a `drive` **después de compilar**. Host driver: si ya existe `test_driver/integration_test.dart`, reutilizar; si falta pero `integration_test` ya está en dependencias y existe driver oficial, **única adición opcional** al WIP es el mínimo estándar `import 'package:integration_test/integration_test_driver.dart'; Future<void> main() => integrationDriver();`, sin packages nuevos, analizando solo ese archivo. Ese driver HOST no obliga a reconstruir APK. Capturar PRE de la ruta si ya existe. **No programar una nueva suite antes de haber ejecutado la actual.**
6. `flutter drive --help` y lectura focal de `drive.dart` **exactamente instalado**: confirmar que `--use-existing-app=URI` llama a `reuseApplication`, no a `start`/install, y que `--keep-app-running` impide `stop`/uninstall; confirmar cómo asigna dispositivo y el driver host. Si no puede demostrarse, `BLOCKED_RUNNER_POLICY`, no ejecutar ningún comando Flutter sobre el celular. Prohibido `flutter test integration_test/...`, `flutter run` y `flutter drive` sin `--use-existing-app`. Consultar opciones con `--help` no ejecuta aplicaciones.

## P1 — ÚNICA instalación manual no reemplazable

7. Solo con P0 completo: revalidar ausencia del ID exacto, hash del APK y serial; **UNA** invocación `adb -s SERIAL install -t RUTA_APK` (con PowerShell quoting adecuado; **sin** `-r`, `-d`, `-g`, `--instant`, `--user all`, flags de fallback). Guardar comando saneado, exit y respuesta. Si falla, **no repetir ni cambiar flags**; `BLOCKED_INSTALL`. La instalación del paquete QA nuevo es parte del permiso concedido. Si no existe un APK QA cuyos bytes y target sean fiables, no instalar un producto normal solo para abrir UI.
8. Si la instalación devuelve `Success`, comprobar el paquete exacto y resolver su `Activity` **desde manifest / PackageManager del propio paquete QA**. Una sola invocación `adb -s SERIAL shell am start -n PAQUETE/ACTIVITY_REAL`. Si falla, detener `BLOCKED_LAUNCH`, sin reinstalar. **Dejar instalada la app QA** al terminar; no borrar datos como limpieza implícita. Nunca lanzar Activities de otros paquetes, ni tocar permisos sensibles, ni usar `monkey`.

## P2 — Conectar y obtener pruebas nativas reales, no un exit aparente

9. Obtener PID **solo del paquete QA** tras su inicio y, mediante logcat estrictamente filtrado a ese PID y serial, detectar si la aplicación debug publica una VM Service URI de **ese proceso**. Redactar token de URI/serial antes de redactar logs de salida. Si hace falta forward ADB, elegir un puerto libre y establecer **uno** exclusivamente para ese serial, registrando PRE; retirar al final solamente el forward que creaste tú, no `--remove-all`. No limpiar logcat global ni recolectar datos de otras apps. Si no hay VM Service accesible o no se puede atribuir al APK instalado, `BLOCKED_VM_SERVICE`.
10. Con URL real y driver host disponible, invocar **una sola vez** la orden conceptual, sustituyendo valores comprobados y con opción `--timeout` finita si la versión la admite:

   ```powershell
   flutter drive -d SERIAL --no-pub --driver=test_driver/integration_test.dart --target=integration_test/kiosk_flow_test.dart --use-existing-app=URI_DEL_PROCESO_QA --keep-app-running
   ```

   **Este `--target` sirve para identificar el driver/test declarado; NO recompila ni cambia el punto de entrada del APK ya instalado.** Sólo ejecutar tras P0: probar que **el dispositivo no recibirá otra instalación ni desinstalación por ese camino de la CLI real**. Guardar logs sanitizados, exit y test individual; **un solo intento**. Si no conecta, detener `BLOCKED_DRIVER_CONNECT` sin intentar el runner inseguro ni modificar SDK. Si conecta pero no se observan las aserciones esperadas, `INCONCLUSIVE_TEST_NOT_EXECUTED`, no falso PASS.
11. Gates **independientes**, atribuidos al SHA APK y al test ejecutado: `CIPHER_ENGINE` = motor SQLCipher real más archivo no legible como SQLite plano, clave errónea rechazada y readback legítimo; `KEYSTORE_EFFECTIVE` = evidencia de ruta nativa del proveedor de clave y manejo de fallo/recuperación en Android (distinguir `PLUGIN_PATH_PASS` de Keystore efectiva y de **hardware attestation no verificada**); `IDEMPOTENCY_NATIVE` = reintento con mismo ID/payload no duplica y conflicto ID/carga diferente rechazado; `CORRUPTION_FAIL_CLOSED` = únicamente copia sintética corrupta y rechazo observable (si byte alterado no afecta lectura, `INCONCLUSIVE`). Cada gate `PASS_PHYSICAL|FAIL_PHYSICAL|INCONCLUSIVE|NOT_RUN` — sin `PASS` si solo se encuentra `cipher_version`, un import, build exitoso o proceso vivo. No copiar DB real, secretos ni claves, ni capturas de apps ajenas.

## P3 — Reinicio nativo y reparación focal SIN reinstalar

12. **NO existe todavía en la evidencia un harness de dos fases**: `LocalEncryptedStore.close/open` dentro del mismo proceso **no** prueba `RESTART_READBACK`. Para evitar reconstrucción/instalación adicional y una nueva batería de cambios a ciegas, **NO reescribir la prueba ni recompilar antes de intentar los cuatro gates de P2**. Si el APK YA contiene marcador persistido y driver de dos fases, y puede demostrarse con fuente/resultado, ejecutar de forma segura: fase 1, detener **exclusivamente** `com.sierraglobalcompany.jornato.b14qa` tras terminar la captura, iniciar otra vez el mismo paquete sin reinstalar, nueva URI, fase 2 verifica IDs y eventos persistidos antes de mutarlos. Si **no** existe tal harness, `RESTART_READBACK=BLOCKED_HARNESS` de forma expresa; no improvisar un `force-stop` sobre test/driver vivo ni vender un readback en el mismo proceso como recuperación. No reiniciar el teléfono, borrar app, limpiar datos ni forzar otro paquete.
13. Si un test físico demuestra bug reproducible, registrar método/archivo y la entrada sintética exacta sin secretos. Corregir **solo** la causa propietaria en el WIP y el test afectado, sin `skip/xfail`, parches superficiales, DB/endpoint nuevos, dependencias/roles ni alteración de contratos OD01–08. Si esa corrección exige recompilar/reinstalar, queda `FIX_WRITTEN_NOT_RERUN_PHYSICAL` hasta un despliegue seguro posterior; **no utilizar `-r`** ni desinstalar para insistir en esta sesión. Ejecutar host/analyze solo de lo tocado. Si hay fuente untracked, incluir parche propio PRE→POST real.
14. `TENANT_ISOLATION` y `PRO_HTTP_DB` = `BLOCKED_CONTRACT` sin credenciales y fixture autorizados. No abrir Docker/MariaDB, no probar contra servidor o cuentas reales, no repetir 75 tests host, Laravel, F1 ni 10+10 auditorías. `H9_GLOBAL` y `RELEASE` continúan `NO_GO` aunque C2 dé PASS focal.

## P4 — Un solo ZIP de evidencias (no filtrar información del teléfono)

15. Guardar solamente: `FINAL_REPORT.md` (máx. 2 págs.), `RESULTS.csv` (gate/test real/estado/exit/SHA fuente/SHA APK/log_path/log_sha256), `WIP_PRE_POST.csv` con hashes focales, `CHANGES.patch` **solo si hay cambios fuente**, logs focales filtrados y sanitizados (sin serial, URI VM, token, certificados privados, nombres de persona), `BLOCKERS.md` solo si bloqueos reales y `MANIFEST_SHA256.csv` sin autorreferencia. Si algún paso falla, reportarlo: jamás reemplazarlo por un PASS de fuente. Verificar ZIP CRC, entradas, SHA256+bytes después de cerrarlo. **No incluir el APK, datos DB, archivo de clave, fotos, ni WIP completo**.
16. Ruta exacta `D:\codex\_REPORTES\Jornato\JOR-H9-C2-PHYSICAL-RUNNER-SAFE-20261119\delivery\JOR-H9-C2-PHYSICAL-RUNNER-SAFE-20261119-UNICO.zip`. Reportar su SHA-256 en el mensaje terminal. Nada de seis archivos sueltos. Mantener staging en cero, sin commit/push/merge/deploy/Actions. GitHub público lo actualiza ChatGPT Director tras revisar ZIP.

## Resultado terminal obligatorio

```text
TASK=JOR-H9-C2-PHYSICAL-RUNNER-SAFE-20261119
RESULT=PASS_NATIVE_SUBSET|PARTIAL|BLOCKED_ARTIFACT|BLOCKED_PACKAGE|BLOCKED_DEVICE|BLOCKED_RUNNER_POLICY|BLOCKED_INSTALL|BLOCKED_LAUNCH|BLOCKED_VM_SERVICE|BLOCKED_DRIVER_CONNECT|INCONCLUSIVE_TEST_NOT_EXECUTED
SOURCE_BRANCH=<real>
SOURCE_HEAD=<real>
CHANGED_FILES=<lista o NONE>
WIP_PRESERVED=YES|PARTIAL_EVIDENCE|NO
QA_PACKAGE=com.sierraglobalcompany.jornato.b14qa
APK_SHA256=<verificado desde binario real o NOT_AVAILABLE>
APK_ENTRYPOINT=integration_test/kiosk_flow_test.dart|UNVERIFIED
MANUAL_INSTALL=PASS_NEW_PACKAGE|NOT_RUN|FAIL
DRIVER_ATTACHED=PASS|FAIL|NOT_RUN
CIPHER_ENGINE=PASS_PHYSICAL|FAIL_PHYSICAL|INCONCLUSIVE|NOT_RUN
KEYSTORE_EFFECTIVE=PASS_PHYSICAL|PLUGIN_PATH_PASS_ONLY|FAIL_PHYSICAL|INCONCLUSIVE|NOT_RUN
IDEMPOTENCY_NATIVE=PASS_PHYSICAL|FAIL_PHYSICAL|INCONCLUSIVE|NOT_RUN
CORRUPTION_FAIL_CLOSED=PASS_PHYSICAL|FAIL_PHYSICAL|INCONCLUSIVE|NOT_RUN
RESTART_READBACK=PASS_NEW_PROCESS|BLOCKED_HARNESS|FAIL|NOT_RUN
TENANT_ISOLATION=BLOCKED_CONTRACT
PRO_HTTP_DB=BLOCKED_CONTRACT
H9_M1_HOST_75=REUSED_PASS_NOT_RERUN
F1_WIDGET=REUSED_PASS_FOCAL_NOT_RERUN
PHYSICAL_DEVICE_OTHER_PACKAGES_TOUCHED=NO|UNKNOWN
H9_GLOBAL=NO_GO
B22=NOT_AUTHORIZED
RELEASE=NO_GO
ZIP_PATH=<única ruta real>
ZIP_SHA256=<verificado>
NEXT_OWNER=CHATGPT_DIRECTOR
```

**Regla de aceptación:** `PASS_NATIVE_SUBSET` únicamente si hay aserciones nativas reales ejecutadas con evidencia en celular sobre el APK/test correcto; los otros gates pueden permanecer inconclusos, debidamente marcados. Un `exit=0` de `adb install`, un VM Service conectado o un APK que abre NO certifican SQLCipher/Keystore. `PASS_NEW_PROCESS` exige dos procesos y readback del mismo marcador. Sin driver seguro, devolver bloqueo específico y **no solicitar otra auditoría o permiso ya concedido**.

# 🚨 QUIÉN SIGUE: CODEX LUNA — PROBAR EL APK DE INTEGRACIÓN YA COMPILADO, UNA INSTALACIÓN, UN TEST. DESPUÉS DEL ZIP: CHATGPT DIRECTOR. 🚨
