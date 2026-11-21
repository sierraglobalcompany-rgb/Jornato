# CODEX LUNA — JORNATO: MACROBLOQUE POST-N4 DOCKER · **BORRADOR CONDICIONAL — NO EJECUTAR AHORA**

> ⚠️ **PROHIBIDO ENVIAR A CODEX MIENTRAS N4 ESTÉ EN CURSO.** Este documento es una preparación del Director, **NO LA ORDEN ACTIVA**. Se hará ejecutable SOLO después de que ChatGPT reciba, verifique y adjudique el ZIP N4 y emita explícitamente `ACTIVATED_BY_DIRECTOR=YES`, con el alcance real que quede pendiente. La orden N4 actual permanece en `docs/CODEX_LOTE_ACTUAL.md` sin cambios.

```text
DRAFT_TASK=JOR-POST-N4-DOCKER-SERVER-GATE-PENDING
STATUS=NO_EJECUTAR
ACTIVATED_BY_DIRECTOR=NO
START_ONLY_AFTER=N4_ZIP_VERIFIED_AND_DIRECTOR_RELEASE
WIP_ROOT=D:\codex\Jornato
OUTPUT_PRIVATE_ROOT=D:\codex\_REPORTES\Jornato\POST-N4-DOCKER-ISOLATED-QA
DOCKER_ENGINE=USER_REPORTED_NOT_VERIFIED
SERVER_QA_REQUIRED=ONLY_IF_N4_DOCKER_E2E_NOT_ALREADY_VERIFIED
ANDROID_NATIVE=NOT_AUTHORIZED
PUBLISH_WIP=NO
B22=NOT_AUTHORIZED
RELEASE=NO_GO
```

## 0. Regla de activación — anti pingpong

- Si N4 sigue en vuelo, si otro Codex toca `D:\codex\Jornato`, si no hay ZIP recibido y adjudicado, **STOP antes de ejecutar una sola acción**.
- Si N4 ya dio **PASS real** de aislamiento Docker PHP/MariaDB y 8 casos E2E a mismo SHA/entorno, **no repetir** este bloque; Director pasa a las puertas restantes.
- Si N4 terminó con falta de Docker o QA no conforme, usar el **resultado y SHAs reales** de N4 para fijar el único subconjunto pendiente; nunca ejecutar por defecto todo el borrador.
- Solo Director puede sustituir `DRAFT_TASK` por un TASK único y completar el registro de gates heredados. No usar varios prompts para la misma causa.

## 1. Aislamiento Docker vinculante

**Ley nueva del propietario:** PHP, Artisan, Composer/PHPUnit y MariaDB únicamente en contenedores **propios de Jornato**. Host Windows permitido solo para lectura estática, hashing, Python seguro y comandos Docker cliente; no levantar servicios PHP o MariaDB host. Docker existente reportado; comprobarlo. L1–L6 PingPongLaw conservadas.

### Preflight obligatorio de solo lectura (en esta secuencia)

1. Reconciliar la entrega N4: `HEAD`, SHA del candidato completo, cobertura backend, migraciones y E01–E08. Registrar solo GAPS, no repetir matrices N1/N2/N3 o certificaciones aprobadas.
2. Comprobar exclusividad de WIP y hashes PRE/POST (cero stage) sin `git add/checkout/reset/stash/clean/merge/fetch/push`. Candidato de trabajo en ubicación `private` fuera del WIP con fuentes y config QA sintéticas, sin `.env*`, llaves o PII.
3. Desde Docker CLI: `docker version`, `docker compose version`, `docker info`, `docker ps -a`, `docker network ls`, `docker volume ls`, `docker image ls`, todos como **consultas**. No registrar en ZIP el `docker info` o `docker inspect` sin sanear; podrían contener detalles privados.
4. Antes de crear recursos: revisar proyectos Compose existentes por labels y comprobar que el nombre propio elegido no existe. Formato `jornato-qa-<identificador>`; usar `docker compose -p <nombre>` **para cada operación**, sin `COMPOSE_PROJECT_NAME` heredado que lo contradiga.
5. Si no hay Docker daemon, versión/image compatible precargada, espacio o IPAM suficiente: `BLOCKED_DOCKER`, `BLOCKED_IMAGE_CACHE`, `BLOCKED_RESOURCES` o `BLOCKED_DOCKER_IPAM`; sin pulls, network prune, daemon restart, cambio de pools, enlaces a red ajena ni reintentos ciegos. Entregar evidencia causal en el ZIP único.

### Stack mínimo (solo si preflight PASS y no existe configuración propia válida)

- Reutilizar definición Compose **ya existente en el código** si cumple los criterios. Si no existe, permitir **un** Compose efímero QA en `private` para un servicio `php` y uno `db`, sin proponer microservicios, redis, docker socket montado ni sidecars. Elegir imágenes y extensiones desde `composer.lock`/runtime real, **no** inventar Laravel 13 ni tags latest.
- Red Compose privada con nombres prefijados; sin red `external`. PHP comunica a `db` por DNS interno. Base SQL sin puerto publicado al host. Si tests HTTP requieren host, solo PHP en 127.0.0.1 con puerto libre verificado.
- Volumen/dir de datos DB NUEVO y exclusivo, etiquetado para la campaña; no `external`, no bind mount de datadir ajeno, no Docker socket, no contenedores de otros proyectos. Variables de DB generadas sintéticamente **solo en private**, fuera de fuentes y ZIP.
- Versionar conceptualmente PHP y MariaDB requeridos; comprobar disponibilidad de imágenes locales ANTES de `up`. Build o pull a internet NO AUTORIZADO; si falta artefacto, `BLOCKED_IMAGE_CACHE`.
- Limitar recursos de manera compatible con otros proyectos: si CPU/RAM/espacio no bastan, STOP sin tocar Docker global. Sin puertos fijos asumidos ni service names globales.

## 2. Una ejecución QA real, con límite de reintentos

1. Comprobar `docker compose -p <nombre> -f <archivo> config` en ubicación privada y revisar **sin imprimir secretos**; verificar `external=false`, red propia, volumen DB nuevo, puertos localhost y nombre de proyecto. Sin configuración fiable: STOP.
2. Un `up` de recursos propios solamente. Si falla IPAM/puerto/permisos: STOP causal. No intentar 5 redes ni cambiar daemon. Capturar nombres/labels propios, PIDs/contenedores, puertos (si aplica), versiones y exit codes sanitizados.
3. Crear únicamente **DB QA sintética** verificando servicio `db` interno, identidad de volumen/usuario/nombre de esquema. PHP se ejecuta con env QA explícito, no `server/.env` de producción.
4. En contenedor PHP Jornato: verificar runtime/extensiones, dependencias **preexistentes** y carga segura. Migrar solo nueva DB QA. Nunca `migrate:fresh`, `db:wipe`, datos laborales, credenciales reales, cron/prod ni proveedores externos.
5. Usar contrato de rutas **real** de Laravel; ejecutar solo E01–E08 no acreditados por N4: anónimo; A→A; A→B read; A→B write no mutación; PAT revocado; reintento igual; reintento incompatible; `SERVER_STORED` no `RECOGNIZED`. Medir efectos DB para denegación e idempotencia. OD02/03/04 pendientes permanecen `BLOCKED_CONTRACT`, nunca inventar endpoints.
6. Si falla caso reproducible en código propietario, corregir causa con PRE/POST y un solo ciclo focal de regresión; preservar fuentes y WIP, no repetir 158/2450 por rito. Si falla infraestructura, clasificar `BLOCKED_...` y cerrar QA, continuar evidencia estática si independiente.
7. Limpiar **únicamente** recursos cuya pertenencia al Compose de esta campaña esté probada, previa retención de evidencia. Preferir conservar el volumen de prueba hasta que el Director adjudique el ZIP. Prohibidos `docker system/network/volume prune` y `docker compose down --volumes` por defecto.

## 3. Única entrega sanitaria

Un ZIP único con `FINAL_REPORT.md`, `DOCKER_PREFLIGHT.csv`, `DOCKER_OWNERSHIP.csv`, `ENVIRONMENT_FINGERPRINT.md`, `QA_DB_ISOLATION.md`, `E2E_RESULTS.csv`, `N4_REUSE_LEDGER.csv`, `BLOCKERS.md` si aplica y `MANIFEST_SHA256.csv`; logs focales redactados si son indispensables. Fuentes, DB, contraseña, `.env`, `docker inspect` sin redacción, secrets, DDL con datos, tokens, identificadores reales y patch solamente en `private`. Validar hash de ZIP, CRC, miembros, tamaños, manifiesto y path traversal.

```text
POST_N4_DOCKER_QA=PASS_SCOPED_DOCKER|PARTIAL_WITH_GAPS|BLOCKED_DOCKER_IPAM|BLOCKED_DOCKER|BLOCKED_IMAGE_CACHE|BLOCKED_SOURCE|BLOCKED_CONTRACT|NOT_RUN
PHP_RUNTIME=DOCKER_ONLY|NOT_RUN
DB_RUNTIME=DOCKER_ONLY|NOT_RUN
COMPOSE_OWNERSHIP=PASS|BLOCKED|NOT_RUN
NO_OTHER_PROJECT_MUTATED=VERIFIED_SCOPED|UNKNOWN
HOST_PHP_DB_RUN=NO
WIP_STAGE=0
BACKUP_OFF_DEVICE=NO_UNLESS_OWNER_AUTHORIZED_AND_PROVEN
ANDROID_NATIVE=NOT_RUN
RELEASE=NO_GO
NEXT_OWNER=CHATGPT_DIRECTOR
```

**ESTADO DE ESTE DOCUMENTO:** `DRAFT_ONLY`. **NO enviarlo a Codex ni ejecutarlo durante N4.** Cuando llegue ZIP N4, Director elimina actividades acreditadas, adapta IDs/SHAs y decide si este bloque es necesario. Si no lo es, se archiva sin ejecutar.