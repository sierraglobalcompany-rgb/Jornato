# JORNATO — C2 ENTREGADO BLOCKED_AUTH, SIN ORDEN ACTIVA PARA CODEX (2026-11-19)

**NO REEJECUTAR LA ORDEN C2 INFERIOR.** Entrega recibida: `JOR-H9-C2-NATIVE-READINESS-20261119-UNICO.zip` SHA256 `3F9E1031AFA7FE0BEEABA7A82FB9114CFBA843E88158A2A8C57656E8FF21F576`; CRC PASS, 9/9 manifiesto; `flutter analyze PASS_CURRENT`. Solo se modificó `integration_test/kiosk_flow_test.dart`, instrumentación nativa WRITTEN_NOT_RUN. SQLCipher/Keystore/restart en emulador siguen NOT_RUN, HTTP Pro BLOCKED_CONTRACT. H9_GLOBAL=NO_GO; RELEASE=NO_GO.

**Siguiente dependencia:** autorización explícita del dueño para que Codex cree/use AVD nuevo exclusivo de Jornato, aislado, con herramientas ya instaladas; NO teléfono físico, NO ocho AVD ajenos, NO descargas ni cambios globales. No se presume autorización a partir de esta entrega. Sin autorización, no ejecutar el subgate nativo ni generar otro bloque ritual. Cuando se autorice, Director emite **una sola orden nativa ejecutable** con casos ya escritos y correcciones focales basadas en fallos reales. Owner actual: CHATGPT_DIRECTOR. El usuario no ejecuta QA local.

**Texto inferior archivado solo para trazabilidad.**

---
# CODEX LUNA — JORNATO H9/C2 · MACROBLOQUE ÚNICO DE CIFRADO NATIVO Y PREPARACIÓN EJECUTABLE

**ORDEN ÚNICA NUEVA · 19 de noviembre de 2026 (Colombia).** Sustituye el estado "sin orden activa" del checkpoint posterior a F1 **solo para el gate C2**. **NO** repetir H9-M1 ni H9-M1/F1, ni iniciar una fase nueva de producto, ni repetir su auditoría 10 verdugo + 10 juez. El director contrastó el cierre F1 y la decisión sobre C2 en 20 pasadas documentales; ese trabajo está cerrado. Tu tarea es **actuar sobre el código local real**, no redactar otro plan.

```text
TASK=JOR-H9-C2-NATIVE-READINESS-20261119
OWNER_NOW=CODEX_LUNA
OWNER_AFTER_ONE_ZIP=CHATGPT_DIRECTOR
PROJECT=D:\codex\Jornato
REPORTS=D:\codex\_REPORTES\Jornato\JOR-H9-C2-NATIVE-READINESS-20261119
RUN_GITHUB_ACTIONS=NO
GIT_STAGE_COMMIT_PUSH_MERGE_DEPLOY=NO
DEVICE_PHYSICAL=FORBIDDEN
EXISTING_OTHER_AVDS=FORBIDDEN
AVD_CREATE_OR_START_AUTHORIZATION=NOT_GRANTED_IN_THIS_CHAT
PRO_HTTP_DB=BLOCKED_CONTRACT_UNTIL_SEPARATE_QA_AUTHORIZATION
H9_GLOBAL=NO_GO
RELEASE=NO_GO
```

**Prioridad inalterable:** P0 custodiar WIP → P1 reconocer el flujo nativo que **ya existe** → P2 completar **únicamente** las brechas de prueba/código directamente demostradas → P3 verificar localmente lo que sea posible **sin dispositivo** → P4, **solo si hay una autorización explícita posterior**, ejecutar instrumentación en un emulador exclusivo → P5 entregar un solo ZIP. **No pedirle al propietario que instale herramientas ni ejecute pruebas.** Si no se autoriza el AVD, ejecutar P0–P3 y P5 igualmente, con C2 nativo `NOT_RUN`; no rehacer esta orden ni fingir PASS.

## 1. Hechos inmóviles y criterio de no repetición

- **H9-M1 ZIP** `571F0B288F8B582797AF4043417A2A1B44935B60D649F592172751F402D9A0B6`: según logs 75/75 host tests PASS, Flutter Analyze PASS, Laravel bootstrap normal `portal.error` PASS, APK `productDebug` compilado, **nunca instalado**. Backend B21F-S3 previo 158 tests/2450 assertions `PASS_SCOPED`. Conservar sus resultados como **históricos**, no volver a ejecutar suites completas por reflejo.
- **F1 ZIP** `563ADC7CA9B4625B3B10CC16E0D83760F7996905A604BD49E93574EABEC71CBF`: 24 miembros, CRC y manifiesto 23/23 correctos. Único cambio `test/widget_test.dart` untracked, PRE SHA256 `B3A1990B7D56BAC9484BA510DF308C937FD3B554452428C83D03DD49F99E2671`, POST `B9E929675333D8DD9F8705F6614BB549AAD08DF80CB6E62918C34479A8D5AE39`; test del folio `PASS_FOCAL` y `flutter analyze --no-pub` PASS. **No repetir el test visual**. Los 75 host de H9-M1 no se ejecutaron en F1; 36 de los 37 insumos Dart cotejados conservaron SHA, el único cambio fue el test.
- Rutas **observadas en logs, pero código no entregado a ChatGPT**: `lib/src/persistence/local_encrypted_store.dart` (proveedor `FlutterSecureStorage`, `PRAGMA cipher_version` y controles de integridad), `integration_test/kiosk_flow_test.dart` (intentos de reapertura/durabilidad). **Codex debe leer su versión actual antes de decidir un cambio**; no afirmar implementación a partir de un nombre.
- WIP histórico de F1: `D:\codex\Jornato`, rama `codex/jor-b08-h4-domain-20261025`, HEAD `faf5fe283191f8b5a2724b397009512a2caec1b6`, 235 entradas `git status`, cero staged. **Son datos históricos, NO condiciones de igualdad**. Al tratarse de muchos archivos untracked, Git status NO acredita los bytes de cada archivo.
- GitHub externo consultado por el director: `main=1ee6aae821f8cf177cc64149081ad8847f7fec2e`; PR #1 Draft `faf5fe283191f8b5a2724b397009512a2caec1b6`; PR #3 Draft `104469b119752f395cf9881e732d582feab9db4e` es **F0 remoto** con 119 tests Flutter escritos `NOT_RUN` y 31 smoke checks Dart escritos `NOT_RUN`, no el WIP Android avanzado. PR #2 documental contiene este encargo y su checkpoint. **No hacer pull/merge/cherry-pick del F0**.
- **Bloqueo medido en F1:** `AVD_COUNT=8`, todos **ajenos**; `JORNATO_AVD_COUNT=0`; ADB reportó un único dispositivo físico/no-emulador, solo inventariado; **sin autorización para usarlo**. Se constató que CIPHER_ENGINE, KEYSTORE_EFFECTIVE, RESTART_READBACK, IDEMPOTENCY_NATIVE, TENANT_ISOLATION y CORRUPTION_FAIL_CLOSED estaban `NOT_RUN`. Pro HTTP/DB = `BLOCKED_CONTRACT`; no crear credenciales, usuarios, tokens, roles, bases ni tenants.
- Legislación/negocio: decisiones OD01–OD08 no aprobadas salvo documento posterior inequívoco; mantener bloqueos selectivos. Aplicar L1 KISS/Ponytail, L2 antirruido, L3 causa raíz, L4 UX aprobado sin rediseño, L5 evidencia del SHA y L6 un solo lote. Canon fijo PingPongLaw en `sierraglobalcompany-rgb/PingPongLaw@84e961cadf482d234f4c0ee2ca60e8c7e9b388e8`; leer una sola vez si el texto no está disponible en el WIP y NO instalar hooks/skills por costumbre.

## 2. P0 — Custodia del WIP sin bloquear el desarrollo

1. Confirmar que el árbol correcto existe; consultar **solo lectura** rama, HEAD, `git status --porcelain=v1 -uall`, índice staged y rutas relevantes. No exigir los 235 estados históricos ni forzar checkout/reset. Guardar reportes PRE **fuera** del WIP. Hacer copia temporal externa y SHA256 PRE **de cada archivo exacto que se pretenda editar**, especialmente si es `??`. Nunca confiar en `git diff` para verificar untracked.
2. No tocar archivos de otros proyectos, datos reales, `.env`, claves, certificados, bases, usuarios, contenedores/redes ajenos, FTP/Hostinger, configuración global o instalaciones. Prohibido `git add/commit/push/pull/merge/rebase/reset/clean/stash/checkout`, `docker prune`, `down -v`, `migrate:fresh`, hooks, CI pago, borrar apps/AVD o cambios globales de PATH/SDK. No hacer backup gigante del WIP: conservar **solo** los bytes PRE de los archivos objetivo en carpeta externa con permisos adecuados.
3. Si el código que se pretende editar cambió por otro ejecutor o la ruta no existe, **no sobrescribir**. Elegir un tramo independiente, marcar `COLLISION` focal y seguir. Todo parche debe ser delta respecto al PRE real, no contra el README F0 ni contra HEAD antiguo.

## 3. P1 — Localizar el propietario real del cifrado (no es otra auditoría)

4. Inspeccionar **solo** los módulos necesarios: adaptador de almacenamiento cifrado, proveedor de claves/Android Keystore realmente invocado, apertura/cierre/reapertura, tabla de eventos y outbox existente, migraciones que afecten cifrado, su único test de integración y el proyecto Android/Gradle que los empaqueta. Usar nombres reales encontrados, no crear un segundo adaptador, provider, base, repositorio, outbox o canal por conveniencia. Completar internamente un mapa de **máximo seis filas**: evento→escritura→archivo cifrado→clave→reapertura→lectura; archivo/método real por fila. No producir otro informe de arquitectura general.
5. Diagnosticar **causa raíz verificable** de una brecha, si existe: (a) abrir base sin pasar clave, (b) cifrado host confundido con nativo, (c) Keystore simulado o clave fija, (d) escritura que no persiste, (e) reintentos duplican evento, (f) aislación de tenant incorrecta, (g) corrupción aceptada o reemplazada silenciosamente. Si no puedes demostrar brecha desde fuente/contrato existente, **no reescribas producto**. Preservar la semántica de evento append-only, sujeto, actor, workspace/tenant, outbox, recibos y periodos reales.
6. Decidir `IMPLEMENTATION_STATE=READY_FOR_NATIVE_TEST|GAP_DEMONSTRATED|BLOCKED_SOURCE`. Si la instrumentación **ya cubre** el control, reutilizarla. No programar tests duplicados para subir contadores.

## 4. P2 — Implementación focal de pruebas nativas, sin depender de AVD

7. Trabajar sobre la instrumentación existente, normalmente `integration_test/kiosk_flow_test.dart`. **No crear otro framework ni harness paralelo**. Mantener datos exclusivamente sintéticos, aislados por workspace/actor, con nombres y claves de prueba que jamás correspondan a operaciones reales. Las pruebas deben invocar las mismas APIs de almacenamiento que usa el producto y, cuando se ejecuten en Android, el canal nativo/Keystore efectivo; no sustituirlo por SQLite FFI host o mocks y declararlo nativo.
8. Completar únicamente los casos **faltantes y comprobables** de esta matriz, sin reescribir los que ya existen: 

   | Gate | Oráculo mínimo requerido para PASS nativo futuro |
   |---|---|
   | `CIPHER_ENGINE` | apertura por el adaptador real, presencia de motor SQLCipher **y** archivo que no pueda interpretarse como SQLite claro/abrirse con clave incorrecta; conservar readback correcto con la clave legítima |
   | `KEYSTORE_EFFECTIVE` | recorrido real del proveedor Android/Keystore de la app, clave no codificada ni impresa, recuperación legítima y fallo cerrado si el material de clave no está disponible; `cipher_version` solo no basta |
   | `RESTART_READBACK` | guardar evento/outbox, detener **proceso** de forma controlada y relanzar sin desinstalar/limpiar datos; mismos IDs y secuencia al recuperar; diferenciar relanzar widget de reiniciar proceso |
   | `IDEMPOTENCY_NATIVE` | dos reintentos del mismo eventId y contenido producen un solo evento; mismo ID/carga diferente debe resultar en conflicto, nunca sobrescribir historia |
   | `TENANT_ISOLATION` | tenant/actor B no puede leer ni mutar registros de A con el mecanismo de aislamiento aprobado (sin simular un permiso inexistente) |
   | `CORRUPTION_FAIL_CLOSED` | copia sintética corrupta en área de QA aislada provoca rechazo recuperable, no retorno silencioso de historial vacío ni eliminación de datos |

   Si ya existe un caso funcional, **no duplicarlo**. Si el API no permite ejecutar un caso sin maniobra invasiva, preparar el test con precondición explícita o marcar `BLOCKED_CONTRACT`; no introducir una API de depuración productiva para engañar al test. **No forzar datos de prueba en producción ni leer/capturar claves**.
9. Si se descubre un defecto inequívoco en el propietario de persistencia, corregirlo **una sola vez en su clase existente** y el test afectado; sin añadir paquetes, servicios ni nuevos permisos. Si faltan decisiones OD, bloquear solo esa parte. Si no hay defecto demostrado, los cambios aceptables son **solo instrumentación faltante** o `CHANGED_FILES=NONE` con evidencia. No alterar C1 visual ya cerrado, backend, esquema de roles, reglas de cobro, identidad ni UX aprobada.

## 5. P3 — Verificación local sin emulador y límites de lo probado

10. Si se modificó código Dart, ejecutar `flutter analyze --no-pub` **una vez** sobre el árbol actual y solo los tests host que realmente dependan de los métodos cambiados (si existen). No reejecutar la suite de 75 ni el bootstrap Laravel como ritual; solo pruebas vecinas **cuando la implementación les cambie el contrato**. Si no se modificó código ejecutable, reutilizar los PASS previos identificando SHA y fechas: no transformar fuente escrita en PASS. Compilación APK **solo** si hubo cambio Android/Gradle o un cambio de producto que requiere comprobar ensamblaje, y solo con dependencias ya disponibles; no volver a construir APK por rutina.
11. La instrumentación Android nueva puede quedar `WRITTEN_NOT_RUN` si no hay AVD autorizado. No afirmar que Flutter host cargó el plugin nativo. No instalar toolchains, descargar imágenes, tocar dependencias de otros proyectos ni buscar más AVD ajenos. Conservar logs y exit codes del árbol realmente comprobado. Pro HTTP/DB sigue `BLOCKED_CONTRACT`: no hay credenciales/tenant QA autorizados; **no intentar HTTP real ni crear red Docker para simular aprobación**.

## 6. P4 — Gate OPCIONAL: usar AVD solo con autorización nueva y explícita

**ESTADO AL GENERAR ESTA ORDEN: `AVD_CREATE_OR_START_AUTHORIZATION=NOT_GRANTED`. El mensaje del propietario pidiendo 10+10 pasadas y un prompt NO equivale a aprobar AVD. Por defecto OMITIR este apartado sin bloquear P0–P3.** Solo cambia si el usuario añade una instrucción explícita verificable **antes de que Codex actúe**, por ejemplo: "Autorizo crear y utilizar un AVD exclusivo desechable Jornato, solo con imagen Android ya instalada, en carpeta aislada, sin teléfono físico ni los ocho AVD ajenos". El Codex NO puede autoasignarse ese permiso ni deducirlo del repo.

12. Si y solo si hay tal autorización **y** SDK/imagen ABI ya instalados, comprobar recursos y compatibilidad minSdk 24 con consultas; no descargar imágenes. Crear/usar **un solo** AVD Jornato nombrado de forma inequívoca, con `-p` o `ANDROID_AVD_HOME` apuntando a carpeta de QA independiente, **sin** sobreescribir `~/.android/avd`, otros ocho AVD ni variables globales. Registrar su ruta, dueño y origen de permiso. Si la creación exigiría cambiar configuración de todo el equipo, detener `BLOCKED_RESOURCE`; no "probar otra variante". La CLI oficial de Android documenta `avdmanager create avd -n ... -k ... -p ...`; elegir los valores **reales** detectados, sin inventar SDK-id.
13. Identificar el `emulator-serial` de ese AVD sin ambigüedad. Toda acción `adb`, `flutter test`, instalación o lectura se dirige **exclusivamente** mediante serial/`-d` a ese emulador, nunca al teléfono físico ni por selección automática. No usar los ocho AVD ajenos, ni limpiarlos ni pararlos. Ejecutar únicamente la instrumentación C2 de la app real con datos sintéticos; preferir el comando existente del proyecto y si no, `flutter test integration_test/kiosk_flow_test.dart -d <emulator-serial>` cuando el entorno lo soporte. Una prueba que vuelve al mismo proceso NO prueba force-stop/restart: distinguir evidencia de instrumentación y evidencia del ciclo de vida nativo.
14. Si la prueba requiere recrear su **propio** AVD, solo usar mecanismos aislados y autorizados, nunca `adb uninstall`/`pm clear` sobre cualquier otro dispositivo; si la restauración no puede probarse sin acciones arriesgadas, marcar `NOT_RUN`. Grabar `API_LEVEL`, `ABI`, versión/firmado APK debug, **SHA real del binario si existe**, test/exit y resultado por seis gates. El AVD debe tener datos ficticios; no exportar DB ni claves. Si falla, corregir causa raíz mínima y reejecutar el caso tocado una vez. La ejecución nativa no autoriza por sí sola publicación, firma release, Pro HTTP ni H9 GO global.

## 7. P5 — ZIP único para director y continuidad, sin secretos

15. Capturar PRE/POST del índice, HEAD, rama, status focal y **SHA256 bytes de cada archivo editado/untracked**. No concluir preservación del WIP total solo por estado Git de 235 rutas. Si hay ediciones, incluir `CHANGES.patch` como **diff real entre copia PRE y POST** de untracked, con instrucciones para aplicar sobre SHA PRE exacto. Si no hay ediciones, declarar `CHANGED_FILES=NONE`; no producir parche ficticio.
16. Una sola entrega `JOR-H9-C2-NATIVE-READINESS-20261119-UNICO.zip` bajo `D:\codex\_REPORTES\Jornato\JOR-H9-C2-NATIVE-READINESS-20261119\delivery\`: `FINAL_REPORT.md` (máximo 2 páginas), `RESULTS.csv` (una fila/gate con `source_sha256,log_path,log_sha256,artifact_sha256` separados), `WIP_PRE_POST.csv`, logs de tests **solo si se ejecutaron**, `CHANGES.patch` si hay delta, `BLOCKERS.md` solo si bloqueos reales, `MANIFEST_SHA256.csv` (SHA/tamaño de **los otros miembros**, excluye el propio manifiesto). Verificar ZIP CRC, archivos y hashes **después de construirlo**. SHA256 del ZIP en la respuesta, fuera del ZIP; nada disperso.
17. Excluir `.env`, bases de datos, claves, tokens, cookies, firmas, certificados, archivos de usuarios/empleados, fotos, CV, fuentes de otros proyectos, APK de producción, logs crudos sensibles o el WIP completo. Solo datos sintéticos, logs sanitizados y diffs focales; ningún resultado `PASS` si falta la evidencia necesaria. No hacer `git add/commit/push/pull/merge/deploy`, no tocar GitHub Actions. La documentación pública de GitHub solo la mantiene ChatGPT director hasta que exista revisión de sanitización para publicar el WIP; **NO** inferir permiso de publicar código local por el deseo de continuidad.
18. El resultado debe distinguir **lo realmente ejecutado por Codex hoy** de H9-M1/F1/B21F reutilizado, e indicar exactamente qué falta para que Android sea `PASS_EMULATOR_SCOPED`. No pedir aclaraciones entre subpasos mecánicos, ni abrir otra auditoría, ni generar una segunda tarea. Si AVD no autorizado, entregar igualmente avances de instrumentación o `READY_FOR_NATIVE_RUN/BLOCKED_AUTH`, sin proclamar cifrado verificado.

## 8. Salida de Codex — copia exacta de valores reales, no aspiraciones

```text
TASK=JOR-H9-C2-NATIVE-READINESS-20261119
RESULT=READY_FOR_NATIVE_RUN|PASS_EMULATOR_SCOPED|PARTIAL|BLOCKED_AUTH|BLOCKED_SOURCE
SOURCE_HEAD=<real, no modificarlo por comodidad>
SOURCE_BRANCH=<real>
WIP_PRESERVED=YES|NO|PARTIAL_EVIDENCE
CHANGED_FILES=<lista o NONE>
IMPLEMENTATION_STATE=READY_FOR_NATIVE_TEST|GAP_DEMONSTRATED|BLOCKED_SOURCE
ANALYZE=PASS_CURRENT|REUSED|FAIL|NOT_RUN
NATIVE_EXECUTION=PASS_EMULATOR_SCOPED|FAIL|NOT_RUN_NO_AUTH|BLOCKED_RESOURCE
CIPHER_ENGINE=PASS|FAIL|WRITTEN_NOT_RUN|NOT_RUN
KEYSTORE_EFFECTIVE=PASS|FAIL|WRITTEN_NOT_RUN|NOT_RUN
RESTART_READBACK=PASS|FAIL|WRITTEN_NOT_RUN|NOT_RUN
IDEMPOTENCY_NATIVE=PASS|FAIL|WRITTEN_NOT_RUN|NOT_RUN
TENANT_ISOLATION=PASS|FAIL|WRITTEN_NOT_RUN|NOT_RUN
CORRUPTION_FAIL_CLOSED=PASS|FAIL|WRITTEN_NOT_RUN|NOT_RUN
H9_M1_HOST_75=REUSED_PASS_NOT_RERUN
F1_WIDGET=REUSED_PASS_FOCAL_NOT_RERUN
BOOT_NORMAL=REUSED_PASS_NOT_RERUN
PRO_HTTP_DB=BLOCKED_CONTRACT
PHYSICAL_ANDROID=NOT_USED
AVD_AUTHORIZATION=NOT_GRANTED|EXPLICITLY_GRANTED_WITH_SOURCE
H9_GLOBAL=NO_GO
RELEASE=NO_GO
ZIP_PATH=<ruta del único ZIP comprobado>
ZIP_SHA256=<SHA256 real de ese ZIP>
NEXT_OWNER=CHATGPT_DIRECTOR
```

**Criterios terminales:** `READY_FOR_NATIVE_RUN` = código/instrumentación pertinente listo y comprobaciones no nativas aplicables ejecutadas, **pero Android NOT_RUN**; `PASS_EMULATOR_SCOPED` = ejecución Android real y **seis gates relevantes** con evidencia en emulador Jornato autorizado, sin fallos observados; `PARTIAL` = subpruebas efectivamente ejecutadas con fallos o cobertura incompleta; `BLOCKED_AUTH` = no pudo realizarse prueba nativa por ausencia de autorización, sin que eso anule avances seguros; `BLOCKED_SOURCE` = fuente/contrato del propietario inaccesible o no reconciliable. Si el código fuente no cambió y el AVD está prohibido, preferir `BLOCKED_AUTH` a presentar un macrobloque documental como desarrollo completado. **Ninguno implica `RELEASE=GO`.**

**SECUENCIA ÚNICA. PRIMERO CODIFICA/VERIFICA LO AUTORIZADO, DESPUÉS ENTREGA UN SOLO ZIP.** El H9-M1/F1 visual, B21F backend y 10+10 auditorías quedan **cerrados y reutilizados**. No repetir. 

# 🚨 QUIÉN SIGUE: CODEX LUNA — SOLO ACCIONES SEGURAS. DESPUÉS DEL ZIP ÚNICO: CHATGPT DIRECTOR. 🚨
