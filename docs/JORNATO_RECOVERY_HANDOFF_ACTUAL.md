# JORNATO — RECOVERY HANDOFF ACTUAL · A2-R4-V2 · 22-NOV-2026

**Regla más importante:** [Orden Codex vigente](CODEX_LOTE_ACTUAL.md) es `A2-R4-V2` **condicional**; **si A2-R4 original ya está en ejecución o entregó ZIP, NO iniciar V2**. Resolver ese ZIP con Director. No crear A3, no repetir N2–N7/A1/A2-R1–R3. [Auditoría única delta R4](JORNATO_A2_R4_V2_AUDITORIA_10_VERDUGO_10_JUEZ_20261122.md), [Continuidad canónica](JORNATO_CONTINUIDAD.md).

## Fuente de verdad y decisiones

Último ZIP R3 verificado directamente: SHA `5C3E7B1758380CE8D7895C1EF1981F2FD131A4A90F79C8A300BAF57153214D11` 9.188B/7 miembros/CRC PASS/manifiesto 6/6. 82/82 fuentes reutilizadas, caché A2 con 22 variantes A1 recuperadas (39 JAR nuevos) y una ejecución Gradle `:app:assembleB14qaDebug` exit1 `ClassCastException ApplicationExtensionImpl→AbstractAppExtension` al aplicar plugin Flutter 3.47.8 con AGP9.1.0. **No APK**. La solución oficial mínima `android.newDsl=false` se prueba solo en copia privada `private/r4/candidate/android/gradle.properties`, sin alterar otras flags/versions, WIP ni SDK. Editor preserva bytes, finales de línea y BOM; 10 fixtures sintéticos PASS. A2-R4-V2 guarda una sola ejecución Gradle y ZIP `delivery-r4`; si otro fallo, STOP con causa (sin nuevas flags en cascada).

## Restricciones

`D:\codex\Jornato` WIP rama `codex/jor-b08-h4-domain-20261025` HEAD `faf5fe283191f8b5a2724b397009512a2caec1b6`, 235 entradas, staged0, índice `25CC609803D7E68D5F3ECF428198B2432CF1EA37030546735DD3F03299D905E1` intacto según R3. Solo lectura; no Git add/commit/push/merge/rebase. Otros Codex en el mismo host. Docker Desktop diagnóstico sin autorización, PHP/BD solo aislados, NO usar. Fuentes avanzadas solamente en candidato privado, no en GitHub. Flutter N5 y Pub A1 PASS scoped, no repetir. R1/R3 ZIPs no tocar. Sin Android físico, sin teléfono, SQLCipher/Keystore/corrupción/reinicio/backup externo no probados. `RELEASE=NO_GO`. `QA_DEBUG_CLEARTEXT=true` era fuente debug, no verificar release desde ese dato.

## Qué hace quien sigue

- Si **NO comenzó** A2-R4: **Codex Luna** ejecuta el único archivo `docs/CODEX_LOTE_ACTUAL.md` (también Markdown descargable), no auditoría adicional. Un delta de propiedad y un build, ZIP único sanitizado.
- Si A2-R4 original **comenzó o finalizó**: **ChatGPT Director** revisa su ZIP, no se lanza V2. Si hay APK, static QA primero, luego autorización para Android físico; si hay bloqueo, causa concreta antes de otra acción.
- GitHub: documentos en PR2 DRAFT, **nunca publicar** APK, fuentes privadas, claves, logs crudos, datos laborales. main/PR1/PR3 sin cambios.
