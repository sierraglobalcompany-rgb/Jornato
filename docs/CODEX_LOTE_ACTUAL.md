# CODEX LUNA — JORNATO · A1 ÚNICO MACROBLOQUE PRODUCTIVO: APK QA ANDROID OFFLINE DESDE N5

> **EJECUTA ESTE BLOQUE, NO LO REAUDITES NI LO REDISEÑES.** ChatGPT Director decide; Codex Luna ejecuta en Windows. La prioridad cambió expresamente del runtime Docker al candidato Android offline. **N7-R1 ESTÁ CERRADO; el diagnóstico Docker Desktop NO ESTÁ AUTORIZADO.** Este documento es la única orden activa tras su publicación canónica, pero **si A1 ya está ejecutándose o hay ZIP A1 final, NO lanzar duplicado**: devolver ese resultado al Director.

```text
TASK=JOR-A1-ANDROID-OFFLINE-APK-QA-CANDIDATE-20261121
PROMPT_REVISION=A1-R1
RESULT=PASS_APK_QA_SCOPED|PARTIAL_WITH_GAPS|BLOCKED_ENV|FAIL_PRODUCT
WIP_ROOT=D:\codex\Jornato
N5_ROOT=D:\codex\_REPORTES\Jornato\JOR-N5-DOCKER-NONET-PUB-GATES-20261121
A1_ROOT=D:\codex\_REPORTES\Jornato\JOR-A1-ANDROID-OFFLINE-APK-QA-CANDIDATE-20261121
N5_ZIP_SHA256=162118EFD4260B97A425E969CB90C06C54A4CAA0003FEC82F2C68A2BD53E84CC
N5_CANDIDATE_FILE_COUNT=232;SERVER_FILES=150;APP_SIDE_FILES=82
N5_FLUTTER=PASS_CANDIDATE_SCOPED;KIOSK_TEST=9_PASS
N5_LOCK_SHA256=F515D69563850E8893A17585D8BAB57A8E6484E18CE1FEF4BDDC6BB836F83B34
H9_C2_QA_APK=OLD_ONLY;C2_VM_SERVICE=BLOCKED;PHONE_QA_INSTALLED=YES_REPORTED
PHP_SERVER=BLOCKED_DOCKER_RUNTIME;DOCKER_DIAGNOSTIC=NOT_AUTHORIZED
ANDROID_PHYSICAL=NOT_AUTHORIZED_IN_A1
OFF_DEVICE_BACKUP=NO;RELEASE=NO_GO;B22=NOT_AUTHORIZED
NEXT_OWNER=CHATGPT_DIRECTOR
```

## 0 — Gobierno obligatorio y alcance productivo

1. **Un objetivo medible:** generar **un APK QA debug nuevo**, a partir de los **archivos Android + Flutter del candidato N5 ya certificado en host**, en una copia A1 privada, **sin red**, y certificar identidad/firma/manifest del APK. No crear otro servidor ni reabrir Docker.
2. **No repitas:** N2 86 PASS host; N3 9+4 PASS; N4 paridad 232/232 (reportada); N5 79/79 Pub cache, `flutter pub get --offline --enforce-lockfile` PASS y 9/9 widget test del candidato; N6/7 diagnósticos PHP; ni auditorías 10+10, ni build del APK viejo C2. **Reejecuta prueba específica solo si hubo cambio causal en la copia A1.**
3. Mantén PingPongLaw L1 KISS; L2 sin ruido; L3 arreglar causa, no síntomas; L4 UX utilizable; L5 evidencia auditable; L6 evitar pingpong. No microservicios, wrappers nuevos, runners, scripts genéricos, ni matriz de 100 pasos. No inventes resultados.
4. **Alcance funcional real:** piloto Colombia de asistencia, eventos entrada/pausa/reanudar/salida, intervalos, turno nocturno y marca kiosk local. Gratis Local debe funcionar sin Laravel ni internet. Las funciones avanzadas Pro/tenant, roles delegados, GPS/selfie/nativa, restauración, cifrado/Keystore y permisos requieren sus propios gates; su presencia en fuente no es PASS. Ningún botón simula que una función bloqueada está aprobada.
5. **Prohibido tocar:** Docker Desktop, redes/volúmenes/containers, PHP, MariaDB, otras carpetas Codex; `main`, PR1, PR3; WIP con `git add/commit/push/reset/clean/stash/checkout/merge/pull/fetch`; SDK/Gradle/Pub global, variables de entorno persistentes, servicios Windows, firewall, políticas de seguridad globales. **No usar teléfono, ADB, AVD, emulator, `flutter run`, `flutter install`, `adb install`, VM Service, extracción de datos de la app QA anterior ni pruebas Android físicas.** Este lote NO autoriza instalar otro APK ni sustituir el QA `com.sierraglobalcompany.jornato.b14qa` existente.
6. **Cero descargas**: no `flutter precache`, `sdkmanager`, `gradle wrapper` para cambiar versión, `gradle --refresh-dependencies`, `flutter pub get` online, Android Studio update, Maven online, JDK/JBR install, npm/Composer. Si falta un artefacto, documentar su coordenada/version y entregar bloqueo preciso. No ejecutar el wrapper si su distribución no está cacheada: `--offline` de Gradle **no garantiza** que el wrapper no intente descargar su propio ZIP.
7. Candidato y APK privados en `A1_ROOT\private`. Entrega al chat **solo** ZIP sanitario con datos de control; APK binario privado, fuentes, claves, datos laborales y logs crudos NO viajan en el ZIP ni GitHub público. APK QA debug **no** equivale a APK publicable. Las decisiones de firma release, Play Store, respaldo off-device y QA física siguen separadas.

## 1 — Gate de concurrencia, custodia y materialización N5 (una sola pasada)

1. Preflight RO: comprueba si ya hay proceso A1, ZIP final A1 o una sesión Codex alterando Jornato; si existe, `A1_ALREADY_RUNNING_OR_FINISHED` y STOP antes de escribir. Identifica el estado PRE del WIP con **HEAD, rama, `git status --porcelain=v1 -uall`, staged, hash del índice, hash focal de Android/Flutter pertinente**. Referencia reportada N5: rama `codex/jor-b08-h4-domain-20261025`, HEAD `faf5fe283191f8b5a2724b397009512a2caec1b6`, 235 rutas (224 untracked/11 modified), cero staged, índice `25CC609803D7E68D5F3ECF428198B2432CF1EA37030546735DD3F03299D905E1`. No “reparar” WIP con Git. Si hay otro editor actual, detener con `BLOCKED_CONCURRENT_WIP`.
2. Verifica N5 ZIP con SHA de arriba y la matriz `CANDIDATE_DELTA_SUMMARY.csv` privada. Localiza la **copia candidata N5 real** en sus informes y confirma hashes de las 232 rutas contra el manifiesto N5 (NO reconstruir HEAD+WIP). Si faltan archivos materiales, `BLOCKED_N5_CANDIDATE` y listar exclusivamente rutas relativas faltantes; no sustituir por source de PR público ni por el APK antiguo.
3. Copia de **solo las 82 rutas app-side** (todas las rutas N5 que NO empiezan por `server/`) a `A1_ROOT\private\candidate_a1` conservando estructura: Android completo, Gradle wrapper, Gradle Kotlin build/settings, `pubspec.yaml`/lock, `lib/`, `assets/`, `test/`, `integration_test/` y metadatos necesarios. **No copies `server/vendor`, bases ni datos reales.** Confirma paridad SHA 82/82 PRE A1 respecto a N5, sin links simbólicos, junctions, hardlinks ni enlaces hacia WIP. El candidato N5 ORIGINAL es inmutable y se cotejará POST.
4. Usa archivos generados SOLO dentro A1 (`android/local.properties`, `.dart_tool/package_config.json`, `build/`, `android/.gradle` y propiedades Gradle privadas); no copies los generados WIP como solución. Si la raíz de cache local N5 se referencia en package config, es **solo un dato de resolución**, no copiar un package config con rutas antiguas sin regenerarlo. Usar un entorno proceso-scope (no `setx`) con `PUB_CACHE` validado contra las mismas 79 dependencias N5 y `GRADLE_USER_HOME` **privado**, sin tocar la caché compartida.
5. El resultado PRE/POST debe mantener WIP HEAD/rama/staged/índice y N5 candidato idénticos. Si algo externo cambió concurrentemente, documentar `WIP_DELTA_UNEXPECTED`, no reescribir ni atribuir la mutación al lote.

## 2 — Preflight de compilación Android offline (sin ejecutar builds todavía)

1. Confirmar ejecutables existentes y versiones **sin instalar**: Flutter 3.47.8/Dart 3.13.7 según N5, JDK compatible real con Gradle/AGP existentes, Android SDK existente, `ANDROID_SDK_ROOT` o SDK equivalente, `platforms/android-XX`, `build-tools`, herramientas `aapt`/`apkanalyzer`/`apksigner` si están. No asumir que SDK C2 del 20-nov sigue intacto. Verificar no se dispara `cache.updateAll` ni descargas del SDK Flutter. Si el simple `flutter --version` generaría componentes faltantes, detener sin iniciarlo.
2. Leer **sin modificar** `android/gradle/wrapper/gradle-wrapper.properties`, `android/settings.gradle.kts`, `android/build.gradle.kts`, `android/app/build.gradle.kts`, `pubspec.lock` y manifests. Registrar Gradle/AGP/Kotlin exactos, min/target SDK declarados, flavors/variants verdaderos (C2 reportó `b14qa` pero puede diferir), package/applicationId real y esquema de signing DEBUG. Escoger **una sola variante QA debug existente**, sin crear flavors, sin inventar `assembleB14qaDebug` si el código no declara `b14qa` ni reemplazar arbitrariamente por release.
3. **Wrapper offline obligatorio:** comprobar que la distribución Gradle exacta referida por `distributionUrl` **ya está instalada y legible** antes de arrancar `gradlew.bat`; verificación de hash si hay `distributionSha256Sum`. Si solo hay URL remota, no darla por cacheada. No usar `gradle wrapper` para instalarla. Resolver dependencias desde cachés existentes y crear hogar Gradle aislado A1: reutilizar las entradas ya cacheadas mediante una **copia selectiva con tamaño/espacio libre comprobados** o mecanismo oficial de caché RO validado localmente; ningún build escribirá en el caché compartido de otros proyectos. Si no existe forma viable sin reconfigurar globalmente, `BLOCKED_GRADLE_CACHE_ISOLATION`.
4. Comprobar que la caché de Gradle A1 contiene los plugins y dependencias que requiere la variante real, SDK y artefactos locales Flutter; no habilitar red para buscarlos. Si faltan, `BLOCKED_ANDROID_DEPENDENCIES` con paquete/versión exactos y decidir que NO se ejecuta build. No crear archivos ficticios para conseguir verde. No tocar firma keystore histórica instalada ni release keystore.
5. En `candidate_a1`, un solo `flutter pub get --offline --enforce-lockfile` si hace falta regenerar `package_config.json` por nueva ruta; confirmar SHA de lock `F515D69563850E8893A17585D8BAB57A8E6484E18CE1FEF4BDDC6BB836F83B34` sin variaciones, 79/79 hosted y source cache PRE/POST estable, 0 descargas. **No reejecutar widget 9/9 por rutina.** Si Pub no puede asegurar offline, `BLOCKED_PUB_OFFLINE`.

## 3 — UN build Android QA real, en copia A1, sin teléfono

1. Elegir y registrar tarea Gradle exacta en función de `productFlavors` + buildTypes del código. Si se confirma el flavor histórico `b14qa`, normalmente será `:app:assembleB14qaDebug`; si no existe, elegir la tarea **deducida del código real antes de ejecutar**, no improvisar tras un fallo. El objetivo **QA debug** usa firma debug no de producción. No usar `flutter build apk --release`, AAB ni clave release.
2. Correr **una sola build offline** desde `candidate_a1\android` con wrapper YA cacheado y HOME privado, JDK/SDK del proceso A1 y: `gradlew.bat --offline --no-daemon --console=plain :app:<TAREA_QA_DEBUG>` (reemplazar tarea real, nunca dejar placeholder). Guardar stdout/stderr crudos solo en `A1_ROOT\private`, reportar exit code y causa sanitizada. **No activar `--refresh-dependencies`, ningún download, Gradle daemon global, `flutter build apk` online ni segunda variante por tanteo.** El wrapper podría intentar descargar distribución al arrancar: si no se confirmó distribución local, no invocarlo.
3. Si falla por artefacto Gradle/SDK ausente: `BLOCKED_ANDROID_DEPENDENCIES`, nombre/version/objeto y por qué es imprescindible. Si falla por incompatibilidad Java/AGP/SDK que NO puede resolverse con lo cacheado, `BLOCKED_ANDROID_TOOLCHAIN`. Si falla por código Dart/Kotlin/manifest del candidato, `FAIL_PRODUCT` con archivo y línea. **Solo si es causa inequívoca en código propio**, hacer máximo **una corrección focal** exclusivamente en la copia A1 privada (no WIP ni N5), hash/diff PRE/POST, una verificación focal y **un único reintento** de la misma tarea offline; detener después, incluso si persiste. No migrar dependencias ni cambiar firmas para lograr verde.
4. Encontrar el APK generado REAL en el output de la variante (`android/app/build/outputs/apk/...` u otra ruta exacta), no adivinar por nombre. Verificar tamaño mayor que cero, SHA256 y que fue creado por esta ejecución (timestamp+log+variante+archivo). Comparar con SHA del antiguo C2 `BEEA46F75B08CFA440A980BCEE4CC12E2A6B4C7B37A9457B16240C5427157593`: **no dar por nuevo el viejo APK**. Guardar APK A1 en carpeta `private/product` sin exponerlo por chat/GitHub público. Si no hay APK, build != PASS.
5. Sin instalar: `apksigner verify --print-certs` con build-tools existentes, lectura de manifest final mediante `aapt dump badging` o `apkanalyzer manifest print` si están disponibles, y lectura ZIP de entries/CRC del APK. Registrar **package/applicationId, versionCode/versionName, minSdk/targetSdk, launcher Activity, ABI, cert digest/firma debug, rutas del artefacto, SHA**. Si el APK tiene firma release no esperada, identidad de paquete inesperada, bytes inválidos, componente exportado peligroso o configuración de backup de datos sensibles que viola el contrato, `BLOCKED_APK_SECURITY`, no declararlo QA entregable. No extraer/copiar claves. Si faltan herramientas `apksigner`/manifest, `APK_METADATA=BLOCKED_TOOLS` y resultado solo `PARTIAL`, aunque exista APK.
6. Verificación estática focal adicional: la variante QA no debe insertar claves reales, `.env`, URLs privadas, archivos personales ni secretos en `assets/`/recursos; manifiesto debug no declarar permisos peligrosos inesperados sin justificar; identidad temporal kiosk se borra tras comprobante según contrato pero **no afirmar PASS Android** sin ejecución nativa. Si hay INTERNET por módulos Pro no quitarlo automáticamente: explicar por qué el camino Gratis Local sigue probado sin HTTP en host y qué falta en dispositivo.

## 4 — Salida física futura, SIN ejecutarla aquí

**No tocar el Xiaomi Mi A3 en A1.** C2 dejó instalado `com.sierraglobalcompany.jornato.b14qa` (Android API 30, arm64), con VM Service inaccesible vía PID-only; no reinstalar, reemplazar, hacer ADB/AVD ni obtener logcat en este bloque. Si se produjo APK QA A1, redactar en **máximo una página** el gate físico posterior **sujeto a autorización expresa**: verificar identidad y firma/posible conflicto con el QA instalado; plan sin reinstalación destructiva; iniciar flujos críticos reales de sesión/kiosco/entrada/pausa/salida, continuidad reinicio, SQLite/SQLCipher/Keystore, corrupción fail-closed, backup/restauración privada si aplica, conectividad sin red y UX. **No depender de VM Service como único oráculo** ni afirmar que una lista de pasos es prueba ejecutada. OD02/OD03/OD04/Pro/tenant siguen bloqueados, fuera de alcance de la APK local.

**NO-GO release:** incluso si APK A1 build firma/manifest PASS, todavía falta UAT física, reinicio/cifrado efectivo, respaldo fuera del equipo y firma/revisión de distribución. No usar la firma debug como release o subir al Play Store. No autorizar B22.

## 5 — Un solo ZIP de evidencia y retorno exacto

Crear `A1_ROOT\delivery\JOR-A1-ANDROID-OFFLINE-APK-QA-CANDIDATE-20261121-UNICO.zip`, **solo** con archivos sanitizados y mínimos:

```text
FINAL_REPORT.md                 # decisiones, causas, build command sanitizado, estatus por gate
A1_GATE_MATRIX.csv              # preflight, pub, Gradle, APK, firma, manifest, custodia
APP_SOURCE_PARITY.csv           # conteos, root/fingerprint de 82 app-side, sin código
ANDROID_BUILD_RESULTS.csv       # task, exit, JDK/AGP/SDK, SHA apk, no rutas personales
APK_METADATA.csv                # package, version, SDK, ABIs, firma, launcher; sólo si existe
WIP_AND_N5_GUARDS.csv          # hashes PRE/POST, estado, sin datos privados
BLOCKERS.md                     # sólo si hay bloqueos
NEXT_PHYSICAL_GATE.md           # sólo si hay APK, propuesta sin ejecución ni autorización
MANIFEST_SHA256.csv             # SHA256/tamaño de cada miembro no manifiesto
```

Un ZIP único, CRC PASS, manifiesto SHA/tamaños verificado. **NO adjuntar** fuentes Dart/Kotlin, diff completo, secrets, SDK, Gradle caches, APK, firmas privadas, SQL, logs crudos, IDs personales ni datos de otros proyectos. Guardar el APK y evidencia cruda en `private` solo local D:; no declarar backup externo.

Respuesta final breve a ChatGPT Director:

```text
TASK=JOR-A1-ANDROID-OFFLINE-APK-QA-CANDIDATE-20261121
RESULT=PASS_APK_QA_SCOPED|PARTIAL_WITH_GAPS|BLOCKED_ENV|FAIL_PRODUCT
SOURCE_PARITY=...
PUB_LOCK=...
ANDROID_TOOLCHAIN=...
BUILD_VARIANT=...
APK_BUILD=...
APK_METADATA=...
APK_SHA256=...            # si se produjo
APK_PRIVATE_PATH=...      # si se produjo, ruta local; no adjuntar el binario
ANDROID_PHYSICAL=NOT_RUN
DOCKER=NOT_TOUCHED
WIP_GUARDS=...
N5_REUSED=PASS_CANDIDATE_SCOPED
OFF_DEVICE_BACKUP=NO
RELEASE=NO_GO
ZIP_PATH=D:\codex\_REPORTES\Jornato\JOR-A1-ANDROID-OFFLINE-APK-QA-CANDIDATE-20261121\delivery\JOR-A1-ANDROID-OFFLINE-APK-QA-CANDIDATE-20261121-UNICO.zip
ZIP_SHA256=...
NEXT_OWNER=CHATGPT_DIRECTOR
```

**Prohibido:** crear A2 automático, otra auditoría, más de una variante o más de un reintento causal. Ante un bloqueo, cerrar con evidencia útil para una autorización específica. **SIGUE CODEX LUNA A1; DESPUÉS CHATGPT DIRECTOR.**

## Referencias fuente verificadas por el Director (no son autorización de ejecución adicional)

- ZIP N5 `JOR-N5-DOCKER-NONET-PUB-GATES-20261121-UNICO.zip`: informe y matrices indican Flutter host 9/9, Pub 79/79 offline y 232 archivos app+server.
- ZIP C2 `JOR-H9-C2-PHYSICAL-DART-V5-20261120-UNICO.zip`: APK QA debug antiguo firmado instalado en Mi A3; VM Service PID-only bloqueado, oráculos físicos NOT_RUN. El nuevo APK debe proceder del candidato N5, no reutilizar C2.
- Gradle CLI oficial `--offline`: https://docs.gradle.org/current/userguide/command_line_interface.html
- Gradle Wrapper: https://docs.gradle.org/current/userguide/gradle_wrapper.html (si no está instalada la distribución, puede intentar descargarla antes de iniciar Gradle).
- Flutter Android: https://docs.flutter.dev/deployment/android ; flavors: https://docs.flutter.dev/deployment/flavors.
