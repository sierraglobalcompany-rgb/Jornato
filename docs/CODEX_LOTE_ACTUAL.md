# CODEX LUNA — JORNATO A2-R3 · ÚNICA REANUDACIÓN DEL BUILD APK QA ANDROID

**ORDEN EJECUTABLE SOLO SI A2-R2 NO COMENZÓ.** Director: ChatGPT; ejecutor: una sola instancia Codex Luna sobre Windows. **El mismo TASK, NO A3, NO reiniciar A2-R1 ni repetir A1/N2–N7.** A2-R3 sustituye a R2 únicamente antes de iniciarse R2. El objetivo es **una APK QA nueva y verificable** a partir del laboratorio privado A2 ya preparado, no seguir auditando prompts. Cualquier dato no demostrado debe recibir `NOT_RUN`, `BLOCKED` o `UNVERIFIED`; no inventar PASS.

```text
TASK=JOR-A2-GRADLE-DEPS-APK-QA-20261122
PROMPT_REVISION=A2-R3-20261122
PRECEDENCE=ONLY_IF_A2_R2_NOT_STARTED
MODE=RESUME_A2_R1_POLICY_STOP;A2_R1_GRADLE_ATTEMPTS=0
WIP_ROOT=D:\codex\Jornato
A2_ROOT=D:\codex\_REPORTES\Jornato\JOR-A2-GRADLE-DEPS-APK-QA-20261122
A2_R1_ZIP=D:\codex\_REPORTES\Jornato\JOR-A2-GRADLE-DEPS-APK-QA-20261122\delivery\JOR-A2-GRADLE-DEPS-APK-QA-20261122-UNICO.zip
A2_R1_ZIP_SHA256=C891EC71F5D30511065E0F902B1D97A19F5AA22F2D913FA48770E8D6328B6B24
A2_R3_DELIVERY=D:\codex\_REPORTES\Jornato\JOR-A2-GRADLE-DEPS-APK-QA-20261122\delivery-r3
APP_SOURCE_A2_R1=82/82_PASS;PUB=PASS_OFFLINE_LOCKED;GRADLE_CACHE=31270_FILES_COMPARED
A2_R1_BUILD=NOT_RUN;A2_R1_APK=NOT_BUILT
PUBSPEC_LOCK_SHA256=F515D69563850E8893A17585D8BAB57A8E6484E18CE1FEF4BDDC6BB836F83B34
WIP_REFERENCE_HEAD=faf5fe283191f8b5a2724b397009512a2caec1b6
WIP_REFERENCE_INDEX_SHA=25CC609803D7E68D5F3ECF428198B2432CF1EA37030546735DD3F03299D905E1
TASK_GRADLE=:app:assembleB14qaDebug
RELEASE=NO_GO;ANDROID_PHYSICAL=NOT_RUN;DOCKER=NOT_TOUCHED
NEXT_OWNER=CHATGPT_DIRECTOR
```

## 0. Puerta de precedencia y fuentes — sin copiar ni probar de nuevo lo aprobado

1. **Antes de escribir o ejecutar nada:** consultar existencia de un resultado/checkpoint A2-R2, ZIP en `delivery-r2` y proceso Codex/Gradle asociado a este mismo TASK y candidato. Si A2-R2 empezó, acabó o no se puede atribuir su propiedad con certeza, **STOP `A2_R2_ALREADY_IN_FLIGHT_OR_FINISHED`**: devolver su ZIP o checkpoint al Director y **NO usar R3**. Si solo existe el ZIP R1 indicado, **ES NORMAL** y se continúa. No sobreescribir `delivery` ni `delivery-r2`. Si hubo actividad A2 posterior no atribuible, STOP. Solo un ejecutor posee A2.
2. A2-R1 ya aportó ZIP con SHA256 anterior, 7 miembros CRC PASS, 6/6 hashes de manifiesto PASS y reporte de cero llamadas Gradle. Leer sus `FINAL_REPORT.md`, `BLOCKERS.md` y gate matrix **solo una vez por referencia** si no hay copia de trabajo fiable, sin reauditar 31.270 objetos. Verificar localmente SHA del ZIP y que no sea un archivo de otro lote; la evidencia de A2-R1 **se reutiliza**, no se reejecuta.
3. Reutilizar exactamente `A2_ROOT\private\candidate`, `gradle-home`, `pub-cache`, `android-user`, `temp`, y solo los componentes aprobados de A2-R1. Verificar existencia, ownership y ausencia de junctions/symlinks/hardlinks externos de rutas críticas, además de SHA de `pubspec.lock` anterior y de los archivos de Gradle y firma pertinentes. **NO reconstruir 82 fuentes; NO repetir `flutter pub get`, análisis Flutter, tests KioskScreen, hashes masivos ni clonación de cachés**. Si checkpoint esencial falta o está cambiado sin explicación: `BLOCKED_A2_CHECKPOINT`, no improvisar nuevo árbol desde WIP.
4. WIP `D:\codex\Jornato` es **solo lectura**. Capturar HEAD, índice SHA, staged y estado PRE/POST sin forzar coincidencia de 235 rutas si existe trabajo ajeno; si otra sesión altera Jornato o no se puede demostrar aislamiento: STOP. Prohibido `git add/commit/push/pull/fetch/reset/stash/clean/checkout/merge`, tocar código o identidad de A1/N5, otros proyectos, Docker/WSL, PHP/DB, Android físico, ADB, emulador o publicar WIP/APK.

## 1. Único delta autorizado: repositorio Flutter Engine ya añadido por el plugin

**Origen verificado:** A2-R1 se detuvo *antes* de ejecutar Gradle porque el plugin Gradle de Flutter incorporaba el repositorio Maven `https://storage.googleapis.com/download.flutter.io`. Flutter construye la ruta efectiva desde `FlutterPlugin.kt` con `FLUTTER_STORAGE_BASE_URL` (si se define), `DEFAULT_MAVEN_HOST` y `engine.realm`. Fuentes oficiales: `https://github.com/flutter/flutter/blob/master/packages/flutter_tools/gradle/src/main/kotlin/FlutterPlugin.kt` y `https://docs.flutter.dev/add-to-app/android/project-setup`.

1. Leer de forma focal y **sin mutación** el Flutter SDK utilizado en A2-R1 (3.47.8): `bin/cache/engine.realm`, `bin/cache/engine.stamp`, versión SDK y `packages/flutter_tools/gradle/src/main/kotlin/FlutterPlugin.kt`. No asumir que `master` equivale a la versión local; **manda la implementación local**. `FLUTTER_STORAGE_BASE_URL` debe estar ausente o apuntar exactamente al host oficial previsto; no cambiarla para eludir controles. Si existe `local-engine-repo` u otro override que altere la ruta, `BLOCKED_REPOSITORY_POLICY` antes del build.
2. Permitir solamente **HTTPS de metadata y artefactos de compilación fijados**, correspondientes a repositorios originales declarados por el build: `https://plugins.gradle.org/m2/`, redirección oficial `https://plugins-artifacts.gradle.org/`, `https://repo.maven.apache.org/maven2/`, `https://dl.google.com/dl/android/maven2/` y el repositorio **io.flutter engine Maven** bajo `https://storage.googleapis.com/download.flutter.io/` (o `https://storage.googleapis.com/{engine.realm}/download.flutter.io/` si el archivo realm local es un único segmento válido). `engine.realm`: vacío o segmento alfanumérico con `.`, `_`, `-`, excluyendo `.` y `..`, sin `://`, `/`, `\`, `?`, `#`, `%`, controles o espacios. Validar la URI efectiva contra la implementación local del plugin, no adivinarla. **No habilitar `storage.googleapis.com` completo, `/flutter_infra_release`, otros buckets, redirecciones ajenas, mirrors ni enlaces HTTP**. Descargas para `io.flutter` deben coincidir con la ruta del engine y versión exacta del SDK; otros grupos se resuelven solo de su repositorio original conocido. Una URL no reconocida se clasifica `BLOCKED_REPOSITORY_POLICY`, sin ampliarla por intuición.
3. No añadir repositorios a Gradle, modificar plugin, engine realm, versiones, Gradle Wrapper, `settings.gradle*`, `build.gradle*` ni el SDK para abrir la ruta. Revisar **solo delta relevante** de scripts/repositories/init scripts/propiedades heredadas para detectar destinos/credenciales/descargas ajenos; A2-R1 ya realizó preflight de todo el resto. No cambiar Gradle 9.3.1, JDK 21.0.12, Android SDK 36, Kotlin 2.2.21 ni AGP real. No `sdkmanager`, `flutter precache`, `flutter build apk`, `--refresh-dependencies`, scripts remotos, Gradle Build Scan, instalación de herramientas, telemetría voluntaria ni componentes externos al build.
4. **Integridad:** los 22 archivos/variantes que faltaron en A1 representan **21 GAV**, con clasificadores/variantes Kotlin; no suplantar JAR por otro con mismo GAV. Mantener coordenada+classifier+archivo real+SHA calculado al recibirse. SHA obtenido después de una descarga **no demuestra autenticidad**: si el proyecto ya tiene `gradle/verification-metadata.xml` o un checksum oficial conocido, exigir coincidencia; si no, registrar `INTEGRITY=TLS_SOURCE_AND_SHA_INVENTORY_ONLY_NOT_PINNED`, sin inventar firma, origin checksum o certificación. No crear ni regenerar metadatos de verificación automáticamente ni ampliar versiones para obtener PASS. Un build puede obtener PASS_QA **sin atribuir falsamente validación de suministro/release**.
5. La lista de hosts es **política del trabajo, no un sandbox de red**. Gradle ejecuta plugins/scripts; registros de Gradle no son una traza completa de egreso. Declarar `NETWORK_SCOPE=POLICY_CONTROLLED_NOT_EGRESS_SANDBOXED` para build online; registrar solo destinos efectivamente observados sin afirmar garantía técnica de exclusión. Si la política local exige prueba de bloqueo de egreso, `BLOCKED_NETWORK_ENFORCEMENT` sin modificar firewall/proxy global.

## 2. Preflight mínimo de compilación (sin otra campaña)

1. Verificar únicamente que existen la distribución/wrapper Gradle 9.3.1 y las cachés privadas A2 preparadas, las rutas Flutter/JDK/SDK/NDK existentes, `android/local.properties` de **copia A2** y `candidate/android/gradle.properties` con `android.builder.sdkDownload=false` y `org.gradle.java.installations.auto-download=false`. Comprobar que los valores de Java, Gradle, SDK y Flutter no han cambiado desde A2-R1; **no ejecutar otro build ni tasks de exploración para verificarlo**. A2-R1 ya verificó Pub offline. Si faltan componentes, `BLOCKED_ENV` específico.
2. Confinar al proceso actual (`$env:` de PowerShell) `GRADLE_USER_HOME=A2_ROOT\private\gradle-home`, `PUB_CACHE=A2_ROOT\private\pub-cache`, `ANDROID_USER_HOME=A2_ROOT\private\android-user`, `TEMP` y `TMP=A2_ROOT\private\temp`, `JAVA_HOME` y `ANDROID_HOME` a los directorios preexistentes validados. Revisar `GRADLE_OPTS`, `JAVA_TOOL_OPTIONS`, `ORG_GRADLE_PROJECT_*`, `GRADLE_USER_HOME`, `FLUTTER_STORAGE_BASE_URL`, proxy/credenciales e init scripts heredados. Si alteran repositorios, output, signing o ejecución, STOP; no imprimir secretos ni modificar el entorno global. Restaurar variables en `finally` o terminar el proceso aislado. No permitir writes bajo `%USERPROFILE%\.gradle`, `%USERPROFILE%\.android`, el WIP ni otros proyectos; SDK/Flutter host son recursos de lectura.
3. `signingConfigs.debug` debe escribir/leer **solo una keystore QA privada** A2; si la configuración intenta crearla en `~/.android`, `BLOCKED_SIGNING_PATH` hasta corregir ruta *solo en copia A2* antes del build. No copiar credenciales reales/release, no incluir keystore en ZIP. El APK final tendrá firmante de pruebas, posiblemente distinto al instalado en Xiaomi Mi A3: NO hacer uninstall ni instalar. La bandera `usesCleartextTraffic=true` observada en el sourceSet b14qa/debug exige revisión del manifiesto fusionado **solo si hay APK**, nunca sirve de garantía de seguridad release.
4. Registrar ruta, tamaño y hash/timestamp de cualquier APK preexistente dentro del laboratorio como **NO elegible**; la nueva salida requiere nexo con la ejecución R3 (APK nuevo o actualizado durante build más hash y tarea exit 0). No reutilizar APK antiguo C2/A1 ni falsos positivos de carpeta `outputs`.

## 3. ÚNICA ruta de compilación — eliminar toda alternativa contradictoria

La decisión del Director ya es `OFFICIAL_FETCH_NEEDED` por los artefactos Gradle ausentes en A1. **No correr primero una compilación `--offline`**. En una única consola PowerShell de Codex (NO sesión paralela), preparar exclusivamente el entorno privado anterior y ejecutar **una sola vez** esta tarea concreta desde `A2_ROOT\private\candidate\android`:

```powershell
# Valores reales de $candidateAndroid y $privateLogs ya comprobados por el preflight.
# Todas las variables de proceso del bloque 2 deben haberse configurado previamente.
Push-Location $candidateAndroid
try {
    & .\gradlew.bat :app:assembleB14qaDebug --no-daemon --console=plain --max-workers=2 2>&1 |
        Out-File -LiteralPath (Join-Path $privateLogs 'gradle-a2-r3-raw-private.log') -Encoding utf8
    $gradleExit = $LASTEXITCODE
} finally {
    Pop-Location
}
# El log RAW NO va al ZIP; producir un resumen sanitizado con nombres y causas.
# Si $gradleExit != 0, aplicar la clasificación del bloque 4, sin builds por rutina.
```

**Una sola tarea `:app:assembleB14qaDebug`; NO** `flutter build apk`, segunda variante, `gradle build` general, segundo intento offline, `--refresh-dependencies`, tests previos, simulaciones HTTP ni ADB. La captura de log es privada y debe conservar el exit code real; una salida vacía o ambigua equivale a `BLOCKED_ENV`, no PASS.

**Reintento excepcional**: solo si el compilador identifica **un error real en fuente propia de Jornato** después de pasar la resolución de dependencias, permitir **un único cambio mínimo y un segundo intento de la MISMA tarea** en `candidate` privado; registrar diff/hash sin tocar WIP. **Cero reintentos** por DNS, dependencia, repositorio, SDK/JDK, memoria, certificados, fallo de firma o medio ambiente. Si detecta demanda de URL no autorizada durante la ejecución, parar exclusivamente la tarea A2 si aún está corriendo, sin tocar procesos de otros proyectos.

## 4. Dictámenes y puertas, sin falsos PASS

- `BLOCKED_REPOSITORY_POLICY`: repositorio efectivo o redirect distinto a los prefijos aprobados, overrides o identificadores no confiables. Sin otra autorización se detiene, se identifica dominio/ruta sanitizada y la coordenada, no se modifica whitelist.
- `BLOCKED_OFFICIAL_DEPENDENCY`: fuente oficial no disponible, conexión fallida, HTTP status, artefacto/classifier faltante o TLS error. No se arregla probando otros repositorios; registrar causa exacta.
- `BLOCKED_ENV` / `BLOCKED_WRITE_BOUNDARY` / `BLOCKED_SIGNING_PATH`: JDK, SDK, distribución, disco, permisos, caché, firma o escritura fuera del laboratorio. Detener sin cambiar Windows.
- `FAIL_PRODUCT`: error demostrado de compilador sobre fuente propia, archivo/línea; hasta una corrección causal en copia A2, como se permite arriba.
- `PASS_NEW_APK`: Gradle sale 0, archivo APK creado o actualizado por ESTA ejecución, SHA-256 y tamaño de APK calculados, task/variante identificadas y **verificación estática PASS**. Si hay APK pero falla comprobación de firma/manifiesto, clasificar `APK_BUILT_STATIC_BLOCKED`, no `PASS_NEW_APK` final.
- `A2_APK_STATIC=PASS_QA|BLOCKED_APK_SECURITY|NOT_RUN`: usando utilidades Android SDK locales `apksigner verify --verbose --print-certs` y `aapt dump badging` o `apkanalyzer manifest print`, registrar nombre paquete, versión, min/target SDK, launcher, firmante SHA y manifest fusionado. Revisar permisos/exported, secretos/keys inesperados, cleartext y debug. `QA_DEBUG_CLEARTEXT=TRUE` si se confirma en APK: **solo prueba interna sintética, nunca datos reales ni distribución pública**. No afirmar SQLCipher, Keystore, persistencia ni UAT con el mero APK.
- Sin APK, `APK_SHA256=NOT_BUILT`, `APK_PRIVATE_PATH=NOT_CREATED`, `A2_APK_STATIC=NOT_RUN`. No inventar captura, firma ni manifest.
- `ANDROID_PHYSICAL=NOT_RUN`, `OFF_DEVICE_BACKUP=NO`, `DOCKER=NOT_TOUCHED`, `RELEASE=NO_GO` **independientemente** del resultado A2.

## 5. Un solo retorno R3; conservar R1 y no generar basura

Guardar la APK real **solo** bajo `A2_ROOT\private\product` con SHA-256 y ruta Windows reportados; **no incluir el APK ni clave, código, JAR, cachés, logs crudos o archivos personales** dentro del ZIP. Si existe APK apto QA, incluir plan físico de máximo una página, sin ejecutarlo (firma vs C2, instalación solo después de permiso, inicio, offline real, reinicio/rehidratación, marcas, kiosco, SQLCipher/Keystore, corrupción fail closed, respaldo/restauración, GPS/selfie condicionados, privacidad y red). No presentar plan físico como PASS.

Crear **un único ZIP final** en `A2_R3_DELIVERY` (R1 `delivery/` y cualquier R2 previo permanecen intactos), con CRC PASS y `MANIFEST_SHA256.csv` de SHA-256+bytes cotejado. Máximo evidencia útil:

```text
FINAL_REPORT.md
A2_R3_GATE_MATRIX.csv
SOURCE_WIP_GUARDS.csv
DEPENDENCY_RESOLUTION_DELTA.csv   # observado en R3, no copiar 22 falsos PASS de A1
BUILD_AND_APK.csv                 # task, intentos, exit, SHA/tamaño APK o NOT_BUILT
APK_STATIC_SECURITY.csv           # SOLO si existe y se verificó APK
NEXT_ANDROID_PHYSICAL_GATE.md     # SOLO si el APK es QA estático válido
BLOCKERS.md                      # SOLO si hay bloqueo
MANIFEST_SHA256.csv
```

En el ZIP: rutas relativas/redactadas, URLs sin query/tokens, coordenadas y versiones, errores esenciales y SHA de artefactos; **NO** credenciales, `.env`, `local.properties`, claves, manifest completo, capturas, APK, código, logs crudos, inventario de otros proyectos ni dumps. Guardar evidencias privadas en D:. PRE/POST mínimo del WIP e índice; verificar que SDK y Gradle globales/otros proyectos no recibieron escrituras atribuibles a A2. No afirmar un backup fuera D:.

**Respuesta literal a ChatGPT Director** (resumen de línea por campo; un solo ZIP):

```text
TASK=JOR-A2-GRADLE-DEPS-APK-QA-20261122
PROMPT_REVISION=A2-R3-20261122
RESULT=PASS_APK_QA_SCOPED|PARTIAL_WITH_GAPS|BLOCKED_ENV|FAIL_PRODUCT
SOURCE=PASS_82_OF_82_REUSED|BLOCKED
GRADLE_DEPS=PASS_OFFICIAL_FETCH|BLOCKED_REPOSITORY_POLICY|BLOCKED_OFFICIAL_DEPENDENCY|NOT_RUN
A2_BUILD=PASS_NEW_APK|APK_BUILT_STATIC_BLOCKED|BLOCKED_DEPENDENCY|BLOCKED_ENV|FAIL_PRODUCT|NOT_RUN
A2_APK_STATIC=PASS_QA|BLOCKED_APK_SECURITY|NOT_RUN
NETWORK_SCOPE=POLICY_CONTROLLED_NOT_EGRESS_SANDBOXED|NOT_RUN
A2_APK_SHA256=<SHA256 or NOT_BUILT>
A2_APK_PRIVATE_PATH=<private path or NOT_CREATED>
ANDROID_PHYSICAL=NOT_RUN
WIP_GUARDS=PASS_UNCHANGED|DELTA_UNEXPECTED
DOCKER=NOT_TOUCHED
OFF_DEVICE_BACKUP=NO
RELEASE=NO_GO
ZIP_PATH=<A2_R3_DELIVERY\UNICO.zip>
ZIP_SHA256=<SHA256>
NEXT_OWNER=CHATGPT_DIRECTOR
```

**FIN DE MACROBLOQUE.** Si R2 comenzó, STOP; si R3 produce el ZIP, no volver a iniciar A2. Director adjudica únicamente resultados **nuevos** y decide el gate Android físico. Nunca relanzar por ritual. PingPongLaw L1–L6: KISS, causa raíz, no perseguirse la cola, evidencia nueva real, cero falsos PASS.
