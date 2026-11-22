# CODEX LUNA — JORNATO N6-R2 · MACROBLOQUE PRODUCTIVO ÚNICO: PHP EXEC FORMAT → QA LARAVEL AISLADA

> **INSTRUCCIÓN PARA CODEX LUNA. EJECUTA; NO REAUDITES ESTE PROMPT.** ChatGPT Director decidió todo el alcance. **R2 sustituye N6-R1 SOLO SI N6-R1 AÚN NO COMENZÓ.** Si N6-R1 ya inició, hay ZIP N6, archivos de una campaña N6 existente, bloqueo de proceso concurrente o el estado es indeterminado: **NO ejecutar R2, NO reiniciar N6, NO crear N7**, devolver `SUPERSEDED_OR_N6_IN_FLIGHT` y la ubicación/estado de la entrega existente a ChatGPT Director. **Mismo TASK de N6 original.** No constituye una segunda campaña sobre el mismo problema.

```text
TASK=JOR-N6-PHP-RUNTIME-CAUSE-ISOLATED-QA-20261121
PROMPT_REVISION=N6-R2-20261121
PRECEDENCE=ONLY_IF_N6_R1_NOT_STARTED
WIP_ROOT=D:\codex\Jornato
N4_ROOT=D:\codex\_REPORTES\Jornato\JOR-N4-FULL-SOURCE-AND-SERVER-QA-20261121
N5_ROOT=D:\codex\_REPORTES\Jornato\JOR-N5-DOCKER-NONET-PUB-GATES-20261121
OUTPUT_ROOT=D:\codex\_REPORTES\Jornato\JOR-N6-PHP-RUNTIME-CAUSE-ISOLATED-QA-20261121
N5_ZIP_SHA256=162118EFD4260B97A425E969CB90C06C54A4CAA0003FEC82F2C68A2BD53E84CC
N5_FLUTTER=PASS_CANDIDATE_SCOPED_ALREADY_DONE
N5_DOCKER=2_PRIVATE_CONTAINERS;NO_NEW_NETWORK;NO_PUBLISHED_PORT;1_PRIVATE_VOLUME
N5_PHP=EXIT_255_EXEC_/USR/BIN/SH_EXEC_FORMAT_ERROR
N5_SQL_AUTH=NOT_RUN;N5_E2E=0_EXECUTED_8_BLOCKED_ENV
N5_WIP_BRANCH=codex/jor-b08-h4-domain-20261025
N5_WIP_HEAD=faf5fe283191f8b5a2724b397009512a2caec1b6
N5_WIP_INDEX_SHA256=25CC609803D7E68D5F3ECF428198B2432CF1EA37030546735DD3F03299D905E1
N5_WIP_STATUS=235;MODIFIED=11;UNTRACKED=224;STAGED=0
OFF_DEVICE_BACKUP=NO
RELEASE=NO_GO
NEXT_OWNER=CHATGPT_DIRECTOR
```

## 0 — Mandato decidido y leyes de ejecución

**Meta productiva única:** demostrar la causa **observable** del error de ejecución PHP en imagen Docker sin red ni DB, usando al máximo **dos imágenes locales** y pocas sondas diferenciadoras; si y solo si PHP/extensiones/vendor realmente ejecutan, pasar EN ESTE MISMO BLOQUE a un laboratorio PHP+MariaDB nuevo, aislado y a los ocho oráculos E01–E08 con Laravel real. **N6 es diagnóstico+QA causal, NO nueva arquitectura.**

**Evidencia previa cerrada — NO repetir:** ZIP N5 de 24.069 bytes, 10 miembros CRC PASS, 9/9 manifiesto válido (verificado por Director). En candidato privado N5: `flutter pub get --offline --enforce-lockfile`, Flutter analyze y **9/9 test `KioskScreen` PASS**; cache 79/79 consistente, lock sin cambios. Candidato app+server de N4/N5: 232 fuentes con paridad reportada, 150 `server/`, vendor 8.963 archivos y 109 versiones reportadas consistentes con composer.lock. Docker N5 creó **2 contenedores** con modos `db:none` y `php:service:db`, **0 redes nuevas, 0 puertos publicados** y volumen privado; `php` terminó `exec /usr/bin/sh: exec format error` antes de ejecutar runtime, DB solo liveness healthy, cero SQL autenticado, migraciones y E01–E08. WIP Windows inmutable según Codex; no backup externo. **El diagnóstico N6 debe buscar causa con evidencia real, no dar por demostrada arquitectura incorrecta o imagen corrupta.**

**PingPongLaw L1–L6:** L1 KISS/Ponytail, L2 cero revisiones/suites repetidas, L3 corregir causa raíz en propietario, L4 UX verdadera, L5 evidencias verificables y límite de alcance, L6 anti-pingpong. No segundo PHP, no segundo backend, no otro ORM, no reinstalación de SDK, no microservicios ni runners paralelos.

**Prohibiciones permanentes:** nada de PHP/Artisan/PHPUnit/Composer o bases de datos **en Windows host**; todo PHP/DB únicamente en **Docker del proyecto Jornato**, aislado de todas las instancias Codex en curso. No parar, reiniciar, borrar, desconectar, inspeccionar secretos o cambiar el estado de contenedores, volúmenes, redes o puertos ajenos. No `docker system/network/volume prune`, no `docker network create`, no modificación Docker daemon/Desktop/IPAM, DNS/firewall, no host networking, puertos publicados, redes bridge/ajenas o Docker socket montado. No pulls, builds, apt, composer install/update, cargas/importaciones de imágenes, downloads ni fallback de versiones. No teléfono/ADB/AVD, APK, producción, staging ni despliegue. No activar B19/B20; `OD02/OD03/OD04` pendientes; preservar `requestId` y legado `requetId`, `SERVER_STORED != RECOGNIZED`.

**Git y privacidad:** En `WIP_ROOT` nunca `git add`, commit, push, fetch, pull, checkout, reset, clean, stash, merge o rebase. No cambiar index/HEAD/branch; acceso **solo read-only**. No subir WIP al repo público (PR1/PR3 solo F0, PR2 solo docs). **Todos** los datos de QA son sintéticos A/B; jamás `.env` verdadero, fotos, trabajadores, claves, tokens reales, DB dump, vendor ni código fuente en el ZIP público de retorno. Privado en D: **NO es backup off-device**.

## 1 — Gate de no duplicación y custodia (una sola vez)

1. **Antes de crear un solo archivo**, confirmar que N5 terminó, que el ZIP N5 conservado en D: coincide con `N5_ZIP_SHA256`, y si existe N6 actual o está en proceso. Revisar exclusivamente `OUTPUT_ROOT` esperado, `delivery` y tareas locales identificables N6 sin buscar por todo D:. Si N6-R1 ya comenzó/existe entregable o actividad concurrente, **PARAR** `SUPERSEDED_OR_N6_IN_FLIGHT`; no ejecutar N6-R2, no cambiar GitHub, no reutilizar la misma carpeta borrando artefactos. Si no hay evidencia de que N6-R1 no inició, `BLOCKED_N6_STATE_UNKNOWN`.
2. Confirmar que `OUTPUT_ROOT` está fuera de WIP, en `D:` y no es junction/symlink a otro proyecto; crear `OUTPUT_ROOT\private` y `delivery` solo una vez tras el gate. `private` contiene evidencias brutas/env/código: jamás dentro del ZIP. Si ya existen rutas con archivos no creados por esta tarea, bloquear en lugar de sobreescribir.
3. Capturar PRE/POST de **WIP solo lectura**: rama/HEAD, 235 status indicativos, staged=0, SHA del índice; no forzar conteos históricos si hubo cambios legítimos ajenos. Si detectas agente concurrente modificando WIP, `BLOCKED_CONCURRENT_WIP`, sin editar. No rehacer SHA de 232 fuentes ni repetir los 86 tests N2, 9+4 N3, 9 N5, 158/2450 PHPUnit históricos, ni auditorías 10+10.
4. Reutilizar **en lectura** el candidato N5 y los resultados N4/N5 desde `N5_ROOT/private`/matrices existentes (resolver ruta real, no suponer nombre). El código Laravel solo puede ir en **UNA** copia N6 nueva dentro de `OUTPUT_ROOT\private\candidate_n6`. Incluir server + vendor que use Laravel real, sin copiar env/secrets/links; cotejar `server/composer.json` y `composer.lock` y hashes SOLO de archivos necesarios contra manifiesto reportado N5. No copiar los 232 de nuevo por ritual ni modificar N4/N5. Si no existe fuente o vendor suficiente, `BLOCKED_SOURCE_OR_VENDOR`, pero aún se permite diagnóstico de imagen sin app.

## 2 — Diagnóstico mínimo del error PHP **sin iniciar MariaDB**

**Presupuesto total de imágenes:** máximo **DOS**: primero la **imagen PHP N5 identificada por IMAGE ID exacto** si su plataforma es compatible; únicamente si esa imagen queda descartada o falla y existe una alternativa local autorizable compatible, **UNA segunda imagen** seleccionada por lectura antes de ejecutarla. **No** iterar por catálogos de proyectos, probar muchas etiquetas ni cambiar versiones de Composer para obtener verde. Si la imagen N5 no existe, una sola alternativa. Nunca usar `latest`, ninguna descarga, ninguna imagen con procedencia incierta. Las capas de imagen en caché pueden ser de lectura compartida, pero **nunca** reutilizar contenedores, redes, volúmenes, datadirs o credenciales de otros programas.

### 2.1 Preflight Docker: cero cambios

1. Identificar **el daemon de Docker correcto** antes de inspeccionar: contexto (`docker context show`), endpoint/tipo de motor sin divulgar credenciales, `docker version --format '{{.Server.Os}}/{{.Server.Arch}}'` y `docker info` con OS/arquitectura (campos filtrados). Registrar si `DOCKER_DEFAULT_PLATFORM` está definida (solo valor arquitectura). N5 reportó Linux/amd64 para imágenes, **no prueba plataforma real del daemon ni del binario**. Si parece remoto, ambiguo o corresponde a otro motor/proyecto, `BLOCKED_DOCKER_CONTEXT` sin sondas. Docker Desktop disponible NO equivale a contexto correcto.
2. Verificar estado/IDs/puertos **solo inventario sanitario** de recursos ajenos PRE, sin `docker inspect` completo. Identificar contenedores N5 por labels Compose y **IMAGE ID del PHP que falló**, no por el ID corto del contenedor (solo pista N5 PHP `68a27835c845`, DB `387467db1762`). NO encender ni detener N5; preservar su volumen. Si faltan labels/ownership, no reutilizarlos, pero `docker image inspect` de ID explícito aún se permite si es de solo lectura y no hay dudas.
3. Para imagen N5 original y, en su caso, una alternativa cached: ejecutar `docker image inspect --format` filtrando **ID, OS, Architecture, Variant, Entrypoint, Cmd, digest/tag**, y examinar compatibilidad con daemon/`DOCKER_DEFAULT_PLATFORM`. También anotar una posible inconsistencia entre entrypoint reportado y `exec /usr/bin/sh`. Si OS/arquitectura no corresponden, NO hacer probe sobre ella; `BLOCKED_PHP_PLATFORM` salvo una alternativa elegida. Una coincidencia de metadatos **no es PASS**.
4. Confirmar cupo de CPU/RAM/disco de diagnóstico y que no haya ejecución N6 paralela. Usar `--network none`, sin mounts de proyecto, sin secretos, sin puertos ni volúmenes, sin privilegios, con `--rm`, límites CPU/memoria/PIDs y etiquetas exclusivas `com.sierraglobal.jornato.task=N6`. Comprobar residuos propios si un contenedor efímero falla, **sin tocar recursos ajenos**.

### 2.2 Sondas **separadas por binario**; no repetir la misma falla

**Para cada imagen elegida (máximo dos imágenes, seleccionadas de antemano):** usar **IMAGE ID inmutable** obtenido de `docker image inspect`; no reutilizar un tag que otra instancia pueda cambiar. Codex rellenará `IMAGE_ID` a partir del preflight, no improvisará.

**Sonda A — shell REAL, eludiendo el entrypoint original** (una vez por imagen, sin MariaDB):

```powershell
# Ejecutar desde PowerShell; antes de correr, sustituir IMAGE_ID/NAME por los datos reales.
# --entrypoint es obligatorio: si se omite, se estaría probando además el wrapper de la imagen.
docker run --rm --pull=never --network none --read-only --tmpfs /tmp:rw,nosuid,size=32m --cpus 0.5 --memory 256m --pids-limit 64 --name <N6_OWNED_PROBE_NAME> --label com.sierraglobal.jornato.task=N6 --entrypoint /bin/sh <IMAGE_ID> -c 'printf N6_SHELL_OK; command -v sleep >/dev/null'
```

**Aceptar A solo** con exit 0, cadena exacta `N6_SHELL_OK` y disponibilidad del `sleep` utilizado por el entrypoint de Compose; no permitir PASS cuando únicamente se imprimió la cadena pero el exit fue distinto de cero. Si A falla con `exec format error`, registrar imagen/daemon/plataforma/exit y ejecutar **solo UNA sonda B de PHP directo sobre esa MISMA imagen** para distinguir fallo de shell frente a fallo general de binarios. No volver a ejecutar A idéntica ni iniciar Compose/DB. Si A falla por otra causa, clasificarla según stderr; B solo si diferencia una hipótesis real. Si la imagen no tiene `/bin/sh`, registrar `BLOCKED_PHP_SHELL_IMAGE`, no inventar una ruta sin evidencia de su existencia.

**Sonda B de discriminación** (solo si A falló, sobre la misma imagen, sin shell):

```powershell
docker run --rm --pull=never --network none --read-only --tmpfs /tmp:rw,nosuid,size=32m --cpus 0.5 --memory 256m --pids-limit 64 --name <N6_OWNED_PHP_DIAG_NAME> --label com.sierraglobal.jornato.task=N6 --entrypoint php <IMAGE_ID> -v
```

- A FAIL + B FAIL: `BLOCKED_PHP_IMAGE_EXEC` / `BLOCKED_PHP_PLATFORM` / `BLOCKED_DOCKER_RUNTIME` según evidencia; **no** atribuir «Laravel roto» ni arquitectura incompatible sin prueba.
- A FAIL + B PASS: `BLOCKED_PHP_SHELL_IMAGE`; **no** usar el PHP directo como workaround para pasar Laravel/Artisan: el arranque N5 depende de shell y no se ha demostrado entorno completo.
- A PASS: pasar a sonda C, **sin ejecutar B**; así se evita repetir PHP gratuitamente.

**Sonda C — PHP versión + extensiones**, tras shell PASS (una vez por imagen, sin MariaDB). Se permite `docker run --entrypoint php ... -v` y `docker run --entrypoint php ... -m`, o una única invocación de un `/bin/sh` previamente validado que ejecute ambos comandos. Los módulos REQUERIDOS se deducen de `server/composer.json`/`composer.lock` **reales** y las funciones de base de datos usadas, no de una lista genérica impuesta. Como mínimo acreditar PHP >=8.3 según el proyecto y los módulos necesarios para Laravel + conexión MariaDB real (`pdo_mysql`, otros `ext-*` exigidos). Registrar `REQUIRED_PRESENT`, `REQUIRED_MISSING` y opcionales; si falta alguno requerido, `BLOCKED_PHP_EXTENSIONS`. No instalar módulos ni reconstruir imagen.

**Salida de la selección:** la PRIMERA imagen compatible cuyo A y C pasan será la imagen aceptada. Si la original falla, probar como máximo una alternativa cached **preseleccionada** con ID y plataforma. Si no existe alternativa compatible, terminar con `BLOCKED_NO_COMPATIBLE_CACHED_IMAGE` y la decisión técnica mínima necesaria. Ninguna tercera imagen, ni quinto intento, ni «arreglos» Docker globales. No iniciar DB si no hay `PASS_IMAGE_SHELL_PHP_EXTENSIONS` y vendor/fuente de N6 verificados.

**IMPORTANTE:** si antes del diagnóstico falla la identidad del daemon, ausencia del ID original o disponibilidad de imágenes y no existe alternativa segura, entregar informe causal. No leer ni parar recursos ajenos para descubrir alternativas.

## 3 — Un único laboratorio Laravel+MariaDB N6 (SOLO tras PASS de PHP)

### 3.1 Contrato de Docker sin IPAM ni interferencia

1. Usar una **única definición Compose N6 propia** en `OUTPUT_ROOT\private\docker-qa\compose.yaml`, basada en la topología exitosa de N5. `--project-name jornato-n6-qa-<sufijo_unico>` sin colisiones. **Únicamente** dos servicios `db` (imagen MariaDB N5 cacheada por ID comprobado, `network_mode: none`) y `php` (**IMAGE ID pinneado que pasó A+C (si Compose admite el ID local; si no, usar el tag local confirmado y volver a comparar IMAGE ID antes de `up`, sin pull ni cambiar imagen)**, `network_mode: service:db`). PHP/DB comparten únicamente loopback en namespace privado por `127.0.0.1:3306`, no comparten volúmenes. No top-level `networks` de uso efectivo, redes externas/host/bridge, `ports`, extras, ni publicación de puertos. No crear ni usar redes de otro proyecto, ni intentar corregir IPAM.
2. PHP bind mounts **solo** `OUTPUT_ROOT\private\candidate_n6` con fuentes de Jornato + vendor; jamás WIP/N5/otro proyecto. MaríaDB volumen **N6 nuevo**, labels Compose inequívocos; nunca reutilizar volumen N5. Archivo de secrets/env QA con contraseñas sintéticas y APP_KEY laboratorio solo en private, no copiar ni imprimir. El shell del servicio PHP apunta a la ruta real validada en A; no copiar el entrypoint PHP defectuoso de N5 si se demostró incompatible. No incorporar paquetes o scripts ajenos.
3. Antes de `up` una sola vez: renderizar Compose en `private` (guardar JSON ahí, **no** en ZIP ni console), inspeccionar estructuralmente 2 servicios, image IDs correctos, `network_mode` exactos, sin redes/puertos, mounts únicamente N6, volumen QA nuevo, `pull_policy: never`, no build ni imagen remota, variables QA sintéticas. Si el render requiere `default` network para alguno de los servicios o la propiedad no se puede demostrar, STOP `BLOCKED_COMPOSE_NETWORK`.
4. Ejecutar como máximo **UN** `docker compose --project-name <N6_NAME> --env-file <PRIVATE_ENV> -f <PRIVATE_COMPOSE> up -d --pull never --no-build`. Medir antes/después: cero redes nuevas, cero puertos publicados, dos contenedores propios, volumen nuevo N6, ningún cambio de recursos ajenos atribuible a N6. Si IPAM reaparece o se detecta interferencia, STOP inmediatamente, sin segunda variante/`prune`/Docker Desktop config. No usar `down -v` de recursos no inequívocamente N6.
5. El `healthcheck` MariaDB únicamente valida **liveness**. **No** declararlo como SQL/PDO OK. Desde el contenedor PHP **N6** comprobar por PDO `127.0.0.1` autenticación con credencial QA exclusiva, `DATABASE()`, `CURRENT_USER()`, `@@hostname`, usuario/namespace/volumen N6 y **schema propio vacío antes de migración**; no consultar otras bases. Si no pasa: `BLOCKED_DB_IDENTITY` y **nunca** lanzar migraciones.

### 3.2 Laravel real, sin inventar contratos

6. Solo con PDO+DB QA limpios, invocar PHP/Artisan **desde contenedor PHP N6**, con `APP_ENV=testing`, APP_KEY QA, `APP_DEBUG=false`, y configuraciones sintéticas no heredadas del WIP/producción; confirmar la versión real Laravel 13.40.0 y dependencias del candidato N6. Ejecutar exclusivamente migraciones ya existentes en QA **nueva y exclusiva**, sin `migrate:fresh` sobre base compartida ni `composer install`, y registrar exits, tablas/índices sanitizados. Si falla extensión/vendor/boot, clasificar ambiente vs producto en raíz, no maquillar logs.
7. Sin abrir puertos y solo si migraciones pasan, ejecutar con Kernel HTTP real y MariaDB real **hasta ocho** oráculos **ya definidos**: E01 anónimo → denegado; E02 token A→recurso A permitido; E03 token A→recurso B lectura denegada; E04 token A→recurso B escritura denegada **sin cambio DB**; E05 PAT revocado/vencido falla cerrado; E06 mismo `requestId`+payload → efecto persistido único; E07 mismo `requestId`+payload distinto → conflicto sin mutación; E08 `SERVER_STORED` ≠ `RECOGNIZED`. Fixtures exclusivamente dos tenants sintéticos A/B. Rutas, controladores, middleware, permisos y payloads **observados en fuente real**, nunca inventar endpoints ni activar contratos OD02/OD03/OD04 pendientes o B19/B20. Caso no autorizado/no soportado → `BLOCKED_CONTRACT`, no PASS por mock.
8. Para E04/E06/E07, registrar conteos/identificadores sintéticos **antes y después** en la DB N6; medir persistencia y estados. Resultado máximo `PASS_E2E_SCOPED`; no convertirlo en aprobación Android, seguridad de dispositivos ni producción.
9. Si un fallo se demuestra de **PRODUCTO**: realizar una sola corrección mínima en la **copia N6 privada**, con hash PRE/POST y test focal posterior (y vecino solo si cambia propietario compartido). No tocar WIP ni reejecutar la suite backend histórica 158/2450 sin delta del propietario. Etiquetar `FIX_ONLY_PRIVATE_N6_NOT_INTEGRATED`, no reclamar parche listo para release. Si fallo de entorno, cerrar subgate causal sin nueva infraestructura.
10. Detener/limpiar únicamente **contenedores N6** por labels/IDs comprobados. Documentar el estado del volumen N6 propio (conservar para evidencia si corresponde), jamás borrar N5 o ajenos. Inventario externo PRE/POST; atribución precisa si otro Codex modificó sus propios recursos concurrentemente. No eliminar volumen DB sin evidencia de propiedad y plan de conservación. Si limpieza propia parcial, `CLEANUP_PARTIAL`, sin prune.

## 4 — Entrega única, medible y sin documentos dispersos

**Exigir exactamente UN ZIP** bajo `OUTPUT_ROOT\delivery` con manifiesto SHA256 + bytes + CRC verificado. En la respuesta de Codex fuera del ZIP solo dar ruta Windows y SHA256. No adjuntar un nuevo ZIP de fuentes, caches, DB, secretos, manifests completos con paths personales, inspect JSON ni logs crudos. Estructura de informe **máxima**:

```text
FINAL_REPORT.md
PHP_IMAGE_ROOT_CAUSE.md
DOCKER_IMAGE_RUNTIME_MATRIX.csv
QA_ISOLATION_EVIDENCE.csv
SERVER_DB_MIGRATIONS.csv
SERVER_E2E_E01_E08.csv
WIP_GUARDS.csv
N6_GATE_MATRIX.csv
MANIFEST_SHA256.csv
```

El informe debe incluir **una fila por prueba efectivamente ejecutada**, comando sanitizado/exit y evidencia relevante, hash de la imagen/versión/OS/arch, contexto motor indicado genéricamente, módulo faltante exacto, y cuándo hubo una prueba bloqueada. **Los metadatos del host y del paquete no prueban las condiciones de producción**; escribirlo explícitamente. Todos los logs privados útiles permanecen solo en D:, `OFF_DEVICE_BACKUP=NO`.

**Clasificaciones obligatorias:**

```text
N6_IMAGE_PREFLIGHT=PASS|BLOCKED_DOCKER_CONTEXT|BLOCKED_PHP_PLATFORM|BLOCKED_IMAGE_IDENTITY|BLOCKED_RESOURCE|NOT_RUN
N6_PHP_IMAGE=PASS|BLOCKED_PHP_SHELL_IMAGE|BLOCKED_PHP_IMAGE_EXEC|BLOCKED_PHP_EXTENSIONS|BLOCKED_VENDOR|BLOCKED_NO_COMPATIBLE_CACHED_IMAGE|BLOCKED_DOCKER_RUNTIME|NOT_RUN
N6_DOCKER_ISOLATION=PASS_SCOPED|BLOCKED_IPAM|BLOCKED_COMPOSE_NETWORK|BLOCKED_CROSS_PROJECT_DELTA|BLOCKED|NOT_RUN
N6_DB=PASS_QA_MIGRATIONS|BLOCKED_DB_IDENTITY|BLOCKED_ENV|FAIL_PRODUCT|NOT_RUN
N6_E2E=0..8_PASS + estados individuales E01..E08
WIP_GUARDS=PASS_UNCHANGED|DELTA_UNEXPECTED|BLOCKED_CONCURRENT
N5_FLUTTER=PASS_CANDIDATE_SCOPED_REUSED
PRIVATE_FIX=NONE|FIX_ONLY_PRIVATE_N6_NOT_INTEGRATED
ANDROID_NATIVE=NOT_RUN
OFF_DEVICE_BACKUP=NO
SERVER_STAGING=NOT_AUTHORIZED
RELEASE=NO_GO
```

**Nunca** decir `PASS` al runtime si solo pasó `docker inspect` o `mariadb-admin ping`. Nunca declarar APK o servidor listo para lanzar en este bloque. Si solo se certifica la imagen, entregar ese avance y el bloqueo preciso del siguiente gate; **NO** hacer otra auditoría del prompt ni prometer trabajo futuro.

**Mensaje final obligatorio de Codex a ChatGPT Director (fuera del único ZIP):**

```text
TASK=JOR-N6-PHP-RUNTIME-CAUSE-ISOLATED-QA-20261121
PROMPT_REVISION=N6-R2-20261121
RESULT=PASS_SCOPED|PARTIAL_WITH_GAPS|BLOCKED
N6_IMAGE_PREFLIGHT=...
N6_PHP_IMAGE=...
N6_DOCKER_ISOLATION=...
N6_DB=...
N6_E2E=.../8
PRIVATE_FIX=...
N5_FLUTTER=PASS_CANDIDATE_SCOPED_REUSED
WIP_GUARDS=...
RELEASE=NO_GO
ZIP_PATH=D:\codex\_REPORTES\Jornato\JOR-N6-PHP-RUNTIME-CAUSE-ISOLATED-QA-20261121\delivery\JOR-N6-PHP-RUNTIME-CAUSE-ISOLATED-QA-20261121-UNICO.zip
ZIP_SHA256=...
NEXT_OWNER=CHATGPT_DIRECTOR
```

**Gobierno:** si N6-R1 ya está en ejecución, esto es solo un documento de referencia — no se manda ni se ejecuta N6-R2. Si N6-R2 procede, ejecutarlo completo una vez; enviar ZIP a ChatGPT Director. Antes de cualquier integración del candidato privado a un repositorio, exigir destino privado y examen de secretos y copia recuperable fuera de PC aprobada por dueño. **NO MERGE/DEPLOY/APK/GO en N6.**

**Fuentes técnicas:** https://docs.docker.com/reference/cli/docker/container/run/ ; https://docs.docker.com/reference/cli/docker/image/inspect/ ; https://docs.docker.com/reference/cli/docker/version/ ; https://docs.docker.com/reference/compose-file/container-spec/ . No son evidencia de ejecución en Windows.
