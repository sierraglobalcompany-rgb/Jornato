# JORNATO — RECOVERY HANDOFF ACTUAL · 21 NOVIEMBRE 2026 · N5

> **PRIMERO LEER:** [continuidad](JORNATO_CONTINUIDAD.md), [orden única N5](CODEX_LOTE_ACTUAL.md), [dictamen N4](JORNATO_N4_DICTAMEN_Y_N5_20261121.md). N4 está TERMINADO, no en vuelo. Antiguo borrador post-N4 `NO_EJECUTAR` sustituido. Si ya existe ZIP N5, inspeccionarlo antes de ordenar nada. No repetir auditorías 10+10, C2, N1, N2, N3 ni N4.

## Última verdad comprobada

N4 ZIP adjunto: SHA256 `C5B1F0F344ED6E2B280FCFB92126664593715C24B0B27D29A5A0C4460898D1F8`, **12 entradas CRC, manifiesto 11/11 verificado por ChatGPT**, 21.966 bytes. RESULT=PARTIAL_WITH_GAPS. Fuente N4 candidata **232/232 hashes PASS_SCOPED según verificador local Codex**, 150 server, 34 declaraciones API, 11 migraciones, vendor/lock 109 pares. Fuente avanzada **NO** publicada y no adjunta al ZIP, permanece en Windows privado.

Flutter N4=BLOCKED_OFFLINE_CACHE, 22/79 package dirs o sellos ausentes del cache por defecto; N2 host=86 PASS y N3 UI=9+4 PASS históricos. PHP ^8.3, Laravel 13.40.0, Sanctum 4.3.3, PHPUnit 12.5.43 desde fuente estática. Docker 29.9.2/Compose 5.6.1: creación de red bridge agotó IPAM; cero recursos Docker N4 creados según Codex, E01–E08 0/8 ejecutadas, PHP/Artisan/migraciones NOT_RUN. WIP `D:\codex\Jornato`, HEAD `faf5fe283191f8b5a2724b397009512a2caec1b6`, rama `codex/jor-b08-h4-domain-20261025`, 235 rutas (224 untracked/11 modified), staged 0, índice SHA `25CC609803D7E68D5F3ECF428198B2432CF1EA37030546735DD3F03299D905E1` reportado sin delta. Snapshot solo D:, **OFF_DEVICE_BACKUP=NO**.

## Ejecución N5 dirigida

**CODEX LUNA** debe ejecutar una vez `JOR-N5-DOCKER-NONET-PUB-GATES-20261121`:
- Carril Flutter: encontrar cache Pub efectiva de N2/N3 por rutas existentes, resolver lock exacto **offline** solo en candidato privado N4, un test UI y analyze focal; si 22 bytes faltan de verdad, reportar sin descargar.
- Carril servidor: **solo Docker aislado**, una topología **no puente** de dos contenedores propios: DB `network_mode: none`; PHP `network_mode: service:db`; misma red namespace privada/loopback `127.0.0.1`, sin bridge IPAM, sin puerto host, sin recursos de otros proyectos. Es una hipótesis que Docker oficial permite, no un PASS local. Si Compose intenta crear red, STOP, no prune ni daemon/network global. Si pasa: extensiones runtime, vendor, DB QA sintética nueva, migraciones y E01–E08 tenant/PAT/idempotencia/acuse, solo lo permitido por contratos reales.
- Un solo ZIP sanitizado, CRC/manifiesto SHA, código/diffs/vendor/secrets dentro de private D:, WIP/index iguales. Sin teléfono/ADB/staging/deploy ni merge GitHub.

## Proyecto, ramas y gobierno

Repo `sierraglobalcompany-rgb/Jornato`, PR #2 abierto Draft solo documentación, PR1/PR3 F0 Flutter, no backend avanzado. PingPongLaw L1–L6, `requestId` histórico `requetId`, `SERVER_STORED != RECOGNIZED`, B19/B20 deny-all, OD02/03/04 no aprobados. Cuatro oráculos Android SQLCipher/Keystore/idempotencia/corrupción y restart físico todavía NOT_RUN; H9_GLOBAL NO_GO; B22 NOT_AUTHORIZED; RELEASE NO_GO. Varios proyectos Codex en Windows: **no compartir redes/volúmenes/DB/servicios**.

**DESPUÉS DEL ZIP N5: CHATGPT DIRECTOR** adjudica. No crear otra auditoría rutinaria ni reabrir etapas cerradas. Si faltan paquetes/imagen con extensiones/red, solicitar solo la autorización mínima específica; si no, avanzar a cierre funcional y release gates con evidencia.
