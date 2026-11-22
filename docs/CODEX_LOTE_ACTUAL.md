# CODEX LUNA — JORNATO A2-R4 · COMPATIBILIDAD OFICIAL AGP 9 → UNA COMPILACIÓN APK QA

> **TAREA EJECUTABLE Y PRODUCTIVA. No reauditar, no rediseñar, no crear A3.** ChatGPT Director decide; Codex Luna verifica puertas y ejecuta. La revisión afecta únicamente el delta real observado en A2-R3. El producto sigue offline; esta es QA de desarrollo, no un release. Fecha 22-NOV-2026 (Colombia).

```text
TASK=JOR-A2-GRADLE-DEPS-APK-QA-20261122
PROMPT_REVISION=A2-R4-20261122
A2_ROOT=D:\codex\_REPORTES\Jornato\JOR-A2-GRADLE-DEPS-APK-QA-20261122
WIP_ROOT=D:\codex\Jornato
R3_ZIP=delivery-r3\JOR-A2-GRADLE-DEPS-APK-QA-20261122-R3-UNICO.zip
R3_SHA256=5C3E7B1758380CE8D7895C1EF1981F2FD131A4A90F79C8A300BAF57153214D11
A2_R1_ZIP_SHA256=C891EC71F5D30511065E0F902B1D97A19F5AA22F2D913FA48770E8D6328B6B24
WIP_REFERENCE_HEAD=faf5fe283191f8b5a2724b397009512a2caec1b6
WIP_INDEX_SHA256=25CC609803D7E68D5F3ECF428198B2432CF1EA37030546735DD3F03299D905E1
EXACT_BUILD_TASK=:app:assembleB14qaDebug
RELEASE=NO_GO
NEXT_OWNER=CHATGPT_DIRECTOR
```

## 0. DECISIÓN DEL DIRECTOR: UN SOLO CAMBIO CAUSAL, NINGÚN OTRO

**Resultado R3 verificado por el Director:** ZIP 9.188 bytes, 7 miembros, CRC PASS, manifiesto 6/6 SHA+bytes PASS. UNA ejecución `:app:assembleB14qaDebug` con exit 1 en `dev.flutter.flutter-gradle-plugin`. AGP 9.1.0 creó `ApplicationExtensionImpl`; Flutter 3.47.8 intenta `AbstractAppExtension` en `FlutterPlugin.kt:354`, provocando `ClassCastException` ANTES de compilar fuentes Jornato. Fuente 82/82 y Pub ya certificados. Las 22 variantes que faltaban en A1 están disponibles; R3 inventarió 39 JAR nuevos (38 GAV). En R3 no hubo APK; WIP y R1 quedaron intactos; no Docker ni Android físico.

**Única corrección permitida por esta orden:** En `android/gradle.properties` **de una COPIA PRIVADA R4**, establecer `android.newDsl=false`, propiedad de compatibilidad oficial y temporal de Flutter/AGP 9. Verificar que la propiedad no se contradiga en otra configuración efectiva. NO editar otros scripts ni cambiar versiones. Conservar Flutter **3.47.8**, Gradle **9.3.1**, AGP **9.1.0**, Kotlin **2.4.0**, JDK **21.0.12**, SDK **36** y `pubspec.lock` intactos. No tocar `FlutterPlugin.kt`, Kotlin, Gradle wrapper, `android.builtInKotlin`, `settings.gradle.kts`, AGP/KGP, lock, manifest o fuentes Dart. Si una segunda causa emerge después del cambio, entregar evidencia causal y STOP; no explorar diez alternativas.

**Base oficial:** Flutter documenta la propiedad `android.newDsl=false` para mantener compatibilidad con APIs DSL antiguas de AGP 9; en proyectos Flutter, sus migradores la agregan al usar `flutter run/build`, pero en un build invocado con el wrapper Gradle no se debe suponer que ya se aplicó. Documentación: https://docs.flutter.dev/release/breaking-changes/migrate-to-built-in-kotlin/for-app-developers . No inventar que el cambio asegura el PASS: es una hipótesis causal sólida pendiente de prueba en este proyecto.

## 1. GATE R4-0 — NO DUPLICACIÓN, CUSTODIA Y ALCANCE

1. Antes de escribir, verificar que **A2-R3 terminó** y que NO existe R4 en proceso/ZIP/directorio con resultados. Si ya hay ejecución R4 o evidencia, **NO iniciar otra**: devolver `ALREADY_IN_FLIGHT_OR_FINISHED`. Si A2-R2 apareciera simultáneamente, STOP. No limpiar archivos ajenos ni cambiar estados de Codex.
2. Reutilizar R3 **sin repetir test, descarga, preflight de SDK ni pruebas de fuente**. Verificar una sola vez ruta/sha de R3 ZIP igual al de arriba; leer `BLOCKERS.md`, `BUILD_AND_APK.csv` y `SOURCE_WIP_GUARDS.csv` ya certificados. No volver a comparar los 39 JAR o las 82 fuentes; solo control focal de `gradle.properties` y WIP PRE/POST. No usar GitHub público como fuente de app: la app avanzada vive únicamente en el A2 privado.
3. Custodia de WIP `D:\codex\Jornato`: antes y después capturar HEAD, rama, número/digest de status, index SHA, staged diff; referencia R3: rama `codex/jor-b08-h4-domain-20261025`, HEAD anterior, 235 entradas (11 modified, 224 untracked), staged 0 e índice anterior. Si otro agente modifica WIP: `BLOCKED_CONCURRENT_WIP`, sin atribuir o corregir cambios. NUNCA `git add/commit/push/pull/reset/stash/clean/checkout/merge`, no pruebas del WIP.
4. Ningún PHP, Docker, MariaDB, dispositivos/emulador, ADB, cambio global Windows, variables persistentes, caches compartidos, instalaciones, SDK/JDK nuevo, proxy/firewall, repositorio improvisado o versión nueva. No ejecutar suites N2–N7, N5 Flutter, A1, A2 R1–R3. `OFF_DEVICE_BACKUP=NO`, no simular backup.
5. **Fuente única:** el candidato de `A2_ROOT\private\candidate`, preexistente y privado. Crear **una nueva copia R4** en `A2_ROOT\private\r4\candidate`, únicamente si no existe, con copia ordinaria y verificación de que no haya junction/symlink/hardlink ni rutas fuera de A2. Excluir directorios generados `.gradle`, `build`, `.dart_tool/flutter_build` y APK viejos. No tocar el candidato R3 ni `delivery` y `delivery-r3`. Reusar los directorios de caché ya privados `A2_ROOT\private\gradle-home`, `pub-cache`, `android-user`, `temp` y firma debug con custodia de A2; **no descargar de nuevo las 22 variantes y no copiar cachés globales**. No crear un nuevo keystore si ya hay uno QA privado válido; verificar ruta de firma efectiva y no exponer la clave.

## 2. GATE R4-1 — UNA PROPIEDAD EN UN ARCHIVO DE QA

Ejecutar estáticamente en la **copia R4**, sin lanzar Gradle, estas instrucciones simples:

1. Confirmar los archivos `candidate/android/gradle.properties`, `candidate/android/settings.gradle.kts`, `candidate/android/app/build.gradle.kts` y el wrapper. Inspeccionar **solo** versiones declaradas del proyecto y Gradle properties. `android.newDsl=false` se configura en `candidate/android/gradle.properties`; no en el SDK Flutter, WIP ni repositorios compartidos.
2. Buscar líneas activas `android.newDsl` ignorando comentarios. Casos:
   - **Ausente:** añadir exactamente una línea `android.newDsl=false` al final, conservando todas las existentes.
   - **Única `android.newDsl=true`:** cambiar SOLO su valor a `false` en copia R4.
   - **Única `android.newDsl=false` ya presente antes de aplicar R4:** STOP `BLOCKED_CAUSE_NOT_CONFIRMED`; el mismo cast con compatibilidad activa requiere otra investigación focal del Director, **no construir a ciegas**.
   - **Duplicadas, otro valor, variables dinámicas o sobrescritura oculta:** STOP `BLOCKED_GRADLE_PROPERTY_CONFLICT`. **Nunca** eliminar otras propiedades ni asumir precedencia.
3. Revisar solo lugares con precedencia potencial de la propiedad: `candidate/gradle.properties` si existe, el Gradle-home privado A2, comandos/properties `-P...` y variables de proceso Gradle/Java. No leer o imprimir secretos. Si un origen efectivo indica `true` o no se puede determinar con seguridad, STOP; no tocar variables globales. Preservar `android.builtInKotlin` y todas las demás flags exactamente como están, incluso si valen `true` o `false`. Registrar PRE/POST SHA de `android/gradle.properties`, cambio de 1 línea y hashes focales de los scripts NO modificados.
4. **No modificar** `FlutterPlugin.kt`, `build.gradle.kts`, AGP/Kotlin, wrapper, SDK/NDK, min/target SDK, signing config, manifest, código Dart o Java/Kotlin. Si el proyecto exige otro cambio, STOP `BLOCKED_NEXT_CAUSE`, describirlo sin hacerlo. Este lote autoriza una **sola modificación de propiedad** para evitar el círculo de parches.

Plantilla ilustrativa en PowerShell; Codex debe sustituir la ruta real **solo dentro de A2** y validar el resultado final. No ejecutar esta plantilla contra `D:\codex\Jornato`:

```powershell
$props = 'D:\codex\_REPORTES\Jornato\JOR-A2-GRADLE-DEPS-APK-QA-20261122\private\r4\candidate\android\gradle.properties'
if (-not [IO.File]::Exists($props)) { throw 'BLOCKED_GRADLE_PROPERTIES_MISSING' }
$raw = [IO.File]::ReadAllText($props)
$pattern = '(?m)^[ \t]*android\.newDsl[ \t]*=[ \t]*(?<val>[^\r\n#]+?)[ \t]*$'
$hits = [regex]::Matches($raw, $pattern)
# Una clave activa no reconocida (':', comentario inline, valor ambiguo) es conflicto, no ausencia.
$activeKeys = [regex]::Matches($raw, '(?m)^[ \t]*android\.newDsl(?=[ \t=:])[^\r\n]*$')
if ($activeKeys.Count -ne $hits.Count) { throw 'BLOCKED_GRADLE_PROPERTY_CONFLICT' }
if ($hits.Count -gt 1) { throw 'BLOCKED_GRADLE_PROPERTY_CONFLICT' }
if ($hits.Count -eq 0) { $raw = $raw.TrimEnd([char]13,[char]10) + [Environment]::NewLine + 'android.newDsl=false' + [Environment]::NewLine }
else {
  $oldValue = $hits[0].Groups['val'].Value.Trim()
  if ($oldValue -eq 'false') { throw 'BLOCKED_CAUSE_NOT_CONFIRMED' }
  if ($oldValue -ne 'true') { throw 'BLOCKED_GRADLE_PROPERTY_CONFLICT' }
  $raw = $raw.Remove($hits[0].Index,$hits[0].Length).Insert($hits[0].Index,'android.newDsl=false')
}
[IO.File]::WriteAllText($props,$raw,[System.Text.UTF8Encoding]::new($false))
if (([regex]::Matches([IO.File]::ReadAllText($props),'(?m)^android\.newDsl=false\s*$')).Count -ne 1) { throw 'BLOCKED_GRADLE_PROPERTY_VERIFY' }
```

**IMPORTANTE:** No ejecutar ningún comando de edición hasta completar el gate de custodia y confirmar que el origen/copia R4 es el correcto. Si hay `android.newDsl=false` en origen, la plantilla DETIENE; no inventar otro cambio ni borrarlo para volver a colocarlo. El cambio R4 es un workaround **oficial pero temporal**, no refactor de arquitectura. No migrar al WIP sin decisión posterior del Director.

## 3. GATE R4-2 — UNA COMPILACIÓN, CON EL CHECKPOINT RESUELTO

1. Preflight focal de proceso: wrapper Gradle 9.3.1 ya existente; JDK 21, SDK 36, NDK/CMake existentes; `local.properties` en la copia R4 apunta a rutas válidas. Usar `GRADLE_USER_HOME=A2_ROOT/private/gradle-home`, `PUB_CACHE=A2_ROOT/private/pub-cache`, `ANDROID_USER_HOME=A2_ROOT/private/android-user`, `TEMP/TMP=A2_ROOT/private/temp`, sin afectar otros procesos. Si variables Gradle heredadas introducen init-scripts/credenciales/repositorios diferentes, STOP. Firma QA solo en A2. No volver a ejecutar `pub get`, analyze, tests, precache, wrapper download, sdkmanager, gradle dependencies, flutter build apk ni otra tarea.
2. Ejecutar **UNA Y SOLO UNA** invocación de la tarea exacta desde `private/r4/candidate/android`:

```powershell
.\gradlew.bat :app:assembleB14qaDebug --no-daemon --console=plain --max-workers=2
```

Solo se admite la resolución de dependencias de compilación oficiales ya autorizadas: `https://plugins.gradle.org/m2`, `https://plugins-artifacts.gradle.org/`, `https://repo.maven.apache.org/maven2`, `https://dl.google.com/dl/android/maven2` y `https://storage.googleapis.com/download.flutter.io/` (o la única variante `engine.realm` validada por R3). **No es un sandbox de egreso**: declarar `NETWORK_SCOPE=POLICY_CONTROLLED_NOT_EGRESS_SANDBOXED`. No descargar herramientas/versiones nuevas; mantener `android.builder.sdkDownload=false` y `org.gradle.java.installations.auto-download=false` sin editarlos. Si falla por redirección o falta otro host, STOP sin añadirlo automáticamente. No `--refresh-dependencies`, nuevo build offline, segunda variante ni segundo intento por causa ambiental o de producto.
3. Registrar exit, fase, causa y comandos sin secretos. `PASS_APK_QA` requiere exit 0 de ESTA invocación, APK nuevo y verificable, no un APK viejo. Si persiste `ClassCastException`, verificar solo si la propiedad quedó efectiva: detener, etiquetar `BLOCKED_AGP_DSL_STILL_ACTIVE`, no aplicar más flags a ciegas. Si aparece otro error KGP, AGP, plugins o del producto, registrar primera causa y STOP `BLOCKED_NEXT_CAUSE`; no ejecutar correcciones extra por iniciativa propia. Esto es diagnóstico productivo de **un cambio y un build**, no una cadena de ensayo-error.

## 4. GATE R4-3 — SI SE GENERA APK QA, VERIFICAR SIN INSTALAR

1. Buscar APK solo dentro de outputs nuevos de `private/r4/candidate` (antes no debe existir APK); verificar marca temporal, build exit 0, SHA256, tamaño y copiar artefacto a `A2_ROOT/private/r4/product` sin incluirlo en ZIP. **No mezclar con los APK C2 o A1**.
2. Ejecutar `apksigner verify --verbose --print-certs` y `aapt dump badging` o `apkanalyzer manifest print` usando herramientas SDK existentes; registrar package/applicationId, versión, min/target SDK, certificado debug, debug/release flag, permisos/exported, ABI, launch Activity, `usesCleartextTraffic`, si existe. Verificar merged manifest real. Nunca declarar PASS si hay fallo de firma, manifest o secreto integrado.
3. La variante QA `b14qa/debug` tenía en fuente `usesCleartextTraffic=true`; si se conserva en manifest final, declarar `QA_DEBUG_CLEARTEXT=TRUE`, y **no distribuir ni usar con datos reales**. Nunca confundir APK QA con release.
4. No instalar en Xiaomi ni usar ADB, emulador o teléfono. No afirmar SQLCipher/Keystore, rehidratación offline, respaldo/restauración, seguridad tenant o release por haber compilado. `RELEASE=NO_GO`.

## 5. ZIP ÚNICO R4, AUDITABLE Y SANITIZADO

Crear exactamente **un nuevo ZIP** en `A2_ROOT/delivery-r4/` (no tocar `delivery` ni `delivery-r3`), con manifiesto SHA-256+bytes y CRC comprobados. Archivos suficientes, sin exceso:

```text
FINAL_REPORT.md                         # hechos, gates, causa, decisión y límites
A2_R4_GATE_MATRIX.csv                   # status PASS/BLOCKED/NOT_RUN por puerta
GRADLE_DSL_SINGLE_CHANGE.csv            # fichero relativo, PRE/POST SHA, 1 valor true/absent -> false, sin rutas privadas
BUILD_AND_APK_R4.csv                    # versions, invocación única, exit, APK SHA si existe
APK_SECURITY_SUMMARY.csv                # SOLO si hay APK validable
NEXT_ANDROID_PHYSICAL_GATE.md           # SOLO si APK QA pasa estática
BLOCKERS.md                             # SOLO si bloqueo
WIP_AND_R3_GUARDS.csv                   # PRE/POST WIP e integridad ZIP R3, sin código privado
MANIFEST_SHA256.csv                     # todos los archivos anteriores
```

No incluir APK, keystore, tokens, `.env`, rutas/credenciales de otros proyectos, fuente Dart/Java, `gradle.properties` completo, binarios, caches, logs crudos o secretos. Originales en carpeta privada R4. Entregar solo `ZIP_PATH`, `ZIP_SHA256`, resultado y `NEXT_OWNER=CHATGPT_DIRECTOR`; **no subir archivos a GitHub ni publicar la APK**.

Respuesta final breve:

```text
TASK=JOR-A2-GRADLE-DEPS-APK-QA-20261122
PROMPT_REVISION=A2-R4-20261122
RESULT=PASS_APK_QA_SCOPED|PARTIAL_WITH_GAPS|BLOCKED_ENV
R3_EVIDENCE=REUSED_VERIFIED|MISMATCH
AGP_DSL_CHANGE=APPLIED_PRIVATE_ONLY|BLOCKED|NOT_NEEDED
A2_BUILD=PASS_NEW_APK|BLOCKED_NEXT_CAUSE|BLOCKED_ENV|NOT_RUN
A2_APK_STATIC=PASS_QA|BLOCKED_SECURITY|NOT_RUN
APK_SHA256=<hash_or_NOT_BUILT>
APK_PRIVATE_PATH=<D:_path_or_NOT_CREATED>
SOURCE=PASS_82_OF_82_REUSED
GRADLE_DEPS=PASS_22_OF_22_REUSED
NETWORK_SCOPE=POLICY_CONTROLLED_NOT_EGRESS_SANDBOXED|NOT_RUN
ANDROID_PHYSICAL=NOT_RUN
WIP_GUARDS=PASS_UNCHANGED|UNEXPECTED_DELTA
DOCKER=NOT_TOUCHED
OFF_DEVICE_BACKUP=NO
RELEASE=NO_GO
ZIP_PATH=<D:_R4_UNICO.zip>
ZIP_SHA256=<SHA256>
NEXT_OWNER=CHATGPT_DIRECTOR
```

**NO autoriza deploy, publicación, merge, cambios del SDK Flutter, versiones, ni modificación del WIP.** Si N7/N6/Docker están pendientes no bloquean esta prueba Android, pero tampoco certifican servidor. Tras ZIP R4, el Director revisa evidencia y decide el siguiente paso físico o causal. Arquitectura KISS, no auditorías repetidas, no perseguir la cola.
