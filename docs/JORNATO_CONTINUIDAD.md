# JORNATO — CONTINUIDAD CANÓNICA · 21 NOV 2026 · N4 CERRADO / N5 ACTIVO

**ORDEN ÚNICA DE CODEX LUNA:** `docs/CODEX_LOTE_ACTUAL.md`, TASK `JOR-N5-DOCKER-NONET-PUB-GATES-20261121`. [Dictamen ZIP N4](JORNATO_N4_DICTAMEN_Y_N5_20261121.md). **N4 está cerrado** (`PARTIAL_WITH_GAPS`). El [borrador post-N4 NO EJECUTAR](CODEX_POST_N4_DOCKER_BORRADOR_NO_EJECUTAR_20261121.md) queda sustituido; no ejecutar ambos. Si ya hay ZIP N5 posterior, adjudicarlo primero; no duplicar ejecución.

## Evidencia verificada, no repetir

- ZIP N4 `JOR-N4-FULL-SOURCE-AND-SERVER-QA-20261121-UNICO.zip`, SHA256 `C5B1F0F344ED6E2B280FCFB92126664593715C24B0B27D29A5A0C4460898D1F8`, **21.966 bytes, 12 miembros CRC PASS, manifiesto 11/11 SHA+bytes PASS**, 232 entradas sin duplicidades de ruta en `FULL_SOURCE_COVERAGE.csv`.
- Candidato privado N4: **232 archivos**, 150 `server`, 230 overlays WIP/2 objetos HEAD finales; paridad 232/232 **según verificador local reportado**, no comprobable directamente sin fuentes. WIP `D:\codex\Jornato`, rama `codex/jor-b08-h4-domain-20261025`, HEAD `faf5fe283191f8b5a2724b397009512a2caec1b6`, status 235 (224 untracked/11 modified), staged 0, índice `25CC609803D7E68D5F3ECF428198B2432CF1EA37030546735DD3F03299D905E1`, sin delta según Codex.
- Laravel fuente estático: PHP ^8.3, Laravel **13.40.0**, Sanctum **4.3.3**, PHPUnit **12.5.43**, **11 migraciones**, **34 declaraciones API**, 109 pares vendor/lock coincidentes según N4. **No runtime PHP ni migraciones ejecutadas**. E01–E08 0 ejecutadas.
- Flutter N4: Flutter 3.47.8/Dart 3.13.7 y ocho artefactos host completos; `pubspec.lock` 79 hosted packages, **22 paquetes/sellos faltantes en el cache predeterminado**; ningún comando Flutter N4. N2-R1: **86 host PASS**; N3-R1: **9 UI PASS + 4 vecinos PASS**, no repetir en WIP sin cambio causal.
- Docker N4: Engine 29.9.2 / Compose 5.6.1; imágenes PHP y MariaDB 11.8.9 cacheadas según Codex, Compose validado, **crear red bridge falló por IPAM agotado**. No se crearon contenedores, redes o volúmenes N4 ni se ejecutó SQL/PHP. No alterar daemon ni otros proyectos.
- `OFF_DEVICE_BACKUP=NO`; Android SQLCipher/Keystore/corrupción/reinicio nativo `NOT_RUN`; H9 GLOBAL NO_GO; B22 NOT_AUTHORIZED; RELEASE NO_GO.

## N5: una sola campaña de dos carriles y ZIP

1. **Caché Pub real:** localizar las rutas de cache utilizadas por N2/N3 mediante `PUB_CACHE` y `package_config.json` del WIP leído sin mutarlo; validar 79 entradas de lock y 22 ausentes, reunir solo paquetes íntegros en cache privado sin descargas; si se desbloquea, `flutter pub get --offline --enforce-lockfile` y prueba **en candidato aislado**. Si falta material real, informar paquetes/versiones y `BLOCKED_PUB_PACKAGES`, no repetir N2/N3.
2. **PHP+MariaDB Docker:** [norma transversal](JORNATO_DOCKER_AISLAMIENTO_PROYECTOS_20261121.md) y propuesta de **única contingencia** no-IPAM: MariaDB `network_mode: none`, PHP `network_mode: service:db`, ambos en proyecto Compose privado de Jornato, compartiendo **solo loopback interno**, sin puertos host ni red externa. Docker oficial documenta los modos; **no está probado en el host**. Preflight estricto; un intento; si Compose exige crear bridge o falla, STOP, sin prune, cambios daemon, red de otros proyectos o segunda variante. Con entorno PASS, PHP vendor+extensiones, migraciones sobre DB nueva sintética y E01–E08 de tenant/PAT/requestId/acuse.
3. **Custodia:** reusar candidato N4 (no reconstruir 232 archivos), no tocar WIP/index/GitHub de código, no montar datos/servicios ajenos, un ZIP sanitizado y sin fuentes. Ninguna prueba física Android, staging ni producción.

## Gobernanza y recursos anteriores

- Repo público `sierraglobalcompany-rgb/Jornato`: main `1ee6aae821f8cf177cc64149081ad8847f7fec2e`, PR #1 F0 Draft `faf5fe283191f8b5a2724b397009512a2caec1b6`, PR #3 F0 Draft `104469b119752f395cf9881e732d582feab9db4e`. PR #2 solo docs, no WIP.
- Reusar [S0](JORNATO_SERVIDOR_S0_READY_ROOM_20261121.md), [S1](JORNATO_SERVIDOR_S1_KIT_ACTIVACION_POST_N3_20261121.md), [S2](JORNATO_S2_PAQUETE_DESPLIEGUE_Y_PISTAS_DE_RELEASE_20261121.md); no otra auditoría ni runner.
- PingPongLaw L1 KISS, L2 antirruido, L3 raíz, L4 UX humana, L5 evidencia, L6 antipíngpong; `requestId`/legado `requetId`; `SERVER_STORED != RECOGNIZED`; B19/B20 deny-all; OD02/03/04 no aprobados.
- Backup fuera de D:, autorización para repositorio privado/publicación de fuentes y GO release siguen pendientes. No usar la QA de N5 como autorización de producción.

**NEXT_OWNER=CODEX_LUNA_N5; AFTER_ZIP=CHATGPT_DIRECTOR.**
