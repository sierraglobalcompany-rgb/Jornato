# JORNATO — SIN NUEVA ORDEN DE CODEX: B21 IPAM YA EJECUTADO, FALLOS DE SUITE PENDIENTES

**Corte:** 2026-11-15, America/Bogota. **NEXT_OWNER=CHATGPT_DIRECTOR.**

## Última entrega efectiva, NO volver a ejecutarla

`TASK_ID=JOR-B21-IPAM-RECOVERY-REAL-DB-QA-20261115`. ZIP recibido `JOR-B21-IPAM-RECOVERY-20261115-UNICO.zip`, SHA256 `C51440AB28DD218F7A6C6EA35751DAA500B6FC67F45F6823FDD56DB9459E307B`. Verificación independiente del ZIP: 36 miembros, CRC PASS, 35/35 manifest hashes+bytes PASS. Reportado por logs: IPAM explícita /28 PASS scoped; MariaDB 11.8.9 propia, 11 migraciones, 37 tablas InnoDB, B17/B19/B20 concurrencia scoped PASS (B19 almacenamiento FAKE), 3 contenedores ajenos activos sin cambio en IDs/health/puertos. MariaDB Jornato ahora STOPPED, red/datadir/secrets D conservados; producto WIP 237 rutas unchanged y 0 staged reportados, NO comprobados directamente en Windows.

**LA SUITE DB QA NO PASÓ:** `153/156 tests, 2398 assertions, exit 1, 3 FAIL`. Dos fallos por distinto orden textual en directivas Cache-Control. TERCER FALLO DE SEGURIDAD NO RESUELTO: un test de lectura B17 de otro usuario de la MISMA empresa esperaba HTTP 404 y recibió 200 en un proceso; arnés separado dio 404. No diagnosticar causa sin logs/test/código actual. A→B y PAT activo/revocado/expirado no ejecutados. `B21_GLOBAL=NOT_APPROVED`, `RELEASE_APPROVED=NO`, `B22=NOT_AUTHORIZED`.

## Próxima acción real

**Primero CHATGPT Director:** leer [handoff Recovery V6 actual](JORNATO_RECOVERY_HANDOFF_ACTUAL.md) y último ZIP adjuntado, adjudicar la brecha B17 de acceso y definir **un único lote focal** solo si el usuario autoriza trabajo local. La orden posterior, si se emite, debe reproducir 200/404 en D: sin cambiar permisos, obtener trazas crudas de las tres pruebas y contexto de usuarios/empresa/cache, resolver causa raíz real, verificar semántica Cache-Control y A→B + PAT, y entregar un solo ZIP. Prohibido repetir IPAM, descarga de imagen, 11 migraciones sobre DB nueva, carreras B19/B20 ya observadas, auditorías B13–B21 o suites históricas sin delta.

**NO EMITIR A CODEX EL PROMPT ANTERIOR.** El prompt B21 IPAM histórico se conserva en el commit `ce4e40d678c5d2763c946cde15523de66eb3d00c`: [orden histórica, NO EJECUTAR](https://github.com/sierraglobalcompany-rgb/Jornato/blob/ce4e40d678c5d2763c946cde15523de66eb3d00c/docs/CODEX_LOTE_ACTUAL.md).

**Vigencia:** ninguna orden ejecutable hasta emitir el cierre focal aprobado. No stage, commit, push, merge o deploy de producto; sin tocar otros contenedores Docker, Hostinger, producción ni rutas comerciales RR. HH. `NEXT_OWNER=CHATGPT_DIRECTOR`.
