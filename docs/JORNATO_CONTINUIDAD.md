# JORNATO — CONTINUIDAD CANÓNICA · 21 NOV 2026 · N3-R1 CERRADO / N4 ACTIVO

**ÚNICA ORDEN ACTIVA:** [CODEX_LOTE_ACTUAL.md](CODEX_LOTE_ACTUAL.md), TASK `JOR-N4-FULL-SOURCE-AND-SERVER-QA-20261121`. N3-R1 YA TERMINÓ; NO repetir C2, N1, N2, N3 o las anteriores auditorías 10+10. Si aparece ZIP N4 nuevo o Codex ya está ejecutando N4, adjudicar ese resultado antes de delegar nuevamente. [Dictamen N3-R1](JORNATO_N3_R1_DICTAMEN_Y_N4_20261121.md).

## Evidencia de N3-R1 ya adjudicada

- ZIP original `JOR-N3-UI-OFFLINE-INTEGRATION-CANDIDATE-20261121-UNICO.zip`, SHA256 `C960FA83ABAE677E4DDF1E59432C0915B75A85017FD02D65F4FBD9731ACA57DA`, 13.164 bytes, 11 miembros CRC PASS, manifiesto 10/10 SHA y bytes PASS (verificación directa de ZIP).
- `RESULT=PARTIAL_WITH_GAPS`. UI host `KioskScreen` **9/9 PASS** y widget vecina **4/4 PASS** más análisis focal PASS según registros de Codex. Test SHA `A1317B664570CDA738DD017C50C02E079A34B332137E026978B190B95CEA7BF3`; pantalla POST SHA `7925AC0074A74081E8DFE4D0B8CEB9DB4E20C3137D9756C615EED861D9B9A6A5`. Doble toque corregido: una sola marcación. Ruta SQLite FFI sintética host con 0 creaciones `HttpClient` en los nueve casos, pero NO certifica login empleado, Android ni todo el producto.
- Fuente candidata N3 = **65 archivos**, overlay 56 fuentes cotejadas, **155 rutas backend** omitidas, 179/235 rutas modificadas WIP no incluidas. `CANDIDATE_SOURCE_PARITY=PASS_SCOPED`, `CANDIDATE_HOST_SMOKE=BLOCKED_ENV`, `SOURCE_CANDIDATE=PARITY_ONLY_NOT_COMPILED`. Ausencia de `.dart_tool/package_config.json` y `android/local.properties` en copia nueva no demuestra defecto de código: entorno host aislado puede generar config offline solo si caches están completos y sin red.
- N2-R1: siete archivos / **86 PASS** host, no reejecutados por N3; backend histórico B21F-S3 **158/2450 PASS_SCOPED** solo en su SHA y alcance, no E2E.
- WIP Windows reportado: `D:\codex\Jornato`, branch `codex/jor-b08-h4-domain-20261025`, HEAD `faf5fe283191f8b5a2724b397009512a2caec1b6`, 235 status, 224 untracked, 11 tracked modified, stage 0; índice SHA `25CC609803D7E68D5F3ECF428198B2432CF1EA37030546735DD3F03299D905E1` intacto. Copias privadas solo D:, `OFF_DEVICE_BACKUP=NO`; ChatGPT no inspecciona la fuente privada desde GitHub.

## N4 — macrobloque grande de ejecución, no otra revisión

1. Custodia y **candidato privado integral app + Laravel + migraciones + tests** desde HEAD + overlays tracked/untracked necesarios. Controlar los 155 backend del inventario N3; filtrar secretos/PII; sin git stage/commit/reset/merge/push.
2. Smoke host en candidato privado con Flutter 3.47.8 y caché existente, generando `package_config` con resolución estrictamente offline **solo si segura**. No copiar configuraciones derivadas del WIP, no repetir las siete suites N2. La ausencia de `android/local.properties` no implica automáticamente fallo del test widget host.
3. Intake backend Laravel y extracción de contratos **reales**, reutilizando los kits existentes: [S0 ready room](JORNATO_SERVIDOR_S0_READY_ROOM_20261121.md), [24 gates](JORNATO_SERVIDOR_GATES_S0_20261121.csv), [S1 intake](JORNATO_SERVIDOR_S1_KIT_ACTIVACION_POST_N3_20261121.md), [S2 preflight](JORNATO_S2_PAQUETE_DESPLIEGUE_Y_PISTAS_DE_RELEASE_20261121.md). No crear Laravel nuevo ni dar por hecho que el script PR2 está en WIP.
4. Solo con MariaDB QA NUEVA y exclusiva, PHP/deps ya disponibles y aislamiento comprobado: migraciones y hasta ocho pruebas adversariales E2E tenant A/B, PAT revocado, `requestId` y recibos. Si falla DB/caché, clasificar bloqueo causal y continuar el subalcance independiente. No red Pro/producción ni deploy.
5. Un único ZIP de resultados sanitizados; fuentes/snapshots/patches privados fuera del ZIP. No tocar Android/ADB, `B22` ni release.

## GitHub y reglas

Repo público `sierraglobalcompany-rgb/Jornato`, `main=1ee6aae821f8cf177cc64149081ad8847f7fec2e`, PR1 F0 Draft `faf5fe283191f8b5a2724b397009512a2caec1b6`, PR3 F0 Draft `104469b119752f395cf9881e732d582feab9db4e` observado antes de editar esta nota. PR2 es solo documentación; el WIP avanzado **NO** está publicado. Sin autorización expresa para divulgar fuentes o secretos. Leyes PingPongLaw L1 KISS L2 antirruido L3 causa raíz L4 UX humana L5 QA independiente L6 antipingpong. `requestId`/histórico `requetId`, `SERVER_STORED != RECOGNIZED`, B19/B20 deny-all, OD01–OD08 pendientes.

**ANDROID_NATIVE=NOT_RUN; RESTART_READBACK=BLOCKED_HARNESS; H9_GLOBAL=NO_GO; B22=NOT_AUTHORIZED; RELEASE=NO_GO.**

**NEXT_OWNER=CODEX_LUNA_N4_IF_NOT_ALREADY_RUNNING; AFTER_SINGLE_ZIP=CHATGPT_DIRECTOR.**