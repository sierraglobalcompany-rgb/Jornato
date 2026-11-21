# CODEX LUNA — JORNATO · N2-R1 · MACROBLOQUE ÚNICO Y FINAL DE VALIDACIÓN HOST

> **EJECUTA LA ORDEN; NO HAGAS OTRA AUDITORÍA DEL PROMPT.** Esta es **la revisión correctiva de N2**, NO N3 ni un nuevo subsistema. Conserva el mismo `TASK` y el mismo directorio N2 de entrega. Reemplaza la N2 anterior **solo si Codex no la empezó y no existe una entrega N2 más reciente**. Si existe una ejecución/ZIP N2 o cambios concurrentes, DETENTE: no ejecutar en paralelo, no sobrescribir ni volver a probar; devolver la evidencia al Director. El resultado se entrega **ahora** en un solo ZIP.

```text
PROJECT=JORNATO
DIRECTOR=CHATGPT
EXECUTOR=CODEX_LUNA
TASK=JOR-N2-SDK-RECOVERY-HOST-GATE-20261120
PROMPT_REVISION=N2-R1_20261120
WIP=D:\codex\Jornato
N1R2_OUTPUT=D:\codex\_REPORTES\Jornato\JOR-N1-R2-CUSTODIA-KIOSCO-OFFLINE-20261120
N2_OUTPUT=D:\codex\_REPORTES\Jornato\JOR-N2-SDK-RECOVERY-HOST-GATE-20261120
ZIP_NAME=JOR-N2-SDK-RECOVERY-HOST-GATE-20261120-UNICO.zip
SOURCE_BRANCH_REPORTED=codex/jor-b08-h4-domain-20261025
SOURCE_HEAD_REPORTED=faf5fe283191f8b5a2724b397009512a2caec1b6
HISTORICAL_FLUTTER=3.47.8
HISTORICAL_DART=3.13.7
N1R2_ZIP_SHA256=5EACC3643A00D0EC338E1EB62698A1B4AEA88C957FD3B113C0BF25B394E61540
C2V5_ZIP_SHA256=711116067DDBF73E7CE4AD6A102D58E14AD5372D79A981F48978C54A76B35692
EXPECTED_QA_ANDROID_PACKAGE=com.sierraglobalcompany.jornato.b14qa
OWNER_AFTER_ZIP=CHATGPT_DIRECTOR
ANDROID_NATIVE=NOT_RUN
H9_GLOBAL=NO_GO
B22=NOT_AUTHORIZED
RELEASE=NO_GO
```

## 0. Contrato y resultados ya cerrados: leer y NO repetir

Jornato es sistema de jornada y asistencia para empresas. Objetivo inmediato: recuperar **una toolchain host existente y válida**, probar los seis archivos fuente/test corregidos por N1-R2 mediante **siete archivos de pruebas host**, corregir en una misma campaña los fallos reales relacionados, y devolver una decisión atribuible a SHA. Objetivo ulterior: integración segura del WIP y lanzamiento, NO pruebas Android en este lote.

- N1-R2 terminó `PARTIAL_WITH_GAPS`: cambios de turno nocturno hasta fin planificado y acumulado local provisional/referencial **escritos, no ejecutados**; 73 declaraciones seleccionadas en siete archivos, **cero pruebas corridas**. ZIP de 10 miembros, CRC 10/10, manifiesto 9/9, SHA256 indicado arriba. No repetir sus cambios por apariencia.
- N1-R2 reportó snapshot privado en D: de 216 archivos (2.904.617 bytes) y restauración muestral 5/5; 234 entradas WIP (223 untracked/11 tracked modificadas), staged 0, seis rutas editadas previamente `??`. **No es respaldo fuera del equipo**. Reutilizar snapshot si conserva integridad; no repetir la copia masiva.
- C2 V5, en `RESULTS.csv`, reportó `A2_sdk=PASS` (Flutter 3.47.8 y Dart 3.13.7) y `A5_offline_compile=PASS` con package config existente. N1-R2 no localizó esos ejecutables en PATH ni sitios comunes. **No sabemos que ambas tareas usaran el mismo host/entorno**: no asumir que el SDK está en esta máquina ni que se perdió. Resolver solo procedencia y ruta de manera limitada.
- Se informó paquete QA Android instalado; C2 quedó bloqueado por URI de VM Service; cuatro oráculos nativos NOT_RUN. **NO teléfono/ADB/AVD, no Flutter drive/run, no red Pro, no reinstalar ni reabrir Activity.** Backend B21F-S3 158/2450 scoped, H9-M1 75 host y F1 widget PASS focal son evidencia histórica distinta. No rehacerla.
- PR #2 GitHub es **solo documentación**; PR #3 F0 es Draft y distinto del WIP avanzado. No copiar ni mezclar PR3. Los contratos `requestId` y legado `requetId`, `SERVER_STORED` frente a `RECOGNIZED`, B19/B20 deny-all y OD01–OD08 no autorizadas permanecen fijos.

**Seis leyes:** L1 KISS/Ponytail (un motor/un almacén), L2 antirruido, L3 corrección de causa propietaria, L4 UX humana, L5 pruebas atribuidas a SHA, L6 una campaña/un ZIP. Sin frameworks, scripts de auditoría innecesarios, cambios de arquitectura, nuevos motores, migraciones ni servicios.

## 1. STOP y protección de WIP antes de hacer nada

**PROHIBIDO**: `git add/commit/push/pull/fetch/merge/rebase/reset/stash/checkout/clean`, GitHub Actions, `pub get` online, `flutter upgrade`, `flutter precache`, SDK nuevo, installers, paquetes de pago, Docker, mutaciones de PATH global, celulares/ADB/AVD, cambios en otros proyectos, acceso a cuentas/DB reales o red Pro. Permitidos Git **solo lectura** (`status/diff/rev-parse/cat-file`) y consulta a archivos locales de este WIP y a los reportes autorizados.

1. Confirmar `D:\codex\Jornato` como WIP correcto y que **no hay otro agente editándolo**. Validar branch/HEAD reales, `git status --porcelain=v1 -uall`, índice y staged; el estado histórico 234/0 es orientación, NO condición de igualdad. Revisar `N2_OUTPUT\delivery` y resumen de ejecuciones N2: si existe **cualquier ZIP N2 válido posterior o tarea N2 en vuelo**, no crear otra ejecución ni sobrescribir; devolver `SUPERSEDED_BY_EXISTING_N2` con identificación de entrega. No iniciar lote paralelo.
2. Identificar las **seis rutas focales reales** a partir del manifiesto PRE/POST privado de N1-R2 y el `KIOSK_VERTICAL_MATRIX.csv`, nunca adivinar su lista; además los siete tests del §4. Guardar listado privado con ruta relativa, existencia, tipo tracked/untracked, bytes+SHA256 PRE; comprobar que los hashes de referencia y snapshots N1-R2 siguen disponibles. Si hay modificación concurrente o faltan fuentes privadas indispensables, `BLOCKED_BASELINE` y no editar. **No repetir 216 archivos de snapshot.**
3. Salidas: `N2_OUTPUT\private` para oráculos crudos, backups PRE/diffs y referencias sensibles; `N2_OUTPUT\delivery` para **solo un ZIP con metadatos sanitizados**. Directorios reales, fuera del WIP y sin junctions/symlinks; no borrar nada ajeno. Rechazar falta de espacio o colisión de entrega.
4. Antes de editar **cualquier** archivo, crear bajo `private\before_changes` su PRE exacto + SHA y comprobarlo. No modificar `pubspec.yaml`, `pubspec.lock`, esquemas de DB, dependencias, contratos, Flutter SDK ni código ajeno por perseguir un PASS.

## 2. PRE-FLIGHT causal: localizar el SDK EN ESTE HOST sin descarga

**Una pasada por pista, dos como máximo por candidato derivado. Sin búsquedas recursivas de todo C: o D:.** No publicar usuario, nombre del equipo, rutas absolutas personales, IMEI ni tokens.

1. Consultas de bajo costo en el siguiente orden: `Get-Command flutter,dart -ErrorAction SilentlyContinue`, `where.exe flutter`, `where.exe dart`, `$env:FLUTTER_ROOT`, PATH del **proceso actual**; lectura de `WIP\android\local.properties` (valor `flutter.sdk`, no exportar), `.dart_tool\package_config.json`, rutas de paquetes Flutter/Dart, IDE config que ya esté en WIP; después reportes **exactos de C2 V5** (`RESULTS.csv`, manifiesto y archivos privados autorizados) y logs de compilación QA con rutas si las contienen; finalmente rutas raíz conocidas **solo si aparecen explícitas en esas pistas**. No escanear otros proyectos. Registrar pista→candidato→resultado en privado; al ZIP solo categoría y estado.
2. Distinguir **procedencia de entorno**: ¿el `A2_sdk=PASS` de C2 se ejecutó en la misma instalación/host que N1-R2? Cotejar únicamente evidencias no sensibles de roots de workspace, version stamps y artefactos; si no hay prueba, clasificar `HOST_PROVENANCE_UNDETERMINED`, no inventar que se desinstaló Flutter.
3. Para candidato concreto, validar **sin ejecutarlo aún**: `bin\flutter.bat`, `bin\cache\dart-sdk\bin\dart.exe`, `bin\cache\flutter_tools.snapshot` (si esta versión lo utiliza), `bin\internal\engine.version`, `bin\cache` y artefactos necesarios para tester host. Usar el SDK como **ruta absoluta solamente en el proceso local**, no alterar PATH permanente ni variables del sistema. `dart.exe --version` es preferible para verificar Dart cuando el archivo existe y es confiable; NO correr `flutter --version`, analyze o test todavía si puede inicializar/descargar caché.
4. **RIESGO CONFIRMADO EN FUENTE FLUTTER 3.47.8:** `flutter ... --no-pub` impide `pub get`, pero `FlutterCommand._updateCacheAndRunPubGet()` puede llamar a `cache.updateAll()` **antes** de decidir si corre pub. Por eso `--no-pub` **NO garantiza cero descargas**. Inspeccionar de forma read-only los artefactos y stamps de caché que el Flutter local requiere para `test`/`analyze`; si faltan, no lanzar Flutter CLI y devolver `BLOCKED_CACHE_ARTIFACTS`, sin hacer `flutter precache`, bootstrap ni tocar red. Si se puede comprobar que están completos, avanzar; si la comprobación no es concluyente y podría disparar descarga, **STOP de CLI** con `SDK_RUNTIME_POLICY_UNVERIFIED`, no experimentar.
5. Validar sin mutar: el `pubspec.lock` y `.dart_tool\package_config.json` existen, rutas `rootUri`/`packageUri` de paquetes requeridos por los siete tests resuelven a carpetas existentes y no a otro workspace, SDK Flutter/Dart compatible con lock, `PUB_CACHE` actual reutilizable, y dependencias nativas de test host (SQLite FFI DLL/binario) presentes. **No correr `flutter pub get`, `dart pub get`, reparación de caché ni descarga.** Clasificación precisa: `SDK_LOCAL_COMPATIBLE`, `SDK_NOT_LOCATED_ON_THIS_HOST`, `SDK_VERSION_MISMATCH`, `SDK_CACHE_INCOMPLETE`, `PACKAGE_CONFIG_STALE`, `HOST_NATIVE_DEPENDENCY_MISSING` o `SDK_RUNTIME_POLICY_UNVERIFIED`.
6. Si no puedes habilitar **ejecución host realmente offline** después de estas pistas, **no editar código** ni pedir N2-R2; terminar con un solo ZIP de bloqueo. Informar si falta ruta de SDK, root de package config, artefacto de caché o dependencia host y un único permiso/insumo mínimo para un lote futuro. La evidencia anterior de C2 no sustituye pruebas en este host.

## 3. Guardia de seguridad del test host (ANTES de ejecutar)

1. Verificar por lectura de los **siete archivos de test concretos** y sus inicializadores que operan con datos sintéticos y no conectan servidores reales, servicios remotos, cuentas de empleados, backups reales, producción ni unidades ajenas. Verificar que SQLite FFI y archivos temporales apuntan a un directorio temporal de prueba bajo control; **no usar ni sobrescribir bases existentes**. Si un test no se puede aislar, marcar **solo ese test** `BLOCKED_FIXTURE_ISOLATION`, ejecutar únicamente los restantes seguros, no modificar arquitectura para hacerlo pasar. Un test que importe harness `integration_test` o invoque dispositivo no es test host autorizado.
2. Confirmar que las pruebas no requieren permisos o dispositivos. El SDK Flutter `test` debe recibir **únicamente rutas bajo `test/`**, sin `integration_test/`. CLI host no equivale a C2 Android. Ningún test debe hacer HTTP real; no se acepta prueba que exija habilitar red.
3. Crear baseline de archivos WIP focales y contador de archivos generados esperados antes de la CLI; flutter test/analyze pueden generar artefactos en `.dart_tool`/`build` aun con `--no-pub`, por lo que no confundir esos temporales con cambios de código. No ejecutar `git clean` ni borrar cachés para «volver al baseline». Toda mutación inesperada fuera del alcance debe detener **nuevas ediciones** y documentarse.

## 4. Una única campaña de formato, análisis y siete tests host

**EXACTAMENTE estos siete archivos, salvo test cuya guarda de aislamiento impida ejecutarlo (registrar bloqueo individual):**

```text
test/attendance_test.dart
test/attendance_repository_test.dart
test/kiosk_repository_test.dart
test/kiosk_time_test.dart
test/attendance_report_test.dart
test/kiosk_employee_today_card_test.dart
test/widget_test.dart
```

1. Registra SHA PRE para todos los tests, fuentes foco e inicializadores usados. `dart format --output=none --set-exit-if-changed` **solo con los seis archivos focales existentes que sean Dart** y si esas opciones corresponden a la versión instalada; no reescribe. Si ya están formateados, PASS de formato; si no, preservar PRE y permitir arreglo focal junto con fallos reales (NO formatear el proyecto entero).
2. Ejecutar **una vez** `flutter analyze --no-pub` solamente después de las barreras cache/offline. Si soporta paths focales que preserven el análisis correcto, pasar fuentes/tests foco; si necesita analizar proyecto completo, una ejecución y distinguir diagnósticos antiguos fuera de alcance de errores atribuibles a SHA N1-R2. **No corregir errores históricos no vinculados**, y no etiquetar como PASS global si hubo fallos ajenos. Anotar `ANALYZE_FOCAL=PASS|FAIL_NEW|BLOCKED_PREEXISTING|NOT_RUN`.
3. Con la CLI ya autorizada, una ejecución de `flutter test --no-pub` nombrando los siete archivos (puede aceptar varias rutas, confirmado en código de Flutter 3.47.8; no usar por defecto carpeta `test/` completa). Si la CLI instalada exige uno por uno, ejecutar **cada archivo una sola vez**; no duplicar suites. Establecer supervisor con timeout razonable de **20 minutos para toda la campaña** y, si son procesos por archivo, máximo **5 minutos por archivo**; cancelar **solo los procesos propios** bajo control del supervisor, no matar otros servicios. La salida cruda queda privada con acceso restringido o en memoria; escribir al ZIP solo extracto sanitizado sin rutas personales, tokens, datos, código privado ni secretos. Registrar test path, ejecutado SÍ/NO, **número de casos realmente PASS/FAIL/SKIP según output**, exit, SHA fuente y cobertura. 73 declaraciones ≠ 73 PASS.
4. Separar **tipos de fallas**, sin maquillajes: `FAIL_PRODUCT` (aserción semántica de jornada/persistencia), `FAIL_TEST_HARNESS` (test/fixture defectuoso), `BLOCKED_CACHE`, `BLOCKED_SQLITE_NATIVE`, `FAIL_STATIC_NEW`, `FAIL_PREEXISTING_UNRELATED`, `TIMEOUT`, `PASS_SCOPED`. No corregir el producto por carencia de DLL, cache, SDK o una prueba host que se conecta a algo prohibido.
5. Si hay fallos propios del **mismo flujo ya modificado**, corregir **en una campaña** causa raíz en sus clases propietarias y tests vecinos, reutilizando motor, política, almacén y UI actuales: turno nocturno hasta hora planificada, fecha original de servicio, pausa/reanudar/cierre, salto de fin de ventana, no cronología/futuro/idempotencia, readback SQLite sintético tras close/reopen, acumulado de intervalos menos pausas y etiqueta provisional/referencial **sin cálculo de nómina**. No alterar contrato de empresa, roles, geolocalización, descuentos ni Pro. No añadir migración, dependencia, DB, motor, servidor ni pantallas nuevas. Preservar PRE y hash POST de cada archivo modificado.
6. Después de la corrección, **una única regresión final focal** sobre los tests afectados y sus vecinos de los siete; si el cambio afectó varias capas, repetir la selección completa de siete **una vez**, no crear 10 ciclos. Repetir formato/analyze focal de cambios. Ningún nuevo error por «hacer verde» el test: si persiste falla, reportar FAIL real y terminar el ZIP.
7. `HOST_GATE=PASS_SCOPED` **solo** cuando los siete tests autorizados fueron ejecutados y pasaron (no 73 declarados), formato/analyze atribuible a cambios PASS, dependencias offline y fixtures sintéticos verificados, sin fallos no resueltos de la vertical y con SHAs POST. Si hay cualquier test esencial bloqueado o error relevante, resultado `PARTIAL_WITH_GAPS`, `FAIL_HOST_PRODUCT` o `BLOCKED_DEPENDENCIES` según causa. **Host PASS no acredita SQLCipher real, Keystore Android ni durabilidad tras matar el proceso Android.**

## 5. Entrega: un ZIP de evidencias, no código privado

En `N2_OUTPUT\delivery\JOR-N2-SDK-RECOVERY-HOST-GATE-20261120-UNICO.zip` incluir **solo**:

- `FINAL_REPORT.md`: tabla de 7 archivos ejecutados/no ejecutados, decisiones reales y NEXT al Director; distinguir DIRECTO/REPORTADO/INFERIDO.
- `SDK_PROVENANCE.md`: tabla pista revisada→resultado y estado host vs C2 V5, sin rutas absolutas sensibles, explicación verificable de por qué `--no-pub` no basta, cache validado o bloqueo.
- `HOST_RESULTS.csv`: una fila por test archivo, conteos observados PASS/FAIL/SKIP, exit, SHA(s) de fuente afectada y categoría de fallo; logs sanitizados y CRC.
- `KIOSK_GATE_MATRIX.csv`: fecha de servicio/nocturnos, límite, pausas, idempotencia, SQLite reopen, acumulado, pantalla, offline, con estatus PROBADO/ESCRITO_NO_PROBADO/BLOQUEADO.
- `WIP_DELTA_SUMMARY.csv`: metadatos SHA PRE/POST de **solo** archivos autorizados; rutas relativas si no sensibles; staged PRE/POST y delta externo. No copiar diff.
- `NEXT_GATE_MATRIX.md`: una sola siguiente decisión (p. ej. custodia fuera de equipo/merge autorizado; o insumo mínimo de SDK), gates Android, tenant y release pendientes.
- `BLOCKERS.md` **solo** si corresponde, fragmentos mínimos de logs sanitizados; `MANIFEST_SHA256.csv` (todos los demás miembros con byte length+SHA256).

**NUNCA adjuntar:** source, snapshot privado, `.patch`, archivos `.env`, DB, APK, credenciales, token URI VM, logs crudos, nombres de empleados, datos personales, certificados ni contenido de otras apps. Rutas sensibles solo en `private`. Verificar ZIP sin traversal/symlink, duplicados, CRC de cada miembro, 100% tamaños+SHA de manifiesto, hash SHA256 externo y posibilidad de reabrirlo. No sobrescribir ZIP histórico. Guardar archivos de restauración privados donde ya existen, no copiar 216 fuentes otra vez.

```text
TASK=JOR-N2-SDK-RECOVERY-HOST-GATE-20261120
PROMPT_REVISION=N2-R1_20261120
RESULT=PASS_HOST_SCOPED|PARTIAL_WITH_GAPS|BLOCKED_LOCAL_TOOL|BLOCKED_DEPENDENCIES|FAIL_HOST_PRODUCT|BLOCKED_BASELINE|BLOCKED_CONCURRENT_WIP|SUPERSEDED_BY_EXISTING_N2
SDK=SDK_LOCAL_COMPATIBLE|SDK_NOT_LOCATED_ON_THIS_HOST|SDK_VERSION_MISMATCH|SDK_CACHE_INCOMPLETE|PACKAGE_CONFIG_STALE|HOST_NATIVE_DEPENDENCY_MISSING|SDK_RUNTIME_POLICY_UNVERIFIED
HOST_PROVENANCE=SAME_ENVIRONMENT_VERIFIED|DIFFERENT_ENVIRONMENT_VERIFIED|UNDETERMINED
WIP_BRANCH=<observado>
WIP_HEAD=<observado>
STATUS_PRE_POST=<conteos observados>
STAGED_PRE_POST=<conteos observados>
SOURCE_SHA_PRE_POST=<metadatos solo, privados completos>
HOST_FORMAT=PASS|FAIL|NOT_RUN
HOST_ANALYZE=PASS|FAIL_NEW|BLOCKED_PREEXISTING|NOT_RUN
HOST_TEST_FILES=7_EXPECTED/<n_executed>/<n_pass>/<n_fail>/<n_blocked>
HOST_TEST_CASES=<n_pass>/<n_fail>/<n_skip>_REAL_OBSERVED
HOST_GATE=PASS_SCOPED|PARTIAL_WITH_GAPS|BLOCKED
OFF_DEVICE_BACKUP=NO
C2_ANDROID_NATIVE=NOT_RUN
H9_GLOBAL=NO_GO
B22=NOT_AUTHORIZED
RELEASE=NO_GO
ZIP_PATH=<único archivo válido>
ZIP_SHA256=<hash calculado>
NEXT_OWNER=CHATGPT_DIRECTOR
```

**Finalización anti-pingpong:** N2-R1 no pretende «terminar Jornato» por una QA host. Si el SDK funciona, ejecutar y corregir dentro de esta MISMA campaña; luego Director autoriza la siguiente puerta de integración/QA Android, no un nuevo N2. Si falta SDK/caché, un único bloqueo atribuible y propuesta de insumo, no otra búsqueda infinita. La prioridad del siguiente lote es **custodia externa autorizada + integración del código avanzado** sin exponer secretos, y después Android, Pro, web, UX/UAT y release, cada uno con gates reales.

# 🔴🚨 SIGUE CODEX LUNA — EJECUTAR N2-R1 UNA SOLA VEZ; DESPUÉS DEL ZIP ÚNICO SIGUE CHATGPT DIRECTOR. 🚨🔴