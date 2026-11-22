# JORNATO — RECOVERY HANDOFF · N6 ACTIVO · 21-NOV-2026

**PRIMERO LEER:** [continuidad](JORNATO_CONTINUIDAD.md), [orden única N6](CODEX_LOTE_ACTUAL.md), [dictamen N5](JORNATO_N5_DICTAMEN_Y_N6_20261121.md), [política Docker](JORNATO_DOCKER_AISLAMIENTO_PROYECTOS_20261121.md). Estos cuatro documentos representan el estado actual; NO reiniciar N5 ni repetir auditoría 10+10 de N5-R1. La orden N5 en histórico está supersedida por N6. Si ya hay ZIP N6, adjudicarlo en lugar de otro prompt.

## Qué funciona y qué NO

- N5 ZIP adjunto y verificado: SHA256 `162118EFD4260B97A425E969CB90C06C54A4CAA0003FEC82F2C68A2BD53E84CC`, 24.069 B, 10 miembros CRC OK, 9/9 manifiesto SHA/bytes/CRC. N5 `PARTIAL_WITH_GAPS`.
- Flutter host candidato `PASS_CANDIDATE_SCOPED`: Pub exacto offline 79/79 y lock sin cambios, análisis focal PASS, prueba KioskScreen 9/9 PASS. N2 86 PASS, N3 9+4 PASS históricos. Flutter NO se reejecuta salvo delta real; no hay Android aprobado.
- 232 fuentes/candidato N5 con 150 backend, PHP ^8.3/Laravel 13.40.0, 109 pares vendor/lock reportados, disponibles solo en copia privada D:, no GitHub público. No recrear candidato ni suite masiva.
- Docker IPAM ya **EVITADO** con N5: Compose DB none + PHP comparte namespace DB. Un `up` exit 0; cero redes N5, cero puertos host, dos contenedores y un volumen propio. PHP FALLÓ AL ARRANCAR CON `exec /usr/bin/sh: exec format error` exit255. El origen exacto NO está identificado, así que **diagnosticar imagen/arquitectura/entrypoint/shell** antes de tocar DB. MariaDB healthy fue ping sin autenticación: PDO/SQL/Artisan/migraciones 0, E01–E08 8 BLOCKED_ENV. Volumen N5 conservado, contenedores N5 detenidos según Codex; no tocar de otros proyectos.
- WIP Windows según Codex: `D:\codex\Jornato` HEAD `faf5fe283191f8b5a2724b397009512a2caec1b6`, 235 status, staged0, index SHA `25CC609803D7E68D5F3ECF428198B2432CF1EA37030546735DD3F03299D905E1`; no cambio reportado. `OFF_DEVICE_BACKUP=NO`.

## Ejecución pendiente única

**CODEX LUNA N6** `JOR-N6-PHP-RUNTIME-CAUSE-ISOLATED-QA-20261121` debe: (1) custodiar WIP/copia N5 sin mutación, (2) inspeccionar localmente imágenes PHP/arquitectura/shell, máximo probes discriminantes **sin red**, (3) solo si PHP y extensiones/vendor pasan iniciar QA Laravel con un Compose N6 nuevo privado **sin bridge ni puertos**, auth de MariaDB por PDO y migraciones seguras, (4) E01–E08 sintéticos con kernel y DB reales; (5) un ZIP sanitario con pruebas de causa, aislamiento y salida, sin fuentes/secretos/dumps. Si no hay imagen compatible cacheada, detener con `BLOCKED_IMAGE` y requerimiento mínimo de imagen/permiso; no volver a auditar/repetir topología.

**RESTRICCIONES:** varios Codex y proyectos simultáneos; no PHP/DB host, no Docker global, no `prune`, no puertos/volúmenes/redes ajenos. No descargas/instalación, no modificar repo/PR1/PR3/main ni WIP, no usar teléfono/ADB/AVD, no publicar código/sesiones/PII. No activar B19/B20 sin OD02–OD04, no confundir `SERVER_STORED` con `RECOGNIZED` o `requestId` con histórico `requetId`. Backend E2E aún no acreditado, staging no autorizado, H9 NO_GO, release NO_GO.

**DESPUÉS DE ZIP N6=CHATGPT_DIRECTOR**, adjudicar pruebas ejecutadas y decidir el siguiente cambio material hacia Android/staging y backup privado fuera de equipo. **NEXT_NOW=CODEX_LUNA_N6.**
