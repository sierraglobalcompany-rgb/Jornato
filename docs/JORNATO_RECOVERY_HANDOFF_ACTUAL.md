# JORNATO — HANDOFF DE RECUPERACIÓN · A2-R2 REANUDACIÓN ACTIVA · 22-NOV-2026

**LEER PRIMERO:** [continuidad canónica](JORNATO_CONTINUIDAD.md) → [orden única A2-R2](CODEX_LOTE_ACTUAL.md). La auditoría A2-R1 10 verdugo+10 juez [ya está cerrada](JORNATO_A2_R1_AUDITORIA_10_VERDUGO_10_JUEZ_20261122.md); **NO repetirla**. Si llega ZIP A2-R2, el Director lo adjudica antes de preparar otro trabajo.

## Resultado real recibido A2-R1

ChatGPT verificó ZIP subido a la conversación `JOR-A2-GRADLE-DEPS-APK-QA-20261122-UNICO.zip`, 6283 B, SHA256 `C891EC71F5D30511065E0F902B1D97A19F5AA22F2D913FA48770E8D6328B6B24`, 7 miembros CRC PASS, manifiesto 6/6 PASS. Codex reporta `SOURCE=PASS_82_OF_82`, `PUB=PASS_OFFLINE_LOCKED`, caché Gradle A2 31.270 archivos cotejados, `A2_BUILD=NOT_RUN`, sin APK. Bloqueo **puramente de autorización del repositorio Flutter Maven** `storage.googleapis.com/download.flutter.io` agregado por `dev.flutter.flutter-gradle-plugin`; nunca se invocó Gradle. WIP PRE/POST intacto, Docker no tocado, Android físico NOT_RUN.

## Decisión única del Director

Permitir en A2-R2 el origen HTTPS exacto `https://storage.googleapis.com/download.flutter.io/` o el prefijo derivado **estrictamente** del `engine.realm` local si no está vacío. Es parte de Flutter Engine, no permiso para otro contenido de Google Cloud Storage. Conservar los cuatro orígenes anteriores de dependencias oficiales Gradle: Plugin Portal, su redirect oficial, Maven Central, Google Maven. Sin nuevas versiones, SDK/JDK, proxies, mirrors, firewall, Docker, bases de datos, ni código WIP. El permiso se limita al proceso de compilación QA en caché privada A2, no al runtime de la app.

**IMPORTANTE:** A2-R1 **ya finalizó**, por lo que no aplicar la vieja regla A2-R1 «si existe ZIP A2, detener». La nueva A2-R2 es reanudación expresa de checkpoint, no una segunda compilación porque A2-R1 hizo **0 builds**. Guardar ZIP R1 sin alteración; usar el laboratorio A2 existente. Si hay ZIP/proceso A2-R2, no duplicar. Un build `:app:assembleB14qaDebug`; un ZIP nuevo en `delivery-r2`. Si Gradle encuentra algo fuera de whitelist, STOP; no improvisar otro host ni mutar build scripts.

## Lo que NO está verde

Sin APK Android actual, firma ni manifiesto fusionado. APK debug viejo C2 no demuestra QA del candidato. Android físico SQLCipher/Keystore/rehidratación/corrupción/GPS/selfie y backup externo no certificados. Servidor Laravel E01–E08 bloqueado por runtime PHP Docker compartido; diagnóstico global no autorizado. Producto sigue `RELEASE=NO_GO`, B19/B20 deny-all, OD02/03/04 pendientes, `requestId`/`requetId`, `SERVER_STORED != RECOGNIZED`. GitHub público PR #2 es documental y **no contiene el código privado avanzado**; main/PR1/PR3 sin cambios.

**NEXT=CODEX_LUNA_A2_R2; AFTER_ZIP=CHATGPT_DIRECTOR.**
