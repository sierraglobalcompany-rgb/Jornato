# CODEX LUNA — JORNATO · B21-IPAM-RECOVERY S1 V1 · MACROBLOQUE ÚNICO DE DESBLOQUEO SEGURO Y PRUEBAS REALES

**TASK_ID:** `JOR-B21-IPAM-RECOVERY-REAL-DB-QA-20261115`  
**ESTA ES LA ÚNICA ORDEN EJECUTABLE ACTUAL.** No es B21-S2, no es otro informe de 24 oráculos ni una repetición de la auditoría de B21 Docker V2. Resuelve exclusivamente el bloqueo IPAM observado y, **si se supera con seguridad**, ejecuta en el mismo lote las pruebas reales pendientes.  
**Director:** ChatGPT. **Ejecutor:** Codex Luna. **Propietario:** ya autorizó el Docker Desktop instalado **si y solo si no se interfiere con otros proyectos Codex**.  
**Resultado de producto anterior:** `B21_GLOBAL=NOT_APPROVED`, `RELEASE_APPROVED=NO`; NO hay autorización para producción, RR. HH., ATS público, CV reales, nómina comercial, merge o deploy.  
**Entrega:** exclusivamente `D:\codex\_REPORTES\Jornato\JOR-B21-IPAM-RECOVERY-20261115\delivery\JOR-B21-IPAM-RECOVERY-20261115-UNICO.zip` y una respuesta terminal de una línea con ruta, SHA256, resultado y `NEXT_OWNER=CHATGPT_DIRECTOR`.

## 0. Punto de partida VERIFICADO y prohibición de reauditar

El ZIP real `JOR-B21-DB-DOCKER-QA-S1-V2-20261115-UNICO.zip` fue revisado por el director: 34.596 bytes, SHA256 `50FC5D2BA7660742D8892C633DD82780ED39B7D042C1C237BEA0F5BDA99EA739`; 26 entradas, CRC correcto y 25/25 archivos de manifiesto válidos. La ejecución Codex dejó: Engine **29.9.2**, `desktop-linux`, Compose **5.6.1**; imagen oficial `mariadb:11.8.9` **ya descargada** con RepoDigest `mariadb@sha256:d36f18d65a0459510b8b0f643b226a6d299e3206486e2b64ff20754a6d291707`; Compose válido; **un solo** `up -d --no-deps --no-build db` falló antes de crear red o contenedor con `all predefined address pools have been fully subnetted`. El datadir QA está vacío; secretos previamente generados existen en D: y NO se incluirán en ZIP. Había **105 contenedores registrados, 3 en ejecución**, todos los activos con IDs, estado y puertos estables. Las 237 rutas de WIP reportadas conservaron bytes/hashes pre-post; rama `codex/jor-b08-h4-domain-20261025`, HEAD `faf5fe283191f8b5a2724b397009512a2caec1b6`, staged=0. Estas son referencias preexistentes; volver a capturarlas de forma focal, no presumir que siguen iguales.

- No repetir las auditorías B13–B21 ni los 10×VERDUGO/10×JUEZ de B21 Docker V2. Reusar las matrices ya admitidas y reclasificar DO01–DO12 según evidencia real NUEVA.
- No volver a descargar la imagen ni reinstalar Docker; verificar **localmente** que sigue el digest indicado. `pull_policy: never` obligatorio. Si no coincide o no existe, **STOP sin pull adicional** y registrar.
- La causa raíz es **capacidad del asignador automático de subredes**. La solución permitida es **una única subred privada IPv4 explícita, sin solapes comprobados**, dentro de **la red NUEVA y PROPIA** de Compose Jornato. Docker Compose soporta `networks.<nombre>.ipam.config[].subnet` (documentación oficial: https://docs.docker.com/reference/compose-file/networks/).
- **No usar** `docker network prune`, `docker system prune`, `docker volume prune`, `docker network rm` ajeno, `docker rm` ajeno, `docker compose down` ajeno, cambios de `daemon.json` / `default-address-pools`, reinicios Docker Desktop/Engine/WSL, `docker network connect` sobre proyectos ajenos, redes `external`, redes `host` o `bridge` por defecto compartidas, `network_mode: host`, firewall/VPN global, Docker context nuevo o instalación de utilidades pagas.
- No pedir de nuevo autorización para Docker: el propietario la dio explícitamente condicionada al aislamiento. Si no puedes demostrarlo, detente sin cambios compartidos.

## 1. Reglas innegociables L1–L6 y límites

L1 KISS/Ponytail: una MariaDB y una red propia, sin nueva arquitectura, sin microservicios ni persistencia de recursos fuera de D. L2 antirruido: una inspección focal de redes y rutas, **no** retest de módulos cerrados. L3 causa raíz: declarar CIDR verificado en Compose; no cambiar una red ajena ni ocultar el fallo. L4 UX: conservar flujos protegidos, no crear pantallas falsas para simular éxito. L5: separar `PASS_REAL`, `PASS_HOST`, `PASS_STATIC`, `BLOCKED_*`, `NOT_RUN_ENV` y L5 independiente del director; sin log de ejecución => NO PASS. L6 antipingpong: UN intento validado con el CIDR escogido; resolver y continuar en el mismo macrobloque; entregar un solo ZIP y devolver al director.

Prohibido stage/commit/push/merge/rebase/reset/stash/clean/checkout/deploy del repositorio `D:\codex\Jornato`. No borrar/modificar archivos ajenos, credenciales, cachés, AVD ni Docker global. Solo cambios justificados por un defecto NUEVO reproducido contra DB QA, con patch focal y replay de bytes; no corregir migraciones preventivamente. Mantener `B19/B20 DENY-ALL` y el puerto fail-closed de `server/phpunit.xml`; ningún producto comercial se habilita para test.

## 2. Trabajo A — Preflight SOLO lectura y selección de CIDR comprobablemente libre

### A1. Confirmar identidad de Docker y del WIP

1. Desde PowerShell, invocar la CLI Docker **en el contexto ya existente**. Comprobar exactamente `docker context show`, Engine OSType `linux` y versión **>=28.0.0**, Compose, arquitectura, RAM y capacidad de disco, sin tocar configuración global. Si el contexto, daemon o Docker Engine no son los del lote anterior, detenerse y documentar el cambio sin cambiar de contexto automáticamente.
2. Snapshot **solo metadatos** de todos los contenedores (ID, running/health, puertos, etiquetas de proyecto) y métricas CPU/mem de los activos; snapshot total de redes existentes (ID, driver, subredes IPAM). No abrir logs, `env`, mounts, files ni secretos ajenos. Hay 105 contenedores y 3 activos en el corte anterior, pero no utilizar esa cifra como verdad actual: comparar con la lectura nueva.
3. Confirmar que la carpeta `D:\codex\_RUNTIME\Jornato\B21_DOCKER_QA` y la propiedad del Compose, `data`, `secrets` pertenecen solo a Jornato; **NO reescribir los secretos**. Si el `data` ya no está vacío o aparece un contenedor/red con el nombre `jornato_b21_qa_20261115`, examinar **solo propiedad y estado**; no destruir ni reemplazar ningún recurso. Si ya hay instancia propia válida, reutilizarla únicamente tras verificar ID/imagen/red/puerto y propiedad; no lanzar otra.
4. Confirmar `mariadb:11.8.9` local con digest esperado; `pull_policy: never`. Confirmar memoria suficiente (>=1.5 GiB margen), espacio de disco Docker y D: (>2 GiB cada uno después del preflight) y ausencia de degradación de salud de proyectos ajenos.
5. Capturar `git status --porcelain=v1`, branch, HEAD, staged y hashes de tracked+untracked en D:, evitando lectura de contenidos privados en informes; comparar post. Ignored sin baseline **no se declaran idénticos**.

### A2. Descubrir UNA subred IPv4 libre (no inventar IP)

1. En lectura, `docker network ls --no-trunc --quiet` y, para cada ID, consultar SOLO `IPAM.Config` y `Driver` con `docker network inspect --format ...`; recolectar todos los prefijos IPv4 existentes, sin exponer nombres ni endpoints de otros proyectos. Incluir bridge integrado y redes no usadas. Si hay un prefijo no interpretable o no se puede recuperar inventario completo, clasificar `BLOCKED_IPAM_INVENTORY`, NO seguir.
2. En Windows ejecutar **solo en lectura** `Get-NetRoute -AddressFamily IPv4`, `Get-NetIPAddress -AddressFamily IPv4`, y/o `route print -4`. Considerar rutas activas de LAN, Wi-Fi, VPN, WSL, Hyper-V y Docker Desktop. No tratar la ruta universal `0.0.0.0/0` como exclusión de todos los CIDR, pero sí todas las rutas privadas específicas y redes de interfaces. Si es accesible sin privilegiar/modificar, inspeccionar también tablas de rutas de la VM Docker/WSL en lectura; si hay indicio de conflicto sin posibilidad de descartarlo, detenerse.
3. Seleccionar determinísticamente **una** subred `/28` (16 IPv4) privada RFC1918, preferentemente dentro de un bloque verificado libre, comparando intersección de prefijos con TODOS los CIDR Docker y de host/WSL/VPN. Una dirección individual libre NO basta. No hardcodear `172.28.0.0/16`, `172.31.0.0/16`, `192.168.0.0/24` u otra subred sin inspección. No usar direcciones públicas, CGNAT `100.64/10`, loopback, multicast ni link-local. No usar un segmento que pertenezca a otra red aunque no haya contenedor conectado.
4. Para el reporte: **CIDR candidato**, número de redes Docker revisadas, número de rutas host/WSL comprobadas, algoritmo de comparación y hashes/resumen sanitizado de los inventarios; no revelar IPs privadas de otros proyectos que no sean necesarias. Una única prueba de no solapamiento, no exploración activa, no ping a otras redes ni cambios de firewall.
5. Antes de `up`, repetir una **sola** lectura de `docker network ls/inspect` para detectar cambio de inventario desde la selección. Si hay cambio que invalide el CIDR, **STOP**; no probar otros subnets. Si no se obtiene CIDR con pruebas suficientes, entregar `IPAM=BLOCKED_NO_PROVABLY_FREE_SUBNET` con ZIP y preservar a todos.

**Idea técnica:** `networks: qa_internal: driver: bridge; ipam: config: [{subnet: <CIDR_UNICO_VERIFICADO>}]` en YAML, solo para el proyecto `jornato_b21_qa_20261115`. **La subred es un VALOR DESCUBIERTO en tiempo de ejecución**, nunca una constante inventada en este documento. No modificar `default-address-pools` del daemon. Una red propia con IPAM explícito evita pedirle otra subred al asignador automático. La creación sigue sujeta a validación del daemon; no prometer éxito antes de `up`.

## 3. Trabajo B — Corrección focal del Compose propio y UNA ejecución

1. Guardar copia byte-exacta del Compose original en el directorio propio de reportes D:, sin secretos ni cambios de código. Modificar **únicamente** el `ipam.config.subnet` de `networks.qa_internal` dentro del mismo Compose de Jornato. Mantener: `services.db` único, `image:mariadb:11.8.9`, `pull_policy: never`, `restart: "no"`, memoria <=768 MiB, CPU<=1, pids<=128, bind `D:/codex/_RUNTIME/Jornato/B21_DOCKER_QA/data` a `/var/lib/mysql`, dos `secrets` existentes, conexión exclusivamente al bridge propio, exposición `127.0.0.1` con puerto TCP libre/efímero, sin `container_name`, sin `external`, sin `host network`.
2. Usar siempre `docker compose -p jornato_b21_qa_20261115 -f D:\codex\_RUNTIME\Jornato\B21_DOCKER_QA\compose\compose.yaml ...` (ruta absoluta y nombre exacto). Primero `config --quiet` y `config --format json`, validar que **solo existe un servicio db y una red bridge con un solo CIDR explícito**; que no hay interpolaciones/secretos incrustados; que el source real del bind es D:, que solo se refiere a los propios secrets y localhost. Guardar salida REDACTADA y prueba de validación, no passwords.
3. Si todo coincide, ejecutar **UNA VEZ** `docker compose ... up -d --no-deps --no-build db`, respetando `pull_policy: never`; no hacer `--force-recreate`, `--remove-orphans`, `--build`, `down` ni otro intento con subnet diferente. Si falla, preservar evidencia completa de error sin secretos, inspeccionar **solo recursos propios** y STOP; no intentes un segundo CIDR, ningún prune, daemon change o workaround.
4. Si `up` sale 0: registrar los IDs reales de red y contenedor propios, labels `com.docker.compose.project`, red/IPAM CIDR y bindings; verificar que no hay otras redes conectadas al `db`, ni gateway/puerto público; puerto `127.0.0.1:<asignado>`. Ejecutar healthcheck real y `SELECT VERSION(), @@version_comment, @@hostname, @@port, @@transaction_isolation` según versión de MariaDB; comprobar que tabla/DB son de QA. En ausencia de health/SQL NO declarar contenedor PASS.
5. Al terminar QA o ante error posterior, `docker compose ... stop db` **solo** dentro del proyecto Jornato y comprobar `exited`; mantener su data dir y secretos, no borrar contenedor/red/volumen/imagen ni otros servicios. Si el `up` falló sin crear contenedor, `stop` no procede. Registrar post snapshot y comparar los activos ajenos; no atribuir cambios naturales de CPU/RAM mínimos a interferencia si identidades/health/puertos se mantienen.

## 4. Trabajo C — MariaDB REAL y fronteras focales B13–B20 (mismo lote, si B pasó)

### C1. Conectar Laravel de forma segura

1. **Sin modificar** `D:\codex\Jornato\server\phpunit.xml` (puerto 1 fail-closed), `.env`, app live ni config comercial. Usar un **harness temporal de QA aislado** en D:, con variables específicas de proceso: `APP_ENV=testing`, conexión MariaDB realmente soportada por la app (`mysql`/`mariadb` según config comprobada), `DB_HOST=127.0.0.1`, `DB_PORT=<puerto publicado por Compose>`, `DB_DATABASE=jornato_b21_qa`, `DB_USERNAME=jornato_qa`, password desde archivos secretos D: sin mostrar su valor. Probar `PDO_MYSQL`, `SELECT DATABASE(), CURRENT_USER(), CONNECTION_ID(), @@version`; registrar ID/host/puerto redaccionados, comparar con contenedor propio. Si la config PHPUnit/Laravel fuerza DB_PORT=1, no engañar al sistema: modificar **solo la invocación/harness temporal** o declarar `BLOCKED_RUNNER_CONFIG`, sin modificar el fail-closed del producto.
2. Ejecutar exclusivamente migraciones del proyecto contra la **base QA vacía identificada**. Antes de cada operación escritora, comprobar fingerprint de DB propia y que no hay coincidencia con otras DB de Docker. Guardar lista migraciones, resultados/exit codes, DDL real `SHOW CREATE TABLE`, FKs, unique y motores. No suponer FKs compuestas ni añadir índices sin error probado. Si surge bug real y focal, corregir causa raíz en copia controlada del código del producto respetando WIP, preservar baseline y patch; reejecutar SOLO prueba afectada. Si requiere cambios amplios o migración destructiva, stop y reportar `BLOCKED_SCOPE` sin alteraciones.

### C2. Cobertura real priorizada

- **B13/B14/B15/B16:** empresa A y B con empleados/cuentas sintéticas, rechazo lectura/escritura cross-tenant, PAT activo/revocado/expirado si contrato/código permiten correrlo. No inventar login ni vinculación persona-cuenta, registrar `BLOCKED_CONTRACT` si corresponde. Una invocación HTTP kernel es distinta de SQL; informar por capa.
- **B17:** iniciar dos workers PHP independientes **simultáneamente** con la MISMA clave/idempotency/payload y empresa sintéticos, ejecutando el método real existente `PersonalRequestController::store` con un harness de QA que respete autenticación permitida; usar una barrera controlada que haga solapar transacciones. Probar una sola solicitud y un único evento inicial, respuesta reintentada según contrato; misma key con payload distinto => conflicto sin mutación. Registrar `CONNECTION_ID()` de cada worker y resultado de filas/eventos. Si no hay contrato auth aprobado, no exponer route temporal y marcar el escenario controlador `BLOCKED_CONTRACT`; hacer solo pruebas reales posibles sin saltar permisos.
- **B19:** dos workers contra `EmployeeDocumentVault::create/addVersion`, repositorio MariaDB REAL con Storage::fake estrictamente para archivos QA (clasificar `DB_REAL + STORAGE_FAKE`, **NO** producción). Reusar authorizer en QA solo si el proyecto prevé inyección de test legítima; autorizador productivo `DENY-ALL` intacto. Comprobar una versión/evento, unique, retry 200/201/409 cuando aplique, ningún duplicado, hash/datos exactos.
- **B20:** dos workers contra `RecruitmentService::scheduleInterview` de dos vacantes de empresa QA con un mismo entrevistador y tiempo solapado; comprobar bloqueo del contrato contra la misma fila de empresa, un solo resultado activo, otro conflicto o resultado conforme contrato. Nunca abrir ATS público ni CV real.
- **Dos sesiones de DB no son por sí solas test de carrera de aplicación.** Se exige PID/worker, inicio coordinado, barrera, `CONNECTION_ID` distintos, método invocado, respuestas/errores y lectura SQL final. Si no puedes demostrar solape verdadero, `NOT_RUN_CONCURRENCY`, no inventes PASS. No hay que ejecutar otra vez 110+ test históricos ni Flutter/Android para cerrar este lote DB focal.

### C3. Resultado y límites

Reportar `PASS_REAL_DB_SCOPED` solo con SQL/exit codes/DDL reales, `PASS_REAL_CONCURRENCY` solo con ejecución de workers y resultado final reproducible; `PASS_HOST_FAKE`, `PASS_STATIC`, `NOT_RUN_ENV`, `BLOCKED_CONTRACT` por separado. Cualquier prueba de seguridad con fixtures sintéticos es alcance QA, no release. `B21_GLOBAL=NOT_APPROVED`, `RELEASE_APPROVED=NO` incluso si DO01–DO12 son PASS: H9 completo exige hardware, UX, accesibilidad, seguridad, revisión independiente y decisiones propietario OD01–OD08 todavía no aprobadas.

## 5. Matriz DO01–DO12: criterios CONGELADOS, no renumerar ni ablandar

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

Además, un **único control de causa raíz** `IPAM01` exige: inventario Docker completo + rutas host, CIDR `/28` confirmado no solapado, `ipam.config.subnet` del proyecto Jornato, zero cambios a las redes ajenas, estado red después. NO agregar docenas de nuevos tests inventados.

## 6. Salida única: un ZIP reproducible, no archivos dispersos

**Carpeta única de informes:** `D:\codex\_REPORTES\Jornato\JOR-B21-IPAM-RECOVERY-20261115\`. El directorio `delivery` contiene SOLO `JOR-B21-IPAM-RECOVERY-20261115-UNICO.zip`. Dentro incluir como mínimo:

- `FINAL_REPORT.md`: causa original/fix/resultado, imagen/digest, Engine/context, CIDR + evidencia de no solape, salud DB/SQL, estado actual de cada gate, si hubo un único `up`, residuos propios, `NEXT_OWNER=CHATGPT_DIRECTOR`.
- `IPAM_INVENTORY_SANITIZED.csv`, `IPAM_SELECTION.md`, `COMPOSE_DIFF_REDACTED.diff`, `COMPOSE_RESOLVED_REDACTED.yaml`, `OWN_RESOURCE_IDS.md`, `DOCKER_ISOLATION_PRE_POST.csv` y `LOGS/` con comandos, exit codes y stdout/stderr **saneados de secretos y nombres ajenos innecesarios**.
- `DB_MIGRATIONS_LOG.txt`, `DB_DDL_INDEX_FK.md`, `TENANT_PAT_RESULTS.csv`, `CONCURRENCY_B17_B19_B20.csv`, `DO01_DO12_MATRIX.csv`, `I01_I24_DELTA.csv` (solo cambios en estado por evidencia nueva), `OWNER_DECISIONS.md` con OD01–OD08 SIN inventar aprobaciones, `RELEASE_GATES.csv`.
- `GIT_CUSTODY.md`, `SOURCE_HASHES_PRE_POST.csv`, `SOURCE_CHANGE_MATRIX.csv`, `PATCH_CANDIDATE.diff` y `SOURCES/` **solo si realmente se cambió código**; si no hay cambios, patch 0 bytes explícito. No sustituir WIP ni afirmar identidad de archivos ignored sin hashes de base.
- `MANIFEST_SHA256.csv` de todos los demás archivos con bytes+SHA256, CRC verificado de cada entrada y protección contra `../`, symlinks y nombres duplicados. Confirmar ZIP SHA256/tamaño después de serializar; presentar el checksum en respuesta, no confiar solo en log interno.

**Fuera del ZIP:** secretos/passwords/keys/tokens, datadir MariaDB, `.env`, rutas de otros proyectos, dump de tablas reales, contenedores ajenos y datos personales. No subir ZIP ni WIP a GitHub. No pedir más autorizaciones si el alcance Docker sigue exactamente dentro de lo ya autorizado. Si no hay CIDR libre verificable, informar `IPAM_BLOCKED` y detener sin hacer otra auditoría o probar variantes.

## 7. Criterio de cierre y siguiente responsable

- `PASS_SCOPED_REAL_DB` exige red propia creada sin solapes, MariaDB healthy + SQL, migración real y QA verificable por logs; sin ello resultado `PARTIAL` con causa exacta.
- `PASS_SCOPED_CONCURRENCY` se otorga **por caso**, no de forma global, solo con dos workers simultáneos reales. 3/3 no se presume.
- `NON_INTERFERENCE` requiere IDs/health/puertos ajenos pre/post iguales en la ventana documentada, **sin afirmar aislamiento físico absoluto**.
- Ningún resultado autoriza B22. Dejar explícito qué falta para H9 global y propietario.
- Respuesta final de Codex: `TASK_ID=... | IPAM=... | DB_REAL=... | B17/B19/B20_CONCURRENCY=... | OTHER_CONTAINERS=... | PRODUCT_WIP=... | RELEASE_APPROVED=NO | ZIP=... | ZIP_SHA256=... | NEXT_OWNER=CHATGPT_DIRECTOR`.

## Fuentes públicas verificadas por el director

- Docker Compose red IPAM con subnet explícita: https://docs.docker.com/reference/compose-file/networks/
- Docker Compose networking y redes de proyecto: https://docs.docker.com/compose/how-tos/networking/
- Inventario de IPAM: https://docs.docker.com/reference/cli/docker/network/inspect/
- Docker Engine bridge y aislamiento: https://docs.docker.com/engine/network/drivers/bridge/

**NO enviar un prompt de solo auditoría. EJECUTAR LA RECUPERACIÓN IPAM Y LAS PRUEBAS REALES EN UN MACROBLOQUE, RESPETANDO TODOS LOS CORTAFUEGOS.**
