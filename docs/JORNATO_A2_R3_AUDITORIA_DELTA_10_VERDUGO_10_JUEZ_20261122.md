# JORNATO — AUDITORÍA ADVERSARIAL DEL DELTA A2-R2 → A2-R3 · 22 NOV 2026

**Dictamen:** CORREGIR A2-R2 **antes de su inicio**; si A2-R2 ya está en curso o produjo ZIP, no ejecutar A2-R3. **Mismo** `TASK=JOR-A2-GRADLE-DEPS-APK-QA-20261122`, una única compilación real si la reanudación procede. No crear A3 ni repetir las 10+10 de A1 o A2-R1: esta revisión cubre exclusivamente los riesgos **nuevos del prompt R2**. Las 20 pasadas son **documentales/estáticas**, no 20 builds ni pruebas de producto.

## Evidencia comprobada y fronteras

- Reabierto literalmente `CODEX_JORNATO_A2_R2_CONTINUACION_FLUTTER_ENGINE_APK_20261122.md` y comparado con el `docs/CODEX_LOTE_ACTUAL.md` de PR #2, que en el corte era blob `9179418f2728e9b65bd5c3fd9c217dfeaf2cc3c7`.
- ZIP A2-R1 real recibido: `JOR-A2-GRADLE-DEPS-APK-QA-20261122-UNICO.zip`, SHA256 `C891EC71F5D30511065E0F902B1D97A19F5AA22F2D913FA48770E8D6328B6B24`, 7 miembros con CRC PASS, 6/6 manifiesto. Reporta 82/82 fuente, lock Pub inalterado y `pub get --offline --enforce-lockfile` PASS, 31.270 archivos en cachés privadas cotejados, **0** ejecuciones Gradle, 0 APK, WIP sin delta. Las comprobaciones de fuente/caché/Gradle son evidencia **de Codex**; no se montó su Windows ni se reprodujo el build aquí.
- El SDK Flutter oficial usa una URI de repositorio que combina host y `engine.realm` antes de `download.flutter.io`: https://github.com/flutter/flutter/blob/master/packages/flutter_tools/gradle/src/main/kotlin/FlutterPlugin.kt y https://docs.flutter.dev/add-to-app/android/project-setup . La implementación **local 3.47.8 es autoridad del A2**, no la rama `master` publicada.
- Referencias: Gradle seguridad de build https://docs.gradle.org/current/userguide/securing_build_tool.html ; repositorios https://docs.gradle.org/current/userguide/securing_repositories.html ; verificación de dependencias https://docs.gradle.org/current/userguide/dependency_verification.html . La whitelist de repositorios **no** equivale a sandbox de egreso ni a autenticidad de archivos.
- Docker/PHP/N5–N7 no son el objeto actual, no se reabren. Flutter host ya obtuvo PASS scoped, Android físico sigue NOT_RUN; release permanece NO_GO.

## DIEZ PASADAS COMO VERDUGO — detectar fallas del NUEVO texto A2-R2

### V01 — Doble procedimiento de build
**Ataque:** A2-R2 tiene `## 2. Una sola compilación` y luego otra `## 3. Puerta A2-2` copiada de R1. Una sección ordena online y otra vuelve a admitir `--offline`.
**Daño:** Codex puede repetir la compilación, escoger dos rutas o detenerse por contradicción.
**Sentencia:** CONFIRMADO. Sustituir ambas por una única tarea exacta online (R1 identificó faltantes); excepción única tras `FAIL_PRODUCT` auténtico.

### V02 — Guarda de reanudación insuficiente
**Ataque:** el ZIP de R1 debe existir, pero puede también haber comenzado R2; una nueva revisión no puede asumir que R2 está inactivo.
**Daño:** doble Gradle en mismo A2, sobreescritura de outputs y evidencia.
**Sentencia:** CRÍTICO. A2-R3 solo reemplaza R2 **si R2 no empezó**; si comenzó/terminó/propiedad dudosa: devolver checkpoint, no relanzar.

### V03 — Verificación innecesaria de 31.270 archivos
**Ataque:** repetir SHA masivo del A2-R1 no soluciona el bloqueo de repositorio y cuesta tiempo/IO.
**Daño:** retrabajo e interferencia de recursos con otros proyectos.
**Sentencia:** RECHAZAR. Reusar el PASS de R1 y verificar focalmente lock/rutas/identidad, no reauditar cachés ni reproducir los 82 hashes completos.

### V04 — Dominio `storage.googleapis.com` demasiado amplio si se interpreta por host
**Ataque:** las instrucciones mencionan el host y un prefijo engine.realm que Codex podría normalizar erróneamente.
**Daño:** autorizar buckets o rutas no relacionadas.
**Sentencia:** RESTRINGIR a URI exacta del plugin local, solo metadata/artefactos Maven `io.flutter`, realm de un segmento seguro; no ampliar whitelist si cambia destino.

### V05 — Política de red no es bloqueo físico
**Ataque:** `repositorios permitidos` puede malinterpretarse como que **ningún** plugin o script saldrá por otros hosts.
**Daño:** afirmar control de egreso inexistente.
**Sentencia:** ADVERTIR. Preflight y logs son verificaciones limitadas; `NETWORK_SCOPE=POLICY_CONTROLLED_NOT_EGRESS_SANDBOXED`; no tocar firewall/proxy compartido.

### V06 — SHA de artefacto no prueba autenticidad
**Ataque:** registrar SHA256 posterior a una descarga certifica bytes recibidos, no si se consultó una suma oficial.
**Daño:** pasar falsa certificación de supply chain.
**Sentencia:** DISTINGUIR `checksum oficial/verification-metadata` de `TLS + hash de inventario`; no crear metadatos de verificación improvisados.

### V07 — Auto-descarga inadvertida de SDK/JDK
**Ataque:** permitir Gradle online puede disparar autoprovisionamiento de toolchains.
**Daño:** mutaciones de SDK host y trabajo adicional.
**Sentencia:** CONTROLAR propiedades `android.builder.sdkDownload=false`, `org.gradle.java.installations.auto-download=false`, JDK/SDK ya presentes; STOP si intenta aprovisionar.

### V08 — Signing y cachés fuera de A2
**Ataque:** una tarea puede escribir `debug.keystore` en `.android` o utilizar `~/.gradle` por variable heredada.
**Daño:** afecta firmas/instalaciones u otros Codex.
**Sentencia:** GRADLE_USER_HOME, ANDROID_USER_HOME, TMP/TEMP y firma **privados por proceso**; comprobar efectividad; sin cambios globales.

### V09 — `PASS` por APK viejo o por Gradle exit 0 sin validación
**Ataque:** `outputs/` puede contener APK antiguo; `exit 0` no acredita firma o manifiesto correcto.
**Daño:** falsa aceptación de aplicación.
**Sentencia:** Nexo con build actual + SHA/tamaño + `apksigner` + badging/merged manifest. Si fallan, `APK_BUILT_STATIC_BLOCKED`, no PASS.

### V10 — Contrato de salida ambiguo y release
**Ataque:** R2 mezcla categorías build/APK y puede llamar PASS de suministro o release al hecho de compilar.
**Daño:** confusión de cierre y nuevos ciclos.
**Sentencia:** Separar `GRADLE_DEPS`, `A2_BUILD`, `A2_APK_STATIC`, `NETWORK_SCOPE`, `RELEASE=NO_GO`; un solo ZIP y siguiente puerta física.

## DIEZ PASADAS COMO JUEZ — contradicción deliberada y decisión final

### J01 — ¿Crear A3 para avanzar ordenadamente?
**A favor:** un identificador nuevo evita ambigüedad.
**En contra:** A2-R1 tiene 0 builds y A2-R2 aún no observado; otro lote desperdicia el checkpoint.
**Sentencia:** RECHAZADO. Conservar mismo TASK; R3 solo revisión pre-inicio.

### J02 — ¿Lanzar un build offline para probar si ahora está todo cacheado?
**A favor:** evita red.
**En contra:** A1 constató faltantes y R1 no hizo resolución; el test tendría alta probabilidad de repetir fallo ya probado.
**Sentencia:** RECHAZADO. Una tarea online limitada a repos originales; sin prebuild offline.

### J03 — ¿Descargar 22 JAR manualmente y evitar Gradle online?
**A favor:** parece restrictivo.
**En contra:** metadatos/variants/atributos Gradle y transitivos se invalidan; además 22 archivos no son 22 módulos.
**Sentencia:** RECHAZADO. Usar la propia resolución Gradle con versiones fijadas; cero copias de JAR sueltos.

### J04 — ¿Añadir repositorio Flutter a `settings.gradle` para garantizarlo?
**A favor:** hace explícito el endpoint.
**En contra:** Flutter Gradle plugin ya lo añade, cambios innecesarios pueden alterar selección de repositorios.
**Sentencia:** RECHAZADO. Leer plugin local y no alterar build scripts.

### J05 — ¿Configurar firewall/proxy temporal para demostrar whitelist de red?
**A favor:** control de egreso técnico más fuerte.
**En contra:** tocaría infraestructura compartida y otros proyectos, fuera de autorización.
**Sentencia:** RECHAZADO. Documentar límite de política; si se exige sandbox estricto, bloquear antes del build.

### J06 — ¿Inventar `verification-metadata.xml` a partir de hashes recién descargados?
**A favor:** parecería reforzar integridad.
**En contra:** una suma auto-observada de origen no contrastado no crea una raíz de confianza.
**Sentencia:** RECHAZADO. Conservar metadata existente; registrar nivel real de integridad, no fingir autenticidad.

### J07 — ¿Actualizar Kotlin/AGP/Gradle para evitar artefactos faltantes?
**A favor:** podría facilitar el build.
**En contra:** crea otra matriz de versiones, riesgos y QA innecesarios; el error previo era autorización de origen.
**Sentencia:** RECHAZADO. Versiones originales fijas y un solo build.

### J08 — ¿Permitir segundo build si falla conexión o firma?
**A favor:** podría ser intermitencia.
**En contra:** alimenta pingpong y oculta causa raíz; el usuario pidió detenerse con bloqueo concreto.
**Sentencia:** RECHAZADO. Solo un reintento por `FAIL_PRODUCT` en fuente propia, tras mínimo fix privado.

### J09 — ¿Bloquear una APK QA por `usesCleartextTraffic=true` en sourceSet debug?
**A favor:** no dejar entrar tráfico inseguro.
**En contra:** esa bandera en debug no prueba que la release la tenga; impediría producir una APK de laboratorio necesaria para validar seguridad.
**Sentencia:** Construir QA permitido; si persiste, `QA_DEBUG_CLEARTEXT=TRUE`, sin datos reales, sin distribución y sin GO. Revisar merged manifest.

### J10 — ¿Lanzar release inmediatamente si se firma una APK?
**A favor:** velocidad.
**En contra:** Android físico, rehidratación, SQLCipher, seguridad, backup externo y servidor siguen sin certificar.
**Sentencia:** RECHAZADO. `RELEASE=NO_GO`, APK solo candidata de pruebas, siguiente gate físico después de adjudicar ZIP.

## Resolución ejecutiva

**A2-R2 se sustituye por `CODEX_JORNATO_A2_R3_MACROBLOQUE_UNICO_APK_20261122.md` solo si no se ha iniciado R2.** No se repiten los 20 checks A1/A2-R1, los 82 hashes ni las 31.270 entradas. No se abre A3. Si hay ejecución A2-R2 activa o ZIP posterior, el Director evalúa esa evidencia y R3 NO se ejecuta. El prompt nuevo contiene **un solo comando Gradle**, la excepción causal de un único reintento y un ZIP sanitizado. Publicar SOLO documentación en PR #2; main, PR #1/3 y WIP no se tocan.
