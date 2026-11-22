# JORNATO — RECOVERY HANDOFF · A2-R4 (COMPATIBILIDAD AGP 9) · 22-NOV-2026

**LEER POR ORDEN:** [continuidad](JORNATO_CONTINUIDAD.md) → [dictamen A2-R3](JORNATO_A2_R3_DICTAMEN_DECISION_A2_R4_20261122.md) → [única orden A2-R4](CODEX_LOTE_ACTUAL.md). No recurrir a prompts R1/R2/R3 archivados, ya cerrados. R4 solo si no hay proceso ni ZIP R4. No reauditar A1, Gradle caches, N5/Flutter ni Docker.

## Lo probado
R3 ZIP **9.188 bytes, CRC PASS, manifiesto 6/6**, SHA `5C3E7B1758380CE8D7895C1EF1981F2FD131A4A90F79C8A300BAF57153214D11`. Flutter 3.47.8, AGP 9.1.0, Gradle 9.3.1, KGP 2.4.0, JDK21. Único Gradle build R3 exit1 antes de compilar app por cast `ApplicationExtensionImpl`→`AbstractAppExtension`, `FlutterPlugin.kt:354`; 22 faltantes A1 resueltos y 39 JAR nuevos. No APK generado. Fuente app 82/82 reutilizada, Pub PASS histórico. WIP PRE/POST sin delta según Codex; no Docker, no Android físico. No off-device backup, no release.

## Decisión próxima, no una auditoría
Flutter docs recomiendan `android.newDsl=false` para AGP9 mientras usa compatibilidad DSL antigua. El ZIP no contiene el fichero properties actual, por eso **no está comprobado todavía si falta/está true**. Codex examina original antes de editar, crea una copia R4 del candidato A2 privado y cambia SOLO esa propiedad **si es necesario**. Si ya está false, STOP (causa diferente) sin construir. Si cambia, ejecutar **exactamente una** `:app:assembleB14qaDebug` con mismo toolchain, cachés A2, firmas QA privadas y repositorios build ya autorizados. Si APK PASS, cert SHA/firma/manifest, no instalar teléfono; ZIP R4 único sanitizado. Si falla, primer error exacto y regreso al Director; no más variantes.

## Límites
No cambiar versiones Flutter/AGP/Kotlin/Gradle, no tocar SDK Flutter, WIP, otros proyectos, Docker/DB, claves release o teléfonos. `android.builtInKotlin` se conserva sin modificación. No compartir APK ni código; no commit/merge/deploy. Si build funciona, todavía faltan pruebas Android físico, seguridad offline/SQLCipher/Keystore, backup off-device, QA servidor y aprobación release. `RELEASE=NO_GO`.

**NEXT_OWNER=CODEX_LUNA_CONDITIONAL; AFTER_A2_R4_ZIP=CHATGPT_DIRECTOR**.
