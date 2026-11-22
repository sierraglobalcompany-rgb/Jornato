# JORNATO — DICTAMEN INDEPENDIENTE A1-R2 Y ORDEN A2 · 22 NOV 2026

## 1. Fuente verificada (NO repetir análisis)

Se inspeccionó en esta conversación el ZIP adjunto `JOR-A1-ANDROID-OFFLINE-APK-QA-CANDIDATE-20261121-UNICO.zip`, **9.828 bytes**, SHA-256 `C0087642ACED1BE983DC081A95A63B0B4829EE30414372B29835A4852D79555A`. Exactamente **8 miembros ZIP, CRC correcto, 7/7 manifest SHA256 y tamaños comprobados**. Los CSV y el informe son evidencia elaborada por Codex; esta inspección verifica su integridad y consistencia, **no ejecutó Windows, Gradle, Docker ni leyó las fuentes privadas**.

- `A1_SOURCE=PASS_82_OF_82`: CSV `APP_SOURCE_PARITY.csv` tiene 82 rutas app con hash/tamaño PRE y POST iguales; provienen de la copia de N5 (82 app + 150 servidor). No copiar fuentes de PR público incompleto.
- `A1_PUB=PASS_OFFLINE_LOCKED`: Pub `--offline --enforce-lockfile` exit 0, 79 versiones y `pubspec.lock` hash `F515D69563850E8893A17585D8BAB57A8E6484E18CE1FEF4BDDC6BB836F83B34`. N5 `analyze` sin issues y 9/9 KioskScreen en candidato, reutilizados.
- `A1_TOOLCHAIN=BLOCKED_GRADLE_CACHE`: Flutter 3.47.8/Dart 3.13.7, Gradle 9.3.1, JDK 21.0.12, Android SDK 36, NDK 28.2.13676358, CMake 3.22.1 reportados disponibles. La distribución Gradle aislada sí estaba, **faltaron dependencias de build**.
- `A1_BUILD=BLOCKED_DEPENDENCY`: único `gradlew.bat --offline --no-daemon --console=plain :app:assembleB14qaDebug` exit 1, durante configuración del plugin Flutter. **22 archivos/variantes JAR no disponibles en caché Gradle privada**, de `org.gradle.kotlin:gradle-kotlin-dsl-plugins:6.4.2` y módulos `org.jetbrains.kotlin:*:2.2.21` (21 archivos, con `kotlin-gradle-plugin-api` en dos variantes). El informe incluye nombres concretos. **No llegó a compilar código de Jornato.** No afirmar que el cache de usuario global también carece de estos artefactos.
- `A1_APK_METADATA=NOT_RUN`, APK SHA `NOT_BUILT`, `ANDROID_PHYSICAL=NOT_RUN`. El reporte detectó `usesCleartextTraffic="true"` **en el manifiesto fuente b14qa/debug**: es una alerta de configuración QA que debe verificarse en manifiesto fusionado si hay APK. Sin APK no hay veredicto release.
- Guardas WIP según Codex: HEAD `faf5fe283191f8b5a2724b397009512a2caec1b6`, rama `codex/jor-b08-h4-domain-20261025`, 235 filas (224 untracked/11 modified), índice `25CC609803D7E68D5F3ECF428198B2432CF1EA37030546735DD3F03299D905E1`, 0 staged, PRE/POST sin delta. Docker no tocado. `OFF_DEVICE_BACKUP=NO`, `RELEASE=NO_GO`.

## 2. Causa admitida y alternativas descartadas

**Causa efectiva probada:** ausencia de 22 artefactos de **resolución Gradle del build QA offline** en el `GRADLE_USER_HOME` aislado de A1. No implica defecto en código Dart, Java/Kotlin de la aplicación, en la versión del plugin, en Android SDK ni en el requisito de funcionamiento offline de la aplicación. El ZIP NO incluye el log Gradle completo ni sus bytes, por lo que se atribuye el diagnóstico preciso al informe de Codex, sin elevarlo a una inspección independiente de esa salida privada.

- NO reconstruir A1 ni repetir los 82 hashes masivos, `flutter test`, 86/9 pruebas históricas, QA Docker/servidor o pruebas físicas. Se reutilizan como evidencia histórica del alcance real.
- NO resolver con un JAR suelto en un directorio arbitrario, editar Gradle/Kotlin/AGP a otra versión, mezclar el cache de otro proyecto o retocar el plugin Flutter en su SDK global. Gradle usa **binarios y metadatos de resolución** con identidad de repositorio y checksums.
- NO exigir que la **compilación de desarrollo** sea completamente offline. El producto sí requiere funcionar sin conexión; Maven/Gradle puede obtener dependencias reproducibles de build en una campaña propia acotada. Esa excepción se deja **explícita para autorización mediante envío del nuevo Markdown A2 a Codex**.
- NO tomar `usesCleartextTraffic=true` de `src/b14qa/debug` como si fuese un APK final de producción; tampoco ignorarlo. Verificar manifiesto fusionado si se construye un APK, dejar release `NO_GO`.

## 3. Única decisión siguiente

**CERRAR A1-R2** como `PARTIAL_WITH_GAPS` aceptado y ejecutar **una nueva tarea diferente, A2**: [CODEX_LOTE_ACTUAL.md](CODEX_LOTE_ACTUAL.md), `TASK=JOR-A2-GRADLE-DEPS-APK-QA-20261122`. Este no es un A1-R3 ni auditoría 10+10 de nuevo. **Uno solo ejecutor**. Recuperar copia A1 inmutable y cache privado, identificar si están los 22 artefactos completos; si no, permitir única resolución de versiones inmutables en repos oficiales HTTPS **durante un solo build** desde cache privada A2. No usar red para funciones de la app, SDKs ni plugins no fijados. Si fails, bloqueo causal sin otra variante o forzar PASS. Si APK sale, verificar firma, manifest, y conservarlo privado en D:, listo para aprobación posterior de QA física. Un ZIP sanitario con hashes y resultados.

**Fuentes técnicas**: [Gradle Dependency Caching](https://docs.gradle.org/current/userguide/dependency_caching.html), [Gradle CLI](https://docs.gradle.org/current/userguide/command_line_interface.html), [Android Manifest Merger](https://developer.android.com/build/manage-manifests).

**NEXT=CODEX_LUNA_A2_DESPUÉS_DE_QUE_EL_PROPIETARIO_LE_ENTREGUE_PROMPT; AFTER_ZIP=CHATGPT_DIRECTOR; RELEASE=NO_GO.**
