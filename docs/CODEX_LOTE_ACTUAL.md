# CODEX LUNA — JORNATO H9-M1/F1 · CIERRE FOCAL DEL FAIL VISUAL Y GATE NATIVO

**ORDEN ÚNICA SIGUIENTE, 19 de noviembre de 2026.** Esta orden **SUSTITUYE** el encargo anterior H9-M1 V2 para la próxima ejecución. **No vuelvas a ejecutar H9-M1 completo**, ni sus auditorías 10 verdugo + 10 juez, ni las suites que ya pasaron. Tu trabajo es corregir el único FAIL reproducido, cerrar lo que pueda demostrarse de almacenamiento nativo Android y producir una entrega útil sin tocar trabajo previo.

- `TASK=JOR-H9-M1-F1-VISUAL-NATIVE-SCOPE-20261119`
- `OWNER_ACTUAL=CODEX_LUNA; OWNER_DESPUES_DEL_ZIP=CHATGPT_DIRECTOR`
- `WIP=D:\codex\Jornato` — **checkout avanzado sucio, NO prototipo remoto**.
- `SALIDA=D:\codex\_REPORTES\Jornato\JOR-H9-M1-F1-VISUAL-NATIVE-20261119`
- `ACCIONES_GITHUB=NO; MERGE=NO; DEPLOY=NO; DATOS_REALES=NO`
- `H9_GLOBAL=NO_GO; B22=NOT_AUTHORIZED; RELEASE=NO_GO` hasta una autorización y pruebas adicionales explícitas.

## A. Estado comprobado y límites: NO reabrir historia

**Fuente entregada y revisada por ChatGPT:** `JOR-H9-M1-REACTIVADO-20261119-UNICO.zip`, SHA-256 `571F0B288F8B582797AF4043417A2A1B44935B60D649F592172751F402D9A0B6` (16 miembros, CRC correcto, **15/15** hashes y tamaños de manifiesto correctos). El ZIP demuestra **existencia y consistencia de los logs**, pero **NO** trae todos los archivos fuente del WIP, la base SQLCipher ni los bytes del APK: jamás presentarlo como certificación independiente de esas piezas.

| Gate anterior | Estado firme / decisión para este lote |
|---|---|
| `flutter analyze --no-pub` | **PASS reportado con log**, después de un paréntesis corregido. No revalidar si no cambias Dart. |
| 75 tests host en cinco archivos de motor/repositorio/outbox/backup/sesión | **75/75 PASS reportado con log**; **NO volver a ejecutar la suite** por rutina. |
| Laravel bootstrap normal y `portal.error` sin overlay S3 | **PASS reportado**, sin DB; no repetir. |
| APK `productDebug`, SHA `59522127E0E2D10E3F484950AAD656F4A188B52F6575E7C96574913FB5233C3D` | **BUILD PASS** reportado; debug auto-firmado, `minSdk=24`, **no instalado**, APK no incluido en ZIP. No recompilar sin cambio que lo requiera. |
| Test `test/widget_test.dart`, caso `personal session exposes request submission and its server folio` | **FAIL real reportado, exit=1**; línea 153 intenta `tap(ExpansionTile)` a `Offset(400,647)` fuera de viewport `800×600`; línea 155 no encuentra `Folio …`. **PRIMER OBJETIVO**. |
| SQLCipher/Keystore nativo y reinicio físico | **NOT_RUN / NOT_VERIFIED**; tests host de SQLite no lo sustituyen. **SEGUNDO OBJETIVO**, solo aislado/autorizado. |
| Pro HTTP/DB QA real | **BLOCKED_CONTRACT**, sin credencial sintética autorizada ni backend QA disponible. **NO** inventar identidades ni permisos. |
| B21F-S3 | Histórico **158 tests/2450 assertions PASS_SCOPED**. No repetir. |
| PR #3 GitHub | F0 remoto distinto: **119 Flutter tests escritos NOT_RUN** y **31 checks Dart escritos NOT_RUN**. No importar ni ejecutar F0 por reflejo. |

**WIP reportado al cierre anterior:** `codex/jor-b08-h4-domain-20261025`, HEAD `faf5fe283191f8b5a2724b397009512a2caec1b6`, **235 entradas Git**, staged 0, índice sin cambios. Son datos del cierre anterior: constátalos sin exigirlos si hubo trabajo legítimo posterior. `lib/src/personal/personal_models.dart` es **untracked** y ya recibió exactamente un `)` adicional; SHA POST esperado en ese cierre: `41CA02182E39D6EC17A3050E49EA48BEDB6FAA02C04331BE70CA1A09DC40F63E`. `test/widget_test.dart` untracked conservó SHA `B3A1990B7D56BAC9484BA510DF308C937FD3B554452428C83D03DD49F99E2671`. **NO** volver a aplicar el parche del paréntesis.

## B. Reglas de ejecución que no admiten interpretaciones

1. **No pedir al propietario que ejecute nada**; Codex hace pruebas, logs y entrega. No iniciar un segundo agente ni consultar dirección entre pasos recuperables.
2. **Preflight una sola vez:** comprobar ruta, HEAD, rama, `git status --porcelain=v1 -uall`, índice y huellas de **solo archivos objetivo**. Registrar PRE. Leer `AGENTS.md`/contratos locales **una vez** y respetar la jerarquía L1–L6 ya auditada; no descargar/installar skills, no ejecutar 20 pasadas de nuevo.
3. **No** usar `git add/commit/push/pull/merge/rebase/reset/clean/stash/checkout`, no cambiar otras ramas, worktrees ni otro proyecto, no crear tags/hooks/CI. **Editar en sitio solo el mínimo delta propio**, incluso si el archivo es untracked; proteger todos sus bytes previos. No borrar ni recrear DB, APK instalado, keystore ni contenido previo. No tocar Docker ajeno, Hostinger ni producción.
4. Solo datos sintéticos y rutas/almacenamiento **aislados** para QA. No adjuntar credenciales, `.env`, DB real, claves, tokens, IDs, fotos, CV, información de empleados ni APK debug de otro entorno. Nunca certificar Android físico sin instalación/ejecución realmente observadas.
5. **Causa raíz**, no atajos: prohibido `warnIfMissed:false`, `skip`, borrar aserción de folio, cambiar texto esperado para encajar, agrandar viewport como máscara, aceptar un widget no visible como PASS o parchear código de producto si el único error está en el desplazamiento del test.

## C. Ejecución de punta a punta: prioridad estricta

### C1 — Cerrar `PERSONAL_WIDGET_FLOW=FAIL` primero

1. Abrir **solo** `test/widget_test.dart` alrededor de las líneas 125–160 y el widget consumidor que crea la `ExpansionTile` del folio (`lib/src/ui/personal_screen.dart` u otro propietario real). Confirmar si el envío se completó y la tarjeta existe; **el log por sí solo no prueba éxito de negocio**.
2. Reproducir **una vez** el caso **con su nombre exacto**: `flutter test --no-pub test/widget_test.dart --plain-name 'personal session exposes request submission and its server folio'` (usar sintaxis PowerShell apropiada). Conservar warning de hit test y fallo de aserción PRE. Si ya no falla, guardar evidencia SHA y no editar.
3. **Corrección elegida si confirma que solo falta desplazar la tarjeta:** sobre el finder **específico** por clave/id o ancestro correspondiente: `await tester.ensureVisible(target); await tester.pumpAndSettle(); await tester.tap(target); await tester.pumpAndSettle();` antes de esperar el folio. Si el elemento no está construido en el árbol por una lista perezosa, usar `scrollUntilVisible` **sobre el `Scrollable` real y con límite**. No usar `find.byType(ExpansionTile).first` si puede pulsar otra tarjeta. La aserción original `Folio <id>` debe permanecer íntegra y el test debe comprobar que el tap sí alcanzó el destino.
4. Si el elemento sigue sin abrirse **después de desplazamiento válido**, investigar de forma focal identidad del estado/folio y condiciones de render. Corregir la **causa real** en el propietario mínimo y añadir una sola regresión pertinente cuando cambie código de producto. No rediseño ni nueva máquina de estados.
5. Ejecutar el caso focal **después del cambio** y, solo si editaste producción u otro consumidor, las pruebas vecinas impactadas y `flutter analyze --no-pub` **una vez**. No repetir los 75 host PASS ni B21F-S3. Registrar `WIDGET_FLOW=PASS_FOCAL|FAIL|BLOCKED` con nombre, salida, SHA y si cambió solamente test o también producto.

### C2 — Resolver hasta donde pueda **verificarse** el gate nativo de SQLCipher/Keystore

6. Localizar adaptadores y tests existentes: `lib/src/persistence/local_encrypted_store.dart`, esquema/migraciones propios y `integration_test/` pertinente, **sin abrir un segundo proveedor de cifrado**. Aislar la capa nativa Android de SQLite host; distinguir explícitamente la base SQLite de test de una base SQLCipher del teléfono/emulador.
7. **Priorizar emulador de prueba aislado preexistente** si puede iniciarse sin intervenir otros dispositivos/procesos/instalaciones y sin instalar toolchains gigantes. **No instalar, desinstalar, iniciar o manipular el dispositivo físico conectado**, aunque ADB diga `AUTHORIZED=1`; falta autorización específica H9 para ello. No usar perfiles ni datos existentes.
8. Si existe un emulador de prueba utilizable, ejecutar **solo pruebas nativas focales con datos sintéticos**: apertura con clave Android Keystore efectiva, confirmación de versión cipher por API nativa (`PRAGMA cipher_version` o equivalente validado), escritura de evento + outbox, cierre y relanzamiento, lectura idéntica, reintento sin duplicado, rechazo de clave errónea, aislamiento tenant/actor y fallo cerrado ante corrupción. No registrar contenido secreto ni destruir base fuera del sandbox. Un reinicio de proceso no equivale automáticamente a recuperación tras reinstalar aplicación. Marcar `PASS_EMULATOR` solamente para las subpruebas observadas y con build/aplicación identificados.
9. Si **no** hay emulador propio, no reintentar sobre el teléfono físico: comprobar de manera focal si ya existen tests instrumentados que permitan esa verificación; añadir/completar **solo el test faltante del adaptador existente** si el código permite hacerlo sin inventar dependencias, documentar `NATIVE_CIPHER=NOT_RUN` y `ANDROID_OFFLINE=PASS_HOST_ONLY`. No atribuir PASS nativo por análisis estático, logs antiguos ni un APK compilado.
10. No activar migraciones destructivas ni restauraciones reales. Si encuentras un defecto de seguridad/cifrado, corregir la **causa mínima autorizada** y su regresión; si necesita política OD/consentimiento o permiso externo, dejar `BLOCKED_CONTRACT` **solo** para ese subgate y seguir el resto.

### C3 — Sincronización Pro: conservar el contrato y el bloqueo correcto

11. **NO repetir** los tests host de serialización canónica `requestId`, outbox y receipt ya aprobados. Con credencial **sintética preexistente y autorizada** + backend **QA aislado preexistente**, si realmente están accesibles sin tocar producción, ejecutar **solo** un evento offline → envío → receipt/readback → reenvío de igual `requestId` sin duplicación y, si viable, ACK perdido. Inspeccionar el campo exacto persistido; nunca aceptar `requetId` mediante traducción silenciosa. Si no existe la autorización/entorno, **mantener `PRO_HTTP_DB=BLOCKED_CONTRACT`**, no crear cuentas/roles/tokens/schemas/Docker nuevos.
12. `BOOT_NORMAL=PASS_HOST` y `HOST_FOCAL_75=PASS_HOST_HISTORICAL` se **heredan como evidencia H9-M1** sin ejecutarlos. No confundir sincronización HTTP del servidor real con transportes falsos o mocks de host.

### C4 — Custodia, documentación útil y UNA entrega

13. Comparar PRE/POST del **mismo archivo**: branch, HEAD, listado Git, índice, SHA y líneas cambiadas; para archivos untracked usar diff de PRE/POST conservado fuera del repo. No alterar ni «limpiar» las 235 rutas por costumbre. Un `status --porcelain` igual antes/después **no demuestra** que el contenido untracked sea igual: mostrar hashes propios. No incluir archivos WIP anteriores ajenos en el parche.
14. Reportes **breves** (no otra auditoría): `FINAL_REPORT.md` de 1–2 páginas, `RESULTS.csv` con estados por gate, `CHANGES.patch` solo de delta del lote, `WIP_PRE_POST.csv`, logs focales, `BLOCKERS.md` si corresponde y `MANIFEST_SHA256.csv` (**excluyendo al propio manifiesto**). ZIP único `JOR-H9-M1-F1-VISUAL-NATIVE-20261119-UNICO.zip`; comprobar CRC, tamaños y SHA de cada miembro. Los reportes no contienen datos personales ni secretos. **Si una columna SHA se refiere al log, su hash debe coincidir con el log**; separar `log_sha256` de `source_sha256`/`apk_sha256` para evitar la ambigüedad del `RESULTS.csv` anterior. No cambiar retroactivamente el ZIP H9-M1.
15. En el informe, atribuir correctamente qué pasó en **este** lote y qué se **reutilizó** de H9-M1/B21F-S3. Si ninguna parte nativa estuvo permitida, entregar el cierre focal del test visual y resultado `NATIVE_CIPHER=NOT_RUN` sin otra auditoría de arquitectura. **No presentar H9 o release como GO**.

## D. Contrato de salida obligatorio (una sola respuesta de Codex)

~~~text
TASK=JOR-H9-M1-F1-VISUAL-NATIVE-SCOPE-20261119
RESULT=PASS_SCOPED|PARTIAL|BLOCKED
SOURCE_HEAD=<HEAD exacto; conservar salvo cambios ajenos preexistentes>
WIP_PRESERVED=YES|NO
CHANGED_FILES=<rutas exactas, solo nuevo delta>
WIDGET_FLOW=PASS_FOCAL|FAIL|BLOCKED
FLUTTER_ANALYZE=PASS_CURRENT|REUSED_H9_M1|FAIL|NOT_RUN
HOST_FOCAL_75=REUSED_H9_M1_PASS_HOST_NOT_RERUN
BOOT_NORMAL=REUSED_H9_M1_PASS_HOST_NOT_RERUN
NATIVE_CIPHER=PASS_EMULATOR_SCOPED|PARTIAL|NOT_RUN|BLOCKED_CONTRACT
ANDROID_OFFLINE=PASS_HOST_ONLY|PARTIAL|PASS_EMULATOR_SCOPED
PRO_HTTP_DB=PASS_HTTP_DB_QA|BLOCKED_CONTRACT|NOT_RUN
PHYSICAL_ANDROID=NOT_RUN_UNAUTHORIZED
H9_GLOBAL=NO_GO
RELEASE=NO_GO
ZIP_PATH=<ruta real de UN ZIP>
ZIP_SHA256=<SHA comprobado>
NEXT_OWNER=CHATGPT_DIRECTOR
~~~

**NO HAY PASO DE AUDITORÍA FINAL DE 10+10 PARA CODEX.** Haz cambios de producto/QA útiles, prueba únicamente lo afectado y entrega. Si no puedes ejecutar un subgate por permisos o herramientas, termina lo independiente. **No pedir al usuario que haga pruebas.**
