# CODEX LUNA — JORNATO · C2 ANDROID FÍSICO · MACROBLOQUE ÚNICO DE EJECUCIÓN NATIVA

**ORDEN ACTIVA — 19 de noviembre de 2026 (Colombia).** El propietario acaba de autorizar expresamente: **«usa el celular que está conectado y disponible»**. Esta autorización sustituye **únicamente** la prohibición anterior de usar el celular para QA de Jornato. NO autoriza borrados, restauración de fábrica, uso de apps ajenas, acceso a datos personales, alterar configuraciones globales, publicar, usar AVD ajenos ni desplegar. **Codex ejecuta todas las pruebas; no delegarlas al propietario.** ChatGPT Director recibe un ZIP único y decide el siguiente bloque.

```text
TASK=JOR-H9-C2-PHYSICAL-ANDROID-QA-20261119
WIP=D:\codex\Jornato
REPORTS=D:\codex\_REPORTES\Jornato\JOR-H9-C2-PHYSICAL-ANDROID-QA-20261119
OWNER_NOW=CODEX_LUNA
OWNER_AFTER_ZIP=CHATGPT_DIRECTOR
PHYSICAL_DEVICE_PERMISSION=GRANTED_FOR_JORNATO_DEBUG_QA_ONLY
OTHER_PHONES_AND_EIGHT_EXISTING_AVDS=FORBIDDEN
AVD_CREATE_OR_START=NOT_AUTHORIZED
GIT_STAGE_COMMIT_PUSH_PULL_MERGE_RESET_CLEAN_STASH=FORBIDDEN
RELEASE=NO_GO
```

## 1. No repetir lo ya concluido

- H9-M1: ZIP SHA256 `571F0B288F8B582797AF4043417A2A1B44935B60D649F592172751F402D9A0B6`; **75/75 tests host PASS** y **bootstrap Laravel normal PASS**, históricos y NO repetir por rutina.
- F1: ZIP SHA256 `563ADC7CA9B4625B3B10CC16E0D83760F7996905A604BD49E93574EABEC71CBF`; **test visual del folio PASS_FOCAL** y análisis Flutter PASS. No reabrir el bug visual.
- C2: ZIP SHA256 `3F9E1031AFA7FE0BEEABA7A82FB9114CFBA843E88158A2A8C57656E8FF21F576`; solo `integration_test/kiosk_flow_test.dart` cambió, PRE SHA256 `E5E1227735E063F5E17F0C7FBE3965280E84081013AD66E1623E9A4D81022EB9` y POST `30267B4110336B479437CFFE3C31392EF67CD32DEDC684F2179EC47808BB3E30`. Flutter Analyze PASS, **test nativo WRITTEN_NOT_RUN**. Adaptador productivo `local_encrypted_store.dart` sin cambio, SHA256 `AF5D835A56A6085F1851CEED371C3730D7CCCD374A382060B271D528808FE4A9` según C2.
- El WIP local avanzado **no está publicado en GitHub**. La rama/HEAD históricos fueron `codex/jor-b08-h4-domain-20261025` / `faf5fe283191f8b5a2724b397009512a2caec1b6`, con 235 entradas y cero staged. **No exigir coincidencia** si hubo progreso nuevo. PR #3 remoto es un F0 no ejecutado, no la base de integración. Pro HTTP/DB permanece `BLOCKED_CONTRACT` por autorización/identidad QA no existente. OD01–OD08 no se aprueban por esta orden.

## 2. P0 — Preflight breve: WIP y dispositivo correcto

1. Leer las reglas locales aplicables (`AGENTS.md`, contrato y canon L1–L6 si disponible) **una sola vez**. Localizar el WIP real, guardar rama/HEAD, `git status --porcelain=v1 -uall`, índice staged y hashes PRE de **cada archivo objetivo** (incluidos untracked). Copiar los bytes PRE de archivos a editar en `REPORTS`, nunca en GitHub. **No** ejecutar `git add`, `commit`, `push`, `pull`, `checkout`, `reset`, `clean`, `stash`, `merge` ni instalar hooks. No afectar otros proyectos ni Docker.
2. Hacer `adb devices -l` y consultas read-only suficientes para determinar **un único serial de celular físico conectado y autorizado**. Diferenciar teléfono de emuladores (`ro.kernel.qemu`, `ro.product.*`, versión/API). Ocultar serial completo, propietario y otros identificadores en informes. Si hay varios teléfonos o el serial no es inequívoco, `DEVICE=BLOCKED_AMBIGUOUS` y continuar pruebas host independientes; **no elegir automáticamente**.
3. TODA acción en Android debe usar el **serial explícito**: `adb -s <SERIAL> ...` y Flutter con `-d <SERIAL>`. No usar `adb` o `flutter` sin destino cuando haya más de un dispositivo. Prohibido usar los ocho AVD ajenos, otros teléfonos, root, `pm clear`, `adb uninstall`, factory reset, reiniciar el teléfono, cambiar seguridad/USB/batería/permisos globales, consultar fotos/mensajes/contactos/cuentas, logs de apps ajenas, claves o datos privados. No crear AVD.
4. Antes de instalar, inspeccionar `applicationId`, variante `productDebug`, firma y paquete Jornato real del dispositivo **solo mediante consulta de ese package ID**. Si ya hay Jornato instalado **con datos, identidad real o firma no compatible**, NO sobrescribir, borrar ni actualizar: `DEVICE_PACKAGE_CONFLICT=BLOCKED`; continuar lo no invasivo. Si existe variante debug/test **aislada y ya prevista** por el proyecto, usarla. Si el paquete no está instalado y el build es de depuración para datos ficticios, la autorización del propietario permite instalarlo/ejecutarlo. Nunca cambiar el applicationId productivo ni crear un flavor adicional solo para forzar PASS. Registrar el paquete instalado y dejarlo al final sin desinstalar; reportar su estado. No acceder ni reutilizar datos ajenos del teléfono.

## 3. P1 — Ejecutar por primera vez el test nativo C2 ya escrito

5. Inspeccionar **solo** `integration_test/kiosk_flow_test.dart`, `lib/src/persistence/local_encrypted_store.dart`, `KioskRepository`, `pubspec.lock`, manifiesto/Gradle y el runner Android existente. Verificar que el test usa almacén/namespace **ficticios y propios de Jornato** y no borra ni corrompe una base con datos reales; toda corrupción ocurre sobre copia sintética temporal, no sobre el archivo de producto. Si hay riesgo destructivo, **bloquear ese caso**, no lanzar todo a ciegas.
6. Usar SDK/Gradle/dependencias **ya instalados**. No descargar imágenes Android ni instalar dependencias globales. Construir/instalar APK **debug** solo cuando el paso 4 lo permita. Capturar hash SHA256 del APK construido, applicationId y firma debug sin exportar certificados privados. Ejecutar **una sola vez** la integración C2 por el mecanismo real del proyecto; preferir un comando existente comprobado, o `flutter test integration_test/kiosk_flow_test.dart -d <SERIAL>` si ese árbol lo soporta. Distinguir fallo de compilación, fallo de instalación, fallo de plugin/ABI y fallo de aserción. Capturar exit code/log **sanitizado** sin incluir serial, tokens, claves ni datos personales.
7. Evaluar por separado: `CIPHER_ENGINE` (base no abre como SQLite claro, header opaco, clave incorrecta y lectura con clave legítima), `KEYSTORE_EFFECTIVE` (plugin Android real, persistencia de clave legítima sin imprimir/extractarla, falta de clave = fallo cerrado), `IDEMPOTENCY_NATIVE` (mismo ID/carga no duplica, mismo ID/carga diferente da conflicto), `CORRUPTION_FAIL_CLOSED` (copia sintética dañada se rechaza y original permanece íntegro). **No declarar PASS** solo por `cipher_version`, Flutter Analyze, mock, host o un nombre de test. Registrar subgates, SHA de código probado, Android API/ABI y tipo de evidencia.
8. Si aparece fallo, identificar causa raíz y arreglar **mínimamente** el test o método propietario, usando el mecanismo existente. Dos alertas del análisis anterior son **hipótesis, no errores confirmados**: namespace fijo `jornato.c2.missing-key.qa` con posible estado previo y corrupción de un byte en offset 100 sin afectar página consultada. Solo intervenir al observar fallo o contaminación real. No añadir proveedores, paquetes, canales, DB, endpoints o infraestructura paralela. Tras corrección, ejecutar **solo caso fallido y vecinos afectados UNA vez** y `flutter analyze --no-pub` si hubo delta Dart. Si no hay delta, reutilizar el análisis C2.

## 4. P2 — Recuperación tras reinicio real, sin borrar datos

9. Diferenciar **cerrar y reabrir conexión** de **finalizar y relanzar proceso Android**. Si la instalación debug está aislada y libre de datos reales, preparar el escenario sintético mínimo: persistir IDs de marcación/outbox, cerrar test/driver, `adb -s <SERIAL> shell am force-stop <JORNATO_DEBUG_PACKAGE>` **solo para ese paquete**, relanzarlo con la actividad existente y comprobar los **mismos IDs, secuencia y estado cifrado**. No efectuar force-stop sobre otras apps. Si el runner reinstala/limpia el paquete entre etapas o no permite lectura verificable de segunda fase, NO falsificar PASS: `RESTART_READBACK=BLOCKED_HARNESS`, registrar exactamente qué impide la prueba; no crear un framework nuevo. Un reinicio de widget o `LocalEncryptedStore.close/open` en mismo proceso no satisface este gate.
10. `TENANT_ISOLATION` queda `BLOCKED_CONTRACT` si no existe mecanismo ya aprobado para segundo tenant/kiosco: **no inventar asociación empleado-cuenta ni permisos RR. HH.**. `PRO_HTTP_DB=BLOCKED_CONTRACT`: no red, usuarios, tokens, bases o tenants QA improvisados. No abrir paquetes comerciales, identidad, selfie, GPS ni flujos de otras aplicaciones.

## 5. P3 — Custodia de cambios, evidencia única, sin ping-pong

11. Revisión PRE/POST de cada archivo realmente editado por SHA256 **incluidos untracked**, status/index/HEAD; no declarar preservación global de WIP por solo 235 rutas. Si se modificó fuente, incluir `CHANGES.patch` generado entre PRE y POST exactos, aplicable solo tras verificar SHA PRE; no generar parche ficticio. No borrar archivos del WIP. Nunca subir código privado a GitHub sin autorización específica. **No repetir** 75 host tests, F1 visual, 158/2450 backend ni auditorías 10+10.
12. Generar **un único ZIP** bajo `REPORTS\delivery\JOR-H9-C2-PHYSICAL-ANDROID-QA-20261119-UNICO.zip` con `FINAL_REPORT.md` breve, `RESULTS.csv` (gate, nivel evidencia, comando/exit, `source_sha256`, `log_path`, `log_sha256`, `artifact_sha256` diferenciados), `WIP_PRE_POST.csv`, logs sintéticos sanitizados, `CHANGES.patch` solo si existe cambio, `BLOCKERS.md` si es necesario, `MANIFEST_SHA256.csv` de miembros distintos al propio manifiesto. Verificar CRC, tamaños, SHA de cada miembro y SHA256 final ZIP. No incluir APK, DB, claves, fotos, serial, archivos .env ni capturas privadas salvo consentimiento específico.
13. Terminal con valores **reales**, sin prometer PASS futuro:

```text
TASK=JOR-H9-C2-PHYSICAL-ANDROID-QA-20261119
RESULT=PASS_PHYSICAL_SCOPED|PARTIAL|BLOCKED_DEVICE|BLOCKED_PACKAGE|BLOCKED_RUNTIME
SOURCE_HEAD=<SHA real>
WIP_PRESERVED=YES|PARTIAL_EVIDENCE|NO
CHANGED_FILES=<rutas o NONE>
DEVICE_AUTH=GRANTED_FOR_JORNATO_QA
PHYSICAL_ANDROID=PASS_PHYSICAL_SCOPED|FAIL|BLOCKED_DEVICE|BLOCKED_PACKAGE|NOT_RUN
APK_DEBUG=BUILT_INSTALLED|BUILT_NOT_INSTALLED|NOT_RUN
NATIVE_CIPHER=PASS|FAIL|NOT_RUN
KEYSTORE_EFFECTIVE=PASS|FAIL|NOT_RUN
IDEMPOTENCY_NATIVE=PASS|FAIL|NOT_RUN
CORRUPTION_FAIL_CLOSED=PASS|FAIL|NOT_RUN
RESTART_READBACK=PASS|FAIL|BLOCKED_HARNESS|NOT_RUN
TENANT_ISOLATION=PASS|BLOCKED_CONTRACT|NOT_RUN
PRO_HTTP_DB=BLOCKED_CONTRACT
H9_M1_HOST_75=REUSED_PASS_NOT_RERUN
F1_WIDGET=REUSED_PASS_FOCAL_NOT_RERUN
BOOT_NORMAL=REUSED_PASS_NOT_RERUN
H9_GLOBAL=NO_GO
RELEASE=NO_GO
ZIP_PATH=<ruta verificada>
ZIP_SHA256=<huella real>
NEXT_OWNER=CHATGPT_DIRECTOR
```

**PASS_PHYSICAL_SCOPED** solo si los gates nativos realmente ejecutados terminaron PASS con evidencia atribuible, **no equivale a H9_GLOBAL=GO**. Si hay límite de hardware/paquete, completar lo no invasivo y declarar BLOCKED sin repetir el encargo. No ejecutar más variantes de infraestructura para evadir un bloqueo. Después de entregar el ZIP sigue CHATGPT DIRECTOR.

# 🚨 QUIÉN SIGUE AHORA: CODEX LUNA. DESPUÉS DEL ZIP ÚNICO: CHATGPT DIRECTOR. 🚨
