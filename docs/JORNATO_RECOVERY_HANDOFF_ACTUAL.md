# JORNATO — RECOVERY HANDOFF · 22-NOV-2026 · A1-R2 CONDICIONAL

**Al recuperar otro chat, leer en este orden:** [continuidad canónica](JORNATO_CONTINUIDAD.md) → [único prompt Codex A1-R2](CODEX_LOTE_ACTUAL.md) → [auditoría 10+10 DELTA A1](JORNATO_A1_R2_AUDITORIA_10_VERDUGO_10_JUEZ_20261122.md). No reabrir N2–N7 ni sus auditorías. El usuario pidió optimizar A1 para producir APK QA offline de la app antes de volver a Docker.

**Precedencia:** `TASK=JOR-A1-ANDROID-OFFLINE-APK-QA-CANDIDATE-20261121`, `PROMPT_REVISION=A1-R2-20261122`, **SOLO SI A1 NO HA COMENZADO**. Si A1-R1 ya inició, terminó o hay ZIP, A1-R2 NO SE EJECUTA; Director adjudica ZIP anterior. Un Codex a la vez en `D:\codex\Jornato`, jamás dos forks. No crear A2 automáticamente.

**Pruebas que ya pasaron:** N5 Flutter Pub 79/79, lock SHA `F515D69563850E8893A17585D8BAB57A8E6484E18CE1FEF4BDDC6BB836F83B34`, analyze PASS, 9/9 KioskScreen host candidato; candidato CSV N5 232 fuentes 82 app y 150 servidor, ZIP N5 SHA `162118EFD4260B97A425E969CB90C06C54A4CAA0003FEC82F2C68A2BD53E84CC`. N2 86 y N3 9+4 ya hechos. Ninguno acredita Android nativo.

**Android antiguo:** C2 APK debug SHA `BEEA46F75B08CFA440A980BCEE4CC12E2A6B4C7B37A9457B16240C5427157593`, paquete `.b14qa` instalado según Codex en Mi A3, VM Service BLOCKED y pruebas físicas pendientes. APK C2 no sustituye un build A1; no usar ni tocar teléfono/ADB/AVD en A1.

**N7 cerrado:** Docker PHP lectura/ejecución bloqueado; investigación Docker Desktop global RO preparada pero NO AUTORIZADA. No ejecutarla ni tocar PHP/BD/otros proyectos. `RELEASE=NO_GO`; Android físico y backup off-device pendientes.

**Una orden A1 corregida:** copiar 82 archivos N5 desde origen privado existente y controlar hashes, preparar local.properties Flutter/SDK en copia, usar Pub/Gradle cachés exclusivas privadas, comprobar wrapper antes de `--offline`, controlar debug keystore sin tocar home usuario, decidir una variante QA real por build.gradle, ejecutar una build offline y a lo sumo un retry por fallo de código propio; verificar APK SHA/firma/manifest y dejar binario solo D:. Retorno = **UN ZIP sanitario** con informe, matrix, CSV hashes, no APK, fuentes o secretos, y mensaje corto `NEXT_OWNER=CHATGPT_DIRECTOR`.

**Ramas GitHub:** PR #2 documental, main/PR #1/PR #3 de código intactos; no publicar WIP privado. Gobierno KISS PingPongLaw L1–L6. La instalación física, release signing, tenant/Pro, Keystore/SQLCipher y UAT son puertas posteriores distintas.

**NEXT_OWNER=CODEX_LUNA_IF_A1_NOT_STARTED; AFTER_ZIP=CHATGPT_DIRECTOR.**
