# CODEX LUNA — JORNATO · A1-R2 · MACROBLOQUE ÚNICO: APK QA ANDROID REAL DESDE CANDIDATO N5

**ESTA ES UNA ORDEN PRODUCTIVA, NO UNA AUDITORÍA DEL PROMPT.** ChatGPT Director define las decisiones, Codex Luna ejecuta sin improvisaciones. **MISMO `TASK` A1**, revisión correctiva del A1-R1 anterior. Reemplaza A1-R1 **SOLAMENTE SI A1 NO HA INICIADO Y NO EXISTE ZIP A1 FINAL**. Si A1-R1 está en marcha, pausado con trabajo/candidato propio o ya finalizó, **NO ejecutar A1-R2**, no crear otra sesión ni otro lote; terminar o entregar lo existente para adjudicación del Director. Si no puedes establecerlo, STOP `A1_ALREADY_IN_FLIGHT_OR_UNKNOWN`. No es A2.

```text
TASK=JOR-A1-ANDROID-OFFLINE-APK-QA-CANDIDATE-20261121
PROMPT_REVISION=A1-R2-20261122
WIP_ROOT=D:\codex\Jornato
N5_ROOT=D:\codex\_REPORTES\Jornato\JOR-N5-DOCKER-NONET-PUB-GATES-20261121
A1_ROOT=D:\codex\_REPORTES\Jornato\JOR-A1-ANDROID-OFFLINE-APK-QA-CANDIDATE-20261121
N5_ZIP_SHA256=162118EFD4260B97A425E969CB90C06C54A4CAA0003FEC82F2C68A2BD53E84CC
N5_SOURCE=232_ROWS_82_APP_NON_SERVER_150_SERVER
N5_PUB_LOCK_SHA256=F515D69563850E8893A17585D8BAB57A8E6484E18CE1FEF4BDDC6BB836F83B34
N5_HOST=PUB_79_OF_79_OFFLINE_PASS;KIOSK_9_PASS;ANALYZE_0_ISSUES
C2_APK_SHA256=BEEA46F75B08CFA440A980BCEE4CC12E2A6B4C7B37A9457B16240C5427157593
C2_PACKAGE=com.sierraglobalcompany.jornato.b14qa
C2_OLD_DEBUG_CERT_SHA256=5435A892A30B3E5387E9EF6272F3B1C073FF1A9FE19741F1D5060200F680B78E
WIP_HEAD_REPORTED=faf5fe283191f8b5a2724b397009512a2caec1b6
WIP_INDEX_REPORTED=25CC609803D7E68D5F3ECF428198B2432CF1EA37030546735DD3F03299D905E1
ANDROID_PHYSICAL=NOT_AUTHORIZED
DOCKER_PHP_DB=PAUSED_AND_NOT_AUTHORIZED
RELEASE=NO_GO
NEXT_OWNER=CHATGPT_DIRECTOR
```

## 0. Resultado exigido y límites irreversibles

**Entregar UNA de dos cosas útiles:** (A) APK QA **nuevo y verificable** construido con código N5 en laboratorio A1, con SHA/firmante/manifest documentados y el APK **solo en D: privado**; o (B) bloqueo causal exacto de Gradle/SDK/Flutter, con coordenada/version/archivo faltante y una instrucción de resolución, **sin segundos tanteos**. No se pide instalador release, AAB, Play Store, servidor, UAT, nueva función ni arquitectura.

- **No repetir** N2 86 tests, N3 9+4, N4 paridad original, N5 Flutter 9/9 ni N6/N7 imágenes PHP. Solo una ejecución de build A1 y, exclusivamente ante defecto de **código propio causalmente demostrado**, una corrección en copia privada y un reintento de la **misma variante**. Cualquier resultado es válido si está sustentado; no forzar verde.
- **No** tocar Android físico, Xiaomi Mi A3, ADB/AVD/emulador, logcat, APK previamente instalado, VM Service, Android Studio GUI, Windows SDK global, Docker, PHP, DB, otros proyectos Codex, GitHub público o servicios globales. No `git add/commit/push/fetch/pull/reset/clean/stash/checkout/merge/rebase` en WIP. No descargar, instalar, actualizar o borrar SDK/JDK/Flutter/Gradle/paquetes: sin `sdkmanager`, `flutter precache`, Maven online, `--refresh-dependencies`, `flutter pub upgrade`, actualizaciones de AGP/Kotlin ni `gradle wrapper`.
- Todas las fuentes, claves QA, artefactos y logs detallados permanecen en `A1_ROOT\private`. Se exige un **ZIP único de evidencia sanitizada**, sin APK ni fuentes, claves, reportes completos de signing ni datos privados. `OFF_DEVICE_BACKUP=NO`; una copia en D: no es respaldo externo. `B22=NOT_AUTHORIZED`, `H9_GLOBAL=NO_GO`, `RELEASE=NO_GO`.
- PingPongLaw L1 KISS, L2 sin ruido, L3 causa raíz, L4 UX real, L5 evidencia independiente, L6 no pingpong. **No preparar otra auditoría**. Si un bloque se cierra, no lo repitas porque otro frente haya fallado.

## 1. Puerta A1-0 — no duplicar ni tocar WIP

1. Verifica **solo lectura** si existe ZIP A1, carpeta A1 ya trabajada, proceso Codex/Gradle/Flutter de A1 o evidencia de inicio. Si existe, **STOP**, entrega resultado a Director. No borrar, reusar ni sobrescribir carpeta A1 de otra ejecución. Esto tiene precedencia sobre el resto del Markdown.
2. Toma baseline read-only del WIP: rama, HEAD, `git status --porcelain=v1 -uall`, `git diff --cached --quiet` y SHA del índice. Comparar con referencia anterior **solo para detectar delta**, nunca restaurar ni modificar. No confiar en un `git status` vacío como prueba de hash de fuentes untracked. Al final compara los mismos elementos; si un tercero editó el WIP, documentar sin atribuirlo a A1 ni corregirlo.
3. Verifica ZIP N5 (`SHA-256` indicado), `FINAL_REPORT.md`, `CANDIDATE_DELTA_SUMMARY.csv`, los **232 paths** (82 no `server/`, 150 servidor) y la ubicación del candidato privado real, sin extraer ZIP de evidencia para sustituir fuente (ZIP N5 **no** contiene fuente). Si falta la copia original N5 o un archivo de aplicación, `BLOCKED_N5_SOURCE`; no reconstruirla de WIP/PR antiguo. Evitar path traversal, reparse points, symlinks, junctions y hardlinks; solo archivos ordinarios dentro de la raíz N5 autorizada.
4. Crear una **única copia privada A1** de las 82 rutas no servidor, preservando rutas relativas y SHA256/tamaño por fichero. Sin `server/`, `vendor`, `.env`, bases, logs, keystores o archivos generados WIP. No reauditar 232 rutas del servidor. Reutiliza CSV N5 como oráculo de bytes y asegura 82/82 hashes en copia. El candidato N5 es **inmutable**; comprueba SHA focal PRE/POST y custodia de N5.
5. Crea subdirectorios exclusivos `A1_ROOT\private\candidate`, `cache-gradle`, `pub-cache`, `android-user`, `temp`, `product`, `logs`. No crear otro runner ni clonar proyecto entero. No acceder a fuentes de otros proyectos.

## 2. Puerta A1-1 — preparar Flutter/Android/Gradle offline sin efectos globales

**Lee primero en la copia A1**: `pubspec.yaml`/lock, `lib/main.dart`, `android/settings.gradle.kts`, `android/app/build.gradle.kts`, `android/build.gradle.kts`, `android/gradle/wrapper/gradle-wrapper.properties`, manifests y signing config. No inferir flavors ni entrada Dart desde el nombre del APK C2. El candidato N5 contiene `android/gradlew.bat` y `android/gradle/wrapper/gradle-wrapper.jar` según el CSV: comprobarlo con hash, **no presupone runtime Gradle disponible**.

### 2.1 Entorno de proceso aislado

- Localiza **Flutter SDK 3.47.8 y Dart 3.13.7 realmente usados en N5**, artefactos Android del engine ya instalados, Java/JDK compatible con el Gradle/AGP real, Android SDK existente, platform/build-tools requeridos. Si falta algo, bloquear exactamente y **no iniciar un comando que pueda descargarlo**. Es una comprobación del host Windows, no Android nativo en dispositivo.
- Escribe **solo en copia A1** `android/local.properties` con `flutter.sdk=<SDK real>` y `sdk.dir=<Android SDK real>`, usando el escape de rutas que exija Java Properties; si el plugin/Gradle necesita `flutter.versionCode`/`flutter.versionName`, derivarlos del `pubspec.yaml` o propiedades existentes, no inventar valores. Flutter Gradle Plugin puede exigir `flutter.sdk` al evaluar `settings.gradle.kts`; no comenzar Gradle antes de comprobarlo. No modificar `local.properties` del WIP ni del SDK.
- Establece para **único proceso A1** `PUB_CACHE=A1_ROOT\private\pub-cache` (clon privado de los 79 paquetes/metadatos de N5 verificados; origen RO, sin symlinks, con presupuesto de espacio), `GRADLE_USER_HOME=A1_ROOT\private\cache-gradle`, `ANDROID_USER_HOME=A1_ROOT\private\android-user`, `TEMP` y `TMP=A1_ROOT\private\temp`, además de `JAVA_HOME`/SDK Flutter/Android apropiados. Restaurar entorno al finalizar. No `setx`, no modificar usuario Windows, PATH permanente ni `.gradle` de terceros.
- **Clave debug:** verificar en `build.gradle.kts` la firma efectiva para la variante QA. El debug keystore predeterminado puede crearse en el home del usuario. Exigir que la creación/uso de una clave de QA se limite a `A1_ROOT\private\android-user` o a una configuración de signing temporal explícita dentro de la copia A1. Prohibido crear, sobrescribir o leer secretos de un keystore release/ajeno. Si no puede asegurarse la ruta de firma con la configuración existente, `BLOCKED_DEBUG_SIGNING_ISOLATION` antes del build. Una clave QA privada nueva puede no coincidir con la firma debug del APK C2 instalado; registrarlo como **incompatible para actualización**, sin intentar instalar.
- No se permite que un Gradle `init.d`, `gradle.properties` o repositorio de un proyecto ajeno controle esta ejecución. No copiar credenciales ni archivos de configuración global. Código de terceros en plugins cacheados ejecutará tareas normales: limitar la copia, el entorno, las rutas y las escrituras; no declarar que `--offline` constituye sandbox de sistema operativo.

### 2.2 Gradle Wrapper + dependencias offline

1. Inspecciona `distributionUrl`, versión del wrapper, `distributionSha256Sum` **si existe**, Gradle/AGP/Kotlin y flavor real. Wrapper puede buscar el ZIP **antes** de procesar `--offline`; no ejecutarlo hasta acreditar la distribución **exacta ya instalada y completa**. Para el `GRADLE_USER_HOME` privado, reutilizar desde una fuente **global autorizada de solo lectura**, mediante **copia acotada** de la distribución exacta y de las dependencias Gradle necesarias con espacio libre suficiente, sin usar enlaces a caché viva, sin copiar `init.d`, credenciales, `gradle.properties` personal ni locks/GC del origen. Registrar origen **sanitizado**, hashes/versiones y límite de bytes. El destino es totalmente propio y escribible; el origen no se toca. No copiar gigantescas cachés de otros proyectos.
2. Gradle guarda artefactos **y metadatos de resolución**: una carpeta JAR presente no prueba un conjunto de dependencias resuelto. No exigir un inventario imposible de todas las transitivas **antes del build**. Comprobar distribución, plugin de Flutter y mínimos conocidos; el **único build `--offline`** será la prueba concluyente de dependencias. Si falta una distribución del wrapper, `BLOCKED_GRADLE_DISTRIBUTION` (sin iniciar wrapper). Si falta la caché de plugin conocida, `BLOCKED_GRADLE_CACHE`. Si durante el build falla un artefacto transitorio, `BLOCKED_ANDROID_DEPENDENCY`, registrando `group:artifact:version` o ruta exacta; sin buscar otra variante ni descargar.
3. `pubspec.lock` tiene que conservar SHA256 `F515D69563850E8893A17585D8BAB57A8E6484E18CE1FEF4BDDC6BB836F83B34`. Si falta package_config al copiar, ejecutar **una vez** `flutter pub get --offline --enforce-lockfile` solo en A1, **tras comprobar el SDK/cachés locales**. 79 versiones alojadas N5 y sus metadatos se COPIAN a `pub-cache` A1 desde el origen N5 sin mutarlo; verificar SHA/metadatos fuente y lock PRE/POST idénticos, y que package_config apunte al `pub-cache` privado y no a WIP/caché global. Si el clon exacto no es viable por espacio o integridad, `BLOCKED_PUB_OFFLINE` sin tocar el origen. Si hay falta o cambio de hash: `BLOCKED_PUB_OFFLINE`. No repetir `flutter analyze/test` de N5 si código no cambió.

## 3. Puerta A1-2 — UNA compilación y certificación QA estática

1. Selecciona **solo desde `android/app/build.gradle.kts` real**:
   - Si `productFlavors` contiene exactamente `b14qa`, variante `b14qaDebug`, tarea `:app:assembleB14qaDebug`.
   - Si NO hay flavors, variante `debug`, tarea `:app:assembleDebug`.
   - Si hay otro flavor QA explícito y no `b14qa`, usar `:app:assemble<NombreExacto>Debug` derivado del código, registrar por qué; si hay dos candidatos o un flavor sin identidad QA clara, `BLOCKED_VARIANT_AMBIGUOUS`, no ejecutar un menú de builds.
   - Comprobar target de `lib/main.dart` y `flutter.target` (si existe); **no compilar el harness `integration_test/kiosk_flow_test.dart` como si fuera app normal**. Verificar que package/applicationId y signing sean de QA. Si el build.gradle real fuerza firma release para debug, `BLOCKED_APK_SECURITY` hasta decisión del Director.
2. Confirmar `android/local.properties` válido, distribución exacta Gradle privada, Java/SDK compatibles y firma debug aislada. Desde `A1_ROOT\private\candidate\android`, usar wrapper existente (único build) con parámetros equivalentes a:

   ```powershell
   # Entradas y rutas resueltas en el preflight, nunca placeholders al ejecutar.
   .\gradlew.bat --offline --no-daemon --console=plain :app:assembleB14qaDebug
   ```

   Reemplazar tarea **antes** por la única variante real. Capturar exit code y stdout/stderr SOLO en `private/logs`; saneamiento antes de ZIP. No `--refresh-dependencies`, `gradle build` general, `flutter build apk` alternativo, `flutter run`, tarea de tests vecinos, segunda variante, ni reintentos por infraestructura. Si Gradle o plugin Flutter intenta descarga, **STOP** y clasificar entorno sin ejecutarla; un flag no garantiza cero red.
3. Solo si falla **por código propio y causalmente identificado** (ruta/archivo/línea): hacer **máximo una corrección** en copia A1, mantener hash/diff PRE/POST privado y una única verificación focal, luego **un único reintento de la MISMA tarea** offline. Defecto de SDK, caché, distribución, Java, plugin Gradle, firma o entorno **no autoriza reintento**, actualización, parche de build config ni traslado de archivos de otros proyectos. No copiar fix al WIP.
4. Localizar el **APK realmente nuevo** buscando outputs de la variante en copia A1: tanto `candidate/build/app/outputs/flutter-apk` como `candidate/build/app/outputs/apk` y ruta Gradle exacta. No adjudicar un APK del viejo C2 ni encontrado fuera de A1. Exigir construcción exit0, archivo no vacío, SHA256, tamaño, fecha posterior al build A1 y trazabilidad tarea→output→bytes; **una build exit0 sin APK no es PASS**. Guardar APK solo en `A1_ROOT\private\product` y registrar la ruta Windows para futura QA, jamás subirlo ni incluirlo en el ZIP público/chat.
5. Verificar APK estáticamente con **herramientas SDK locales** (`apksigner verify --verbose --print-certs`, `aapt dump badging`/`apkanalyzer manifest print`, entradas ZIP y CRC). Registrar `applicationId/package`, `versionCode`, `versionName`, `minSdk`, `targetSdk`, `launcher Activity`, firma/cert digest, ABI y `debuggable` si puede comprobarse; no asumir que SHA distinto implica cambio funcional. Comparar **solo informativamente** la compatibilidad de certificado con C2 y paquete `com.sierraglobalcompany.jornato.b14qa`: si difiere, **NO ES ACTUALIZABLE DIRECTAMENTE SOBRE C2**, sin reinstalar. Si falta firmante/manifest legible, `APK_METADATA=BLOCKED_TOOLS|FAIL_SECURITY`, y **no** `PASS_APK_QA_SCOPED`.
6. Privacidad y seguridad focal del APK **sin inventar QA Android**: revisar manifest final para componentes exportados/permisos/red inesperados y las rutas de recursos empaquetados para `.env`, credenciales, llaves o datos reales; no exportar contenidos sensibles. No borrar permisos necesarios de Pro sin contrato. No declarar `SQLCipher`, `Keystore`, `offline-físico` ni identidad kiosk como PASS por compilación estática. Si aparece un riesgo plausible, `BLOCKED_APK_SECURITY`, aunque APK firme correctamente.

## 4. Puerta A1-3 — entrega sin teléfono y siguiente gate preciso

Si existe un APK A1, preparar **máximo una página** de gate físico posterior, **pendiente de autorización específica**: comprobar paquete/firma/cambio con QA instalado en Mi A3 (sin reemplazo destructivo), arranque, flujo real entrada/pausa/reanudar/salida y turno nocturno, persistencia reinicio, identidad temporal kiosco, SQLite/SQLCipher/Keystore, corrupción fail-closed, respaldo/restauración cuando corresponda y ruta offline. El VM Service fue `BLOCKED` en C2; **no puede ser el único oráculo**. Esta página describe pruebas pendientes, NO ejecutadas. Sin APK nuevo, no crear plan extenso ni otra propuesta de pruebas.

### Estados contractuales finales

- `A1_SOURCE=PASS_82_OF_82|BLOCKED_N5_SOURCE|BLOCKED_COPY_INTEGRITY`.
- `A1_PUB=REUSED_N5|PASS_OFFLINE_LOCKED|BLOCKED_PUB_OFFLINE|NOT_RUN`.
- `A1_TOOLCHAIN=PASS_PREFLIGHT|BLOCKED_GRADLE_DISTRIBUTION|BLOCKED_GRADLE_CACHE|BLOCKED_ANDROID_SDK|BLOCKED_FLUTTER_SDK|BLOCKED_JDK|BLOCKED_DEBUG_SIGNING_ISOLATION|BLOCKED_VARIANT_AMBIGUOUS`.
- `A1_BUILD=PASS_NEW_DEBUG_APK|BLOCKED_ENV|BLOCKED_DEPENDENCY|FAIL_PRODUCT|NOT_RUN`.
- `A1_APK_METADATA=PASS_STATIC|BLOCKED_TOOLS|FAIL_SECURITY|NOT_RUN`.
- `RESULT=PASS_APK_QA_SCOPED` **solo si** paridad A1 + fuente exacta + build nuevo + firma + manifest + custodia PASS. Otro caso: `PARTIAL_WITH_GAPS|BLOCKED_ENV|FAIL_PRODUCT`, con causa identificada.
- `ANDROID_PHYSICAL=NOT_RUN`, `N5_FLUTTER=PASS_CANDIDATE_SCOPED_REUSED`, `DOCKER=NOT_TOUCHED`, `WIP_GUARDS=PASS_UNCHANGED|DELTA_UNEXPECTED`, `OFF_DEVICE_BACKUP=NO`, `RELEASE=NO_GO`.

### Único ZIP sanitario

`A1_ROOT\delivery\JOR-A1-ANDROID-OFFLINE-APK-QA-CANDIDATE-20261121-UNICO.zip`, **un solo archivo final**, contenido mínimo:

```text
FINAL_REPORT.md                # hechos, pasos omitidos, estado final y causa, nada sensible
A1_GATE_MATRIX.csv             # puertas causales, PASS/BLOCKED y evidencia
APP_SOURCE_PARITY.csv          # 82 rutas relativas/hash PRE/POST (sin código)
ANDROID_OFFLINE_BUILD.csv      # variante/tarea/exits/SDK/JDK, hash del APK si existe
APK_STATIC_METADATA.csv        # package, launcher, min/target, certificado público hash (si existe)
WIP_AND_N5_GUARDS.csv          # HEAD/index/status, custodia fuentes N5
BLOCKERS.md                    # solo si hay bloqueo
NEXT_PHYSICAL_GATE.md          # solo si APK nuevo + metadata estática válidos
MANIFEST_SHA256.csv            # hash y bytes de todos los demás miembros
```

Validar ZIP CRC de todos los miembros, manifiesto SHA256/tamaño, paths relativos únicos, sin symlink, sin datos de otros proyectos. Excluir APK, código fuente, fuente de plugins, claves, dumps, cachés, logcat, rutas personales, `.env`, credenciales, logs crudos o secretos. Informes con rutas relativas, hashes, versiones y códigos de salida. Al terminar, comparar WIP HEAD/rama/staged/índice PRE/POST y N5 candidato fuentes focales; reportar deltas de terceros sin manipularlos. El APK y pruebas completas siguen en D: privada, **no hay respaldo fuera de equipo**.

Respuesta final Codex al Director **solo**:

```text
TASK=JOR-A1-ANDROID-OFFLINE-APK-QA-CANDIDATE-20261121
PROMPT_REVISION=A1-R2-20261122
RESULT=PASS_APK_QA_SCOPED|PARTIAL_WITH_GAPS|BLOCKED_ENV|FAIL_PRODUCT
A1_SOURCE=...
A1_PUB=...
A1_TOOLCHAIN=...
A1_BUILD=...
A1_APK_METADATA=...
APK_SHA256=...             # si existe
APK_PRIVATE_PATH=...       # si existe: ruta D: para futura QA, no adjuntar binario
ANDROID_PHYSICAL=NOT_RUN
DOCKER=NOT_TOUCHED
WIP_GUARDS=...
OFF_DEVICE_BACKUP=NO
RELEASE=NO_GO
ZIP_PATH=...
ZIP_SHA256=...
NEXT_OWNER=CHATGPT_DIRECTOR
```

**Cierre:** no A2 automático, no auditoría ritual, no repetición de N2–N7. Si hay bloqueo ambiental, documentar una única causa y el recurso mínimo necesario; Director decidirá una sola autorización posterior. **AHORA SIGUE CODEX LUNA A1-R2 SOLO SI A1 NO EMPEZÓ; DESPUÉS SIGUE CHATGPT DIRECTOR.**

## Referencias verificables — contextual, NO nuevas tareas

- Evidencia ZIP N5 (SHA256 indicado): `FINAL_REPORT.md`, `CANDIDATE_DELTA_SUMMARY.csv`; fuente N5 no adjunta en ZIP.
- Evidencia ZIP C2 (`JOR-H9-C2-PHYSICAL-DART-V5-20261120-UNICO.zip`, SHA256 `711116067DDBF73E7CE4AD6A102D58E14AD5372D79A981F48978C54A76B35692`): instalación anterior C2/VM Service bloqueado; no es prueba de A1.
- Flutter Gradle plugin requiere `flutter.sdk` en local.properties: https://docs.flutter.dev/release/breaking-changes/flutter-gradle-plugin-apply
- Gradle Wrapper puede descargar antes de `--offline`: https://docs.gradle.org/current/userguide/gradle_wrapper.html
- Gradle Dependency Caching, caché de metadatos + binarios: https://docs.gradle.org/current/userguide/dependency_caching.html
- Android firma debug local y no publicable: https://developer.android.com/studio/publish/app-signing
