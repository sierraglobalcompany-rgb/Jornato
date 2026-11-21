# CODEX LUNA — JORNATO N4 — MACROBLOQUE ÚNICO: CANDIDATO COMPLETO + QA REAL DEL SERVIDOR

**ORDEN DE EJECUCIÓN, NO DE REAUDITORÍA.** Director: ChatGPT. Ejecutor: Codex Luna (un único proceso). Fecha de decisión: 21-11-2026 (America/Bogota). **N3-R1 HA TERMINADO** y su ZIP fue recibido, abierto y verificado; no reabrir N3, N2 ni C2. La prioridad operativa N4 es producir un **árbol reconstruible de app+servidor**, validar el cliente en host aislado **si el caché existente lo permite** y ejecutar QA Laravel real **solo sobre base aislada y comprobada**. Una campaña, un ZIP de evidencias, código y backups privados fuera del ZIP.

```text
TASK=JOR-N4-FULL-SOURCE-AND-SERVER-QA-20261121
WIP_ROOT=D:\codex\Jornato
REPORT_ROOT=D:\codex\_REPORTES\Jornato\JOR-N4-FULL-SOURCE-AND-SERVER-QA-20261121
REMOTE_REPO=sierraglobalcompany-rgb/Jornato
PR2_DOCS_BRANCH=docs/pingponglaw-l1-l6-canon-84e961c
EXPECTED_WIP_BRANCH_OBSERVED=codex/jor-b08-h4-domain-20261025
EXPECTED_WIP_HEAD_OBSERVED=faf5fe283191f8b5a2724b397009512a2caec1b6
N3_R1_ZIP_SHA256=C960FA83ABAE677E4DDF1E59432C0915B75A85017FD02D65F4FBD9731ACA57DA
N3_R1_RESULT=PARTIAL_WITH_GAPS
N3_UI_HOST=9_PASS_0_FAIL_0_SKIP
N3_NEIGHBOR_HOST=4_PASS_0_FAIL_0_SKIP
N3_KIOSK_SCREEN_POST_SHA256=7925AC0074A74081E8DFE4D0B8CEB9DB4E20C3137D9756C615EED861D9B9A6A5
N3_NEW_TEST_SHA256=A1317B664570CDA738DD017C50C02E079A34B332137E026978B190B95CEA7BF3
N3_SOURCE_CANDIDATE=65_FILES_56_OVERLAYS_PARITY_ONLY_NOT_COMPILED
N3_OMITTED_BACKEND_CHANGED_PATHS=155
N3_WIP_STATUS_OBSERVED=235_TOTAL_224_UNTRACKED_11_MODIFIED_0_STAGED
N2_HOST=86_PASS_7_FILES_REUSED_ONLY
OFF_DEVICE_BACKUP=NO
ANDROID_NATIVE=NOT_RUN
RELEASE=NO_GO
NEXT_OWNER_AFTER_SINGLE_ZIP=CHATGPT_DIRECTOR
```

## 0. Leyes, alcance y prioridades: no perseguirse la cola

**L1 KISS/Ponytail:** un motor y un almacén por responsabilidad, **nada de segundo backend, migrador, sync worker, esquema o UI de administración**. **L2:** cero suites repetidas sin cambio causal. **L3:** corregir propietaria y causa demostrada, no parches de entorno fingidos. **L4:** pruebas de interfaz y errores veraces. **L5:** PASS respaldado por comando + exit + hash de fuente y entorno. **L6:** macrobloque grande + un ZIP, sin nuevas rondas de prompts. No instalar skills/hooks/dependencias globales. Conservar `requestId` y legado `requetId` exactamente como existan, `SERVER_STORED` ≠ `RECOGNIZED`, B19/B20 `deny-all`, OD01–OD08 sin aprobación nueva. No fabricar roles, token/consentimiento o contratos HTTP.

**Prohibiciones:** No teléfono/ADB/AVD/logcat, instalar o borrar APK, ni producción/staging, ni Hostinger/ERP-BDM/otro proyecto. No hacer `git add`, `commit`, `push`, `fetch`, `pull`, `checkout`, `reset`, `clean`, `stash`, `merge`, `rebase` o `cherry-pick` en el WIP; no ejecutar Actions. No subir fuentes a GitHub público ni ZIP de ChatGPT sin examen de seguridad y autorización específica. **No downloads**: Composer, Pub, Flutter, binarios de MariaDB, Docker, extensiones, plugins, yarn/npm; no reemplazar herramientas faltantes. No modificar versiones/contratos para obtener verde. **No ejecutar DB real sin poder probar que es exclusivamente desechable de este proyecto.**

**Prioridad y presupuesto:** A→B→C→D. A es conservación y árbol integral; B smoke del cliente; C servidor real. Si falla B por entorno, **seguir C si es independiente y seguro**, y viceversa. No gastar una campaña de QA repitiendo tests exitosos N2-R1 (86) o N3 (9+4) en el WIP intacto. Máximo una ejecución focal por puerta y una repetición **solo** después de un arreglo causal; no más de una suite global de backend y únicamente si hay cambio causal que invalide 158/2450 previamente aprobado. No hacer otra auditoría 10+10.

## A. Preflight, preservación y árbol completo (sin modificar Git)

A1. Confirmar exclusividad de ejecución y ausencia de ZIP N4 anterior. Leer `git status --porcelain=v1 -uall`, `git rev-parse HEAD`, rama, staged y hash del índice Git. Historial **informativo** N3: branch `codex/jor-b08-h4-domain-20261025`, HEAD `faf5fe...`, status 235 (224 untracked + 11 modified), stage 0. Si hay concurrencia o reemplazo de fuente desconocido, `BLOCKED_CONCURRENT_WIP`. Acreditar hash de `lib/src/ui/kiosk_screen.dart` y `test/kiosk_screen_actions_test.dart` frente a los hashes N3 arriba. **No restablecer el WIP para satisfacer el hash.** Si cambió legítimamente, registrar delta y probar solo cobertura causal.

A2. Reutilizar snapshot N1-R2 de 216 archivos y el candidato N3 de 65 cuando su ruta/manifest exista. No recrear íntegra la copia por rito. El snapshot local D: sigue `OFF_DEVICE_BACKUP=NO`. Congelar en `REPORT_ROOT\private\pre_edit` bytes y SHA de **cualquier archivo que se vaya a editar**; controlar espacio y no seguir symlinks/junctions/hardlinks. Mantener `REPORT_ROOT` fuera del WIP. Si un secreto parece necesario para levantar la app, **no copiarlo** a candidato o ZIP: usar configuración sintética de QA en ubicación privada, sin modificar producción, solo si aprobada/posible.

A3. Construir **una** fuente candidata integral en `REPORT_ROOT\private\full_source_candidate` de forma determinista: exportar el `HEAD` verificado a un árbol vacío fuera del WIP; superponer todos los archivos de código, manifests, recursos, migraciones y tests pertinentes tanto tracked modificados como untracked **necesarios para app+server**, usando lista positiva, rutas relativas y SHA-256 origen/destino. **Incluir backend** cuando sus 155 rutas de N3 sigan existiendo y no sean secreto/artefacto. La cifra 155 es inventario de N3, **no cuota obligatoria**: verificar categoría y archivos de código reales. No usar checkout ni sobrescribir tracked del WIP; no importar PR3 ni añadir `.git` al candidato. Si hay ruta en conflicto, registrar decisión y autoridad de código. No tratar un `git archive` de 13 archivos como app+server completa.

A4. Excluir `.env*`, llaves/keystores, DB, información laboral/PII, secretos, logs, cache, binarios generados, `.dart_tool`, `vendor`, `.gradle`, `build`, `node_modules`, SDKs, archivos ignorados localmente que sean configuración del equipo. Documentar **categoría + cantidad**, nunca secreto, token ni ruta sensible detallada en ZIP. Examinar contenido de fuentes candidatas con chequeo de patrones de secretos/PII y revisión por ruta de alto riesgo; el escáner NO es garantía total. Si no se puede asegurar seguridad: `CANDIDATE_PRIVACY_BLOCKED`, conservar solo en private y no transmitir. No excluir migraciones esenciales por su nombre sin razón.

A5. Verificar: reconstrucción desde HEAD + manifiesto de overlay, totalidad por categoría, bytes/SHA origen y destino, dependencias internas/imports/entrypoints del proyecto y ubicación de `server/composer.json`, `composer.lock`, `routes`, `database/migrations`, tests y cliente Flutter. Producir matrices sanitizadas `FULL_SOURCE_COVERAGE.csv`, `FULL_SOURCE_PARITY.csv` (sin código, nombres internos sensibles ni ruta absoluta), `SOURCE_EXCLUSIONS_SUMMARY.md`. Clasificar distinto: `SOURCE_COMPLETE_SCOPED`, `SOURCE_PARITY_PASS_SCOPED`, `PRIVATE_SOURCE_CANDIDATE_ONLY`, `NOT_COMPILED`. La fuente puede estar íntegra aunque falte runtime; **no declararla READY/DEPLOYABLE solo por hashes**. Si un archivo imprescindible está ausente o excluido, `SOURCE_COMPLETE_SCOPED=NO`, causa concreta. Reconciliación PR3 se **REUTILIZA** desde matriz N1; no rehacerla ni mezclar demo F0 por defecto.

## B. Smoke host del cliente en el candidato privado (solo si offline viable)

B1. Identificar Flutter 3.47.8/Dart 3.13.7 desde el entorno que N2/N3 usaron, sin búsqueda de unidad global; comprobar artefactos de Flutter y `PUB_CACHE` de lectura, `pubspec.yaml` y lock. `--no-pub` no garantiza no-descargas de artefactos: **no iniciar Flutter CLI sin preflight del cache completo**. No reutilizar a ciegas `.dart_tool/package_config.json` del WIP porque codifica rutas y contexto. **La ausencia de `.dart_tool/package_config.json` en una copia nueva es normal, no una prueba de fallo del código.** `android/local.properties` es configuración de máquina/Android; **no exigirlo para el smoke Flutter host si la prueba puede funcionar sin él**.

B2. Si existe todo el caché y el comando no accederá a red, permitir **únicamente sobre el candidato privado aislado** generar configuración derivada con `flutter pub get --offline` o equivalente que use paquetes ya cacheados; NUNCA en WIP, NUNCA cambiar versiones o lock ni instalar. Debe comprobarse el guard de artefactos de Flutter previamente y no utilizar internet de forma oculta. Si no se puede probar operación sin red, `CANDIDATE_SMOKE=BLOCKED_OFFLINE_CACHE` y **continuar C** sin modificar producto. Si falla por ruta/config local, una corrección de QA/entorno aislado; no editar app para forzar un smoke.

B3. Smoke mínimo **sobre el candidato**: `flutter analyze --no-pub` focal cuando sea viable, test widget `test/kiosk_screen_actions_test.dart` (los nueve casos) y **solo** los tests afectados por diferencias de fuentes/candidato. Es una prueba de **árbol distinto**, no repetición innecesaria del WIP; si las rutas son idénticas y las precondiciones impiden ejecución, reutilizar evidencia con hash y marcar `REUSED_SCOPE` sin llamarlo smoke. Registrar comandos, exit, hash de árbol y hashes de test. No instalar APK; build Android únicamente cuando exista preflight autorizado futuro. Si el candidato no tiene la configuración temporal necesaria, registrarla como `CANDIDATE_RUNTIME_GAP` y no calificar de defecto funcional.

B4. Cierre B: `CANDIDATE_HOST_SMOKE=PASS_SCOPED|BLOCKED_OFFLINE_CACHE|FAIL_PRODUCT|FAIL_ENV|NOT_RUN`. Si surge defecto real y localizado, corregir propietario solo tras PRE backup del WIP, propagar el fichero al candidato, repetir prueba focal una sola vez y guardar POST hashes. No cambiar interfaz si el fallo es mero package-config. La validación de pantalla sigue sin cubrir **login de empleado** ni Android nativo.

## C. Servidor real Laravel: intake + QA focal aislada en el MISMO macrobloque

C1. Acceder **solo ahora, sin N3 concurrente** al backend existente bajo el WIP, sin crear segundo Laravel. Leer `server/composer.json`, `composer.lock`, `server/routes`, middleware/policies, migraciones, tests, configuración de QA **excluyendo contenidos `.env*`**, y confirmar rutas exactas. Verificador opcional ya preparado en PR2: `tools/JORNATO_SERVER_SOURCE_INTAKE_S1.py` (Python ≥3.10, solo lectura, SHA256 histórico `85636f9acd9b8b511d25397b3892550b1dcff4fa80498051d0b2a0af989a0908`); su presencia en PR2 **NO implica** que exista en el WIP. Si está disponible localmente y su SHA coincide, usarlo; si no está, inventariar con Python/Powershell estándar sin bajar software. No copiar un script desconocido ni inventar dependencia. El kit S2 
`tools/JORNATO_SERVER_BUNDLE_PREFLIGHT_S2.py` sirve para un **ZIP real ya creado**; no fabricar ZIP de código para ejecutar esa herramienta si aún no hay permiso de publicación. No necesita reejecutar self-tests sintéticos ya aprobados.

C2. Construir una matriz `REAL_API_CONTRACT.csv` desde **source real** con cada caso, método+patrón de ruta ya existente (sanitizado si privado), middleware, controlador, policy, request/response DTO, test anterior, SHA source y decisión `PRESENT|BLOCKED_CONTRACT|MISSING|UNKNOWN`. Prioridad: identidad tenant; token Sanctum revocado/vencido; evento y `requestId` idempotente; mismo ID/diferente payload; `SERVER_STORED`≠`RECOGNIZED`; `occurredAt`/`recordedAt`; B19/B20 deny-all. No imaginar endpoints/códigos de respuesta. OD02/03/04 no se resuelven con mocks o roles inventados.

C3. Preflight MariaDB de QA **independiente y exclusiva**. Confirmar existencia de runtime MariaDB ya instalado o ZIP binario local **preexistente**; host loopback `127.0.0.1`, puerto libre, carpeta de datos NUEVA solo de Jornato dentro de `REPORT_ROOT\private\qa_db`, sin servicio Windows, admin, firewall, puertos ajenos, Docker ajeno, ni procesos de otra app. Si no hay binario seguro/no se puede crear instancia aislada, `QA_DB=BLOCKED_ENV` y continuar revisión estática; no descargar. Evitar instancia preexistente aunque se llame QA si no prueba propiedad/aislamiento. No acceder a DB de ERP-BDM, producción ni bases laborales. No ejecutar migraciones destruyendo datos existentes. Usar fixtures sintéticos solo cuando el esquema nuevo, usuario, puerto y datadir sean inequívocamente propios, con registro sanitizado de sentinel del entorno; **si cualquier identidad del destino es ambigua STOP antes de crear esquema**.

C4. Sobre **única DB efímera nueva, vacía y con acceso mínimo**, si PHP y vendor/deps compatibles ya existen: migraciones y smoke HTTP/kernel reales; no usar `.env` de producción. Diseñar/ejecutar **hasta ocho** pruebas críticas E01–E08 del kit S1 si ya hay rutas existentes: E01 anónimo denegado; E02 A a A permitido; E03 A intenta leer B denegado; E04 A intenta escribir B sin mutar; E05 PAT revocado/vencido falla cerrado; E06 requestId igual + payload igual una sola operación; E07 requestId igual + payload distinto colisión rechazada; E08 `SERVER_STORED` nunca se atribuye `RECOGNIZED` solo por persistencia. Si un caso está bloqueado por OD02/03/04, no abrir endpoint ni introducir falsa autorización: marcar `BLOCKED_CONTRACT`. Si no existe la ruta no inventarla para que pase el test. Medir DB después de E04, E06 y E07, no solo HTTP status. Si falla código propio, reparar raíz en backend bajo PRE/POST backup, repetir prueba afectada y vecinas solamente, sin reiniciar 158/2450 históricos salvo cambio causal que realmente afecte suite.

C5. Nunca ejecutar comandos Composer `install/update`, `migrate:fresh`, `db:wipe`, `reset`, seed de datos reales, `queue:work` o 
`php artisan` con configuración incierta. No poner en marcha cron/worker si el código no lo requiere. Si hay ejecución Laravel real en sandbox, identificar runtime PHP, entorno fixture y aislamiento antes de boot; `route:list` también ejecuta proveedores, no es una mera lectura de fichero. Si no hay DB/vendor/ejecutable, entregar `SERVER_SOURCE_VERIFIED_SCOPED` más `QA_DB=BLOCKED_ENV`, **no** `PASS_E2E`.

C6. Preparar en un único archivo breve `SERVER_DEPLOY_READINESS.md` lo necesario para staging **sin desplegar**: PHP/extensiones y Laravel reales (no asumir versión 13), proveedor/dominio/TLS aún no elegido, raíces `public`, APP_DEBUG false, secretos aislados, respaldos/restore DB ensayables, migraciones no reversibles por rollback simple, scheduler/queues solo si existen. `SERVER_STAGING=NOT_AUTHORIZED`, `SERVER_PROD=NOT_TOUCHED` y `RELEASE=NO_GO` obligatorios. No crear otro documento de arquitectura.

## D. Entrega única, verificaciones y siguiente decisión

D1. Confirmar `git status` PRE/POST, SHA índice PRE/POST, staged 0, no cambios ajenos, no GitHub push/PR/merge. Inventariar POST de todos los archivos tocados. Candidato íntegro, snapshots y DIFF **solo** en `REPORT_ROOT\private`; no incluir fuentes ni parches en ZIP. `OFF_DEVICE_BACKUP=NO` hasta copia restaurable y autorizada en destino diferente de D:; no inventar autorización o enlace de backup.

D2. Crear **un solo ZIP** `REPORT_ROOT\delivery\JOR-N4-FULL-SOURCE-AND-SERVER-QA-20261121-UNICO.zip` con lista positiva mínima: `FINAL_REPORT.md`, `FULL_SOURCE_COVERAGE.csv`, `SOURCE_EXCLUSIONS_SUMMARY.md`, `CANDIDATE_SMOKE_RESULTS.csv`, `SERVER_SOURCE_SUMMARY.md`, `REAL_API_CONTRACT.csv` (**sin revelar endpoints privados sensibles**), `SERVER_E2E_RESULTS.csv`, `SERVER_DEPLOY_READINESS.md`, `BLOCKERS.md` (si aplica), `NEXT_GATE_MATRIX.md`, `WIP_GUARDS.csv`, `MANIFEST_SHA256.csv` y extractos SANITIZADOS solo si indispensables. No dar 12 informes separados fuera del ZIP; informe íntegro dentro. Nada de claves, hashes de contraseñas, tokens, `.env`, secretos, datos laborales, RUT/NIT, nombres de empleados, imágenes, seriales, logs crudos, SQL real con datos ni ZIP de código. Manifiesto de rutas relativas, SHA-256 y bytes de todos los miembros menos el propio manifiesto; verificar CRC, nombre único, no traversal/symlinks, integridad SHA y hash del ZIP externo.

D3. Cada puerta debe distinguir **observación directa** vs **reportado** vs **bloqueado**. Una CLI con exit 0 **no** certifica negocio si faltan aserciones. Asegurar que candidate smoke se clasifique por árbol privado y QA DB por esquema propio. No se acepta sumar pruebas históricas y actuales como si corrieran juntas.

```text
TASK=JOR-N4-FULL-SOURCE-AND-SERVER-QA-20261121
RESULT=PASS_SCOPED_CANDIDATE_AND_SERVER|PARTIAL_WITH_GAPS|BLOCKED_SOURCE|BLOCKED_CUSTODY|BLOCKED_CONCURRENT_WIP
WIP_BRANCH=<real>
WIP_HEAD=<real>
WIP_STATUS_PRE_POST=<counts_and_delta>
INDEX_SHA_PRE_POST=<sha_or_blocked>
SNAPSHOT_REUSED=YES_SCOPED|PARTIAL|NOT_AVAILABLE
SOURCE_COMPLETE_SCOPED=YES|NO|BLOCKED
SOURCE_PARITY=PASS_SCOPED|PARTIAL|NOT_RUN
CANDIDATE_HOST_SMOKE=PASS_SCOPED|BLOCKED_OFFLINE_CACHE|FAIL_PRODUCT|FAIL_ENV|NOT_RUN
SERVER_SOURCE_VERIFIED=PASS_SCOPED|PARTIAL|BLOCKED_SOURCE
SERVER_QA_DB=PASS_ISOLATED|BLOCKED_ENV|BLOCKED_IDENTITY|NOT_RUN
SERVER_MIGRATIONS=PASS_QA|FAIL|NOT_RUN
SERVER_E2E=<N_PASS>/<N_FAIL>/<N_BLOCKED>/<N_NOT_RUN>
SERVER_STAGING=NOT_AUTHORIZED
ANDROID_NATIVE=NOT_RUN
OFF_DEVICE_BACKUP=NO
WIP_PUBLISHED_GITHUB=NO
H9_GLOBAL=NO_GO
B22=NOT_AUTHORIZED
RELEASE=NO_GO
ZIP_PATH=<verified_local_path>
ZIP_SHA256=<verified_digest>
NEXT_OWNER=CHATGPT_DIRECTOR
```

**Después de N4 (no ejecutarlo dentro de N4):** Director adjudica resultado, solicita aprobación del destino de backup privado/off-device, prepara una integración de código con revisión de secretos y autorización, retoma Android físico y servidor staging según sus gates. **No hay release hasta GO humano.**