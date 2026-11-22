# JORNATO — AUDITORÍA ADVERSARIAL DELTA A2 · 10 VERDUGO + 10 JUEZ · 22-NOV-2026

**Director:** ChatGPT GPT-6. **Ejecutor posterior:** Codex Luna. **Estado:** revisión documental concluida; **NO** se ha ejecutado Gradle, Flutter ni Windows en esta revisión. **Única orden corregida:** [`CODEX_LOTE_ACTUAL.md`](CODEX_LOTE_ACTUAL.md), `TASK=JOR-A2-GRADLE-DEPS-APK-QA-20261122`, `PROMPT_REVISION=A2-R1-20261122`. Si A2-V1 ya está ejecutándose o produjo un ZIP, **NO ejecutar R1**: analizar la entrega existente. Esta auditoría sustituye decisiones defectuosas del prompt A2-V1, no vuelve a auditar ni ejecutar los pasos N2–N7/A1.

## 0. Evidencia examinada y límites de certeza

1. **Fuente original exacta** `CODEX_JORNATO_A2_DESBLOQUEO_GRADLE_APK_QA_20261122.md`, SHA-256 `f9b2a55dfaec4f4a11711c9130077e2b475652dc96a1a97fe962a8ccd48aa89b`. Se examinó íntegramente, conservando el trabajo secuencial y el mismo TASK.
2. **ZIP A1 auténtico** `JOR-A1-ANDROID-OFFLINE-APK-QA-CANDIDATE-20261121-UNICO.zip`, SHA-256 `C0087642ACED1BE983DC081A95A63B0B4829EE30414372B29835A4852D79555A`, CRC completo, 8 miembros; 7/7 entradas del manifiesto. Leídos `FINAL_REPORT.md`, `ANDROID_OFFLINE_BUILD.csv`, `BLOCKERS.md`. **Hecho documental:** A1 quedó detenido al configurar el plugin Flutter del build incluido, antes de compilar el producto, con 22 archivos Gradle no cacheados. Los 22 renglones representan **21 coordenadas GAV distintas**, pues `org.jetbrains.kotlin:kotlin-gradle-plugin-api:2.2.21` aparece con JAR normal y `gradle813`.
3. **ZIP N5 auténtico**, SHA-256 `162118EFD4260B97A425E969CB90C06C54A4CAA0003FEC82F2C68A2BD53E84CC`, CRC completo. N5 `9/9 KioskScreen`, resolución Pub offline, sin APK físico ni pruebas Android nativas. El ZIP no contiene fuentes: las paridades de 82/82 de A1 y 232/232 de N5 son resultados del verificador de Codex, no recálculo local independiente del código.
4. **GitHub PR #2 documental:** orden anterior, continuidad y Handoff confirmados; PR #1/#3 y `main` no incorporan el WIP privado. La evidencia del prompt Android más reciente vive en los entregables de Codex en D:; **no reconstruir del GitHub público**.
5. **Fuentes técnicas externas verificadas**: [cache Gradle: preservar artefactos Y metadatos, no `*.lock` ni `gc.properties`](https://docs.gradle.org/current/userguide/dependency_caching.html); [redirect legítimo del Portal a `plugins-artifacts.gradle.org`](https://plugins.gradle.org/docs/mirroring); [repositorios de plugins ≠ dependencias de proyecto](https://docs.gradle.org/current/userguide/declaring_repositories_basics.html); [seguridad de build scripts/init y wrapper](https://docs.gradle.org/current/userguide/securing_build_tool.html); [no autodescargar SDK](https://developer.android.com/studio/intro/update); [no autoprovisionar JDK](https://docs.gradle.org/current/userguide/toolchains.html).

**No hay:** acceso directo al PC Windows, ejecución de Gradle real en A2, un APK compilado, prueba física de Android o garantía técnica de que Gradle no puede abrir otras conexiones en ausencia de un filtro de red. Cualquier afirmación de PASS real antes de ejecutar A2 sería incorrecta.

## I. VERDUGO — 10 pasadas: intento romper la orden A2 original

### V01 — Precedencia y ejecución duplicada
**Ataque:** enviar una revisión nueva cuando Codex ya arrancó A2 crea dos procesos con la misma ruta privada, firma y caché, y convierte los resultados en ambiguos. **Hallazgo:** A2-V1 tenía guardia interna, pero no decía claramente que una revisión posterior solo sustituye el documento si V1 NO empezó. **Corrección:** `PROMPT_REVISION=A2-R1-20261122`, mismo TASK, preflight de ZIP/proceso/carpeta, estado `A2_ALREADY_IN_FLIGHT_OR_FINISHED`, no limpiar ni reanudar con otra instancia. **Dictamen:** FIX documental. Ningún segundo build está autorizado por editar el prompt.

### V02 — Reutilización de fuentes, no GitHub antiguo
**Ataque:** tomar PR #1 como fuente destruye la paridad de 82/82, pues es un esqueleto más antiguo; tocar WIP compartido también introduce colisiones. **Evidencia:** CSV de A1 reporta paridad 82/82 y N5 incluye 82 fuentes de app dentro de 232. **Corrección:** conservar A1/N5 como fuentes inmutables, copiar una vez a `A2_ROOT/private`, cotejar hashes focales, `pubspec.lock` exacto y PRE/POST de WIP. **Dictamen:** mantener el guard original; no ejecutar otra auditoría de 232 rutas ni recuperar código del PR público.

### V03 — 22 JAR ≠ 22 módulos; classifier incorrecto
**Ataque:** un agente con razonamiento limitado puede comprar/copiar un único JAR por GAV y declarar resuelto el problema, sin traer la variante Kotlin `-gradle813`. **Evidencia real:** `BLOCKERS.md` tiene 22 entradas, **21 GAV únicos**, una repetida con dos archivos, y el fallo de Gradle menciona `No cached version available for offline mode`. **Corrección:** inventario por **GAV + classifier/variant + metadata de resolución**, no por nombre de módulo solamente; no fabricar sellos ni copiar archivos JAR sueltos. **Dictamen:** causa ambiental correctamente focalizada.

### V04 — Lista HTTPS omitía redirect oficial
**Ataque:** Portal Gradle devuelve HTTP 303 a `plugins-artifacts.gradle.org`, y A2-V1 mandaba parar al ver un dominio «no listado». **Evidencia externa:** documentación oficial del Plugin Portal. **Corrección:** añadir ese host específico, conservando rechazo de mirrors y redirecciones no demostradas. **Dictamen:** FIX causal directo; evita un nuevo BLOCKED artificial sin abrir una lista indiscriminada de dominios.

### V05 — Falsa seguridad del allowlist
**Ataque:** decir que Gradle «solo descarga desde sitios autorizados» es imposible de asegurar con un simple documento y lectura de logs: plugins, scripts y included builds son código ejecutable; pueden iniciar conexiones propias. **Evidencia:** documentación de seguridad Gradle sobre wrapper, init scripts y plugins. **Corrección:** revisión focal de puntos de entrada y repo declarations; evidencia de dominios *visibles*; estado `NETWORK_SCOPE=POLICY_CONTROLLED_NOT_EGRESS_SANDBOXED`. Si la política exige confinamiento técnico absoluto, bloquear sin tocar firewall/proxy compartido. **Dictamen:** FIX de honestidad; no vender un sandbox que no existe.

### V06 — Descargar herramientas aunque la orden solo permite Maven
**Ataque:** Android Gradle Plugin y Gradle Toolchains pueden descargar SDK/JDK aparte de dependencias Maven si algún componente falta, violando el permiso. **Evidencia externa:** propiedades oficiales `android.builder.sdkDownload=false` y `org.gradle.java.installations.auto-download=false`. **Corrección:** fijar ambas propiedades **solo en el gradle.properties de la copia A2**, registrar diff y verificar JDK 21/SDK actuales. **Dictamen:** FIX operativo mínimo, sin instalación de herramientas ni globales.

### V07 — Init scripts y variables heredadas
**Ataque:** copiar cachés sin verificar inicialización puede inyectar repositorios/credenciales; `GRADLE_OPTS`, `JAVA_TOOL_OPTIONS`, `ORG_GRADLE_PROJECT_*` y `init.d` pueden alterar ejecución, aun cuando `settings.gradle.kts` esté correcto. **Evidencia externa:** documentación oficial de seguridad e init scripts. **Corrección:** inspección acotada de entradas pre-build, sin imprimir secretos ni escanear todo Windows; usar Gradle User Home privado limpio, con caché propia y sin scripts/cuentas heredados. **Dictamen:** FIX de seguridad sin ampliación arquitectónica.

### V08 — Llave debug fuera del laboratorio
**Ataque:** la firma debug por defecto puede leer/crear keystore bajo perfil Windows y afectar otros builds, o generar firma no reproducible frente a C2. **Evidencia:** en A1 no existe APK ni firma; no se puede inferir la ruta efectiva de signing desde el ZIP. **Corrección:** verificar signingConfig antes de compilar; mantener debug keystore únicamente en carpeta `A2_ROOT/private/android-user`; si es necesario, hacer ajuste de QA solo en la copia, nunca en WIP; si no es posible, `BLOCKED_SIGNING_PATH`. **Dictamen:** seguridad real, sin crear infraestructura nueva.

### V09 — «Un build» que fallará de modo previsible
**Ataque:** reintentar `--offline` con los mismos 22 faltantes antes de una ejecución online sería repetir A1. **Evidencia:** A1 exit 1 en configuración Flutter. **Corrección:** decisión única `OFFLINE_COMPLETE` cuando cache+metadata alcanzan, o `OFFICIAL_FETCH_NEEDED` para una única compilación online autorizada, y como máximo una corrección de `FAIL_PRODUCT` en copia con un rerun focal; **nunca** reintentar por red/entorno. **Dictamen:** KISS, sin perseguirse la cola.

### V10 — APK existente, QA versus release y secretos
**Ataque:** un APK antiguo C2 o un debug APK con `usesCleartextTraffic` podría catalogarse como entrega final, pese a no haberse validado manifest fusionado, firma y teléfono físico. **Evidencia:** A1 no generó APK; la bandera cleartext observada es solo fuente `b14qa/debug`. **Corrección:** exigir APK nuevo de A2 + SHA + firmante + manifest fusionado; bandera debug etiquetada para QA solo local, no para distribución ni datos reales. ZIP sanitario sin APK/keystore/logs privados. **Dictamen:** PASS de construcción no equivale a UAT ni RELEASE.

## II. JUEZ — 10 contrapruebas de necesidad, alcance y eficiencia

### J01 — ¿Es necesario otro A3?
**Alternativa:** crear otro lote y otra batería de tests para reparar las fallas del prompt A2-V1. **Contraste:** no hay resultado A2 ni cambio de producto; las correcciones son instrucciones, no código. **Sentencia:** RECHAZADO. Seguir con **el mismo A2**, `R1` solo si V1 no empezó. Reduce un ciclo de ida y vuelta.

### J02 — ¿Repetir N5, N3, N2 y A1?
**Alternativa:** «certificar desde cero» Flutter, Gradle, hashes del servidor y código Android. **Contraste:** A1 Pub 79/79 y N5 KioskScreen 9/9 ya tienen evidencia vigente; no hay delta que las invalide. **Sentencia:** RECHAZADO. Solo checks de copia/origen y build nuevo necesarios.

### J03 — ¿Descargar manualmente cada JAR conocido?
**Alternativa:** script PowerShell para pedir 22 JAR directos y ponerlos en `modules-2`. **Contraste:** Gradle conserva metadata de resolución, variant, descriptor y repositorio; el GAV duplicado usa archivos distintos. **Sentencia:** RECHAZADO. Que Gradle resuelva con sus propios mecanismos, sin parches de cache.

### J04 — ¿Bloquear todo uso de red por miedo a terceros?
**Alternativa:** exigir `--offline` sin importar la caché. **Contraste:** repite fallo A1 y no resuelve el problema de compilación; el usuario recibió y aceptará expresamente una excepción limitada si envía el prompt. **Sentencia:** RECHAZADO. Una resolución online limitada a los repositorios declarados y conocidos, **con reconocimiento explícito de que no es aislamiento técnico de egress**.

### J05 — ¿Abrir cualquier redirección de Maven?
**Alternativa:** permitir todos los redirects porque el primer host era oficial. **Contraste:** se verificó específicamente `plugins-artifacts.gradle.org`, no la legitimidad de cualquier cadena futura. **Sentencia:** RECHAZADO. Host conocido admitido, los demás se bloquean con evidencia y sin improvisación.

### J06 — ¿Instalar Android SDK/JDK faltante automáticamente?
**Alternativa:** dejar el modo online de Gradle gestionar toolchains para aumentar la probabilidad de APK. **Contraste:** autorización y presupuesto alcanzan solo dependencias de compilación; toolchains disponibles según A1. **Sentencia:** RECHAZADO. Desactivar provisionamiento automático, informar componente si falta, no crear nuevo problema global.

### J07 — ¿Reestructurar Gradle para prevenir accesos externos?
**Alternativa:** cambiar scripts, plugins, repositorios y arquitectura del proyecto. **Contraste:** introduce un parche y perdería paridad con A1/N5. **Sentencia:** RECHAZADO. Verificar scripts existentes; no añadir proxy, mirror ni plugin propio, y solo ajustar gradle.properties/signing **de QA privada**.

### J08 — ¿Usar firma debug o cachés compartidas sin aislamiento?
**Alternativa:** mayor rapidez reutilizando `%USERPROFILE%/.gradle`, `%USERPROFILE%/.android` y cachés de otros proyectos. **Contraste:** varios Codex ejecutan programas en el mismo equipo. **Sentencia:** RECHAZADO. Copia privada A2, sin escrituras compartidas ni capturas de secretos, aunque suponga copia inicial adicional.

### J09 — ¿Corregir un fallo de producto directamente en WIP?
**Alternativa:** ante error de compilación, editar el proyecto de trabajo y mezclarlo con otros lotes. **Contraste:** WIP está protegido y no hay respaldo externo; un error ambiental no es error de fuente. **Sentencia:** RECHAZADO. Máximo una corrección causal `FAIL_PRODUCT` en **copia** y un intento focal adicional; sin commit/merge.

### J10 — ¿Una APK debug equivale a programa terminado?
**Alternativa:** aprobar publicación porque `assembleB14qaDebug` y firma pasen. **Contraste:** faltan QA Android físico (SQLCipher/Keystore/restart/corrupción), servidor Laravel/Pro E2E y copia externa del código. **Sentencia:** RECHAZADO. `PASS_APK_QA_SCOPED` como máximo y `RELEASE=NO_GO`.

## III. Sentencia final y ruta de cierre (sin auditorías repetidas)

**DECISIÓN:** A2-R1 es la única corrección razonable de A2; se conserva arquitectura Flutter/Gradle y el lote A2 original. No crear A3 ni regresar a Docker. **No se puede afirmar que las 22 dependencias estén disponibles en remoto, ni que el build vaya a pasar**; eso solo lo comprobará Codex en Windows. La falla corregida más concreta es admitir la redirección oficial Gradle Portal y distinguir variantes; los controles de seguridad evitan cambiar SDK/JDK o firmas fuera de la copia.

**Ruta de ejecución:** preflight de concurrencia → reuso A1/N5 → Gradle/Pub/debug signing privados → una decisión offline u online → una compilación de `:app:assembleB14qaDebug` → validar APK nuevo/merged manifest/firma si existe → un ZIP de evidencias. Si no hay APK, la salida debe identificar **artefacto/transitivo, repositorio y naturaleza** del bloqueo; no pedir otro ritual 10+10. Sin Docker, teléfono ni Git mutations. Enviar el prompt A2-R1 **solo si A2 no ha empezado**.

**Siguiente dueño:** CODEX LUNA A2-R1 condicionado al estado de A2. **Después del ZIP:** CHATGPT DIRECTOR. **RELEASE=NO_GO**.
