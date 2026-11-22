# CODEX LUNA — JORNATO A2 · UN MACROBLOQUE PRODUCTIVO PARA DESBLOQUEAR GRADLE Y ENTREGAR APK QA

**ESTA ES LA ORDEN QUE SE EJECUTA, NO UNA INVITACIÓN A REAUDITAR.** ChatGPT Director decide el procedimiento; Codex Luna lo ejecuta fielmente en Windows 11. Fecha del corte: 22-11-2026, Colombia. **A1-R2 TERMINÓ** y fue adjudicado; A2 es una tarea sucesora con causa identificada, NO un reinicio de A1 ni continuación de N5–N7. Enviar este Markdown a Codex constituye la decisión del propietario de realizar la campaña A2, **incluida la autorización acotada de obtener dependencias de compilación oficiales e inmutables descrita abajo**. Si el propietario no desea esa autorización, NO enviar el prompt a Codex y mantener A2 inactivo. La app seguirá siendo *offline*; la red solo se admite en el **equipo de desarrollo** para resolver dependencias del build.

```text
TASK=JOR-A2-GRADLE-DEPS-APK-QA-20261122
PROMPT_REVISION=A2-V1-20261122
WIP_ROOT=D:\codex\Jornato
A1_ROOT=D:\codex\_REPORTES\Jornato\JOR-A1-ANDROID-OFFLINE-APK-QA-CANDIDATE-20261121
N5_ROOT=D:\codex\_REPORTES\Jornato\JOR-N5-DOCKER-NONET-PUB-GATES-20261121
A2_ROOT=D:\codex\_REPORTES\Jornato\JOR-A2-GRADLE-DEPS-APK-QA-20261122
A1_ZIP_SHA256=C0087642ACED1BE983DC081A95A63B0B4829EE30414372B29835A4852D79555A
N5_ZIP_SHA256=162118EFD4260B97A425E969CB90C06C54A4CAA0003FEC82F2C68A2BD53E84CC
A1_SOURCE=82/82_PASS;A1_PUB=79/79_OFFLINE_LOCKED
A1_BUILD=:app:assembleB14qaDebug_EXIT_1_MISSING_GRADLE_CACHE
A1_MISSING=22_ARTIFACT_FILES;KOTLIN_2.2.21;GRADLE_KOTLIN_DSL_PLUGINS_6.4.2
N5_PUB_LOCK_SHA256=F515D69563850E8893A17585D8BAB57A8E6484E18CE1FEF4BDDC6BB836F83B34
WIP_HEAD_REFERENCE=faf5fe283191f8b5a2724b397009512a2caec1b6
WIP_INDEX_REFERENCE=25CC609803D7E68D5F3ECF428198B2432CF1EA37030546735DD3F03299D905E1
BUILD_TIME_NETWORK=ALLOW_EXACT_OFFICIAL_DEPENDENCIES_ONLY
RELEASE=NO_GO;ANDROID_PHYSICAL=NOT_RUN;DOCKER=NOT_TOUCHED
NEXT_OWNER=CHATGPT_DIRECTOR
```

## 0. Objetivo, resultados válidos y prohibiciones

**Resultado principal:** desde las 82 fuentes certificadas en A1/N5, conseguir un **APK QA debug nuevo** de `:app:assembleB14qaDebug` con SHA256, firmante y manifiesto fusionado verificables. Si no es posible, entregar el **bloqueo causal final** y su remedio preciso, sin abrir otra auditoría y sin tanteos múltiples.

**Regla de no repetición:** N2 86 tests, N3 9+4, N4 232 rutas, N5 Flutter 9/9, N6–N7 PHP/Docker y A1 82/82/Pub PASS **SE REUTILIZAN**, no se reejecutan sobre WIP. En A2 solo se comparan hashes focales al copiar, la resolución Gradle y el APK. No repetir el build offline de A1 sobre su antigua caché. **A1 permanece cerrado**.

**No tocar**: PHP, MariaDB, Docker Desktop/engine, redes o volúmenes ajenos; otros proyectos Codex; el teléfono Xiaomi, ADB/AVD/emulador; claves release; bases de producción; GitHub/WIP Git (`add`, `commit`, `push`, `pull`, `reset`, `stash`, `clean`, `checkout`, `merge`); configuraciones globales de Windows; cachés Android/Gradle/Flutter compartidas (solo lectura si su identidad y permisos lo permiten). No publicar APK, fuentes ni reportes privados. No ejecutar `flutter build apk` como segunda ruta, ni `gradle build` genérico, ni `--refresh-dependencies`, `gradle wrapper`, `sdkmanager`, `flutter precache`, `flutter pub upgrade`, `apt`, `choco`, `winget`, cambios de versiones, repositorios nuevos, certificados ni proxies de sistema.

**Única excepción nueva respecto a A1:** se permite a **Gradle del proyecto QA** descargar artefactos y metadatos de compilación **solo en la caché privada A2**, desde repositorios HTTPS oficiales ya declarados en los archivos Gradle auténticos: `https://plugins.gradle.org/m2`, Maven Central `https://repo.maven.apache.org/maven2`, Google Maven `https://dl.google.com/dl/android/maven2` (redirigidos oficiales de esos mismos servicios, comprobados). No se permite URL HTTP, repositorios improvisados, mirrors de terceros, JitPack, SNAPSHOT, versiones dinámicas, credenciales personales, `--refresh-dependencies`, nuevos SDK/JDK, instalación de herramientas ni downloads de la aplicación. Si la configuración real requiere otro dominio, proxy o repositorio, **STOP `BLOCKED_REPOSITORY_POLICY`**: no modificar la política a ciegas. Si hay un redirect a dominio no reconocido, STOP. Las dependencias transitivas con versiones fijas que Gradle resuelva desde repositorios autorizados son admisibles; 22 es el **mínimo conocido de A1, no un límite falso del grafo completo**. Conservar registro de coordenadas, dominio e integridad SHA256, sin secretos ni URLs con tokens. Si solo hay paquetes ya disponibles, compilar `--offline`.

## 1. Puerta única A2-0: impedir concurrencia y usar evidencia existente

1. Antes de toda escritura, inspeccionar la entrega `A2_ROOT/delivery`, procesos Codex/Gradle de este mismo `TASK` y si ya existe A2. Si A2 está en marcha, fue completada o su propiedad es indeterminada, **NO lanzar segunda ejecución**: reportar `A2_ALREADY_IN_FLIGHT_OR_FINISHED`. En cambio, A1 terminado **no bloquea A2**. Un solo Codex dueño de `D:\codex\Jornato`.
2. Validar A1 ZIP mediante el SHA informado, CRC y `MANIFEST_SHA256.csv` si no hay verificación reciente confiable. Leer `FINAL_REPORT.md`, `BLOCKERS.md`, `ANDROID_OFFLINE_BUILD.csv`, `APP_SOURCE_PARITY.csv`, `WIP_AND_N5_GUARDS.csv`. No rehacer las pruebas A1. Verificar que el A1 reporta **22 artefactos JAR/metadata** (uno es el plugin Kotlin DSL 6.4.2 y los demás variantes de Kotlin 2.2.21) y build exit 1 al configurar el plugin Flutter, antes de compilar fuentes de app. No diagnosticar falla de producto por falta de caché.
3. WIP read-only: capturar HEAD, rama, 235 entradas de status como referencia (no forzarlas), staged, SHA del índice y posibles procesos activos; comparar PRE/POST. Si hay otro Codex modificando Jornato al mismo tiempo, `BLOCKED_CONCURRENT_WIP`; no atribuir cambios a A2. No `git status` costoso repetido; dos lecturas PRE/POST son suficientes.
4. **Fuente de A2:** reutilizar la copia privada A1 de 82 rutas de app como fuente INMUTABLE. Si no existe, reutilizar la copia N5 original ya certificada y el CSV 82/82 de A1 como oráculo. Jamás reconstruir desde `main`/PR antiguo ni copiar el WIP sin custodia. Crear en `A2_ROOT/private/candidate` una única copia ordinaria (sin symlinks/junctions/hardlinks), con paths relativos, hashes de app esperados; registrar 82/82 frente a A1/N5 sin reanalizar backend. No editar los originales. `pubspec.lock` debe conservar SHA `F515D695...34` completo indicado arriba.
5. Preparar `private/{candidate,gradle-home,pub-cache,android-user,temp,logs,product,artifact-inventory}`. Proteger rutas y permisos: **solo D:\codex\_REPORTES\Jornato\JOR-A2-...** para modificaciones; nada bajo A1/N5/WIP o `%USERPROFILE%/.gradle` (excepto lectura de inventario), nada bajo otras carpetas de proyectos. Copia de cachés solo de A1/N5 autorizados; no clonar cachés de proyectos ajenos. No incluir cache/JAR en ZIP.

## 2. Puerta A2-1: precarga mínima y política de red con una sola decisión

1. Reutilizar resultados del preflight A1 sin re-ejecutar diagnósticos completos: Flutter SDK 3.47.8/Dart 3.13.7, JDK 21.0.12, Android SDK 36, NDK 28.2.13676358, CMake 3.22.1 y Gradle 9.3.1 **estaban disponibles**. Comprobar SOLO que siguen existiendo las rutas realmente utilizadas (lectura focal). Gradle Wrapper/JAR y la distribución 9.3.1 de A1 son fuentes autorizadas para clonar a `gradle-home` A2, sin usar el wrapper para descargar distribución. Si la distribución no puede trasladarse íntegra, STOP `BLOCKED_GRADLE_DISTRIBUTION`; no descargarla automáticamente.
2. Copiar desde A1 **la caché de Gradle privada ya usada**, incluidos artefactos y metadatos compatibles, a `gradle-home` A2. Al trasladar `caches/modules-2`, preservar la estructura de directorios y metadatos; **no copiar `*.lock` ni `gc.properties`** (documentación oficial Gradle); no alterar la fuente. No copiar `init.d` desconocidos, tokens, gradle.properties con credenciales, daemon registry ni caches de otros proyectos. Se permite inspección puntual de caché estándar del host **solo para saber si existen esos 22 artefactos**, sin modificarla ni apropiarse de sus secretos; NO mezclar archivos JAR sueltos ni inventar metadata de resolución. Si existe una fuente completa y verificada en A1/Gradle cache propio de Jornato, preferir una copia autorizada con metadatos preservados y modo `--offline`.
3. Lectura estática **focal** de `settings.gradle.kts`, `build.gradle.kts`, `gradle-wrapper.properties`, `gradle.properties` y el build incluido del SDK Flutter indicado por el proyecto: identificar repositorios oficiales efectivos y versiones fijas `6.4.2`, `2.2.21`, AGP real; **no cambiarlas**. Revisar si hay repositorios extra, credenciales/URLs secretos, HTTP, plugins de build remotos no autorizados, versiones dinámicas y tareas de descarga no Gradle. Ante duda material, `BLOCKED_REPOSITORY_POLICY` antes de ejecutar. No leer `.env` productivo.
4. Preparar proceso A2 con `GRADLE_USER_HOME=.../private/gradle-home`, `PUB_CACHE=.../private/pub-cache`, `ANDROID_USER_HOME=.../private/android-user`, `TEMP/TMP=.../private/temp`, `JAVA_HOME` y SDK reales. Restaurar variables de proceso al terminar. Copiar los 79 hosted Pub/metadata aprobados de N5/A1 a Pub privado A2 y ejecutar `flutter pub get --offline --enforce-lockfile` **SOLO si hace falta nuevo package_config**. Nunca descargar dependencias Dart ni alterar lock. Crear `android/local.properties` en copia A2 a partir de rutas SDK existentes, con sintaxis Java Properties, sin editar WIP.
5. Reutilizar signing QA debug **aislado** de A1 si ya existe un keystore propio verificable en su laboratorio sin modificarlo; alternativamente generar clave **nueva solo en `private/android-user` A2** si el build QA lo requiere y su configuración la permite. No usar claves reales/release ni generar claves globales. Registrar que certificado distinto al APK C2 previamente instalado impide actualización directa, sin instalarlo. Debug keystore y paths no van al ZIP.
6. Determinar modo **una sola vez**, antes del build:
   - `OFFLINE_COMPLETE`: el preflight demuestra resolución plena de las 22 coordenadas y metadatos en caché privada compatible; ejecutar única tarea Gradle `--offline`.
   - `OFFICIAL_FETCH_NEEDED`: falta al menos un artefacto o metadata privado; dado que el propietario **autoriza estas descargas de build al entregar este prompt**, ejecutar **una sola tarea Gradle sin `--offline`** y dejar que Gradle resuelva las versiones existentes únicamente desde los repositorios oficiales listados, escribiendo exclusivamente en `private/gradle-home`. No iniciar primero un build offline sabiendo que faltan paquetes. No precalentar con un comando Gradle adicional.
   - Si no puede garantizarse el dominio/repo, la integridad o la custodia, STOP antes del build `BLOCKED_REPOSITORY_POLICY` o `BLOCKED_NETWORK_AUTH`. No alterar Windows/firewall/proxy ni cambiar la versión para pasar.

## 3. Puerta A2-2: una compilación, no otro ciclo de intentos

1. Confirmar variante desde el `android/app/build.gradle.kts` **copiado**: task exacta observada en A1 `:app:assembleB14qaDebug`. Si el código cambió de forma incompatible frente al snapshot A1, STOP y documentar; no inventar variante. `lib/main.dart` es entrada habitual, verificar target real. No tratar el harness `integration_test` como APK instalable.
2. Ejecutar **UNA** vez el wrapper 9.3.1 ya presente en la copia A2, desde `candidate/android`, `--no-daemon --console=plain` y `--offline` solo si `OFFLINE_COMPLETE`; si requiere resolver las dependencias oficiales, omitir `--offline` y mantener la restricción de repositorios. **No** `--refresh-dependencies`, `flutter build apk` alternativo, `gradle build` general, segunda variante, tarea completa de tests, ni transformaciones de build scripts. Capturar stdout/stderr y hashes en archivos `private/logs`, no en ZIP. Usar contraseña/propiedades QA sintéticas, no globales.
3. Durante el proceso observar de forma acotada los dominios autorizados y el crecimiento de `gradle-home`; abortar con bloqueo si aparece destino no autorizado, escritura fuera de A2 o instrucciones de instalar/actualizar herramientas. No declarar que sin `--offline` la red está físicamente aislada: es una autorización de confianza limitada, no un sandbox. Los scripts Gradle tienen capacidad de ejecutar código: la revisión estática y la fuente custodiada son obligatorias.
4. Clasificar fin:
   - `PASS_NEW_APK`: Gradle exit 0 y APK **creado durante A2** con ruta/certificado/manifest verificables;
   - `BLOCKED_OFFICIAL_DEPENDENCY`: Maven/Gradle oficial no resuelve coordenada fija (HTTP status/URL **sin secreto** y artefacto específico), sin inventar actualización;
   - `BLOCKED_NETWORK_POLICY`: repo/redirect prohibido o proxy no autorizado; STOP sin más intentos;
   - `BLOCKED_ENV`: SDK/JDK/espacio/firma/paquete ausente;
   - `FAIL_PRODUCT`: compilador demuestra error de fuente propia (ruta + línea). Se permite **máximo una corrección mínima de fuente en COPIA A2** y una nueva ejecución de **la misma tarea** SOLO por `FAIL_PRODUCT`, guardando diff y hash privado; nunca por ausencia de dependencia/entorno. No migrar fix al WIP sin dictamen del Director.
5. Un APK no existe hasta verificar `:app:assembleB14qaDebug` exit 0 y salida nueva localizada en `candidate/build/app/outputs` o `candidate/android/app/build/outputs`. No usar el APK viejo C2. Copiar APK final solo a `A2_ROOT/private/product`, SHA256, tamaño, variante, fecha, package. No subir APK a GitHub ni al ZIP.

## 4. Puerta A2-3: identidad, firma y seguridad QA, sin teléfono

1. Sobre el **APK A2 real** usar SDK Android local `apksigner verify --verbose --print-certs` y `aapt dump badging` o `apkanalyzer manifest print`; registrar package/applicationId, versionCode, versionName, min/target SDK, Activity launcher, certificate digest, debug, ABI y checksum APK. Si faltan herramientas de lectura o APK inválido, no certificar `PASS_APK_STATIC`.
2. Inspeccionar **manifiesto fusionado** y package final: componentes exportados/permisos, accidental inclusion de `.env`, secretos, tokens, key material, debug config y `android:usesCleartextTraffic`. A1 detectó `usesCleartextTraffic="true"` en **`src/b14qa/debug/AndroidManifest.xml` solamente**. Esto exige marcar `QA_CLEARTEXT_ALLOWED` si persiste en debug; **no bloquear arbitrariamente la construcción QA únicamente por una bandera debug**, pero NO aprobar distribución, uso de red con datos reales, pruebas remotas ni tratarla como configuración release. Si hay exposición material o secretos en APK, `BLOCKED_APK_SECURITY`. Si no existe APK, estos gates siguen `NOT_RUN` (no inventar manifiesto fusionado).
3. Ninguna prueba Android física: no ADB/AVD/teléfono, reinstalación sobre C2 ni VM Service. Un APK QA firmado con nueva clave puede ser incompatible con C2 instalado; advertir sin modificarlo. Tampoco afirmar SQLCipher/Keystore, backup/restore o aislamiento tenant real por una compilación.
4. Con APK validado, incluir **una página máxima** `NEXT_ANDROID_PHYSICAL_GATE.md` describiendo qué falta comprobar en un teléfono: compatibilidad de firma y paquete, arranque, entrada/pausa/reanudar/salida, rehidratación offline tras reinicio, kiosco sin persistencia de identidad temporal, integridad DB/SQLCipher, fallo cerrado de corrupción, GPS/selfie condicionados a política, respaldo/restauración y sin HTTP inseguro. Es plan, no prueba ejecutada. `RELEASE=NO_GO`.

## 5. Evidencias sanitizadas — un ZIP, cierre sin perseguir la cola

En `A2_ROOT/delivery` crear exactamente **un ZIP**, con CRC y manifiesto SHA256+bytes verificados. Archivos relevantes, ninguno redundante:

```text
FINAL_REPORT.md
A2_GATE_MATRIX.csv
SOURCE_AND_WIP_GUARDS.csv
GRADLE_DEPENDENCY_RESOLUTION.csv   # 22 artefactos A1 y todo nuevo descargado: coordenada, origen, SHA, modo, resultado
ANDROID_BUILD_AND_APK.csv          # variante, Gradle/JDK/SDK, tarea, exit, APK SHA si existe
APK_SECURITY_SUMMARY.csv           # solo si se construyó APK
NEXT_ANDROID_PHYSICAL_GATE.md      # solo si APK estático válido
BLOCKERS.md                        # solo si falla
MANIFEST_SHA256.csv
```

No adjuntar APK, código, JARs, caches, metadatos binarios, URLs con credenciales, `.env`, claves/debug.keystore, logs crudos, `local.properties` con paths, capturas, manifest completo, DB o datos reales. Si no hay APK, no generar archivos QA ficticios. Guardar originales privados en D: para reproducción, no crear backup externo ficticio. Manifest CRC/hash de cada entrada, filenames seguros, informe con rutas relativas/redactadas. Antes de terminar comprobar PRE/POST del WIP e índice, fuente A1/N5 intacta y que no hubo archivos A2 fuera de `A2_ROOT` (excepto uso normal de SDK/herramientas preexistentes, que no deben actualizarse). `DOCKER=NOT_TOUCHED`.

**Formato de respuesta Codex, sin prosa larga ni archivos dispersos:**

```text
TASK=JOR-A2-GRADLE-DEPS-APK-QA-20261122
RESULT=PASS_APK_QA_SCOPED|PARTIAL_WITH_GAPS|BLOCKED_ENV|FAIL_PRODUCT
SOURCE=PASS_82_OF_82|BLOCKED
GRADLE_DEPS=PASS_OFFLINE|PASS_OFFICIAL_FETCH|BLOCKED_REPOSITORY_POLICY|BLOCKED_NETWORK|BLOCKED_ENV
A2_BUILD=PASS_NEW_APK|BLOCKED_DEPENDENCY|BLOCKED_ENV|FAIL_PRODUCT|NOT_RUN
A2_APK_STATIC=PASS_QA|BLOCKED_APK_SECURITY|NOT_RUN
A2_APK_SHA256=<SHA or NOT_BUILT>
A2_APK_PRIVATE_PATH=<D: path or NOT_CREATED>
ANDROID_PHYSICAL=NOT_RUN
WIP_GUARDS=PASS_UNCHANGED|DELTA_UNEXPECTED
DOCKER=NOT_TOUCHED
OFF_DEVICE_BACKUP=NO
RELEASE=NO_GO
ZIP_PATH=<UNICO.zip>
ZIP_SHA256=<SHA256>
NEXT_OWNER=CHATGPT_DIRECTOR
```

**Después de un solo ZIP A2, el Director decide el siguiente hito Android; nunca volver a construir A1 ni repetir las 22 coordenadas salvo delta demostrado.** No liberar Jornada a producción, no tocar otros proyectos. PingPongLaw L1–L6: KISS, raíz demostrada, no pruebas rituales, no falsos PASS, evidencia única.

## Fuentes técnicas externas (no mandatos)

- Gradle dependency cache, metadata + artifacts, copia segura de modules-2 y resolución: https://docs.gradle.org/current/userguide/dependency_caching.html
- Gradle CLI/offline: https://docs.gradle.org/current/userguide/command_line_interface.html
- Android manifest merger: https://developer.android.com/build/manage-manifests
- App signing: https://developer.android.com/studio/publish/app-signing
