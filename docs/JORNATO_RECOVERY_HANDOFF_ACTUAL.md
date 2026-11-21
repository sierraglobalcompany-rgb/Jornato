# JORNATO — RECOVERY HANDOFF · 21-NOV-2026 · N5-R1 CONDICIONAL

**LECTURA OBLIGATORIA AL RECUPERAR CHAT:** [continuidad canónica](JORNATO_CONTINUIDAD.md) → [única orden CODEX N5-R1](CODEX_LOTE_ACTUAL.md) → [auditoría 10 verdugo y 10 juez del DELTA N5](JORNATO_N5_R1_AUDITORIA_10_VERDUGO_10_JUEZ_20261121.md). **No repetir N2/N3/N4, ni ejecutar el borrador POST-N4.** Si N5 V1 ya ha comenzado/terminado, N5-R1 es solo una referencia de criterios: **NO relanzar**. Primero recibir y adjudicar el ZIP existente.

## Producto, estado y roles

Jornato: app Gratis Local offline Flutter/Dart; Pro con outbox/SQLCipher/Keystore; servidor Laravel/Sanctum/MariaDB, portal empleados y RR.HH. ChatGPT Director define contratos y gates; Codex Luna ejecuta en `D:\codex\Jornato` sobre Windows, **pero múltiples programas/instancias Codex coexisten en carpetas separadas**. PHP/DB **exclusivamente Docker Compose privado por proyecto** (sin compartir contenedores, redes, puertos, volúmenes o datos). Respeta ley KISS/PingPongLaw L1–L6, no parches, no nuevos servicios. Sin publish, merge ni deploy sin decisión dueño.

## Verdad N4

- ZIP SHA256 `C5B1F0F344ED6E2B280FCFB92126664593715C24B0B27D29A5A0C4460898D1F8`, 21.966 B, 12 miembros CRC PASS y 11/11 hashes/tamaños correctos. N4 `PARTIAL_WITH_GAPS`, 232 fuentes paridad reportada, 150 de servidor, **no smoke Flutter**, **0 E2E PHP/SQL**.
- Docker N4 bloqueado por IPAM al intentar una red nueva privada: cero red/contenedor/volumen N4 según Codex; sin prune ni uso de recursos ajenos. N5 propone una sola hipótesis alterna sin red bridge: db mode none + php mode service:db; el YAML fue validado sintácticamente en ChatGPT, **nunca se probó en Docker Desktop del propietario**.
- Pub N4: 22 paquetes/sellos de 79 faltaban en cache por defecto; Flutter SDK 3.47.8/Dart 3.13.7 presentes. N2-R1 86 PASS y N3-R1 9+4 PASS históricos, no repetir sin delta de fuente.
- Backend estático: PHP ^8.3, Laravel 13.40.0, Sanctum 4.3.3, PHPUnit 12.5.43, 11 migraciones, 34 declaraciones API, 109 vendor pares; ni PHP real ni DB QA iniciados. B21F-S3 anterior 158/2450 PASS scoped, no E2E actual.
- WIP reportado HEAD `faf5fe283191f8b5a2724b397009512a2caec1b6`, rama `codex/jor-b08-h4-domain-20261025`, status 235, stage 0, index `25CC609803D7E68D5F3ECF428198B2432CF1EA37030546735DD3F03299D905E1` sin delta. No backup externo; código privado no está en GitHub público.

## Orden de ejecución única N5-R1

1. **Primero** gate `N5_ALREADY_IN_FLIGHT_OR_FINISHED`; sin doble ejecución. Reusar N4 solo por lectura, crear copia N5 privada, no reconstruir 232 desde HEAD.
2. Flutter: buscar únicamente caches existentes N2/N3 y origen real, validar integridad del lock SHA; `--offline --enforce-lockfile` y test KioskScreen del candidato únicamente si es seguro. Sin descargas ni lock distinto.
3. Docker: solo DB none + PHP comparte namespace privado de DB, sin puerto/red host; un `up` como máximo tras config/labels/seguridad. Verificar extensiones PHP, PDO autenticado y DB QA vacía antes de migraciones. E01–E08 Laravel reales + persistencia, no inventar endpoints B19/B20 o contratos OD02/03/04.
4. Entregar **un ZIP sanitizado** con matriz de gates, manifiesto SHA/CRC, evidencias sin secretos, y hashes WIP PRE/POST. Si Pub y/o Docker bloquean, continuar el otro carril independiente y reportar bloqueo causal. No reset, commits/push, Windows PHP/DB, prune, ADB, producción o staging.

## Siguiente hito

Al recibir ZIP N5, Director adjudica y sólo entonces define autorización mínima de descarga Pub si los 22 faltantes son reales, imagen PHP apta si carece extensiones, o resolución segura IPAM/aislamiento si sigue bloqueado. Tras host/QA, sigue custodia off-device y publicación privada autorizada del WIP, Android físico, Pro E2E/staging, UAT y GO. `OFF_DEVICE_BACKUP=NO`, `ANDROID_NATIVE=NOT_RUN`, `H9_GLOBAL=NO_GO`, `B22=NOT_AUTHORIZED`, `RELEASE=NO_GO`.

**NEXT=CODEX_LUNA_IF_N5_NOT_RUNNING; OTHERWISE_FINISH_EXISTING_N5. AFTER_ZIP=CHATGPT_DIRECTOR.**
