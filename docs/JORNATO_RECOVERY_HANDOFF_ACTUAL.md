# JORNATO — RECOVERY HANDOFF ACTUAL · N7 · 21-NOV-2026

**RECUPERACIÓN DE CHAT:** primero [continuidad vigente](JORNATO_CONTINUIDAD.md), luego [orden ejecutable Codex N7](CODEX_LOTE_ACTUAL.md), luego [dictamen real N6-R2](JORNATO_N6_R2_DICTAMEN_Y_N7_20261121.md). **N6 cerrado.** Si existe ZIP N7, adjudicarlo antes de crear otra tarea. No revivir N5 ni N6, no repetir suites aprobadas ni 20 pasadas anteriores.

## Verdad probada

- **N6 ZIP** adjuntado SHA256 `664724B357008753353065F804817A990CEDE6FE5E6B41BEE2A5AF6A327B5AF4`, 7.742 bytes, 9 miembros CRC PASS, manifest 8/8 HASH+BYTES PASS **verificados directamente**. Las ejecuciones PHP son **evidencia sanitizada de Codex**, no acceso del Director al Docker real.
- `N6_IMAGE_PREFLIGHT=PASS`, pero **cuatro fallos independientes**: original PHP 8.3 (`/bin/sh`, `php`) `exec format error`; alternativa PHP 8.4 (`/bin/sh` `exec format error`, PHP `input/output error`), todas exit 255. Ambos IDs y daemon reportan linux/amd64; no afirmar arquitectura errónea o corrupción como hecho. ID vs RepoDigest requiere verificación real.
- N6 `N6_DOCKER_ISOLATION=NOT_RUN`, `N6_DB=NOT_RUN`, E01–E08 `NOT_RUN`; 0/8 PASS, no auténtico PDO/migraciones/Laravel. No nuevas redes, volúmenes ni contenedores N6 permanentes según pre/post. Docker global no se cambió.
- WIP según Codex HEAD `faf5fe...`, 235 status (11 modified, 224 untracked), staged 0, index SHA `25CC609803D7E68D5F3ECF428198B2432CF1EA37030546735DD3F03299D905E1` sin cambios; candidato Laravel privado, 150 rutas servidor. N5 Flutter candidato host PASS reused; no rerun. **NO** backup off-device, no Android QA nativa, release NO_GO.

## Siguiente única orden N7

**Codex** `JOR-N7-PHP-IMAGE-BYTES-ROOT-CAUSE-20261121`: examinar bytes **sin ejecutar** imagen PHP 8.3 y opcional 8.4 desde contenedor DETENIDO propio usando Docker create/cp/remove; comprobar ELF para distinguir archivo incorrecto/ilegible vs runtime/almacenamiento; cotejar Image ID vs RepoDigest y proteger todos los proyectos concurrentes. Un ZIP. **NO** `docker run`, PHP/Laravel/DB/Flutter, nueva red, pull, build, prune, restart, WSL shutdown, inspección de otros proyectos, modificar WIP, ni subir archivos privados. Decidir próxima autorización **solo tras el ZIP**.

**Programa:** Flutter Gratis Local + Pro SQLCipher/outbox; Laravel/Sanctum/MariaDB con tenant/PAT; B19/B20 deny-all; OD02/03/04 aún pendientes, `requestId`/`requetId` y `SERVER_STORED` distinto de `RECOGNIZED`. PingPongLaw L1–L6, KISS. Varios proyectos en paralelo exigen Docker aislado por proyecto. GitHub `sierraglobalcompany-rgb/Jornato` PR #2 es **solo documentos**; PR #1/#3 F0 Draft, main sin tocar.

**DECISIÓN:** si binarios ilegibles → permiso focal de refresh de imagen oficial; si headers válidos → coordinar diagnóstico/mantenimiento Docker Desktop compartido **sin reinicio unilateral**. Si no se puede inspeccionar, STOP con bloqueo exacto. **NEXT_OWNER_NOW=CODEX_LUNA_N7; AFTER_ONE_ZIP=CHATGPT_DIRECTOR; RELEASE=NO_GO.**
