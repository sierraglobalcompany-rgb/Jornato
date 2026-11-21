# JORNATO — Dictamen del Director sobre N2-R1 y ruta productiva N3

**Fecha del dictamen:** 21 de noviembre de 2026, America/Bogota. **Origen:** ZIP físico recibido `JOR-N2-SDK-RECOVERY-HOST-GATE-20261120-UNICO.zip`; documentación PR #2 y estados PR #1/#3 observados en GitHub. Este dictamen NO representa reejecución de Flutter, ni verificación directa del código Windows; es validación de la cadena documental y de integridad del ZIP.

## 1. Evidencia que sí se verificó

- ZIP **7264 bytes**, SHA-256 `CC4846C6D901564E246D17B8A28C2B28A772F5A76E00442E0A3BFD19D19B04DB` (calculado sobre bytes recibidos).
- **7 entradas** sin duplicados ni traversal/symlink, CRC válido; **6/6** miembros fuera del manifiesto coinciden en SHA-256 y longitud. El manifiesto no se incluye en sí mismo, lo cual es correcto.
- `HOST_RESULTS.csv` contiene siete archivos de prueba y suma **86 PASS / 0 FAIL / 0 SKIP**; ningún archivo reporta omisión, y todos tienen `campaign_exit_code=0`. Esto fundamenta el dictamen `PASS_HOST_SCOPED` **según registros entregados**, pero no son logs de ejecución completos independientes.
- `FINAL_REPORT.md` informa análisis completo Flutter 3.47.8/Dart 3.13.7 sin problemas; formato de seis rutas PASS; `SDK_PROVENANCE.md` confirma ruta de SDK desde `android/local.properties`, paquetes cacheados y SQLite FFI. La procedencia de host entre lotes es `UNDETERMINED`, sin afirmar que el SDK fue borrado o movido.
- `WIP_DELTA_SUMMARY.csv` informa un único cambio `FORMAT_ONLY`: `test/kiosk_repository_test.dart` SHA PRE `019B5A1EDCA75802C2EFD8F07817C00FBF3A30811539A310112D1FAE375BF091`, SHA POST `9274554AB462FE3E4BF8A578C38FA11CEECD669DFE3F9338E8260ACBF1397C39`. Las otras cinco rutas listadas no cambian. Rama `codex/jor-b08-h4-domain-20261025`, HEAD `faf5fe283191f8b5a2724b397009512a2caec1b6`, status 234 rutas, staged 0 e índice Git sin cambios **según Codex**.

## 2. Qué queda expresamente NO aprobado

- `KIOSK_GATE_MATRIX.csv` marca `Pantalla de jornada=ESCRITO_NO_PROBADO` porque las acciones reales de `KioskScreen` no fueron invocadas; `Límite offline=ESCRITO_NO_PROBADO` porque tests locales sintéticos no prueban ausencia real de red o modo avión.
- SQLite FFI host no es SQLCipher nativo de Android, no valida Android Keystore, corrupción nativa fail-closed, idempotencia Android ni persistencia tras matar proceso. C2 V5 sigue `BLOCKED_VM_SERVICE` y 4 gates físicos NOT_RUN.
- Snapshot N1-R2 de 216 archivos/2.904.617 bytes en D: y restauración 5/5 son **reportados**; no implican backup fuera del equipo, cobertura de todos los archivos necesarios, ni fuentes ya integradas con PR3.
- El proyecto público GitHub `sierraglobalcompany-rgb/Jornato` contiene PR #1 base F0 y PR #3 F0 Draft, pero NO el WIP avanzado completo; el PR #2 es exclusivamente autoridad documental. No usar la igualdad de HEAD entre WIP local y PR1 como prueba de identidad de working tree.
- `H9_GLOBAL=NO_GO`, `B22=NOT_AUTHORIZED`, `RELEASE=NO_GO`. La evidencia disponible **no autoriza firma, despliegue, merge de PR de producto ni instalación Android**.

## 3. Decisión del Director: siguiente gate N3 productivo y de custodia

**NO** repetir N1/N2, siete suites host, 10+10 anteriores ni renombrar el mismo bloqueo. Sí realizar un **macrobloque único**:

1. Ejercitar, con tests widget host, la **rama real de acciones de `KioskScreen`** alrededor del cruce nocturno y fin planificado, usando reloj/SQLite sintéticos; si se descubre un defecto, corregir en el mismo lote su propietario real y pruebas vecinas, sin nuevo motor.
2. Dar un oráculo host focal de que marcar y renderizar **no depende de red**; distinguirlo de una prueba Android modo avión, que sigue pendiente.
3. Construir un **candidato privado reconstruible** desde Git HEAD + fuentes WIP aprobadas (incluidas las untracked imprescindibles), en copia aislada D: sin alterar el índice de la fuente, evaluar cobertura y preparar el plan de publicación futura. No confundir este candidato con respaldo externo.
4. GitHub: actualizar el PR #2 solo con la continuidad documental de la ejecución N2; **no subir código WIP al GitHub público** por riesgos de secretos/PII sin selección de destino y aprobación explícita.
5. Retornar un ZIP único sanitizado con hashes y resultados. El Director determinará entonces la ruta de respaldo fuera del dispositivo y QA Android, Pro, portal y UAT. No pedir al propietario ejecutar tests.

## 4. Ruta de cierre del producto (no confundir con tareas de N3)

| Puerta | Estado tras N2-R1 | Acción concreta posterior |
|---|---|---|
| Motor/SQLite host | `PASS_HOST_SCOPED` (86 pruebas) | Reutilizar por SHA, no repetir |
| UI `KioskScreen` / offline | `ESCRITO_NO_PROBADO` | N3 test host y corrección focal |
| Custodia de código | Copia focal local, **no off-device** | Candidato privado verificable + destino autorizado |
| GitHub código avanzado | NO PUBLICADO | Análisis de secretos, repo privado/permiso, PR seguro |
| Android SQLCipher, Keystore, restart | NOT_RUN/BLOCKED_HARNESS | Gate físico autorizado con causa de VM documentada |
| Pro/tenant/portal/empleados y OD | BLOCKED_CONTRACT/pendiente | QA contractual por fixtures aprobados |
| Release | NO_GO | L4/L5, UAT y aprobación explícita |

**Siguiente ejecutor:** CODEX LUNA ejecuta únicamente `JOR-N3-UI-OFFLINE-INTEGRATION-CANDIDATE-20261121`. **Después**: CHATGPT DIRECTOR adjudica el ZIP. No reiniciar Codex si ya se está ejecutando una tarea.