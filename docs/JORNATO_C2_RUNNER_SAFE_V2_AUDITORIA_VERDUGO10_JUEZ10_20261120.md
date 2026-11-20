# JORNATO — AUDITORÍA ADVERSARIAL DE LA ORDEN C2 RUNNER SEGURO V2 · 10 VERDUGO + 10 JUEZ

**Corte:** 20-11-2026. **Objeto exacto:** `CODEX_JORNATO_C2_DESBLOQUEO_RUNNER_INSTALACION_UNICA_20261119.md`, orden vigente antes de esta revisión y GitHub PR #2. **Hechos directos contrastados:** ZIP `JOR-H9-C2-PHYSICAL-ANDROID-QA-20261119-UNICO.zip` SHA-256 `6E58737061FA00D9CF60F630758D3C4E66CCF0F161027E83A641417C173BC278`, 9 archivos, CRC y 8/8 hashes del manifiesto verificados; `FINAL_REPORT.md`, `BLOCKERS.md`, `RESULTS.csv`, `logs/build_offline_success.log` y `logs/runner_and_artifact_findings.txt` inspeccionados. **Límite:** el ZIP no incluye bytes del APK ni WIP completo; ChatGPT no ejecutó las pruebas Android. Esta revisión adversarial la hace **el mismo director en dos roles**, no un auditor externo independiente certificado. No se repiten las auditorías de H9, F1 ni C2 readiness.

## 1. Diez pasadas VERDUGO — buscar fallo, causa y corrección

| ID | Pregunta adversarial / prueba realizada | Hallazgo | Corrección resolutiva |
|---|---|---|---|
| **V01** | ¿El APK es realmente un APK normal que necesita otro build? Comprobé log Gradle exacto del ZIP. | **NO:** ya fue compilado desde `integration_test/kiosk_flow_test.dart` con `-Ptarget=...`, build `SUCCESSFUL`. | Retirar instrucción que permita reconstrucción por presuponer entrypoint incorrecto; reutilizar el SHA/archivo local si coincide. |
| **V02** | ¿`flutter drive --target` reemplaza Dart compilado? Contrasté fuente de `drive.dart` y README oficial. | **NO:** `--use-existing-app` se conecta a proceso ya lanzado y no recompila/arranca; el target debe venir previamente en APK. | Verificar artefacto+log de build **antes** de install; solo conectar mediante driver al test ya empaquetado. |
| **V03** | ¿`-t` instala sin reemplazo? Contrasté manpage oficial ADB y fuente del runner. | `-r` es flag de reemplazo; `-t` permite instalar APK test-only; Flutter runner agrega `-r` y fallback uninstall. | Una sola instalación manual sin `-r`, sin teardown, solo paquete exacto ausente. |
| **V04** | ¿`pm list packages` basta para probar ausencia? Revisé inventario F1/C2 y log de perfil Android. | C2 confirmó ausencia en user0; el estado puede cambiar y podría existir otro perfil/paquete al momento del intento. | Revalidación inmediata, igualdad exacta y bloqueo si identidad/visibilidad no son inequívocas. |
| **V05** | ¿La autorización de usar teléfono cubre cambios destructivos? Leí las palabras exactas del propietario. | Autoriza uso para Jornato QA, **no** otras apps, borrados, root ni cambios de permisos globales. | Mantener serial explícito, app aislada, no instalar en paquetes preexistentes y datos sintéticos. |
| **V06** | ¿`--use-existing-app` garantiza cero efectos secundarios en Flutter 3.47.8? Contrasté upstream y evidencia local del SDK. | El upstream usa `reuseApplication(...)`, pero debe confirmarse versión instalada y `--keep-app-running`, no inventar URI. | Un único prefiltro focal del SDK y del help; bloquear si difiere, sin cambiar SDK global. |
| **V07** | ¿Se compilaron driver host y target en el mismo sitio? Leí ejemplo oficial. | Driver host de `integration_test` es archivo separado, por lo general `test_driver/integration_test.dart`. | Reutilizarlo o crear **solo el mínimo host** si falta; no volver a compilar el APK por añadir ese driver. |
| **V08** | ¿La prueba de SQLCipher/Keystore da certeza con `cipher_version`? Comparé gates del reporte. | Esa condición no demuestra Keystore efectivo, manejo de clave ni recuperación. | Estados separados `PLUGIN_PATH_PASS_ONLY`, `PASS_PHYSICAL` o `INCONCLUSIVE` con oráculos estrictos. |
| **V09** | ¿La corrupción de un byte asegura fallo detectable? Inspeccioné explicación de la sonda del ZIP. | Cambiar un byte sobre copia no prueba que consulta toque área corrupta. | Si no hay rechazo observable, **INCONCLUSIVE**, no modificar expectativa para hacerla pasar. |
| **V10** | ¿Reabrir DB demuestra reinicio Android? Verifiqué el informe C2. | Solo existe `close/open` en un mismo proceso; no hay harness de dos fases probado. | No forzar proceso con test vivo ni reescribir suite antes de ejecutar cuatro gates preparados; `BLOCKED_HARNESS` si falta restart real. |

## 2. Diez pasadas JUEZ — refutar correcciones y conservar la más simple suficiente

| ID | Contraargumento real considerado | Resolución y motivo |
|---|---|---|
| **J01** | Reconstruir APK siempre podría garantizar coherencia. | **Rechazar por defecto:** SHA previo y log prueban el target; un build repetido añade ruido y puede cambiar cachés. Solo reconstruir **una vez** si el binario falta y source/target se pueden reconciliar. |
| **J02** | Rehacer el APK como lib/main.dart facilitaría arrancar la app. | **Rechazar:** no ejecutaría las aserciones de `kiosk_flow_test.dart`; arranque UI no es C2 PASS. |
| **J03** | `flutter drive --use-existing-app` podría ser inseguro de todos modos. | **Aceptar condicionalmente:** hay evidencia de rama de `reuseApplication`; confirmar **SDK instalado**, ninguna instalación/parada implícita y `keep-app-running`. Si difiere, bloquear sin experimentar en teléfono. |
| **J04** | Evitar cualquier instalación física sería más seguro. | **Rechazar prohibición total:** usuario autorizó teléfono y paquete QA nuevo; una instalación sin reemplazo, con preflight estricto, permite progreso real sin invadir otros paquetes. |
| **J05** | Crear un nuevo test driver/framework ahorraría limitaciones. | **Rechazar framework:** driver oficial mínimo basta si falta; no introducir nuevas dependencias ni motor de tests. |
| **J06** | Arreglar la prueba de restart antes del primer install cerraría más gates. | **Rechazar como requisito bloqueante:** el test de cuatro gates ya está compilado; inventar harness antes de la primera ejecución retrasa lo crítico y obliga a otro build. Restart permanece gate separado hasta evidencia verdadera. |
| **J07** | Desinstalar el paquete QA al terminar dejaría teléfono limpio. | **Rechazar:** no está autorizado, borra evidencia/datos de QA y puede interferir con continuación segura. Dejar instalado, sin cambiar datos ajenos. |
| **J08** | Una falla nativa debería autorizar reintentar con `-r`. | **Rechazar:** riesgo de reemplazo/desinstalación no autorizado. Un intento de instalación, un intento de conexión; corregir fuente sin volver a desplegar ese lote. |
| **J09** | Repetir 75 host y 158 backend mejoraría confianza. | **Rechazar por rutina:** no hubo delta justificante. Si aparece bug nativo, probar focalmente solo el módulo afectado; no mezclar origen de PASS con la ejecución física. |
| **J10** | PASS de cuatro gates podría significar H9 GO. | **Rechazar:** sin restart en nuevo proceso, tenant/Pro autorizados y otras aprobaciones, solo `PASS_NATIVE_SUBSET` con evidencia; lanzamiento sigue `NO_GO`. |

## 3. Correcciones frente al texto anterior — sin cambiar producto

1. **Corrección de máxima prioridad:** el texto anterior condicionaba innecesariamente el APK a trabajo de reconstrucción; el ZIP **ya prueba target de integración**. Se reemplazó por `APK PREVIOUS_SHA256` y `ENTRYPOINT_VERIFIED` como preflight de una sola instalación.
2. La instrucción `--target` en `flutter drive --use-existing-app` queda explícitamente tratada como **NO recompilación**. El test debe estar en el APK y su driver host separado.
3. `RESTART_READBACK` se vuelve honesto: **NO** `PASS` por reopen en mismo proceso; tampoco se bloquean cuatro pruebas nativas ya listas por falta de un harness nuevo.
4. No se crea emulador, flavor, plugin, API, esquema ni servidor nuevo. El único cambio posible es driver host mínimo si realmente falta o una corrección de fallo reproducido.
5. Se conserva el permiso del teléfono, se limita el uso y se exige ZIP único con hashes/logs sanitizados. No modificar la rama remota del código ni ejecutar GitHub Actions.

## 4. Oráculos de aceptación

- `PACKAGE_ABSENT` y `APK_ENTRYPOINT=integration_test/kiosk_flow_test.dart` atribuibles a manifest/log + SHA actual del artefacto, **antes de adb install**.
- Ejecutar una vez `adb install -t` sin reemplazo sobre serial único y paquete QA ausente; iniciar solo esa Activity; adjuntar `flutter drive --use-existing-app` con URI verificable **sin instalar o parar apps**.
- Para PASS nativo exigir resultados de las aserciones, no solo APK build/instalación, UI abierta, VM Service o `cipher_version`.
- Evidencia separada para 4 gates físicos, restart dos procesos, multi-tenant y sync Pro. **Ningún `PASS_NATIVE_SUBSET` equivale a `RELEASE=GO`.**

## 5. Fuentes y límites

- ZIP local aportado por el propietario (integridad y logs examinados, pero APK bytes solo en Windows local de Codex).
- `https://docs.flutter.dev/testing/integration-tests`: build debug desde target de integración.
- `https://github.com/flutter/flutter/blob/master/packages/integration_test/README.md`: driver host + target app diferentes.
- `https://codebrowser.dev/flutter/flutter/packages/flutter_tools/lib/src/commands/drive.dart.html`: `--use-existing-app` usa `reuseApplication` en vez de `start`, sujeto a SDK instalado.
- `https://android.googlesource.com/platform/packages/modules/adb/+/refs/heads/main/docs/user/adb.1.md`: `-r` reemplaza, `-t` permite test APK.
- PingPongLaw L1–L6 vigente; arquitectura existente del WIP avanzado no accesible aquí. Esta auditoría **NO afirma revisión completa de su código ni ejecución física**.

**Dictamen:** `PROMPT_C2_RUNNER_V2_AUDITADO`, `APK_PRECOMPILADO_TARGET_CORRECTO_SEGÚN_LOG`, `ANDROID_NOT_RUN`, `NEXT=CODEX_LUNA`, `RELEASE=NO_GO`. **No volver a auditar el prompt C2 en Codex; actuar sobre el mismo bloque.**
