# CODEX LUNA — JORNATO N7-R1 · UNA PASADA FORENSE CORREGIDA, CON DECISIÓN DE REPARACIÓN

**ESTADO:** ORDEN EJECUTABLE **ÚNICAMENTE SI N7 ORIGINAL AÚN NO EMPEZÓ**. **TASK ORIGINAL (NO CAMBIAR):** `JOR-N7-PHP-IMAGE-BYTES-ROOT-CAUSE-20261121`. **PROMPT_REVISION=N7-R1-20261121.** ChatGPT = Director; Codex Luna = ejecutor. Este documento sustituye por completo el prompt N7 original únicamente antes de su inicio; **no es N8, un segundo proceso ni una orden para ejecutar N7 dos veces**. Si N7 original arrancó, su carpeta de trabajo ya existe con evidencia, tiene un ZIP emitido o el estado es ambiguo: **NO ejecutar N7-R1**. Devolver `N7_ALREADY_IN_FLIGHT_OR_FINISHED` y el ZIP/estado disponible para adjudicación del Director. No interrumpas procesos de otros proyectos.

## 0. Resultado al que debes llegar; prohibición de perseguirnos la cola

**UN objetivo verificable:** decidir si los dos binarios de la imagen PHP almacenada son *estructuralmente inspeccionables* desde un contenedor **detenido**, sin ejecutar PHP y sin alterar Docker global. Primero la imagen N6 original; **solo si el resultado original es ambiguo y la imagen alternativa ya fue identificada en N6**, una segunda y última inspección. Cerrar N7 con **UNA** recomendación de reparación, concreta y condicionada a autorización del propietario. **No generar N8 ni repetir diagnósticos aprobados.** Si las cabeceras parecen válidas, decir `ELF_STRUCTURE_PLAUSIBLE_RUNTIME_UNRESOLVED`: no puede declararse sana toda la imagen ni culparse al daemon sin prueba.

**Fuentes cerradas, NO repetir:** N6-R2 ZIP SHA256 `664724B357008753353065F804817A990CEDE6FE5E6B41BEE2A5AF6A327B5AF4`, 7.742 B, 9 miembros, 8/8 manifiesto; cuatro sondas en dos imágenes fallaron antes de PHP. Imagen original N6 `php:8.3-cli-bookworm` ImageID `sha256:232331112d3a7c5b98edeeddc3b85f610172f99352c0635fe6b3e166e47062cb` (shell y PHP: `exec format error`). Alternativa N6 `php:8.4-cli-bookworm` ImageID `sha256:b3e907a1108629c562c4bb313ce3449e34d49991f6bb2487913f6146f47200fe` (shell: `exec format error`; PHP: `input/output error`). Daemon y metadatos declararon `linux/amd64`, **no es evidencia de integridad de bytes**. En N6 se reportaron 109 contenedores, 42 redes y 97 volúmenes PRE/POST, sin delta. Referenciar esas cifras como HISTÓRICAS, no como inventario actual.

N4 fuente candidata privada reportada: 232 rutas, 150 servidor; N5 Flutter candidato `PASS_CANDIDATE_SCOPED`, resolución Pub offline con lock, 9/9 `KioskScreen`; N6 no tocó WIP. Reusar esos PASS según fuente/alcance, NO volver a ejecutar Dart, Flutter, 86 host N2, 9+4 N3, 158/2450 históricos backend, Laravel, MariaDB, E01–E08, Docker Compose ni Android. Ninguna fase de release está autorizada: `RELEASE=NO_GO`.

**Precedencia y leyes:** PingPongLaw L1 KISS; L2 antirruido; L3 corregir causa; L4 UX humana; L5 evidencia verificable; L6 antipíngpong. Multiagente en Windows con proyectos simultáneos. PHP y bases exclusivamente en Docker privado por proyecto; **N7 NO EJECUTA PHP NI BASE**. Nada de WIP editado, Git mutado, PR de código, `merge`, `push`, deploy, respaldos externos no autorizados.

## 1. Protección preflight obligatorio ANTES de crear algo

1. **No duplicar N7:** comprobar `D:\codex\_REPORTES\Jornato\JOR-N7-PHP-IMAGE-BYTES-ROOT-CAUSE-20261121` por evidencias de ejecución previa, ZIP final, contenedores etiquetados N7 y agentes concurrentes. Si hay inicio/completado, STOP sin crear nuevos archivos. No inventar un nombre nuevo N7-R2 para sortear el guard.
2. **Fuente N6:** comprobar SHA del ZIP anterior si existe (sin descomprimir innecesariamente), que el contexto Docker/daemon corresponde al observado en N6 y que los ImageIDs coinciden íntegramente; si el contexto cambió, `BLOCKED_DOCKER_CONTEXT`, NO cambiar `docker context use`, no reiniciar servicio/WSL.
3. **WIP solo lectura:** `D:\codex\Jornato`, HEAD histórico `faf5fe283191f8b5a2724b397009512a2caec1b6`, rama `codex/jor-b08-h4-domain-20261025`, 235 entradas/0 staged/índice SHA256 `25CC609803D7E68D5F3ECF428198B2432CF1EA37030546735DD3F03299D905E1` en N6. Comprobar HEAD/índice/status PRE y POST sin `git add/clean/reset/stash/checkout`, sin nuevos hashes masivos y sin reauditar las 232 rutas. Si otro agente lo está modificando, STOP con causa.
4. **Docker compartido:** recopilar por metadatos filtrados PRE el estado/IDs de contenedores, redes y volúmenes; no leer env/inspect de otros proyectos. Asegurar espacio y estabilidad de Docker compartido sin arranque global, cambios IPAM o limpieza ajena. No `prune`, `wsl --shutdown`, reinicios, `docker pull/build/load/save`, `docker image rm`, `docker compose`, redes adicionales, `docker run/start/exec` ni puerto host. **Solo** `docker image inspect` de dos ImageID N6, `docker container create --pull never --network none`, `docker cp -L` de dos rutas y `docker container rm` **del ID propio etiquetado**. No tocar contenedores/volúmenes conservados N5.
5. Antes de operaciones, comprobar `docker image inspect <IMAGE_ID>` de forma filtrada (mostrar solo `Id`, `OS`, `Architecture`, `Variant`, `RepoTags`, `RepoDigests`, `Config.Volumes`, `Config.Entrypoint`, `Config.Cmd`); **NO** imprimir JSON completo (puede contener variables del contenedor). Guardar si hace falta en directorio privado con revisión de secretos. `ImageID` es digest de config, `RepoDigest` referencia manifiesto: **no deben equipararse ni la diferencia es corrupción**. Si no hay imagen local, `BLOCKED_IMAGE_MISSING`, no descargar. Si `Config.Volumes` declara volúmenes automáticos, `BLOCKED_IMAGE_VOLUME_RISK`, no crear contenedor. Si OS/architecture != `linux/amd64` esperado, `BLOCKED_PLATFORM`, no falsificar metadata ni usar emulación.
6. **ÚNICO destino:** `D:\codex\_REPORTES\Jornato\JOR-N7-PHP-IMAGE-BYTES-ROOT-CAUSE-20261121\private` y `...\delivery`. Verificar que directorios/ancestros no sean junction/reparse/symlink ni otro proyecto. Los bytes copiados y logs se guardan solo en private y **NO** en el ZIP final. No incluir rutas absolutas o secretos en reporte.

## 2. Operación N7 — máxima una imagen original + una alternativa condicional

**Orden fijo:** (a) validar ImageID original y `Config.Volumes` vacío; (b) crear UN contenedor detenido con `--pull never --network none --read-only`, label exclusiva N7, **sin mounts ni `--volume`**; (c) comprobar que es propio por ImageID exacto, label, nombre y `State.Status=created`; (d) copiar **solo** `/bin/sh` y `/usr/local/bin/php` con `docker cp -L`; (e) retirar siempre el contenedor propio en `finally`; (f) ejecutar Python lector offline sobre esos dos ficheros; (g) segunda imagen solo si primera no permite discriminar la hipótesis o produce error de lectura ambiguo, **nunca** por repetir resultados ya decisivos.

**Cuidado especial PowerShell:** `docker create` puede fallar sin devolver stdout. Nunca encadenar `.Trim()` a una variable nula antes de entrar a `finally`; comprobar primero `$LASTEXITCODE`, que el resultado no está vacío y que el ID tiene formato de 64 hex. Si el contenedor se crea pero falla su captura, intentar identificarlo por **nombre único previamente elegido** y label; si la propiedad no se puede acreditar, **NO eliminar nada**, informar `CLEANUP_PARTIAL` y STOP. La copia PowerShell usa `${cid}:/bin/sh`, no `$cid:/bin/sh` (interpolación ambigua). Capturar códigos de salida de las dos copias individualmente. **Un `cp` fallido no impide ejecutar el `finally`.**

**Receta PowerShell ejecutable: solo después de todo preflight.** Sustituir `$img`, `$out` únicamente por las dos rutas/IDs permitidos; validar que se ha iniciado un solo ejecutor N7. **No** improvisar comandos similares. Imagen original primero:

```powershell
$ErrorActionPreference = 'Stop'
$img = 'sha256:232331112d3a7c5b98edeeddc3b85f610172f99352c0635fe6b3e166e47062cb'
$out = 'D:\codex\_REPORTES\Jornato\JOR-N7-PHP-IMAGE-BYTES-ROOT-CAUSE-20261121\private\original'
# Las verificaciones de WIP/contexto/labels/volumen/paths y espacio de la seccion 1 son PRECONDICIONES, no se omiten.
New-Item -ItemType Directory -Path $out -Force | Out-Null
$imageRaw = (& docker image inspect $img | Out-String)
$rc = $LASTEXITCODE
if ($rc -ne 0 -or [string]::IsNullOrWhiteSpace($imageRaw)) { throw 'BLOCKED_IMAGE_MISSING' }
$image = @((ConvertFrom-Json -InputObject $imageRaw))[0]
if ($image.Id -ne $img) { throw 'BLOCKED_IMAGE_IDENTITY' }
if ($image.Config.Volumes) { throw 'BLOCKED_IMAGE_VOLUME_RISK' }
if ($image.Os -ne 'linux' -or $image.Architecture -ne 'amd64') { throw 'BLOCKED_PLATFORM' }
$name = 'jornato-n7-php-bytes-' + [guid]::NewGuid().ToString('N').Substring(0,12)
$cid = $null
$copyShRc = $null; $copyPhpRc = $null
$cleanup = 'NOT_REQUIRED'
try {
  # No arrancar nada. ID inmutable previamente comprobado y pull prohibido.
  $created = (& docker container create --pull never --network none --read-only --name $name `
      --label 'com.sierraglobal.jornato.task=N7' --entrypoint /bin/true $img 2>&1 | Out-String)
  $createRc = $LASTEXITCODE
  if ($createRc -ne 0 -or [string]::IsNullOrWhiteSpace($created)) { throw 'BLOCKED_CREATE' }
  $proposedId = $created.Trim()
  if ($proposedId -notmatch '^[a-f0-9]{64}$') { throw 'BLOCKED_CREATE_ID_FORMAT' }
  $cid = $proposedId
  $ownedRaw = (& docker container inspect $cid | Out-String)
  if ($LASTEXITCODE -ne 0) { throw 'BLOCKED_OWNERSHIP' }
  $owned = @((ConvertFrom-Json -InputObject $ownedRaw))[0]
  if ($owned.Image -ne $img -or $owned.Name -ne ('/' + $name) -or `
      $owned.Config.Labels.'com.sierraglobal.jornato.task' -ne 'N7' -or `
      $owned.State.Status -ne 'created' -or $owned.HostConfig.NetworkMode -ne 'none') {
    throw 'BLOCKED_OWNERSHIP'
  }
  & docker cp -L "${cid}:/bin/sh" (Join-Path $out 'sh.bin') 1>$null 2>$null
  $copyShRc = $LASTEXITCODE
  & docker cp -L "${cid}:/usr/local/bin/php" (Join-Path $out 'php.bin') 1>$null 2>$null
  $copyPhpRc = $LASTEXITCODE
} finally {
  # Aunque falle una copia, limpiar SOLO el contenedor N7 cuya propiedad esté verificada.
  $target = if ($cid) { $cid } else { $name }
  $raw = (& docker container inspect $target 2>$null | Out-String)
  if ($LASTEXITCODE -eq 0 -and -not [string]::IsNullOrWhiteSpace($raw)) {
    $own = @((ConvertFrom-Json -InputObject $raw))[0]
    if ($own.Name -eq ('/' + $name) -and $own.Image -eq $img -and `
        $own.Config.Labels.'com.sierraglobal.jornato.task' -eq 'N7' -and `
        $own.State.Status -eq 'created') {
      & docker container rm $own.Id 1>$null 2>$null
      $cleanup = if ($LASTEXITCODE -eq 0) { 'PASS_OWN_ONLY' } else { 'CLEANUP_PARTIAL' }
    } else { $cleanup = 'CLEANUP_PARTIAL_OWNERSHIP_UNPROVEN' }
  } else { $cleanup = 'NO_OWN_CONTAINER_FOUND_OR_INSPECT_FAILED' }
}
# Si se interrumpe con throw, registrar los códigos y cleanup de la sesion. No repetir create para reparar la salida.
Write-Output "N7_copy_sh_rc=$copyShRc N7_copy_php_rc=$copyPhpRc N7_cleanup=$cleanup"
```

**Límite de receta:** no copiar binarios si `docker cp` devuelve fallo; los archivos parciales de ese paso se consideran `COPY_FAILED_OR_PARTIAL`. No interpretar `NO_OWN_CONTAINER_FOUND` como limpieza PASS sin comparar inventario POST. Solo una copia por ruta y una tentativa `create` por imagen. **No ejecutar los binarios en Windows ni PowerShell.** `docker create` **sí modifica temporalmente estado Docker** aunque no ejecute el PID 1: comprobar PRE/POST y proteger otros proyectos. Docker docs: https://docs.docker.com/reference/cli/docker/container/create/ ; https://docs.docker.com/reference/cli/docker/container/cp/ ; https://docs.docker.com/reference/cli/docker/container/rm/ .

## 3. Analizador de bytes CORREGIDO — no validar únicamente la cabecera

**Defecto demostrado del N7 original:** el script anterior devolvía `ELF_X86_64_HEADER_OK` para un archivo sintético truncado de 64 bytes. **No utilizarlo.** La nueva implementación verifica 64 bytes, tipo ELF, arquitectura, límite de tabla de encabezados de programa, límites de segmentos `PT_LOAD` y `PT_INTERP`; lee todo el archivo para su SHA. **No prueba todas las instrucciones ni la capacidad de ejecución.**

Crear en la carpeta `private` un único `inspect_elf_structure.py` con el código siguiente EXACTO (stdlib, solo lectura); no modificar ni ampliar:

```python
#!/usr/bin/env python3
"""N7-R1, solo lee archivos ya copiados: sin subprocess, red ni ejecución del binario."""
import hashlib
import json
import re
import struct
import sys
from pathlib import Path


def read_at(f, offset, size):
    f.seek(offset)
    v = f.read(size)
    if len(v) != size:
        raise ValueError('READ_SHORT')
    return v


def inspect(path):
    p = Path(path)
    result = {'file': p.name}
    if not p.is_file() or p.is_symlink():
        result['status'] = 'MISSING_OR_LINK'
        return result
    try:
        size = p.stat().st_size
        result['size_bytes'] = size
        sha = hashlib.sha256()
        with p.open('rb') as f:
            while True:
                chunk = f.read(1024 * 1024)
                if not chunk:
                    break
                sha.update(chunk)
        result['sha256'] = sha.hexdigest()
        with p.open('rb') as f:
            if size < 64:
                result['status'] = 'TRUNCATED_ELF_HEADER'
                return result
            hdr = read_at(f, 0, 64)
            if hdr[:4] != b'\x7fELF':
                result['status'] = 'NOT_ELF'
                return result
            if (hdr[4], hdr[5], hdr[6]) != (2, 1, 1):
                result['status'] = 'UNSUPPORTED_ELF_IDENT'
                return result
            e_type, e_machine, e_version = struct.unpack_from('<HHI', hdr, 16)
            phoff = struct.unpack_from('<Q', hdr, 32)[0]
            ehsize, phentsize, phnum = struct.unpack_from('<HHH', hdr, 52)
            result.update(elf_type=e_type, e_machine=e_machine, elf_class=64,
                          program_headers=phnum)
            if e_type not in (2, 3) or e_machine != 62 or e_version != 1:
                result['status'] = 'ELF_UNEXPECTED_TYPE_OR_ARCH'
                return result
            if ehsize != 64 or phentsize != 56 or not (1 <= phnum <= 65535):
                result['status'] = 'ELF_BAD_HEADER_TABLE'
                return result
            if phoff < 64 or phoff + phentsize * phnum > size:
                result['status'] = 'ELF_PROGRAM_TABLE_OUT_OF_BOUNDS'
                return result
            load_count = exec_load_count = 0
            interps = []
            for i in range(phnum):
                ph = read_at(f, phoff + i * phentsize, 56)
                ptype, flags = struct.unpack_from('<II', ph, 0)
                offset = struct.unpack_from('<Q', ph, 8)[0]
                filesz = struct.unpack_from('<Q', ph, 32)[0]
                memsz = struct.unpack_from('<Q', ph, 40)[0]
                if offset > size or filesz > size - offset or memsz < filesz:
                    result['status'] = 'ELF_SEGMENT_OUT_OF_BOUNDS'
                    return result
                if ptype == 1:
                    load_count += 1
                    if flags & 1 and filesz > 0:
                        exec_load_count += 1
                elif ptype == 3:
                    if not 2 <= filesz <= 512:
                        result['status'] = 'ELF_INVALID_INTERP'
                        return result
                    raw = read_at(f, offset, filesz)
                    if not raw.endswith(b'\x00'):
                        result['status'] = 'ELF_INVALID_INTERP'
                        return result
                    try:
                        interp = raw[:-1].decode('ascii')
                    except UnicodeDecodeError:
                        result['status'] = 'ELF_INVALID_INTERP'
                        return result
                    if not re.fullmatch(r'/[a-zA-Z0-9_+./-]+', interp) or '..' in interp.split('/'):
                        result['status'] = 'ELF_INVALID_INTERP'
                        return result
                    interps.append(interp)
            if load_count == 0 or exec_load_count == 0 or len(interps) > 1:
                result['status'] = 'ELF_INVALID_LOAD_OR_INTERP'
                return result
            result['status'] = 'ELF_STRUCTURE_PLAUSIBLE_NOT_RUNTIME_PASS'
            result['interpreter'] = interps[0] if interps else None
            result['load_segments'] = load_count
            return result
    except (OSError, ValueError, struct.error) as e:
        result['status'] = 'UNREADABLE_OR_MALFORMED'
        result['error_kind'] = type(e).__name__
        return result


if __name__ == '__main__':
    if not 1 <= len(sys.argv[1:]) <= 3:
        sys.exit('Uso: python inspect_elf_structure.py sh.bin php.bin [loader.bin]')
    print(json.dumps([inspect(path) for path in sys.argv[1:]], sort_keys=True, ensure_ascii=False))
```

Ejecutar el lector **una sola vez** sobre archivos copiados con exit 0; por ejemplo `py -3 .\inspect_elf_structure.py .\original\sh.bin .\original\php.bin` desde private. Si falla `cp` o un archivo tiene tamaño 0, clasificar `IMAGE_FILE_READ_FAIL_OR_PARTIAL`, no tratar una salida del lector sobre fichero parcial como diagnóstico de corrupción del Docker image. **El estado `ELF_STRUCTURE_PLAUSIBLE_NOT_RUNTIME_PASS` NO es `PASS_EXECUTION`**. Si se sospecha intérprete dinámico, el analizador registra su path `PT_INTERP`; **no** ejecutar/cargar intérprete, ni usarlo como una prueba de funcionamiento.

**Autoevaluación en ChatGPT, NO repetir en Codex:** probé el lector con seis casos (64-byte header falso, tabla fuera de rango, segmento fuera de rango, mínimo sintético coherente, archivo corto no ELF, ejecutable real x86_64 del entorno de ChatGPT): **6/6 PASS**. No se ejecutó Docker ni PHP del PC del usuario. Si Codex detecta incompatibilidad por versión Python, devolver `BLOCKED_HOST_PYTHON`, no cambiar fuentes ni instalar librerías.

## 4. Clasificación con un solo camino de reparación recomendado

| Hecho observado N7 | Estado correcto | Decisión única propuesta, pendiente de permiso |
|---|---|---|
| `docker cp` falla I/O/lectura para una ruta presente en imagen identificada | `IMAGE_FILE_READ_FAIL_OR_PARTIAL` | Investigar integridad del almacenamiento/capas Docker Desktop con mantenimiento administrado; NO declarar que el binario es corrupto ni instalar imagen ciegamente |
| Archivo copiado completo, ELF no esperado o estructura fuera de límites | `IMAGE_BYTES_STRUCTURE_BAD_SCOPED` | Solicitar autorización para recuperar **solo** la imagen PHP 8.3 por referencia oficial verificada, sin borrar imagen ajena; comprobar previamente disco y concurrencia; no ejecutar recuperación en N7 |
| Binarios leídos y estructura ELF plausible, pero N6 falló al ejecutar | `ELF_STRUCTURE_PLAUSIBLE_RUNTIME_UNRESOLVED` | Solicitar mantenimiento/diagnóstico controlado de runtime o almacenamiento Docker Desktop compartido, coordinado con los demás proyectos; no afirmar el origen exacto |
| `docker create`, `inspect` o limpieza propia bloqueados | `BLOCKED_PRECHECK_OR_CLEANUP` | Detener y proponer la mínima autorización/herramienta necesaria; no reintentar con otro contexto ni limpiar recursos globales |

Una segunda imagen está permitida **solo** si su comparación resuelve una ambigüedad concreta que cambiaría la recomendación. Si original ya muestra fallo concluyente de bytes o lectura, STOP y decidir. No declarar error de Laravel o de otras apps por inferencia. No tocar N5 y N6, y no repetir N7 después de documentar una de estas salidas. **No crear N8 automático.** La próxima operación la decide el Director sobre la causa observada y los permisos del propietario.

## 5. Retorno exigido: UN ZIP sanitizado y verificado

Generar en `D:\codex\_REPORTES\Jornato\JOR-N7-PHP-IMAGE-BYTES-ROOT-CAUSE-20261121\delivery` exactamente un ZIP final, SHA-256 completo, CRC miembro por miembro y manifiesto SHA256+bytes. Fuera del ZIP solamente ruta, SHA y estado, nada disperso. Dentro incluir únicamente:

- `FINAL_REPORT.md`: resumen de una página con fuente N6, comandos efectuados y exit codes sanitizados, clasificación, límites y UNA recomendación de reparación pendiente de autorización.
- `N7_IMAGE_IDENTITY.csv`: `image_id`, plataforma, repositorio/tag, `repo_digest` (si existe), volúmenes declarados, discrepancias **sin confundir config digest con manifest digest**.
- `N7_ELF_STRUCTURE.csv`: nombres lógicos sh/php, rc de copia, tamaños, SHA, estado de estructura, `PT_INTERP` si procede; ninguna copia de binario ni volcado hexdump.
- `N7_DOCKER_GUARDS.csv`: inventario PRE/POST sanitario, IDs exclusivos N7, result de cleanup; proteger metadata de otros proyectos.
- `N7_WIP_GUARDS.csv`: HEAD, rama, staged, conteo, índice PRE/POST, sin fuentes privadas.
- `REPAIR_DECISION.md`: una sola decisión con justificación causal, evidencia a favor/en contra y autorización específica que falta.
- `MANIFEST_SHA256.csv`: SHA-256+bytes de cada miembro anterior; manifiesto no se incluye a sí mismo.

**Prohibido en el ZIP:** archivos ELF, vendor, fuente Laravel/Flutter, screenshots de secretos, `docker inspect` completo, variables `.env`, imágenes, snapshots, dump DB, logs crudos, ZIP de código, rutas personales y datos laborales. Los binarios/copias temporales se mantienen solo en `private` y nunca se publican a GitHub. Verificar el ZIP reabriéndolo después de crearlo. Si hay bloqueo, producir ZIP de bloqueo mínimo con los hechos alcanzados (no simular PASS).

Mensaje final EXACTO:

```text
TASK=JOR-N7-PHP-IMAGE-BYTES-ROOT-CAUSE-20261121
PROMPT_REVISION=N7-R1-20261121
RESULT=PASS_SCOPED_FORENSIC|PARTIAL_WITH_GAPS|BLOCKED
N7_IMAGE_BYTES=...
N7_RUNTIME_CAUSE=IMAGE_BYTES_STRUCTURE_BAD_SCOPED|IMAGE_FILE_READ_FAIL_OR_PARTIAL|ELF_STRUCTURE_PLAUSIBLE_RUNTIME_UNRESOLVED|BLOCKED_PRECHECK_OR_CLEANUP
N7_DOCKER_GUARDS=...
WIP_GUARDS=...
NEXT_REPAIR=... (NEEDS_OWNER_AUTHORIZATION)
N5_FLUTTER=PASS_CANDIDATE_SCOPED_REUSED
N6_PHP=BLOCKED_PHP_IMAGE_EXEC_REUSED
RELEASE=NO_GO
ZIP_PATH=...
ZIP_SHA256=...
NEXT_OWNER=CHATGPT_DIRECTOR
```

**Alcance final:** un macrobloque N7-R1 no destructivo, sin nueva arquitectura, sin parches. Se clasifica la evidencia de los binarios y se decide una reparación del entorno compartido; no se lanza, no se altera el código y no se ordena automáticamente otra auditoría.
