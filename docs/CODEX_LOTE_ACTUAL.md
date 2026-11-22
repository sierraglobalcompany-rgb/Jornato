# CODEX LUNA — JORNATO A2-R2 · REANUDACIÓN ÚNICA: REPOSITORIO FLUTTER ENGINE OFICIAL + APK QA

**EJECUTAR ESTE MACROBLOQUE, NO REDISEÑAR NI AUDITAR NUEVAMENTE.** Director: ChatGPT; ejecutor: una única instancia Codex Luna en Windows. **A2-R1 YA TERMINÓ con ZIP y cero intentos de Gradle.** Esta orden es la continuación puntual autorizada de A2-R1, no aplica la guarda antigua «si existe A2, detenerse» para la entrega R1 conocida. Reutiliza el laboratorio A2. Si A2-R2 ya comenzó/terminó, o no puedes demostrar propiedad exclusiva, detener sin segunda ejecución. No volver a copiar 82 fuentes, resolver Pub, verificar 31.270 cachés ni ejecutar A1/N2–N7. No generar A3 ni variantes improvisadas.

```text
TASK=JOR-A2-GRADLE-DEPS-APK-QA-20261122
PROMPT_REVISION=A2-R2-20261122
MODE=RESUME_COMPLETED_A2_R1_POLICY_STOP;BUILD_ATTEMPTS_A2_R1=0
WIP_ROOT=D:\codex\Jornato
A1_ROOT=D:\codex\_REPORTES\Jornato\JOR-A1-ANDROID-OFFLINE-APK-QA-CANDIDATE-20261121
N5_ROOT=D:\codex\_REPORTES\Jornato\JOR-N5-DOCKER-NONET-PUB-GATES-20261121
A2_ROOT=D:\codex\_REPORTES\Jornato\JOR-A2-GRADLE-DEPS-APK-QA-20261122
A2_R1_ZIP=D:\codex\_REPORTES\Jornato\JOR-A2-GRADLE-DEPS-APK-QA-20261122\delivery\JOR-A2-GRADLE-DEPS-APK-QA-20261122-UNICO.zip
A2_R1_ZIP_SHA256=C891EC71F5D30511065E0F902B1D97A19F5AA22F2D913FA48770E8D6328B6B24
A2_R2_DELIVERY=D:\codex\_REPORTES\Jornato\JOR-A2-GRADLE-DEPS-APK-QA-20261122\delivery-r2
A2_R1_SOURCE=PASS_82_OF_82;PUB=PASS_OFFLINE_LOCKED;PRIVATE_GRADLE_CACHE=PASS_31270_FILES;BUILD=NOT_RUN
WIP_REFERENCE_HEAD=faf5fe283191f8b5a2724b397009512a2caec1b6
WIP_REFERENCE_INDEX_SHA=25CC609803D7E68D5F3ECF428198B2432CF1EA37030546735DD3F03299D905E1
PUBSPEC_LOCK_SHA256=F515D69563850E8893A17585D8BAB57A8E6484E18CE1FEF4BDDC6BB836F83B34
ALLOWED_FLUTTER_MAVEN_URL=https://storage.googleapis.com/download.flutter.io
RELEASE=NO_GO;ANDROID_PHYSICAL=NOT_RUN;DOCKER=NOT_TOUCHED
NEXT_OWNER=CHATGPT_DIRECTOR
```

## 0. Autoridad y límite de cambios

**Decisión del Director:** admitir el repositorio Maven oficial que agrega `dev.flutter.flutter-gradle-plugin` para las dependencias `io.flutter` del engine, SIN añadir un repositorio nuevo al proyecto ni permitir Google Cloud Storage general. Flutter SDK oficial: `FlutterPlugin.kt` construye `$hostedRepository/${engineRealm}download.flutter.io`; host por defecto `https://storage.googleapis.com`. Referencias: https://github.com/flutter/flutter/blob/master/packages/flutter_tools/gradle/src/main/kotlin/FlutterPlugin.kt y https://docs.flutter.dev/add-to-app/android/project-setup.

**Autorizar exclusivamente** los destinos HTTPS siguientes para artefactos/metadata de compilación de versiones existentes: `plugins.gradle.org/m2`, `plugins-artifacts.gradle.org` (redirect oficial), `repo.maven.apache.org/maven2`, `dl.google.com/dl/android/maven2` y **`storage.googleapis.com/download.flutter.io/`**, o el prefijo **exacto** `storage.googleapis.com/<engine.realm>/download.flutter.io/` si `engine.realm` no está vacío en el SDK 3.47.8 instalado y pasa validación estricta de segmentos de ruta. Para `engine.realm` no permitir esquemas, `..`, `%`, query, fragmentos, doble slash, slash inicial, control chars, host externo ni rutas que escapen del prefijo; obtener la URI real con el algoritmo del plugin, no construir otro repositorio ni cambiar `FLUTTER_STORAGE_BASE_URL`. La autorización al bucket **no** abarca `/flutter_infra_release/` arbitrario, `/flutter/`, `/flutter_releases/`, otros buckets, descargas de SDK o contenido no relacionado. Ante otro destino/redirect, STOP y reportar URL de host/ruta sin secretos, sin reintentar.

**No se autoriza:** Docker/PHP/MariaDB; instalar/actualizar JDK, SDK, Flutter, Gradle, plugins, Kotlin o dependencias; repositorios alternos, JitPack, HTTP, proxies, cambios de firewall, scripts descargados, `--refresh-dependencies`, `flutter precache`, tareas Gradle de descarga generales; escribir fuera de `A2_ROOT/private`; usar claves release o `%USERPROFILE%\.android`; ADB/emuladores/teléfono; tocar Git/WIP, otros proyectos o cachés compartidas; subir código/APK a GitHub. No ejecutar Flutter tests ya cerrados. **La whitelist es una política de repositorios, NO un sandbox de egreso real**. Registrar `NETWORK_SCOPE=POLICY_CONTROLLED_NOT_EGRESS_SANDBOXED` si hay resolución en línea y no afirmar monitoreo completo de tráfico.

## 1. Reanudar checkpoint A2-R1 sin re-ejecutar pasos aprobados

1. Comprobar de solo lectura el ZIP A2-R1 conocido por SHA exacto, 7 miembros y manifiesto 6/6 **si no hay comprobación fiable de esta entrega**. Leer `FINAL_REPORT.md` y `BLOCKERS.md`, no reabrir A1. Confirmar que A2-R1 llegó a **cero** llamadas Gradle y cero APK, que no hay proceso A2 activo y que la nueva carpeta `delivery-r2` **no contiene un ZIP A2-R2 previo**. Si hay una ejecución nueva concurrente o R2 ya entregado, STOP `BLOCKED_CONCURRENT_OR_ALREADY_DONE` (no iniciar una tercera ejecución ni sobrescribir). La existencia del ZIP R1 **es esperada, no bloquea R2**.
2. Reusar `A2_ROOT/private/candidate`, `gradle-home`, `pub-cache`, `android-user` y `temp` creados en A2-R1. Comprobar que existen y son rutas físicas dentro de A2, no enlaces a WIP ni a proyectos ajenos. No rehacer la copia 82/82 ni el cotejo de 31.270 archivos. Validación focal: mismo `pubspec.lock` SHA, candidato bajo `private`, distribución Gradle 9.3.1, JDK21/SDK36/NDK existentes, variables `PUB_CACHE`, `GRADLE_USER_HOME`, `ANDROID_USER_HOME`, `TMP`/`TEMP` privadas de **este proceso**; comprobar solo lo necesario que A2-R1 no dejó a medio escribir. Si falta un componente base del laboratorio A2, informar nombre/ruta y `BLOCKED_A2_CHECKPOINT`, no reconstruirlo a ciegas desde WIP.
3. Leer WIP solo PRE/POST (`git rev-parse`, status index SHA) para comprobar que otra instancia no está editando Jornato; staged=0 según baseline. No hacer `git add`, `commit`, `push`, `pull`, `clean`, `reset`, `stash`, `checkout` o `merge`. Si delta inesperado y dueño incierto: STOP. No borrar ZIP ni evidencias R1; el nuevo ZIP es de **R2** en la carpeta distinta `delivery-r2`.
4. Confirmar estáticamente en el Flutter SDK efectivamente usado: `FLUTTER_STORAGE_BASE_URL` está ausente (como en R1), `engine.realm` legible, `engine.stamp`/`engine.version` verificables y plugin `FlutterPlugin.kt` contiene el repositorio esperado. Comparar el prefijo Maven calculado con la autorización precisa anterior; si no coincide, STOP con `BLOCKED_REPOSITORY_POLICY`. Verificar que plugin añade repositorio para dependencias de **engine Flutter de la variante QA**, no confundir con `resolve_dependencies.gradle.kts` de precache. No mutar el SDK ni Gradle scripts para introducir URLs.
5. Conservar las verificaciones R1 sobre fuentes 82/82, Pub 79, lock y caché privada. El inventario A1 de 22 variantes (21 coordenadas GAV distintas) sigue pendiente **de resolución**, no se copian JAR manualmente ni se inventan hashes. R1 demuestra que faltan dependencias, por tanto elegir directamente `OFFICIAL_FETCH_NEEDED`; no lanzar un build offline fallido. Se permiten las transitivas de versiones existentes desde repositorios oficiales de la whitelist. Mantener `android.builder.sdkDownload=false` y `org.gradle.java.installations.auto-download=false` en copia privada A2, JDK/SDK reales y signing debug privado. Chequear fuentes de repositorios de build `settings.gradle(.kts)`/`build.gradle(.kts)` solo en el delta relevante, sin repetir auditoría general Gradle.

## 2. Una sola compilación y salida medible

**Objetivo exacto:** `:app:assembleB14qaDebug` desde `A2_ROOT/private/candidate/android`, una vez, con wrapper 9.3.1 ya instalado y `--no-daemon --console=plain --max-workers=2` y sin `--offline` (porque R1 y A1 documentaron dependencias faltantes). `GRADLE_USER_HOME`, cachés Pub, entorno Android, temporales, firma QA y resultados bajo A2 privado; sin instalar nada global. No `flutter build apk`, no segundo target ni variante. Si una solicitud viola la whitelist, STOP y registrar bloqueo **sin descargar**. Si no hay fallo de política, permitir que Gradle resuelva lo requerido desde endpoints autorizados, capturando coordenadas, classifier, versión, origen, checksum y errores sanitizados; no forzar otro repositorio manualmente. La compilación QA puede continuar aun cuando haya `usesCleartextTraffic=true` en el **sourceSet debug**, pero impide aprobar release o usar datos reales.

Si el build falla por dependencia oficial inaccesible: entregar `BLOCKED_OFFICIAL_DEPENDENCY` (artefacto/HTTP status/prefijo URL autorizado) y **no reintentar** con mirror, cambio de versión, otra tarea o Gradle cache global. Si falla por código de aplicación real, máximo **una corrección mínima en copia A2**, diff privado, y un solo reintento de la misma tarea; nunca sobre WIP. Si falta SDK/JDK, permisos, signing seguro o espacio, detener `BLOCKED_ENV`. No descargar toolchains. La salida debe ser verificable: `PASS_APK_QA_SCOPED` solo con APK realmente generado R2 y comprobación estática posterior.

---
## 3. Puerta A2-2: una compilación, no otro ciclo de intentos

1. Confirmar variante desde el `android/app/build.gradle.kts` **copiado**: task exacta observada en A1 `:app:assembleB14qaDebug`. Si el código cambió de forma incompatible frente al snapshot A1, STOP y documentar; no inventar variante. `lib/main.dart` es entrada habitual, verificar target real. No tratar el harness `integration_test` como APK instalable.
2. Ejecutar **UNA** vez el wrapper 9.3.1 ya presente en la copia A2, desde `candidate/android`, con `--no-daemon --console=plain --max-workers=2` (ajustar a 1 si recursos compartidos escasos) y `--offline` solo si `OFFLINE_COMPLETE`; si requiere resolver las dependencias oficiales, omitir `--offline` y mantener la restricción de repositorios. **No** `--refresh-dependencies`, `flutter build apk` alternativo, `gradle build` general, segunda variante, tarea completa de tests, ni transformaciones de build scripts. Capturar stdout/stderr y hashes en archivos `private/logs`, no en ZIP. Usar contraseña/propiedades QA sintéticas, no globales.
3. Antes del proceso confirmar repositorios declarados; durante él registrar solo eventos de resolución, coordenadas/dominios visibles y escritura en `gradle-home`, sin registro de tráfico de otros procesos. Si aparece petición/destino no autorizado, tarea de descarga de SDK/JDK o escritura fuera de A2, **detener la tarea propia**, clasificar `BLOCKED_NETWORK_POLICY`/`BLOCKED_WRITE_BOUNDARY` y no reintentar. **La inspección de logs no demuestra todo el tráfico de red.** No activar proxy/firewall, no capturar paquetes de otros proyectos, no afirmar un sandbox inexistente. Los scripts Gradle tienen capacidad de ejecutar código: la revisión estática y la fuente custodiada son obligatorias.
4. Clasificar fin:
   - `PASS_NEW_APK`: Gradle exit 0 y APK **creado durante A2** con ruta/certificado/manifest verificables;
   - `BLOCKED_OFFICIAL_DEPENDENCY`: Maven/Gradle oficial no resuelve coordenada fija (HTTP status/URL **sin secreto** y artefacto específico), sin inventar actualización;
   - `BLOCKED_NETWORK_POLICY`: repo/redirect prohibido, proxy no autorizado o intento de descarga por tarea no admitida; STOP sin más intentos; `BLOCKED_NETWORK_ENFORCEMENT`: nivel de control requerido no alcanzable sin modificar configuración global; `BLOCKED_WRITE_BOUNDARY`: escritura o firma fuera del laboratorio;
   - `BLOCKED_ENV`: SDK/JDK/espacio/firma/paquete ausente;
   - `FAIL_PRODUCT`: compilador demuestra error de fuente propia (ruta + línea). Se permite **máximo una corrección mínima de fuente en COPIA A2** y una nueva ejecución de **la misma tarea** SOLO por `FAIL_PRODUCT`, guardando diff y hash privado; nunca por ausencia de dependencia/entorno. No migrar fix al WIP sin dictamen del Director.
5. Un APK no existe hasta verificar `:app:assembleB14qaDebug` exit 0 y salida nueva localizada en `candidate/build/app/outputs` o `candidate/android/app/build/outputs`. No usar el APK viejo C2. Copiar APK final solo a `A2_ROOT/private/product`, SHA256, tamaño, variante, fecha, package. No subir APK a GitHub ni al ZIP.

## 4. Puerta A2-3: identidad, firma y seguridad QA, sin teléfono

1. Sobre el **APK A2 real** usar SDK Android local `apksigner verify --verbose --print-certs` y `aapt dump badging` o `apkanalyzer manifest print`; registrar package/applicationId, versionCode, versionName, min/target SDK, Activity launcher, certificate digest, debug, ABI y checksum APK. Si faltan herramientas de lectura o APK inválido, no certificar `PASS_APK_STATIC`.
2. Inspeccionar **manifiesto fusionado** y package final: componentes exportados/permisos, accidental inclusion de `.env`, secretos, tokens, key material, debug config y `android:usesCleartextTraffic`. A1 detectó `usesCleartextTraffic="true"` en **`src/b14qa/debug/AndroidManifest.xml` solamente**. Esto exige marcar `QA_CLEARTEXT_ALLOWED` si persiste en debug; **no bloquear arbitrariamente la construcción QA únicamente por una bandera debug**, pero NO aprobar distribución, uso de red con datos reales, pruebas remotas ni tratarla como configuración release. Si hay exposición material o secretos en APK, `BLOCKED_APK_SECURITY`. Si el origen `b14qa/debug` permanece cleartext, registrar explícitamente `QA_DEBUG_CLEARTEXT=TRUE` y **no enviar esa APK a usuarios externos ni instalar con datos reales**. Rechazar de inmediato si la variante se confunde con release o incluye material privado; generar solo QA local. Si no existe APK, estos gates siguen `NOT_RUN` (no inventar manifiesto fusionado).
3. Ninguna prueba Android física: no ADB/AVD/teléfono, reinstalación sobre C2 ni VM Service. Un APK QA firmado con nueva clave puede ser incompatible con C2 instalado; advertir sin modificarlo. Tampoco afirmar SQLCipher/Keystore, backup/restore o aislamiento tenant real por una compilación.
4. Con APK validado, incluir **una página máxima** `NEXT_ANDROID_PHYSICAL_GATE.md` describiendo qué falta comprobar en un teléfono: compatibilidad de firma y paquete, arranque, entrada/pausa/reanudar/salida, rehidratación offline tras reinicio, kiosco sin persistencia de identidad temporal, integridad DB/SQLCipher, fallo cerrado de corrupción, GPS/selfie condicionados a política, respaldo/restauración y sin HTTP inseguro. Es plan, no prueba ejecutada. `RELEASE=NO_GO`.

## 5. Evidencias sanitizadas — un ZIP, cierre sin perseguir la cola

En `A2_R2_DELIVERY` crear exactamente **un ZIP nuevo** (el ZIP A2-R1 anterior se conserva intacto en `A2_ROOT/delivery`), con CRC y manifiesto SHA256+bytes verificados. Archivos relevantes, ninguno redundante:

```text
FINAL_REPORT.md
A2_GATE_MATRIX.csv
SOURCE_AND_WIP_GUARDS.csv
GRADLE_DEPENDENCY_RESOLUTION.csv   # 22 archivos/variantes A1 y cualquier transitivo nuevo: GAV+classifier, origen, SHA, modo, resultado
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
GRADLE_DEPS=PASS_OFFLINE|PASS_OFFICIAL_FETCH|BLOCKED_REPOSITORY_POLICY|BLOCKED_NETWORK|BLOCKED_WRITE_BOUNDARY|BLOCKED_ENV
A2_BUILD=PASS_NEW_APK|BLOCKED_DEPENDENCY|BLOCKED_ENV|FAIL_PRODUCT|NOT_RUN
A2_APK_STATIC=PASS_QA|BLOCKED_APK_SECURITY|NOT_RUN
NETWORK_SCOPE=OFFLINE|POLICY_CONTROLLED_NOT_EGRESS_SANDBOXED|BLOCKED_NETWORK_ENFORCEMENT|NOT_RUN
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

**Después del único ZIP A2-R2, ChatGPT Director adjudica el APK o el bloqueo. A2-R1 ya se ejecutó y su ZIP debe conservarse; A2-R2 es reanudación autorizada tras bloqueo de política, NO segundo intento de compilación. Si A2-R2 ya está activo o finalizado, no duplicarlo.** No liberar Jornada a producción, no tocar otros proyectos. PingPongLaw L1–L6: KISS, raíz demostrada, no pruebas rituales, no falsos PASS, evidencia única.

## Fuentes técnicas externas (no mandatos)

- Plugin Portal redirige a host oficial adicional: https://plugins.gradle.org/docs/mirroring
- Pre-build scripts/Gradle User Home seguridad: https://docs.gradle.org/current/userguide/securing_build_tool.html
- Android SDK auto-download (inhabilitar en copia QA): https://developer.android.com/studio/intro/update
- Gradle Java toolchains auto-provisioning (inhabilitar en copia QA): https://docs.gradle.org/current/userguide/toolchains.html

- Gradle dependency cache, metadata + artifacts, copia segura de modules-2 y resolución: https://docs.gradle.org/current/userguide/dependency_caching.html
- Gradle CLI/offline: https://docs.gradle.org/current/userguide/command_line_interface.html
- Android manifest merger: https://developer.android.com/build/manage-manifests
- App signing: https://developer.android.com/studio/publish/app-signing
