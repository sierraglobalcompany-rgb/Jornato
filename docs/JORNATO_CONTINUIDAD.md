# JORNATO — CONTINUIDAD CANÓNICA · 22-NOV-2026 · A2-R3 CERRADO / A2-R4 ACTIVO CONDICIONAL

**ÚNICA ORDEN PARA CODEX LUNA:** [CODEX_LOTE_ACTUAL.md](CODEX_LOTE_ACTUAL.md), `TASK=JOR-A2-GRADLE-DEPS-APK-QA-20261122`, `PROMPT_REVISION=A2-R4-20261122`. Si R4 ya está en curso o produjo ZIP, no ejecutarlo de nuevo. A2-R1 y A2-R3 terminaron, no repetir; A2-R2 no comenzó según ZIP R3. No crear A3. [Dictamen verificable R3](JORNATO_A2_R3_DICTAMEN_DECISION_A2_R4_20261122.md); [Handoff](JORNATO_RECOVERY_HANDOFF_ACTUAL.md).

## Pruebas históricas cerradas
- N5 Flutter candidato PASS, 9/9 kiosco; Pub offline lock `F515D69563850E8893A17585D8BAB57A8E6484E18CE1FEF4BDDC6BB836F83B34`, 82 archivos Android y Dart certificados en A1; no repetir tests N2/N3/N5.
- A1 ZIP SHA `C0087642ACED1BE983DC081A95A63B0B4829EE30414372B29835A4852D79555A`, fuentes 82/82, Pub PASS, Gradle 22 faltantes.
- A2-R1 ZIP SHA `C891EC71F5D30511065E0F902B1D97A19F5AA22F2D913FA48770E8D6328B6B24` resolvió policy Flutter Engine pero no construyó.
- A2-R3 ZIP SHA `5C3E7B1758380CE8D7895C1EF1981F2FD131A4A90F79C8A300BAF57153214D11`: **directamente auditado** (9.188 bytes; 7 miembros, CRC PASS; manifiesto 6/6) — 22/22 faltantes recuperados, 39 JAR nuevos, 38 GAV; Flutter 3.47.8 + AGP9.1.0 + Gradle9.3.1 + Kotlin2.4.0; una ejecución `:app:assembleB14qaDebug` exit1 por cast `ApplicationExtensionImpl` → `AbstractAppExtension` en SDK FlutterPlugin.kt:354. No APK, fuente app no compilada. Integridad de dependencias SHA inventario, NO firma/pinning por artefacto. `NETWORK_SCOPE=POLICY_CONTROLLED_NOT_EGRESS_SANDBOXED`.
- N6/N7 Docker/PHP bloqueado; no investigar ni tocar Docker compartido sin autorización. Laravel QA E01-E08 NO_RUN. Android C2 antiguo no certificó UAT/VMService; Android SQLCipher/Keystore/reinicio/corrupción/físico no corridos. OFF_DEVICE_BACKUP=NO, RELEASE=NO_GO.

## Una acción productiva: A2-R4
- Verificar que R4 no ha comenzado y que su laboratorio no existe; reutilizar A2_ROOT privado y caches resolvidas, crear copia R4 sin hardlinks, mantener A2-R1/R3 ZIP originales. **Cambiar solo `android.newDsl=false` en `android/gradle.properties` de la copia R4**, si propiedad ausente o `true`, sin alterar `android.builtInKotlin` ni versiones o SDK. Si ya false o hay conflicto, STOP, no fingir causa.
- Una única invocación de `:app:assembleB14qaDebug` con Gradle original, permitido mismo conjunto de repos oficiales build HTTPS, sin SDK/JDK nuevo ni otros repositorios, sin WIP, Docker o Android físico. Si APK nuevo, verificar firma, manifest, SHA y cleartext QA; si bloquea, entregar causa nueva. ZIP solo `delivery-r4` sanitario, no APK ni secretos. No repetir N5/A1/A2-R3.
- **Custodia WIP**: rama `codex/jor-b08-h4-domain-20261025`, HEAD `faf5fe283191f8b5a2724b397009512a2caec1b6`, status 235 (224 untracked,11 modified), staged0, index SHA `25CC609803D7E68D5F3ECF428198B2432CF1EA37030546735DD3F03299D905E1`. No publicar código avanzado en repo público.
- **GitHub:** repo `sierraglobalcompany-rgb/Jornato`, PR #2 documental Draft, main/PR #1/PR #3 no tocar. Leyes: KISS, PingPongLaw L1–L6, evitar auditar/tests repetidos, evidencia única ZIP. Director razona; Codex ejecuta.

**NEXT_OWNER=CODEX_LUNA_IF_R4_NOT_STARTED; AFTER_ZIP=CHATGPT_DIRECTOR; RELEASE=NO_GO.**
