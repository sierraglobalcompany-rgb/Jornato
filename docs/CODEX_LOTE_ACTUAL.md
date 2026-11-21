# CODEX LUNA — JORNATO · N3-R1 · MACROBLOQUE PRODUCTIVO ÚNICO: UI REAL OFFLINE + CANDIDATO RECONSTRUIBLE PRIVADO

> **EJECUTA, NO AUDITES DE NUEVO EL PROMPT.** Revisión correctiva focal de la orden N3; **MISMO `TASK`**, NO es N4 ni una campaña adicional. ChatGPT Director define decisiones; Codex Luna implementa y produce evidencia. **PRECEDENCIA:** este Markdown reemplaza la N3 anterior SOLO si N3 aún no empezó. Si N3 original está en ejecución, existe un ZIP N3 posterior, o algún otro Codex modifica el WIP, **NO iniciar N3-R1 en paralelo ni repetir pruebas**: devolver `SUPERSEDED_BY_IN_FLIGHT_OR_NEWER_RUN` con el estado observado, sin intervenir.

```text
TASK=JOR-N3-UI-OFFLINE-INTEGRATION-CANDIDATE-20261121
PROMPT_REVISION=N3-R1-20261121
WIP_ROOT=D:\codex\Jornato
OUTPUT_ROOT=D:\codex\_REPORTES\Jornato\JOR-N3-UI-OFFLINE-INTEGRATION-CANDIDATE-20261121
REMOTE_REPO=sierraglobalcompany-rgb/Jornato
DOCS_BRANCH=docs/pingponglaw-l1-l6-canon-84e961c
WIP_BRANCH_LAST_REPORTED=codex/jor-b08-h4-domain-20261025
WIP_HEAD_LAST_REPORTED=faf5fe283191f8b5a2724b397009512a2caec1b6
PR3_LAST_OBSERVED=104469b119752f395cf9881e732d582feab9db4e
N2_R1_RESULT=PASS_HOST_SCOPED
N2_R1_ZIP_SHA256=CC4846C6D901564E246D17B8A28C2B28A772F5A76E00442E0A3BFD19D19B04DB
N2_R1_HOST_TESTS=7_FILES;86_PASS;0_FAIL;0_SKIP
UI_ACTIONS_KIOSKSCREEN=NOT_PROVEN
ANDROID_C2_NATIVE=NOT_RUN
OFF_DEVICE_BACKUP=NO
RELEASE=NO_GO
NEXT_OWNER_AFTER_ZIP=CHATGPT_DIRECTOR
```

## 0 — Reglas de mando y alcance decidido

**PingPongLaw:** L1 KISS/Ponytail (un motor, una fuente de eventos y almacén local existente); L2 cero ruido ni suites repetidas; L3 arreglar causa en propietario real, no parches; L4 estados de UI humanos y veraces; L5 evidencia independiente y clasificación acotada; L6 una ejecución/producto/ZIP, no pingpong. **Objetivo verificable N3:** (A) demostrar con widget test host las acciones reales de `KioskScreen` alrededor de turnos nocturnos y corregir defectos en el mismo flujo; (B) demostrar límite offline con dependencias reales de esa pantalla; (C) producir un candidato local privado reconstruible desde HEAD + cambios/untracked, sin filtrar código a GitHub. El resultado puede ser parcial causal: **no fabricar PASS**.

**Prohibiciones:** NO usar teléfono, ADB, logcat, AVD, instalación/arranque de APK, `flutter run`, `flutter drive`, Android físico; NO red Pro, producción, cuentas reales, credenciales ni RR.HH. / pagos; NO instalar SDK, plugins, dependencias ni hacer `pub get`, `precache` o descargas. Flutter/Dart host **solo** si siguen presentes y caché completa como N2. NO tocar otros proyectos. En el WIP: NO `git add`, `commit`, `push`, `fetch`, `pull`, `merge`, `checkout`, `reset`, `clean`, `stash`, `rebase`, `cherry-pick`, ni mutar index/branch. Solo consultas `git status`, `git diff`, `git ls-files`, `git cat-file`, `git archive` de HEAD y hashes. El PR #2 es **documentación**, PR #3 es F0 separado, **no** son copia del WIP. NO publicar ni empujar código a GitHub público o privado sin autorización específica y revisión de secretos. Mantener contratos `requestId`/legado `requetId`, `SERVER_STORED` distinto de `RECOGNIZED`, B19/B20 deny-all, OD01–OD08 sin decisión nueva.

**No reabrir:** C2 V3–V5, N1/N1-R2, N2/N2-R1; no repetir las siete suites host (86 PASS) si sus archivos propietarios/hashes siguen iguales. NO ejecutar la vieja conciliación PR3 ligada a `78b32284...` ni copiar PR3 sobre WIP.

## 1 — Preflight de seguridad, 1 vez, sin búsqueda global

1. Confirmar `WIP_ROOT`, `OUTPUT_ROOT` fuera del árbol WIP y no sobre red/junction; leer `git rev-parse HEAD`, rama, status `--porcelain=v1 -uall`, cero staged, hash del índice y SHA-256 de archivos de enfoque. Historial indicativo: 234 rutas (223 untracked, 11 modified), HEAD `faf5fe...`; **no exigir 234 si otro cambio legítimo ocurrió**, pero identificar cada delta nuevo. Si agente concurrente, salida `BLOCKED_CONCURRENT_WIP`, sin editar.
2. Buscar primero una entrega N3 previa en `OUTPUT_ROOT/delivery` y resultados superiores a N2-R1. Si existe ZIP N3, no sobrescribir ni rerun; informar `SUPERSEDED_BY_IN_FLIGHT_OR_NEWER_RUN`. No crear una segunda carpeta de la misma tarea para escapar esta regla.
3. Reutilizar sin rehacer snapshot N1-R2 (216 archivos/2.904.617 B y 5/5 restauración reportados; verificación 216/216 reportada en N2). Confirmar custodia de **cada fichero que realmente vaya a editarse** con hashes PRE y copia privada bajo `OUTPUT_ROOT/private/pre_edit` si falta. Todo está en `D:`: `OFF_DEVICE_BACKUP=NO` de principio a fin; la copia local no resuelve pérdida del equipo. Rechazar symlinks/junctions/hardlinks para archivos de transferencia. Si no cabe una copia o falla integridad, `BLOCKED_CUSTODY` y salida ZIP con causas.
4. Registrar baseline relevante de N2: `lib/src/ui/kiosk_screen.dart` SHA256 `A17451E4A4AF8C52EAA5E146315B7CB05B68FAE74C389078E0F6D22D24C1DBF0`, `lib/src/persistence/kiosk_time.dart` `FDD87100E3D4312FC4618453D293ABFFBD6BD66619327B888DBE63FBB0B7A60A`, `lib/src/ui/kiosk_employee_today_card.dart` `ECA3BE12DB27CE697199D48906068A315787E4FC89582A1FAD01F9FBF0223222`, `test/kiosk_repository_test.dart` `9274554AB462FE3E4BF8A578C38FA11CEECD669DFE3F9338E8260ACBF1397C39`. Si difieren, averiguar causa solo en ese fichero; no asumir regresión o aprobar suites basadas en SHA antiguo.
5. **Etiquetar origen de afirmaciones:** `DIRECT_HOST` (observado en esta campaña), `REPORTED_PREVIOUS` (ZIP N2), `INFERRED` y `NOT_VERIFIED`. No presentar igualdad de HEAD local y PR1 como igualdad de working tree.

## 2 — Test de la pantalla real: datos, estímulo y oráculo (primero el producto)

6. Inspeccionar únicamente propietarios reales del kiosco (`lib/src/ui/kiosk_screen.dart`, cálculo nocturno `lib/src/persistence/kiosk_time.dart`, tarjeta local `lib/src/ui/kiosk_employee_today_card.dart`, repositorio e interfaces **que se importen de verdad**, tests vecinos). **No dibujar UI alternativa ni probar solo helpers.** Localizar constructor real, ruta real de navegación, inyección existente de reloj/repositorio, cálculo de habilitación de acciones y respuesta visible del botón. Si ya existe test widget que ejerza **esa misma rama** con el **mismo SHA**, usarlo focalmente y no crear un test redundante.
7. Fijar como datos sintéticos un turno que inicia el día D, cruza medianoche y termina planificadamente el día D+1; usar instantes fijos `Tfin - 1 segundo`, `Tfin` y `Tfin + 1 segundo`. Añadir estado en progreso, en pausa y finalizado. No inventar política laboral: el resultado esperado de habilitación exacto en el límite debe derivarse de la implementación/requisito nocturno **ya aprobado en N1-R2**; registrar en matriz la regla concreta y su fuente. No confundir zona horaria local con UTC, ni fecha natural con fecha de servicio.
8. Para **cada caso accionable** usar `WidgetTester` sobre `KioskScreen` verdadero (con inyección existente de repo fake local o SQLite FFI sintético), comprobar **texto y estado real** del botón, enviar `tap`, `pump` acotado, y verificar **efecto observable en el repositorio existente y re-render**. Verificar que duplicados/conflictos y errores no aparenten guardar una marcación inexistente. Confirmar etiqueta `provisional/referencial` en acumulado, nunca nómina. No vale PASS solo porque `kiosk_time_test.dart` o la tarjeta pasaron.
9. Control de tiempo: preferir seam de reloj/almacén ya presente y reloj fijo. No usar `DateTime.now()` real como oráculo ni `Future.delayed` prolongados; evitar `pumpAndSettle()` sin límite si la pantalla tiene timer periódico. **Si no hay seam**, permitir SOLO un parámetro/callback opcional mínimo en el propietario UI (mantener camino de producción original, no cambiar contrato externo, no agregar estado/motor nuevo). Si requiere DB nueva, DI framework, nuevo servicio, schema o cambio contractual, NO implementarlo: `BLOCKED_TEST_SEAM`, explicar mínima decisión necesaria; continuar la parte independiente del candidato.
10. Preferir **un único archivo nuevo** `test/kiosk_screen_actions_test.dart` si no existe; si ya existe, ampliarlo sin sobrescribir casos del usuario. Agrupar varios casos alrededor del mismo mecanismo de UI, no scripts paralelos. **Primero test que reproduce el defecto**; si falla por un defecto propio, corregir en la clase dueña, verificar que el test pase, probar solo regresión vecina afectada. Si no hay fallo funcional pero faltaba cobertura, crear prueba y **no introducir cambios productivos fingidos**.

## 3 — Límite offline real del host: no aprobar por un spy decorativo

11. Dibujar en `OFFLINE_DEPENDENCY_EVIDENCE.md` el camino real que `KioskScreen` invoca al pulsar botón hasta repositorio/SQLite y al renderizar. Enumerar importaciones y puntos de acceso HTTP, sockets, sync/outbox o servicios; limitar al flujo en cuestión. No auditar el backend ni todas las pantallas.
12. Montar un fixture local y ejercer la **ruta real** de UI con una barrera observable antes de cualquier posible cliente de red de la aplicación; puede ser la interfaz HTTP/sync **efectivamente inyectada** o una anulación host de `HttpClient` si cubre de verdad los clientes utilizados. **No instalar un spy al que el código no llega**. Contabilizar llamadas y fallar explícitamente ante cualquier intento. Si no hay ninguna dependencia red en esa ruta, respaldarlo con inspección de imports/call graph focal y ejecución sin red; clasificar `OFFLINE_UI_HOST_PASS_SCOPED` solo respecto del camino cubierto. No confundir esto con Android en modo avión ni afirmar que toda la aplicación carece de red.
13. Registrar por caso `UI_ACTION_MATRIX.csv`: `ID`, `fuente de política`, `instante fijo/estado`, `componente real`, `control visible`, `tap`, `cambio en repositorio`, `render posterior`, `red intentada`, `resultado`, `test SHA`. No inventar `PASS` cuando la prueba no ejecutó la ruta. Si necesita datos de empleados, usar identificadores sintéticos genéricos y fechas ficticias, no datos reales.

## 4 — Prueba host: sin descargas y sin repetir las 86

14. Reutilizar el Flutter 3.47.8 / Dart 3.13.7 ya recuperado en N2 por `android/local.properties`, sujeto a validación **local** de `package_config`, stamps, tester/engine y SQLite FFI; nunca ejecutar CLI si falta caché. `--no-pub` no impide por sí solo `cache.updateAll`. No `pub get`, red, AVD ni Android. Validar que el test tiene un archivo local y que no invoca hardware ni instalaciones.
15. Ejecutar `flutter test --no-pub --reporter=json test/kiosk_screen_actions_test.dart` (o ruta preexistente concreta de test focal) una campaña para obtener casos, resultados y exit. Si cambió `kiosk_screen.dart`, `kiosk_time.dart`, `kiosk_repository.dart` u otra dependencia cubierta por N2, **repetir solo los tests afectados por ese cambio**, no todos los siete sin causalidad; guardar lista y hashes PRE/POST por cada suite reejecutada. Analizar/formatear SOLO rutas modificadas y comprobación relevante. Si test se bloquea por tooling o seam, clasificar `BLOCKED_TOOL`/`BLOCKED_TEST_SEAM`, no crear un nuevo runner ni rehacer Android.
16. `HOST_UI=PASS_SCOPED` necesita acciones reales observadas (incluido límite nocturno) + efecto de escritura/lectura local + resultados host ejecutados sin FAIL/SKIP relevantes. `OFFLINE_UI_HOST=PASS_SCOPED` necesita la ruta verdadera bajo barrera de red o evidencia estructural fuerte, no solo cero llamadas a un objeto no utilizado. Anotar número de tests `PASS/FAIL/SKIP` **observado**; `TEST_SOURCE_PRESENT` es distinto de `TEST_EXECUTED_PASS`. Cualquier criterio esencial no ejecutado se mantiene `PARTIAL_WITH_GAPS`.

## 5 — Candidato privado reconstructible: HEAD limpio + overlay selectivo, no clon de trabajo

17. Trabajar SOLO bajo `OUTPUT_ROOT/private/integration_candidate` fuera del WIP. **Evitar `git clone` como método por defecto:** puede conservar metadatos `.git`/remotos o llevar a asumir erróneamente que la copia contiene cambios untracked. En vez de eso, hacer **exportación read-only de `HEAD`** mediante `git archive HEAD` hacia un archivo temporal bajo `private`, **con extracción segura** a una carpeta nueva vacía (rechazar symlinks, entradas absolutas, `..`, junctions y paths anómalos). Esa base contiene **solo lo comprometido**, NO los archivos modificados ni untracked; el candidato NO debe contener `.git`, hooks, referencias remotas ni credenciales. Si no se puede exportar de forma segura, usar copia focal por lista de blobs Git `HEAD` con SHA verificables; no inventar base a partir de un checkout sucio.
18. Superponer por **manifiesto explícito y mínimo** archivos de trabajo relevantes: (i) tracked modificados imprescindibles y (ii) untracked imprescindibles para ejecutar Jornato, además de pruebas y assets requeridos. Copiar **bytes reales** preservando la ruta relativa, nunca hardlinks; comprobar SHA del origen inmediatamente antes y después y SHA del destino. Excluir de forma predeterminada `.env`, `.git`, claves, credenciales, DB/data/PII de empleados, fotos, APK, cachés, logs, vendor, artefactos de build; NO incluir enlaces simbólicos ni recursos externos. No copiar automáticamente las 223 rutas untracked como si todas fueran publicables; contabilizar selección vs omitidos, por función/categoría, sin enumerar secretos en el ZIP.
19. **Puerta decisiva de integridad:** (a) enumerar fuente Git base exportada por número y hashes, (b) incluir toda dependencia local/asset realmente importado por los flujos y pruebas seleccionados, (c) comparar **huella conjunta** (`pubspec.yaml`, `pubspec.lock`, `analysis_options.yaml`, todos los Dart/recursos en las rutas de ejecución, tests focales y manifiestos de plataforma aplicables) entre WIP y candidato, (d) registrar faltantes, submódulos/LFS pointers si los hay y configuraciones excluidas, (e) contrastar candidate source POST con WIP fuente y con matriz `PR3_WIP_MATRIX.csv` **existente**; no rehacer conciliación de PR3 ni mergearla. `CANDIDATE_SOURCE_PARITY=PASS_SCOPED` solo si para la vertical escogida no hay faltantes y todos los hashes seleccionados coinciden. `CANDIDATE_COMPLETE_REPOSITORY=NOT_VERIFIED` salvo inventario íntegro más amplio (no exigido para N3).
20. **Verificación del candidato como candidato, no herencia ciega de N2:** si la huella de todos los propietarios relevantes y tests concuerda con la ejecutada en N2, heredar únicamente los **86 PASS históricos en su alcance exacto**, y acreditar paridad mediante hashes. Para el UI test nuevo, mostrar hash y resultado de la campaña presente. Si faltan `.dart_tool`/cache o el candidato no puede compilar por configuración excluida, clasificar separadamente `CANDIDATE_HOST_SMOKE=BLOCKED_ENV`, sin descargar dependencias ni cambiar el WIP. Si la configuración de host local permite compilar sin instalar nada, realizar **un solo smoke focal del candidato** (no reejecutar las 86 suites) y registrar exit/resultados. `SOURCE_CANDIDATE=READY_LOCAL_SCOPED` requiere exportación + overlay íntegra + paridad de fuentes y una comprobación de compilación host o justificación precisa de qué se verificó y qué queda `NOT_VERIFIED`; si no hay smoke y solo paridad, usar `SOURCE_CANDIDATE=PARITY_ONLY_NOT_COMPILED`, nunca READY por simple copia.
21. **Custodia y GitHub:** todo `private/` permanece en D:, **OFF_DEVICE_BACKUP=NO**. No crear repo remoto, no `push`, no cambiar visibilidad del repo público existente, no publicar fuentes. Crear plan corto para futuro repositorio **privado autorizado** o medio externo autorizado, con pasos: autorización de destino, revisión de secreto/PII en TODOS los archivos candidatos (no solo nombres), verificación de permisos, copia verificable fuera del equipo y restauración, commit/PR de código bajo autorización, decisión de qué hacer con PR1/PR3 y final de PR2. La publicación documental la hace ChatGPT. No afirmar GitHub actualizado con producto hasta que el código esté realmente subido y revisado.

## 6 — Entrega ZIP único, sanear y cerrar

22. Salidas que **sí** entran en `OUTPUT_ROOT/delivery/JOR-N3-UI-OFFLINE-INTEGRATION-CANDIDATE-20261121-UNICO.zip` (nunca sobrescribir): `FINAL_REPORT.md`, `UI_ACTION_MATRIX.csv`, `HOST_UI_RESULTS.csv`, `OFFLINE_DEPENDENCY_EVIDENCE.md`, `CANDIDATE_REBUILD_SUMMARY.md`, `CANDIDATE_COVERAGE.csv` **sanitizado**, `PRIVATE_PUBLISH_PLAN.md`, `WIP_GUARDS.csv`, `NEXT_GATE_MATRIX.md`, `BLOCKERS.md` solo si hay bloqueos, `MANIFEST_SHA256.csv`. Logs host **sanitizados y minimizados** solo si aportan evidencia; nada de código, test fuente, patch, snapshot, manifiesto privado completo, passwords, rutas de empleado, contenido de DB, token, serial, HTML sensible, dumps de ambiente ni APK. No meter ficheros ocultos o ignorados por acumulación accidental.
23. QA del ZIP: nombres normalizados, sin duplicados/traversal/absolutos/symlink, CRC PASS, SHA-256 + bytes de **todos** los miembros excepto manifiesto comprobados tras reabrir; SHA externo del ZIP y cotejo final. Enumerar hashes de los nuevos archivos de test y propietarios modificados **solo como hash/ruta no sensible**, para futura atribución. Distinguir `REPORTADO`, `OBSERVADO` e `INFERIDO`. Índice fuente staged 0; si se autorizaron ediciones focales, documentar delta exacto y preservación del resto (no exigir status 234 literal si aparece test untracked nuevo).
24. Si `HOST_UI`/`OFFLINE_UI_HOST`/`SOURCE_CANDIDATE` no pasan, entregar **PARTIAL_WITH_GAPS con causa individual**; no repetir N3 o pedir otra auditoría. `H9_GLOBAL=NO_GO`, `B22=NOT_AUTHORIZED`, `RELEASE=NO_GO` por Android y contratos pendientes. Un solo ZIP y después Director.

```text
TASK=JOR-N3-UI-OFFLINE-INTEGRATION-CANDIDATE-20261121
PROMPT_REVISION=N3-R1-20261121
RESULT=PASS_HOST_UI_SCOPED_AND_CANDIDATE_LOCAL|PARTIAL_WITH_GAPS|BLOCKED_CUSTODY|BLOCKED_CONCURRENT_WIP|BLOCKED_PRIVACY|BLOCKED_TOOL|SUPERSEDED_BY_IN_FLIGHT_OR_NEWER_RUN
HOST_UI=PASS_SCOPED|PARTIAL_WITH_GAPS|BLOCKED_TEST_SEAM|NOT_RUN
OFFLINE_UI_HOST=PASS_SCOPED|PARTIAL_WITH_GAPS|NOT_RUN
SOURCE_CANDIDATE=READY_LOCAL_SCOPED|PARITY_ONLY_NOT_COMPILED|PARTIAL_MISSING_INPUT|BLOCKED_PRIVACY|NOT_RUN
CANDIDATE_HOST_SMOKE=PASS_SCOPED|FAIL|BLOCKED_ENV|NOT_RUN
CANDIDATE_SOURCE_PARITY=PASS_SCOPED|PARTIAL|NOT_VERIFIED
CANDIDATE_COMPLETE_REPOSITORY=NOT_VERIFIED
OFF_DEVICE_BACKUP=NO
SOURCE_BRANCH=<read_only_observed>
SOURCE_HEAD=<read_only_observed>
STAGED_PRE_POST=<observed>
WIP_STATUS_PRE_POST=<observed_and_attributed>
CHANGED_FILES=<actual_or_NONE>
TESTS_EXECUTED=<file; PASS/FAIL/SKIP; exit; sha>
N2_REUSED_PASS=7_FILES_86_PASS_0_FAIL_0_SKIP_ONLY_AT_VALIDATED_SOURCE_HASHES
GITHUB_DOCS_ACTIVE=PR2
GITHUB_WIP_PUBLISHED=NO
ANDROID_NATIVE=NOT_RUN
RESTART_READBACK_ANDROID=BLOCKED_HARNESS
TENANT_ISOLATION_ANDROID=BLOCKED_CONTRACT
PRO_HTTP_DB=BLOCKED_CONTRACT
H9_GLOBAL=NO_GO
B22=NOT_AUTHORIZED
RELEASE=NO_GO
ZIP_PATH=<absolute_path_verified>
ZIP_SHA256=<actual_verified_hash>
NEXT_OWNER=CHATGPT_DIRECTOR
```

**EJECUCIÓN EN ORDEN:** preflight/custodia → test real de pantalla → barrera offline → correcciones causales focales → exportación HEAD+cambios a candidato privado → smoke/paridad → ZIP. Si se presenta un bloqueo en una dimensión, avanzar en las otras **independientes** sin nuevas herramientas ni romper seguridad. No repetir la QA N2, no cambiar la arquitectura, no otra auditoría.

# 🔴🚨 SIGUE CODEX LUNA — EJECUTAR N3-R1 SOLO SI N3 NO EMPEZÓ. DESPUÉS DEL ZIP: CHATGPT DIRECTOR. 🚨🔴