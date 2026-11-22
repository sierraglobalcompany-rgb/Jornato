# CODEX LUNA — JORNATO N7 · UNA PASADA FORENSE DE IMÁGENES PHP, SIN ARRANCAR PHP NI MARIA DB

**TIPO:** ORDEN EJECUTABLE ÚNICA. **TASK:** `JOR-N7-PHP-IMAGE-BYTES-ROOT-CAUSE-20261121`. **DIRECTOR:** ChatGPT. **EJECUTOR:** Codex Luna. **FECHA:** 21-nov-2026 (Colombia). **PRECEDENCIA:** N6-R2 terminó y fue adjudicado, NO repetir N6 ni ejecutar N6-R3. Si otro Codex N7 ya comenzó, existe ZIP N7 o hay proceso concurrente en el mismo WIP, **STOP** y entregar únicamente el estado/ZIP existente al Director. No interpretar este texto como permiso de reiniciar Docker Desktop, instalar componentes, descargar imágenes ni publicar fuentes.

## 0. Decisión del Director: evitar otro ping-pong de runtime

El ZIP auténtico N6-R2 (`JOR-N6-PHP-RUNTIME-CAUSE-ISOLATED-QA-20261121-UNICO.zip`) fue auditado en ChatGPT: **7.742 bytes**, SHA-256 `664724B357008753353065F804817A990CEDE6FE5E6B41BEE2A5AF6A327B5AF4`, 9 miembros CRC PASS y **8/8 archivos del manifiesto correctos**. N6 tiene `RESULT=BLOCKED`, no un defecto Laravel probado.

**REUTILIZAR sin repetir**: N4 paridad privada 232 fuentes y servidor 150; N5 Flutter host `PASS_CANDIDATE_SCOPED`, Pub resuelto con lock, 9/9 widgets; N5 topología Docker `none + service:db` alcanzó dos contenedores aislados sin IPAM pero PHP no arrancó; N6 WIP intacto y cuatro sondas fallidas. **NO reejecutar** sondas shell o `php -v` de N6, Pub, 86 suites N2, 9+4 N3, E01–E08, 158/2450 históricas ni QA Android. E01–E08 permanecen `NOT_RUN`, no PASS.

**Las cuatro pruebas N6 que NO se repetirán:** imagen original `php:8.3-cli-bookworm` ID `sha256:232331112d3a7c5b98edeeddc3b85f610172f99352c0635fe6b3e166e47062cb` A `/bin/sh` exit 255 `exec format error`, B PHP exit 255 `exec format error`; alternativa `php:8.4-cli-bookworm` ID `sha256:b3e907a1108629c562c4bb313ce3449e34d49991f6bb2487913f6146f47200fe` A shell exit 255 `exec format error`, B PHP exit 255 `input/output error`. Daemon e imágenes declaran `linux/amd64`, lo cual **NO demuestra integridad de los binarios** ni descarta un defecto de capa/almacenamiento/runtime.

**ÚNICO OBJETIVO:** inspeccionar por bytes, sin ejecutar, binarios de una imagen PHP cacheada; distinguir `ELF_WRONG_ARCH`, `INVALID_OR_UNREADABLE_IMAGE_BYTES` o `VALID_ELF_BUT_RUNTIME_FAILS`, con evidencia suficiente para decidir el **siguiente permiso de reparación**. Solo si la primera imagen no discrimina, comprobar la segunda igualmente por bytes. N7 **no vuelve a construir ni probar Laravel**. El entregable útil es un diagnóstico reproducible y una decisión concreta, no otra auditoría general.

## 1. Custodia, aislamiento y límite de recursos

- Rutas conocidas: WIP `D:\codex\Jornato`; reportes previos `D:\codex\_REPORTES\Jornato\JOR-N6-PHP-RUNTIME-CAUSE-ISOLATED-QA-20261121`; salida privada N7 `D:\codex\_REPORTES\Jornato\JOR-N7-PHP-IMAGE-BYTES-ROOT-CAUSE-20261121\private`; entrega `...\delivery`.
- Antes de tocar Docker: confirmar que N6 concluyó y que no hay N7 previo; verificar SHA del ZIP N6 si está presente. Leer `git rev-parse HEAD`, rama, `git status --porcelain=v1 -uall`, staged, SHA del índice solo si está accesible, sin mutación. Baseline WIP informado: HEAD `faf5fe283191f8b5a2724b397009512a2caec1b6`; 235 rutas (11 modified/224 untracked), 0 staged, índice `25CC609803D7E68D5F3ECF428198B2432CF1EA37030546735DD3F03299D905E1`. Si cambió por otro agente: no revertir, no pasar encima; `BLOCKED_CONCURRENT_WIP`. No copiar fuentes, vendor, `.env`, DB ni credenciales.
- Docker es compartido por varios proyectos. **NO** reiniciar/parar el motor, cambiar contexto, activar WSL/daemon, editar IPAM, crear redes, borrar/prune recursos, descargar/pull/build imágenes, usar contenedores, redes, nombres, volúmenes o puertos ajenos, ni extraer datos de sus servicios. N5 ha dejado recursos propios preservados: no tocarlos tampoco. Prohibido `docker desktop restart`, `wsl --shutdown`, `docker system prune`, `docker image rm`, `docker compose up/down`, `docker stop/rm` ajeno, `docker save/load` a gran escala, `docker pull` y cualquier ejecutable PHP o SQL.
- Inventario **solo metadatos** PRE de Docker contenedores/redes/volúmenes (IDs+estado+puerto+labels filtradas; sin inspect/env ajenos), `docker context show`, plataforma daemon y backend WSL si puede consultarse read-only. Validar que contexto es el **mismo** que N6 y no cambiarlo. Anotar divergencia. Preparar solo 1 directorio privado y nombres de contenedor `jornato-n7-php-bytes-<suffix>` inéditos con label `com.sierraglobal.jornato.task=N7` y operación exclusiva `create/cp/rm` sobre ellos.
- **Importante:** `docker create` crea un contenedor DETENIDO y una capa temporal; `docker cp -L` lee su filesystem sin ejecutar PID1. Antes de usarlo comprobar que imagen existe por **ID inmutable** local y que `Config.Volumes` no declara volúmenes automáticos; de lo contrario `BLOCKED_IMAGE_VOLUME_RISK` y no crear contenedor. No usar tags para arrancar o seleccionar imagen: los IDs de N6 son el blanco único. Tamaño de los archivos copiados acotado a `/bin/sh` y `/usr/local/bin/php`, nunca raíz de imagen ni directorios completos. No ejecutar ninguno de esos archivos en Windows.

## 2. Preflight: separar ID, RepoDigest, plataforma y referencia

**Solo metadatos:** para ambos IDs N6 usar `docker image inspect` con formato filtrado (Id, OS, Architecture, Variant, Entrypoint, Cmd, RepoTags, RepoDigests, Config.Volumes), sin `docker inspect` de contenedores ajenos. Acreditar la identidad de cada ID; si no existe, `BLOCKED_IMAGE_MISSING`, no tirar del registro. Distinguir explícitamente:

- **Image ID** = digest de configuración de imagen; **RepoDigest** = referencia de manifiesto de distribución. **No afirmar que ambos deban coincidir**. N6 los presenta iguales en la matriz, dato que debe verificarse sin darlo por supuesto. Si la metadata no permite explicar la relación, clasificar `METADATA_DISCREPANCY`, no manipular IDs.
- Daemon `linux/amd64` reportado no reemplaza inspección del binario real. No se admite `--platform` arbitrario, ni emulación de otro CPU, ni conversión de imágenes.
- Registrar conteo y tipo de volúmenes automáticos; limitar ejecutor al ID original y, solo si es insuficiente para discriminar, al ID alternativo. **Ningún `docker run/start/exec` en N7.**

## 3. Una sola prueba forense de bytes (máximo dos imágenes, sin ejecutar)

**Secuencia obligatoria por imagen — Windows PowerShell, ajustando variables y comprobando identidad pre/post:** 

1. Generar nombre privado único bajo N7; comprobar que no existe contenedor con ese nombre y que el image ID coincide exactamente con uno de N6. Si imagen declara `VOLUME`, STOP; no permitir creación que genere volúmenes anónimos.
2. Crear **un contenedor DETENIDO** con `docker create --network none --read-only --name <nombre-N7> --label com.sierraglobal.jornato.task=N7 --entrypoint /bin/true <IMAGE_ID>`. Nunca ejecutar `docker start` o `docker run`. Guardar ID creado y verificar por label/nombre/imagen/estado `created`, propiedad exclusiva N7. Si falla `create`, registrar `BLOCKED_CREATE` y STOP; no probar variantes.
3. `docker cp -L <ID_PROPIO>:/bin/sh <PRIVATE_N7>\sh.bin` y `docker cp -L <ID_PROPIO>:/usr/local/bin/php <PRIVATE_N7>\php.bin`, **sin seguir más archivos**. En PowerShell con interpolación de variable usar `${cid}:/bin/sh`, nunca asumir que el carácter `:` funciona correctamente dentro de `$cid:/...`. Si una copia da `input/output error` o fallo de capas, clasificar `IMAGE_FILE_READ_FAIL`, conservar solo resumen sin rutas íntimas. No copiar desde contenedores en ejecución o ajenos.
4. **Siempre** en bloque `finally`, ejecutar `docker rm <ID_PROPIO>` solo después de comprobar label `task=N7` e ID propio; confirmar que no queda contenedor N7. Si la retirada falla, `CLEANUP_PARTIAL` con ID, no hacer prune. No borrar archivos fuente de otros proyectos.
5. Si ambas copias dan bytes legibles, examinar desde **Python de host solo como lector**: tamaño y SHA-256 local, primeros 64 bytes (no incluir bytes crudos en ZIP), magia ELF `7F 45 4C 46`, clase `2` (64-bit), little endian `1`, `e_machine` `62` (`EM_X86_64`) leído de bytes 18–19, tipo de fichero (ELF ejecutable o PIE), y si es script `#!` registrar que no es ELF y revisar solo shebang sanitizado. Ejecutar un script mínimo en private que **lea**, nunca `subprocess` ni cargue/libere el binario; no usar OCR, PE parser o `file` externo. Para enlaces simbólicos, `docker cp -L` debe resolver al contenido según Docker Docs; si no se resuelve, `BLOCKED_SYMLINK_COPY`. No afirmar que header correcto = binario entero sano o imagen ejecutable.
6. Si la imagen original demuestra bytes incorrectos/no legibles, **no hace falta inspeccionar una segunda** para acreditar ese defecto de archivo. Solo si hay ambigüedad, examinar UNA VEZ la alternativa precitada con el mismo método, y luego STOP. No probar más tags/imágenes ni una serie de `docker run`.
7. Hacer inventario POST de contenedores/redes/volúmenes propios y ajenos y comparar PRE/POST. No clasificar PASS aislamiento si dejó un contenedor/volumen N7 no explicado. En ZIP solo conteos de recursos ajenos conservados, identificadores N7 y estados sanitizados, sin Docker inspect completo ni secretos.

**Clasificación obligatoria:**

- `IMAGE_BYTES_BAD_HEADER`: `sh.bin` o `php.bin` no es ELF x86_64 legible o su tipo/script inesperado está probado; separar del efecto sobre Docker.
- `IMAGE_FILE_READ_FAIL`: la copia de una ruta válida falla por lectura/almacenamiento, no imputar automáticamente el daño a imagen ni daemon sin diagnóstico adicional.
- `IMAGE_BYTES_ELF_X86_64_HEADER_OK_RUNTIME_STILL_BLOCKED`: ambos headers correctos, pero N6 ya probó fallo de ejecución. No declarar `PASS_RUNTIME` ni `CORRUPTION_DISPROVED`; root entre filesystem/capa/runtime sigue incierta.
- `BLOCKED_DOCKER_CONTEXT|BLOCKED_IMAGE_MISSING|BLOCKED_IMAGE_VOLUME_RISK|BLOCKED_CREATE|BLOCKED_RESOURCE|CLEANUP_PARTIAL` según corresponda.

### 3.1 Implementación determinista mínima — copiar, leer, descartar

**Receta PowerShell, solo después de completar los gates 1–3 y sustituir `$out` por la ruta PRIVADA N7 ya verificada.** El script se ejecuta por cada imagen **admitida**, como máximo una vez por ID; no adaptar para recorrer la lista de imágenes de otros proyectos. No volcar `docker inspect` completo a informe ni terminal compartida:

```powershell
# No empezar si falta alguno de los preflights o N7 ya existe.
$img = "sha256:232331112d3a7c5b98edeeddc3b85f610172f99352c0635fe6b3e166e47062cb"
$out = "D:\codex\_REPORTES\Jornato\JOR-N7-PHP-IMAGE-BYTES-ROOT-CAUSE-20261121\private\original"
New-Item -ItemType Directory -Force -Path $out | Out-Null
$metaJson = & docker image inspect $img 2>$null
if ($LASTEXITCODE -ne 0) { throw "BLOCKED_IMAGE_MISSING" }
$meta = @($metaJson | ConvertFrom-Json)[0]
if ($meta.Id -ne $img) { throw "BLOCKED_IMAGE_IDENTITY" }
if ($meta.Config.Volumes) { throw "BLOCKED_IMAGE_VOLUME_RISK" }
# Ya se confirmó propiedad y nombre nuevo con inventario PRE.
$name = "jornato-n7-php-bytes-" + (Get-Date -Format "yyyyMMddHHmmssfff")
$cid = $null
try {
  $cid = (& docker create --network none --read-only --name $name --label "com.sierraglobal.jornato.task=N7" --entrypoint /bin/true $img).Trim()
  if ($LASTEXITCODE -ne 0 -or !$cid) { throw "BLOCKED_CREATE" }
  $ciJson = & docker inspect $cid
  if ($LASTEXITCODE -ne 0) { throw "BLOCKED_OWNERSHIP" }
  $ci = @($ciJson | ConvertFrom-Json)[0]
  if ($ci.Config.Labels.'com.sierraglobal.jornato.task' -ne 'N7' -or $ci.Image -ne $img -or $ci.State.Status -ne 'created') { throw "BLOCKED_OWNERSHIP" }
  & docker cp -L "${cid}:/bin/sh" (Join-Path $out "sh.bin")
  $rcSh = $LASTEXITCODE
  & docker cp -L "${cid}:/usr/local/bin/php" (Join-Path $out "php.bin")
  $rcPhp = $LASTEXITCODE
  # Registrar solo rcSh y rcPhp, no tratar fallos de copia como PASS de bytes.
} finally {
  if ($cid) {
    $ciJson = & docker inspect $cid 2>$null
    if ($LASTEXITCODE -eq 0) {
      $ci = @($ciJson | ConvertFrom-Json)[0]
      if ($ci.Config.Labels.'com.sierraglobal.jornato.task' -eq 'N7' -and $ci.Image -eq $img) {
        & docker rm $cid | Out-Null
        if ($LASTEXITCODE -ne 0) { Write-Output "CLEANUP_PARTIAL (ID privado N7)" }
      } else { Write-Output "CLEANUP_PARTIAL: ownership no confirmada" }
    }
  }
}
```

**Cuidado:** si la preparación con `docker create` crea un volumen/red a pesar del preflight, STOP y registrar recursos propios para limpiar con identificación positiva. No convertir un `cp` fallido en una excepción que impida el bloque `finally`. No ejecutar la receta mientras otra instancia Codex/N7 use el mismo ID/nombre/directorio. Para la alternativa cacheada se sustituye exclusivamente `$img` y `$out=...\private\alternative` luego de justificar por qué sigue siendo ambigua la primera.

**Analizador ELF estático (Python de Windows, crear como `private\inspect_elf.py`; nunca ejecuta lo copiado):**

```python
from pathlib import Path
import hashlib, struct, sys, json

def inspect(path):
    p = Path(path)
    if not p.is_file():
        return {"file": p.name, "status": "MISSING_OR_CP_FAILED"}
    with p.open("rb") as f:
        head = f.read(64)
    size = p.stat().st_size
    digest = hashlib.sha256()
    with p.open("rb") as f:
        while chunk := f.read(1024 * 1024):
            digest.update(chunk)
    sha = digest.hexdigest()
    result = {"file": p.name, "bytes": size, "sha256": sha}
    if len(head) < 20 or head[:4] != b"\x7fELF":
        result["status"] = "NON_ELF_OR_TRUNCATED"
    else:
        klass, endian = head[4], head[5]
        fmt = "<H" if endian == 1 else ">H"
        machine = struct.unpack_from(fmt, head, 18)[0] if endian in (1, 2) else None
        result.update(elf_class=klass, endian=endian, e_machine=machine,
                      status="ELF_X86_64_HEADER_OK" if (klass,endian,machine)==(2,1,62) else "ELF_ARCH_HEADER_MISMATCH")
    return result

if __name__ == "__main__":
    print(json.dumps([inspect(x) for x in sys.argv[1:]], sort_keys=True))
```

**Una cabecera ELF correcta no demuestra que todas las páginas del binario o su intérprete dinámico sean ejecutables.** Cerrar siempre con la clasificación acotada del punto 3.

## 4. Traducción del diagnóstico en una sola decisión (no otro ciclo)

Redactar en `REPAIR_DECISION.md` **UNA propuesta principal** condicionada a la causa observada, y su autorización específica pendiente; no ejecutar reparación global ahora:

- Header incorrecto o bytes inservibles únicamente en PHP, con Docker/otros proyectos operativos → candidato a recuperar **una sola imagen PHP oficial 8.3** por digest verificado, con autorización expresa de red/descarga y comprobación de espacio; preservar originales y no borrar imágenes ajenas. Si parece fallo de lectura I/O, no asegurar que un pull lo repare.
- Headers válidos pero Docker da `exec format error`/I/O → tratar como **bloqueo del runtime o almacenamiento Docker Desktop a investigar por dueño**; proponer una intervención administrada **programada**, tras proteger proyectos concurrentes, sin reinicio ni limpieza automática. Recopilar únicamente diagnóstico sanitario local cuando ya exista autorización (la herramienta Docker Desktop Diagnose puede incluir datos de otros proyectos y/o subir telemetría; NO correr ni enviar por defecto).
- Si falla la inspección por restricciones host/contexto/recursos → declarar bloqueo exacto y qué permiso/herramienta falta, sin cambiar arquitectura, no cargarlo al producto Jornato.

No crear ya `docker compose`, redes, PhpUnit, DB QA, migraciones o E01–E08: **el objetivo N7 es una decisión de reparación de infraestructura**, y su resultado se tratará de forma coordinada con los otros proyectos. El carril **Gratis Local** tiene evidencia host N5 reutilizable, pero **NO** autorizar APK/ADB/Android nativo sin otro permiso; no confundir cierre host con release.

## 5. Informe y ZIP: un único retorno verificable

Generar exclusivamente **un ZIP sanitizado** en `...\delivery`, hash SHA-256 y CRC comprobados con manifiesto (file, sha256, bytes; no incluirse a sí mismo). Contenido útil máximo:

- `FINAL_REPORT.md`: TASK, causa/observación, clasificación, bloqueo para release, decisiones de reparación, limitaciones probatorias; resultados host anteriores solo `REUSED`.
- `IMAGE_ID_VS_REPODIGEST.csv`: metadatos de las DOS imágenes y si observaciones N6 se confirman o no (sin env/inspect completo).
- `PHP_IMAGE_BYTES.csv`: image ID, path lógico binario, copy result, tamaño, SHA256, ELF class/endian/machine, veredicto *del header*, nada de binarios completos o bytes crudos.
- `DOCKER_GUARDS.csv`: conteos/IDs propios N7 y PRE/POST de otros recursos, cero mutación cruzada.
- `WIP_GUARDS.csv`: rama, HEAD, staged, status, índice PRE/POST, sin listar secretos o paths reales sensibles.
- `REPAIR_DECISION.md`: un único camino recomendado, permiso específico pendiente, puerta de no-go.
- `MANIFEST_SHA256.csv`: hashes y tamaño de todos los anteriores.

**Prohibido incluir** imágenes/bloques ELF, ZIP de fuentes, vendor, E2E mocks, `.env`, imágenes de disco Docker, `docker image save`, logs completos, datos personales, claves o accesos. Si falla la operación, entregar igualmente un ZIP de bloqueo con la evidencia obtenida y clasificación exacta; no generar N7-R1, N8 ni pedir al usuario pruebas locales por rutina. Guardar privados binarios temporales y logs en `...\private` sin subir.

**Mensaje final a Director, sin adornos:**

```text
TASK=JOR-N7-PHP-IMAGE-BYTES-ROOT-CAUSE-20261121
RESULT=PASS_SCOPED_FORENSIC|PARTIAL_WITH_GAPS|BLOCKED
N7_IMAGE_BYTES=...
N7_RUNTIME_CAUSE=PROVEN_IMAGE_BYTES|UNRESOLVED_RUNTIME_OR_STORAGE|BLOCKED_PRECHECK
N7_DOCKER_GUARDS=PASS_UNCHANGED|PARTIAL|FAIL
WIP_GUARDS=PASS_UNCHANGED|DELTA_UNEXPECTED
NEXT_REPAIR=... (NEEDS_OWNER_AUTHORIZATION)
N5_FLUTTER=PASS_CANDIDATE_SCOPED_REUSED
N6_PHP=BLOCKED_PHP_IMAGE_EXEC_REUSED
RELEASE=NO_GO
ZIP_PATH=...
ZIP_SHA256=...
NEXT_OWNER=CHATGPT_DIRECTOR
```

**Cierre:** este es un único diagnóstico forense focal N7, no una auditoría ni una serie de reintentos. El Director adjudicará el ZIP y decidirá entre recuperación puntual de imagen o mantenimiento controlado del entorno Docker compartido. **No prometer progreso de Laravel antes de tener un ejecutable PHP viable.**
