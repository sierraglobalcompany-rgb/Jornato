# CODEX LUNA — JORNATO N5-R1 · MACROBLOQUE ÚNICO CORREGIDO: PUB EXACTO + DOCKER QA PRIVADO SIN IPAM

**EJECUTAR, NO AUDITAR DE NUEVO EL PROMPT.** Director: ChatGPT. Ejecutor único: Codex Luna, Windows. Esta revisión **reemplaza N5 V1 solamente si N5 aún NO se inició**. Si Codex ya ejecuta N5 V1, existe ZIP N5, hay proceso concurrente o estado N5 no determinable, **NO iniciar N5-R1**, no relanzar ni duplicar. Informar `N5_ALREADY_IN_FLIGHT_OR_FINISHED` y devolver el artefacto existente a ChatGPT Director. N4 ya concluyó; esta revisión mantiene el mismo TASK, no crea N6, no retoma N4, no rehace su candidato ni abre un backend alternativo. El borrador POST-N4 sigue archivado. 

```text
TASK=JOR-N5-DOCKER-NONET-PUB-GATES-20261121
PROMPT_REVISION=N5-R1-20261121
PRECEDENCE=ONLY_IF_N5_V1_NOT_STARTED
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

**El mecanismo Docker es una hipótesis técnica respaldada por especificación oficial, NO probado aún en este host.** Incluso si Compose renderiza una plantilla válida, eso NO prueba que arranque sin red/IPAM en Docker Desktop; hay una sola tentativa y salida bloqueada si falla. Referencias: https://docs.docker.com/reference/compose-file/container-spec/ (`none` / `service:{name}`), https://docs.docker.com/engine/network/drivers/none/ (solo loopback), https://docs.docker.com/compose/how-tos/startup-order/ (dependencia entre servicios). Si falla, el bloqueo honesto es correcto. No improvisar otra arquitectura de red.

**No repetir:** reconstrucción de 232 fuentes N4, hash masivo/analizador en WIP, 86 tests N2, 9+4 tests N3 en WIP, 158/2450 backend históricos, 10+10 jueces, C2 Android. No crear nueva app, ORM, servicio PHP host, BD host ni framework/runner alterno. PingPongLaw L1 KISS, L2 antirruido, L3 causa raíz, L4 UX humana, L5 evidencia real, L6 anti-pingpong. Mantener `requestId` y legado `requetId`; `SERVER_STORED != RECOGNIZED`; B19/B20 DENY-ALL y OD02/03/04 sin aprobar. Todo QA con datos sintéticos.

### Prohibiciones duras

- NO descargar herramientas ni paquetes, `docker pull`, `docker build` conectado, `apt-get`, `composer install` desde red, `flutter pub get` online, `dart pub upgrade`, `precache` o alteración de `pubspec.lock`.
- NO usar servicios PHP/DB nativos de Windows. NO reutilizar/inspeccionar credenciales de otros proyectos, redes/volúmenes/contendedores ajenos. NO `docker network create`, `prune` (de ninguna clase), `docker system prune`, `docker network connect`, `docker stop/rm` sobre recursos ajenos, `docker compose down --volumes` para proyectos no identificados, ni cambios globales en Docker Desktop/daemon/IPAM.
- NO usar `network_mode: host`, `network_mode: bridge`, redes Docker predeterminadas/ajenas o publicar puertos en host. **Solamente** namespace privado `none`/`service:db` para QA. No segunda variante si falla.
- NO ejecutar `git add/commit/push/fetch/pull/merge/reset/stash/clean/checkout` ni mutar index, branch o HEAD del WIP. No tocar teléfono, ADB, AVD, firmas ni despliegue. No copiar `.env` real, tokens, bases, llaves ni datos de trabajadores.
- NO crear ZIP de fuentes; toda fuente, diff, fixture privado y logs sensibles quedan en `OUTPUT_ROOT\private` sobre D: y no se envían. Sigue `OFF_DEVICE_BACKUP=NO`.

## 1. Preflight único: seguridad y reuso de N4

1. Confirmar que N4 concluyó, su ZIP es el indicado, y **N5 V1 no ha comenzado**. Revisar el directorio de retorno de N5, entrega/ZIP previa, carpetas de private y procesos del mismo task (sin leer secretos), y solicitar estado del ejecutor si es indeterminado: `N5_ALREADY_IN_FLIGHT_OR_FINISHED`, detener SIN escribir ni probar. No operar dos instancias sobre este proyecto. Si N5 V1 está en curso, recibir y adjudicar SU ZIP; esta revisión N5-R1 no autoriza reinicio.
2. Consultar WIP read-only: `git rev-parse HEAD`, rama, `git status --porcelain=v1 -uall`, `git diff --cached --quiet`, hash de índice y hashes **solo de archivos necesarios**. Registrar estado PRE y comprobar cambios relevantes posteriores a N4. Si el WIP está siendo editado por otro, `BLOCKED_CONCURRENT_WIP` sin tocarlo. El estado N4 de referencia es 235 rutas, 224 untracked, 11 modificadas y 0 staged, no un requisito para forzar `git reset`.
3. Identificar exactamente la carpeta candidata privada N4 (no asumir subcarpetas) desde `N4_REPORT_ROOT`, `FULL_SOURCE_COVERAGE.csv` y el informe. **No editar nunca esa copia N4**: tomar SHA de manifiesto original, reutilizar cobertura 232/232 y preparar una **copia de trabajo aislada N5** de los archivos necesarios para Flutter y Laravel dentro de `OUTPUT_ROOT/private` (sin cachés de trabajo, secretos ni archivos externos). Comprobar hashes al copiar y registrar SHA del candidato original PRE/POST en los archivos usados; no rehacer el proceso HEAD+WIP ni reauditar todas las 232 rutas si no hay delta. Si faltan archivos de fuente esenciales, detener ese carril y describir causa (`BLOCKED_SOURCE_N4`); no copiar archivos directamente desde el WIP sin custodia. `SOURCE_N4_REUSE=PASS_SCOPED|BLOCKED`.
4. Preparar `OUTPUT_ROOT\private` como único laboratorio. Toda ejecución de `pub get`, PHP, Composer (si se necesita solo lectura) y pruebas debe usar **copia N5**; ni el WIP ni el candidato N4 son montajes editables. Comprobar rutas reales dentro de D:, sin symlinks/junction/hardlinks ni enlaces a otros proyectos; salida QA/DB solo en N5 private. Anotar hashes PRE/POST de rutas afectadas y no borrar materiales ajenos. El backup sigue **OFF_DEVICE_BACKUP=NO**.
5. Docker es compartido con otros proyectos Codex. Leer solamente versiones, contenedores, nombres/labels de redes/volúmenes y recursos (sin `inspect` completo ni secretos), y capturar un resumen BEFORE de **IDs/estados/puertos ajenos**. Comprobar capacidad razonable RAM/disco; si no es seguro agregar 2 contenedores, `BLOCKED_DOCKER_RESOURCE`. El hecho de que N4 devolvió IPAM agotado NO autoriza limpieza o ajuste de redes.

## 2. Carril Flutter — investigar la caché real de N3 antes de concluir que faltan paquetes

1. **No escanear todo Windows.** Obtener `pubspec.yaml`, `pubspec.lock` de N4 y su copia N5, cotejar SHA PRE/POST y, si hay evidencias disponibles, los SHA de lock de N2/N3: **no presumir que N2/N3 usaron exactamente el mismo lock o el mismo caché de N4**. Revisar solo: `PUB_CACHE` del proceso, `%LOCALAPPDATA%\Pub\Cache`, variable/cache de los entornos que ejecutaron N2/N3 y **rutas `rootUri` de dependencias en el `.dart_tool/package_config.json` actual del WIP**. El package_config se lee únicamente para descubrir rutas de cache; **NO** copiarlo al candidato tal cual, porque puede apuntar al WIP. No buscar en unidades ajenas ni usar caches de otros proyectos sin verificar versión+integridad y ausencia de mutación.
2. Generar en `private` `PUB_CACHE_GAP.csv` (package, version, lock_sha256_si_existe, cache_root_redacted, dir_present, hosted_hash_metadata, origin, decision) para los **79 hosted** N4 y 22 gaps. **Distinguir `PACKAGE_DIR_PRESENT` de `HASH_VERIFIED`**: una carpeta, un sello o la referencia `rootUri` NO verifican el contenido. Cuando el lock lleva hash SHA-256, exigir comparación mediante mecanismo estándar de Pub y `--enforce-lockfile`; si no hay forma de acreditar integridad, `BLOCKED_PUB_INTEGRITY` sin PASS. No registrar paths absolutos personales ni datos de otros proyectos en ZIP.
3. Preferir **un único cache root auténtico** y accesible de N2/N3 si corresponde exactamente a N4 lock; establecer `PUB_CACHE` solo para el proceso N5. Combinar carpetas de caches es último recurso: copiar solamente los paquetes faltantes a cache N5 privado **incluidos sus metadatos validados**, sin symlinks, sin modificar origen, sin inventar archivo hash/sello y sin afirmar integridad por copia; **dejar que Pub haga la validación definitiva**. Si no puede conservarse provenance/hash, `BLOCKED_PUB_INTEGRITY`. No copiar `package_config.json` del WIP ni editar dependencias.
4. **Antes de invocar cualquier CLI Flutter**, revalidar artefactos/stamps locales de SDK 3.47.8 porque `--no-pub` no garantiza bloquear `cache.updateAll`. Si falta un artefacto, `BLOCKED_FLUTTER_ARTIFACTS` sin iniciar Flutter/descargas. Aislar `PUB_CACHE`, salida/build y desactivar analítica por variables locales del proceso; no cambiar PATH ni configuración global. Comprobar exit codes y que ninguna herramienta intente consultar red.
5. **Gate fuerte:** comprobar flags en ayuda local, sin bajar artefactos. Con Flutter 3.47.8/Dart 3.13.7 exigir `--offline --enforce-lockfile`; si la CLI disponible no los admite, `BLOCKED_PUB_FLAGS` sin fallback permisivo. Ejecutar **una sola vez en la copia N5**, con `PUB_CACHE` de proceso, sin red, `flutter pub get --offline --enforce-lockfile`; verificar SHA de `pubspec.lock` PRE/POST **idéntico**, resolución de cada paquete en `package_config.json` nuevo dentro de N5 y que ninguno resuelva rutas del WIP u otro proyecto. Si Pub informa hash distinto, faltante o resolución divergente, bloquear sin tocar original. Registrar stdout/stderr sanitizados; cero downloads/requests.
6. Si la resolución es PASS: ejecutar en candidato (NO WIP) `flutter analyze --no-pub` solo sobre archivos relevantes y **una vez** `flutter test --no-pub test/kiosk_screen_actions_test.dart`. Test widget vecino **solo si hubo cambio de propietario relevante**, no por rutina. El objetivo es demostrar que el candidato completo se puede ejecutar con dependencias resueltas, no certificar Android. Hash de código PRE/POST igual o delta justificado; no construir APK ni generar artefactos Android.
7. Si los 22 faltantes son reales, `BLOCKED_PUB_PACKAGES` con lista exacta package+version+hash faltante (sin fuentes) y ruta futura **condicionada a autorización para recuperar paquetes oficiales con lock fijo**. No descargar ni usar versiones viejas para obtener PASS. **Continuar Docker igualmente.**

## 3. Carril Docker — una sola topología sin puente IPAM y sin host networking

### 3.1 Requisitos antes de crear ningún contenedor

1. Confirmar versiones reales Docker/Compose y daemon accesible y **las imágenes exactas** ya locales de PHP compatible con ^8.3 y MariaDB 11.8.9; verificar plataforma Linux y que los IDs/digests se reconozcan como imágenes locales previamente disponibles, sin pull. **`php:8.3-cli` oficial no garantiza `pdo_mysql`, `mbstring` u otras extensiones Laravel**: si faltan después del arranque, `BLOCKED_PHP_EXTENSIONS` sin improvisar otra imagen o instalar paquetes. No usar `latest`, `pull`, `build`, Dockerfiles ajenos ni registros privados. Verificar etiquetas de proyecto Compose exclusivas y un solo identificador nuevo `jornato-n5-qa-<sufijo_corto>` distinto de todos los proyectos vigentes. Un máximo de **dos contenedores N5** bajo ese nombre.
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
      # LIVENESS exclusivamente; no acredita autenticación ni que el schema QA exista.
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

**Ajustes obligatorios:** usar sufijo/nombre Compose único por proyecto; la ruta bind N5 apunta **EXCLUSIVAMENTE a la copia privada N5** (nunca al árbol WIP ni candidato N4), incluye código `server/` y `server/vendor` ya cotejado contra composer.lock. El volumen `n5_data` lo crea **solo** este Compose. La DB no publica puerto, escucha loopback interno, PHP comparte exclusivamente ese namespace con `service:db`, conecta por `127.0.0.1`. No existe top-level `networks`, ni `ports`, ni `network_mode: host` o `bridge`, ni redes `external` y no se asocia ningún servicio a red externa. No agregar servicios extra. La lectura de env/Compose puede revelar secretos; guardar archivos env exclusivamente en private, no imprimir `docker compose config` entero en salida. Registrar solamente campos permitidos.

4. Resolver variables con archivo env privado usando `docker compose --project-name <jornato-n5-qa-sufijo> --env-file <ruta_privada> -f <ruta_compose> config --format json` **guardando el JSON exclusivamente en private** y mostrando externamente SOLO campos estructurales no sensibles. En PowerShell redirigir stdout/stderr a archivos privados y revisar sanitizado antes de informe; **no imprimir env ni JSON**, ni copiar credenciales a shell history. Evitar heredar `.env` del WIP por directorio de trabajo/proyecto Compose. No adjuntar el JSON al ZIP. Verificar programáticamente que `services.db.network_mode == 'none'`, `services.php.network_mode == 'service:db'`, ningún servicio tenga `networks`, `ports`, `network_mode: host`, volúmenes external o bind fuera de N5 private. Si Compose muestra una red `default` **que deba aprovisionar para un servicio**, `BLOCKED_COMPOSE_NETWORK`, sin `up`. Si el config renderiza puertos o monta WIP/otro proyecto, STOP. Restringir CPU/memoria a límites razonables según el host, sin competir con otros procesos.

### 3.2 Una ejecución productiva, sin nuevas redes

1. Ya con preflight PASS, ejecutar **una sola vez** `docker compose --project-name <jornato-n5-qa-sufijo> --env-file <ruta_privada> -f <ruta_compose> up -d --pull never --no-build` sin imprimir variables sensibles; **no asumir que la validación de Compose impide crear la red default**: comparar inventario de redes ANTES y DESPUÉS, incluida cualquier red huérfana N5; si el comando intenta crear bridge o falla IPAM, detener ahí, sin segundo `up` ni limpieza ajena; clasificar el bloqueo como `BLOCKED_DOCKER_IPAM` si corresponde. No cambiar a `host`, `bridge`, red por defecto, `container:` de otro proyecto, subred manual, prune, ni segundo Compose alterno.
2. Si los contenedores arrancan, comprobar **identidad real con inspect filtrado y sanitizado**, labels Compose exclusivos, IDs de DB/PHP, no redes creadas, ningún puerto publicado y aislamiento del namespace; no ejecutar PHP todavía. Si algún contenedor/red ajenos cambió entre BEFORE/AFTER, `BLOCKED_CROSS_PROJECT_DELTA` y STOP. Verificar explícitamente DB modo `none`, PHP unido **solo** al contenedor DB del proyecto N5, volumen QA propio, puertos vacíos y ausencia de redes IP. Ante inconsistencia, STOP sin pruebas; registrar solo IDs, labels y estados, nunca env ni inspect completo.
3. Verificar desde PHP contenedor PHP/extensiones obligatorias PHP ^8.3; PDO/MySQL, mbstring/dom/xml/otros exigidos en composer.lock, y 109 paquetes vendor exactos. **No ejecutar ni instalar Composer**. Si faltan extensiones, `BLOCKED_PHP_EXTENSIONS` con nombres y seguir cierre; no `apt-get` ni cambio de imagen arbitrario. No ejecutar PHP host.
4. **No confiar en `mariadb-admin ping` como prueba de autenticación.** Confirmar SQL READY real desde PHP con PDO/MySQL usando usuario `jornato_n5_qa`, contraseña sintética privada y `127.0.0.1:3306`; ejecutar `SELECT DATABASE(), CURRENT_USER(), @@hostname` sanitizado, verificar que la base es la nueva QA y tiene cero tablas de aplicación **antes** de migraciones (tener en cuenta tablas de sistema fuera de schema QA). Si no se acredita auth, schema/volumen N5 e identidad, `BLOCKED_DB_IDENTITY` y STOP. Verificar sentinel privado y conexión PDO; luego, y solo luego, migraciones Laravel originales desde PHP contenedor (nunca `migrate:fresh` en base existente). Usar `.env` sintético exclusivo fuera del código WIP y `APP_KEY` de laboratorio, fixture sintética A/B. Registrar filas/tablas del nuevo esquema. No invocar `Artisan` antes de estar demostrados env/DB/code paths.
5. Ejecutar como máximo **8 oráculos E01–E08** ya definidos en kit S1, **únicamente con rutas reales del Laravel de N4** y usando el HTTP Kernel/test client **dentro del contenedor PHP** (sin abrir puertos en host ni emular respuestas). Probar salida HTTP y persistencia real MariaDB, no solo mocks; aprovechar tests existentes. E01 anónimo, E02 A propia, E03 lectura B negada, E04 escritura B negada sin efecto, E05 PAT revocado/vencido, E06 requestId mismo/payload mismo un solo efecto, E07 requestId mismo/payload distinto conflicto, E08 `SERVER_STORED` no implica `RECOGNIZED`. Usar rutas y roles **reales** extraídos de código N4; no abrir B19/B20 ni inventar OD02/03/04. Para E04/E06/E07 verificar estado persistido antes/después. Si falta contrato, `BLOCKED_CONTRACT`, NO PASS ficticio.
6. Si se demuestra fallo de PRODUCTO, reparar causa solamente en **copia N5 privada** con hash PRE/POST y test focal **una vez tras delta**; no repetir suites históricas ni crear segundo runner; **NO** fusionar al WIP ni subir PR. Director decidirá integración al WIP después de recibir el ZIP y respaldo seguro. Si es fallo de imagen/extensión/DB, bloquear como entorno, no parchear Laravel. Nunca hacer cambios destructivos a un esquema ajeno.
7. Cerrar **exclusivamente** recursos N5 cuya propiedad se haya verificado por labels/IDs. Dejar evidencias y ficheros privados en D:; si la DB de prueba debe conservarse para reproducir, dejar volumen identificado y reportado, sin borrar ni afectar ajenos. Registrar AFTER de contenedores/puertos ajenos y confirmar ausencia de deltas. Si falla limpieza propia, `CLEANUP_PARTIAL` con IDs, no ejecutar prune. No tocar Docker Desktop global.

## 4. Contratos de salida y clasificación (no simular verde)

- `N5_FLUTTER=PASS_CANDIDATE_SCOPED|BLOCKED_PUB_PACKAGES|BLOCKED_PUB_INTEGRITY|BLOCKED_PUB_FLAGS|BLOCKED_FLUTTER_ARTIFACTS|BLOCKED_SDK|FAIL_PRODUCT|NOT_RUN`. No heredar N3 PASS como si hubiera ejecutado el candidato N5.
- `N5_DOCKER_TOPOLOGY=PASS_PRIVATE_NETNS|BLOCKED_COMPOSE_NETWORK|BLOCKED_IPAM|BLOCKED_DOCKER|BLOCKED_RESOURCE|BLOCKED_CROSS_PROJECT_DELTA|FAIL_RUNTIME`; adjuntar evidencia de que **no usó redes de otros proyectos**. Que el diseño exista no implica PASS.
- `N5_PHP_RUNTIME=PASS|BLOCKED_PHP_EXTENSIONS|BLOCKED_VENDOR|NOT_RUN`; `N5_DB_MIGRATIONS=PASS_QA_ONLY|BLOCKED_DB_IDENTITY|BLOCKED|FAIL_PRODUCT|NOT_RUN`. El `healthcheck` por sí solo nunca produce PASS de DB.
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

**Terminación:** un solo bloque N5-R1, mismo TASK, sin otra auditoría y sin promesas de deploy. **Si N5 V1 ya se inició, N5-R1 NO se ejecuta**: Director adjudica el ZIP de V1 y sólo entonces decide siguientes acciones. CHATGPT DIRECTOR revisa el ZIP N5 y decide si necesita permiso de paquetes Pub oficiales, una imagen PHP con extensiones o liberación de recursos de Docker por el dueño. No repetir ninguna campaña aprobada. 
