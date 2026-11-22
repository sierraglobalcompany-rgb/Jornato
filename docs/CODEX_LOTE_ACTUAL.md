# CODEX LUNA — JORNATO N6: DESBLOQUEO CAUSAL DEL RUNTIME PHP Y QA REAL DEL SERVIDOR

**ORDEN ÚNICA PRODUCTIVA. EJECUTAR SOLO SI N6 NO ESTÁ EN CURSO NI TIENE ZIP POSTERIOR.** Director: ChatGPT. Ejecutor: Codex Luna (Windows). Fecha: 21-nov-2026, Colombia. N5 se cerró `PARTIAL_WITH_GAPS` y **NO debe reejecutarse**. Este es un bloque NUEVO, no un segundo N5 ni una auditoría general. Mantener KISS/PingPongLaw L1–L6 (simplicidad, no repetir, causa raíz, UX real, evidencia independiente, evitar pingpong).

```text
TASK=JOR-N6-PHP-RUNTIME-CAUSE-ISOLATED-QA-20261121
PROMPT_REVISION=N6-R1-20261121
WIP_ROOT=D:\codex\Jornato
N4_ROOT=D:\codex\_REPORTES\Jornato\JOR-N4-FULL-SOURCE-AND-SERVER-QA-20261121
N5_ROOT=D:\codex\_REPORTES\Jornato\JOR-N5-DOCKER-NONET-PUB-GATES-20261121
OUTPUT_ROOT=D:\codex\_REPORTES\Jornato\JOR-N6-PHP-RUNTIME-CAUSE-ISOLATED-QA-20261121
N5_ZIP_SHA256=162118EFD4260B97A425E969CB90C06C54A4CAA0003FEC82F2C68A2BD53E84CC
N5_FLUTTER=PASS_CANDIDATE_SCOPED
N5_DOCKER_PRIVATE_NETNS=PASS_STRUCTURE_AND_ISOLATION;PHP=FAIL_RUNTIME_EXEC_FORMAT
N5_DB_LIVENESS=HEALTHY_BUT_SQL_IDENTITY_NOT_VERIFIED
N5_E2E=0_EXECUTED_8_BLOCKED_ENV
N5_WIP_HEAD=faf5fe283191f8b5a2724b397009512a2caec1b6
N5_WIP_INDEX=25CC609803D7E68D5F3ECF428198B2432CF1EA37030546735DD3F03299D905E1
N5_WIP_STATUS=235;MODIFIED=11;UNTRACKED=224;STAGED=0
SERVER_STAGING=NOT_AUTHORIZED
RELEASE=NO_GO
NEXT_OWNER=CHATGPT_DIRECTOR
```

## 0. Qué está demostrado y qué NO debe repetirse

**FIRME N5:** ZIP N5 24.069 bytes, 10 miembros CRC correctos, 9/9 hashes+bytes+CRC del manifiesto válidos, informe `RESULT=PARTIAL_WITH_GAPS`. Candidato privado de 232 archivos y servidor de 150 archivos reportados con hashes; PHP Laravel 13.40.0 / PHP ^8.3 / Sanctum 4.3.3 / PHPUnit 12.5.43, 11 migraciones, 34 declaraciones API y 109 paquetes vendor/lock reportados. Flutter en la copia N5: `pub get --offline --enforce-lockfile` PASS con 79/79 metadatos, lock idéntico, analyze PASS y `KioskScreen` 9/9 PASS. **No volver a buscar los 22 paquetes, resolver Pub ni ejecutar Flutter salvo delta de código que invalide un test concreto.** N2 host 86 PASS y N3 host 9+4 PASS conservan alcance histórico. N4 paridad documentada: no repetir 232 hashes globales.

**FIRME DOCKER:** N5 creó DOS contenedores privados (`db network_mode:none`, `php network_mode:service:db`), 0 redes nuevas, 0 puertos publicados, 1 volumen etiquetado; Compose `up` exit 0. MariaDB se declaró healthy por ping no autenticado; PHP salió 255 **antes de ejecutar PHP**: `exec /usr/bin/sh: exec format error`. No hubo PDO, PHP, Artisan, SQL, migraciones, E01–E08. Los IDs parciales N5 reportados son PHP `68a27835c845`, DB `387467db1762`; proyecto `jornato-n5-qa-211121`; volumen `jornato-n5-qa-211121_n5_data`. **Son pistas, NO autorización basada en IDs reutilizables**: verificar etiquetas, proyecto, volumen y estado actuales sin mutarlos. Ambos contenedores reportados detenidos y volumen preservado. No se demostró causa raíz del `exec format error`: podría ser imagen/plataforma/binario/entrypoint. No adjudicar PHP/Laravel como defectuoso sin prueba.

**REGLA TRANSVERSAL DEL DUEÑO:** Windows comparte Docker entre varios Codex y proyectos. **TODO PHP/Artisan/PHPUnit/Composer y SQL deben correr solo en Docker exclusivo de Jornato.** Prohibido PHP/MariaDB host Windows; prohibido tocar contenedores/redes/volúmenes/puertos/credenciales de otros proyectos. No crear red bridge ni alterar IPAM, daemon, firewall, DNS, Docker Desktop, servicios host. No `prune`, `down -v` ajeno, host networking, redes externas ni puertos publicados. Sin red de salida/descargas, `docker pull`, `docker build`, apt, Composer install/update, Pub update. N6 nunca despliega ni toca Android/ADB/AVD.

**SEGURIDAD GIT:** WIP solo lectura, sin `git add/commit/merge/push/fetch/pull/reset/clean/stash/checkout`, ni GitHub código público. ZIP fuente/diffs/caches/DB/secretos nunca se entrega. `OFF_DEVICE_BACKUP=NO` (las copias en D: no equivalen a copia externa); no copiar datos laborales reales. Contratos: `requestId` y legado `requetId`, `SERVER_STORED != RECOGNIZED`, B19/B20 deny-all, OD02/OD03/OD04 no aprobados.

## 1. Preflight de una sola ejecución (sin mutaciones innecesarias)

1. **Prevenir duplicados.** Confirmar que N5 finalizó, validar ZIP N5 contra SHA indicado y localizar su `FINAL_REPORT.md` en la carpeta N5. Si hay ZIP N6, resultados N6 posteriores o agente sobre mismo WIP, `SUPERSEDED_OR_CONCURRENT` y STOP sin editar. No reabrir los lotes antiguos. Una sola carpeta de salida N6, separada del WIP; directorio `private` excluido de ZIP.
2. Verificar solo `git rev-parse HEAD`, rama, staged/index SHA y `git status --porcelain -uall` WIP; reportar deltas reales, **no forzar** conteo pasado si cambia legítimamente. Si otro agente escribe WIP, `BLOCKED_CONCURRENT_WIP`. No rehash de las 232 fuentes por rutina; contrastar SHA de `server/composer.lock`, `server/composer.json`, rutas y migraciones **solo antes de usarlos** contra el candidato N5 documentado.
3. Reutilizar **candidato privado N5 por lectura**, con `server/vendor` previamente cotejado (8.963 archivos/109 pares, según N5). Generar una copia privada N6 de los archivos usados por Laravel sin symlinks, `.git`, credenciales, `.env` real ni datos; comprobar paridad de esos archivos solamente. No modificar candidato N5 ni WIP. No extraer fuentes al ZIP público. Antes de montar, verificar la ruta real dentro de `OUTPUT_ROOT\private` y que no apunta a otro proyecto. No crear nuevo backend.
4. Docker PRE: capturar listado **filtrado** de IDs/estados/puertos de contenedores ajenos, conteos de redes/volúmenes, proyecto/labels del N5 detenido y free RAM/disco estimados. No imprimir `docker inspect` completo (puede contener secretos) ni env. Si recursos de otros proyectos están cambiando concurrentemente, distinguir cambios externos de cambios propios; no intentar corregirlos. Nunca borrar N5 volumen para ganar espacio. Confirmar que no hay un N6 activo.
5. Leer **sin arrancar contenedores**: `docker version`/`docker info` campos OS y arquitectura del daemon, `docker image inspect` (solo `Id`, `Os`, `Architecture`, `Variant`, `Config.Entrypoint`/`Cmd`, nombre/tag/digest) del PHP que falló, `docker container inspect` filtrado de configuración real del PHP N5 (image ID, entrypoint, command, mounts, network mode, exit code, labels) y de DB N5. Comparar plataforma real de engine vs imagen: no concluir «amd64 compatible» sin contraste. No consultar registry remoto. Si hay plataforma incompatible, **descartar esa imagen** sin nuevo contenedor y clasificar `BLOCKED_PHP_PLATFORM` salvo que exista una alternativa YA CACHEADA que coincida.

## 2. Diagnóstico focal del runtime PHP (antes de iniciar DB)

1. Inventariar **solo imágenes PHP locales candidatas** con etiqueta/ID y plataforma apropiada, sin barrer archivos de otros proyectos. Elegir UNA imagen antes de ejecutar: preferir una ya disponible para Laravel con PHP >=8.3 y extensiones exigidas, priorizando una distinta de la imagen N5 que produjo `exec format error` si existe alternativa válida. Si solo existe la imagen fallida, se permite **un diagnóstico focal** sobre ella. **No descargar, reconstruir ni importar imagen**, ni mutar imágenes usadas por otros. No usar una versión PHP inferior para «hacer verde».
2. Ejecutar **como máximo un probe de shell por imagen seleccionada** en un contenedor efímero propio: `docker run --rm --pull never --network none` con límite razonable de CPU/memoria/PIDs, sin mounts de proyecto, sin puertos, con entrada explícita `/bin/sh -c 'printf N6_SHELL_OK'`; registrar exit, stdout sanitizado y `docker inspect` de la imagen antes de probar. Si vuelve `exec format error`, como máximo **un probe diferenciador** de binario PHP directo (`--entrypoint php` y `-v`) sobre esa MISMA imagen para separar error de shell frente a fallo de ejecución general; **no insistir con otro `up`** ni cambiar redes. Si la imagen tiene arquitectura equivocada, detener antes del probe. Si el shell falla aunque PHP directo funcione: `BLOCKED_PHP_SHELL_IMAGE`; **no parchear saltándose un shell roto para intentar arrancar Laravel**. Si falla PHP directo: `BLOCKED_PHP_IMAGE_EXEC`. Si el error es de permisos/runtime Docker no demostrado, `BLOCKED_DOCKER_RUNTIME`. No atribuirlo a app.
3. Si el shell pasa: **un probe de PHP y extensiones con esa misma imagen** en entorno `--network none`, sin PHP host Windows; imprimir solo `PHP_VERSION`, módulos disponibles/ausentes relevantes para el proyecto (incluidos `pdo_mysql`, `mbstring`, `dom`, `xml`, `openssl`, `tokenizer`, `fileinfo` y los exigidos realmente por composer.lock). No instalar extensiones ni ajustar `composer.lock`. Si faltan, clasificar `BLOCKED_PHP_EXTENSIONS` con la lista exacta y NO arrancar DB. Si vendor real no coincide con lock, `BLOCKED_VENDOR` sin Composer install. Si hay incompatibilidad de runtime, reportar la causa concreta sin nuevos intentos de red/imagen.
4. **Puerta de arranque:** solamente si engine/plataforma/shell/PHP/extensiones/vendor son PASS y hay capacidad; entonces preparar UNA configuración Compose N6 en carpeta privada basada en la topología **que ya pasó aislamiento N5**, sin red, sin puerto y sin host networking. Si falla cualquier prueba, **terminar el carril servidor con informe útil** y no tocar MariaDB.

## 3. Un solo ensayo completo del Laravel real (solo si la puerta PHP pasó)

1. Nuevo `docker compose --project-name jornato-n6-qa-<sufijo>` **exclusivo N6**, dos servicios (`db`, `php`); DB `network_mode: none`; PHP `network_mode: service:db`; no bloques `networks`, `ports`, `external`, hostname de otros contenedores ni volúmenes de otros proyectos. PHP/DB vía `127.0.0.1` interno, **nunca** `0.0.0.0` host. Reusar idea de Compose N5, no su fallo de shell. Crear **volumen N6 NUEVO** con label Compose y fixtures sintéticos, sin conectarlo al volumen N5 ni a DB externa. Bind exclusivamente copia N6 privada, sin `.env` real. No nuevas arquitecturas ni Dockerfile.
2. Crear secretos sintéticos QA únicos en archivo env privado fuera de WIP; nunca imprimir, registrar o adjuntar env ni JSON completo de `docker compose config`. Renderizar/validar solo campos estructurales y ownership de rutas/recursos, comprobar recursos externos BEFORE y publicar **solo métricas sanitizadas**. PHP `APP_ENV=testing`, `APP_DEBUG=false`, `APP_KEY` sintética de laboratorio, DB nuevo nombre específico N6, `DB_HOST=127.0.0.1`. No apuntar a prod ni a terceros. Comprobar que el container entrypoint elegido usa shell y binarios **ya validados** en probe.
3. **Un** `docker compose up -d --pull never --no-build` únicamente tras preflight PASS. Controlar 0 nuevas redes, 0 puertos publicados, 2 contenedores y un volumen **propios**, etiquetas/IDs y red PHP `container:<DB_ID_N6>`; asegurar inventario externo inalterado. Si IPAM aparece otra vez, `BLOCKED_IPAM` STOP; sin variantes, prune ni Docker global. Si DB healthy por ping, marcar solo **LIVENESS**, nunca `SQL_AUTH_PASS`.
4. **Antes de Artisan:** desde el PHP **del Compose N6**, usar PDO/MySQL contra `127.0.0.1:3306` con usuario/clave sintéticos, registrar únicamente evidencia sanitizada de `DATABASE()`, `CURRENT_USER()`, @@hostname y conteo de tablas **del schema QA N6**; verificar volumen N6/labels y cero tablas de aplicación antes de migración. Si no hay auth o schema propios, `BLOCKED_DB_IDENTITY`, ninguna migración. No consultar información de otro schema. Si necesita conexión de sistema, solo sobre esta base QA y como mínimo privilegio.
5. Ejecutar migraciones Laravel ya existentes en PHP contenedor N6, **nunca `migrate:fresh`**; registrar tablas/índices/errores focales, no SQL dumps. Si aparece causa de producto, reparar **solo** copia N6 con hash PRE/POST y una prueba causal, no tocar WIP ni backend alternativo. Si aparece causa ambiental, detener ese subgate con `BLOCKED_ENV` sin parches.
6. En el MISMO laboratorio aislado ejecutar **solo E01–E08 previamente definidos** si existen rutas/fixtures reales y contrato autorizado: E01 anónimo bloqueado, E02 tenant A→A permitido, E03 A→B lectura bloqueada, E04 A→B escritura bloqueada con DB inmutable, E05 token revocado, E06 requestId+payload duplicado efecto único, E07 requestId con distinto payload conflicto seguro, E08 `SERVER_STORED` ≠ `RECOGNIZED`. Comprobar estado DB antes/después de E04/E06/E07, kernel HTTP/DB real, no mocks ficticios. OD02/OD03/OD04 pendientes → `BLOCKED_CONTRACT`, sin inventar rutas ni abrir B19/B20. Sin prueba de identidad/alcance, no declarar PASS. No suite backend global 158/2450 nuevamente.
7. Final: detener/limpiar únicamente **contenedores N6 propiedad comprobada**; conservar volumen N6 si hace falta reproducir, reportar nombre/ID y estado y política de custodia. **No** borrar ni iniciar N5/otros; no ejecutar prune. Verificar inventario externo AFTER con mismos IDs/estados/puertos cuando no haya actividad ajena concurrente. Si cambio externo no atribuible, reportar `EXTERNAL_CONCURRENCY_UNDETERMINED`, no adjudicar culpabilidad.

## 4. Salida única y criterios de decisión — no crear otra campaña de auditoría

Producir **exactamente UN ZIP sanitizado** bajo `OUTPUT_ROOT\delivery`, comprobado SHA256, CRC y manifiesto hash+bytes+CRC, sin fuentes, `.env`, tokens, dumps, scripts con secretos, repos/copias privadas ni logs crudos. **Todos** los insumos probatorios privados permanecen en D:, no equivalen a backup off-device. Archivos mínimos en ZIP:

```text
FINAL_REPORT.md
PHP_IMAGE_ROOT_CAUSE.md                 # evidencia y límite de hipótesis, NO adjudicación inventada
DOCKER_IMAGE_RUNTIME_MATRIX.csv          # imagen/plataforma/shell/PHP/extensiones, una sola causa
QA_ISOLATION_EVIDENCE.csv                # owned/external, BEFORE/AFTER, cero red/puertos
SERVER_DB_MIGRATIONS.csv                 # auth real, esquema nuevo, migraciones, bloqueo
SERVER_E2E_E01_E08.csv                   # 8 IDs, veredictos PASS/FAIL/BLOCKED
WIP_GUARDS.csv                          # HEAD/index/status PRE/POST
N6_GATE_MATRIX.csv
MANIFEST_SHA256.csv
```

**Resultados admitidos y semántica:**
- `N6_PHP_IMAGE=PASS|BLOCKED_PHP_PLATFORM|BLOCKED_PHP_SHELL_IMAGE|BLOCKED_PHP_IMAGE_EXEC|BLOCKED_DOCKER_RUNTIME|BLOCKED_NO_COMPATIBLE_CACHED_IMAGE|BLOCKED_PHP_EXTENSIONS|BLOCKED_VENDOR|NOT_RUN`.
- `N6_DOCKER_ISOLATION=PASS_SCOPED|BLOCKED|NOT_RUN`, nunca heredar un PASS SQL de `healthy` MariaDB N5.
- `N6_DB=PASS_QA_MIGRATIONS|BLOCKED_DB_IDENTITY|BLOCKED_ENV|FAIL_PRODUCT|NOT_RUN`.
- `N6_E2E=0..8 PASS`, cada ID con evidencia kernel HTTP y DB o motivo explícito BLOCKED. `WIP_GUARDS=PASS_UNCHANGED|DELTA_UNEXPECTED|CONCURRENT`.
- `N5_FLUTTER=PASS_CANDIDATE_SCOPED_REUSED` (NO reejecutar), `ANDROID_NATIVE=NOT_RUN`, `OFF_DEVICE_BACKUP=NO`, `SERVER_STAGING=NOT_AUTHORIZED`, `H9_GLOBAL=NO_GO`, `B22=NOT_AUTHORIZED`, `RELEASE=NO_GO`.

**Regla anti-pingpong:** si el PHP local no cumple, no hacer un quinto paquete documental ni reintentar el mismo arranque en variante. Entregar SHA/versión/plataforma/extensiones faltantes y permiso técnico mínimo que desbloquearía la siguiente etapa. Si el PHP funciona, avanzar en **el mismo N6** hasta migraciones/E2E; no detenerlo para pedir otra auditoría. El resultado puede ser `PARTIAL_WITH_GAPS`, pero debe estar causalmente acotado.

Mensaje final a Director, exactamente:

```text
TASK=JOR-N6-PHP-RUNTIME-CAUSE-ISOLATED-QA-20261121
RESULT=PASS_SCOPED|PARTIAL_WITH_GAPS|BLOCKED
N6_PHP_IMAGE=...
N6_DOCKER_ISOLATION=...
N6_DB=...
N6_E2E=.../8
N5_FLUTTER=PASS_CANDIDATE_SCOPED_REUSED
WIP_GUARDS=...
RELEASE=NO_GO
ZIP_PATH=D:\codex\_REPORTES\Jornato\JOR-N6-PHP-RUNTIME-CAUSE-ISOLATED-QA-20261121\delivery\JOR-N6-PHP-RUNTIME-CAUSE-ISOLATED-QA-20261121-UNICO.zip
ZIP_SHA256=...
NEXT_OWNER=CHATGPT_DIRECTOR
```

**Fuentes oficiales:** Docker image inspect https://docs.docker.com/reference/cli/docker/image/inspect/ ; Compose network_mode https://docs.docker.com/reference/compose-file/container-spec/ ; separación Compose https://docs.docker.com/compose/how-tos/networking/. Referencias informativas, **no** evidencia de runtime Jornato. **NEXT=CODEX_LUNA_N6; AFTER_ZIP=CHATGPT_DIRECTOR.**
