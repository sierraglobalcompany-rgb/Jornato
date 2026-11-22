# JORNATO — AUDITORÍA ADVERSARIAL DEL MACROBLOQUE N2 · 10 VERDUGO + 10 JUEZ · DECISIÓN DE EJECUCIÓN

**Corte documental:** 20-11-2026, hora Colombia. **Alcance:** revisar exclusivamente la ejecutabilidad de N2, su causa nueva de bloqueo de SDK, los siete tests host y la custodia focal. **No se ejecutó Flutter/Dart en el Windows del propietario, no se revisó el WIP privado, no se intervino el teléfono y no se autorizó merge/release.** No repetir las auditorías N1-R2, C2 ni B21 ya cerradas.

## 1. Evidencia utilizada y limitaciones

| Fuente | Comprobación y consecuencia |
|---|---|
| N2 original `CODEX_JORNATO_N2_SDK_HOST_GATE_MACROBLOQUE_20261120.md` | Leído íntegramente; 14.461 bytes, SHA256 `986677B4F03FE9FD0746D2961070670DDE433F5D762A9986400E81ED3E6DF402`. Orden del mismo gate; no prueba ejecutada. |
| ZIP N1-R2 | **11.742 bytes**, SHA256 `5EACC3643A00D0EC338E1EB62698A1B4AEA88C957FD3B113C0BF25B394E61540`, **10 miembros / CRC PASS**. Contiene 7 tests host seleccionados, 73 declaraciones y 0 corridos; snapshot privado 216 fuentes / restauración 5/5 **reportados** en documentos. |
| ZIP C2 V5 | **7.090 bytes**, SHA256 `711116067DDBF73E7CE4AD6A102D58E14AD5372D79A981F48978C54A76B35692`, 8 miembros / CRC PASS; `RESULTS.csv`: `A2_sdk=PASS` Flutter 3.47.8 + Dart 3.13.7 y `A5_offline_compile=PASS`, según informe de ejecución de Codex. Ninguna ruta absoluta de SDK en ese CSV. |
| GitHub repositorio Jornato | Main `1ee6aae...`, PR #1 `faf5fe...` Draft, PR #3 `104469b...` Draft apilado sobre PR #1; PR #2 documental contenía N2 original. WIP Windows no publicado ni verificado directamente. |
| Flutter 3.47.8, fuente oficial | `packages/flutter_tools/lib/src/runner/flutter_command.dart`, función `_updateCacheAndRunPubGet`: `cache.updateAll()` **antes** del `pub.get` condicional. `--no-pub` no impide por sí mismo actualizaciones de artefactos. `packages/flutter_tools/lib/src/commands/test.dart` acepta rutas explícitas de tests y diferencia `test/` host de `integration_test/`. Verificación del **código fuente**, NO ejecución en PC. |

**Etiquetas:** `DIRECTO` = archivo/repo/código fuente inspeccionado por ChatGPT; `REPORTADO` = actividad de Codex según sus archivos; `NO_VERIFICADO` = máquina Windows, archivos privados, tests, SDK actual y teléfono. No equiparar 73 declaraciones a 73 tests PASS.

## 2. VERDUGO — diez pasadas NUEVAS sobre N2 (no sobre N1-R2)

| Nº | Ataque / contraste realizado | Defecto o riesgo comprobable | Reparación de decisión |
|---|---|---|---|
| **V01** | Leí N2 §§4–5 y el método de Flutter 3.47.8 `_updateCacheAndRunPubGet`. | `--no-pub` solo evita resolver dependencias; puede haber `cache.updateAll()` antes y potencial descarga. Un N2 ingenuo violaría el mandato offline. | Inspeccionar caché/artefactos host antes de cualquier CLI Flutter; si faltan o la ausencia es incierta, STOP de CLI. |
| **V02** | Comparé `A2_sdk/A5_offline_compile` de C2 V5 con `host_preflight` de N1-R2. | **No se acredita que sea el mismo host/proceso.** “Se instaló antes” no prueba ubicación actual. | Estado explícito `HOST_PROVENANCE`, búsqueda limitada por pistas directas, sin escaneo de discos enteros. |
| **V03** | Revisé la lista de pistas SDK y cómo se verifica el ejecutable. | Comprobar solo que exista `flutter.bat` puede causar bootstrap o descarga al ejecutarlo; falta validar stamps/artefactos antes. | Preferir `dart.exe --version` local, inspeccionar SDK cache `flutter_tools.snapshot`, engine y tester; CLI solo con garantía de no descarga. |
| **V04** | Contrasté `pubspec.lock` y `package_config.json` requeridos por N2 con origen de dependencias. | Un package_config viejo puede resolver fuera del WIP o a SDK incompatible, generando FAIL falsos. | Verificar resolución de URIs y cachés por las rutas de los siete tests sin `pub get`; clasificar `PACKAGE_CONFIG_STALE`. |
| **V05** | Comparé la suite propuesta con matriz N1-R2 que usa SQLite FFI. | Pruebas pueden tocar bases del usuario o fallar por DLL SQLite ausente: no es un bug de jornada. | Guardias de fixture sintético/temp y dependencia nativa antes de ejecutarlas; fallo de DLL separado del fallo de producto. |
| **V06** | Inspeccioné selección de siete tests y fuente `flutter test` oficial. | Ejecutar directorio `test/` por defecto o tests de integración activaría un alcance mayor/dispositivo; 73 declaraciones no certifican cantidad ejecutada. | Solo las siete rutas explícitas bajo `test/`, conteos de salida reales por archivo; integraciones físicas prohibidas. |
| **V07** | Revisé uso de `flutter analyze --no-pub` cuando CLI no admite solo archivos. | Un analyze de todo WIP puede fallar por deudas antiguas no relacionadas y provocar parches fuera de alcance. | Separar diagnósticos nuevos N1-R2 de fallos antiguos; no editar otros módulos ni reportar analyze global PASS ficticio. |
| **V08** | Revisé política anti-pingpong ante errores de producto y timeout. | “Una campaña” sin límites de proceso puede colgarse o inducir intentos repetidos. | Supervisor limitado a los procesos propios; máximo una campaña inicial + una regresión focal tras corrección. |
| **V09** | Contrasté custodia de seis archivos ya `untracked` con posible salida de Flutter test. | Flutter puede crear cachés/artefactos ignored; contar cambios sin distinguir temporales puede provocar borrados/reconstrucciones injustificados. | Baseline PRE/POST de fuentes y generados esperados; no `clean`; detener ante deltas externos reales. |
| **V10** | Audité la terminal N2 y la entrega para un tercer chat. | Sin distinción de procedencia, cache, tests ejecutados por archivo y SHA POST, un `PASS_HOST` sería irreplicable. | Estado terminal tipado, ZIP único sanitizado, continuidad y un NEXT; no afirmar Android ni lanzamiento por host. |

**Dictamen VERDUGO:** hallazgo más material **V01**, que corrige un riesgo técnico observable en fuente Flutter; V02–V10 afinan las puertas de ejecución y atribución. Estas 10 son **revisiones documentales adversariales**, no diez ejecuciones de suite.

## 3. JUEZ — diez contrapruebas y fallos independientes

| Nº | Hipótesis o alternativa opuesta | Evidencia / contraste | Decisión del juez |
|---|---|---|---|
| **J01** | «La N2 original basta porque usa `--no-pub`». | Código Flutter ejecuta actualización de caché antes de `pub.get` cuando corresponda. | **RECHAZAR**: añadir la precondición offline real, sin parchear Flutter. |
| **J02** | «C2 V5 prueba que Flutter continúa en el mismo Windows». | Dos ZIP distintos sin huella de host suficiente; N1-R2 buscó rutas limitadas. | **RECHAZAR**: `HOST_PROVENANCE=UNDETERMINED` si no hay comparación verificable. |
| **J03** | «La solución rápida es bajar/instalar SDK». | Prohibido por alcance; podría destruir compatibilidad e introducir versiones nuevas. | **RECHAZAR** descarga o upgrades. Un bloqueo causal vale más que un PASS fabricado. |
| **J04** | «Dejemos que `flutter --version` complete caché y ya». | Incluso versión de Flutter puede disparar preparación/actualización del SDK. | **RECHAZAR** ejecución prematura de la CLI; primero inspección read-only, después CLI si segura. |
| **J05** | «Si falla SQLite en host, reescribir el almacén». | Dependencia FFI y DLL son condiciones de laboratorio, no necesariamente producto. | **RECHAZAR** refactorización por error de infraestructura; corregir únicamente falla de lógica demostrada. |
| **J06** | «Ejecutar las 73 declaraciones equivale a 73 pruebas». | Declaraciones seleccionadas no son casos ejecutados; runner puede saltar/filtrar. | **RECHAZAR** conteo supuesto; exigir PASS/FAIL/SKIP observables por archivo, SHA y exit. |
| **J07** | «Repetir toda la suite de Flutter o pruebas Android para certeza». | N1-R2 señaló exactamente siete tests; Android está fuera de alcance y APK quedó instalado. | **RECHAZAR**; siete tests host + análisis focal son el oráculo proporcional. |
| **J08** | «Si aparecen 12 lints ajenos, corregirlos todos». | Mueve la ejecución hacia código sin relación y aumenta colisiones WIP. | **RECHAZAR**; separar preexistentes, resolver solo deltas propios. |
| **J09** | «Crear un nuevo runner/framework de QA para evitar el SDK». | Duplicaría infraestructura, violaría KISS y no validaría el stack Flutter real. | **RECHAZAR**; reutilizar SDK cacheado o declarar bloqueo con un único insumo faltante. |
| **J10** | «Cambiar task ID y producir N3» o «fusionar PR3 por inercia». | Es el mismo gate N2, mientras WIP avanzado es privado/untracked y PR3 distinto. | **RECHAZAR**; mantener el mismo TASK, revisión N2-R1 y PR #2 solo documental; después ZIP continúa Director. |

**Fallo final del juez:** `PROMPT_N2_ORIGINAL=CORREGIR_FOCALMENTE`, `PROMPT_VIGENTE=N2-R1`, `EJECUCIONES_NUEVAS=0`, `GATE_HOST=NOT_RUN`, `C2_ANDROID=NOT_RUN`, `RELEASE=NO_GO`. Las decisiones preservan L1–L6; no autorizan nuevas pruebas físicas, publicación de WIP o merge.

## 4. Plan de avance sin perseguirse la cola

| Puerta | Estado verificable | Hecho concreto para cerrarla | Responsable |
|---|---|---|---|
| **N2-R1 actual** | SDK de C2 comprobado solo históricamente; 7 archivos/0 tests ejecutados | Recuperar toolchain del mismo host y caché, 7 pruebas host focales, una corrección por causa y ZIP; o bloqueo causal exacto. | CODEX LUNA → CHATGPT |
| **Custodia+integración WIP** | Snapshot local de 216 archivos, sin respaldo fuera del equipo; PR3 remoto diferente | Destino externo autorizado, backup recuperable de fuentes y configuración necesaria, scanner de secretos y reconciliación semántica antes de PR producto. | Director/propietario autorizan; Codex ejecuta |
| **Android C2** | VM URI PID-only ausente, APK instalado; cuatro oráculos NOT_RUN | Plan autorizado no destructivo y evidencia nativa + readback real de otro proceso; no retestar runner en N2. | Director → Codex |
| **Pro / tenant / web / empleados** | Contratos OD y fixtures no aprobados completamente | Identidades, matrices y datos sintéticos aprobados; E2E scoped con outbox/PAT, UX L4. | Propietario + Director + Codex |
| **L5, UAT, firma y release** | H9_GLOBAL y release NO_GO | Integración estable, resultados independientes, aprobación humana escrita para B22 y despliegue. | Director + propietario |

**Autoridad documental:** la orden única se conserva en `docs/CODEX_LOTE_ACTUAL.md` dentro de PR #2; las órdenes previas son historia, no ejecutables simultáneas. `main`, PR #1 y PR #3 se mantienen fuera del cambio documental. **Siguiente ejecutor: CODEX LUNA** solo si no está ejecutando ya N2; después del ZIP **CHATGPT DIRECTOR**.

# 🔴🚨 SIGUE CODEX LUNA — N2-R1 UNA SOLA VEZ · DESPUÉS SIGUE CHATGPT DIRECTOR. 🚨🔴