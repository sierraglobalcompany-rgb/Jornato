# JORNATO — CONTINUIDAD CANÓNICA · 22-NOV-2026 · A1-R2 CERRADO / A2 PREPARADO

**ÚNICO TRABAJO SIGUIENTE PARA CODEX LUNA:** [CODEX_LOTE_ACTUAL.md](CODEX_LOTE_ACTUAL.md), `TASK=JOR-A2-GRADLE-DEPS-APK-QA-20261122`. **A1-R2 YA TERMINÓ**. No ejecutar ni pedir de nuevo la orden A1, no repetir N2–N7 ni volver a diagnosticar Docker. El propietario decide activar A2 **enviando el prompt Markdown a Codex**; hacerlo autoriza únicamente las descargas oficiales de dependencias Gradle de compilación contempladas en la orden. Si no acepta esa excepción, no activar A2 y mantener el bloqueo. [Dictamen A1 y decisión A2](JORNATO_A1_R2_DICTAMEN_Y_A2_20261122.md). [Handoff](JORNATO_RECOVERY_HANDOFF_ACTUAL.md).

## Evidencias cerradas y fuente de verdad

- **ZIP A1** inspeccionado directamente en ChatGPT: 9.828 B, SHA256 `C0087642ACED1BE983DC081A95A63B0B4829EE30414372B29835A4852D79555A`, 8 archivos CRC PASS, manifiesto 7/7 SHA+bytes PASS. Codex reportó `RESULT=PARTIAL_WITH_GAPS`, WIP no tocado, Docker no tocado, Android físico NOT_RUN, APK NOT_BUILT.
- **A1 82/82 fuentes app**, hashes y bytes PRE/POST coinciden. N5 origen 232 rutas (82 app, 150 servidor) con paridad documentada. No hay copia fuente privada en GitHub público ni en ZIP de evidencia; vive en `D:\codex\_REPORTES\Jornato\JOR-A1-ANDROID-OFFLINE-APK-QA-CANDIDATE-20261121\private` o N5. **No reconstruir fuente desde PR1/main**, son skeleton antiguos.
- **Flutter** N5 KioskScreen 9/9 + analyze sin errores; A1 Pub `--offline --enforce-lockfile` PASS, 79 versiones; `pubspec.lock` `F515D69563850E8893A17585D8BAB57A8E6484E18CE1FEF4BDDC6BB836F83B34`. N2 86 tests y N3 9+4 tests históricos: no repetir sin cambio de producto.
- **Android build** A1 único `gradlew.bat --offline --no-daemon --console=plain :app:assembleB14qaDebug`, exit 1 durante setup del plugin Flutter por **22 artefactos Gradle** ausentes en cache privado, uno `org.gradle.kotlin:gradle-kotlin-dsl-plugins:6.4.2`, 21 archivos Kotlin 2.2.21 (variantes múltiples). No compiló app. Toolchain reportado: Gradle 9.3.1/JDK 21.0.12/SDK36/NDK28.2/CMake3.22.1, sin necesidad demostrada de upgrade. **No hay APK A1**.
- **Seguridad APK:** fuente `src/b14qa/debug/AndroidManifest.xml` declara `usesCleartextTraffic=true`, **solo variante debug** confirmada; verificar merged manifest en APK nuevo, no aprobar release ni tráfico con datos reales sin evaluación.
- **WIP privado** `D:\codex\Jornato`, HEAD `faf5fe283191f8b5a2724b397009512a2caec1b6`, rama `codex/jor-b08-h4-domain-20261025`, índice `25CC609803D7E68D5F3ECF428198B2432CF1EA37030546735DD3F03299D905E1`, 235 rutas (224 untracked, 11 modified) staged 0, intacto según Codex. OFF_DEVICE_BACKUP=NO.
- **Servidor/infraestructura** N4/N5 Laravel QA E01–E08 bloqueadas, N6 PHP `exec format error`, N7 copias de binarios fallidas; no se ha autorizado investigar/alterar Docker Desktop compartido. La política [Docker exclusivo por proyecto](JORNATO_DOCKER_AISLAMIENTO_PROYECTOS_20261121.md) permanece; A2 no usa Docker. Sin servidor real no hay autorización de planes Pro/cloud ni release general.
- **Android físico** C2 APK antiguo instaló pero VM Service bloqueó QA; no repetir C2 ni instalar A2 sin permiso. SQLCipher/Keystore/reinicio/corrupción/offline real no certificados, B19/B20 deny-all, OD02/03/04 pendientes. `SERVER_STORED != RECOGNIZED`; `requestId` vs `requetId` legado. No nómina ni acceso ajeno entre tenants.

## Nueva política A2 — solo compilación

- **Antes de build** copiar únicamente 82 fuentes y cachés propias certificadas a `A2_ROOT/private`, verificar que no haya proceso A2 concurrente, evaluar una sola vez disponibilidad de 22 dependencias en caché.
- **Si todo cacheado:** un único `assembleB14qaDebug --offline` usando Gradle 9.3.1. **Si faltan dependencias:** el propietario puede autorizar, al enviar A2 a Codex, una única resolución **HTTPS oficial de versiones fijas** Gradle Plugin Portal/Maven Central/Google Maven en `GRADLE_USER_HOME` privado; no versiones nuevas, ni SDK/JDK/toolchains nuevos, ni repositorios extra, sin Docker. Un build, no uno fallido offline más otro online.
- Guardas y outputs: APK firmado QA verificable solo en carpeta D: privada; manifiesto fusionado/cleartext sujeto a gate; ZIP único de evidencia sin APK ni secretos. No telefonía física ni lanzamiento automático. Si falta repositorio, bloquear sin improvisar. Si falla producto, una corrección focal en COPIA A2, no WIP.

## GitHub / roles / leyes

Repo `sierraglobalcompany-rgb/Jornato`. PR #2 documental exclusivamente, `main=1ee6aae821f8cf177cc64149081ad8847f7fec2e`, PR #1 Draft HEAD `faf5fe283191f8b5a2724b397009512a2caec1b6`, PR #3 Draft HEAD `104469b119752f395cf9881e732d582feab9db4e`. No merge, no deploy, no publicar WIP. ChatGPT director; Codex ejecutor. KISS, PingPongLaw L1–L6, un solo macrobloque, cero auditorías rituales, un ZIP con evidencia. `RELEASE=NO_GO`; Android físico, backup externo y QA server siguen pendientes.

**NEXT_OWNER=CODEX_LUNA_A2 (AL ENVIARLE EL PROMPT); AFTER_ONE_ZIP=CHATGPT_DIRECTOR.**
