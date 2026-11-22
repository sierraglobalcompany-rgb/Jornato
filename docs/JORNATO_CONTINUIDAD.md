# JORNATO — CONTINUIDAD CANÓNICA · N6-R2 CERRADO / N7 ACTIVO · 21-NOV-2026

**ÚNICA ORDEN CODEx ACTIVA CUANDO SE ENTREGUE AL EJECUTOR:** [CODEX_LOTE_ACTUAL.md](CODEX_LOTE_ACTUAL.md), `TASK=JOR-N7-PHP-IMAGE-BYTES-ROOT-CAUSE-20261121`. **N6-R2 ya terminó con `BLOCKED`; no retomarlo**. Si N7 ya se inició o existe ZIP N7, no ejecutar de nuevo, adjudicar su retorno. [Dictamen real N6-R2](JORNATO_N6_R2_DICTAMEN_Y_N7_20261121.md). Evitar repeticiones y ping-pong.

## Hechos N6 verificados (al recibir ZIP adjunto)

- ZIP `JOR-N6-PHP-RUNTIME-CAUSE-ISOLATED-QA-20261121-UNICO.zip` tamaño 7.742 bytes, SHA256 `664724B357008753353065F804817A990CEDE6FE5E6B41BEE2A5AF6A327B5AF4`, 9 miembros CRC OK y 8/8 manifest SHA+bytes OK, **verificados directamente en ChatGPT**.
- Docker `N6_IMAGE_PREFLIGHT=PASS_SCOPED`; daemon e imágenes cacheadas reportan Linux/amd64, **no demuestra ejecución**. PHP imagen original 8.3 `/bin/sh` y `php -v` fallan con `exec format error`; alternativa 8.4 `/bin/sh` `exec format error`, PHP `input/output error`, 4 sondas exit 255. **No se probó Laravel**, no asumir corrupción o mismatch CPU sin evidencia del archivo binario.
- Image IDs reportados: original `sha256:232331112d3a7c5b98edeeddc3b85f610172f99352c0635fe6b3e166e47062cb`; alternativa `sha256:b3e907a1108629c562c4bb313ce3449e34d49991f6bb2487913f6146f47200fe`. Verificar **Image ID vs RepoDigests** por separado: informe N6 los presenta iguales sin prueba de equivalencia.
- `N6_DOCKER_ISOLATION=NOT_RUN`, `N6_DB=NOT_RUN`, 8/8 E2E `NOT_RUN`, PHP/extensions/PDO/migraciones sin ejecutar. Las 4 sondas se hicieron sin red y contenedores `--rm`, inventario PRE/POST sin delta según Codex. No tocar Compose/volumen preservados N5.
- WIP (según Codex): `D:\codex\Jornato`, rama `codex/jor-b08-h4-domain-20261025`, HEAD `faf5fe283191f8b5a2724b397009512a2caec1b6`, 235 status (11 modified/224 untracked), staged=0, índice SHA `25CC609803D7E68D5F3ECF428198B2432CF1EA37030546735DD3F03299D905E1` sin delta.
- Flutter N5 `PASS_CANDIDATE_SCOPED_REUSED`; no rerun, 9/9 UI host. N4 candidato 232 archivos/paridad reportada, 150 server. B21F-S3 158/2450 PASS scoped histórico. No es certificación nativa. `OFF_DEVICE_BACKUP=NO`, `ANDROID_NATIVE=NOT_RUN`, `H9_GLOBAL=NO_GO`, `B22=NOT_AUTHORIZED`, `RELEASE=NO_GO`.

## N7: un solo diagnóstico de imagen (NO otra prueba de Laravel)

1. Preflight contexto/IDs/volúmenes y WIP read-only. No interrumpir ni compartir contenedores/redes/volúmenes de otros proyectos Codex; Docker Engine es multi-proyecto.
2. **Original PHP 8.3, y solo si hace falta alternativa 8.4:** contenedor **detenido** N7 por `docker create --network none`, `docker cp -L` de `/bin/sh` y `/usr/local/bin/php`, `docker rm` **solo del recurso propio**, sin ejecutar contenedor, PHP ni binario host. Inspección estática ELF x86_64 y hashes en privada; no incluir binarios en ZIP.
3. Diferenciar imagen incorrecta/inaccesible de headers ELF válidos con runtime bloqueado. Proponer **un único permiso concreto pendiente del propietario** para recuperación puntual de imagen oficial o intervención administrada Docker Desktop/almacenamiento. **No ejecutar reparaciones globales, pull, prune, restart, IPAM ni modificar otras apps.**
4. **Un ZIP** sanitario SHA256+CRC+manifest, sin código, secretos, raw inspect ni logs de otros proyectos. Si hay bloqueo, reportar causa exacta; no inventar PASS ni iniciar N8 automáticamente.

## Reglas invariables y GitHub

- ChatGPT Director decisiones, Codex Luna manos. Leyes L1 KISS/simple, L2 cero ruido, L3 causa raíz, L4 UX humana, L5 evidencia comprobable, L6 antipingpong. PHP + BD solo Docker aislado **por proyecto**. B19/B20 deny-all. `requestId` y legado `requetId` se respetan, `SERVER_STORED != RECOGNIZED`. OD02/03/04 pendientes, no apertura de permisos.
- Repo **público** `sierraglobalcompany-rgb/Jornato`. PR #2 documental; no subir WIP avanzado, merge, push o desplegar producción sin revisión de secretos, backup fuera de D: y autorización. Main `1ee6aae821f8cf177cc64149081ad8847f7fec2e`, PR #1 F0 Draft `faf5fe283191f8b5a2724b397009512a2caec1b6`, PR #3 F0 Draft apilado `104469b119752f395cf9881e732d582feab9db4e` observados antes de actualizar.
- Recursos anteriores: [política Docker](JORNATO_DOCKER_AISLAMIENTO_PROYECTOS_20261121.md); [S0](JORNATO_SERVIDOR_S0_READY_ROOM_20261121.md), [S1](JORNATO_SERVIDOR_S1_KIT_ACTIVACION_POST_N3_20261121.md), [S2](JORNATO_S2_PAQUETE_DESPLIEGUE_Y_PISTAS_DE_RELEASE_20261121.md). Todos **reusar**; no crear otra matriz ni 10+10 sin pedido.

**NEXT_NOW=CODEX_LUNA_N7; AFTER_ZIP=CHATGPT_DIRECTOR.**
