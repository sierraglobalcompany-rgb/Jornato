# CODEX LUNA — JORNATO B15-S5 V2 · MACROBLOQUE ÚNICO DE CIERRE SEGURO DE SESIÓN PERSONAL

**TASK_ID:** `JOR-B15-S5-V2-PAT-STREAM-KERNEL-ONEBATCH-20261112`  
**QUIÉN DECIDE:** ChatGPT, director técnico y única autoridad de aceptación técnica.  
**QUIÉN EJECUTA:** Codex Luna, exclusivamente cambios locales, pruebas atribuibles y empaquetado.  
**RAÍZ:** `D:\codex\Jornato` y únicamente reportes/temporales propios dentro de `D:\codex\_REPORTES\Jornato`.  
**SALIDA EXACTA Y ÚNICA:** `D:\codex\_REPORTES\Jornato\JOR-B15-S5-V2-PAT-STREAM-KERNEL-20261112\JOR-B15-S5-V2-PAT-STREAM-KERNEL-20261112-UNICO.zip`  
**ESTADO ANTERIOR:** B15-S4 Flutter personal host funcional, 14 tests PASS **reportados**; backend HTTP real/Android no ejecutados.  
**NEXT AL ENTREGAR ZIP:** `CHATGPT_DIRECTOR_AUDIT_S5_THEN_B16`, no S6 automático.  
**AUTORIZACIONES:** ningún stage, commit, push, merge, deploy, publicación, modificación de producción, cambios en otro proyecto, escritura de código GitHub, borrado de WIP ni credenciales reales.

## 0. Orden ejecutiva — terminar, no diagnosticar indefinidamente

En **una sola intervención**, corregir cuatro fallas vinculadas al **mismo propietario de sesión**, reforzar el límite de respuesta HTTP durante el streaming, ejecutar QA host/Flutter focal y comprobar Laravel HTTP-kernel **solo si** hay un entorno QA aislado ya disponible. Conservar la app personal y el kiosco existentes. Después empaquetar UN ZIP y STOP.

**Las cuatro fallas del mismo ciclo de vida de PAT:**
1. `dispose()`/Back limpia UI pero no solicita revocación remota del PAT actual.
2. Una respuesta de `login()` llega tras logout/otro login/dispose: se descarta su PAT sin revocarlo.
3. Si un PAT ya existe y luego falla `identity()`/`companies()` antes de establecer sesión, o se inicia otro login, el PAT anterior puede perderse al limpiar el estado sin intento de revocación.
4. El resultado de `logout` host no demuestra revocación **servidor**; los estados de UI e informes deben distinguir `LOCAL_CLOSED`, `REMOTE_ATTEMPTED`, `REMOTE_UNCONFIRMED` y `REMOTE_CONFIRMED_ONLY_WITH_BACKEND_EVIDENCE`.

**Defecto HTTP único:** `_IoPersonalHttpTransport.send()` usa `utf8.decoder.bind(response).join()` y verifica 1 MiB **después** de acumular una respuesta sin longitud. Limitar bytes antes de acumular; detener/cancelar stream excedido. No introducir capa nueva o dependencia externa.

**Definición honesta de salida del lote:** si QA host pasa y Laravel aislado no está disponible, `S5=PASS_HOST_SCOPED_WITH_SERVER_GATE`, no `S5_GLOBAL_PASS`. Si cualquier defecto no queda corregido y probado, `S5=PARTIAL` con prueba/log exactos, sin esconderlo ni abrir un sublote ritual. La siguiente gran labor independiente es **B16 portal web**, no repetir S5 por costumbre. Los defectos de seguridad críticos reproducibles no se aplazan sin informar al director.

## 1. Autoridad y protección del trabajo existente

- **Leer una vez** el `AGENTS.md` local, ADR pertinentes y el checkpoint remoto del PR #2 `docs/JORNATO_CONTINUIDAD.md` en rama `docs/pingponglaw-l1-l6-canon-84e961c`; contrastar diferencias, **no copiar sobre WIP**. Leer el canon L1–L6 del repo `sierraglobalcompany-rgb/PingPongLaw`, commit `84e961cadf482d234f4c0ee2ca60e8c7e9b388e8`, archivo `docs/engineering/LEYES_IMPLEMENTACION_1_A_6.md`. Si remoto no está disponible, usar fuente local verificable o `CANON_READ=BLOCKED`, sin inventar descarga.
- L1=KISS/Ponytail; L2=antirruido y evitar duplicados; L3=causa raíz con regresión; L4=UX y contratos aprobados sin rediseño; L5=prueba con fuente, comando, salida e **independencia no fingida**; L6=un trabajo útil por transferencia. Son seis leyes, no cinco. Si necesitas 10 revisiones propias, NO reejecutar diez veces tests.
- Estado antes de tocar: rama, HEAD, git status `--porcelain=v1 -uall` (incluye untracked), staged, hashes SHA256 de **cada ruta que se modificará**; registrar archivos ausentes. No asumir que HEAD contiene fuentes S4: la mayoría son untracked. No ejecutar `git reset`, `clean`, `restore`, `checkout`, rebase, stashing automático, movimientos/borrados ni copies sobre WIP. No restaurar `AGENTS.md` desde GitHub ni tocar proyectos externos.
- **No usar `C:` para scripts, paquetes de evidencia, tests o temporales creados por esta tarea.** Crear staging/temp/cache bajo D: y redirigir `TEMP`, `TMP`, `TMPDIR`, `PUB_CACHE` y otros caches propios si hacen falta; no prometer ausencia absoluta de escrituras del sistema operativo. No borrar el script histórico situado en C: ni el `.salive` de Kotlin. No usar/alterar contenedores, redes ni volúmenes Docker ajenos: anomalía previa de Liquidapro SIN AUTORÍA DETERMINADA.
- Prohibido cambiar server auth, middleware `device.active`, Sanctum, scopes, control tenant, DB real, B14 writer/outbox/ledger, Flutter PIN/kiosco o navegación aprobada **salvo bug focal reproducido que afecte este lote**, y entonces documentar al director. No incluir credenciales, bearer, secretos, PII reales, `.env` o tokens en zip.
- `PUERTA_A_BACKUP=WAIVED_BY_OWNER_FOR_DEVELOPMENT`, `OFF_DEVICE_BACKUP=NOT_DONE`; registrar límite, no abrir discusión ni bloquear este lote. `B13_GLOBAL=PARTIAL`, `B14_FINAL=NOT_APPROVED`, `B15_GLOBAL=PARTIAL`, `LINK_ADMIN_RUNTIME=BLOCKED_PERMISSION_CONTRACT`, `L5_INDEPENDENT_RUNTIME=NOT_RUN`, `RELEASE_APPROVED=NO`.

## 2. Archivos propietarios conocidos: leer, luego modificar SOLO si pertinente

Fuentes B15-S4 disponibles en la entrega anterior `JOR-B15-S4-V2-MACROBLOQUE-PERSONAL-20261110-UNICO.zip`, SHA256 `8dc99032acab53291b711f0ef3b371853701a1e809046952adb5d8ff9b3be292`:

| Archivo | Propósito | Evidencia concreta de partida |
|---|---|---|
| `lib/src/personal/personal_session.dart` | `PersonalSessionController`, epoch, token, fases y logout | `login` líneas 66–113 descarta PAT tardío; `logout` 141–159; `dispose` 258–263 limpia memoria; `_applyFailure` 186–235 puede dejar/descartar PAT pre-sesión. |
| `lib/src/ui/personal_screen.dart` | `PersonalScreen` y navegación | `dispose` 30–36 llama al dispose de sesión; logout explícito 47–52; UI tiene widgets y errores existentes. |
| `lib/src/personal/personal_api.dart` | `PersonalHttpApi`, `PersonalApi.logout`, `HttpClient` | Contrato logout POST `/api/v1/auth/logout`; `_IoPersonalHttpTransport` líneas 198–232 comprueba el cuerpo tarde tras `join()`. |
| `test/personal_session_test.dart` | pruebas host con fakes | casos A/B, login tardío, widget 14 tests de S4; fake `_FakePersonalApi.logout` registra `logout:$token`. |
| `test/widget_test.dart` | regresiones UI | no destruir ni reescribir tests anteriores. |
| `server/routes/api.php` y `AuthController` | **solo inspección** de rutas/middleware/login/logout | `auth:sanctum`, `account.active`, `device.active`, `token.ability`, `tenant.company`; la revisión S4 de `device.active` fue estática. |

Los números de línea anteriores son **del ZIP histórico**, pueden desplazarse en D:. Confirmar la fuente local antes de intervenir. No cambiar el nombre/contrato público de `PersonalApi` si basta el controlador y una función interna pequeña. No añadir gestor global, `Provider` nuevo, refresh token, segunda DB de sesión ni caches persistentes.

## 3. Secuencia del macrobloque — ejecutar en este orden sin negociar otra ronda

### E0. Identificación única y reproducción causal focal

1. Establecer los hashes de 4–6 archivos afectados, ruta, branch/HEAD, estado pre y fuente real en D:. Comprobar una sola vez si el código local refleja S4 o ya tiene alguna corrección; **si ya está corregido, no volver a aplicarla**.
2. Escribir tests focales deterministas antes del cambio: `dispose` con PAT, login tardío, error después de emitir PAT, reemplazo por B, respuesta sin longitud mayor a 1 MiB. Ejecutar una única tanda RED **solo de esos tests** y conservar salida/código; si no se puede ejecutar, `RED_NOT_RUN` y NO inventar que fallaron.
3. Corregir en fuente real y ejecutar GREEN focal + regresiones vecinas mínimas. Si hay un fallo real, una corrección causal y una sola repetición afectada; no reactivar diez suites previas ni repetir B13/B14/C04.

### E1. Única autoridad de sesión y tokens — comportamiento obligatorio

**Invariantes:**
- Token=secreto que pertenece a **una solicitud de login concreta**, nunca a una pantalla general ni al siguiente usuario. A→logout→B y A→login B deben dejar a B intacto. Capturar el token viejo por valor, no leer `_token` cuando complete una operación asíncrona de A.
- **Limpieza local sin esperar red**: token, identidad, lista de empresas, empresa activa, asistencias y notices obsoletos se anulan sin retrasar navegación ni mostrar A bajo B. Incrementar epoch/invalidez antes de la limpieza; UI no notifica tras `dispose`.
- **Revocación remota best effort**: iniciar una sola llamada a `_api.logout(capturedPat)` por PAT descartado cuando sea viable, usando la API actual. Fallo/timeout no restaura local. No crear un worker de fondo/cola/retry persistente ni bloquear atrás. Testear deduplicación de una carrera solo si reproducida.
- **Logout explícito**: cerrar local de inmediato; invocar logout del PAT capturado; si servidor no confirma, mensaje sanitizado de estado remoto incierto. No afirmar revocación solo porque fake completó. Verificar semántica `204` real según `AuthController`; 2xx arbitrario o respuesta JSON inesperada no debe ascender a `REMOTE_CONFIRMED` por accidente.
- **Back / dispose / cierre ruta**: el propietario de sesión captura su PAT, invalida epoch y ejecuta best-effort antes/después de `dispose` sin accesar `ChangeNotifier` ya destruido. `dispose` es sincrónico: **no bloquear `dispose` esperando HTTP**; observar errores asíncronos para que no se propaguen sin manejo. El proceso Android matado/offline puede impedir la revocación; no prometer revocación garantizada en ese caso.
- **Login tardío**: si `_api.login()` entrega el PAT cuando epoch ya caducó o session disposed, **revocar exclusivamente ese PAT recién devuelto**. No invocar logout sobre B. Si la respuesta nunca entrega el PAT (timeout/corte), NO es posible revocar un token desconocido: marcar incertidumbre, no fabricar caso PASS.
- **Error tras login parcial**: si `identity()` o `companies()` falla antes de establecer una cuenta visible, el flujo actual deja `_token` guardado en algunos errores, pero la UI permite nuevo login. **La solución preferida:** limpiar esa sesión parcial e intentar revocar su PAT; conservar el notice de error. Para `401` token posiblemente inválido, no atribuir revocación confirmada; para `403` no eliminar cuenta B de una petición obsoleta. Un `403` **solo de asistencia** conserva la cuenta y limpia el recurso, como antes; NO convertirlo en logout global.
- **Re-login mientras existe PAT**: nunca llamar `_clearSession()` destruyendo la referencia del PAT viejo sin iniciarle cleanup; si no existe token, no realizar logout inventado. La limpieza de A no cambia selectedCompany/reportes/notice de B.
- **No persistencia**: PAT solo memoria en S5. No escribirlo en SharedPreferences, KeyStore no verificado, SQLCipher de kiosco, logs, informes o ZIP.
- **No falsos claims**: host fake puede acreditar **invocación** de logout y limpieza local, pero no revocación remota. `REMOTE_CONFIRMED` únicamente con ejecución HTTP-kernel/servidor 204 + evidencia posterior que el PAT quedó inutilizable, o equivalente contrato real demostrado. Si no se ejecutó, `REMOTE_REVOCATION_SERVER=NOT_RUN`, no PASS.

**Preferencia de implementación:** conservar `PersonalSessionController` y `PersonalApi`; reutilizar contador `_epoch` y token capturado, introducir como máximo **un helper privado de revocación best-effort** para evitar repetir `try/catch` en tres rutas. `unawaited` explícito de `dart:async` o patrón equivalente; errores capturados dentro del helper, nunca registrar token ni hacer `notifyListeners` tras `dispose`. Si interfaz de `PersonalApi.logout` requiere pequeño ajuste para distinguir confirmación HTTP, justificar con contrato real; no romper otras rutas. Evitar fugas de timers/subscriptions.

### E2. Transporte HTTP — límite **antes** de crecer la memoria

- Conservar `dart:io HttpClient`, HTTPS obligatorio, origen sin userInfo/query/path, redirects deshabilitados, bearer solo header, timeouts y `PersonalApi` existentes. No agregar dependencia HTTP.
- En `_IoPersonalHttpTransport`, efectuar byte-count incremental **antes** de agregar chunks a la memoria. Tamaño máximo `1024*1024` **inclusive**, exceder un solo byte ya provoca error controlado. Si `contentLength >limit`, terminar sin `drain()` de cuerpo enorme; si `contentLength=-1`/chunked, limitar por streaming. La unidad de conteo son **bytes recibidos**, no longitud de caracteres ni tamaño de `String`.
- Aceptar UTF-8 dividido entre varios chunks; decodificar una vez al final dentro del límite, de forma segura. Si UTF-8 inválido, reportar `invalidResponse`, sin revelar cuerpo remoto. Cancelar suscripción de forma determinista en exceso/timeout; evitar doble descarga y liberar request/response según API Dart existente.
- **No vale** un test que usa solo `_FakeHttpTransport` devolviendo un `PersonalHttpResponse` completo: eso nunca recorre `_IoPersonalHttpTransport` ni detecta `.join()`. Probar un helper puro pequeño de lectura por stream (preferido) **o** el transporte concreto con fixture TLS aislada/autorizada; el helper puede exponerse de modo mínimo a tests sin crear módulo framework ni cambiar API productiva. Usar stream generador/contador: comprobar que al exceder por 1 byte se corta lectura temprana, no se consume una secuencia gigante.
- Casos límite obligatorios: 0 bytes, 1 MiB exacto, 1 MiB+1, longitud ausente, carácter multibyte cortado entre chunks, UTF-8 malformado, stream error/timeout. Evitar logs de respuesta completa. No clasificar un helper Dart como prueba TLS real.
- Para respuestas HTTP no-2xx, conservar mapeo por código; **no consumir indefinidamente** un body grande por `drain()` si puedes terminar/abortar sin romper la operación. Un error 302 no debe seguir redirect ni reenviar bearer.

### E3. Laravel HTTP-kernel — gate independiente, sin intervenir otros proyectos

**Chequeo de infraestructura UNA SOLA VEZ, de lectura:** `php`, `composer`/vendor instalado, `.env.testing` aislado si existe, conexión de MariaDB QA expresamente identificada y sin compartir otros proyectos. Anotar si cumple; no adivinar credenciales ni migrar bases reales. No arrancar Docker compartido ni matar servicios. Si no hay entorno QA aislado, `KERNEL_QA=NOT_RUN_ENV`, continuar de inmediato E4 y empaquetar: **no gastar turnos en reintentos ciegos**.

**Si sí existe sin efectos colaterales, ejecutar un SOLO paquete focal** sobre rutas protegidas con fixtures sintéticos: login verificado→PAT con habilidades existentes→`/me`→empresas→`/companies/{company}/me/attendance`→logout 204→PAT rechazado 401 (o respuesta contractual denegada); negativas cuenta no verificada, cuenta revocada, ability insuficiente, membership A vs empresa B y dispositivo si el middleware lo exige. Verificar que login/lectura/logout no crean marcaciones, no habilitan enrolamiento y que reportes solo aparecen con `testing AND QA flag`. No modificar middleware/auth/routes para que pase; si el `device.active` bloquea una operación legítimamente, `DEVICE_CREDENTIAL_GATE=BLOCKED_CONTRACT`, no bypass.

Una PHPUnit Feature/HTTP-kernel con MariaDB sintética **no es** una llamada real por TLS desde el Flutter de usuario, ni una prueba de Android. Estados separados: `KERNEL_QA`, `REAL_HTTP_TLS`, `ANDROID_NATIVE`. **No activar un servidor externo o puerto público** para obtener una captura. Solo si existe un origen HTTPS QA **preautorizado** con credenciales ficticias y aislamiento verificable, una sola prueba HTTP TLS; de lo contrario `REAL_HTTP_TLS=NOT_RUN_ENV`. No confundir la prueba con un fake `PersonalHttpTransport` host.

### E4. QA host Flutter — matriz de oráculos, una sola tanda RED→GREEN y vecinas

Reutilizar `test/personal_session_test.dart` y `test/widget_test.dart`; crear únicamente un archivo de test focal de streaming si no cabe en los existentes. Fakes con `Completer` y orden determinista, no `Future.delayed` arbitrario. Registrar el comando exacto, SHA fuentes y código de salida.

| ID | Oráculo | Exigencia de resultado |
|---|---|---|
| L01 | Logout explícito con token A | Estado local vacío **antes** de completar fake remoto; remote solo ATTEMPTED_HOST. |
| L02 | Logout remoto falla/offline | A no reaparece, B futuro independiente; remote UNCONFIRMED. |
| L03 | Back/dispose con PAT | Capturar PAT y llamar cleanup sin notificar tras dispose; test widget `Navigator.pop` si aplica. |
| L04 | Dispose durante login pendiente | Llega PAT A tarde, se intenta logout de **A** aunque controller ya esté disposed. |
| L05 | Login A tardío tras iniciar B | Solo logout token A, B sigue lista. |
| L06 | A→logout→B con attendance/401 tardíos | Ningún dato, notice, token o loading de A aparece en B. |
| L07 | Identity falla después de PAT emitido | Revocar PAT y limpiar sesión parcial; notice adecuado. |
| L08 | Companies falla después de PAT emitido | Revocar PAT y permitir reintento seguro, sin PAT huérfano. |
| L09 | Segundo login reemplaza sesión con PAT | PAT previo capturado/revocado sin modificar el PAT nuevo; no duplicar logout por carrera. |
| L10 | 403 SOLO en attendance | Mantener cuenta autenticada, ocultar recurso sin logout forzado. |
| L11 | 401 vigente vs 401 A tardío | Vigente limpia; antiguo no afecta a B. Revocación sólo con atribución de token correcta. |
| L12 | Logout real 204 frente a 200/202 JSON inesperado | Respetar el contrato real; fake solo demuestra llamada; reporte no acredita confirmación remota. |
| H01 | Stream bytes vacíos/dentro límite | Decodificación y JSON controlados sin exceso. |
| H02 | Stream sin Content-Length = 1 MiB exacto | Aceptado (si UTF-8 válido). |
| H03 | Stream = 1 MiB+1 | Rechazar **antes** de almacenar/completar lectura, cancelar upstream. |
| H04 | UTF-8 multibyte dividido en chunks | Texto íntegro; longitud contabilizada en bytes. |
| H05 | UTF-8 malformado, stream error/timeout | Error controlado sin cuerpo ni bearer en logs. |
| H06 | Redirección/HTTPS/bearer/URL | Sin follow redirect, sin token en URL, origen HTTPS obligatorio. |
| U01 | Widget sesión personal y kiosco | Sin mezcla de PIN y cuenta, logout accesible, reportes «NO VERIFICADO». |
| U02 | UX A→B y Back físico simulado | Volver a portada sin nombre/cuenta de A, incluso con respuestas tardías. |
| R01 | Regresiones vecinas S4 | Los 14 host/widget previos o subset con motivo; no repetir B13/B14. |
| R02 | Flutter analyze/format | Exit 0; Android nativo NOT_RUN salvo ejecución real. |
| K01 | Laravel kernel (condicional) | Sanctum/device/abilities/tenant/logout probados con MariaDB QA, evidencia 204→401. |
| K02 | Real HTTP TLS (condicional) | Solo origen YA autorizado + fixtures; de otro modo NOT_RUN_ENV. |
| P01 | Custodia | WIP/tracked/untracked intactos fuera del alcance; 0 staged; SHAs finales. |
| P02 | Entrega | Un ZIP íntegro con MANIFEST, CRC, logs, fuentes, patch y juicio de límites. |

**Gates de aceptación:** 
- `HOST_SESSION_CLEANUP=PASS_HOST_SCOPED` solo si L01–L11 esenciales pasan realmente.
- `HTTP_STREAM_BOUNDED=PASS_HOST_SCOPED` solo si H01–H05 prueban **el lector de bytes real**, no solo transporte fake completo.
- `SERVER_REVOCATION=CONFIRMED_KERNEL` solo si K01 demuestra estado luego de revocar; si no, `NOT_RUN_ENV/UNCONFIRMED`.
- `B15_S5=PASS_HOST_SCOPED` no implica producto completo. No contabilizar un test escrito como PASS.

### E5. Cierre, empaquetado y NEXT — no autoampliar a otra tarea

1. Registrar cambios mínimos por archivo, razón y test nuevo; revertir **solo el cambio propio fallido** si lo puedes identificar con SHA, nunca resetear WIP ajeno. No generar otro subsistema de auth ni todo un portal en este lote.
2. Ejecutar `flutter analyze`, `dart format --output=none --set-exit-if-changed` sobre rutas afectadas y tests focales; build Android NO es gate de este lote. Si se bloquea por herramienta/espacio, `NOT_RUN_ENV` con log y sigue sin falsos PASS.
3. Validar contra las fuentes finales: `git diff --check`, SHA por archivo, código de salida; comprobar que **las rutas untracked están todas en SOURCES y manifest**. `git diff` no incluye fuentes untracked: incluirlas por copia íntegra y patch de creación con `/dev/null`, separado de tracked.
4. Registrar que Docker compartido, Liquidapro, C:, `.salive`, despliegue, `main` y PR #2 no fueron modificados por el lote. No borrar staging si está prohibido; la carpeta **delivery** contiene solo el ZIP.
5. Preparar el único ZIP bajo D: con manifiesto SHA256+tamaños que incluya todos los archivos menos el propio manifiesto, CRC comprobado y prueba de extracción. Si no hay prueba real, no declarar PASS. Comprobar paths contra traversal, secretos, datos reales, archivos repetidos y SHA del ZIP.
6. Cerrar tarea: `NEXT_OWNER=CHATGPT`. ChatGPT revisará ZIP y dirigirá **B16-S1** como siguiente vertical independiente; persistirán los gates comerciales/laborales/Android para aceptación integral. No crear un `B15-S6` automáticamente.

## 4. Diez revisiones del ejecutor (NO L5 independiente)

Codex completa **una** tabla 10×6 de L1–L6 con evidencia real por fila: 1) autoridad/canon; 2) preservación WIP; 3) PAT al logout; 4) PAT al Back; 5) login tardío; 6) auth parcial/re-login; 7) streaming y UTF-8; 8) Laravel / device / scopes; 9) regresión UX + secretos + archivos; 10) avance B16 sin pingpong. **Autoevaluación del implementador = revisión interna, no auditoría externa.** Prohibido repetir pruebas en cada pasada.

## 5. Único ZIP de entrega, verificable por el director

**Ruta y nombre exacto:** `D:\codex\_REPORTES\Jornato\JOR-B15-S5-V2-PAT-STREAM-KERNEL-20261112\JOR-B15-S5-V2-PAT-STREAM-KERNEL-20261112-UNICO.zip`

**Estructura solicitada:**

- `FINAL_REPORT.md`: task/status, hallazgos corregidos, línea de evidencia, limitaciones y NEXT.
- `CONTRACT_MATRIX.md`: API real `/auth/login`, `/auth/logout` 204, middleware `device.active`, abilities, respuesta `401` tras revocar; no tokens.
- `SOURCE_CHANGE_MATRIX.csv`: path, tracked/untracked, hash previo si original, hash final, razón, test.
- `SOURCES/`: todos los archivos modificados/nuevos completos con ruta relativa; sin contraseñas ni datos reales.
- `BASELINES/`: copia exacta de **fuentes actuales al inicio de S5**, siempre que se haya podido capturar; sha previo. Si no hay fuente original no fabricar baseline reconstruido como exacto.
- `PATCH_CANDIDATE.diff`: parche con tracked y untracked, aplicable sobre baseline S5 en copia **solo D:**, validación SHA de reconstrucción; registrar normalización LF/CRLF separadamente.
- `TEST_MATRIX.csv`: oráculos L01–P02, `PASS_HOST/PASS_KERNEL/PASS_TLS/FAIL/NOT_RUN`, comando, exit, log, SHA de fuente final y advertencia si fake.
- `EVIDENCE/`: logs focales RED/GREEN, flutters format/analyze, PHP kernel condicional, `git status` antes/después, baseline/hash, validación CRC/manifest, incidentes/capacidad; sanitizados.
- `TEN_PASSES_L1_L6.md`: 10×6 de Codex, con observación y límite por ley, sin llamar L5 independiente.
- `MANIFEST_SHA256.txt`: bytes+SHA de **cada miembro** excepto MANIFEST; comprobar 1:1, sin nombres duplicados, rutas absolutas, traversal o salidas de D:.

**Formato obligatorio del informe final:** `TASK_ID`, `S5_RESULT`, `SESSION_CLEANUP_HOST`, `LATE_PAT_HOST`, `PARTIAL_SESSION_CLEANUP_HOST`, `HTTP_STREAM_BOUND_HOST`, `FLUTTER_HOST`, `HTTP_KERNEL`, `HTTP_TLS_REAL`, `ANDROID_NATIVE`, `SERVER_REVOCATION`, `L5_INDEPENDENT_RUNTIME`, `B13_GLOBAL`, `B14_FINAL`, `B15_GLOBAL`, `RELEASE_APPROVED`, `WIP_PRESERVED`, `GITHUB_WRITES=NO`, `ZIP_BYTES`, `ZIP_SHA256`, `NEXT_OWNER=CHATGPT`. No valor PASS sin ejecución efectiva.

## 6. Plan de finalización — siguiente vertical definido, sin trabajo especulativo

- **B16-S1 inmediatamente después de auditoría mínima de este ZIP:** portal responsive Pro para administrador autorizado, comenzar con **login/empresa activa/portada Hoy/sedes** desde API Laravel existente y control tenant; si faltan endpoints, implementar solo los mínimos seguros, con 401/403/cross-tenant probados y estados loading/vacío/error. No construir servicios paralelos, no diseñar pagos sin autorización. La UI depende de contratos y mockups aprobados: no asumir que una pantalla host es UX humana aprobada.
- **B16 resto:** turnos, multi-sede, reportes y derechos de plan; billing solo con contrato comercial y proveedor autorizado.
- **B17:** permisos, citas médicas, vacaciones, incapacidades; la justificación NO convierte horas observadas en horas marcadas.
- **B18:** reglas de jornada colombiana versionadas, recargos y exportaciones informativos; revisión jurídica/experticia y pruebas frontera antes de liquidar.
- **B19:** expedientes, contratos, documentos privados y firma autorizada; acceso propio y consentimientos.
- **B20:** reclutamiento y candidatos con seguridad de adjuntos y privacidad.
- **B21:** QA independiente de funcionalidad completa, Android/AVD/dispositivos, TLS real, B13-S4-07/10, B14-C07 si exigible, permisos laborales, textos legales, SMTP y revisión seguridad.
- **B22:** preparación comercial/distribución; producción **solo** con escrito `GO` de propietario; no publicar por inercia.

**No fabricar un cronograma exacto ni un porcentaje de producto:** el WIP avanzado no está publicado en GitHub y hay gates externos. Esta orden no modifica contratos ni autorizaciones.

**FIN DE LA ÚNICA ORDEN. SIGUE CODEX LUNA: EJECUTAR B15-S5 V2 EN D:, ENTREGAR UN ZIP, SIN COMMIT NI PUBLICACIÓN.**