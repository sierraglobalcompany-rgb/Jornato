# CODEX LUNA — JORNATO · C2 FÍSICO V2 · MACROBLOQUE ÚNICO DE EJECUCIÓN NATIVA SEGURA

**ORDEN ÚNICA VIGENTE.** Sustituye íntegramente `CODEX_JORNATO_C2_QA_ANDROID_FISICO_AUTORIZADO_20261119.md` y su texto anterior en `docs/CODEX_LOTE_ACTUAL.md`; mantiene **la misma TASK**, no inaugura C3 ni pide otra revisión 10+10. **Haz trabajo y pruebas reales, no otro informe de arquitectura.** El propietario autorizó «usa el celular que esta conectado y disponible», exclusivamente para QA de Jornato. La revisión adversarial de esta orden ya la hizo ChatGPT Director: [auditoría específica V2](JORNATO_C2_FISICO_V2_AUDITORIA_10_VERDUGO_10_JUEZ_20261119.md). **NO ejecutar otra auditoría en Codex.**

```text
TASK=JOR-H9-C2-PHYSICAL-ANDROID-QA-20261119
OWNER=CODEX_LUNA
OWNER_AFTER_SINGLE_ZIP=CHATGPT_DIRECTOR
WIP=D:\codex\Jornato
REPORTS=D:\codex\_REPORTES\Jornato\JOR-H9-C2-PHYSICAL-ANDROID-QA-20261119
GITHUB_ACTIONS=NO
GIT_STAGE_COMMIT_PUSH_PULL_MERGE_RESET_CLEAN_STASH=NO
PHYSICAL_DEVICE=PERMITTED_ONLY_ONE_CONNECTED_PHONE_FOR_SYNTHETIC_JORNATO_QA
AVDS_OTHER_DEVICES=FORBIDDEN
DELETE_UNINSTALL_PM_CLEAR_FACTORY_RESET_ROOT=FORBIDDEN
READ_OR_CHANGE_OTHER_APPLICATIONS=FORBIDDEN
PRO_HTTP_DB=BLOCKED_CONTRACT
H9_GLOBAL=NO_GO
RELEASE=NO_GO
```

## 0. Decisiones ya cerradas; no perseguirse la cola

**Fuente local prioritaria:** el WIP avanzado y su contrato aprobado. GitHub remoto no lo contiene. La orden está limitada al **cifrado Android SQLCipher/Keystore, idempotencia, corrupción en copia ficticia y, si existe soporte de dos etapas, readback tras reiniciar el proceso de la propia app**. No alterar UI, GPS, kiosco comercial, política OD01–OD08, backend/Pro, código de otras aplicaciones, integraciones de cobro ni esquema de datos. **No inventar una segunda persistencia, proveedor de claves, harness o aplicación.**

**Históricos reutilizables, no repetir por rutina:**

- H9-M1 ZIP SHA256 `571F0B288F8B582797AF4043417A2A1B44935B60D649F592172751F402D9A0B6`: 75/75 tests host PASS y bootstrap Laravel normal PASS en el alcance de sus logs; APK `productDebug` compilado pero no instalado.
- F1 ZIP SHA256 `563ADC7CA9B4625B3B10CC16E0D83760F7996905A604BD49E93574EABEC71CBF`: fallo visual del folio **PASS_FOCAL**; no repetir.
- C2 readiness ZIP SHA256 `3F9E1031AFA7FE0BEEABA7A82FB9114CFBA843E88158A2A8C57656E8FF21F576`: CRC PASS, 9/9 manifiesto; **solo** cambió `integration_test/kiosk_flow_test.dart` de SHA256 `E5E1227735E063F5E17F0C7FBE3965280E84081013AD66E1623E9A4D81022EB9` a `30267B4110336B479437CFFE3C31392EF67CD32DEDC684F2179EC47808BB3E30`. `flutter analyze --no-pub` PASS. **Los tests nativos fueron ESCRITOS, NO EJECUTADOS**; el adaptador productivo `lib/src/persistence/local_encrypted_store.dart` se mantuvo, SHA256 `AF5D835A56A6085F1851CEED371C3730D7CCCD374A382060B271D528808FE4A9` en esa entrega.
- B21F-S3 backend 158 tests / 2450 assertions PASS_SCOPED histórico; no repetir. Pro HTTP/DB **BLOCKED_CONTRACT**: ni cuenta sintética aprobada ni servidor QA autorizado. Nunca inventar usuarios/roles/tokens.
- WIP histórico `D:\codex\Jornato`, rama `codex/jor-b08-h4-domain-20261025`, HEAD `faf5fe283191f8b5a2724b397009512a2caec1b6`, 235 rutas status y 0 staged; **NO exigir que esos valores sigan iguales hoy**. El WIP avanzado no se debe copiar ni fusionar con PR #3 F0 remoto.
- GitHub remoto al preparar esta orden: `main=1ee6aae821f8cf177cc64149081ad8847f7fec2e`, PR #1 `faf5fe283191f8b5a2724b397009512a2caec1b6`, PR #3 `104469b119752f395cf9881e732d582feab9db4e` Draft apilado, PR #2 documental. Estos SHA son referencias de contexto, no precondiciones para forzar un checkout.

**Autoridad:** las seis leyes L1 KISS/Ponytail, L2 antirruido, L3 causa raíz, L4 UX humano aprobado, L5 prueba atribuible y L6 antiping-pong están en PingPongLaw SHA fijo `84e961cadf482d234f4c0ee2ca60e8c7e9b388e8`. Consultar el canon una vez **solo si** no está disponible localmente; no instalar hooks, skills ni dependencias globales. La autorización del teléfono **no autoriza destruir/actualizar datos previos ni cambiar la configuración global**.

## P0 — Proteger WIP y decidir si este celular admite prueba sin riesgos

1. **Custodia focal.** En el WIP, leer `AGENTS.md` y contratos aplicables, rama/HEAD/status/index sin cambiar Git. Guardar PRE de archivos que podrían editarse: SHA256 y copia byte a byte **fuera** del WIP para cada archivo `??` o tracked objetivo (en particular `integration_test/kiosk_flow_test.dart`, el store, runner/flavors si son relevantes). Si aparecen cambios simultáneos del mismo archivo, no sobrescribir; `BLOCKED_COLLISION` solo para ese tramo. No limpiar 235 rutas ni calcular hashes globales de toda la empresa. Nunca copiar datos reales a informes.
2. **Identidad del dispositivo, solo consultas.** `adb devices -l` permite inventariar, pero no autoriza elegir automáticamente. Identificar un único equipo físico Android en estado `device` mediante propiedades read-only dirigidas por `adb -s <SERIAL>` (por ejemplo `ro.kernel.qemu`, API/ABI y compatibilidad con minSdk 24). Si hay más de un teléfono físico disponible, estado `unauthorized`, `offline`, perfil no identificable o conflicto de selección: `BLOCKED_DEVICE_AMBIGUOUS`; hacer solo trabajo local independiente. Todos los comandos posteriores ADB llevan `-s <SERIAL>` y Flutter `-d <SERIAL>`. **No abrir fotos, mensajes, cuentas, logs globales, apps de terceros, ni publicar el serial completo**. No AVD, root, reboot, USB settings ni cambios al teléfono fuera de la app Jornato debug.
3. **Paquete final antes de tocar el teléfono.** Identificar el `applicationId` real del flavor/variante Android, su `applicationIdSuffix` si existe, test package y firma del APK debug desde Gradle/manifest/artefacto real, no desde nombres recordados. Verificar que el runner de integración usará **ese mismo** flavor/paquete; si corresponde a `productDebug`, no ejecutar un comando sin `--flavor` si este podría elegir otro paquete. Confirmar compatibilidad API/ABI y que las dependencias necesarias ya están en caché. No crear otro flavor ni modificar el ID productivo para fabricar aislamiento.
4. **Puerta no negociable de preservación del teléfono.** Comprobar por consultas de paquete **limitadas a los ID exactos de Jornato y test APK**, incluidos perfiles Android relevantes cuando sea posible. **Una consulta de paquetes no informa si la app tiene datos: si el ID exacto ya está instalado y no existe evidencia inequívoca de que sea una instancia sintética y desechable propiedad de esta QA, NO actualizar, reinstalar, reemplazar ni ejecutar la suite sobre ese ID: `BLOCKED_PACKAGE_EXISTING_UNKNOWN_DATA`.** Una firma compatible NO demuestra datos descartables. Si hay un perfil/usuario desconocido que impide descartar colisión, `BLOCKED_PACKAGE_SCOPE`. Solo instalar si los ID destino **no están instalados** y el flujo de pruebas no afecta otras aplicaciones. No usar `pm clear`, `adb uninstall`, `install -r`, `uninstall-first`, factory reset ni flags para forzar reemplazo.
5. **Puerta específica del runner (antes del primer `flutter test`).** Leer el comando/harness ya presente y comprobar su comportamiento con app APK, test APK y *teardown*: ¿instala, actualiza, desinstala o limpia datos automáticamente? ¿En qué package ID? ¿Reinstala tras `force-stop`? No basta con comprobar que `adb install` manual sería seguro: **Flutter puede gestionar instalaciones durante la integración**. Si alguna acción no autorizada es inevitable, `BLOCKED_RUNNER_SIDE_EFFECT` y no ejecutar. No lanzar `flutter run`, `flutter drive` o `flutter test` a ciegas para averiguar el efecto. Evitar doble instalación manual + automática. **La instalación inicial de un paquete debug nuevo, sintético, sin ID previo y sin desinstalación/limpieza posterior está cubierta por la autorización; ninguna otra operación destructiva lo está.**

**Regla de avance:** sin P0 completo, no ejecutar código de integración sobre el teléfono. Continuar con análisis de fuente y corrección estrictamente focal fuera del dispositivo; no simular `PASS_PHYSICAL` ni pedir al propietario que haga pruebas.

## P1 — Inspeccionar el único test nativo existente, corregir solo un riesgo comprobado

6. Leer `integration_test/kiosk_flow_test.dart`, `lib/src/persistence/local_encrypted_store.dart`, `lib/src/persistence/kiosk_repository.dart`, `pubspec.lock`, Gradle y runner. Antes de ejecutar, verificar las precondiciones **reales** de datos ficticios y namespace del test: `jornato.c2.missing-key.qa`, archivo principal, rutas de backup y `Directory.systemTemp`. El test C2 ya llama a `sqlcipher.openDatabase(..., readOnly: true, singleInstance: false)` con clave ausente/incorrecta; crea una base **sintética** en directorio temporal, altera un byte en offset 100 de su **copia** y comprueba que el original queda legible. El propio test también prueba reintentos a través de `KioskRepository`, sin modificar tablas productivas. **No declarar inocuidad por el nombre del archivo**: demostrar que los paths/namespace reales se restringen al paquete debug recién instalado y que no acceden a datos previamente existentes.
7. **Dos hipótesis, no defectos ya demostrados:** (a) el namespace fijo `jornato.c2.missing-key.qa` podría estar contaminado si se reutiliza instalación; (b) cambiar un byte de una página no necesariamente produce un rechazo en la consulta usada. Si las precondiciones de una instalación QA nueva y aislada garantizan el namespace vacío, no añadir código. Si hay colisión/rechazo impredecible, corregir **solo el caso causal**, sin borrar datos ni manipular bases reales. Para corrupción, si el oráculo no visita la región alterada, mejorar **la prueba sobre la copia ficticia**, conservar el original, sin concluir que SQLCipher del producto es inseguro. Evitar tests duplicados, más fixtures, backdoors, proveedores nuevos, hooks y cambios de esquema.
8. Separar las afirmaciones: SQLCipher version + cabecera opaca + lectura con clave legítima + fallos de apertura sin/con clave errónea = evidencia del cifrado efectivo del archivo probado; **no** garantiza resistencia criptográfica integral. `FlutterSecureStorage` en Android y recuperación de clave legítima prueban el camino del plugin, **no certifican por sí solos el uso efectivo de Android Keystore ni hardware-backed Keystore/attestation**. Para `KEYSTORE_EFFECTIVE=PASS_KEYSTORE_VERIFIED` se requiere evidencia nativa verificable de uso del mecanismo Keystore por el proveedor real sin leer secretos; si solo hay recorrido del plugin marcar `PASS_PLUGIN_PATH` y dejar C2 global `PARTIAL_NATIVE`. No leer/imprimir claves. La idempotencia valida que mismo ID/payload no duplique y que mismo ID/diferente payload lance conflicto con tablas/outbox inalteradas. La corrupción de una copia sintética solo certifica ese alcance, no la recuperación de la DB de producción.

## P2 — Ejecutar un solo lote nativo condicionado a P0, corregir causa raíz y parar

9. **Si P0 pasó**, elegir **un único comando** respaldado por el runner real del repositorio para `integration_test/kiosk_flow_test.dart`, especificando dispositivo exacto y flavor real (cuando aplique). Preferir las opciones existentes; comprobar `flutter help test` o `flutter help drive` antes de usar flags no conocidas. Ejemplo *condicional*, NO plantilla obligatoria: `flutter test integration_test/kiosk_flow_test.dart -d <SERIAL> --flavor <FLAVOR_REAL>` si ese SDK/árbol soporta la variante y su instalación/teardown fue evaluada. Usar caché local; no descargar SDK, imágenes, gradle plugins ni dependencias no autorizadas; detener si hay descarga obligatoria. No activar permisos de GPS/cámara ni red Pro. Registrar el SHA de **fuentes actuales**, versión Flutter/Dart, API/ABI, applicationId/variante, SHA del APK generado, firma de depuración pública y comando/exit real, saneando identificadores. Capturar salida del test sin volcar un `logcat` de todas las aplicaciones. La suite puede ejecutar varios tests dentro del mismo archivo: confirmar cuáles y sus efectos **antes** de lanzarla.
10. Clasificar fallos sin tirar todo abajo: `BUILD_FAIL`, `PACKAGE_CONFLICT`, `PLUGIN/ABI_FAIL`, `ASSERTION_FAIL`, `HARNESS_FAIL` o `DEVICE_UNAVAILABLE`. Si un test demuestra una brecha de causa raíz, corregir **el archivo propietario existente y el test afectado**; si demuestra solo un supuesto defectuoso del test, corregir **solo el test**. Guardar PRE/POST de archivos tocados (untracked incluidos) y comprobar `flutter analyze --no-pub` más prueba focal relacionada **una vez tras cambio**. No repetir los 75 host, Laravel bootstrap, F1 widget, auditorías ni toda la integración en bucle. Si el bloqueo requiere permiso, descarga, datos de usuario o nuevo esquema, detener **solo** ese subgate y continuar lo independiente.
11. **Reinicio auténtico, solo si existe mecanismo en dos fases ya soportado por el proyecto.** El test integrado de un único proceso no puede demostrar persistencia tras `am force-stop` y luego continuar asertando dentro del mismo controlador que fue detenido. Antes de ejecutar force-stop, verificar que los datos sintéticos se escribieron y existe un modo seguro y preexistente de nueva sesión que **no reinstale ni limpie el paquete** y permita leer los mismos IDs/eventos/outbox. Usar `adb -s <SERIAL> shell am force-stop <EXACT_QA_PACKAGE>` exclusivamente para ese paquete y **únicamente** cuando esté garantizada la reanudación sin efectos no autorizados; después comprobar el readback desde nueva instancia real. Si el harness no soporta estas dos fases, `RESTART_READBACK=BLOCKED_HARNESS`; no crear una API oculta de producto ni llamar `close/open` del mismo proceso «reinicio». No cerrar otras apps, no reiniciar el teléfono.
12. **Aislamiento tenant A/B:** solo probar con mecanismo y autorización ya existentes; si no, `BLOCKED_CONTRACT`. **Pro HTTP/DB:** `BLOCKED_CONTRACT` sin credenciales QA/tenant autorizados; no conectar a producción ni inventar autorizaciones para cerrar H9. Ningún resultado C2 autoriza RELEASE, B22 ni merge de WIP avanzado.

## P3 — Matriz de aceptación exacta, sin PASS inflados

| Gate | Evidencia suficiente y estado si falta |
|---|---|
| `PACKAGE_ISOLATION` | ID final, consulta previa del ID exacto y prueba de no sobrescritura; si instalado con propiedad/datos no demostrados = `BLOCKED_PACKAGE` |
| `CIPHER_ENGINE` | Prueba real Android: header no SQLite claro, apertura legítima y rechazo no-key/wrong-key con origen de archivo comprobado; si host/mock = `NOT_RUN_NATIVE` |
| `KEYSTORE_EFFECTIVE` | Plugin seguro Android real y recuperación de clave sin extracción; `PLUGIN_PATH_PASS` si no hay evidencia de Keystore/hardware; NO atribuir hardware-backed sin prueba propia |
| `IDEMPOTENCY_NATIVE` | Evento repetido una sola vez, payload incompatible rechazado, secuencia/outbox inmutables; falla observada = `FAIL` |
| `CORRUPTION_FAIL_CLOSED` | Solo copia cifrada temporal/sintética con sentinel intacto en original y rechazo reproducible; si región alterada no se lee = `INCONCLUSIVE`, no asumir PASS/bug |
| `RESTART_READBACK` | Nuevo proceso Android, mismo ID y datos persistidos sin reinstall/clear; si harness solo reabre DB en mismo proceso = `BLOCKED_HARNESS` |
| `TENANT_ISOLATION` | Solo con tenant/rol existente y autorizado; en WIP actual `BLOCKED_CONTRACT` hasta nueva evidencia |
| `PRO_HTTP_DB` | Sigue `BLOCKED_CONTRACT`; nunca cambiar por pasar C2 |

**RESULTADO GLOBAL C2:** `PASS_PHYSICAL_SCOPED` solo cuando **las cuatro pruebas nativas centrales** (`CIPHER_ENGINE=PASS`, `KEYSTORE_EFFECTIVE=PASS_KEYSTORE_VERIFIED`, `IDEMPOTENCY_NATIVE=PASS`, `CORRUPTION_FAIL_CLOSED=PASS_COPY_SCOPED`) más **`RESTART_READBACK=PASS` real** tengan pruebas de ejecución atribuibles a la compilación/paquete exactos, sin fallos y con `PACKAGE_ISOLATION=PASS`. `PASS_PLUGIN_PATH` no basta para este veredicto. Si lo nativo central pasa pero reinicio queda bloqueado, `PARTIAL_NATIVE` y detallar sus PASS individuales. Si no se pudo instalar por conflicto, `BLOCKED_PACKAGE` y ningún PASS nativo. No confundir PASS de C2 con `H9_GLOBAL=GO` ni con aprobación de Pro/tenant.

## P4 — Evidencia ZIP único y entrega sin preguntas intermedias

13. Capturar `HEAD`, rama, `git status --porcelain=v1 -uall`, índice staged y hashes **PRE/POST de cada archivo editado**, incluido untracked; decir `WIP_PRESERVED=PARTIAL_EVIDENCE` si no hasheaste todos los archivos ajenos (no fingir invariancia global). El delta del archivo `??` se genera desde copia PRE exacta; no uses un `git diff` vacío como prueba. Si aparece un cambio ajeno concurrente, no lo incluyas. No hacer `git add/commit/push/pull/rebase/merge/reset/clean/stash/checkout`, no publicar fuentes privadas en GitHub, no alterar CI, no tocar otro proyecto.
14. Generar **exactamente un ZIP** en `REPORTS\delivery\JOR-H9-C2-PHYSICAL-ANDROID-QA-20261119-UNICO.zip` con: `FINAL_REPORT.md` (máximo 2 páginas: qué se ejecutó y límites), `RESULTS.csv` (gate, `PASSED/FAIL/NOT_RUN/BLOCKED`, origen SHA, comando/exit, nivel prueba, `log_path`, `log_sha256`, `artifact_sha256` separados), `WIP_PRE_POST.csv`, logs **sanitizados** solo de acciones ejecutadas, `CHANGES.patch` real si modificaste archivos, `BLOCKERS.md` solo si bloqueo material, `MANIFEST_SHA256.csv` con bytes y SHA256 de **todos los miembros menos el propio manifiesto**. Validar CRC, rutas, cantidades y SHA de cada miembro; calcular SHA256 final del ZIP fuera de él y devolver una sola ruta para adjuntarlo. No incluir serial íntegro, IMEI, IMEI-like, fotos, cuentas, identidad, tokens, DB, claves, certificados, APK, `.env`, otros proyectos ni logcat general.
15. Responder en un único bloque terminal, usando **valores observados** y una única instrucción NEXT; **sin delegar al usuario pruebas manuales**:

```text
TASK=JOR-H9-C2-PHYSICAL-ANDROID-QA-20261119
RESULT=PASS_PHYSICAL_SCOPED|PARTIAL_NATIVE|PARTIAL|BLOCKED_PACKAGE|BLOCKED_DEVICE|BLOCKED_RUNTIME|BLOCKED_RUNNER_SIDE_EFFECT
SOURCE_HEAD=<observado>
SOURCE_BRANCH=<observado>
WIP_PRESERVED=YES|PARTIAL_EVIDENCE|NO
CHANGED_FILES=<lista o NONE>
DEVICE_AUTH=USER_GRANTED_SCOPED
TARGET_DEVICE=ONE_PHYSICAL_REDACTED|BLOCKED
PACKAGE_ISOLATION=PASS|BLOCKED_PACKAGE|BLOCKED_SCOPE|NOT_RUN
APK_DEBUG=BUILT_INSTALLED|BUILT_NOT_INSTALLED|NOT_RUN
PHYSICAL_ANDROID=PASS_PHYSICAL_SCOPED|PARTIAL_NATIVE|FAIL|BLOCKED|NOT_RUN
CIPHER_ENGINE=PASS|FAIL|INCONCLUSIVE|NOT_RUN
KEYSTORE_EFFECTIVE=PASS_PLUGIN_PATH|PASS_KEYSTORE_VERIFIED|FAIL|INCONCLUSIVE|NOT_RUN
HARDWARE_ATTESTATION=NOT_RUN
IDEMPOTENCY_NATIVE=PASS|FAIL|INCONCLUSIVE|NOT_RUN
CORRUPTION_FAIL_CLOSED=PASS_COPY_SCOPED|FAIL|INCONCLUSIVE|NOT_RUN
RESTART_READBACK=PASS|FAIL|BLOCKED_HARNESS|NOT_RUN
TENANT_ISOLATION=BLOCKED_CONTRACT|PASS|NOT_RUN
PRO_HTTP_DB=BLOCKED_CONTRACT
H9_M1_HOST_75=REUSED_PASS_NOT_RERUN
F1_WIDGET=REUSED_PASS_FOCAL_NOT_RERUN
BOOT_NORMAL=REUSED_PASS_NOT_RERUN
H9_GLOBAL=NO_GO
B22=NOT_AUTHORIZED
RELEASE=NO_GO
ZIP_PATH=<ruta real verificada>
ZIP_SHA256=<huella comprobada del único ZIP>
NEXT_OWNER=CHATGPT_DIRECTOR
```

**STOP SOLO EN LA OPERACIÓN INSEGURA, NO EN TODO EL MACROBLOQUE.** Si el teléfono está ocupado por un paquete de datos desconocidos, deja el dispositivo intacto, completa lo seguro del código fuente y entrega `BLOCKED_PACKAGE` con evidencia. **No sustituir el bloqueo con otro AVD o teléfono no autorizado.** Si el paquete está ausente y el runner es seguro, haz la integración real, corrige fallos causales focales y entrega. No crear un nuevo prompt, nueva auditoría ni segunda ronda de infraestructura.

# 🚨 QUIÉN SIGUE AHORA: CODEX LUNA · DESPUÉS DEL ÚNICO ZIP: CHATGPT DIRECTOR. 🚨
