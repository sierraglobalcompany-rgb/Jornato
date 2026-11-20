# CODEX LUNA — JORNATO C2 · DESBLOQUEO REAL DEL RUNNER ANDROID · MACROBLOQUE ÚNICO

**ORDEN ACTIVA, 19 de noviembre de 2026 (hora de Colombia).** Esta orden **sustituye** la anterior C2 FÍSICO V2, ya ejecutada con resultado `BLOCKED_RUNNER_SIDE_EFFECT`. **No** volver a ejecutar C2 Readiness, el runner inseguro `flutter test integration_test/...`, ni las auditorías 10+10; **no** crear fases de producto, servicios, dependencias ni suites paralelas. ChatGPT decide la estrategia; Codex Luna realiza el trabajo técnico local, comprueba y entrega **un único ZIP**. El propietario **ya autorizó el teléfono físico conectado**, pero no autorizó reemplazar/desinstalar aplicaciones, borrar datos, usar otros dispositivos ni modificar configuraciones globales.

```text
TASK=JOR-H9-C2-PHYSICAL-RUNNER-SAFE-20261119
OWNER_NOW=CODEX_LUNA
OWNER_AFTER_ONE_ZIP=CHATGPT_DIRECTOR
WORKTREE=D:\codex\Jornato
REPORT_DIR=D:\codex\_REPORTES\Jornato\JOR-H9-C2-PHYSICAL-RUNNER-SAFE-20261119
PHYSICAL_DEVICE=ONE_EXPLICIT_SERIAL_ONLY
QA_APPLICATION_ID=com.sierraglobalcompany.jornato.b14qa
QA_APK=build/app/outputs/flutter-apk/app-b14qa-debug.apk
QA_APK_EXPECTED_SHA256=BEEA46F75B08CFA440A980BCEE4CC12E2A6B4C7B37A9457B16240C5427157593
GIT_STAGE_COMMIT_PUSH_PULL_MERGE_REBASE_RESET_CLEAN_STASH=FORBIDDEN
RUN_GITHUB_ACTIONS=NO
RELEASE=NO_GO
```

## 1. Lo ya probado: NO perseguirse la cola

1. Archivo de evidencia recibido `JOR-H9-C2-PHYSICAL-ANDROID-QA-20261119-UNICO.zip` **SHA-256 `6E58737061FA00D9CF60F630758D3C4E66CCF0F161027E83A641417C173BC278`**. Director comprobó **9 archivos, ZIP CRC correcto, manifiesto 8/8 tamaño+SHA correcto**. En logs: Flutter 3.47.8, Dart 3.13.7; APK `b14qaDebug` compilado offline, `applicationId=com.sierraglobalcompany.jornato.b14qa`, `minSdk=24`, `targetSdk=36`, firma debug; **APK BUILT_NOT_INSTALLED**, no se adjuntaron sus bytes al ZIP. Teléfono físico Android 30, ABI arm64-v8a; *un solo dispositivo autorizado*, usuario 0, sin coincidencias exactas de paquetes QA ni `.test` en ese momento. **Verifica nuevamente antes de actuar.**
2. El hallazgo del runner **sí es real**: el `flutter test` de este SDK ejecuta `adb install -t -r`, puede desinstalar tras error y tiene teardown uninstall; `--no-uninstall` **no elimina** la instalación reemplazable/fallback. **Prohibido ese runner en este lote.** Este hallazgo **no** significa que una instalación manual de paquete nuevo deba estar bloqueada: la CLI ADB distingue `-t` (permitir APK de pruebas) de `-r` (reemplazar). Flutter también ofrece `flutter drive --use-existing-app=URI` para conectarse a un **proceso ya iniciado**, sin arrancarlo; **verificar implementación y flags en Flutter 3.47.8 antes de usar**, no asumir por documentación genérica.
3. Estado local histórico reportado: rama `codex/jor-b08-h4-domain-20261025`, HEAD `faf5fe283191f8b5a2724b397009512a2caec1b6`, 235→234 entradas Git tras build, 0 staged, índice SHA igual. La entrada temporal `android/.kotlin/sessions/kotlin-compiler-8677482930770349621.salive` desapareció sin causa aislada: **cache/archivo transitorio, no afirmar pérdida de código ni restituirlo artificialmente**. Ninguna fuente cambió. SHA del APK construido `BEEA46F75B08CFA440A980BCEE4CC12E2A6B4C7B37A9457B16240C5427157593`.
4. H9-M1: **75 host PASS**, Flutter Analyze PASS y Laravel bootstrap normal PASS, en sus respectivos logs; F1 widget folio PASS_FOCAL; C2 Readiness prueba `integration_test/kiosk_flow_test.dart` escrita pero no ejecutada; B21F-S3 backend **158/2450 PASS_SCOPED histórico**. **NO reejecutar** nada de esto por rutina. Pro HTTP/DB = `BLOCKED_CONTRACT`; tenant B = `BLOCKED_CONTRACT`; H9 y release = `NO_GO`.
5. Módulos del WIP observados por Codex: `integration_test/kiosk_flow_test.dart`, `lib/src/persistence/local_encrypted_store.dart`, `lib/src/persistence/kiosk_repository.dart`, `android/app/build.gradle.kts`. El test actual incluye operaciones de SQLCipher/clave incorrecta, FlutterSecureStorage, reintentos idempotentes y corrupción sobre **copia sintética**; **RESTART_READBACK real no está demostrado**. Código WIP avanzado sigue solo en Windows, no lo sustituyas por F0 del PR #3. Fuentes Flutter/ADB de consulta del Director: `https://docs.flutter.dev/testing/integration-tests`, `https://github.com/flutter/flutter/blob/master/packages/integration_test/README.md`, `https://codebrowser.dev/flutter/flutter/packages/flutter_tools/lib/src/commands/drive.dart.html`, `https://android.googlesource.com/platform/packages/modules/adb/+/refs/heads/main/docs/user/adb.1.md`.

## 2. Decisión técnica fija: instalación NUEVA controlada y driver que reutiliza el proceso

**Ruta principal, no un menú de experimentos:** comprobar el paquete QA y el binario existente; **instalar una sola vez** con `adb -s SERIAL install -t APK` (**SIN `-r`, `-d`, `-g`, `--instant`, uninstall ni clear**); iniciar exclusivamente su Activity de lanzador con `adb shell am start`; conectar el host driver a la VM Service del proceso **usando `flutter drive --use-existing-app=URI --keep-app-running`**, con test driver oficial de `integration_test` si está disponible. Ningún paso puede invocar `flutter test` sobre dispositivo ni `flutter run`/`flutter drive` sin `--use-existing-app`, porque esos caminos pueden reinstalar. La prueba debe recoger **resultados reales de aserciones**: un log de lanzamiento, `cipher_version` o `exit 0` del shell por sí solos NO dan PASS.

**Plan limitado si falla un paso:** NO instalar con `-r`, no desinstalar ni crear otro flavor. Primero terminar los pasos de solo lectura y registrar el bloqueo preciso (`BLOCKED_PACKAGE`, `BLOCKED_DRIVER_CONNECT`, `BLOCKED_VM_SERVICE`, etc.). Si el paquete QA fue instalado en esta sesión y no hay canal confiable de resultados, dejarlo sin tocar y cerrar `PARTIAL`/`BLOCKED_HARNESS`, no encadenar más runners ni reemplazar el APK.

## 3. P0 — Preflight de custodia y riesgo real (solo consultas)

1. Confirmar WIP, rama/HEAD reales, `git status --porcelain=v1 -uall` e índice **solo lectura**. Preservar el estado actual, no exigir el conteo histórico. Antes de editar un archivo (en particular `?? integration_test/kiosk_flow_test.dart` o nuevo `test_driver/integration_test.dart`), guardar copia exacta y SHA-256 PRE **fuera del WIP**; PRE/POST de los objetivos y del índice. No tocar fuentes sin causa objetiva.
2. `adb devices -l` y `adb -s SERIAL get-state`: exigir **exactamente un teléfono físico en estado `device`** que coincida con el autorizado. `SERIAL` debe extraerse del entorno, **nunca escribir el número real en ZIP o GitHub**. No usar `adb` sin `-s`, dispositivos ajenos, emuladores, perfiles secundarios, red ADB ni conectar servidores remotos. ADB API 30/ABI arm64-v8a se vuelve a cotejar por consultas de solo lectura.
3. Extraer de Gradle/manifest/apkinfo la identidad exacta del paquete, tipo debug, entrypoint y Activity; verificar el **hash del APK local** contra el SHA esperado. Comprobar `pm list packages --user 0` con **coincidencia exacta** para `com.sierraglobalcompany.jornato.b14qa` y `.test`, y consultar `pm path` como corroboración, no como oráculo único. Repetir esta consulta **inmediatamente antes** de instalar. Si existe alguno de estos paquetes, hay datos de propiedad desconocida o firma/ID ambiguos: **NO INSTALAR, NO REEMPLAZAR, NO DESINSTALAR**. Si el APK difiere del hash histórico **sin cambios locales intencionales y documentados**, bloquear; si Codex debió modificar la instrumentación ANTES de instalar, registrar el nuevo hash SHA-256, la firma debug y el archivo fuente causante; no presentar el SHA anterior como artefacto final. Si la lista está incompleta/no concluyente: bloquear instalación.
4. Inspeccionar sin ejecutar las rutas de Flutter 3.47.8 `drive.dart` y `drive_service.dart`: con `--use-existing-app` **no debe llamar a `start`/`install`/`uninstall` ni detener el proceso si `--keep-app-running`**, tampoco en la ruta de excepción. Verificar además que el host driver `integration_test` puede recibir los resultados (`test_driver/integration_test.dart` usa `Future<void> main() => integrationDriver();`). **Si esta garantía falla en este SDK, no usar ese driver.** No modificar Flutter SDK, global PATH, hooks, Android Studio ni otros proyectos. El driver mínimo puede escribirse en el WIP solo si la dependencia ya está disponible offline; sin dependencias nuevas.
5. Registrar PRE del APK, status y destino, sin capturar valores sensibles. Si el build previo sigue siendo válido, **no recompilar**. Si hace falta cambiar código de test antes de instalar para corregir una limitación demostrada o añadir **solo la fase de restart** (ver P2), hacerlo de una vez, usar paquete/variante ya existentes, correr analyze focal y compilar **una sola vez offline** para producir la versión final que se instalará. El paquete debe seguir siendo `com.sierraglobalcompany.jornato.b14qa`, con firma debug comprobada. Comprobar permisos del manifest y no conceder cámara, ubicación u otros permisos sensibles ajenos a los casos C2, ni responder a diálogos de consentimiento no autorizados. Nunca recompilar/reinstalar en bucle.

## 4. P1 — Un solo despliegue seguro en el teléfono autorizado

6. Revalidada la ausencia exacta y huella del APK, ejecutar una sola vez, sobre el SERIAL explícito, **`adb -s SERIAL install -t RUTA_APK`** sin `-r` ni flags que eludan controles. Guardar salida y exit code. **Si falla, detener: no reintentar con variantes, no fallback, no quitar nada.** Solo `Success` + paquete exacto presente habilitan continuar. Instalar la app QA modifica exclusivamente ese paquete; esto sí está dentro de la autorización de QA. No recopilar otras apps/datos del teléfono.
7. Resolver el componente de lanzador **del paquete QA**, a partir de su manifest/PackageManager; usar `adb -s SERIAL shell am start -n PAQUETE/ACTIVITY_REAL` una vez. No lanzar otra actividad, ni `monkey`, ni borrar logs globales con `logcat -c`. Capturar logcat **filtrado por PID del paquete QA** en un archivo de QA local y redactar tokens/URI de VM service antes del ZIP. Si el entrypoint es un script `integration_test`, sus assertions pueden correr al arrancar: preservar su salida, esperar el resultado del driver, no dar PASS por estar abierta la UI.
8. Con el proceso vivo, localizar la **VM Service URL real** publicada para ese proceso debug en logs locales (sin inventarla). Si requiere `adb forward`, establecer solo un forward específico y libre sobre **ese SERIAL**, sin `--remove-all`, sin sobreescribir otros puertos, conservando la ruta/puerto/estado PRE para retirar **solo el forward creado por este lote**. No publicar tokens del URI.
9. Con driver oficial preexistente o mínimo de integración, ejecutar **una sola vez** su conexión a la app **ya instalada y ejecutándose**. Plantilla conceptual — sustituir URI, rutas y SERIAL por valores verificables, no por placeholders literales:

   ```text
   flutter drive -d SERIAL --no-pub --driver=test_driver/integration_test.dart --target=integration_test/kiosk_flow_test.dart --use-existing-app=URI_VERIFICADA --keep-app-running
   ```

   Antes de ejecutarla, comprobar `flutter drive --help` de **esa SDK** y el código de la rama `--use-existing-app`. Si ese comando intentase compilar, instalar, borrar, parar o reemplazar el paquete QA, **NO EJECUTAR**; documentar el mecanismo exacto. Si falta un driver compatible, construir **solo el test driver mínimo del ejemplo oficial** con dependencias existentes, analizarlo, sin cambiar el producto ni el APK. Si el proceso no publica VM Service accesible o no se puede atribuir el resultado al SHA instalado, marcar el subgate BLOQUEADO y parar.
10. Registrar test/exit y **aserciones individuales**: `CIPHER_ENGINE`, `KEYSTORE_EFFECTIVE`, `IDEMPOTENCY_NATIVE`, `CORRUPTION_FAIL_CLOSED`; cada uno `PASS_PHYSICAL|FAIL_PHYSICAL|NOT_RUN|INCONCLUSIVE`. `KEYSTORE_EFFECTIVE=PASS` exige ejercicio realmente nativo y prueba de clave, **no** hardware attestation, no basta plugin inicializado ni `cipher_version`. La prueba de corrupción en copia aislada solo da PASS si verifica rechazo medible; si no toca página inválida, `INCONCLUSIVE`, nunca cambiar test para falsear resultado. No leer claves, no exportar la DB, no tomar fotos/screen del teléfono ni logs generales.

## 5. P2 — Recuperación tras reinicio: puerta separada y no invasiva

11. **NO confundir** `LocalEncryptedStore.close/open` con reinicio Android. ANTES del primer build/instalación, comprobar si el test ya tiene protocolo de dos fases con marcador sintético persistido y observador host capaz de reconectar, sin desinstalar/limpiar. Si no lo tiene, **implementar, cuando sea compatible con el test y contrato existentes, una extensión mínima al MISMO `integration_test/kiosk_flow_test.dart`**: al inicio consultar el almacén QA cifrado para saber si hay un marcador único de fase 1; primera ejecución escribe evento/outbox e IDs ficticios y reporta fase 1; segunda ejecución, en un proceso Android nuevo sobre el mismo APK y datos persistidos, **lee y compara los IDs originales antes de escribir otros eventos** y reporta fase 2. Registrar los resultados en el canal de test ya existente (no crear un framework, canal nativo, endpoint, permiso ni repositorio nuevos). Si no puede hacerse con seguridad sin modificar producción, dejar `BLOCKED_HARNESS` y completar el resto. Ejecutada y verificada la fase 1, el controlador host puede aplicar `adb -s SERIAL shell am force-stop com.sierraglobalcompany.jornato.b14qa` **solo a la QA app creada en este lote**, tras cerrar el canal del test y comprobar la captura íntegra de fase 1; después inicia otra vez esa misma Activity y **vuelve a conectar con una nueva VM Service URI** sin reinstalar, sin borrar y sin asumir que el test runner previo sobrevivirá. Solo `PASS_NEW_PROCESS` con IDs/bytes atribuibles a ambas fases, no por simplemente abrir UI. No usar `pm clear`, uninstall, reinstall, `adb kill-server`, reinicio del teléfono ni cambios globales.
12. `TENANT_ISOLATION` y `PRO_HTTP_DB` siguen `BLOCKED_CONTRACT` sin autorización del contrato/identidad QA. No fabricar fixture cruzado ni abrir Docker/credenciales. La app QA no necesita sync remota para la prueba de cifrado local.

## 6. P3 — Reparación focal y custodia; no reintentos invasivos

13. Si una aserción del test **efectivamente ejecutado** falla, capturar la causa por archivo/método y corregir solo la fuente propietaria y/o aserción incorrecta. No cambiar expectativas para esconder un fallo, no `skip`/`xfail`, no paquetes nuevos, no nuevo servicio de sync. Ejecutar `flutter analyze --no-pub` y host tests **solo relacionados con el delta**; no repetir 75 tests host, suite Laravel, F1 ni Android con reinstall. **Una corrección posterior a la instalación queda escrita y NOT_RUN en dispositivo** hasta un despliegue seguro explícitamente autorizado, no un falso PASS.
14. Registrar WIP PRE/POST a nivel focal, huellas SHA256 de todo archivo tocado (incluidos `??`), cambios de índice y delta propio; capturar el cambio del artefacto APK solo si se recompiló. Un archivo `.salive` Kotlin temporal no es código fuente y no se reconstruye manualmente; anotarlo si afecta status. No tocar instalaciones previas de Jornato, archivos ni apps ajenas. **No stage, commit, push, pull, merge, reset, clean, stash, release, publish**.

## 7. P4 — Entregar exactamente un ZIP sanitizado

15. Crear en `REPORT_DIR/delivery` **un solo ZIP** `JOR-H9-C2-PHYSICAL-RUNNER-SAFE-20261119-UNICO.zip` que contenga: `FINAL_REPORT.md` (máx. 2 páginas), `RESULTS.csv` (gate, test exacto, estado, exit, fuente SHA, APK SHA, `log_path`, `log_sha256`), `WIP_PRE_POST.csv`, logs **solo del paquete QA** y comandos focales, `CHANGES.patch` **solo si se editó fuente** (diff entre bytes PRE/POST, no `git diff` de `??`), `BLOCKERS.md` solo si existe bloqueo material, `MANIFEST_SHA256.csv` con tamaño/SHA de **los demás miembros** (sin autorreferencia). Verificar CRC, integridad SHA/tamaños, rutas y secretos ANTES de adjuntar. No adjuntar APK, ADB serial, firmas privadas, claves, DB, tokens, cookies, datos personales ni WIP completo.
16. Responder en terminal con valores reales, una sola entrega:

   ```text
   TASK=JOR-H9-C2-PHYSICAL-RUNNER-SAFE-20261119
   RESULT=PASS_NATIVE_SUBSET|PARTIAL|BLOCKED_PACKAGE|BLOCKED_DRIVER_CONNECT|BLOCKED_VM_SERVICE|BLOCKED_HARNESS|BLOCKED_DEVICE
   SOURCE_BRANCH=<real>
   SOURCE_HEAD=<real>
   WIP_PRESERVED=YES|PARTIAL_EVIDENCE|NO
   APK_SHA256=<exacto instalado, o NOT_INSTALLED>
   PACKAGE=<identidad exacta>
   MANUAL_INSTALL=PASS_NEW_PACKAGE|NOT_RUN|FAIL
   DRIVER_USE_EXISTING=PASS|FAIL|NOT_RUN
   CIPHER_ENGINE=PASS_PHYSICAL|FAIL_PHYSICAL|INCONCLUSIVE|NOT_RUN
   KEYSTORE_EFFECTIVE=PASS_PHYSICAL|FAIL_PHYSICAL|INCONCLUSIVE|NOT_RUN
   IDEMPOTENCY_NATIVE=PASS_PHYSICAL|FAIL_PHYSICAL|INCONCLUSIVE|NOT_RUN
   CORRUPTION_FAIL_CLOSED=PASS_PHYSICAL|FAIL_PHYSICAL|INCONCLUSIVE|NOT_RUN
   RESTART_READBACK=PASS_NEW_PROCESS|BLOCKED_HARNESS|NOT_RUN|FAIL
   TENANT_ISOLATION=BLOCKED_CONTRACT
   PRO_HTTP_DB=BLOCKED_CONTRACT
   H9_M1_HOST_75=REUSED_PASS_NOT_RERUN
   F1_WIDGET=REUSED_PASS_FOCAL_NOT_RERUN
   BOOT_NORMAL=REUSED_PASS_NOT_RERUN
   PHONE_OTHER_APPS_TOUCHED=NO|UNKNOWN
   H9_GLOBAL=NO_GO
   B22=NOT_AUTHORIZED
   RELEASE=NO_GO
   ZIP_PATH=<única ruta real>
   ZIP_SHA256=<SHA256 real comprobado>
   NEXT_OWNER=CHATGPT_DIRECTOR
   ```

**Estrategia de cierre:** si la prueba ya puede ejecutarse sin la gestión invasiva del runner, avanzar nativo de verdad y reportar solo lo medido. Si no se puede establecer un canal de resultados seguro, no volver a etiquetar el problema como genérico «no hay autorización»: **la autorización de QA física existe**, y el bloqueo nuevo será **técnico y concreto**. **NO repetir auditorías 10+10 ni volver a pedir permiso para instalar un paquete QA nuevo cuando esté ausente.** La puerta global H9 y la publicación siguen NO_GO hasta evidencia del resto de contratos.

# 🚨 QUIÉN SIGUE: CODEX LUNA — INSTALACIÓN NUEVA CONTROLADA Y EJECUCIÓN NATIVA. DESPUÉS DEL ZIP: CHATGPT DIRECTOR. 🚨
