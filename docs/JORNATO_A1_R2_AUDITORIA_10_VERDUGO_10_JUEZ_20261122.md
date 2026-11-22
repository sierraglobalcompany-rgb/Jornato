# JORNATO — Auditoría adversarial DELTA A1 → A1-R2 · 10 VERDUGO + 10 JUEZ

**Corte:** 22 de noviembre de 2026, Colombia. **Objeto único:** revisión estática del Markdown `CODEX_JORNATO_A1_APK_QA_OFFLINE_MACROBLOQUE_20261121.md`, confrontado con los **archivos auténticos** de N5 y C2 adjuntos, GitHub PR #2 y documentación vigente de Gradle/Flutter/Android. **No** se han ejecutado las compilaciones en el PC de Windows, ni se conoce el árbol privado del candidato N5. **Estas son 20 revisiones de decisión**, no 20 ejecuciones repetidas de QA. **No se reabre N2–N7**, ni se justifica repetir sus pruebas host aprobadas.

## Evidencia de base y límites de inferencia

| ID | Hecho observado | Grado de prueba |
|---|---|---|
| E1 | ZIP N5 `JOR-N5-DOCKER-NONET-PUB-GATES-20261121-UNICO.zip`, SHA256 `162118EFD4260B97A425E969CB90C06C54A4CAA0003FEC82F2C68A2BD53E84CC` | Archivo adjunto abierto e inspeccionado directamente; informe `FINAL_REPORT.md` y CSV de 232 rutas |
| E2 | CSV N5 tiene **232 filas únicas reportadas**, **82 rutas no `server/`**, **150 `server/`**, entre ellas `android/gradlew.bat` y `android/gradle/wrapper/gradle-wrapper.jar` | Conteos extraídos del CSV original; no prueba que la copia privada siga disponible o que sea compilable |
| E3 | N5 informa `flutter pub get --offline --enforce-lockfile` exit 0, 79/79 hosted, `flutter analyze` 0, `kiosk_screen_actions_test.dart` 9/9 PASS y lock SHA256 `F515D69563850E8893A17585D8BAB57A8E6484E18CE1FEF4BDDC6BB836F83B34` | Evidencia Codex; host candidato **NO** equivale a Android |
| E4 | ZIP C2 `JOR-H9-C2-PHYSICAL-DART-V5-20261120-UNICO.zip`, SHA256 `711116067DDBF73E7CE4AD6A102D58E14AD5372D79A981F48978C54A76B35692`; APK QA debug anterior `BEEA46F75B08CFA440A980BCEE4CC12E2A6B4C7B37A9457B16240C5427157593`, package `.b14qa`, firma `5435A892...0F680B78E`, instalado según Codex; VM Service BLOCKED | Informe C2 original: no es APK N5, ni QA nativa completa |
| E5 | GitHub PR #2 al comenzar: HEAD `1e88c681f21b0367f489776e88e1b5fda0ee2ca7`, `docs/CODEX_LOTE_ACTUAL.md` blob `8049dc0f60b2f3774a2c590539c8c4f07039c0a6` | Verificación con conector GitHub; nada indica que Codex ya ejecutara A1 |
| E6 | La instalación de Gradle Wrapper puede descargar la distribución antes de que se apliquen flags Gradle; la caché Gradle contiene artefactos **y metadatos** | Documentación oficial Gradle, enlaces al final |
| E7 | Flutter Gradle Plugin normalmente exige `flutter.sdk` en `android/local.properties`; Android debug signing puede usar el keystore del home de usuario | Documentación oficial Flutter/Android, enlaces al final |

## VERDUGO — 10 pasadas: búsqueda de fallos, impactos y reparación mínima

### V01 — Riesgo de duplicar A1
**Ataque:** un A1-R2 con otro identificador podría iniciar un trabajo paralelo al A1-R1 original, sobrescribir `A1_ROOT` o producir dos ZIP con mismo nombre. **Evidencia:** A1-R1 ya publicado en PR #2; el usuario no indicó que Codex lo empezara. **Impacto:** colisión de WIP/reportes y pingpong. **Reparación:** mantener **mismo TASK**, precondición absoluta `A1_NOT_STARTED`, STOP si carpeta/proceso/ZIP previo o incertidumbre. **Veredicto:** FIX_REQUIRED.

### V02 — Candidato y cobertura, riesgo de construir fuente equivocada
**Ataque:** construir el APK C2 antiguo o reconstruir `HEAD + WIP` genera un artefacto distinto al N5 host certificado. **Evidencia:** E1–E4 y las 82 rutas no servidor. **Impacto:** falso build nuevo o regresión. **Reparación:** localizar candidato N5 privado real, comprobar sus hashes contra CSV y copiar solo 82 app-side, sin symlinks, con paridad PRE/POST; bloquear fuente ausente. **Veredicto:** KEEP_AND_HARDEN.

### V03 — Gradle Wrapper antes de `--offline`
**Ataque:** `gradlew.bat --offline` puede descargar la distribución del wrapper si no existe en el `GRADLE_USER_HOME` nuevo. **Evidencia:** E6, wrapper jar existente en CSV no garantiza ZIP/distribución instalada. **Impacto:** red no autorizada o fallo impreciso. **Reparación:** cotejar versión y distribución ya cacheadas, copiar exactamente a home A1 y verificar instalación/completitud antes de invocar `gradlew`; de faltar, `BLOCKED_GRADLE_DISTRIBUTION`. **Veredicto:** FIX_REQUIRED.

### V04 — Cachés compartidas y metadatos
**Ataque:** `GRADLE_USER_HOME` privado vacío obliga a resolver plugins y dependencias otra vez; copiar solo JAR sueltos omite metadatos; apuntar al cache de otra instancia puede escribir o colisionar. **Evidencia:** E6. **Impacto:** bloqueo ambiental fabricado o interferencia multi-Codex. **Reparación:** home A1 privado, copia limitada/validada de distribución + metadatos/artefactos del cache autorizado, sin credenciales ni locks; `PUB_CACHE` también **privado**, clonado desde las 79 versiones N5 verificadas, no usar origen escribible. **Veredicto:** FIX_REQUIRED.

### V05 — Falta de propiedades generadas Android/Flutter
**Ataque:** copiar las 82 rutas no incluye necesariamente `android/local.properties`, `.dart_tool`, rutas `flutter.sdk` o `sdk.dir` necesarias para Gradle Kotlin plugin. **Evidencia:** E2, E7 y N4/N5 candidatos sin configuraciones generadas. **Impacto:** `settings.gradle.kts` falla sin ser defecto de producto. **Reparación:** generar `local.properties` y `package_config.json` exclusivamente dentro A1 desde instalaciones existentes, con lock intacto; no usar rutas heredadas del WIP. **Veredicto:** FIX_REQUIRED.

### V06 — Riesgo de alterar la caché Pub origen
**Ataque:** `PUB_CACHE` apuntando a la caché N5 efectiva puede escribir metadatos/locks en recurso compartido incluso en modo offline. **Evidencia:** N5 usó cache originado de `.dart_tool/package_config.json` del WIP. **Impacto:** interferencia entre proyectos y custodia inválida. **Reparación:** clonar únicamente el cache real requerido en A1, comprobar hash/metadata y ejecutar Pub allí; no modificar origen ni falsear integridad por presencia de carpetas. **Veredicto:** FIX_REQUIRED.

### V07 — Firma debug escribe fuera del laboratorio
**Ataque:** el Android Gradle Plugin puede crear automáticamente `$HOME/.android/debug.keystore` o leer una clave debug distinta a la prevista. **Evidencia:** E7. **Impacto:** modificación del host y conflicto de certificado con C2. **Reparación:** aislamiento de Android user home y signing config, o bloqueo antes del build si no puede demostrarse; documentar incompatibilidad de actualización sobre C2 si cambia certificado, sin tocar el teléfono. **Veredicto:** FIX_REQUIRED.

### V08 — Variante y entrypoint Dart ambiguos
**Ataque:** elegir `assembleB14qaDebug` solo por el nombre histórico ignora los flavors y `flutter.target` reales; compilar `integration_test/kiosk_flow_test.dart` no genera el producto regular. **Evidencia:** E2, E4; fuente avanzada no adjunta. **Impacto:** artefacto QA incorrecto. **Reparación:** derivar tarea de Gradle Kotlin y `lib/main.dart` realmente presentes, una variante; si ambiguo STOP. **Veredicto:** FIX_REQUIRED.

### V09 — Falso PASS por `BUILD SUCCESSFUL`
**Ataque:** Gradle puede salir 0 sin producir el APK buscado o usar un APK antiguo del directorio de salida. **Evidencia:** E4 C2 y carácter parcial de N5. **Impacto:** falsa trazabilidad de producto. **Reparación:** exigir APK nuevo en árbol A1, SHA, tamaño, tiempo+log, certificado con `apksigner` y manifest con `aapt`/`apkanalyzer`; controlar componentes/permisos y secretos. **Veredicto:** FIX_REQUIRED.

### V10 — Release gate y retorno del ejecutor
**Ataque:** certificar Android físico, SQLCipher/Keystore, cifrado y distribución a partir de un artefacto firmado en modo debug. **Evidencia:** C2 VM Service blocked y oráculos nativos NOT_RUN. **Impacto:** salida prematura y riesgo de datos. **Reparación:** resultado solo `PASS_APK_QA_SCOPED`, físico `NOT_RUN`, backup externo `NO`, release `NO_GO`, ZIP único sin APK ni fuentes. **Veredicto:** KEEP_AND_HARDEN.

## JUEZ — 10 pasadas: contraste adversarial y sentencia

### J01 — ¿Corregir A1 o crear A2?
**Alternativa a favor de A2:** separar los prompts facilitaría seguimiento. **Objeción:** cambia el mismo objetivo, obliga a otra puerta y puede duplicar ejecuciones. **Sentencia:** `A1-R2`, **mismo TASK**, solo si A1 no inició; prevalece el resultado de A1 ya iniciado. **Justificación:** idempotencia de la orden y menor riesgo.

### J02 — ¿Repetir N5 Flutter antes de Android?
**Argumento a favor:** validar que no hubo cambios. **Objeción:** 9/9 host + lock 79/79 ya PASS, un nuevo test idéntico no añade evidencia Android. **Sentencia:** reutilizar N5 y controlar hashes; reejecutar verificación focal solo si el código A1 cambió causalmente. **Justificación:** disminuye tiempo y ruido.

### J03 — ¿Usar `flutter build apk` en vez de Gradle directo?
**Argumento a favor:** Flutter es la vía usual de build. **Objeción:** añadir otra herramienta puede reactivar precache, Pub o escoger variante distinta y consumir un segundo intento. **Sentencia:** **una tarea Gradle `:app:assemble<QA>Debug` derivada del proyecto**, con plugin Flutter y caches verificadas; NO ambas rutas. **Justificación:** control de offline y reproducibilidad; si falla por el tooling, reportarlo como entorno, no inventar fallback.

### J04 — ¿Auditar todas las dependencias transitivas antes del build?
**Argumento a favor:** impedir un intento fallido. **Objeción:** resolver todo el grafo sin ejecutar Gradle no es razonable y su metadato es interno. **Sentencia:** preflight de wrapper, SDK, plugins y cache básico; **una build offline** es el oráculo para la dependencia transitoria; no reintentar por falta de paquete. **Justificación:** KISS y un resultado causal.

### J05 — ¿Usar el Gradle User Home compartido para ahorrar copia?
**Argumento a favor:** evita gigabytes y es rápido. **Objeción:** plugins/locks pueden modificar cache compartido e interferir otros Codex. **Sentencia:** sembrar home privado mediante copia verificada limitada (sin archivos personales ni enlaces); si no cabe, bloqueo explícito. **Justificación:** seguridad multi-proyecto domina velocidad aparente.

### J06 — ¿Reutilizar la firma debug C2 para instalar sobre el móvil?
**Argumento a favor:** mismo certificado permite actualización. **Objeción:** A1 NO autoriza acceder al teléfono ni copiar claves antiguas; reutilizar claves privadas de otra campaña compromete custodia. **Sentencia:** crear o usar **solo clave QA privada A1**, registrar digest y posible incompatibilidad con C2; instalación posterior requiere decisión independiente. **Justificación:** separación real de firmas y operaciones.

### J07 — ¿Exigir `distributionSha256Sum` aun si el wrapper original carece del campo?
**Argumento a favor:** fortalece seguridad. **Objeción:** cambiar configuración del proyecto o inventar un SHA para un build QA cerrado puede crear un bloqueo artificial; aún hay que constatar versión/copia correcta. **Sentencia:** verificar el SHA si estaba configurado; si no, cotejar versión/origen/copia y **no afirmar autenticación criptográfica del Gradle descargado**. **Justificación:** no inventar garantías ni mutar dependencias por conveniencia.

### J08 — ¿Arreglar Gradle/Android hasta conseguir verde?
**Argumento a favor:** acelerar un APK. **Objeción:** versiones/pipeline cambiados destruyen la paridad N5 y crean parches. **Sentencia:** máximo una corrección causal de **código propio** dentro de A1 y un retry de **la misma tarea**; fallos ambientales se bloquean con coordenada precisa. **Justificación:** el producto original debe ser identificable.

### J09 — ¿Adjuntar el APK al ZIP y probarlo ya en Xiaomi?
**Argumento a favor:** adelanta QA física. **Objeción:** el usuario pidió aislamiento y evitar acciones sobre teléfono; C2 quedó instalado y hay riesgo de sustitución de firma/datos. **Sentencia:** APK en D: privado y solo SHA/ruta local al Director, ZIP sanitario; gate físico diferido, no depender solo de VM Service. **Justificación:** no adelantar una autorización que no existe.

### J10 — ¿Marcar release GO si APK está firmado y arranca Gradle?
**Argumento a favor:** es un hito comercial visible. **Objeción:** firma debug, ausencia de QA dispositivo/SQLCipher/Keystore/restauración, backup fuera D: y servidor Pro bloqueado. **Sentencia:** `PASS_APK_QA_SCOPED` posible; `RELEASE=NO_GO` siempre en A1. **Justificación:** publicación exige pruebas distintas de compilación.

## Dictamen final y optimización aplicada

**APROBADO PARA CONTINUAR CON A1-R2, SOLO SI A1 ORIGINAL NO COMENZÓ.** El original apunta a una meta válida, pero era incompleto para firmar sin escribir en recursos compartidos y para preparar una copia Gradle/Flutter reconstruible. Se corrigieron **los seis puntos causales nuevos**: custodia/paridad N5, wrapper/distribución cacheada, local.properties Flutter, cachés privadas, firma debug privada y prueba de APK nuevo. El resto (Android físico, PHP/DB/Docker, Pro, 86+13 host, auditorías antiguas) sigue fuera del lote.

**Evidencia de las 20 pasadas:** análisis estático del texto y de ZIPs, NO test Android/Gradle en PC. **No afirmar** que `GRADLE_USER_HOME`/`ANDROID_USER_HOME` están realmente aislados hasta comprobarlo en ejecución local. **No entregar A1-R2 si Codex A1-R1 ya está trabajando**; en ese caso pedir el ZIP del trabajo ya efectuado y adjudicarlo, nunca doble ejecución.

**Orden única entregable:** [CODEX_JORNATO_A1_R2_MACROBLOQUE_ANDROID_OFFLINE_CORREGIDO_20261122.md](CODEX_LOTE_ACTUAL.md), con un ZIP final sanitario. **El siguiente responsable es CODEX LUNA si no hay ejecución A1 en curso; después del ZIP, CHATGPT DIRECTOR.**

### Fuentes oficiales contrastadas (no autorizan descargas ni ejecución en host)

- Gradle Wrapper: https://docs.gradle.org/current/userguide/gradle_wrapper.html
- Gradle dependency caching: https://docs.gradle.org/current/userguide/dependency_caching.html
- Flutter Gradle Plugin y `flutter.sdk`: https://docs.flutter.dev/release/breaking-changes/flutter-gradle-plugin-apply
- Android signing debug: https://developer.android.com/studio/publish/app-signing
- Android CLI build: https://developer.android.com/build/building-cmdline
