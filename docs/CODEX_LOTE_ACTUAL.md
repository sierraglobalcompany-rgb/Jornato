# CODEX LUNA — JORNATO · N2 MACROBLOQUE ÚNICO · RECUPERAR SDK EXISTENTE Y CERTIFICAR KIOSCO OFFLINE EN HOST

**ORDEN ÚNICA PARA EJECUTAR. NO AUDITES EL PROMPT; TRABAJA.** ChatGPT Director adjudicó el ZIP N1-R2 y esta N2 **reemplaza** la orden N1-R2 como ejecutable. No repetir N1-R2, C2 V3/V4/V5, B17/B21F, H9-M1/F1 ni otras auditorías. Si N2 ya se ejecutó o hay agente modificando el mismo WIP, STOP y devuelve solamente evidencia vigente. Director = ChatGPT; ejecutor local = Codex Luna.

```text
TASK=JOR-N2-SDK-RECOVERY-HOST-GATE-20261120
WIP=D:\codex\Jornato
N1R2_OUTPUT=D:\codex\_REPORTES\Jornato\JOR-N1-R2-CUSTODIA-KIOSCO-OFFLINE-20261120
N2_OUTPUT=D:\codex\_REPORTES\Jornato\JOR-N2-SDK-RECOVERY-HOST-GATE-20261120
N1R2_ZIP_SHA256=5EACC3643A00D0EC338E1EB62698A1B4AEA88C957FD3B113C0BF25B394E61540
SOURCE_BRANCH_REPORTED=codex/jor-b08-h4-domain-20261025
SOURCE_HEAD_REPORTED=faf5fe283191f8b5a2724b397009512a2caec1b6
EXPECTED_HISTORICAL_FLUTTER=3.47.8
EXPECTED_HISTORICAL_DART=3.13.7
QA_PACKAGE_ALREADY_INSTALLED_REPORTED=com.sierraglobalcompany.jornato.b14qa
NEXT_OWNER_AFTER_ONE_ZIP=CHATGPT_DIRECTOR
RELEASE=NO_GO
```

## 1. Evidencia que se acepta y NO se repite

1. **N1-R2 termina `PARTIAL_WITH_GAPS`, NO PASS funcional.** ZIP de 10 archivos: 10/10 CRC, 9/9 manifest SHA y tamaño; seis rutas focales ya estaban `??` antes de editar. Codex informa 216 fuentes autorizadas copiadas a snapshot privado en D: (2.904.617 bytes), muestra 5/5 restaurada, WIP 234 estados (223 untracked, 11 modificados, 0 staged), índice igual. Es **custodia focal en el mismo disco**, NO respaldo integral ni fuera del dispositivo. No volver a copiar 216 archivos si la evidencia privada sigue íntegra.
2. Cambios pendientes **sin prueba ejecutada**: acciones nocturnas hasta fin programado de turno; acumulado local marcado provisional/referencial; pruebas host nuevas de límite nocturno, reapertura SQLite y tarjeta de acumulado. N1-R2 seleccionó siete archivos y 73 declaraciones; `0 PASS/0 FAIL/NOT_RUN`. El ZIP **NO incluye código/diff**; la única fuente de código es el WIP privado y su `N1R2_OUTPUT\private`. No inferir éxito de un informe.
3. Contradicción del entorno que debes resolver **sin instalar nada**: en C2 V5 `RESULTS.csv` se registró `A2_sdk=PASS` (Flutter 3.47.8, Dart 3.13.7) y `A5_offline_compile=PASS` con package config existente, mientras N1-R2 registra ejecutables `NOT_FOUND` en PATH y rutas estándar inspeccionadas. **No afirmes que es el mismo proceso/máquina ni que el SDK se borró.** Buscar la **procedencia y ubicación** que usó C2 V5, usando registros autorizados locales.
4. PR #3 F0 sigue siendo comparación histórica read-only; no importar sus módulos: el WIP avanzado tiene propietarios propios. No volver a comparar los 20 archivos si no cambió el HEAD remoto. El puente antiguo del PR2 apunta a otro SHA y no es una orden de merge.

## 2. Prohibiciones y leyes

- Mantén L1 KISS/Ponytail: **un solo motor de turnos, el almacén local ya aprobado**; L2 sin suites/auditorías repetidas; L3 corregir causa real, no maquillaje; L4 UX comprensible; L5 evidencia reproducible por SHA; L6 una ejecución, un ZIP, vuelta al Director.
- **Teléfono absolutamente intocable**: NO `adb`, AVD, PID/logcat, `flutter run/drive`, install, remove, `pm clear`, reabrir APK, forwards, red Pro ni datos reales. El QA instalado en C2 V5 debe permanecer como quedó. No usar Android para compensar falta de SDK host.
- **No modificar Git ni publicarlo**: prohibidos `git add/commit/push/pull/fetch/merge/rebase/reset/stash/checkout/clean` y Actions. Sí consultas locales read-only. No tocar main/PR1/PR3, ni publicar WIP privado en GitHub público. No asumir permisos de negocio OD01-OD08 ni abrir B22.
- **Cero descargas, nuevas instalaciones, cambios de PATH global, Flutter upgrade, pub get online, SDK Flutter/Android nuevo, Docker o herramientas pagas**. No tocar otros proyectos, contenedores, datos, servicios ni carpetas privadas ajenas. Si no existe toolchain verificable, detente con un bloqueo técnico preciso, no inventes ambiente ni conviertas esto en otra ronda de arquitectura.
- Sólo ficheros de **esta vertical** y tests vecinos en WIP. Todo diff, copia, source, manifest de rutas, y evidencias crudas quedan en `N2_OUTPUT\private` sin entrar al ZIP.

## 3. PRE — custodia y no concurrencia (una comprobación focal)

1. Confirmar un único WIP y ausencia de ejecución simultánea. Registrar rama, HEAD, status 234 histórico sin exigir igualdad automática, índice y staged; identificar diferencias nuevas. Buscar una entrega **N2 posterior**: si existe y es válida no repetir. Hacer inventario SHA **solo** de las seis rutas focales de N1-R2 (consultarlas desde `private` y `KIOSK_VERTICAL_MATRIX.csv`, no adivinar nombres) y de los siete tests. Comparar con hash POST privado N1-R2; detener edición si hubo cambios ajenos no conciliables (`BLOCKED_CONCURRENT_WIP`).
2. Confirmar existencia y acceso de `N1R2_OUTPUT\private\snapshot_*`, inventario e informe de restauración muestral. **Reutilizar** integridad focal y registrar alcance. No crear segundo backup amplio. Antes de *cualquier* modificación adicional, conservar PRE exacto de archivos afectados bajo `N2_OUTPUT\private\before_changes`, junto con SHA, sin copiar secretos. `OFF_DEVICE_BACKUP=NO` sigue fijo. Si no se puede proteger un archivo candidato: `BLOCKED_CUSTODY` y sin editar.
3. El ZIP recibido N1-R2 **no demuestra por sí mismo la corrección**; fuente, diff y tests viven sólo en Windows. Verificar que los cambios locales efectivamente contienen los comportamientos reportados y registrar SHA. No declarar `PASS_HOST` por análisis estático.

## 4. A — localizar **una vez** el Flutter/Dart que antes funcionó

Este es el único bloqueo de infraestructura que vale la pena perseguir en N2. Realiza un **preflight limitado y causal**, sin búsqueda recursiva de todo `C:\` o `D:\`:

1. Pistas exactas, **en este orden**: `Get-Command flutter,dart -ErrorAction SilentlyContinue`, `where.exe flutter`, `where.exe dart`, `$env:FLUTTER_ROOT`, PATH del proceso; `WIP\android\local.properties` (`flutter.sdk`); `WIP\.dart_tool\package_config.json` y su referencia a paquetes Flutter; configuración Flutter del IDE/repositorio si existe; reportes **locales** C2 V5 en `D:\codex\_REPORTES\Jornato\JOR-H9-C2-PHYSICAL-DART-V5-20261120` (especialmente `private`, SDK/kernel o log A2/A5) y el antecedente de compilación del APK `app-b14qa-debug.apk` (`gradle`/script reportado). Las rutas de privacidad sólo se usan para resolver el ejecutable; **no copiarlas al ZIP**.
2. Para cada candidato derivado de estas pistas, **verificar existencia**, tipo de archivo, versión/cache sin actualizar: `<flutter-root>\bin\flutter.bat` y `<flutter-root>\bin\cache\dart-sdk\bin\dart.exe`. Evitar ejecutar versiones no identificadas y no alterar SDK de otro proyecto. Un `flutter --version` o `dart --version` se ejecuta **una vez como máximo** tras validar que no activará descargas automáticas; si hay riesgo de bootstrap/descarga, clasificar `BLOCKED_SDK_CACHE` y no ejecutar. No cambiar PATH permanente: invocar rutas absolutas verificadas sólo dentro del proceso Codex actual.
3. Verificar `pubspec.lock`, `.dart_tool\package_config.json`, caché de paquetes y que el SDK tiene dependencias de la vertical accesibles offline. **No ejecutar `flutter pub get` ni instalar paquetes para recuperar el entorno**. Si hace falta materializar cache, solicitar autorización en otro lote; no improvisar.
4. Emitir una conclusión causal, no genérica: `SDK_FOUND_COMPATIBLE` (versión y cache), `SDK_FOUND_INCOMPLETE`, `SDK_VERSION_MISMATCH`, `SDK_PATH_NOT_RECOVERED`, `SDK_HOST_DIFFERENT_UNDETERMINED`, o `BLOCKED_SDK_CACHE`. Informar **qué pista fue útil y cuáles fallaron** sin incluir rutas personales sensibles. Si no recuperas el SDK, ve directamente a sección 7: un ZIP único de bloqueo con la receta exacta de recuperación/permiso necesario. **No repetir búsquedas ni inventar más trabajo**.

## 5. B — ejecutar la QA host faltante (únicamente con SDK offline verificable)

Los siete archivos pendientes son, literalmente:

```text
test/attendance_test.dart
test/attendance_repository_test.dart
test/kiosk_repository_test.dart
test/kiosk_time_test.dart
test/attendance_report_test.dart
test/kiosk_employee_today_card_test.dart
test/widget_test.dart
```

1. Asegurar fuente no concurrente, fixture sintético, cache y `package_config.json` válidos. Primero comprobar formato de los **seis archivos focales** con `dart format --output=none --set-exit-if-changed` si la versión instalada soporta exactamente esos flags (no emitir ficheros); luego análisis estático focal `flutter analyze --no-pub` con objetivos soportados por esa CLI. Si el CLI no permite alcance por rutas, un único analyze de proyecto es una comprobación de **cambios N1-R2**, no repetición automática de QA vieja. Guardar exit/status/ruta/snapshot SHA; no llamar `pub get`.
2. Ejecutar **una sola campaña** de `flutter test --no-pub` sobre exactamente los siete tests host (en una invocación si el CLI acepta varias rutas, o individualmente, una vez cada uno si no). No seleccionar `integration_test`, device, ni emulador. Límite de tiempo por test/campaña, capturar salida sanitizada y códigos de retorno. Registrar **conteo real ejecutado**, no inferir 73 PASS de 73 declaraciones.
3. Si falla por **causa de producto demostrada**, preservar PRE exacto, corregir **todos los fallos relacionados de la misma causa** en la clase propietaria (jornada nocturna, consolidación referencial o persistencia/reapertura), más test vecino. Una campaña de corrección y una de regresión final focal de los mismos siete tests, no 10 ciclos. No añadir segundo motor, nueva DB, nuevos paquetes, servidor, sincronización o contratos. Si la causa es cache/harness, no editar producto.
4. Validaciones semánticas que deben tener oráculo observable: antes del fin nocturno funcionan pausa/reanudar/salida según contrato; en el límite exacto y después ya no se apropia una jornada anterior; fecha de servicio estable; entrada futura/no cronológica no crea evento; idempotencia y conflicto se rechazan según motor; SQLite close/reopen conserva mismo ID/estado en host; acumulado excluye pausas y está rotulado **referencial/provisional**, no nómina. No afirmar SQLCipher/Keystore Android desde SQLite FFI.
5. Resultado: `HOST_GATE=PASS_SCOPED` sólo si formato/análisis/pruebas corridas pasan para los SHAs finales; `FAIL_HOST_PRODUCT` para fallos demostrados no corregidos; `BLOCKED_LOCAL_TOOL` si el SDK sigue ausente; `BLOCKED_DEPENDENCIES` si caches insuficientes. Registrar qué pruebas se ejecutaron y qué quedó sin cubrir.

## 6. C — preparar la salida hacia integración (sólo metadata, sin mover código)

Si `HOST_GATE=PASS_SCOPED`, en la misma ejecución producir **una matriz mínima de promoción**: seis archivos focales, estado tracked/untracked, hash POST y propietario; inventario de prerequisitos para un backup **fuera del disco** y revisión de secretos antes de integrar WIP con GitHub, PR3 como referencia histórica sin merge. No versionar aún, no copiar private ni tocar PRs. Declarar claramente que host PASS no aprueba app Android, QA SQLCipher o lanzamiento.

Si hay bloqueo de SDK, NO reabrir PR3 ni repetir la custodia N1-R2 para “llenar” el lote. Presentar una instrucción de desatasco precisa al Director: qué instalación/caché faltó, qué artefacto previo lo contradice, y qué autorización mínima sería necesaria si no existe ya herramienta local.

## 7. Entrega — UN ZIP sanitizado, terminal inequívoca

Crear en `N2_OUTPUT\delivery\JOR-N2-SDK-RECOVERY-HOST-GATE-20261120-UNICO.zip`, sin sobrescribir otra entrega, con **lista positiva**:

- `FINAL_REPORT.md`: fuentes directas vs reportadas, estado de 7 tests, efectos sobre WIP, gate y NEXT.
- `SDK_PROVENANCE.md`: pistas revisadas, resultado, versiones verificadas, por qué V5 sí y N1-R2 no; **no rutas privadas detalladas ni tokens**.
- `HOST_RESULTS.csv`: test/ruta, SHA fuente, ejecutado SÍ/NO, count real PASS/FAIL, comando y exit, log sanitizado.
- `KIOSK_GATE_MATRIX.csv`: nocturnos, acumulado, SQLite reopen, negativos, UI y límite offline, con estado probado/no probado.
- `WIP_DELTA_SUMMARY.csv`: sólo rutas relativas autorizadas, tracked/untracked, hash PRE/POST **sin contenido privado**; si la ruta pudiera revelar secretos, resumir categoría y no mostrarla.
- `NEXT_GATE_MATRIX.md`: siguiente puerta real, ni B22 ni Android reutilizado ficticiamente.
- `BLOCKERS.md` sólo cuando aplique; logs host sanitizados si se ejecutó; `MANIFEST_SHA256.csv` (bytes y hash SHA de todos los demás miembros).

**Prohibido meter:** snapshot, `private`, patch/diff, código WIP, APK, DB, archivos `.env`, keystore, serial/IMEI, información de empleados, tokens, URI VM, rutas de usuario detalladas o logs crudos. ZIP sin entradas repetidas, traversal, symlinks; CRC completo, 100% hash + bytes y SHA externo de ZIP. Comprobar apertura de ZIP. Los backups privados siguen fuera del ZIP y en el mismo disco; `OFF_DEVICE_BACKUP=NO`.

```text
TASK=JOR-N2-SDK-RECOVERY-HOST-GATE-20261120
RESULT=PASS_HOST_SCOPED|PARTIAL_WITH_GAPS|BLOCKED_LOCAL_TOOL|BLOCKED_DEPENDENCIES|FAIL_HOST_PRODUCT|BLOCKED_CUSTODY|BLOCKED_CONCURRENT_WIP|SUPERSEDED
SDK=SDK_FOUND_COMPATIBLE|SDK_FOUND_INCOMPLETE|SDK_VERSION_MISMATCH|SDK_PATH_NOT_RECOVERED|SDK_HOST_DIFFERENT_UNDETERMINED|BLOCKED_SDK_CACHE
N1R2_SOURCE_BASELINE=UNCHANGED|CHANGED_WITH_EVIDENCE|BLOCKED
SOURCE_BRANCH=<observado>
SOURCE_HEAD=<observado>
WIP_STATUS_PRE_POST=<conteo>
STAGED_PRE_POST=<conteo>
HOST_TARGETED_TESTS=<n_pass/n_fail/n_not_run, prueba por ruta>
HOST_ANALYZE=PASS|FAIL|NOT_RUN
HOST_FORMAT=PASS|FAIL|NOT_RUN
KIOSK_HOST_GATE=PASS_SCOPED|PARTIAL_WITH_GAPS|BLOCKED
OFF_DEVICE_BACKUP=NO
ANDROID_NATIVE=NOT_RUN
H9_GLOBAL=NO_GO
B22=NOT_AUTHORIZED
RELEASE=NO_GO
ZIP_PATH=<una ruta real>
ZIP_SHA256=<hash real>
NEXT_OWNER=CHATGPT_DIRECTOR
```

**Cierre anti-pingpong:** si SDK apareció, **ejecuta las siete pruebas en este mismo lote** y corrige sus fallos reales relacionados; no pidas otro prompt intermedio. Si SDK no apareció, **un único STOP verificable**, no reintentar variaciones ni rehacer N1-R2. Después del ZIP sólo continúa ChatGPT Director.

# 🔴🚨 SIGUE CODEX LUNA — N2 · RECUPERA SDK EXISTENTE Y EJECUTA PRUEBAS HOST, SIN TOCAR EL TELÉFONO. 🚨🔴