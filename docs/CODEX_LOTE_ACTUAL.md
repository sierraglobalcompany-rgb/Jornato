# CODEX LUNA — JORNATO — MACROBLOQUE C2 V5: QA FÍSICA SEGURA + CUSTODIA DEL WIP

**EJECUTA, NO REAUDITES.** Orden canónica única. Sustituye expresamente V3 (`JOR-H9-C2-PHYSICAL-DART-DIRECT-20261120`) y V4 (`JOR-H9-C2-PHYSICAL-DART-V4-20261120`). **No ejecutes ambas, ni inicies si un Codex paralelo ya está trabajando, ni repitas una instalación/ejecución posterior que ya tenga evidencia.** ChatGPT Director es el cerebro/director; tú ejecutas este macrobloque sin rediseñar sus reglas. Final: UN SOLO ZIP y vuelta a ChatGPT.

```text
TASK=JOR-H9-C2-PHYSICAL-DART-V5-20261120
WIP=D:\codex\Jornato
OUT=D:\codex\_REPORTES\Jornato\JOR-H9-C2-PHYSICAL-DART-V5-20261120
PHONE=EXACTLY_ONE_AUTHORIZED_CONNECTED_PHYSICAL_ANDROID
QA_PACKAGE=com.sierraglobalcompany.jornato.b14qa
QA_TEST_PACKAGE=com.sierraglobalcompany.jornato.b14qa.test
APK=build/app/outputs/flutter-apk/app-b14qa-debug.apk
APK_SHA256_EXPECTED=BEEA46F75B08CFA440A980BCEE4CC12E2A6B4C7B37A9457B16240C5427157593
APK_BYTES_EXPECTED=112605171
TEST_ENTRYPOINT=integration_test/kiosk_flow_test.dart
HOST_DRIVER_ORIGINAL=test_driver/integration_test.dart
SOURCE_TEST_SHA256_EXPECTED=30267B4110336B479437CFFE3C31392EF67CD32DEDC684F2179EC47808BB3E30
SOURCE_HOST_SHA256_EXPECTED=2F80A384A6D27EAFF7C355E92644A0AB171504857103A4D53579236E8ECDB05F
H9_GLOBAL=NO_GO
RELEASE=NO_GO
NEXT_AFTER_ZIP=CHATGPT_DIRECTOR
```

## 0. PROHIBICIONES Y JERARQUÍA

- NO `git add/commit/push/pull/merge/reset/clean/stash/checkout` en el WIP; no tocar `main`, PR #1/#3 ni volver a escribir la orden en GitHub desde Codex. **Docs PR #2** es la autoridad documental; el WIP local privado no está publicado allí. No instalar/actualizar SDK ni paquetes, no redes Pro o producción, no cuentas/roles nuevos, no B22. No tocar otros proyectos.
- NO `flutter drive`, `flutter test`, `flutter run` sobre el teléfono, ni lectores de `adb logcat` globales. NO AVD, `adb uninstall`, `pm clear`, `adb install -r`, `logcat -c`, root, reinicio físico, borrado, reinstalación, cambio de configuración global ni acceso a otras apps. La autorización del dueño cubre solo paquete QA **nuevo** en un celular físico autorizado y datos sintéticos.
- NO escribir a disco/terminal/ZIP URIs o tokens del VM Service, serial/IMEI, variables de entorno, logs crudos, APK, DB, datos de empleados, secretos ni capturas del usuario. Cualquier salida sensible se redacta **en memoria ANTES de persistirla**. No `Start-Transcript`, `tee`, redirección cruda ni logs de procesos ajenos.
- No reejecutar los tests backend **158/2450**, H9-M1 **75**, F1 widget focal, builds, auditorías anteriores, tests F0 del PR #3 ni migraciones; reutilizar evidencias PASS_SCOPED del contrato que no cambió. El puente de conciliación WIP de PR #2 referencia un HEAD antiguo de PR #3: NO usarlo como veredicto vigente sin contrastar su SHA de referencia; no arreglarlo en este lote.
- Si la QA de V3/V4/V5 **ya se ejecutó o el paquete QA ya existe**, no instalar ni repetir nada: registrar `ALREADY_EXECUTED_NEEDS_DIRECTOR` o `BLOCKED_PACKAGE`, adjuntar solo evidencia ya existente/no sensible, cerrar ZIP único. No abrir nuevas variantes al fallar.

## 1. GATE A — PRE-FLIGHT HOST (sin tocar todavía el celular)

A1. Obtener **una sola lectura** del árbol `D:\codex\Jornato`: rama, HEAD, `git status --porcelain=v1` contado por clase sin publicar rutas privadas, índice staged y SHA de dos fuentes y APK. Reportar divergencias, no exigir los históricos 234 cambios ni un HEAD antiguo como invariantes. Si hay proceso Codex paralelo o colisión real, STOP `BLOCKED_WIP_COLLISION`. No limpiar, no reconstruir `.salive`, no tocar untracked/ignored.

A2. Verificar lectura local del SDK **Flutter 3.47.8 reportado o versión realmente instalada**, package_config y cachés. El código oficial del tag `3.47.8` ya contrastado por ChatGPT: `integrationDriver()` llama `FlutterDriver.connect()` y `requestData(null)`; `FlutterDriver.connect` usa `logCommunicationToFile=true`; `VMServiceFlutterDriver.connect` puede registrar URL privada; `integrationDriver` por defecto escribe `integration_response_data.json` en salida; `useMemoryFileSystemForTesting()` cambia `flutter_driver.fs` a memoria. **Revisar el SDK LOCAL una vez** y comprobar estas firmas, no volver a investigar internet.

A3. Confirmar que `test_driver/integration_test.dart` existente es **solo** el adaptador convencional `main()=>integrationDriver()` sin lógica adicional, y que SHA de test y driver son los esperados. Si el host original hace algo distinto, STOP `BLOCKED_DRIVER_PARITY`; no sustituir silenciosamente el comportamiento. Leer `integration_test/kiosk_flow_test.dart` solo para mapear las cuatro pruebas nombradas y sus aserciones; distinguir pruebas presentes de pruebas que realmente se ejecutaron. SHA mismatch no autorizado = `BLOCKED_ARTIFACT`.

A4. Crear exclusivamente en `OUT\host_private\` este microadaptador **Dart host**, fuera del repo y sin tocar APK, suite, config o dependencias:

```dart
import 'package:flutter_driver/flutter_driver.dart' as fd;
import 'package:integration_test/integration_test_driver.dart';

Future<void> main() async {
  // Tres barreras antes de conectar: logs en RAM, logger inerte,
  // y SIN respuesta JSON persistida por el callback predeterminado.
  fd.useMemoryFileSystemForTesting();
  fd.driverLog = (String source, String message) {};
  await integrationDriver(responseDataCallback: null);
}
```

A5. Verificar en SDK local que el código compila **sin `pub get` ni red** y que cambiar `responseDataCallback` solo elimina archivo de resultado, NO oráculos/`requestData`. Usar `dart` del Flutter SDK con argumento explícito `--packages=<ruta absoluta a WIP\.dart_tool\package_config.json>` y el script en OUT **solo si `dart --help` del binario local confirma dicha forma**. Ejecutar con cwd aislado bajo OUT y sin escritura sobre WIP. No usar `dart run` si provoca resolución; no usar Flutter Tool. Si no hay ruta demostrable offline, STOP `BLOCKED_OFFLINE_HOST`. No modificar el proyecto para forzar que funcione.

A6. Supervisar procesos Dart/ADB propios desde PowerShell/.NET estándar con `UseShellExecute=false`, stdout/stderr capturados únicamente en RAM, máximo razonable de bytes, timeout y cancelación de **solo** los procesos propios. Nunca volcar output crudo a consola, fichero, transcript o ZIP; aplicar en memoria redacción de tokens/URL/serial y datos potenciales de QA antes de cualquier salida. No guardar `VM_SERVICE_URL` en perfil, sistema ni usuario, solo en el entorno del proceso hijo. Comprobar también que no se crea en disco ningún `flutter_driver_commands*` ni `integration_response_data.json` nuevo en WIP/OUT; el filesystem en memoria y el callback nulo previenen ambas rutas en el SDK revisado. Si no puedes hacer cumplir las tres barreras de privacidad, STOP `BLOCKED_HOST_PRIVACY` antes de instalar. No montar un framework nuevo: un script efímero de supervisión es suficiente.

A7. Confirmar APK **en disco**: archivo regular, SHA256 exacto, 112605171 bytes, firma debug, package exacto, actividad del manifest, minSdk/ABI, y prueba local anterior del target compilado `integration_test/kiosk_flow_test.dart`. APK no adjunto aquí y SHA histórico es solo reportado: sin verificación local STOP `BLOCKED_ARTIFACT`. **No recompilar**.

## 2. GATE B — CELULAR FÍSICO (solo si A1–A7 PASS)

B1. Identificar exactamente **un** teléfono físico autorizado `adb devices` en estado `device` (excluir AVD). En toda operación posterior usar `adb -s <SERIAL>`. Confirmar API/ABI y paquete exacto `com.sierraglobalcompany.jornato.b14qa` y `.test` **ausentes en todos los perfiles observables**; si alguno existe o la ausencia no puede demostrarse, STOP `BLOCKED_PACKAGE` sin cambiarlo. `adb -s <SERIAL> shell logcat --help` debe confirmar `--pid` filtrado **en el dispositivo**. No leer logs en preflight.

B2. Revalidar justo antes la ausencia, hash APK y dispositivo; UNA sola instalación `adb -s <SERIAL> install -t <APK_ABSOLUTO>` **sin** `-r/-d/-g`, `uninstall`, repetición ni fallback. Si falla: `BLOCKED_INSTALL`; no reintentar. Iniciar UNA sola vez la Activity obtenida del manifest QA mediante `adb -s <SERIAL> shell am start -n <COMPONENTE_VERIFICADO>`. Preservar la instalación después.

B3. Obtener PID exclusivamente de `pidof` paquete QA y corroborar actividad/proceso propio. Leer URL de Dart VM **solo** desde `adb -s <SERIAL> shell logcat --pid=<PID> -d -v time`; filtro en dispositivo, salida de lectura a **RAM privada** del supervisor (sin raw a terminal/ZIP); no recoger líneas de otros PID. Asegurar PID estable. Si no hay URL por ese canal, `BLOCKED_VM_SERVICE`, sin logcat global ni segunda ruta. Validar que URL local del servicio contiene host/puerto/token esperado; no imprimirlo.

B4. Inventariar forwards previos en memoria y crear solo `adb -s <SERIAL> forward tcp:0 tcp:<PUERTO_VM_DISPOSITIVO>` (si versión local lo soporta), obteniendo puerto host elegido automáticamente; no colisionar ni exponer interfaz distinta de loopback. Conservar el segmento privado en RAM y formar `VM_SERVICE_URL=http://127.0.0.1:<PUERTO_HOST>/<TOKEN>/` solo para el subproceso Dart; limpiar la variable del proceso supervisor. Retirar **solo** el forward creado en `finally`, sin `--remove-all`. Si falla: `BLOCKED_VM_SERVICE`/`BLOCKED_DIRECT_DRIVER_CONNECT`, no nuevas rutas.

B5. Ejecutar UNA vez el microadaptador del Gate A con timeout, no Flutter Tool. El supervisor recibe stdout/stderr en memoria y persiste solo informe sanitizado. El driver usa `integrationDriver()` oficial y devuelve 0/1. No suponer que `exit 0`, conexión, `cipher_version` o salida bonita prueban cada subgate: cruzar `allTestsPassed` con **test fuente exacto** y oráculos que realmente se ejecutan. Clasificar individualmente:

| Gate | Para PASS físico se requiere |
|---|---|
| `CIPHER_ENGINE` | Base cifrada y apertura sin clave/con clave errónea fallan; lectura válida sí funciona. |
| `KEYSTORE_EFFECTIVE` | Ruta proveedor seguro Android y readback real; sin alegar attestation o hardware-backed no probado. |
| `IDEMPOTENCY_NATIVE` | Mismo requestId no duplica; mismo ID con payload distinto se rechaza explícitamente. |
| `CORRUPTION_FAIL_CLOSED` | Copia sintética corrupta se rechaza sin dañar el original sano. |

Si no puedes atribuir oráculo concreto al test binario y ejecución: `INCONCLUSIVE`/`NOT_RUN`, no PASS. Si falla una aserción real: `FAIL_TEST` con causa y archivo probable, **sin editar ni reinstalar**. `RESTART_READBACK=PASS_NEW_PROCESS` únicamente si el APK YA contiene un protocolo verificado de parada y lectura desde segundo proceso del mismo paquete sin limpiar; si no, `BLOCKED_HARNESS`, sin inventar harness. `TENANT_ISOLATION_ANDROID=BLOCKED_CONTRACT` y `PRO_HTTP_DB=BLOCKED_CONTRACT` sin cuentas/roles/fixtures aprobados; nunca red Pro de prueba en este lote.

## 3. GATE C — AVANCE INDEPENDIENTE SIN ABRIR MÁS AUDITORÍAS

C1. Tanto si B pasó como si se bloqueó, producir **una sola matriz mínima de continuidad** desde Git/status ya consultados, sin segunda inspección masiva ni pruebas. Correlacionar lo reportado con fuentes GitHub: `main=1ee6aae...`, PR1 `faf5fe...`, PR2 documental HEAD al iniciar y PR3 `104469b...` (referencias históricas; si cambiaron, usar las actuales). Diferenciar claramente WIP local, GitHub remoto y resultados de runtimes anteriores; **no fusionar, copiar contenido del WIP a un repositorio público ni pedir al dueño QA manual**.

C2. Herramienta `tools/JORNATO_CONCILIAR_WIP_GITHUB_SIN_CODEX.py` y guía actual en PR2 usan la referencia antigua PR3 `78b32284...`. No afirmar conciliación con PR3 actual usando ese SHA obsoleto. Solo indicar `BRIDGE_REFERENCE_STALE=YES`, y contar nombres de módulos si están ya disponibles mediante status sin escaneo nuevo; ninguna modificación al puente ahora. Dejar una recomendación focal al Director: custodia recuperable del WIP local y reconciliación segura en **lote posterior**, antes de integrar PR #3 o publicar código.

C3. Si el producto sigue `NO_GO`, enumerar **solo blockers que impactan el siguiente paso**, no seis auditorías nuevas: C2 nativo, persistencia de dos procesos, contrato Pro/tenant, WIP Git único, UAT kiosco/empleado/portal y OD01–OD08. Reutilizar B21F-S3 `158/2450 PASS_SCOPED`, H9-M1 `75 PASS`, F1 focal como historial; jamás elevarlos a certificación total.

## 4. ÚNICO ZIP Y RESPUESTA TERMINAL

Crear **solo un ZIP final**, ruta `OUT\delivery\JOR-H9-C2-PHYSICAL-DART-V5-20261120-UNICO.zip`, sin el APK ni código privado, con: `FINAL_REPORT.md` (valores observados, no literales de shell), `RESULTS.csv` por gate + razón y oráculo, `HOST_PRIVACY.md` con prueba de tres barreras/captura y ausencia de archivos nuevos, `WIP_PRE_POST.csv` de hashes/status focal y conteos sanitizados, `NEXT_GATES.md` de una página, logs **solo saneados y propios** y `BLOCKERS.md` si bloqueado, `MANIFEST_SHA256.csv` (bytes y SHA de todos los miembros salvo propio manifiesto). Validar CRC y hashes de cada entrada, y SHA del ZIP por fuera. Un solo ZIP; no repartir 20 archivos sueltos. Exigir PRE/POST de WIP y APK (incluye untracked focal) y reportar cualquier cambio inesperado. No incluir serial, fotos, bases, URI/tokens, archivos `*.env`, logs raw, reportes de comandos sin sanear ni nombre privado innecesario.

```text
TASK=JOR-H9-C2-PHYSICAL-DART-V5-20261120
RESULT=PASS_NATIVE_SUBSET|PARTIAL|ALREADY_EXECUTED_NEEDS_DIRECTOR|BLOCKED_WIP_COLLISION|BLOCKED_DRIVER_PARITY|BLOCKED_HOST_PRIVACY|BLOCKED_OFFLINE_HOST|BLOCKED_ARTIFACT|BLOCKED_DEVICE|BLOCKED_PACKAGE|BLOCKED_VM_SERVICE_POLICY|BLOCKED_VM_SERVICE|BLOCKED_INSTALL|BLOCKED_DIRECT_DRIVER_CONNECT|FAIL_TEST
SOURCE_BRANCH=<real>
SOURCE_HEAD=<real>
WIP_PRESERVED=YES_FOCAL|PARTIAL_EVIDENCE|NO
APK_SHA256=<real|NOT_AVAILABLE>
HOST_PRIVACY=PASS|BLOCKED
PID_ONLY_LOGCAT=PASS|BLOCKED|NOT_RUN
INSTALL=PASS_NEW_PACKAGE|FAIL|NOT_RUN
DART_DIRECT=PASS|FAIL|NOT_RUN
CIPHER_ENGINE=PASS_PHYSICAL|FAIL_PHYSICAL|INCONCLUSIVE|NOT_RUN
KEYSTORE_EFFECTIVE=PASS_NATIVE_SCOPED|PLUGIN_PATH_PASS_ONLY|FAIL_PHYSICAL|INCONCLUSIVE|NOT_RUN
IDEMPOTENCY_NATIVE=PASS_PHYSICAL|FAIL_PHYSICAL|INCONCLUSIVE|NOT_RUN
CORRUPTION_FAIL_CLOSED=PASS_COPY_SCOPED|FAIL_PHYSICAL|INCONCLUSIVE|NOT_RUN
RESTART_READBACK=PASS_NEW_PROCESS|BLOCKED_HARNESS|FAIL|NOT_RUN
TENANT_ISOLATION_ANDROID=BLOCKED_CONTRACT
PRO_HTTP_DB=BLOCKED_CONTRACT
BRIDGE_REFERENCE_STALE=YES|NO|NOT_CHECKED
BACKEND_B21F_S3=REUSED_PASS_SCOPED_158_2450_NOT_RERUN
H9_M1_HOST=REUSED_PASS_75_NOT_RERUN
F1_WIDGET=REUSED_PASS_FOCAL_NOT_RERUN
H9_GLOBAL=NO_GO
B22=NOT_AUTHORIZED
RELEASE=NO_GO
ZIP_PATH=<unico_zip>
ZIP_SHA256=<real>
NEXT_OWNER=CHATGPT_DIRECTOR
```

**STOP sin ping-pong:** si falla privacidad/offline/artefacto, nunca instalar; si falla teléfono/VM/conexión, no reinstalar ni saltar de driver; devolver el ZIP y causa concreta. No crear V6 ni otra arquitectura por iniciativa propia. Después del ZIP, la dirección vuelve a ChatGPT. **No tienes que pedirle al propietario que ejecute pruebas locales.**

# 🔴🚨 SIGUE CODEX LUNA — V5 MACROBLOQUE ÚNICO. DESPUÉS DEL ZIP: CHATGPT DIRECTOR. 🚨🔴