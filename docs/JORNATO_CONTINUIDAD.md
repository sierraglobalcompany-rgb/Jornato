# JORNATO — CONTINUIDAD CANÓNICA · 21-NOV-2026 · N6 CERRADO / N7-R1 CONDICIONAL

**Orden única para Codex Luna:** [CODEX_LOTE_ACTUAL.md](CODEX_LOTE_ACTUAL.md) = `JOR-N7-PHP-IMAGE-BYTES-ROOT-CAUSE-20261121`, `PROMPT_REVISION=N7-R1-20261121`. **EJECUTAR N7-R1 SOLO SI N7 original NO ha empezado.** Si ya empezó N7, hay ZIP N7 o el estado es ambiguo, **NO iniciar una segunda corrida**: conservar ejecución/ZIP original y pasarlo a ChatGPT Director. N7-R1 reemplaza un defecto técnico del lector ELF de N7 original; **NO crea N8**. No repetir auditorías ya aprobadas.

## Evidencia N6-R2 auténtica y límite de inferencia

- ZIP real recibido y leído `JOR-N6-PHP-RUNTIME-CAUSE-ISOLATED-QA-20261121-UNICO.zip` SHA-256 `664724B357008753353065F804817A990CEDE6FE5E6B41BEE2A5AF6A327B5AF4`, 7.742 bytes, 9 miembros CRC PASS y 8/8 manifiesto. `RESULT=BLOCKED`, `N6_IMAGE_PREFLIGHT=PASS`, `N6_PHP_IMAGE=BLOCKED_PHP_IMAGE_EXEC`, `N6_DOCKER_ISOLATION=NOT_RUN`, `N6_DB=NOT_RUN`, `E2E=0/8`, `PRIVATE_FIX=NONE`, `WIP_GUARDS=PASS_UNCHANGED` según ZIP.
- PHP 8.3 `sha256:232331112d3a7c5b98edeeddc3b85f610172f99352c0635fe6b3e166e47062cb`: shell y PHP dieron `exec format error`. PHP 8.4 `sha256:b3e907a1108629c562c4bb313ce3449e34d49991f6bb2487913f6146f47200fe`: shell `exec format error` y PHP `input/output error`. Daemon/imágenes `linux/amd64` reportados, pero la causa inferior (archivos/capas/almacenamiento/runtime) sigue **no demostrada**.
- Reporte N6: 109 contenedores/42 redes/97 volúmenes PRE/POST sin cambio; N6 no creó Compose ni DB, cuatro sondas efímeras `--rm`. **Son datos históricos reportados**, no comprobación actual del host.
- N5 Flutter `PASS_CANDIDATE_SCOPED` (lock Pub validado y 9/9 KioskScreen en candidato). N4 fuentes privadas con 232 archivos y 150 de servidor por reportes Codex, sin contenido en ZIP. No repetir N2 86 host, N3 9+4, backend histórico B21F-S3 158/2450, Pub N5 o N6 cuatro pruebas PHP.
- WIP `D:\codex\Jornato`, rama `codex/jor-b08-h4-domain-20261025`, HEAD `faf5fe283191f8b5a2724b397009512a2caec1b6`, status 235 (11 modificadas/224 untracked), staged 0, índice SHA `25CC609803D7E68D5F3ECF428198B2432CF1EA37030546735DD3F03299D905E1` PRE/POST según Codex. No se ha publicado código avanzado, ni hay respaldo off-device.

## Delta nuevo y único N7-R1

- [Auditoría focal 10 verdugo + 10 juez](JORNATO_N7_R1_AUDITORIA_10_VERDUGO_10_JUEZ_20261121.md): N7 original clasificaba un ELF falso de 64 bytes como correcto; el defecto fue **reproducido directamente** en entorno ChatGPT. El nuevo lector verifica segmentos y tamaños. Se probaron 6 casos en ChatGPT, **no** Docker del propietario.
- El comando de creación usa **`docker container create --pull never --network none --read-only`** por ID inmutable local, no ejecuta PID1, no descarga ni crea red. `docker cp -L` únicamente `/bin/sh` y `/usr/local/bin/php` desde contenedor **detenido, propio y etiquetado**. Limpiar en `finally` por nombre, label, ID e imagen, con `CLEANUP_PARTIAL` ante duda; no se permite prune ni tocar recursos de otro proyecto.
- Primero imagen PHP 8.3; alternativa PHP 8.4 **únicamente si la primera deja incertidumbre que cambie la decisión**. Nunca más de dos imágenes ni pruebas `docker run`. Resultados permitidos: `IMAGE_BYTES_STRUCTURE_BAD_SCOPED`, `IMAGE_FILE_READ_FAIL_OR_PARTIAL`, `ELF_STRUCTURE_PLAUSIBLE_RUNTIME_UNRESOLVED`, `BLOCKED_PRECHECK_OR_CLEANUP`. Si headers/segmentos parecen válidos, **no certificar runtime** ni afirmar que Docker Desktop es la causa.
- Retorno: un solo ZIP sanitario, manifiesto SHA-256/CRC, evidencia de ID/digest/estructura/WIP/custodia y UNA reparación propuesta **condicionada a permiso del dueño**. Binarios y logs privados quedan en D:, no en ZIP ni GitHub.

## Seguridad, gobernanza y siguiente dueño

PHP/DB solo Docker exclusivo por proyecto; Windows tiene varios agentes y otros proyectos activos. Prohibido reinicio Docker/WSL, cambios IPAM, `prune`, `pull`, eliminación de imágenes ajenas, migración de DB y código/PR de producto. `requestId`/legado `requetId`; `SERVER_STORED` distinto de `RECOGNIZED`; OD02/03/04 pendientes; B19/B20 deny-all; `B22=NOT_AUTHORIZED`, Android nativo aún sin certificar, `OFF_DEVICE_BACKUP=NO`, `H9_GLOBAL=NO_GO`, `RELEASE=NO_GO`. El trabajo N7 **NO** abre rutas ni habilita staging.

**Repos GitHub:** `sierraglobalcompany-rgb/Jornato`, `main` `1ee6aae821f8cf177cc64149081ad8847f7fec2e`, PR #1 Draft Flutter F0 HEAD `faf5fe283191f8b5a2724b397009512a2caec1b6`; PR #3 Draft apilado HEAD `104469b119752f395cf9881e732d582feab9db4e`; PR #2 documental, sin WIP. No merge/push de código.

**NEXT_OWNER_NOW=CODEX_LUNA_N7_R1_IF_N7_NOT_STARTED. AFTER_ZIP=CHATGPT_DIRECTOR.** No mandar otra auditoría 10+10 ni crear otro prompt hasta adjudicar el ZIP N7.
