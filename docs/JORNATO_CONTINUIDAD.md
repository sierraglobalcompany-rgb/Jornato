# JORNATO — CONTINUIDAD CANÓNICA · 21 NOV 2026 · N3-R1 VIGENTE SI N3 NO COMENZÓ

> **ÚNICA ORDEN DESCARGABLE / GITHUB:** [CODEX_LOTE_ACTUAL.md](CODEX_LOTE_ACTUAL.md), TASK `JOR-N3-UI-OFFLINE-INTEGRATION-CANDIDATE-20261121`, `PROMPT_REVISION=N3-R1-20261121`. **Mismo N3; NO otra ejecución ni N4.** Si Codex ya empezó N3 original o existe ZIP N3 posterior, **no ejecutar N3-R1**: recibir el ZIP anterior y adjudicarlo. [Auditoría delta 10 verdugo + 10 juez](JORNATO_N3_R1_AUDITORIA_10V_10J_20261121.md).

## Fuente de verdad que NO se vuelve a ejecutar

- ZIP N2-R1 `JOR-N2-SDK-RECOVERY-HOST-GATE-20261120-UNICO.zip`, SHA256 `CC4846C6D901564E246D17B8A28C2B28A772F5A76E00442E0A3BFD19D19B04DB`: 7 miembros CRC PASS, manifiesto 6/6 PASS. Registro `HOST_RESULTS.csv`: 7 ficheros, 86 PASS, 0 FAIL, 0 SKIP, formato/análisis PASS según Codex. Certificación `PASS_HOST_SCOPED`, **no** Android, y no reejecutar esos 86 sin cambio de fuente relevante.
- `KIOSK_GATE_MATRIX.csv` N2-R1: `Pantalla de jornada=ESCRITO_NO_PROBADO`; `Límite offline=ESCRITO_NO_PROBADO`. Faltan test directo de `KioskScreen` real y barrera offline alcanzable. La tarjeta de acumulado referencial y el cálculo nocturno ya tienen tests host de propietario conocido.
- WIP avanzado **solo en Windows**, reportado: `D:\codex\Jornato` rama `codex/jor-b08-h4-domain-20261025`, HEAD `faf5fe283191f8b5a2724b397009512a2caec1b6`, status 234 (223 untracked, 11 tracked modified), staged 0. No está publicado en el repositorio GitHub. N2 solo cambió formato de `test/kiosk_repository_test.dart`. ChatGPT no inspeccionó los 150032 bytes de `KioskScreen` desde el WIP ni ha ejecutado sus tests.
- Snapshot privado N1-R2: 216 archivos/2.904.617 bytes en D:, restore sample 5/5 reportado. **OFF_DEVICE_BACKUP=NO**. Una copia candidata local no sustituye backup en otro equipo/medio autorizado.
- Flutter/Dart host de N2: 3.47.8/3.13.7, caché offline y SQLite FFI según registros. Oráculos Android SQLCipher/Keystore/idempotencia/corrupción `NOT_RUN`, restart Android `BLOCKED_HARNESS`, Pro/tenant `BLOCKED_CONTRACT`. APK QA instalado según C2 V5; **no tocar teléfono/ADB/AVD**.

## Qué cambió N3-R1 frente a N3 (solo corrección de instrucciones)

1. Para asegurar que el candidato contiene el WIP avanzado, **no asumir que `git clone` local copia los 223 untracked**. Construir base read-only por `git archive HEAD` (sin `.git`), luego overlay explícito de tracked modificados y untracked necesarios, hashes y assets. No merge PR3 ni modificar Git fuente.
2. Un test offline debe interceptar/inspeccionar la dependencia de red **realmente alcanzable** por `KioskScreen`. Cero llamadas a un spy decorativo no acredita nada.
3. Un test UI necesita `WidgetTester` de la pantalla real + tap + efecto local/re-render con reloj fijo antes/en/después del fin planificado; sin nueva arquitectura.
4. Distinguir `CANDIDATE_SOURCE_PARITY`, `CANDIDATE_HOST_SMOKE` y `READY_LOCAL_SCOPED`: no dar candidato listo por copiar archivos o por heredar los 86 PASS de otro árbol.
5. Un ZIP sanitario único sin fuentes/diffs/PII; snapshot y candidato siguen en private D:. ChatGPT mantiene los documentos en GitHub; publicación de código privado sigue `NO` hasta autorización y revisión de secretos.

## Estado del remoto (consultado antes de editar esta nota)

Repositorio público `sierraglobalcompany-rgb/Jornato`; `main=1ee6aae821f8cf177cc64149081ad8847f7fec2e`, PR1 F0 Draft `faf5fe283191f8b5a2724b397009512a2caec1b6`, PR3 F0 Draft apilado sobre PR1 `104469b119752f395cf9881e732d582feab9db4e`, PR2 Draft rama `docs/pingponglaw-l1-l6-canon-84e961c` con documentación. No inventar equivalencia entre estos PR y el WIP Windows. El comparador PR3 antiguo fija `78b32284...` y no debe reutilizarse como current.

## Gobierno y siguientes puertas (no autorizadas automáticamente)

Leyes PingPongLaw L1 KISS, L2 no ruido, L3 causa raíz, L4 UX humana, L5 QA independiente, L6 no pingpong. Mantener `requestId`/legado `requetId`, `SERVER_STORED != RECOGNIZED`, B19/B20 deny-all, OD01–OD08 pendientes. Después de N3: (a) Director certifica ZIP, (b) autorización de backup **off-device** privado y revisión de secretos, (c) integración de producto segura + PR en destino autorizado, (d) Android físico 4 oráculos y restart con runner seguro, (e) Pro/tenant/web/empleados y UAT, (f) release con GO explícito. `H9_GLOBAL=NO_GO`, `B22=NOT_AUTHORIZED`, `RELEASE=NO_GO`.

**NEXT_OWNER=CODEX_LUNA_N3_R1_IF_N3_NOT_STARTED; AFTER_N3_ZIP=CHATGPT_DIRECTOR.**