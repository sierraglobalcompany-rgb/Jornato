# CODEX LUNA — JORNATO · H9-M1/F1 V2 · MACROBLOQUE ÚNICO DE CIERRE VISUAL Y GATE NATIVO

**ORDEN ACTIVA Y ÚNICA · 19 de noviembre de 2026.** Reemplaza íntegramente la versión F1 previa `CODEX_JORNATO_H9M1_F1_CIERRE_FOCAL_POST_ZIP_20261119.md`. Conserva la tarea `JOR-H9-M1-F1-VISUAL-NATIVE-SCOPE-20261119`: **NO ejecutar otra vez H9-M1**, **NO crear F2 ni nuevas arquitecturas**. Esta orden fue revisada en **10 pasadas adversariales como verdugo y 10 de contraste como juez** sobre el texto F1 (no sobre el producto). Esa auditoría está cerrada y no se delega a Codex.

**ROL:** ChatGPT dirige y verifica la aceptación; **Codex Luna ejecuta código y pruebas locales de principio a fin**, sin trasladar tareas al propietario. Si falta una herramienta, entorno o autorización, resuelve lo independiente y deja el subgate `NOT_RUN/BLOCKED` con motivo verificable. **No consultar al director entre pasos mecánicos ni abrir otra auditoría.**

```text
TASK=JOR-H9-M1-F1-VISUAL-NATIVE-SCOPE-20261119
OWNER_NOW=CODEX_LUNA
OWNER_AFTER_ZIP=CHATGPT_DIRECTOR
WIP_ROOT=D:\codex\Jornato
OUTPUT_ROOT=D:\codex\_REPORTES\Jornato\JOR-H9-M1-F1-VISUAL-NATIVE-20261119
GITHUB_ACTIONS=UNAVAILABLE
REMOTE_CHANGES=FORBIDDEN
H9_GLOBAL=NO_GO
B22=NOT_AUTHORIZED
RELEASE=NO_GO
```

## 0. Decisión técnica ya tomada: KISS, tres subgates en prioridad estricta

**C1 (obligatorio):** corregir o explicar con evidencia el único FAIL de test visual. **C2 (condicional):** verificar SQLCipher/Keystore Android *solo* en emulador **propio, vacío, aislado y permitido**, reutilizando adaptadores/instrumentación actuales; si no hay emulador, cerrar como `NOT_RUN`, no abrir un proyecto de infraestructura. **C3 (opcional y bloqueado por contrato):** una prueba HTTP/DB Pro sintética *solo* si backend y credenciales QA autorizadas **ya existen**; de lo contrario `BLOCKED_CONTRACT`. Finalmente un ZIP único. Ninguno de esos gates autoriza instalar en el móvil físico conectado.

**No reconstruir la app desde PR #3 ni crear otro servicio de sincronización, repositorio de datos, proveedor de cifrado, backend, endpoint, esquema, rol, autenticación o política de RR. HH.** No rediseñar UX, no añadir dependencias por comodidad. Mantener las decisiones OD01–OD08 sin aprobación como bloqueadas donde correspondan. Las leyes L1–L6 se consultan mediante reglas locales ya incorporadas; no cargar skills ni repetir una auditoría de las leyes.

## 1. Evidencia heredada: usarla como línea base, no reejecutarla

**ZIP H9-M1 recibido:** `JOR-H9-M1-REACTIVADO-20261119-UNICO.zip`; SHA-256 `571F0B288F8B582797AF4043417A2A1B44935B60D649F592172751F402D9A0B6`; 16 entradas, CRC correcto, manifiesto 15/15 válido. Incluye **logs y metadatos, no el WIP completo ni los bytes del APK**. Los PASS siguientes son resultados **reportados por Codex y sustentados por sus logs**, no una recertificación independiente de ChatGPT:

| Gate | Evidencia reutilizable / límite |
|---|---|
| `flutter analyze --no-pub` | PASS después de corregir un paréntesis en `lib/src/personal/personal_models.dart`. No reaplicar ese parche. |
| Host Flutter | **75/75 PASS** en 5 archivos: dominio, repositorio, outbox/receipt, backup y sesión. **No repetir** salvo pruebas de consumidores directamente afectados por nuevo delta. |
| Bootstrap Laravel normal | Render de `portal.error` PASS sin overlay S3 ni DB. No repetir. |
| B21F-S3 backend | **158 tests / 2.450 assertions PASS_SCOPED histórico**. No repetir. |
| APK `productDebug` | Compilación debug reportada; `minSdk=24`, SHA-256 `59522127E0E2D10E3F484950AAD656F4A188B52F6575E7C96574913FB5233C3D`. **No instalado, APK ausente del ZIP, firma debug no release.** No afirmar instalación ni repetir build si no cambias código/plataforma. |
| Visual Flutter | **FAIL demostrado en log**: test `personal session exposes request submission and its server folio`, `test/widget_test.dart` 153–155. `tap` a `ExpansionTile` centro `(400,647)` fuera de viewport `800×600`; luego `Folio ...` no encontrado, exit 1. No presupone fallo de servidor. |
| Android SQLCipher/Keystore | `NOT_RUN`, los 75 tests usan SQLite host y no acreditan cifrado nativo/reinicio. |
| Pro HTTP/DB | `BLOCKED_CONTRACT` sin backend QA y credencial sintética autorizada. |
| GitHub remoto | `main=1ee6aae821f8cf177cc64149081ad8847f7fec2e`, PR #3 F0 Draft SHA `104469b119752f395cf9881e732d582feab9db4e`, **119 tests Flutter escritos/NOT_RUN y 31 checks Dart escritos/NOT_RUN** en esa rama, **no es el WIP avanzado**. |

**WIP reportado anteriormente, NO precondición de igualdad:** rama `codex/jor-b08-h4-domain-20261025`, HEAD `faf5fe283191f8b5a2724b397009512a2caec1b6`, 235 entradas de Git, 0 staged, índice íntegro. Archivo `lib/src/personal/personal_models.dart` untracked con paréntesis ya incorporado, SHA-256 POST `41CA02182E39D6EC17A3050E49EA48BEDB6FAA02C04331BE70CA1A09DC40F63E`. `test/widget_test.dart` untracked SHA-256 `B3A1990B7D56BAC9484BA510DF308C937FD3B554452428C83D03DD49F99E2671` al último cierre. Si la fuente vigente difiere por trabajo nuevo legítimo, **no restaurar ni sustituir**: adaptar a su contrato y registrar diferencias concretas.

## 2. Custodia inicial de 3 minutos, sin redescubrir el proyecto

1. Trabaja únicamente en el WIP `D:\codex\Jornato`; salida **fuera del árbol** en `D:\codex\_REPORTES\Jornato\...`. Si no existe esa ruta, no crear una aplicación alternativa. Comprobar `git rev-parse HEAD`, rama, `git status --porcelain=v1 -uall` y `git diff --cached --name-only` en modo **consulta**. Guardar PRE de los archivos que podrían editarse (`test/widget_test.dart`, eventual widget propietario, eventual test/adaptador nativo). Para archivos untracked tomar su **SHA-256 y copia de bytes temporal protegida fuera del árbol** antes de cambiar nada; el status de Git no revela cambios de contenido untracked.
2. No ejecutar `git add`, `commit`, `push`, `pull`, `merge`, `rebase`, `reset`, `clean`, `stash`, cambio de rama, hooks, migraciones destructivas, limpieza de contenedores, instaladores de SDK ni comandos que alteren otro proyecto. **Sí se permite editar en sitio únicamente los archivos objetivo con delta mínimo**, preservando todo el contenido previo. No editar históricos que ya pasaron, ni reconstruir F0. Si hay otro agente cambiando **el mismo archivo objetivo**, no sobreescribirlo: documentar colisión y continuar módulos independientes.
3. Leer **una vez** los contratos locales necesarios y el `AGENTS.md` aplicable. Localizar el test exacto, el widget propietario real, el adaptador de almacenamiento actual y las pruebas instrumentadas *solo cuando el paso lo requiera*. No adivinar un archivo o ruta como si estuviera garantizado. No abrir auditoría general de 235 archivos ni ejecutar todo el suite para «orientarse».

## 3. C1 — Solucionar el test visual REAL (PRIMER OBJETIVO INNEGOCIABLE)

**Causa sospechada, no aún probada como causa única:** `tester.tap()` usó un centro fuera del viewport. El log prueba que el tap no acertó y no apareció el folio, **no** que la creación/envío de la solicitud sea correcta ni incorrecta. La clave de la `ExpansionTile` mostrada en el log es un ID dinámico; **no hardcodearlo en tests**.

4. Leer los fragmentos **125–160 de `test/widget_test.dart`** y el widget que realmente crea esa `ExpansionTile` en el WIP. Localizar cómo el test obtiene la solicitud/folio y por qué finder identifica esa tarjeta. Registrar si se confirmó la solicitud en el **transport fake/test** empleado por el widget; no describirlo como una llamada HTTP real. Si ya hay un finder único por `ValueKey`, solicitud o ancestro y botón, reutilizarlo. **No crear claves globales ni nuevos providers para test.**
5. Reproducir **solo este test una vez** y capturar exit/log/fuentes: 

   ```powershell
   flutter test --no-pub --reporter expanded test/widget_test.dart --plain-name 'personal session exposes request submission and its server folio'
   ```

   Si ya pasa, **no editar** y conservar evidencia del SHA actual; el diagnóstico anterior seguirá histórico. Si la causa ahora es distinta, seguir el síntoma actual, no forzar un parche de scroll.
6. Si sigue fallando por offscreen y **el widget ya está construido**, aplicar una interacción de usuario mínima: `await tester.ensureVisible(finderUnico); await tester.pump();` y después `await tester.tap(finderUnico);` y el bombeo pertinente. Seleccionar el `finder` de la solicitud exacta, **no** `find.byType(ExpansionTile).first` salvo unicidad demostrada. Si el `ListView` es **lazy** y ese widget aún no está construido, usar `tester.scrollUntilVisible(finderUnico, delta, scrollable: find.byType(Scrollable) apropiado, maxScrolls: 8)` con scrollable y dirección reales; después verificar visibilidad/hit test del tap. Los nombres `finderUnico` y `delta` son marcadores para determinar según código local, **NO copiar como Dart completo sin definirlos**. Documentación Flutter: `ensureVisible` exige elemento construido; `scrollUntilVisible` puede buscar en lista perezosa. **No agrandar el viewport, no silenciar warning `warnIfMissed:false`, no cambiar el texto esperado, no `skip/xfail`**.
7. Comprobar la **secuencia real en el contexto del test**: solicitud creada/enviada al transporte fake, tarjeta expandida por el gesto, **mismo folio esperado** mostrado, sin borrar expectativa ni sustituir por un match laxo. Si el desplazamiento funciona pero el estado/folio no, corregir la causa en **un propietario real** (test o widget) con delta mínimo; añadir regresión nueva **solo** si cambia una regla/camino de producto previamente no cubierto. Si hay animaciones/timers, hacer bombeo **acotado** y verificar estado; no esperar indefinidamente con `pumpAndSettle` cuando haya timers periódicos.
8. Volver a ejecutar el **mismo test focal una vez después del delta**. Si cambia código de producto/test compartido, ejecutar **únicamente los tests vecinos pertinentes** y `flutter analyze --no-pub` una vez para ese delta; **NO** los 75 host otra vez salvo que realmente cambie alguno de sus productores/contratos, en cuyo caso ejecutar **solo los tests de impacto**, no la suite completa por reflejo. Registrar PRE/POST SHA-256 de cada fuente editada, comandos, exit code y log. Si el test sigue fallando, **`WIDGET_FLOW=FAIL`**, NO PASS por desaparición de advertencia.

**Gate de aceptación C1:** `PASS_FOCAL` = mismo test, mismo folio/contrato y exit 0 **en el SHA que se entrega**. `FAIL` = el test continúa fallando o faltan aserciones esenciales. `BLOCKED` = no hay SDK/permiso/entorno pertinente, con evidencia; no inventar PASS. Si el test fuente cambia otra vez, anotar su nuevo SHA; WIP untracked debe conservar sus otros bytes.

## 4. C2 — Android nativo SQLCipher/Keystore (SOLO SI EL ENTORNO AISLADO LO PERMITE)

**No usar el único teléfono físico listado por ADB:** `AUTHORIZED` indica conexión técnica, **no consentimiento** para instalar, desinstalar, borrar, desbloquear ni leer datos. Cualquier teléfono real se mantiene `PHYSICAL_ANDROID=NOT_RUN_UNAUTHORIZED` aunque esté conectado.

9. Consulta **una sola vez** `flutter --version`, `adb devices -l`, lista de AVD y el código actual de `lib/src/persistence/local_encrypted_store.dart` (o adaptador real si cambió), su proveedor de claves y tests instrumentados disponibles. **No instalar SDK, descargar dependencias, crear emuladores/repo, clonar WIP, reinstalar apps o alterar perfiles ajenos.** Usa un AVD **ya existente, propio, vacío/desechable y autorizado** solo si el usuario/entorno de Codex ya lo permite. Siempre seleccionar su `-d <emulator_id>` explícito; nunca `adb` sin selector ni caer por defecto en el teléfono físico. Si no existe entorno adecuado, saltar pruebas instrumentadas y marcar `NOT_RUN`, sin gastar el lote en infraestructura.
10. Si existe AVD aislado seguro, usa **módulo/build actuales del WIP** y datos sintéticos: apertura con proveedor de clave del **Android Keystore real** (no clave literal, mock ni host); verificar que el motor SQLite enlazado es **SQLCipher operativo** por `PRAGMA cipher_version` o API nativa equivalente **más** evidencia de cifrado/lectura consistente y comportamiento de clave incorrecta. **El valor `cipher_version` solo es indicio de librería, NO prueba suficiente de cifrado/Keystore efectivo.** Crear evento/outbox en almacenamiento propio, finalizar proceso y relanzar, leer la misma historia, no duplicar en reintento, bloquear clave equivocada, verificar aislamiento tenant/actor y fallo cerrado ante archivo corrupto. Nunca imprimir claves, payloads sensibles ni usar una BD real. Medir cada subgate por separado: `CIPHER_ENGINE`, `KEYSTORE_EFFECTIVE`, `RESTART_READBACK`, `IDEMPOTENCY`, `TENANT_ISOLATION`, `CORRUPTION_FAIL_CLOSED`.
11. Si falla alguna prueba nativa **efectivamente ejecutada**, corregir únicamente el adaptador/contrato autorizado y su test focal; volver a probar lo afectado. Si el fallo depende de OD, firma/dispositivo o autorización ausente, **no crear falsos permisos ni workarounds inseguros**; declarar el subgate `PARTIAL` o `BLOCKED_CONTRACT`. Si el AVD no está disponible, **no iniciar una implementación especulativa del cifrado sin runtime**. Reutilizar la evidencia host anterior sin presentarla como Android, y dejar `NATIVE_CIPHER=NOT_RUN`.

**Gate C2:** `PASS_EMULATOR_SCOPED` solo con AVD explícito, instalador/build identificado, ejecución nativa real y pruebas relevantes con exit 0. Un APK compilado sin instalar, un test host con SQLite FFI, o lectura de `PRAGMA cipher_version` sin circuito de Keystore **NO** son PASS Android. No afirmar reinicio tras *reinstalación* si solo se mató el proceso. Ningún subgate se convierte en GO global H9.

## 5. C3 — Pro HTTP/DB QA, únicamente si ya está autorizado y preparado

12. **No reejecutar** serialización `requestId`, outbox y receipt host ya respaldados por 75/75. No subsanar la historia de `requetId` por renombrado silencioso ni reinterpretar C04 B14 como PASS retroactivo. Revisar contrato técnico actual **solo si** existe un backend QA aislado y credencial sintética preautorizada. Entonces validar de forma focal un evento offline → outbox → envío HTTP real a QA → receipt y readback autorizado del mismo tenant/actor → **reenvío del mismo `requestId`** sin crear otro evento. Si se puede simular ACK perdido **sin alteración del servidor ajeno**, añadir la prueba focal. Conservar código/resultado HTTP sanitizado. Si falta cualquiera de esas condiciones: `PRO_HTTP_DB=BLOCKED_CONTRACT`, sin emitir peticiones ni crear cuentas, PAT, roles, tenant, red Docker ni migraciones nuevas.
13. Mantener el plan Gratis local intacto; Pro requiere entitlements/autorización técnica existentes. Nunca modificar permisos, OD01–OD08, datos personales, contrato de nómina ni billing por conseguir un flujo positivo.

## 6. Cierre E1 — una entrega auditable, no otra revisión general

14. En PRE y POST comprobar HEAD/rama/índice y estado Git; capturar **SHA-256 por archivo editado**, incluyendo untracked. `git status` igual no demuestra que el contenido de untracked sea igual. Generar un `CHANGES.patch`/delta **solo** del trabajo propio, con instrucción no destructiva de aplicación sobre PRE esperado; para archivo untracked, **diff real entre copia PRE y POST**, nunca `git diff` vacío fingiendo no haber cambiado nada. Si no hay cambio, declarar `CHANGED_FILES=NONE` y no inventar parche.
15. Crear una única carpeta de entrega y **un ZIP** `JOR-H9-M1-F1-VISUAL-NATIVE-20261119-UNICO.zip` con `FINAL_REPORT.md` (1–2 páginas), `RESULTS.csv`, `WIP_PRE_POST.csv`, logs del test PRE/POST y QA focal, `CHANGES.patch` si aplica, `BLOCKERS.md` solo si necesario y `MANIFEST_SHA256.csv`. El manifiesto incluye **bytes y SHA-256 por cada otro miembro, excluyendo a sí mismo**; verificar CRC, tamaños y hashes después de armar. `RESULTS.csv`: campos distintos `gate,status,scope,command,exit_code,source_sha256,log_path,log_sha256,artifact_path,artifact_sha256,reason`; cada `log_sha256` debe ser el hash del archivo realmente incluido en ZIP, no el hash del código o la captura. Usar `N/A` cuando no aplique; **nunca hashes ficticios ni rutas de archivos ausentes**. Colocar SHA del ZIP en informe externo o respuesta de Codex; si se guarda dentro del ZIP, evitar autorreferencia. **Revisar contra secretos y datos de personas antes de empaquetar**, no adjuntar DB, `.env`, claves, certificados, tokens, fotos, CV, perfiles, APK ni WIP completo. El informe puede citar el SHA del APK previo **como metadato histórico**, no como APK revalidado por F1.
16. El cierre atribuye resultados al **SHA exacto probado** y distingue: (A) comprobado en F1, (B) reutilizado de H9-M1/B21F-S3, (C) sin ejecutar, (D) bloqueado por contrato, (E) error persistente. **No pedir al usuario que ejecute pruebas**; solo devolver la ruta del ZIP y la tabla de estado. No iniciar fases nuevas, auditorías 10+10 ni un segundo agente. Si un subgate está bloqueado, se termina lo independiente y se entrega. No hacer stage/commit/push/merge/deploy.

## 7. Salida terminal EXACTA de Codex

```text
TASK=JOR-H9-M1-F1-VISUAL-NATIVE-SCOPE-20261119
RESULT=PASS_SCOPED|PARTIAL|BLOCKED
SOURCE_HEAD=<SHA observado, no alterarlo por rutina>
WIP_PRESERVED=YES|NO
CHANGED_FILES=<rutas exactas; solamente delta de F1, o NONE>
WIDGET_FLOW=PASS_FOCAL|FAIL|BLOCKED
FLUTTER_ANALYZE=PASS_CURRENT|REUSED_H9_M1|FAIL|NOT_RUN
HOST_75=REUSED_H9_M1_PASS_HOST_NOT_RERUN
BOOT_NORMAL=REUSED_H9_M1_PASS_HOST_NOT_RERUN
NATIVE_CIPHER=PASS_EMULATOR_SCOPED|PARTIAL|NOT_RUN|BLOCKED_CONTRACT
CIPHER_ENGINE=PASS|FAIL|NOT_RUN
KEYSTORE_EFFECTIVE=PASS|FAIL|NOT_RUN
RESTART_READBACK=PASS|FAIL|NOT_RUN
TENANT_ISOLATION=PASS|FAIL|NOT_RUN
PRO_HTTP_DB=PASS_HTTP_DB_QA|BLOCKED_CONTRACT|NOT_RUN
PHYSICAL_ANDROID=NOT_RUN_UNAUTHORIZED
H9_GLOBAL=NO_GO
RELEASE=NO_GO
ZIP_PATH=<ruta del ZIP ÚNICO creada y comprobada>
ZIP_SHA256=<hash real del ZIP>
NEXT_OWNER=CHATGPT_DIRECTOR
```

**Semántica de `RESULT`:** `PASS_SCOPED` solamente si C1 pasa, no queda ningún FAIL nuevo dentro del subalcance realmente ejecutado y lo no ejecutado queda **explícito** como NOT_RUN/BLOCKED. No significa GO de H9 ni que SQLCipher/Pro hayan sido verificados. `PARTIAL` si C1 sigue FAIL o hay una prueba nativa ejecutada incompleta. `BLOCKED` si ni siquiera C1 pudo ejecutarse. El hallazgo de una vulnerabilidad nativa real no se oculta detrás de un `PASS_SCOPED` visual. Ninguna entrega H9-M1/F1 puede declarar lanzamiento aprobado.

## 8. Lista de control final de 60 segundos (NO auditoría adicional)

- ¿C1 fue ejecutado por el finder del mismo caso y preservó el folio esperado? ¿El tap alcanzó un widget visible sin silenciar warning?
- ¿Se preservaron las 235 rutas históricas y todos los archivos ajenos sin depender únicamente del conteo? ¿Los untracked editados tienen PRE/POST hashes?
- ¿C2 solo usó un AVD permitido? ¿Se reportaron seis subgates sin confundir SQLite host con SQLCipher nativo? ¿Se evitó el teléfono físico?
- ¿Pro se mantuvo bloqueado si faltó credencial QA real? ¿No se tocó OD ni se repitieron los 75/158 tests?
- ¿Los resultados y sus logs/artefactos realmente coinciden en hash? ¿ZIP único, CRC y manifiesto comprobados? ¿H9/release siguen NO_GO?

**QUIÉN SIGUE AHORA: CODEX LUNA. DESPUÉS DEL ZIP ÚNICO: CHATGPT DIRECTOR.**
