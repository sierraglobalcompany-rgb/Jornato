# JORNATO — A2-R4-V2 | AUDITORÍA ADVERSARIAL DELTA 10 VERDUGO + 10 JUEZ

**Fecha:** 22 de noviembre de 2026. **Ámbito:** solo el Markdown `CODEX_JORNATO_A2_R4_COMPAT_AGP9_APK_QA_20261122.md` (SHA256 `AA22677AA65F2622EE5109FC512714175152E51DAFE948BF2B13C2AD401AD1E0`) y el ZIP R3 auténtico SHA256 `5C3E7B1758380CE8D7895C1EF1981F2FD131A4A90F79C8A300BAF57153214D11`. **NO es otra auditoría de N2–N7, A1, A2-R1–R3.** Verifiqué el ZIP R3 directamente en el contenedor: 7 miembros, CRC correcto, 6/6 manifiesto.

## Hecho causal y contraste externo

El R3 real reporta una única invocación Gradle con salida 1 al aplicar `dev.flutter.flutter-gradle-plugin`: `ApplicationExtensionImpl$AgpDecorated_Decorated cannot be cast to AbstractAppExtension`; no compiló fuente de la app ni produjo APK. El inventario tiene 22 variantes faltantes de A1 recuperadas y 39 JAR nuevos totales; no hay SHA externo fijado de dependencia ni sandbox de salida de red. WIP y ZIP R1 según evidencias intactos. Android AGP 9.0 publica el error equivalente y el escape temporal `android.newDsl=false`: https://developer.android.com/build/releases/agp-9-0-0-release-notes . Flutter documenta `android.newDsl=false` para compatibilidad AGP9 y explica la separación con `android.builtInKotlin`: https://docs.flutter.dev/release/breaking-changes/migrate-to-built-in-kotlin/for-app-developers . Gradle documenta precedencia (User Home antes del proyecto): https://docs.gradle.org/current/userguide/build_environment.html . **Estos documentos justifican una hipótesis, no equivalen a un PASS en Jornato.**

## VERDUGO — 10 pasadas, solo delta R4

### V01 — ¿A2-R4 se podría ejecutar dos veces?
**Ataque:** una nueva versión del Markdown podría lanzarse mientras el R4 anterior ya está procesando. **Evidencia:** mismo TASK, raíz privada y directorio `delivery-r4`. **Corrección:** R4-V2 solo si R4 no comenzó; proceso, carpeta parcial o ZIP R4 preexistente => STOP. **Razón:** duplicar la compilación contradice la meta de una sola prueba.

### V02 — ¿La hipótesis arregla el mismo cast o inventa una causa?
**Ataque:** mezclar AGP incompatibilidad con error del código Dart. **Evidencia:** `BLOCKERS.md` R3 documenta `FlutterPlugin.kt:354` y AGP 9.1.0, antes de compilar app; Android documenta el mismo tipo de cast. **Corrección:** cambiar solo `android.newDsl=false` en QA. **Límite:** compatibilidad aún sin probar realmente.

### V03 — ¿La plantilla PowerShell respeta la promesa de un único delta?
**Ataque:** `[IO.File]::ReadAllText`, `TrimEnd` y `WriteAllText` de R4 original pueden eliminar líneas en blanco finales, normalizar CRLF y BOM/UTF-8, falseando una edición de una línea. **Prueba:** examen estático del código original y 10 fixtures del nuevo editor ejecutados localmente, todos PASS. **Corrección:** editor Python byte-preserving con control de true/false/ausente, hash PRE/POST y escritura privada temporal atómica.

### V04 — ¿El editor acepta propiedades conflictivas?
**Ataque:** duplicados, `android.newDsl:true`, inline comments o `false` preexistente producirían falsas configuraciones y un build inútil. **Evidencia:** varios casos de borde sintéticos PASS como STOP, sin modificar origen. **Corrección:** contrato de tres casos explícitos y STOP por conflicto; nunca eliminar `false` para recrearlo.

### V05 — ¿La propiedad efectiva puede sobrescribirse silenciosamente?
**Ataque:** `gradle.properties` de `GRADLE_USER_HOME`, `-P`, variables `ORG_GRADLE_PROJECT_*` o sistema podrían tener más precedencia. **Evidencia:** fuente oficial Gradle sobre precedencias. **Corrección:** inspección focal de orígenes de propiedad y bloqueos antes de compilar; cero cambios a host o caché ajena.

### V06 — ¿La copia R4 heredará outputs o enlaces del candidato R3?
**Ataque:** APK viejo, `.gradle`, `build` o junction contaminarían el resultado; editaría archivos compartidos. **Corrección:** copia ordinaria privada sin symlink/hardlinks, ni outputs, y SHA de archivos críticos; STOP si R4 ya existe. **Justificación:** un APK de R3 no existe, pero no se debe inventar PASS con restos.

### V07 — ¿Forzar `--offline` ahora ahorra tiempo?
**Ataque:** R3 recuperó 22 variantes, pero falló antes de aplicar plugin; todavía podrían faltar transitivos Flutter Engine. **Evidencia:** `GRADLE_DEPS=PASS_OFFICIAL_FETCH` NO certifica resolución completa del build. **Corrección:** usar una única tarea con caché privada y dominios autorizados, sin nuevo build de precalentamiento. **Límite:** lista política no es sandbox técnico de egreso.

### V08 — ¿La nueva edición altera la arquitectura o introduce segunda migración?
**Ataque:** añadir `android.builtInKotlin=false`, bajar AGP 8, parchear SDK Flutter o cambiar scripts al primer error. **Corrección:** prohibir todo salvo `android.newDsl=false`; primera nueva causa implica STOP. **Justificación:** elimina cascada de parches y conserva las versiones verificadas.

### V09 — ¿La firma o el artefacto pueden salir fuera del laboratorio?
**Ataque:** debug.keystore global o APK anterior falsamente certificado. **Corrección:** `ANDROID_USER_HOME`/firmante privados, outputs R4 vacíos antes de construir, `apksigner` y manifest fusionado, APK solo en `private/r4/product`. **Límite:** no se probó dispositivo ni seguridad de almacenamiento local.

### V10 — ¿Podría declararse release con una APK que compile?
**Ataque:** `usesCleartextTraffic=true` del source QA, cero pruebas físicas SQLCipher/Keystore, backup externo NO. **Corrección:** `RELEASE=NO_GO`, QA no distribuble, puertas pendientes documentadas sin rerun. **Justificación:** build no equivale a producto seguro.

## JUEZ — 10 deliberaciones independientes

### J01 — ¿Cancelar R4 y diseñar nueva etapa A3?
**Argumento a favor:** el fallo AGP es nuevo. **Contraste:** ya hay remedio oficial de una sola propiedad y caches resueltas. **Sentencia:** NO A3; A2-R4-V2 sigue mismo TASK para eliminar defecto del editor.

### J02 — ¿Dejar el PowerShell original sin cambios?
**A favor:** script breve y probablemente funcional en archivo sin formatos extraños. **En contra:** permite modificar más bytes de los necesarios y rompe evidencia de “una línea”. **Sentencia:** reemplazar solo el editor, manteniendo objetivo y build único.

### J03 — ¿Cambiar propiedad en WIP de una vez?
**A favor:** ahorra migración posterior. **En contra:** WIP protegido con 235 rutas, QA aún no comprobada. **Sentencia:** NO, solo `private/r4/candidate`.

### J04 — ¿Actualizar Flutter para consumir AGP 9 sin workaround?
**A favor:** versiones futuras podrían soportar DSL nueva. **En contra:** modifica contrato, dependencia y fuente; exige revalidación completa. **Sentencia:** NO; probar primero la configuración oficial temporal actual.

### J05 — ¿Bajar AGP/Kotlin a otras versiones?
**A favor:** podría esquivar incompatibilidad. **En contra:** pérdida de reproducibilidad y nuevas dependencias/errores. **Sentencia:** NO; conservar versionado de R3.

### J06 — ¿Añadir también `android.builtInKotlin=false` por seguridad?
**A favor:** guía Flutter habla de Kotlin integrado en AGP9. **En contra:** R3 falla antes en el cast DSL; no hay evidencia de segundo fallo KGP. **Sentencia:** NO; dejar Kotlin y sus flags intactos hasta nuevo error concreto.

### J07 — ¿Ejecutar Gradle `--offline` por ser una app offline?
**A favor:** reduce egress. **En contra:** build no terminó de resolver todo Flutter; forzar offline puede dar error nuevo artificial. **Sentencia:** una sola tarea con caché privada y política de red ya autorizada; la **app** no se vuelve online por ello.

### J08 — ¿Ejecutar tests N5, A1 o nueva auditoría grande antes de compilar?
**A favor:** sensación de mayor cobertura. **En contra:** no afectan el cast AGP; ya tienen evidencia PASS. **Sentencia:** NO; únicamente control de cambio y build focal.

### J09 — ¿Autorizar el APK QA como publicable si compila?
**A favor:** acelera la fecha de lanzamiento. **En contra:** manifest QA cleartext, pruebas físicas, cifrado y backup siguen abiertos. **Sentencia:** NO, solo APK QA no publicable con `NO_GO`.

### J10 — ¿Permitir múltiples reintentos o nuevas flags ante un segundo error?
**A favor:** Codex podría avanzar sin regresar al Director. **En contra:** reabre pingpong con decisiones sin evidencia y compromete otros proyectos. **Sentencia:** un cambio, **una compilación**, un ZIP, STOP con primera causa nueva; siguiente decisión del Director.

## Resultado técnico

**APROBADO CON CORRECCIÓN ACOTADA:** `A2-R4-V2` conserva mismo TASK y estructura, sustituye A2-R4 solo antes de comenzar. Editor de propiedad probado sintéticamente 10/10; no se ejecutó Gradle ni el PC Windows del usuario. No se reauditaron N2–N7 ni pruebas Flutter. Los resultados futuros serán evaluados contra ZIP R4 real sin repetir pasos previos.

## Custodia y continuidad

Repo público `sierraglobalcompany-rgb/Jornato`, PR #2 documental. Actualizar `docs/CODEX_LOTE_ACTUAL.md`, `docs/JORNATO_CONTINUIDAD.md`, `docs/JORNATO_RECOVERY_HANDOFF_ACTUAL.md` y añadir esta auditoría. Dejar intactos `main`, PR #1, PR #3 y fuentes privadas. `NEXT=CODEX_LUNA` únicamente si no hay R4 en curso; si ya empezó, NEXT=CHATGPT_DIRECTOR después del ZIP original R4.
