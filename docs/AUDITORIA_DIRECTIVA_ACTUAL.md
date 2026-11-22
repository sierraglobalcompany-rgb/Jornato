# JORNATO — Dictamen independiente B21 Docker QA V2; causa IPAM y continuación productiva única

**Fecha:** 2026-11-15, America/Bogota. **Director:** ChatGPT. **Ejecutor siguiente:** Codex Luna.  
**Fuente primaria:** ZIP adjuntado `JOR-B21-DB-DOCKER-QA-S1-V2-20261115-UNICO.zip`.  
**ZIP SHA256 independiente:** `50FC5D2BA7660742D8892C633DD82780ED39B7D042C1C237BEA0F5BDA99EA739`.  
**Estado adjudicado:** `B21_DB_DOCKER_QA=PARTIAL`, `DB_CONTAINER_REAL=BLOCKED_NETWORK_IPAM`, `B21_GLOBAL=NOT_APPROVED`, `RELEASE_APPROVED=NO`.

## 1. Qué fue comprobado realmente

En runtime de ChatGPT se abrió el ZIP físico recibido: **34.596 bytes, 26 entradas ZIP, CRC válido, sin duplicados ni rutas peligrosas, 25/25 archivos del manifiesto con tamaño y SHA256 exactos**. `SOURCE_HASHES_PRE_POST.csv` contiene 237 filas con bytes, hashes y estados de archivo pre/post iguales, `result=UNCHANGED`; esto demuestra consistencia de la **declaración embebida**, NO que ChatGPT haya inspeccionado directamente las 237 rutas en Windows. `PATCH_CANDIDATE.diff` tiene 0 bytes y no se declararon cambios de producto. La inspección no ejecutó Docker, PHP, MariaDB ni concurrencia.

Los logs de Codex conservados en el ZIP reportan: `desktop-linux`/Engine 29.9.2/Compose 5.6.1; `mariadb:11.8.9` descargada una vez con digest `sha256:d36f18d65a0459510b8b0f643b226a6d299e3206486e2b64ff20754a6d291707`; un Compose con un `db`, secrets propios, red `qa_internal`, puerto exclusivamente `127.0.0.1`, bind en D:, límites 768 MiB/1 CPU/128 PID. El **único** `up -d --no-deps --no-build db` devolvió código 1 con texto `all predefined address pools have been fully subnetted`. La red/contenedor de Jornato NO se crearon, sin puerto de host ni datadir inicializado. Logs pre/post: 105 contenedores registrados, 3 activos ajenos con IDs, estados, puertos conservados durante la ventana; sin `prune`, `down` ni acciones sobre ellos.

### Clasificación de DO01–DO12 (exactamente la del ZIP)

| Clasificación | Oráculos | Total |
|---|---|---:|
| `PASS_REAL_SCOPED` (según evidencias de Codex) | DO01, DO11, DO12 | 3 |
| `BLOCKED_CAPACITY` | DO02 | 1 |
| `PARTIAL` | DO03 | 1 |
| `NOT_RUN_ENV` | DO04–DO10 | 7 |

**No se ejecutaron** migraciones, SQL de tenant o PAT, ni los tres casos de concurrencia de los servicios B17/B19/B20. I01–I24 no pasan automáticamente. La custodia del WIP y la salud de contenedores ajenos son evidencia reportada mediante logs; no se observaron los sistemas Windows desde ChatGPT.

## 2. Causa raíz adjudicada

El error pertenece al **asignador de redes IPAM automático de Docker**, no al binario de MariaDB ni a las migraciones de Jornato. El pool predeterminado agotado no implica que no pueda existir una subred IPv4 privada explícita disponible. Docker Compose documenta `networks.<name>.ipam.config[].subnet`. Pero un CIDR arbitrario puede solaparse con redes Docker, rutas del host, WSL o VPN y afectar los otros proyectos. La única recuperación autorizada es **elegir un CIDR /28 tras inventariar todas las subredes y rutas relevantes en modo lectura**, escribirlo en la red EXCLUSIVA del Compose de Jornato y realizar una sola tentativa, si y solo si no hay solapes demostrados. No elegir un rango fijo desde ChatGPT: no se dispone del inventario real del equipo.

- Alternativas RECHAZADAS: `docker network prune` / eliminar redes "sin uso" (pueden pertenecer a trabajos ajenos), reiniciar Docker Desktop/WSL, reconfigurar `daemon.json`/`default-address-pools`, conectarse a redes de otro proyecto, usar `network_mode: host` o `bridge` compartido, probar CIDRs por fuerza bruta, volver a descargar MariaDB.
- Solución seleccionada: mantener **un** Compose propio `jornato_b21_qa_20261115`, `qa_internal` bridge con IPAM explícito, imagen ya descargada/digest conocido, credenciales y datadir ya generados bajo `D:\codex\_RUNTIME\Jornato\B21_DOCKER_QA`; conservar loopback y un solo servicio.
- Si no se encuentra un CIDR seguro o Docker lo rechaza: detener, describir razón, **no tocar daemon/redes ajenas**. El aislamiento de red no equivale a aislamiento absoluto de RAM/CPU/disco; conservar límites y comparar contenedores ajenos antes/después.

## 3. Orden aprobada para continuar en lugar de repetir auditorías

El director entrega **solo** `CODEX_LUNA_JORNATO_B21_IPAM_RECUPERACION_Y_QA_REAL_MACROBLOQUE_UNICO_20261115.md`, TASK_ID `JOR-B21-IPAM-RECOVERY-REAL-DB-QA-20261115`. Es una continuación de ejecución, no una auditoría nueva de B13–B21. Usa los **12 criterios DO01–DO12 congelados**; añade un solo control causal IPAM01 para justificar el rango elegible. Si la base arranca, Codex sigue sin otro prompt con: migraciones InnoDB reales, SQL tenant/unique/FK, PAT si hay contrato legítimo y carreras de **dos workers PHP reales** sobre B17, B19 y B20. Un par de `CONNECTION_ID()` sin llamadas reales a servicios NO es PASS de concurrencia. Mantener `DENY-ALL` de B19/B20, `phpunit.xml` fail-closed y todo código WIP previo.

**Entrega única esperada:** `JOR-B21-IPAM-RECOVERY-20261115-UNICO.zip` con logs, inventario IPAM saneado, subred elegida con razón verificable, Compose diff, health SQL, matriz DO/I, barrera/2 workers, comprobación pre/post de otros contenedores y manifiesto. Sin secretos, `data`, Docker ajeno ni producto comercial. Si hay defecto de código realmente reproducido se admite solo arreglo de causa raíz con patch reproducible y baseline; nunca reescribir WIP por intuición.

## 4. GATES, propiedad y próximo responsable

- `NEXT_OWNER=CODEX_LUNA`: autorización del propietario para Docker instalado con **aislamiento estricto** ya existe. No pedir de nuevo permiso para ese uso exacto.
- Después del ZIP, `NEXT_OWNER=CHATGPT_DIRECTOR`: adjudicación **focal de evidencia nueva**; no rehacer auditorías 10+10 ni pruebas B13–B20 ya cerradas salvo efecto de cambio real.
- OD01–OD08 de privacidad/identidad/roles/portal/ATS/firma/salarios/facturación continúan SIN aprobar; no inferir respuestas. H9 QA integral (110+ escenarios) y L5 independiente de producto siguen pendientes; no declarar B22/release.
- PR #2 es documental, `main` no contiene el WIP local completo y NO se autorizan stage/commit/push/merge/deploy de código.

**Fuentes externas para el mecanismo**: https://docs.docker.com/reference/compose-file/networks/ ; https://docs.docker.com/reference/cli/docker/network/inspect/ ; https://docs.docker.com/compose/how-tos/networking/ .
