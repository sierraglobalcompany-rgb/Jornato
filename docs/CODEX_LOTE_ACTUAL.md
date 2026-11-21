# CODEX LUNA — JORNATO N5 · MACROBLOQUE ÚNICO DE DESBLOQUEO REAL: DOCKER PRIVADO SIN IPAM + CACHÉ PUB EXACTA

**EJECUTAR, NO AUDITAR DE NUEVO EL PROMPT.** Director: ChatGPT. Ejecutor único: Codex Luna, Windows. Esta orden **sustituye** el borrador `CODEX_POST_N4_DOCKER_BORRADOR_NO_EJECUTAR_20261121.md` únicamente después de que N4 haya terminado. No retoma N4, no rehace su candidato, ni abre otro backend. 

```text
TASK=JOR-N5-DOCKER-NONET-PUB-GATES-20261121
WIP_ROOT=D:\codex\Jornato
N4_REPORT_ROOT=D:\codex\_REPORTES\Jornato\JOR-N4-FULL-SOURCE-AND-SERVER-QA-20261121
OUTPUT_ROOT=D:\codex\_REPORTES\Jornato\JOR-N5-DOCKER-NONET-PUB-GATES-20261121
N4_ZIP_SHA256=C5B1F0F344ED6E2B280FCFB92126664593715C24B0B27D29A5A0C4460898D1F8
N4_SOURCE=232/232_PARITY_PASS_SCOPED;SERVER=150_FILES;API_ROUTE_DECLARATIONS=34;MIGRATIONS=11
N4_FLUTTER=BLOCKED_OFFLINE_CACHE_22_OF_79;SDK=3.47.8;DART=3.13.7
N4_DOCKER=29.9.2;COMPOSE=5.6.1;BLOCKED_DOCKER_IPAM;E2E=0_RUN
N4_WIP_HEAD=faf5fe283191f8b5a2724b397009512a2caec1b6
N4_WIP_INDEX_SHA=25CC609803D7E68D5F3ECF428198B2432CF1EA37030546735DD3F03299D905E1
N4_WIP_PATHS=235;UNTRACKED=224;MODIFIED=11;STAGED=0
N2_HOST=86_PASS_0_FAIL_0_SKIP;N3_KIOSK=9_PASS;N3_NEIGHBOR=4_PASS
N5_RELEASE=NO_GO
NEXT_OWNER=CHATGPT_DIRECTOR
```

## 0. Resultado y límites: no hagas trabajo repetido

**Objetivo A (Flutter):** averiguar si los 22 faltantes fueron falsos negativos por inspeccionar solo el Pub cache predeterminado; recuperar la resolución **exacta de pubspec.lock** desde caches ya presentes sin descargas y hacer un único smoke focal **en el candidato N4 aislado**. Si realmente faltan bytes, lista precisa y `BLOCKED_PUB_PACKAGES`; no actualizar paquetes, no cambiar `pubspec.lock`, no inventar resultados.

**Objetivo B (servidor):** probar **una única topología Docker QA aislada** que no asigna ninguna red bridge ni IPAM: contenedor MariaDB `network_mode: none`; contenedor PHP `network_mode: service:db` en el MISMO namespace privado; PHP accede a MariaDB por `127.0.0.1:3306`. Ambos bajo un único proyecto Compose de Jornato y sin puertos publicados, DNS/egress externo, volúmenes o conexiones de otros proyectos. Si Docker/Compose no permite esta topología o intenta crear red, **STOP** inmediatamente con evidencia. Si pasa y existen extensiones/deps, ejecutar migraciones nuevas y los ocho E2E focales E01–E08 con dos empresas ficticias A/B, sin pruebas generales. No tocar producción, staging o Android.

**El mecanismo Docker es una hipótesis técnica respaldada por especificación oficial, NO probado aún en este host.** Referencias: https://docs.docker.com/reference/compose-file/container-spec/ (`none` / `service:{name}`), https://docs.docker.com/engine/network/drivers/none/ (solo loopback), https://docs.docker.com/compose/how-tos/startup-order/ (dependencia entre servicios). Si falla, el bloqueo honesto es correcto. No improvisar otra arquitectura de red.

**No repetir:** reconstrucción de 232 fuentes N4, hash masivo/analizador en WIP, 86 tests N2, 9+4 tests N3 en WIP, 158/2450 backend históricos, 10+10 jueces, C2 Android. No crear nueva app, ORM, servicio PHP host, BD host ni framework/runner alterno. PingPongLaw L1 KISS, L2 antirruido, L3 causa raíz, L4 UX humana, L5 evidencia real, L6 anti-pingpong. Mantener `requestId` y legado `requetId`; `SERVER_STORED != RECOGNIZED`; B19/B20 DENY-ALL y OD02/03/04 sin aprobar. Todo QA con datos sintéticos.

### Prohibiciones duras

- NO descargar herramientas ni paquetes, `docker pull`, `docker build` conectado, `apt-get`, `composer install` desde red, `flutter pub get` online, `dart pub upgrade`, `precache` o alteración de `pubspec.lock`.
- NO usar servicios PHP/DB nativos de Windows. NO reutilizar/inspeccionar credenciales de otros proyectos, redes/volúmenes/contendedores ajenos. NO `docker network create`, `prune` (de ninguna clase), `docker system prune`, `docker network connect`, `docker stop/rm` sobre recursos ajenos, `docker compose down --volumes` para proyectos no identificados, ni cambios globales en Docker Desktop/daemon/IPAM.
- NO usar `network_mode: host`, `network_mode: bridge`, redes Docker predeterminadas/ajenas o publicar puertos en host. **Solamente** namespace privado `none`/`service:db` para QA. No segunda variante si falla.
- NO ejecutar `git add/commit/push/fetch/pull/merge/reset/stash/clean/checkout` ni mutar index, branch o HEAD del WIP. No tocar teléfono, ADB, AVD, firmas ni despliegue. No copiar `.env` real, tokens, bases, llaves ni datos de trabajadores.
- NO crear ZIP de fuentes; toda fuente, diff, fixture privado y logs sensibles quedan en `OUTPUT_ROOT\private` sobre D: y no se envían. Sigue `OFF_DEVICE_BACKUP=NO`.

## 1. Preflight único: seguridad y reuso de N4

1. Confirmar que N4 concluyó, su ZIP es el indicado y no existe N5 anterior ni otro Codex que modifique `D:\codex\Jornato`. Si ya existe entrega N5, detener sin repetir. No operar dos instancias sobre este proyecto.
2. Consultar WIP read-only: `git rev-parse HEAD`, rama, `git status --porcelain=v1 -uall`, `git diff --cached --quiet`, hash de índice y hashes **solo de archivos necesarios**. Registrar estado PRE y comprobar cambios relevantes posteriores a N4. Si el WIP está siendo editado por otro, `BLOCKED_CONCURRENT_WIP` sin tocarlo. El estado N4 de referencia es 235 rutas, 224 untracked, 11 modificadas y 0 staged, no un requisito para forzar `git reset`.
3. Identificar exactamente la carpeta candidata privada de N4 (nunca asumir subcarpetas): partir de `N4_REPORT_ROOT`, `FULL_SOURCE_COVERAGE.csv` con 232 rutas/hashes y el informe N4. Confirmar 232/232 originales **por comparación de manifiesto existente**, no rehacer `git archive` o overlay. Si cambió el candidato, describir delta acotado antes de usar; si falta, recuperar SOLO desde la custodia N4 y manifest, una vez. `SOURCE_N4_REUSE=PASS|BLOCKED`, no reauditar todas las rutas sin causa.
4. Preparar `OUTPUT_ROOT\private` como único laboratorio; salida dentro de D:, no montar ni editar el WIP directamente. Probar rutas canónicas, sin symlinks/junction/hardlinks; salida QA/DB solo en ese árbol. Anotar hashes PRE/POST y no borrar materiales ajenos.
5. Docker es compartido con otros proyectos Codex. Leer solamente versiones, contenedores, nombres/labels de redes/volúmenes y recursos (sin `inspect` completo ni secretos), y capturar un resumen BEFORE de **IDs/estados/puertos ajenos**. Comprobar capacidad razonable RAM/disco; si no es seguro agregar 2 contenedores, `BLOCKED_DOCKER_RESOURCE`. El hecho de que N4 devolvió IPAM agotado NO autoriza limpieza o ajuste de redes.

## 2. Carril Flutter — investigar la caché real de N3 antes de concluir que faltan paquetes

1. **No escanear todo Windows.** Obtener `pubspec.yaml`, `pubspec.lock` del candidato N4; comparar SHA del lock antes de trabajar. Revisar solo: `PUB_CACHE` del proceso, `%LOCALAPPDATA%\Pub\Cache`, variable/cache de los entornos que ejecutaron N2/N3 y **rutas `rootUri` de dependencias en el `.dart_tool/package_config.json` actual del WIP**. El package_config se lee únicamente para descubrir rutas de cache; **NO** copiarlo al candidato tal cual, porque puede apuntar al WIP. No buscar en unidades ajenas ni usar caches de otros proyectos sin verificar versión+integridad y ausencia de mutación.
2. Generar en `private` una tabla `PUB_CACHE_GAP.csv` (package,version,lock_hash_available,cache_root_redacted,package_dir_present,hash_stamp_present,decision) para los **79 packages hosted** del lock, destacando los 22 marcados ausentes en N4. No incluir rutas absolutas personales en ZIP. Verificar que los archivos de paquete y metadatos correspondan al paquete/versión exactos. Un nombre de directorio no acredita hashes de contenido.
3. Si existe una caché íntegra compatible, establecer `PUB_CACHE` SOLO para el proceso dentro de un candidato privado de trabajo. Si es necesario combinar caches, hacer **copias de los 22 paquetes exclusivamente** a un cache privado bajo N5, con integridad y licencia conservadas; no modificar ni borrar caches originales, no usar enlaces a otras apps. No copiar `package_config.json` del WIP ni cambiar dependencias de código.
4. Solo con cache completa probada, y sin red, comprobar si esta versión soporta `flutter pub get --offline --enforce-lockfile` mediante ayuda local; si es compatible, ejecutar **una sola vez dentro del candidato privado**. Si no admite `--enforce-lockfile`, se admite solo `flutter pub get --offline`, después comprobar SHA de `pubspec.lock` exactamente igual PRE/POST; ante delta restaurar copia privada y bloquear sin actualizar dependencias. Registrar stdout/stderr sanitizados; cero downloads/requests.
5. Si resulta PASS, ejecutar en candidato (NO WIP) `flutter analyze --no-pub` solo sobre archivos relevantes y **una vez** `flutter test --no-pub test/kiosk_screen_actions_test.dart`. Test widget vecino **solo si hubo cambio de propietario relevante**, no por rutina. El objetivo es demostrar que el candidato completo se puede ejecutar con dependencias resueltas, no certificar Android. Hash de código PRE/POST igual o delta justificado; no construir APK ni generar artefactos Android.
6. Si los 22 faltantes son reales, `BLOCKED_PUB_PACKAGES` con lista exacta package+version+hash faltante (sin fuentes) y ruta futura **condicionada a autorización para recuperar paquetes oficiales con lock fijo**. No descargar ni usar versiones viejas para obtener PASS. **Continuar Docker igualmente.**

## 3. Carril Docker — una sola topología sin puente IPAM y sin host networking

### 3.1 Requisitos antes de crear ningún contenedor

1. Confirmar Docker 29.9.2/Compose 5.6.1 o versiones actuales detectadas, daemon accesible y **las imágenes exactas** ya locales para PHP 8.3 y MariaDB 11.8.9. Guardar IDs/digests observados; no usar `latest`, `pull`, `build`, Dockerfiles ajenos ni registro privado. Verificar etiquetas de proyecto Compose exclusivas y un solo identificador nuevo `jornato-n5-qa-<sufijo_corto>` distinto de todos los proyectos vigentes. Un máximo de **dos contenedores N5** bajo ese nombre.
2. La definición Compose se escribe **solo** en `OUTPUT_ROOT\private\docker-qa\compose.yaml`; todos los bind mounts/volúmenes deben ser del árbol N5 privado o un volumen nombrado nuevo propiedad del proyecto. No montar Docker socket, raíz de D:, rutas de otros proyectos ni datadir externo. Versiones de imágenes **sustituir por TAGS CACHEADOS REALES identificados**; no asumir que el runtime PHP existente ya incluye todas las extensiones.
3. **Plantilla de topología permitida** (configurar rutas/credenciales QA sintéticas exclusivamente en private; no registrar sus valores):

```yaml
services:
  db:
    image: mariadb:11.8.9 # sustituir solo por el tag/ID local confirmado
    pull_policy: never
    network_mode: "none"
    environment:
      MARIADB_DATABASE: jornato_n5_qa
      MARIADB_USER: jornato_n5_qa
      MARIADB_PASSWORD: ${N5_DB_PASSWORD:?set_in_private_env}
      MARIADB_ROOT_PASSWORD: ${N5_ROOT_PASSWORD:?set_in_private_env}
    volumes:
      - n5_data:/var/lib/mysql
    healthcheck:
      test: ["CMD-SHELL", "mariadb-admin ping --protocol=tcp -h 127.0.0.1 --silent"]
      interval: 5s
      timeout: 3s
      retries: 12
  php:
    image: php:8.3-cli # sustituir solo por el tag/ID local confirmado
    pull_policy: never
    network_mode: "service:db"
    depends_on:
      db:
        condition: service_healthy
    working_dir: /app/server
    environment:
      APP_ENV: testing
      APP_DEBUG: "false"
      DB_CONNECTION: mysql
      DB_HOST: 127.0.0.1
      DB_PORT: "3306"
      DB_DATABASE: jornato_n5_qa
      DB_USERNAME: jornato_n5_qa
      DB_PASSWORD: ${N5_DB_PASSWORD:?set_in_private_env}
    volumes:
      - "${N5_CANDIDATE_BIND:?set_in_private_env}:/app"
    entrypoint: ["sh", "-c", "sleep infinity"]
volumes:
  n5_data:
```

**Ajustes obligatorios:** usar sufijo/nombre Compose único por proyecto; ruta de bind candidata N5 contiene copia privada real de `server/vendor` local ya validado contra composer.lock, y la fuente N4 completa. El volumen `n5_data` lo crea **solo** este Compose. La DB no publica puerto, escucha loopback interno, PHP comparte exclusivamente ese namespace con `service:db`, conecta por `127.0.0.1`. No existe top-level `networks`, ni `ports`, ni `network_mode: host` o `bridge`, ni redes `external` y no se asocia ningún servicio a red externa. No agregar servicios extra. La lectura de env/Compose puede revelar secretos; guardar archivos env exclusivamente en private, no imprimir `docker compose config` entero en salida. Registrar solamente campos permitidos.

4. Resolver variables con archivo env privado usando `docker compose --project-name <jornato-n5-qa-sufijo> --env-file <ruta_privada> -f <ruta_compose> config --format json` **guardando el JSON exclusivamente en private** y mostrando externamente SOLO campos estructurales no sensibles. El comando `config` puede revelar las contraseñas interpoladas; nunca mostrar su salida completa ni adjuntarla al ZIP. Verificar programáticamente que `services.db.network_mode == 'none'`, `services.php.network_mode == 'service:db'`, ningún servicio tenga `networks`, `ports`, `network_mode: host`, volúmenes external o bind fuera de N5 private. Si Compose muestra una red `default` **que deba aprovisionar para un servicio**, `BLOCKED_COMPOSE_NETWORK`, sin `up`. Si el config renderiza puertos o monta WIP/otro proyecto, STOP. Restringir CPU/memoria a límites razonables según el host, sin competir con otros procesos.

### 3.2 Una ejecución productiva, sin nuevas redes

1. Ya con preflight PASS, ejecutar **una sola vez** `docker compose --project-name <jornato-n5-qa-sufijo> --env-file <ruta_privada> -f <ruta_compose> up -d --pull never --no-build` sin imprimir variables sensibles; si Docker vuelve a pedir asignación de bridge/IPAM o Compose crea/intenta crear red fuera de namespace `none`, **STOP con `BLOCKED_DOCKER_IPAM`**. No cambiar a `host`, `bridge`, red por defecto, `container:` de otro proyecto, subred manual, prune, ni segundo Compose alterno.
2. Si los contenedores arrancan, comprobar **identidad real con inspect filtrado y sanitizado**: labels Compose del proyecto exclusivo, DB con network mode `none`, PHP con mode de namespace container propio de DB, sin conexiones a redes ajenas, sin IP nueva, sin puertos publicados y volumen DB/paths propios. Ante cualquier inconsistencia STOP, sin ejecutar tests. Capturar solo IDs/labels/estados, nunca environment o inspect completo.
3. Verificar desde PHP contenedor PHP/extensiones obligatorias PHP ^8.3; PDO/MySQL, mbstring/dom/xml/otros exigidos en composer.lock, y 109 paquetes vendor exactos. **No ejecutar ni instalar Composer**. Si faltan extensiones, `BLOCKED_PHP_EXTENSIONS` con nombres y seguir cierre; no `apt-get` ni cambio de imagen arbitrario. No ejecutar PHP host.
4. Confirmar MariaDB SQL READY real en `127.0.0.1:3306` dentro de este namespace y que DB `jornato_n5_qa` está vacía. Verificar sentinel privado y conexión PDO; luego, y solo luego, migraciones Laravel originales desde PHP contenedor (nunca `migrate:fresh` en base existente). Usar `.env` sintético exclusivo fuera del código WIP y `APP_KEY` de laboratorio, fixture sintética A/B. Registrar filas/tablas del nuevo esquema. No invocar `Artisan` antes de estar demostrados env/DB/code paths.
5. Ejecutar como máximo **8 oráculos E01–E08** ya definidos en kit S1, aprovechando tests existentes; E01 anónimo, E02 A propia, E03 lectura B negada, E04 escritura B negada sin efecto, E05 PAT revocado/vencido, E06 requestId mismo/payload mismo un solo efecto, E07 requestId mismo/payload distinto conflicto, E08 `SERVER_STORED` no implica `RECOGNIZED`. Usar rutas y roles **reales** extraídos de código N4; no abrir B19/B20 ni inventar OD02/03/04. Para E04/E06/E07 verificar estado persistido antes/después. Si falta contrato, `BLOCKED_CONTRACT`, NO PASS ficticio.
6. Si se demuestra fallo de PRODUCTO, reparar causa solamente en **copia N5 privada** con hash PRE/POST y test focal; **NO** fusionar al WIP, subir PR, ni repetir suite global. Director decidirá integración al WIP después de recibir el ZIP y respaldo seguro. Si es fallo de imagen/extensión/DB, bloquear como entorno, no parchear Laravel. Nunca hacer cambios destructivos a un esquema ajeno.
7. Cerrar **exclusivamente** recursos N5 cuya propiedad se haya verificado por labels/IDs. Dejar evidencias y ficheros privados en D:; si la DB de prueba debe conservarse para reproducir, dejar volumen identificado y reportado, sin borrar ni afectar ajenos. Registrar AFTER de contenedores/puertos ajenos y confirmar ausencia de deltas. Si falla limpieza propia, `CLEANUP_PARTIAL` con IDs, no ejecutar prune. No tocar Docker Desktop global.

## 4. Contratos de salida y clasificación (no simular verde)

- `N5_FLUTTER=PASS_CANDIDATE_SCOPED|BLOCKED_PUB_PACKAGES|BLOCKED_SDK|FAIL_PRODUCT|NOT_RUN`. No heredar N3 PASS como si hubiera ejecutado el candidato N5.
- `N5_DOCKER_TOPOLOGY=PASS_PRIVATE_NETNS|BLOCKED_COMPOSE_NETWORK|BLOCKED_IPAM|BLOCKED_DOCKER|BLOCKED_RESOURCE|FAIL_RUNTIME`; adjuntar evidencia de que **no usó redes de otros proyectos**. Que el diseño exista no implica PASS.
- `N5_PHP_RUNTIME=PASS|BLOCKED_PHP_EXTENSIONS|BLOCKED_VENDOR|NOT_RUN`; `N5_DB_MIGRATIONS=PASS_QA_ONLY|BLOCKED|FAIL_PRODUCT|NOT_RUN`.
- `N5_E2E=E01..E08` cada uno con `PASS_E2E_SCOPED|FAIL_PRODUCT|BLOCKED_CONTRACT|BLOCKED_ENV|NOT_RUN` y test/fixture/observación exactos. No agregar casos que no correspondan a ruta existente.
- `N5_WIP_GUARDS=PASS_UNCHANGED|BLOCKED_CONCURRENT|DELTA_UNEXPECTED`; no stage/merge/push. `OFF_DEVICE_BACKUP=NO`, `ANDROID_NATIVE=NOT_RUN`, `SERVER_STAGING=NOT_AUTHORIZED`, `RELEASE=NO_GO` siempre en este bloque.
- No atribuir automáticamente los 158/2450 históricos a una fuente distinta; no repetir suites históricas si no hay delta relevante.

## 5. UNA sola entrega: no archivos dispersos ni otra auditoría

Directorio `OUTPUT_ROOT\delivery`, **exactamente un ZIP final sanitizado**, acompañado fuera del ZIP únicamente por ruta Windows y SHA-256. Contenido máximo útil:

```text
FINAL_REPORT.md
N5_GATE_MATRIX.csv
PUB_CACHE_GAP.csv
FLUTTER_HOST_RESULTS.csv
DOCKER_PRIVATE_NETNS_EVIDENCE.csv
PHP_DB_E2E_RESULTS.csv
WIP_GUARDS.csv
CANDIDATE_DELTA_SUMMARY.csv
BLOCKERS.md                 (si los hay)
MANIFEST_SHA256.csv
```

CRC y SHA+bytes de cada miembro incluidos en manifiesto, comprobados; rutas fuente **relativas y hashes** sí, código real, ZIP de vendor, JSON de package_config, snapshots, SQL dump, tokens, logs crudos, datos personales, env, comandos con secretos y contratos privados **NO**. Mantener logs privados sanitizables en D: si se requieren para revisión local. Un ZIP de bloqueo por causas es mejor que un PASS falso; no crear un nuevo lote para repetir el mismo fallo.

El mensaje final a ChatGPT Director debe contener solo:

```text
TASK=JOR-N5-DOCKER-NONET-PUB-GATES-20261121
RESULT=PASS_SCOPED|PARTIAL_WITH_GAPS|BLOCKED
N5_FLUTTER=...
N5_DOCKER_TOPOLOGY=...
N5_PHP_RUNTIME=...
N5_DB_MIGRATIONS=...
N5_E2E=...
WIP_GUARDS=...
RELEASE=NO_GO
ZIP_PATH=...
ZIP_SHA256=...
NEXT_OWNER=CHATGPT_DIRECTOR
```

**Terminación:** un solo bloque N5, sin otra auditoría y sin promesas de deploy. CHATGPT DIRECTOR revisa el ZIP N5 y decide si necesita permiso de paquetes Pub oficiales, una imagen PHP con extensiones o liberación de recursos de Docker por el dueño. No repetir ninguna campaña aprobada. 