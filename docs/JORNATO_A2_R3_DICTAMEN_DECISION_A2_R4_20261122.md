# JORNATO — DICTAMEN A2-R3 VERIFICADO / DECISIÓN A2-R4 · 22-NOV-2026

## Resultado real verificado por ChatGPT Director
- ZIP recibido `JOR-A2-GRADLE-DEPS-APK-QA-20261122-R3-UNICO.zip`, **9.188 bytes, SHA256 `5C3E7B1758380CE8D7895C1EF1981F2FD131A4A90F79C8A300BAF57153214D11`**. Inspección directa: 7 miembros, CRC correcto, manifiesto 6/6 SHA-256+bytes correcto.
- Fuentes 82/82 y Pub PASS reutilizados, sin volver a correr pruebas; Gradle 9.3.1, Flutter 3.47.8, AGP 9.1.0, KGP 2.4.0, JDK 21.0.12, SDK36. A2-R1 no modificado. Primer build R3 (3m04s, exit1) ejecutó `:app:assembleB14qaDebug` una sola vez.
- Resolvió el bloqueo previo: 22/22 variantes ausentes A1 recuperadas, 39 nuevos JAR en caché privada (38 coordenadas únicas). CSV inventaría hashes pero no URLs individuales ni verificación oficial pinneada; NO atribuir autenticidad plena.
- Bloqueo observado: excepción `ApplicationExtensionImpl$AgpDecorated_Decorated` → `AbstractAppExtension` al aplicar `dev.flutter.flutter-gradle-plugin` en `FlutterPlugin.kt:354`. Falló antes de compilar fuentes Jornato; **no demostrar defecto de producto**. No se generó APK ni se validó firma/manifest, Android físico no probado. WIP PRE/POST reportado intacto, Docker no tocado, off-device backup NO, RELEASE NO_GO.

## Decisión causal sin vueltas
Flutter documenta la compatibilidad temporal de AGP 9 mediante **`android.newDsl=false`**, que conserva APIs DSL antiguas utilizadas por el plugin Flutter. Esta es la primera y única corrección autorizada en R4; **NO downgrade de AGP/Gradle/Kotlin/Flutter, ni parche del SDK**. No está probado en Jornato que el flag falte o esté true, pues el ZIP no contiene los Gradle properties de la copia; Codex debe comprobarlo estáticamente **antes** de modificar y solo avanzar si es causalmente nuevo. Si ya es false, STOP, no lanzar compilación con la misma causa.

## Por qué no volver a ejecutar la campaña anterior
N5 y A1: Flutter/Pub y fuente aprobado; A2-R1 cache/repo preflight parcial; A2-R3 recuperó 22 dependencias y llegó a aplicar Flutter plugin. Otro chequeo de 31.270 elementos, descargas innecesarias, reemplazar versiones o modificar Docker sería ruido. La intervención mínima es: 1 propiedad en 1 archivo privado, 1 build de tarea ya conocida, APK QA nueva si PASS, 1 ZIP. La red es de compilación solamente y no cuenta como sandbox de egreso. Si se produce otro error, STOP con primera causa nueva.

## Referencia técnica externa (no evidencia de ejecución local)
- Flutter oficial: https://docs.flutter.dev/release/breaking-changes/migrate-to-built-in-kotlin/for-app-developers (apartado «Verify flags in the Gradle properties file»): `android.newDsl=false`, migradores automáticos para `flutter run/build`, pero A2 usa wrapper Gradle directamente.
- Flutter oficial: https://docs.flutter.dev/release/breaking-changes/migrate-to-built-in-kotlin (AGP 9 y compatibilidad DSL temporal).
- Issue público de la excepción exacta: https://github.com/flutter/flutter/issues/192111. Un issue no verifica que nuestro candidato esté arreglado; solo corrobora diagnóstico de clase.

## Autoridad y estado
Orden siguiente: `docs/CODEX_LOTE_ACTUAL.md`, `TASK=JOR-A2-GRADLE-DEPS-APK-QA-20261122`, `PROMPT_REVISION=A2-R4-20261122`, **solo si no hay R4 ya iniciado**. No emitir A3. PR2 solo documental; main/PR1/PR3 y WIP no se modifican desde ChatGPT. `RELEASE=NO_GO`. `NEXT_OWNER=CODEX_LUNA`.
