# CODEX LUNA — JORNATO B21-DB-DOCKER-QA S1 V1 · MACROBLOQUE ÚNICO DE INTEGRACIÓN REAL AISLADA

**TASK_ID:** `JOR-B21-DB-DOCKER-QA-S1-V1-20261115`  
**Fecha de orden:** 2026-11-15 (America/Bogota)  
**Director y aceptación independiente:** ChatGPT. **Ejecutor local Windows:** Codex Luna.  
**Autorización del propietario en esta conversación:** Docker Desktop **ya está instalado y otros proyectos Codex lo utilizan**. Se permite aprovecharlo **solo creando recursos nuevos y exclusivos de Jornato**, sin interferir ni modificar contenedores, imágenes en uso, volúmenes, redes, ajustes, puertos ni procesos ajenos. Esta autorización **NO** habilita permisos comerciales, cambio de otros proyectos, administración global Docker, datos laborales reales ni release.  
**ÚNICA ORDEN VIGENTE.** La entrega `B21-S1 V2` ya ocurrió (ZIP SHA256 `68CBA9DBBF91D0CE93B1618F15239A928EAA2AC8D66A6AD7F5EF83573C26F98B`) y terminó `PARTIAL` con 0 pruebas DB; **no repetirla**. Este lote modifica UNA precondición: proporciona MariaDB real de QA en un proyecto Docker Compose NUEVO de Jornato, y ejecuta pruebas focales pendientes. No pedir otra autorización si puedes cumplir exactamente los límites establecidos; si no, detener la parte insegura y devolver un bloqueo fundamentado, sin eludir políticas.

## 0. Resultado obligatorio y regla de trabajo

**El resultado principal NO es otro informe:** ejecutar MariaDB real de Jornato en Docker y obtener evidencia de migraciones + pruebas de concurrencia B17/B19/B20 y fronteras de tenant/PAT que el entorno permita. Entregar **un único ZIP** con todos los logs y resultados reales, y un resumen directo. Si aparece un defecto P0/P1 reproducible en el producto, corregir su **causa raíz focal** en la misma tanda si es seguro, sin parches cosméticos; si requiere contrato del propietario, no implementarlo ni crear permisos temporales.

**Rutas innegociables:**

- Proyecto y producto WIP: `D:\codex\Jornato` — conservar su HEAD/rama/staging y archivos tracked, untracked e ignorados previamente inventariados; NO sobrescribir ni limpiar.
- Laboratorio propio **nuevo**: `D:\codex\_RUNTIME\Jornato\B21_DOCKER_QA\` (subcarpetas `compose`, `data`, `secrets`, `logs`, `harness`). **Solo aquí** crear Compose, datadir de QA, credenciales sintéticas y herramientas del experimento.
- Evidencias: `D:\codex\_REPORTES\Jornato\JOR-B21-DB-DOCKER-QA-S1-V1-20261115\`.
- Carpeta `delivery` con **solo** `JOR-B21-DB-DOCKER-QA-S1-V1-20261115-UNICO.zip`. No otro ZIP, no informes dispersos para entregar.
- Proyecto Compose **único e invariable** `jornato_b21_qa_20261115`; servicio `db`. Pasar `-p jornato_b21_qa_20261115` y `-f` con ruta absoluta DEL COMPOSE NUEVO en **cada** comando `docker compose`. No confiar en el directorio actual, proyecto `default`, configuración Compose ajena ni `COMPOSE_PROJECT_NAME` externo.

**Nunca ejecutar:** `docker system prune`, `docker volume prune`, `docker image prune`, `docker network prune`, `docker container prune`, `docker compose down` sin revisar su alcance, `docker stop/restart/rm` sobre un ID ajeno, `docker compose up` desde carpeta de otro proyecto, Docker Desktop restart, WSL shutdown, cambios en daemon/contexts/configuración global, firewall, `netsh`, UAC, `C:`, producción o GitHub de producto. No hacer `git add/commit/push/merge/rebase/reset/clean/stash/checkout` ni deploy. No levantar nuevos servicios Windows ni instalar MariaDB MSI/ZIP fuera de Docker.

**Si un comando o política corporativa bloquea Docker:** STOP de esa acción y `BLOCKED_POLICY`; no cambiar a otro daemon/contexto, no eludir y no volver a probar variantes para forzarlo. No se permite usar contenedores existentes de otros proyectos como sustituto. No tocar otras bases, aunque sus nombres incluyan `mysql` o `mariadb`.

## 1. Fase A — Preflight solo lectura y política de no interferencia (máximo una pasada)

1. Abrir SOLO `D:\codex\Jornato`, el dictamen B21 y el checkpoint: `docs/JORNATO_CONTINUIDAD.md` de la rama documental (`sierraglobalcompany-rgb/Jornato`, PR #2 DRAFT); no descargar/clonar el repo remoto encima del WIP. Validar **estado real** del checkout local, `git rev-parse HEAD`, rama, `git status --porcelain=v1`, staged, WIP previos tracked/untracked/ignored cuando sea seguro. Capturar SHA+bytes de archivos existentes sujetos a cambios, sin copiar datos personales. No rehacer auditorías B13–B20 ni sus baterías host sin relación con esta integración.
2. Ejecutar **solo lectura** `docker version`, `docker compose version`, `docker info` (redactar datos sensibles), `docker context show`, `docker ps -a` con nombres/ID corto/estado/proyecto/puertos, `docker compose ls`, `docker image ls` de MariaDB, uso de disco y RAM del equipo y del motor. No imprimir variables/secrets de contenedores de otros proyectos; **no** inspeccionar sus montajes, credenciales ni logs. Anotar `Docker_Engine_Context`, versión, contenedores ajenos antes, sus estados y puertos **sin datos privados**.
3. Comprobar que el proyecto `jornato_b21_qa_20261115` y su espacio `D:\codex\_RUNTIME\Jornato\B21_DOCKER_QA` no pertenecen a otro actor/ejecución ni contienen datadir desconocido. Si existe, solo reutilizarlo si hay prueba verificable de propiedad de **esta misma** orden e integridad; si no, `BLOCKED_OWNERSHIP`, no `down`, no rename/destruir ni reutilizar nombres.
4. Verificar recursos disponibles: margen razonable de RAM para contenedor **máximo 768 MiB**, CPU máximo **1 vCPU**, disco D: suficiente para DB ficticia y logs; comprobar el Docker data root / almacenamiento de imágenes, que podría residir en C:. **No mover Docker data root ni cambiar WSL** porque afectaría otros proyectos. Si una única imagen nueva pone en riesgo el disco compartido o la RAM, parar antes del pull y reportar `BLOCKED_CAPACITY`. El datadir **propio** debe quedar físicamente en D: mediante bind mount; no prometer que todas las capas internas de Docker estén en D:.
5. La imagen a utilizar es **solo la oficial** `docker.io/library/mariadb:11.8.9` (LTS, versión concreta). Si ya existe localmente y su procedencia es confiable, inspeccionar su digest/ID. Si no existe, permitir **un único** `docker pull mariadb:11.8.9` del Docker Hub oficial, solo tras preflight de recursos y procedencia; no usar `latest`, imágenes privadas, espejo desconocido, imagen de otro proyecto por su etiqueta ni forzar descarga si red/política rechaza. Anotar digest real para repetir la prueba. No usar upgrade ni alterar otras imágenes; Compose debe impedir pulls adicionales con `pull_policy: never`.
6. **Pre y post**: otros contenedores deben conservar sus IDs, estado operativo y puertos (registrar cambios naturales concurrentes sin atribuir causalidad). Si la memoria/CPU de otro servicio empieza a deteriorarse tras iniciar Jornato, detener **solo** el contenedor QA propio e informar la observación; no reiniciar el ajeno. Aislamiento de redes/volúmenes/nombres evita colisiones, pero todos comparten **un motor Docker y recursos físicos**: no afirmar aislamiento físico absoluto.

**Gate A:** `DOCKER_ISOLATION_PRECHECK=PASS` solo si todo lo anterior se documenta con salidas reales. Si falla, no crear contenedor y devolver el ZIP de bloqueo, sin reintentos especulativos.

## 2. Fase B — Crear exclusivamente MariaDB QA (sin otros contenedores)

### B1. Configuración de un solo servicio y red propia

Crear **solo** `D:\codex\_RUNTIME\Jornato\B21_DOCKER_QA\compose\compose.yaml` (sin `container_name` ni redes externas), un directorio `data` nuevo y `secrets` nuevo. Usar **Compose de un solo servicio**, con esta estructura de referencia. Codex debe validar el YAML con `docker compose ... config` **antes** de arrancar; si la sintaxis de su versión difiere, ajustar **solo la sintaxis** sin cambiar los límites de seguridad.

```yaml
services:
  db:
    image: mariadb:11.8.9
    pull_policy: never
    restart: "no"
    mem_limit: 768m
    cpus: 1.0
    pids_limit: 128
    environment:
      MARIADB_DATABASE: jornato_b21_qa
      MARIADB_USER: jornato_qa
      MARIADB_ROOT_PASSWORD_FILE: /run/secrets/db_root_password
      MARIADB_PASSWORD_FILE: /run/secrets/db_app_password
    secrets:
      - db_root_password
      - db_app_password
    ports:
      - target: 3306
        host_ip: 127.0.0.1
        protocol: tcp
    volumes:
      - type: bind
        source: ../data
        target: /var/lib/mysql
    networks:
      - qa_internal
    healthcheck:
      test: ["CMD", "healthcheck.sh", "--connect", "--innodb_initialized"]
      interval: 5s
      timeout: 3s
      retries: 24
      start_period: 20s
networks:
  qa_internal:
    driver: bridge
secrets:
  db_root_password:
    file: ../secrets/db_root_password.txt
  db_app_password:
    file: ../secrets/db_app_password.txt
```

**Notas de interpretación y cierre:**

- `host_ip: 127.0.0.1` es **obligatorio**. `published` omitido solicita puerto **efímero** para evitar choques; verificar en salida real que se asigna **solo** `127.0.0.1:<PUERTO> -> 3306`. Si su versión de Compose no admite puerto automático con `host_ip`, escoger **un puerto exclusivo libre** con comprobación de colisión, configurar explícitamente `127.0.0.1:<PUERTO>:3306` y validar de nuevo. **Jamás** sustituir por publicación en `0.0.0.0` o 3306 compartido.
- La carpeta `data` debe ser real y vacía en D: antes de `up`. Resolver `../data` según el directorio del archivo Compose; verificar con `docker inspect` **solo del contenedor propio** que `/var/lib/mysql` es bind del directorio correcto de D:. Si Docker Desktop no puede montar D:, detener sin cambiar configuración global ni usar volúmenes desconocidos.
- Generar **dos secretos aleatorios independientes** con API criptográfica Windows/.NET (mínimo 32 bytes aleatorios cada uno) en archivos de `secrets`, restringidos al usuario actual. Nunca escribir contraseñas dentro de `compose.yaml`, scripts de evidencia, línea de comando, `docker inspect` de entorno, tests, Git, ZIP o logs. **No incluir** `secrets/` ni `data/` en evidencias. En la distribución Compose Linux, secrets se montan `/run/secrets/...`; documentar solo nombres y permisos, no valores.
- No usar puertos expuestos públicamente, bind del repositorio, rutas de otros proyectos, `privileged`, Docker socket mount, modo `host`, `external: true`, `network_mode: host`, `volumes_from` ni compartir secretos. Solo nueva red del proyecto, una base 100% ficticia.
- No usar `docker-compose` V1 obsoleto ni `docker compose` sin `-p` y `-f` absolutos. Comandos `ps`, `port`, `logs`, `up`, `stop` siempre delimitados al proyecto propio; validar que labels de contenedor/red tienen `com.docker.compose.project=jornato_b21_qa_20261115`.

### B2. Arranque y comprobación, UNA sola vía

1. Crear directorios nuevos/secretos. Ejecutar `docker compose -p jornato_b21_qa_20261115 -f <ABS_COMPOSE> config --quiet` y **no iniciar** si hay cualquier recurso ajeno, Dockerfile extra, mounts fuera del laboratorio, imágenes desconocidas o port sin host_ip local. Capturar configuración **redactada** (nunca valores de secretos).
2. Si pasa, `docker compose -p jornato_b21_qa_20261115 -f <ABS_COMPOSE> up -d --no-deps db`. No arrancar backend web ni otras bases; no hacer `down` ni reconfigurar proyecto ajeno. Verificar `docker compose ... ps`, `docker compose ... port db 3306`, `docker inspect` SOLO del ID propio y `healthcheck` con plazo acotado. Registrar digest de imagen, versión SQL `SELECT VERSION()`, `@@hostname`, `@@port`, engine InnoDB, `CONNECTION_ID()` y ruta del datadir del contenedor; **no** imprimir contraseñas.
3. Confirmar desde Windows `127.0.0.1:<PUERTO_ASIGNADO>` que se conecta mediante usuario `jornato_qa` a base `jornato_b21_qa`. El puerto debe ser el realmente publicado, **no 3306 asumido**. No conectarse a ningún puerto ajeno. Usar sólo un procedimiento de inicialización; si falla por política, montaje o recursos, detener SOLO recursos propios si se crearon y reportar causa, sin forzar el host.
4. Registrar únicamente en logs internos el puerto efectivo, ID propio y health, nunca secretos ni IPs de otras redes. El proceso Docker Desktop queda como estaba; **no** reiniciar servicio Docker global.

**Gate B:** `DB_CONTAINER_REAL=PASS` requiere contenedor propio saludable, digest/proyecto/loopback/mount D verificables y conexión SQL real. El contenedor saludable **no** equivale a migraciones o tests del producto PASS.

## 3. Fase C — Ejecutar las pruebas REALES que estaban bloqueadas

### C1. Aislar el runner del producto (sin aflojar phpunit.xml de producción)

- Leer primero `D:\codex\Jornato\server\phpunit.xml` y la configuración DB efectiva; el B21 previo detectó **DB_PORT=1 intencional** y ausencia de `.env.testing`. **Nunca** apuntar tests a otro proyecto, a producción, a un hostname externo o al puerto 1 como si fuera QA real.
- Preparar variables de entorno **temporales solo para un proceso/harness** de QA (`APP_ENV=testing`, `DB_CONNECTION=mysql` o conexión MariaDB que realmente existe, `DB_HOST=127.0.0.1`, `DB_PORT=<PUERTO_PUBLICADO>`, `DB_DATABASE=jornato_b21_qa`, `DB_USERNAME=jornato_qa`, contraseña desde secreto). No modificar `.env` existente ni `phpunit.xml` del producto para simular éxito. Si XML sobrescribe las variables, preparar **un archivo PHPUnit temporal derivado fuera del repo** con overrides mínimos y paths validados; probar la configuración realmente leída por Laravel antes de migrar. Si no hay runner PHP/composer/driver disponible, documentar `BLOCKED_RUNNER` sin instalar herramientas globales.
- Antes de `artisan migrate`, demostrar **simultáneamente** hostname/puerto/schema/user/token esperado desde el proceso que va a migrar (sin exponer secretos). Rechazar cualquier conexión que no coincida con el ID/puerto del contenedor propio. No usar `migrate:fresh` sobre bases no verificadas, ni `db:wipe`, ni seeders con datos personales.

### C2. Migraciones limpias, integridad y aislamiento entre empresas

- Aplicar solo migraciones existentes B13–B20 en la **base nueva y vacía** `jornato_b21_qa` creada por el contenedor propio; registrar cada migración real con log/exit code y `SHOW CREATE TABLE`, engines, indexes, UNIQUE y FK relevantes. Inspeccionar DDL antes de corregir tipos o índices. No modificar esquema por anticipado; si una migración falla, reproducir y corregir **una causa raíz focal** (archivo/s) únicamente si el arreglo es seguro y compatible con WIP, e incluir BASELINES/PATCH/SOURCES. No hacer múltiples intentos a ciegas ni inventar el estado de migraciones.
- Poblar fixtures **sintéticos únicamente**: empresa A, empresa B, membresía A, usuario con PAT de QA, empleados fake y dos recruiters solo en capa QA/test; B19 y B20 deben continuar DENY-ALL productivo. Intentar FK/UNIQUE cruzando tenant, baja/revocación y rollback donde el servicio permita la acción bajo test. **No habilitar rutas reales HR ni ATS** para ejecutar test.
- Prueba de tenant A→B y guard/PAT: HTTP/kernel real si está disponible y existe contrato; `actingAs`/mocks se etiquetan `HOST_TEST_ONLY`. No llamar `PASS_HTTP_REAL` a una invocación de método, ni `PASS_TENANT_REAL` si el ambiente no ejecutó SQL real.

### C3. Carreras de verdad: B17, B19 y B20

**Por cada carrera** usar dos conexiones MariaDB distintas **simultáneamente abiertas**, con `SELECT CONNECTION_ID()` distinto, barrera o sincronización verificable, transacciones solapadas y timestamps de inicio/fin. Si no es posible coordinar dos sesiones reales, **`NOT_RUN_CONCURRENCY`**, nunca PASS por dos llamadas consecutivas o por SQLite/in-memory.

- **B17:** dos intentos sobre la MISMA key de idempotencia/payload sintético/empresa. Verificar una fila de solicitud y un solo evento inicial, respuesta de retry conforme contrato y ausencia de estado duplicado; repetir con payload diferente y misma key para conflicto sin modificar lo primero. Probar rollback si la prueba puede causarlo con inyección controlada en harness, no alterar código productivo si no está previsto.
- **B19:** dos operaciones sobre el MISMO documento/versión o misma key según contrato; una sola versión por `(company_id,document_id,version)`, bytes/hash de archivo privado inmutables, no doble evento y compensación de key propia cuando falla transacción. Fake storage puede servir para semántica de servicio pero **no** como prueba del disk privado productivo; si se usa, etiquetar `DB_REAL_STORAGE_FAKE`.
- **B20:** dos entrevistas sintéticas con el MISMO entrevistador (y candidato si aplica) en vacantes distintas, ventanas superpuestas. Verificar como máximo una entrevista activa/aceptada; `company` row lock real y estados/eventos consistentes. Sin permitir que dos intentos secuenciales con POST equivalgan a una carrera simultánea.
- Cada caso debe incluir: SQL/recuento final, conexiones, barrera, resultados exactos, `BEGIN/COMMIT/ROLLBACK`, status de negocio, log y árbol SHA; si la lógica productiva sigue cerrada por contrato, probar mediante test interno permitido sin abrir ruta comercial y marcar **capa exacta**.

**Gate C:** `DB_MIGRATIONS_REAL`, `DB_TENANT_REAL` y `B17/B19/B20_CONCURRENCY_REAL` se evalúan **separadamente**. No todo-or-nada ni falsa equivalencia entre SQL y HTTP.

## 4. Fase D — Cierre focal, comparación con otros Docker y entrega

1. Releer la matriz B21 previa **sin reejecutar** todos los oráculos/40/110 tests anteriores. Actualizar solo I03–I10, I13 y controles afectados de I01–I24, indicando `LAYER=DB_REAL/HTTP_KERNEL_REAL/HOST/STATIC/BLOCKED` con comando exacto, cwd, exit code, timestamps y hash de árbol. Las otras puertas siguen como estaban salvo evidencia nueva. **No** generar otro estudio 10×10 documental ni abrir B21 S2/S3 por inercia.
2. Comparar `docker ps -a` y `compose ls` antes/después sobre **IDs, estados y puertos** de otros proyectos. Registrar solo metadata mínima y posibles diferencias, sin leer sus archivos/logs. Si detectas interferencia plausible, reportar `NON_INTERFERENCE=NOT_VERIFIED/FAIL`, detener **solo** Jornato y conservar evidencia. No reparar otros proyectos en esta orden ni culpar cambios naturales sin causa comprobada.
3. **Al terminar, detener únicamente el contenedor propio**: `docker compose -p jornato_b21_qa_20261115 -f <ABS_COMPOSE> stop db`, verificar que queda parado y los ajenos siguen funcionando. Preservar datos QA y Compose en D: para una futura prueba, **no** ejecutar `down -v`, `rm`, `prune` ni borrar datadir. Si error/timeout, reportar y actuar solo sobre ID propio con evidencia, sin matar motor Docker.
4. Preservar HEAD/rama/staging/WIP existentes. Si no hay defecto nuevo reproducido, **0 archivos de producto modificados es correcto**. Si sí hay cambios autorizados, incluir comparación bytes/hashes de tracked/untracked, `PATCH_CANDIDATE.diff`, `BASELINES/`, `SOURCES/`, replay seguro 1:1. Nunca tocar archivos ignorados ajenos sin hash previo ni fabricar preestado.
5. `B21_GLOBAL=NOT_APPROVED`, `RELEASE_APPROVED=NO`, `L5_INDEPENDENT_RUNTIME=NOT_RUN` hasta dictamen posterior de ChatGPT y posterior QA integral H9 (accesibilidad, hardware, UX con dueño, amenazas, performance, 110+ inventario). No habilitar en producción B16 login, B17 reviewers, B19 documents, B20 ATS, B18 nómina, ni B22. OD01–OD08 continúan sin respuesta atribuida al propietario, salvo la **autorización técnica acotada para Docker QA** concedida en esta conversación.

### Criterios operativos del laboratorio (DO01–DO12)

| ID | Qué debe quedar falsable | PASS únicamente si |
|---|---|---|
| DO01 | Preflight no intrusivo | Docker/contexto/otros servicios leídos sin acciones sobre ellos |
| DO02 | Recursos propios | Compose proyecto/red/DB/datadir en D exclusivos, configuración validada |
| DO03 | Red + credenciales | Solo loopback, puerto real identificado y secrets fuera de evidencias |
| DO04 | Container real | Image ID/digest oficial y MariaDB healthy + SQL VERSION() |
| DO05 | Migraciones reales | InnoDB/DDL/migraciones sobre DB vacía QA con logs y exit 0 |
| DO06 | Tenant/UNIQUE/FK | A/B negative + constraints reales comprobados |
| DO07 | B17 concurrente | Dos SESSION IDs simultáneos, 1 idempotent record/evento |
| DO08 | B19 concurrente | Dos SESSION IDs simultáneos, 1 version/evento conforme contrato |
| DO09 | B20 concurrente | Dos SESSION IDs simultáneos, no entrevista solapada activa |
| DO10 | Auth/PAT | Alcance real que pudo ejecutarse, sin habilitar login/policies no aprobados |
| DO11 | No interferencia y parada | Otros proyectos preservados, se detuvo solo propio, QA data preservada |
| DO12 | Evidencia reproducible | Un ZIP íntegro, manifiesto+CRC+logs y WIP inalterado salvo defectos focales |

Estados admisibles por DOxx: `PASS_REAL_SCOPED`, `PASS_HOST_SCOPED`, `BLOCKED_POLICY`, `BLOCKED_CAPACITY`, `BLOCKED_RUNNER`, `BLOCKED_CONTRACT`, `NOT_RUN_ENV`, `FAIL_REPRODUCED`, `PARTIAL`. Ningún `DO01–DO12` aprobado por simple documentación. No exigir todos PASS si algunos dependen de contratos ajenos al Docker: **maximizar PASS real seguro y explicar cada impedimento una vez**.

## 5. ZIP único obligatorio y auditoría de custodia

Generar **un solo archivo**:

`D:\codex\_REPORTES\Jornato\JOR-B21-DB-DOCKER-QA-S1-V1-20261115\delivery\JOR-B21-DB-DOCKER-QA-S1-V1-20261115-UNICO.zip`.

**Contenido mínimo:**

- `FINAL_REPORT.md` (hecho/resultado/decisión y bloqueos concretos, dos párrafos ejecutivos al principio).
- `DOCKER_ISOLATION_PRE_POST.csv` (proyectos ajenos SOLO IDs cortos, nombre, status y port pre/post sin secretos), `DOCKER_PROJECT_CONFIG_REDACTED.yaml`, `DOCKER_OWN_RESOURCE_ID.md` (image ID/digest, proyecto, contenedor, red, puerto local, bind a D, límites, contenedor detenido), `ENV_GATES.md`.
- `DB_MIGRATIONS_LOG.txt`, `DB_DDL_INDEX_FK.md`, `TENANT_PAT_RESULTS.csv`, `CONCURRENCY_B17_B19_B20.csv` con `CONNECTION_ID`/barrera y hashes/exitcode originales cuando se ejecutaron, `LOGS/` de pruebas focales sin secrets ni PII.
- `DO01_DO12_MATRIX.csv`, `I01_I24_UPDATED.csv`, `RELEASE_GATES.csv`, `OWNER_DECISIONS.md` sin aprobaciones inventadas, `SOURCE_CHANGE_MATRIX.csv`, `SOURCE_HASHES_PRE_POST.csv`, `GIT_CUSTODY.md`.
- Si hubo cambios de producto: `PATCH_CANDIDATE.diff`, `BASELINES/`, `SOURCES/`, replay 1:1. Si no hubo: marcador `NO_PRODUCT_CODE_CHANGE.md` y patch vacío legítimo, **sin copiar las 237 fuentes del WIP para inflar el ZIP**.
- `MANIFEST_SHA256.csv` SHA256 y bytes de todos los archivos distintos del manifiesto, CRC ZIP verificado, sin duplicados ni rutas de extracción inseguras; versión/sistema/fecha/árbol QA rastreable. **NO incluir** `secrets/`, `.env*`, passwords, tokens, `/var/lib/mysql`, volúmenes, bases reales, imágenes o binarios Docker, ni material de otros proyectos. Redactar logs sin borrar prueba de error/exitcode.

**Autorrevisión Codex L1–L6 solo focal:** 1 KISS/una DB, 2 no ruido/ni ajenos, 3 causa raíz, 4 UX no tocada, 5 separar real/host/estático y L5 independiente pendiente, 6 un lote sin pingpong. No generar 20 pasadas de auditoría si no hay nuevo código; el director evaluará el ZIP una sola vez.

**Línea final exigida:**

`TASK_ID=JOR-B21-DB-DOCKER-QA-S1-V1-20261115 | DOCKER_ISOLATION=... | NON_INTERFERENCE=... | DB_CONTAINER_REAL=... | DB_MIGRATIONS_REAL=... | B17_CONCURRENCY=... | B19_CONCURRENCY=... | B20_CONCURRENCY=... | TENANT_PAT=... | B21_S1=PARTIAL/PASS_SCOPED | B21_GLOBAL=NOT_APPROVED | RELEASE_APPROVED=NO | WIP=... | OWN_CONTAINER_STOPPED=... | ZIP_SHA256=... | NEXT_OWNER=CHATGPT_DIRECTOR`

**Siguiente actor tras esta orden: CODEX LUNA.** Después del ZIP, **CHATGPT DIRECTOR** acepta/rechaza solo la evidencia nueva y define las decisiones OD02/OD04/OD03 necesarias para H9. No declarar lanzamiento ni ejecutar B22 automáticamente.

## Fuentes oficiales del método (informativas, no permisos)

- Docker Compose, proyecto aislado y prioridad de `-p`: https://docs.docker.com/compose/how-tos/project-name/
- Compose especificación de puertos `host_ip` y publicación efímera: https://compose-spec.github.io/compose-spec/workload_spec.html
- Docker Compose secrets por archivo: https://docs.docker.com/compose/how-tos/use-secrets
- Imágenes MariaDB y credenciales `_FILE`: https://mariadb.com/docs/server/server-management/automated-mariadb-deployment-and-administration/docker-and-mariadb/mariadb-server-docker-official-image-environment-variables
- MariaDB 11.8 LTS: https://mariadb.org/about/