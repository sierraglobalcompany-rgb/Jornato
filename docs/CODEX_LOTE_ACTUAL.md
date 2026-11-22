# CODEX LUNA — JORNATO A2-R4-V2 · UNA SOLA CORRECCIÓN AGP 9, UNA COMPILACIÓN APK QA

> **EJECUTA, NO REDISEÑES.** ChatGPT Director fija la decisión; Codex Luna únicamente ejecuta gates. **ESTE ES EL MISMO TASK DE A2, NO A3.** Este V2 sustituye A2-R4 original **solo si A2-R4 aún NO ha empezado**. Si empezó, hay un proceso activo, un checkpoint R4, `delivery-r4` o ZIP R4: **STOP**, no lanzar un segundo build, no interferir, remitir evidencia existente. No repasar auditorías N2–N7/A1/A2-R1–R3.

```text
TASK=JOR-A2-GRADLE-DEPS-APK-QA-20261122
PROMPT_REVISION=A2-R4-V2-20261122
OWNER=CODEX_LUNA
NEXT_OWNER=CHATGPT_DIRECTOR
WIP_ROOT=D:\codex\Jornato
A2_ROOT=D:\codex\_REPORTES\Jornato\JOR-A2-GRADLE-DEPS-APK-QA-20261122
R3_ZIP=delivery-r3\JOR-A2-GRADLE-DEPS-APK-QA-20261122-R3-UNICO.zip
R3_ZIP_SHA256=5C3E7B1758380CE8D7895C1EF1981F2FD131A4A90F79C8A300BAF57153214D11
R1_ZIP_SHA256=C891EC71F5D30511065E0F902B1D97A19F5AA22F2D913FA48770E8D6328B6B24
R3_WIP_HEAD=faf5fe283191f8b5a2724b397009512a2caec1b6
R3_WIP_INDEX_SHA256=25CC609803D7E68D5F3ECF428198B2432CF1EA37030546735DD3F03299D905E1
TARGET_TASK=:app:assembleB14qaDebug
RELEASE=NO_GO
```

## 0. Hechos cerrados y objetivo único

- R3 ZIP original adjudicado: **9.188 bytes**, 7 miembros, CRC PASS y manifiesto 6/6 de tamaño+SHA-256, SHA-256 exacto arriba. `SOURCE=PASS_82_OF_82_REUSED`. Pub/lock N5 y A1 PASS en su alcance; no repetirlos.
- Una sola compilación R3 `:app:assembleB14qaDebug` falló **antes de compilar Jornato**, al aplicar `dev.flutter.flutter-gradle-plugin`: `ApplicationExtensionImpl$AgpDecorated_Decorated cannot be cast to AbstractAppExtension`, en `FlutterPlugin.kt:354`. Flutter 3.47.8 / AGP 9.1.0 / Gradle 9.3.1 / Kotlin 2.4.0 / JDK 21.0.12 / SDK 36 reportados. No APK.
- Caché Gradle privada A2 quedó con 22/22 variantes faltantes de A1, 39 archivos JAR nuevos inventariados (38 GAV). **No volver a descargar esas 22 variantes ni recontarlas**. La evidencia de R3 no acredita integridad criptográfica fijada ni un sandbox de egreso; conservar esa limitación.
- Corrección **única y oficial**: `android.newDsl=false` para compatibilidad temporal de AGP 9 con DSL antigua. Android documenta la `ClassCastException` observada y Flutter recomienda esa propiedad; **no hay garantía de PASS hasta compilar**. Fuentes oficiales: https://developer.android.com/build/releases/agp-9-0-0-release-notes y https://docs.flutter.dev/release/breaking-changes/migrate-to-built-in-kotlin/for-app-developers .
- Prohibido cambiar versión de Flutter, AGP, KGP/Kotlin, Gradle o JDK; `android.builtInKotlin`, SDK, NDK, `FlutterPlugin.kt`, fuentes Dart, manifiestos, build scripts, `pubspec.lock` o repositorios. Si el error siguiente exige otra decisión, STOP con primera causa, no improvisar flags ni parches.

## 1. Gate G0 — custodia y no duplicación (antes de escribir)

1. Confirmar que no existe proceso A2-R4 ni trabajo activo del mismo TASK, ni ZIP/documentos R4 previos. Si R4 ya empezó, no detenerlo ni reejecutarlo: `ALREADY_IN_FLIGHT_OR_FINISHED`. La existencia de R3 **sí se espera** y NO bloquea este V2. Si no puede establecer propiedad o exclusividad del laboratorio, `BLOCKED_CONCURRENT_A2`.
2. Comprobar **una sola vez** SHA del ZIP R3 y leer exclusivamente su `BLOCKERS.md`, `BUILD_AND_APK.csv`, `SOURCE_WIP_GUARDS.csv`; el registro prueba un fallo de API, no de fuente Dart. Preservar entregas `delivery`, `delivery-r3`, candidato previo y hashes. No repetir suite/descargas/inspección exhaustiva de cache.
3. WIP de `D:\codex\Jornato` es solo lectura; registrar **PRE/POST** rama, HEAD, SHA del índice, staged y digest/contador de status para distinguir trabajo de otros Codex. Referencia histórica HEAD `faf5...`, 235 entradas (11 modified, 224 untracked), staged 0, índice `25CC...`; **no restaurar ni forzar** esas cifras si hubo cambios concurrentes, bloquear y explicar. Nunca `git add/commit/push/pull/reset/stash/clean/checkout/merge`; no editar WIP ni GitHub.
4. Copiar `A2_ROOT/private/candidate` a **un solo** `A2_ROOT/private/r4/candidate` nuevo, con copia ordinaria (sin links, junctions, hardlinks) y **sin** `.gradle`, `build`, `.dart_tool/flutter_build`, APK, temporales ni outputs de R3. Si la carpeta R4 ya existe con material no clasificado, STOP, **no sobrescribir ni limpiar**. Tomar hashes puntuales de `android/gradle.properties`, `settings.gradle.kts`, `app/build.gradle.kts`, wrapper y lock; original y R3 intocables. Los resultados de paridad 82/82 de R3 se reutilizan.
5. Reusar `A2_ROOT/private/gradle-home`, `pub-cache`, `android-user`, `temp` y el signing **QA privado**, sin modificar las cachés globales. No inventar claves release ni regenerar la firma QA si la privada previa es válida; la firma efectiva no debe apuntar fuera de A2. Si WIP u otros agentes tocan la copia/caché A2 simultáneamente, STOP.

## 2. Gate G1 — única modificación: `android.newDsl=false` en copia QA

**Reglas de precedencia:** revisar exclusivamente `private/r4/candidate/android/gradle.properties`, propiedades del `private/gradle-home` de A2, configuración raíz efectivamente utilizada, distribución Gradle y variables del **proceso R4** (`GRADLE_OPTS`, `JAVA_TOOL_OPTIONS`, `ORG_GRADLE_PROJECT_*`), sin revelar valores sensibles. Gradle da prioridad a User Home sobre gradle.properties de proyecto; si un origen distinto impone valor incompatible, **STOP**. No modificar ni sobreescribir config compartida. Referencia: https://docs.gradle.org/current/userguide/build_environment.html .

**Casos únicos:** propiedad ausente -> añadir solo `android.newDsl=false`; propiedad única `true` -> sustituir solo `true` por `false`; propiedad única `false` **ya presente en la fuente original previa al cambio** -> `BLOCKED_CAUSE_NOT_CONFIRMED` (no repetir build); duplicados/valor ambiguo/encoding no soportado -> `BLOCKED_GRADLE_PROPERTY_CONFLICT`. Nunca “borrar y volver a poner” un `false` existente. No tocar `android.builtInKotlin` (si la migración Kotlin falla después, Director decidirá con evidencia nueva).

**Editor determinista, probado con 10 fixtures sintéticos** (ausente LF/CRLF/BOM, sin EOF, `true`, `false`, duplicados, comentario, formato ambiguo, UTF-8 inválido). Conservar bytes originales, BOM, CRLF y líneas existentes; no usar `TrimEnd`, `Set-Content` para reescribir `gradle.properties` ni normalizar su codificación. El script se crea **solo bajo** `A2_ROOT/private/r4` y se ejecuta una vez con Python ya instalado en el PC (lo usó N7), nunca instala Python. Si no existe Python >=3.9, `BLOCKED_PYTHON_ENV`, sin herramienta alternativa improvisada.

**PowerShell ejecutable; correr este bloque exactamente en el contexto R4 después del gate de custodia/precedencia. El script se guarda en `private/r4` y se borra el archivo temporal propio solo mediante la sustitución atómica; no tocar WIP ni otras carpetas:**

```powershell
$a2 = 'D:\codex\_REPORTES\Jornato\JOR-A2-GRADLE-DEPS-APK-QA-20261122'
$r4 = Join-Path $a2 'private\r4'
$candidate = Join-Path $r4 'candidate'
$props = Join-Path $candidate 'android\gradle.properties'
$py = Join-Path $r4 'set_agp_legacy_dsl.py'
if (!(Test-Path -LiteralPath $props -PathType Leaf)) { throw 'BLOCKED_GRADLE_PROPERTIES_MISSING' }
if (Test-Path -LiteralPath $py) { throw 'BLOCKED_EXISTING_SCRIPT' }
if (!(Get-Command python -ErrorAction SilentlyContinue)) { throw 'BLOCKED_PYTHON_ENV' }
$source = @'
#!/usr/bin/env python3
"""A2-R4: change a single Gradle property in the isolated candidate, preserving bytes."""
from pathlib import Path
import hashlib
import os
import re
import sys


def fail(code: str) -> None:
    raise SystemExit(code)


def update_property(file_arg: str, candidate_root_arg: str) -> str:
    candidate = Path(candidate_root_arg).resolve(strict=True)
    prop = Path(file_arg)
    if not prop.is_file() or prop.is_symlink():
        fail("BLOCKED_GRADLE_PROPERTIES_MISSING_OR_LINK")
    dest = prop.resolve(strict=True)
    if not dest.is_relative_to(candidate) or dest != candidate / "android" / "gradle.properties":
        fail("BLOCKED_WRITE_BOUNDARY")
    original_bytes = prop.read_bytes()
    if original_bytes.startswith((b"\xff\xfe", b"\xfe\xff")):
        fail("BLOCKED_NON_UTF8_PROPERTIES")
    bom = b"\xef\xbb\xbf" if original_bytes.startswith(b"\xef\xbb\xbf") else b""
    try:
        original = original_bytes[len(bom):].decode("utf-8", "strict")
    except UnicodeDecodeError:
        fail("BLOCKED_NON_UTF8_PROPERTIES")
    if "\x00" in original:
        fail("BLOCKED_BINARY_PROPERTIES")

    lines = original.splitlines(keepends=True)
    indices = []
    valid = re.compile(r"(?P<before>^[ \t]*android\.newDsl[ \t]*=[ \t]*)(?P<value>true|false)(?P<after>[ \t]*$)")
    for index, line in enumerate(lines):
        bare = line.rstrip("\r\n")
        if re.match(r"^[ \t]*android\.newDsl(?=[ \t=:]|$)", bare):
            match = valid.fullmatch(bare)
            if match is None:
                fail("BLOCKED_GRADLE_PROPERTY_CONFLICT")
            indices.append((index, match))
    if len(indices) > 1:
        fail("BLOCKED_GRADLE_PROPERTY_CONFLICT")
    if len(indices) == 1:
        index, match = indices[0]
        if match.group("value") == "false":
            fail("BLOCKED_CAUSE_NOT_CONFIRMED")
        line = lines[index]
        assert match.group("value") == "true"
        lines[index] = (line[:match.start("value")] + "false" + line[match.end("value"):])
        expected = "".join(lines)
        operation = "TRUE_TO_FALSE"
    else:
        newline = "\r\n" if "\r\n" in original else "\n"
        prefix = "" if (not original or original.endswith(("\n", "\r"))) else newline
        expected = original + prefix + "android.newDsl=false" + newline
        operation = "APPEND_ONE_PROPERTY"

    result_lines = expected.splitlines()
    if sum(bool(re.fullmatch(r"[ \t]*android\.newDsl[ \t]*=[ \t]*false[ \t]*", l)) for l in result_lines) != 1:
        fail("BLOCKED_GRADLE_PROPERTY_VERIFY")
    new_bytes = bom + expected.encode("utf-8")
    if new_bytes == original_bytes:
        fail("BLOCKED_NO_CHANGE")
    temp = prop.with_name(prop.name + ".a2r4.tmp")
    if temp.exists():
        fail("BLOCKED_EXISTING_TEMP_FILE")
    with temp.open("xb") as f:
        f.write(new_bytes)
    if temp.read_bytes() != new_bytes:
        fail("BLOCKED_TEMP_HASH_MISMATCH")
    os.replace(temp, prop)
    if prop.read_bytes() != new_bytes:
        fail("BLOCKED_GRADLE_PROPERTY_VERIFY")
    before = hashlib.sha256(original_bytes).hexdigest().upper()
    after = hashlib.sha256(new_bytes).hexdigest().upper()
    return f"AGP_DSL_CHANGE={operation}\nAGP_DSL_BEFORE_SHA256={before}\nAGP_DSL_AFTER_SHA256={after}"


if __name__ == "__main__":
    if len(sys.argv) != 3:
        fail("BLOCKED_BAD_ARGS")
    print(update_property(sys.argv[1], sys.argv[2]))
'@
[IO.File]::WriteAllText($py, $source, [System.Text.UTF8Encoding]::new($false))
python -I $py $props $candidate
if ($LASTEXITCODE -ne 0) { throw 'BLOCKED_AGP_DSL_CHANGE' }
```

**Codex no necesita inventar otro editor:** tras guardar el código Python literal en `$py`, el comando de invocación anterior aplica el cambio. Verificar que los hashes de `settings.gradle.kts`, `build.gradle.kts`, wrapper, `pubspec.lock` y otros archivos de la copia permanecen iguales; **solo** `android/gradle.properties` puede diferir, según `AGP_DSL_BEFORE/AFTER_SHA256` del script. Si hay delta inesperado, STOP y reportar; no reintentar.

## 3. Gate G2 — una sola compilación y sin descargas repetidas

- Confirmar que el único cambio QA permitido quedó aplicado y que no hay conflicto de precedencia. `local.properties` debe apuntar a SDK y Flutter existentes, no crear rutas globales. `android.builder.sdkDownload=false` y `org.gradle.java.installations.auto-download=false` siguen presentes; **no actualizar ni instalar SDK/JDK**.
- Configurar **variables solo del proceso** `GRADLE_USER_HOME=A2_ROOT/private/gradle-home`, `PUB_CACHE=A2_ROOT/private/pub-cache`, `ANDROID_USER_HOME=A2_ROOT/private/android-user`, `TEMP/TMP=A2_ROOT/private/temp`, JAVA_HOME/Android SDK originales. Verificar una sola vez que el keystore QA siga privado. Sin Docker, PHP, MariaDB, Gradle daemon ajeno, Android físico, ADB o emulador.
- Ejecutar **exactamente una vez** desde `A2_ROOT/private/r4/candidate/android`:

```powershell
.\gradlew.bat :app:assembleB14qaDebug --no-daemon --console=plain --max-workers=2
```

- Usar la caché A2 ya poblada. **No anteponer build `--offline` ni ejecutar `--refresh-dependencies`, `flutter build`, `gradle dependencies`, `pub get`, `flutter analyze` o tests antiguos.** Si Gradle aún necesita un transitivo nuevo, solo están permitidos los repositorios HTTPS oficiales ya autorizados para A2-R3: `plugins.gradle.org/m2`, `plugins-artifacts.gradle.org`, `repo.maven.apache.org/maven2`, `dl.google.com/dl/android/maven2`, y **solamente** `storage.googleapis.com/download.flutter.io/` para Flutter Engine (R3 declaró `engine.realm` vacío). No ampliar host/bucket/redirecciones. Esto es política de uso, NO aislamiento técnico de egreso: `NETWORK_SCOPE=POLICY_CONTROLLED_NOT_EGRESS_SANDBOXED`.
- Capturar **un** exit code, etapa de fallo y el primer error relevante, con logs privados redactados. Si persiste el cast de AGP, registrar `BLOCKED_AGP_DSL_STILL_ACTIVE`, sin cambiar otro parámetro. Si emerge otro error real, `BLOCKED_NEXT_CAUSE`, sin arreglos improvisados ni segundo build. Un éxito solo existe con exit 0 **y APK nuevo** proveniente de esta compilación.

## 4. Gate G3 — APK nueva, estática, sin dispositivo

**Solo si el build termina bien:** comprobar que no existía APK en la copia R4 antes de G2; localizar el APK generado en outputs de esa copia y confirmar timestamp/variante `b14qaDebug`/tamaño/SHA-256. Copiarlo a `A2_ROOT/private/r4/product` sin agregarlo al ZIP público de evidencias. Usar herramientas locales `apksigner verify --verbose --print-certs` y `aapt dump badging` o `apkanalyzer manifest print`; verificar applicationId, versionCode/name, min/target SDK, firma debug, launch Activity, exported/permisos, ABI, merged manifest y ausencia de secretos.

En fuente QA `b14qa/debug` hay `usesCleartextTraffic=true`; el APK final debe registrar `QA_DEBUG_CLEARTEXT=TRUE` si aparece, **sin homologarlo para distribución externa ni datos reales**. No aprobar SQLCipher, Android Keystore, outbox, GPS/selfie real, respaldo/restauración, integridad tras reinicio, ni acceso a tenants por la sola compilación. Ningún teléfono, emulador o ADB. `RELEASE=NO_GO`.

## 5. Entrega única en ZIP y siguiente propietario

**Un solo ZIP nuevo** `A2_ROOT/delivery-r4/JOR-A2-GRADLE-DEPS-APK-QA-20261122-R4-UNICO.zip`, conservar `delivery` y `delivery-r3` originales. Crear ZIP con CRC y manifiesto `MANIFEST_SHA256.csv` verificado (SHA+bytes) con archivos sanitizados:

```text
FINAL_REPORT.md               # decisiones, entorno, etapas, error nuevo o APK verificada, límites
A2_R4_GATE_MATRIX.csv         # G0–G4 PASS/BLOCKED/NOT_RUN
AGP_DSL_SINGLE_CHANGE.csv     # BEFORE/AFTER SHA, operación y archivo relativo (no fuente completo)
BUILD_AND_APK_R4.csv          # invocación única, resultado; hash APK si existe
APK_SECURITY_SUMMARY.csv      # solo si APK válida
NEXT_ANDROID_PHYSICAL_GATE.md # solo si APK estática válida, 1 página
BLOCKERS.md                  # solo si bloqueado
WIP_AND_R3_GUARDS.csv         # PRE/POST WIP, R3 ZIP sin cambios
MANIFEST_SHA256.csv          # hash y tamaño exactos de las otras entradas
```

No incluir APK, keys, raw logs, .env, datos reales, fuentes, propiedades completas, JAR, caches, rutas personales, tokens o secretos. Evidencias originales y APK en `private/r4` sin publicarlas ni subir a GitHub; el propietario recibe la ubicación privada, no el APK en ZIP. Solo documentación derivada de estado debe actualizar GitHub **por el Director después del ZIP**, no Codex. Si no hay APK, `A2_APK_STATIC=NOT_RUN`, no crear evidencia ficticia.

Formato obligatorio respuesta Codex:

```text
TASK=JOR-A2-GRADLE-DEPS-APK-QA-20261122
PROMPT_REVISION=A2-R4-V2-20261122
RESULT=PASS_APK_QA_SCOPED|PARTIAL_WITH_GAPS|BLOCKED_ENV
R3_EVIDENCE=REUSED_VERIFIED|MISMATCH
AGP_DSL_CHANGE=TRUE_TO_FALSE|APPEND_ONE_PROPERTY|BLOCKED|NOT_RUN
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

**STOP terminal:** enviar el ZIP a ChatGPT Director para adjudicar y preparar una decisión final; jamás ejecutar A2-R4 y A2-R4-V2 en paralelo. PingPongLaw L1–L6 = KISS, controles de seguridad, pruebas focales, no confundir evidencia con producción. No merge/deploy.
