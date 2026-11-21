# CODEX LUNA — JORNATO N3 · MACROBLOQUE PRODUCTIVO ÚNICO: UI REAL DEL KIOSCO OFFLINE + CANDIDATO DE INTEGRACIÓN AISLADO

**ORDEN PARA EJECUCIÓN, NO PARA REDACTAR OTRA AUDITORÍA.** Fecha de emisión 2026-11-21 (America/Bogota). Director: ChatGPT. Ejecutor: Codex Luna. Esta orden **SUSTITUYE N2-R1 SOLO PORQUE N2-R1 YA TERMINÓ**. No reiniciar N1/N1-R2/N2/N2-R1 ni una suite aprobada por costumbre. Si detectas un N3 ya ejecutado o un agente trabajando, STOP y retorna su evidencia en vez de duplicarla. No inventes datos que no están a tu alcance; no pidas al propietario ejecutar pruebas.

```text
TASK=JOR-N3-UI-OFFLINE-INTEGRATION-CANDIDATE-20261121
MODE=PRODUCTIVE_SINGLE_MACROBLOCK
SOURCE_ROOT=D:\codex\Jornato
OUTPUT_ROOT=D:\codex\_REPORTES\Jornato\JOR-N3-UI-OFFLINE-INTEGRATION-CANDIDATE-20261121
DOCS_REPO=sierraglobalcompany-rgb/Jornato
DOCS_AUTHORITY=docs/CODEX_LOTE_ACTUAL.md on PR #2
WIP_BRANCH_HISTORICAL=codex/jor-b08-h4-domain-20261025
WIP_HEAD_HISTORICAL=faf5fe283191f8b5a2724b397009512a2caec1b6
REMOTE_PR3_HEAD_OBSERVED=104469b119752f395cf9881e732d582feab9db4e
N2_R1_RESULT=PASS_HOST_SCOPED
N2_R1_ZIP_SHA256=CC4846C6D901564E246D17B8A28C2B28A772F5A76E00442E0A3BFD19D19B04DB
N2_R1_HOST_TESTS=7_FILES/86_PASS/0_FAIL/0_SKIP
N2_R1_ANALYZE_AND_FORMAT=REPORTED_PASS
N2_R1_CHANGED_PATH=test/kiosk_repository_test.dart (FORMAT_ONLY)
N2_R1_KIOSKSCREEN_ACTIONS=ESCRITO_NO_PROBADO
OFF_DEVICE_BACKUP=NO
ANDROID_NATIVE=NOT_RUN
RELEASE=NO_GO
NEXT_OWNER_AFTER_ZIP=CHATGPT_DIRECTOR
```

## A. Reglas, permisos y decisiones ya cerradas

1. PingPongLaw L1 **KISS/Ponytail**, L2 sin ruido ni auditorías repetidas, L3 causa raíz y propietario único, L4 UX humana, L5 oráculo verificable/independiente, L6 un macrobloque y un ZIP. Una única fuente de eventos, un motor de jornadas y el almacén ya existente. No agregar motor de reglas, arquitectura nueva, paquetes, schema, migraciones, mocks de producción o capas paralelas para evitar un bloqueo.
2. **Prohibiciones esta tarea:** no teléfono, ADB, AVD, logcat, install/uninstall/force-stop, `flutter drive`, integraciones con dispositivo ni Android; no red Pro/tenant/servicios reales; no crear cuentas; no ejecutar tests de integración física. El APK QA de C2 V5 permanece instalado según evidencia anterior. No tocar otros proyectos ni procesos ajenos.
3. **Git y privacidad:** WIP fuente: `git status`, `git diff`, `git ls-files`, `git cat-file` y hashes son consultas permitidas. Prohibidos sobre fuente: `git add`, `commit`, `push`, `fetch`, `pull`, `merge`, `cherry-pick`, `rebase`, `reset`, `clean`, `checkout`, `stash`, cambiar rama, borrar/corregir otros cambios. No fusionar PR1/PR3 ni publicar archivos no registrados a repositorio público. **Sí** puedes crear una copia aislada de solo lectura del origen bajo `OUTPUT_ROOT/private` y prepararla para integración; no realices un push o commit a remoto, aunque sea privado, sin autorización previa y comprobación de acceso y secretos.
4. Solo se permiten ediciones de **código fuente de la vertical kiosk offline y sus pruebas vecinas** si se demuestra una brecha funcional concreta. No ampliar a nómina, jornadas legales por ciudad, Pro, backend, RR. HH., identidad, roles, pagos, B22 ni reglas OD01–OD08. Mantener `requestId` y legado `requetId` intactos; `SERVER_STORED` ≠ `RECOGNIZED`; B19/B20 deny-all.
5. Reutilizar el N2-R1: Flutter **3.47.8** y Dart **3.13.7** locales vía `android/local.properties`; `flutter analyze` completo PASS y las siete suites host **86 PASS**, sin Fails/Skips, atribuibles al SHA histórico documentado. **NO repetir** los siete archivos si sus propietarios/hashes no cambian. `KioskScreen` acciones reales y desconexión/UI host no están cubiertas por esos PASS; esta es la causa concreta de N3. No interpretar que el SDK existía en el PATH o que el host C2 y N1-R2 eran idénticos.

## B. Preflight mínimo y preservación del WIP

6. En `SOURCE_ROOT` verificar lectura de HEAD, rama, `git status --porcelain=v1 -uall`, staged e índice (hash), sin alterar ninguno. El histórico es 234 entradas (11 tracked, 223 untracked), staged=0, HEAD `faf5fe...`. **No exige igualdad literal** si ya hubo un cambio humano: distinguir cambio concurrente de cambio legítimo. Verificar sólo los SHA relevantes de N2-R1, entre otros `lib/src/ui/kiosk_screen.dart` `A17451E4A4AF8C52EAA5E146315B7CB05B68FAE74C389078E0F6D22D24C1DBF0`, `lib/src/persistence/kiosk_time.dart` `FDD87100E3D4312FC4618453D293ABFFBD6BD66619327B888DBE63FBB0B7A60A`, `lib/src/ui/kiosk_employee_today_card.dart` `ECA3BE12DB27CE697199D48906068A315787E4FC89582A1FAD01F9FBF0223222`, test `test/kiosk_repository_test.dart` POST `9274554AB462FE3E4BF8A578C38FA11CEECD669DFE3F9338E8260ACBF1397C39`. Si hay divergencia, registrar y ajustar delta responsable; no sobrescribir.
7. Antes de tocar archivos, comprobar la **custodia reutilizable** de N1-R2: snapshot privado de 216 archivos/2.904.617 bytes y 216/216 hashes reportados en N2, muestra de restauración 5/5; cotejar existencia e integridad de **archivos que se vayan a modificar**, sin copiar de nuevo 216 rutas ni repetir restauración muestral como rito. Si un archivo objetivo no está custodiado, guardar su PRE fiel bajo `OUTPUT_ROOT/private/pre_edit/` con hash y volver a comprobar; si no se puede, `BLOCKED_CUSTODY`, sin editar.
8. Mantener `OUTPUT_ROOT/private` separado de `OUTPUT_ROOT/delivery`. No incluir fuentes, bases de datos, clientes, secretos, tokens, serial Android, diffs íntegros, snapshots, logs crudos ni rutas de empleados en el ZIP. Preservar todo eso **solo en private local**, que continúa en D: y **NO es respaldo externo**. No hacer búsquedas indiscriminadas en discos ni en proyectos ajenos.
9. Si se detecta actividad concurrente/archivos cambiantes no atribuibles, detener ediciones nuevas, conservar evidencia sanificada en un solo ZIP y marcar `BLOCKED_CONCURRENT_WIP`. No intentar corregir con resets o comparaciones destructivas.

## C. Cerrar la brecha funcional real de `KioskScreen` desde host, sin Android

10. **Entrada obligatoria**: `KIOSK_GATE_MATRIX.csv` del ZIP N2-R1 clasifica `Pantalla de jornada=ESCRITO_NO_PROBADO` y `Límite offline=ESCRITO_NO_PROBADO`; las otras seis áreas de dominio/SQLite/tiempo tienen evidencia host scoped. Leer **solo** `lib/src/ui/kiosk_screen.dart`, `lib/src/persistence/kiosk_time.dart`, `lib/src/ui/kiosk_employee_today_card.dart`, pruebas relacionadas y seam de reloj/almacén existentes. Verificar si un test de widget actual ya ejerce la rama real de botones de `KioskScreen` antes de crear otro. No construir un runner de integración distinto.
11. Fijar una **matriz de acciones realmente visibles y ejecutables**, representativa del contrato vigente: (a) instante previo al fin planificado del turno nocturno, (b) exactamente en el fin planificado, (c) después del fin; (d) cruce medianoche conservando fecha de servicio; (e) jornada activa, pausada y cerrada; (f) marca duplicada y error no deben producir UI engañosa; (g) acumulado rotulado como `provisional/referencial`, nunca total de nómina. Cada caso necesita oráculo de botón real habilitado/deshabilitado y, donde corresponda, acción real desencadenada en dependencia falsa/local. No dar por cubierto un widget porque el helper `kiosk_time_test.dart` pasó.
12. Comprobar reloj controlable y data fixture **sintética**, no horas reales del usuario. Usar las interfaces ya existentes para inyectar reloj/repo a nivel de widget. Si **no hay seam**, introducir **solo una pequeña adaptación en el propietario de UI**, de forma compatible y opcional, para habilitar test directo; no extraer una segunda máquina de estados ni duplicar el cálculo temporal. Si la adaptación exige alterar API/contrato público, proveedor nuevo, schema o más de un nuevo motor, registrar `BLOCKED_MISSING_TEST_SEAM`, conservar el resto y no parchear. No usar `Future.delayed` prolongados ni timers de reloj real: controlar `pump`, timers falsos o el seam existente.
13. Offline host: montar el mismo árbol de UI/kiosco con fixtures sin red, instrumentar sólo las dependencias HTTP/sync que el flujo realmente use para que cualquier solicitud se registre y falle. Criterio `OFFLINE_UI_HOST_PASS` requiere que el flujo de marcación y render funcione sin red **y** el spy de esas dependencias reporte 0 llamadas. No afirmar aislamiento de red global por el simple hecho de que el test Flutter se ejecutó local. Si el kiosco no tiene acceso a red, mostrar ausencia en el grafo de dependencias; marcar cobertura focal, no Android modo avión.
14. **Implementación útil, no auditoría:** si ya existen oráculos directos que cubren los puntos 11 y 13 al mismo SHA, reutilizarlos con evidencia y no modificar. Si no, crear **un solo archivo de prueba específico** (preferido `test/kiosk_screen_actions_test.dart` cuando no exista) aprovechando el harness `flutter_test` existente y fixtures del repositorio; insertar cambios productivos mínimos sólo cuando el nuevo test demuestre fallo o comportamiento engañoso. Agrupar causas relacionadas del mismo flujo, no detenerse tras el primer bug.
15. Ejecutar únicamente los tests **nuevos o afectados** con Flutter/Dart local cacheado, evitando descargas: antes validar de nuevo stamps/artefactos usados de N2 (sin escaneo global de disco), package-config y DLL sqlite que el test use. `--no-pub` NO garantiza no actualización de caché; no iniciar CLI si no se verifican artefactos host. No disparar discovery del dispositivo. Para el nuevo test, `flutter test --no-pub test/kiosk_screen_actions_test.dart` si corresponde. Si código de kiosco/repo/tiempo existente cambió, reejecutar *solo* tests vecinos dependientes; se permite una regresión focal tras corregir errores del mismo propietario. Análisis/fmt de archivos afectados y baseline previo del resto, no reanálisis completo por rito.
16. Reportar **todas** las aserciones ejecutadas con conteos reales; distinguir `TEST_SOURCE_PRESENT`, `TEST_EXECUTED_PASS`, `TEST_FAIL`, `BLOCKED_TEST_SEAM`, `OFFLINE_UI_HOST_PASS`, `OFFLINE_ANDROID_NOT_RUN`. Si la UI no puede instanciarse en host sin alterar contratos, no inventar mocks, no tomar screenshot sintético como certificación real de Android; entregar `PARTIAL_UI_BLOCKED_SEAM` y dejar un único requisito mínimo de desbloqueo. Una suite host nunca acredita SQLCipher Android ni Keystore.

## D. Candidato privado de integración GitHub — trabajo productivo sin publicar secretos

17. **Problema real:** 223 rutas WIP `untracked` y 11 tracked modificadas según informe; los PR #1 F0 y #3 F0 Draft **no contienen el árbol avanzado actual**. PR #3 HEAD observado `104469b119752f395cf9881e732d582feab9db4e`; su script de conciliación viejo usa `78b32284...`. **No copiar PR3 sobre el código local ni reconciliar de nuevo los mismos cinco nombres sin cambios**: reutiliza `PR3_WIP_MATRIX.csv` N1-R2. Solo comprobar identidad remota PR3 si ya hay acceso read-only autorizado, y diferencia material desde esa matriz.
18. Crear **un candidato limpio exclusivamente en** `OUTPUT_ROOT/private/integration_candidate`, NO dentro del WIP. Preferir clon Git **local sin red** de la fuente `SOURCE_ROOT` a `integration_candidate` (sin hardlinks, sin arrastrar `.git` del WIP con su estado o aplicar `git add` en origen). Si ese método implica sobrescribir datos, parar y usar copia selectiva por manifiesto. Superponer únicamente **archivos fuente/recursos imprescindibles y sanos** del WIP necesarios para reconstruir Jornato (incluidos untracked), con rutas relativas preservadas; NO incluir `.env`, respaldos, bases, llaves, imágenes con empleados, logs, APK, cachés de build, paquetes vendor, secretos, ni directorios de otros proyectos. Reutilizar snapshot N1-R2 pero revalidar hashes de los archivos realmente copiados.
19. Producir en `private/` **inventario de cobertura**: (a) fuentes tracked en HEAD recuperables por Git, (b) modificados relevantes incluidos, (c) untracked relevantes incluidos, (d) omitidos seguros por tipo, (e) faltantes funcionales que impedirían compilar, (f) datos excluidos que serían necesarios para instalación pero NO publicables. Conservar PRE/POST SHA y una verificación sobre **candidato reconstruido**, pero NO confundir muestra 5/5 con restauración integral. Si un archivo requerido no está disponible/autorizado, `CANDIDATE=PARTIAL_MISSING_INPUT` y no simular completitud.
20. **Verificación candidata sin repetir tests:** determinar que los mismos archivos de programa/QA utilizados por N2 y por la nueva prueba UI están presentes con hash y nombres estables en el candidato; comprobar `pubspec.yaml`, `pubspec.lock`, `analysis_options.yaml`, manifests y recursos referenciados, sin descargar dependencias. Ejecutar **a lo sumo un smoke de import/compilación host focal solo si existe una diferencia real** en el candidato y hay SDK/cache; en igualdad exacta reutilizar el PASS N2 por SHA. Guardar resultado `SOURCE_CANDIDATE_READY_LOCAL|PARTIAL_MISSING_INPUT|BLOCKED_PRIVACY`, no declarar producto integrado/público ni release. No hacer commit/push en ningún remoto.
21. **Salida hacia GitHub:** en la matriz pública de retorno solo informar `GITHUB_DOCS_UPDATED_BY_DIRECTOR=YES` y `PRODUCT_WIP_PUBLISHED=NO`. Crear un plan mínimo `PRIVATE_PUBLISH_PLAN.md` con destino *pendiente de confirmación*, lista de categorías y pasos: escoger repositorio **privado** ya autorizado o nuevo destino privado que apruebe el propietario, verificar privacidad/propietario/permisos, análisis de secretos y PII en la totalidad del candidato, commit/PR de código desde el **candidato aislado**, revisión y push autorizado, manteniendo PR2 de documentos sin merge automático. **No crear ni empujar código al repositorio público `sierraglobalcompany-rgb/Jornato`, aunque se solicite “mantener GitHub al día”**, porque este lote no acredita ausencia de secretos ni autorización de divulgación del WIP. No pedir repetir N3 para redactar este plan.
22. `OFF_DEVICE_BACKUP=NO` hasta que exista copia verificable en otro medio físico o almacenamiento privado autorizado, con integridad y restauración. El candidato bajo D: es **otra copia local, no respaldo frente a pérdida del equipo**. Si existe destino privado ya autorizado por orden previa, anotar opción y condiciones, pero no subir ni transferir WIP en este lote. Prioridad de la próxima decisión del Director: custodiar remotamente antes de publicar o realizar cambios grandes.

## E. Entrega y puertas de aceptación

23. Crear **UN ZIP** `OUTPUT_ROOT/delivery/JOR-N3-UI-OFFLINE-INTEGRATION-CANDIDATE-20261121-UNICO.zip`; si ya existe, no sobrescribir. Lista positiva: `FINAL_REPORT.md`, `UI_ACTION_MATRIX.csv`, `HOST_UI_RESULTS.csv`, `OFFLINE_DEPENDENCY_EVIDENCE.md`, `CANDIDATE_REBUILD_SUMMARY.md`, `CANDIDATE_COVERAGE.csv` sanitizada, `PRIVATE_PUBLISH_PLAN.md`, `WIP_GUARDS.csv`, `NEXT_GATE_MATRIX.md`, `BLOCKERS.md` cuando proceda y `MANIFEST_SHA256.csv`. Añadir **solo logs sanitizados estrictamente necesarios**, no código fuente ni parche. No incluir token, URLs internas con credenciales, nombres de empleados, datos, rutas de `private` con información sensible ni volcado de entorno.
24. Verificación rigurosa del ZIP: 1 ruta cada entrada; sin duplicados, symlink, `..`, ruta absoluta ni secretos obvios; CRC legible; manifiesto SHA-256 + bytes para todas las entradas excepto el propio manifiesto; SHA-256 del ZIP externo; abrirlo otra vez y comprobar. Reportar `TASK`, `RESULT`, `HOST_UI`, `OFFLINE_UI_HOST`, `SOURCE_CANDIDATE`, `CANDIDATE_COVERAGE`, `OFF_DEVICE_BACKUP`, `WIP_STATUS_PRE_POST`, `STAGED_PRE_POST`, `SOURCE_HEAD`, `CHANGED_FILES`, `TESTS_EXECUTED`, `N2_REUSED_PASS`, `ANDROID_NATIVE`, `GITHUB_WIP_PUBLISHED`, `H9_GLOBAL`, `RELEASE`, `ZIP_PATH`, `ZIP_SHA256`, `NEXT_OWNER`.
25. **PASS completo solo dentro de los gates siguientes**: `HOST_UI=PASS_SCOPED` requiere prueba de acciones REALES de `KioskScreen` y su estado nocturno, no solo helper; `OFFLINE_UI_HOST=PASS_SCOPED` requiere pruebas de cero llamadas a dependencias de red o evidencia de dependencia imposible; `SOURCE_CANDIDATE=READY_LOCAL` requiere inventario y reconstrucción verificables. Si alguno no se completa, `PARTIAL_WITH_GAPS` **con causa concreta**, preservando lo logrado. No inventar certificación Android, respaldo externo, integración GitHub o release.
26. No realizar una segunda auditoría del prompt o segundo lote; este es el **macrobloque**. Al terminar, devolver literalmente el resumen reproducible y la ruta del ZIP único. **NEXT_OWNER=CHATGPT_DIRECTOR** para inspección y decisión sobre destino de respaldo privado/actualización del repositorio de producto y QA Android. Nunca reclamar que un ZIP en D: sea enlace descargable por ChatGPT: el propietario debe adjuntarlo al chat.

```text
TASK=JOR-N3-UI-OFFLINE-INTEGRATION-CANDIDATE-20261121
RESULT=PASS_HOST_UI_SCOPED_AND_CANDIDATE_LOCAL|PARTIAL_WITH_GAPS|BLOCKED_CUSTODY|BLOCKED_CONCURRENT_WIP|BLOCKED_PRIVACY|BLOCKED_TOOL|SUPERSEDED_BY_NEWER_RUN
HOST_UI=PASS_SCOPED|PARTIAL_WITH_GAPS|BLOCKED_TEST_SEAM|NOT_RUN
OFFLINE_UI_HOST=PASS_SCOPED|PARTIAL_WITH_GAPS|NOT_RUN
SOURCE_CANDIDATE=READY_LOCAL|PARTIAL_MISSING_INPUT|BLOCKED_PRIVACY|NOT_RUN
CANDIDATE_COVERAGE=<reconstruidas/esperadas o NOT_MEDIBLE>
OFF_DEVICE_BACKUP=NO
SOURCE_HEAD=<sha observado>
STAGED_PRE_POST=<valor>
WIP_STATUS_PRE_POST=<resumen>
CHANGED_FILES=<rutas focales o NONE>
TESTS_EXECUTED=<archivos, PASS/FAIL/SKIP o NOT_RUN>
N2_REUSED_PASS=7_FILES_86_PASS_0_FAIL_0_SKIP_AT_N2_SOURCE_HASHES
GITHUB_WIP_PUBLISHED=NO
ANDROID_NATIVE=NOT_RUN
RESTART_READBACK_ANDROID=BLOCKED_HARNESS
TENANT_ISOLATION_ANDROID=BLOCKED_CONTRACT
PRO_HTTP_DB=BLOCKED_CONTRACT
H9_GLOBAL=NO_GO
B22=NOT_AUTHORIZED
RELEASE=NO_GO
ZIP_PATH=<ruta absoluta comprobable de la entrega única>
ZIP_SHA256=<sha256 verificado>
NEXT_OWNER=CHATGPT_DIRECTOR
```

**ORDEN DE PRIORIDAD SI EL TIEMPO/RECURSOS SE AGOTAN:** (1) preservar WIP y límites; (2) test de acciones reales `KioskScreen`; (3) cobertura de flujo offline; (4) preparar candidato de integración local privado y plan de publicación; (5) único ZIP. Entrega parcial medible antes que otro prompt o prueba repetida.

# 🔴🚨 CONTINÚA CODEX LUNA — N3 PRODUCTIVO EN UNA EJECUCIÓN. DESPUÉS DEL ZIP: CHATGPT DIRECTOR. 🚨🔴