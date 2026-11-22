# JORNATO — RECOVERY HANDOFF ACTUAL · A2 GRADLE / APK QA · 22-NOV-2026

**Leer primero:** [continuidad canónica](JORNATO_CONTINUIDAD.md), [dictamen A1 verificado](JORNATO_A1_R2_DICTAMEN_Y_A2_20261122.md), [una sola orden CODEX A2](CODEX_LOTE_ACTUAL.md). **A1 cerró `PARTIAL_WITH_GAPS`; A2 es el siguiente bloque (NO A1-R3).** No volver a construir offline usando la misma caché incompleta. Si hay ZIP A2 posterior, verificarlo antes de planificar otra cosa.

## Hechos observados y límites

A1 ZIP `JOR-A1-ANDROID-OFFLINE-APK-QA-CANDIDATE-20261121-UNICO.zip` SHA256 `C0087642ACED1BE983DC081A95A63B0B4829EE30414372B29835A4852D79555A`, 9828 bytes, 8 entradas CRC, 7/7 hashes correctos. Según CSV Codex: 82 rutas app paridad PRE/POST, Pub 79 con lock SHA `F515D69563850E8893A17585D8BAB57A8E6484E18CE1FEF4BDDC6BB836F83B34`, Gradle 9.3.1 + JDK21 + Android SDK 36 disponibles, único `:app:assembleB14qaDebug --offline` rc1 por 22 JAR Gradle (plugin DSL 6.4.2 y módulos Kotlin 2.2.21) en **caché privada**, antes de compilar app. No APK, no certificado, no merged manifest. Manifiesto fuente QA debug permite cleartext: no aprobar release por ello. WIP PRE/POST intacto (235 rutas, staged0, HEAD `faf5fe283191f8b5a2724b397009512a2caec1b6`). OFF_DEVICE_BACKUP=NO. Los fallos y PASS de runtime son reportados por Codex; ChatGPT verificó ZIP íntegro, no accedió a su Windows.

## Único siguiente trabajo

`TASK=JOR-A2-GRADLE-DEPS-APK-QA-20261122`: reutilizar A1/N5 privado, clonar a lab A2 con Gradle/Pub/signing privados, revisar repositorios fijos, una compilación de misma variante. Si los 22 paquetes ya están presentes en fuente autorizada, compilar `--offline`; si no, A2 ofrece **descarga puntual de dependencias de compilación fijadas desde repositorios oficiales HTTPS**, y solo si propietario **envía el nuevo prompt a Codex** aceptando esa excepción. No `--refresh-dependencies`, no upgrades, no acceso a otros proyectos, no Docker, no Android físico. APK si se obtiene en D: privado, ZIP único sanitario, WIP intacto; revisar paquetes de QA y bandera `usesCleartextTraffic` en merged manifest. Si falla repo, reportar bloqueo exacto sin nuevos ciclos.

## Reglas de continuidad

No repetir N2/N3/N4/N5 host, N6/N7 Docker, A1 Pub/paridad ni 10+10 rituales. No Pro/cloud antes de servidor real. La app offline debe demostrar SQLCipher/Keystore/rehidratación/corrupción en dispositivo físico, aún no verificados. B19/B20 deny-all, OD02–OD04 owner pendientes, `requestId`/`requetId`, `SERVER_STORED != RECOGNIZED`. PingPongLaw L1–L6, KISS, no parches, no publishing WIP GitHub público. Docker Desktop storage diagnóstico previo **no autorizado/PAUSADO**; A2 no lo necesita.

**NEXT=CODEX_LUNA_A2_DESPUÉS_DEL_ENVÍO_DEL_PROMPT; THEN=CHATGPT_DIRECTOR_ADJUDICAR_ZIP; RELEASE=NO_GO.**
