# JORNATO — CONTINUIDAD CANÓNICA · 21 NOVIEMBRE 2026 · N2-R1 CERRADO, N3 ACTIVO

**ORDEN ÚNICA:** [CODEX_LOTE_ACTUAL.md](CODEX_LOTE_ACTUAL.md), TASK `JOR-N3-UI-OFFLINE-INTEGRATION-CANDIDATE-20261121`. **N2-R1 terminó PASS_HOST_SCOPED y NO se reejecuta.** Si ya existe un ZIP N3 o un Codex concurrente, inspeccionar primero y NO duplicar. [Dictamen de evidencia N2-R1 y plan](JORNATO_N2_R1_DICTAMEN_NEXT_N3_20261121.md).

## Evidencias adjudicadas, no repetir
- El ZIP N2-R1 `JOR-N2-SDK-RECOVERY-HOST-GATE-20261120-UNICO.zip` recibido en ChatGPT fue verificado directamente: **7264 bytes, SHA256 `CC4846C6D901564E246D17B8A28C2B28A772F5A76E00442E0A3BFD19D19B04DB`, 7 miembros CRC válido, 6/6 SHA+bytes del manifiesto correctos**. `HOST_RESULTS.csv`: 7 archivos host, **86 PASS, 0 FAIL, 0 SKIP**; formato/análisis PASS según Codex. No están los logs crudos ni el WIP para ejecución independiente. `HOST_GATE=PASS_SCOPED`.
- Los 7 archivos: `attendance_test.dart` 34, `attendance_repository_test.dart` 11, `kiosk_repository_test.dart` 23, `kiosk_time_test.dart` 5, `attendance_report_test.dart` 5, `kiosk_employee_today_card_test.dart` 3 y `widget_test.dart` 5. No ejecutar de nuevo sin cambio de propietario/hash.
- N2 cambió solamente formato de `test/kiosk_repository_test.dart` (PRE SHA `019B5A1EDCA75802C2EFD8F07817C00FBF3A30811539A310112D1FAE375BF091`, POST SHA `9274554AB462FE3E4BF8A578C38FA11CEECD669DFE3F9338E8260ACBF1397C39`) según `WIP_DELTA_SUMMARY.csv`; el índice, staging y 234 rutas WIP permanecieron sin delta. Rama local reportada `codex/jor-b08-h4-domain-20261025`, HEAD `faf5fe283191f8b5a2724b397009512a2caec1b6`.
- Flutter 3.47.8/Dart 3.13.7 disponibles en ruta `android/local.properties` durante N2, caché host comprobada, paquete SQLite FFI sin descarga. **HOST_PROVENANCE=UNDETERMINED** entre ejecuciones; no asumir identidad entre hosts. No instalar otro SDK.
- N1-R2 dejó snapshot de 216 archivos/2.904.617 bytes en D: y restauración 5/5 según Codex; N2 reportó verificación 216/216. **OFF_DEVICE_BACKUP=NO**. El WIP avanzado incluye 223 untracked y 11 tracked modificados históricamente; no forma parte de los PR remotos.

## Las brechas reales que N3 debe cerrar
1. `KIOSK_GATE_MATRIX.csv` marca acciones visuales reales de `KioskScreen` `ESCRITO_NO_PROBADO`: los 86 tests prueban dominio/repositorio y una tarjeta, no la rama de botones nocturnos de la pantalla. N3 = test widget directo de transición alrededor de medianoche y hora fin planificada; corregir sólo defectos causales, sin otro motor ni nueva DB.
2. `Límite offline=ESCRITO_NO_PROBADO` en host: N3 registra dependencias de red o evidencia de que no existen, sin presentar esto como modo avión Android. El APK QA no debe tocarse.
3. Preparar **candidato local privado y reconstruible** que incluya untracked imprescindibles sin modificar el WIP ni exponer secretos. Reutilizar snapshot previo; copia sólo en D: sigue **sin** respaldo externo. Crear plan para repositorio privado autorizado; **no** push/merge código en GitHub público.
4. Un solo ZIP N3 sanitario con prueba UI focal, estado fuente, cobertura candidato y siguientes bloqueos. No repetir las siete suites completas, 10+10, C2 físico ni tests generales.

## GitHub, límites y lanzamiento
- Repo público `sierraglobalcompany-rgb/Jornato`: main `1ee6aae821f8cf177cc64149081ad8847f7fec2e`; PR #1 F0 Draft `faf5fe283191f8b5a2724b397009512a2caec1b6`; PR #3 Draft apilado F0 `104469b119752f395cf9881e732d582feab9db4e`. PR #2 **documentación**; todas las referencias observadas antes de publicar este cambio. El script de comparación PR2 con HEAD antiguo `78b32284...` no puede resolver la integración avanzada.
- Leyes PingPongLaw L1 KISS, L2 antirruido, L3 causa raíz, L4 UX humana, L5 evidencia independiente, L6 antipingpong. Mantener `requestId`/histórico `requetId` y `SERVER_STORED` distinto de `RECOGNIZED`, B19/B20 deny-all, OD01–OD08 sin autorización.
- SQLCipher/Keystore/idempotencia/corrupción Android `NOT_RUN`; restart real `BLOCKED_HARNESS`; Pro/tenant `BLOCKED_CONTRACT`; H9_GLOBAL `NO_GO`; B22 `NOT_AUTHORIZED`; RELEASE `NO_GO`. Ni los 86 PASS ni el candidato local aprueban release.
- Puertas posteriores a N3: custodiar **fuera del equipo en medio/destino privado autorizado**, revisar secretos/PII y crear PR de código seguro; QA física Android con ruta autorizada y causa del VM Service verificada; Pro, portal, RR.HH., OD, UAT L4/L5, firma y release tras GO explícito.

**NEXT_OWNER=CODEX_LUNA_N3_IF_NO_NEWER_RUN; AFTER_ZIP=CHATGPT_DIRECTOR.**
