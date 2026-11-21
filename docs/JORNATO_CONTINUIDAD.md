# JORNATO — CONTINUIDAD CANÓNICA · 21-NOV-2026 · N4 CERRADO / N5-R1 CONDICIONAL

**ÚNICA ORDEN DE CODEX LUNA, SI N5 V1 TODAVÍA NO EMPEZÓ:** [CODEX_LOTE_ACTUAL.md](CODEX_LOTE_ACTUAL.md), `TASK=JOR-N5-DOCKER-NONET-PUB-GATES-20261121`, `PROMPT_REVISION=N5-R1-20261121`. Esta revisión sustituye N5 V1 **solo antes de su inicio**; si N5 V1 ya comenzó, está siendo ejecutada o ya existe ZIP N5, **NO ENVIAR N5-R1** ni iniciar otra sesión. Recibir y adjudicar el ZIP N5 existente con ChatGPT Director. [Auditoría delta 10 Verdugo + 10 Juez](JORNATO_N5_R1_AUDITORIA_10_VERDUGO_10_JUEZ_20261121.md). Los 20 puntos son documentales, **no** 20 ejecuciones.

## Hechos cerrados con evidencia, no repetir

- N4 ZIP `JOR-N4-FULL-SOURCE-AND-SERVER-QA-20261121-UNICO.zip` leído en ChatGPT: 21.966 bytes; SHA256 `C5B1F0F344ED6E2B280FCFB92126664593715C24B0B27D29A5A0C4460898D1F8`, 12 miembros y 11/11 entradas de manifiesto válidas. N4 `PARTIAL_WITH_GAPS`; backend/Flutter **no ejecutados**, source parity 232/232 **reportada por Codex**. Ver [dictamen N4](JORNATO_N4_DICTAMEN_Y_N5_20261121.md).
- Candidato N4 en `D:\codex\_REPORTES\Jornato`: 232 archivos (150 `server`), reportados 230 overlays y 2 HEAD. `WIP_ROOT=D:\codex\Jornato`, rama `codex/jor-b08-h4-domain-20261025`, HEAD `faf5fe283191f8b5a2724b397009512a2caec1b6`; 235 rutas (224 untracked, 11 modified), 0 staged, índice `25CC609803D7E68D5F3ECF428198B2432CF1EA37030546735DD3F03299D905E1` PRE/POST reportado. ZIP NO contiene código, y ChatGPT no accede al WIP local. **OFF_DEVICE_BACKUP=NO**.
- SDK Flutter 3.47.8 / Dart 3.13.7; 8/8 artefactos host según N4; faltan 22 de 79 paquetes/sellos Pub en cache predeterminado. **No se lanzó Flutter durante N4**. N2-R1 86 tests host PASS y N3-R1 9 de KioskScreen + 4 vecinos PASS en alcances previos; no repetir en WIP intacto.
- Backend Laravel 13.40.0, PHP ^8.3, Sanctum 4.3.3, PHPUnit 12.5.43, 11 migraciones y 34 declaraciones API; 109 paquetes vendor compatibles con lock reportados estáticamente. B21F-S3 histórico 158/2450 PASS scoped; no prueba instancia QA actual. **E01–E08 NOT_RUN**.
- Docker Engine 29.9.2/Compose 5.6.1 **según N4**, imagen PHP y MariaDB 11.8.9 cacheadas; red bridge nueva bloqueada por IPAM; **cero** redes, contenedores o volúmenes N4 creados y cero PHP/SQL ejecutado, según Codex. **NO limpiar redes ajenas ni alterar daemon**.

## Delta N5-R1 frente a N5 original (nuevas condiciones, no nuevo proyecto)

1. Guard de concurrencia: N5 original ya empezó/terminó → NO iniciar N5-R1. Mismo TASK, un ZIP; sin otro N6 ni reauditorías.
2. N4 candidato queda **inmutable**; crear copia N5 privada controlada antes de cualquier prueba o bind. No tocar WIP, PR1/PR3 ni servidor de otro proyecto.
3. Cache Pub: comparar lock del candidato con lock usado por N2/N3 solo si existen hashes; no asumir iguales. Paquetes/dir/sellos ≠ integridad. Exigir Pub `--offline --enforce-lockfile` con SHA lock igual PRE/POST; si hay faltantes, bloqueo causal sin descargar. Revalidar SDK cache universal **antes** de invocar Flutter.
4. Docker: una sola tentativa `db network_mode:none` + `php network_mode:service:db` en dos contenedores propios, sin bridge/red/puertos del host y sin recursos ajenos. YAML pasó **validación sintáctica aquí** pero ejecución real permanece **NO PROBADA**. Si aparece red default, IPAM u otro contenedor ajeno modificado: STOP, sin segunda variante, prune ni IPAM global.
5. `mariadb-admin ping` es liveness, **no** QA SQL: ejecutar PDO/MySQL autenticado en DB propia vacía antes de Artisan. Comprobar extensiones PHP localmente en contenedor; sin construir imágenes/descargar. E01–E08 únicamente con rutas reales del Laravel y HTTP Kernel del contenedor + MariaDB QA sintética.

## Políticas y puertas de producto

- [Política Docker por proyecto](JORNATO_DOCKER_AISLAMIENTO_PROYECTOS_20261121.md): PHP/BD solo Docker, sin servicios Windows; redes, volúmenes, puertos, credenciales y RAM ajenos protegidos. Ante IPAM `BLOCKED_DOCKER_IPAM`, no `prune`, ni tocar daemon de otros agentes.
- PingPongLaw L1 KISS/pony-tail, L2 antirruido, L3 causa raíz, L4 UX humana, L5 evidencia independiente, L6 antipingpong. Contratos: `requestId`/legado `requetId`, `SERVER_STORED != RECOGNIZED`, B19/B20 `deny-all`. OD02/03/04 pendientes; no inventar autenticación, roles o endpoints.
- GitHub `sierraglobalcompany-rgb/Jornato`: PR2 Draft **documental**; main `1ee6aae821f8cf177cc64149081ad8847f7fec2e`, PR1 Draft `faf5fe283191f8b5a2724b397009512a2caec1b6`, PR3 Draft `104469b119752f395cf9881e732d582feab9db4e` (antes de esta actualización). WIP avanzado no publicado; hace falta revisión de secretos, respaldo fuera de D: y destino privado autorizado.
- Reutilizar ya hechos [S0](JORNATO_SERVIDOR_S0_READY_ROOM_20261121.md), [S1](JORNATO_SERVIDOR_S1_KIT_ACTIVACION_POST_N3_20261121.md), [S2](JORNATO_S2_PAQUETE_DESPLIEGUE_Y_PISTAS_DE_RELEASE_20261121.md); no crear otro runner ni plan genérico.
- C2 Android físico SQLCipher/Keystore/rehidratación/corrupción `NOT_RUN`, restart `BLOCKED_HARNESS`, Pro/tenant E2E pendiente; `H9_GLOBAL=NO_GO`, `B22=NOT_AUTHORIZED`, `RELEASE=NO_GO`. N5 NO autoriza instalar APK, staging ni producción.

**NEXT_OWNER=CODEX_LUNA_N5_R1_IF_N5_V1_NOT_STARTED. Si N5 está en curso: NEXT_OWNER=CODEX_LUNA_FINISH_EXISTING_N5. En ambos casos AFTER_ZIP=CHATGPT_DIRECTOR.**