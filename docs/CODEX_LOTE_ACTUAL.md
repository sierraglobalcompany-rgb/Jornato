# CODEX LUNA — JORNATO — N1-R2 MACROBLOQUE ÚNICO DE EJECUCIÓN: CUSTODIA REAL + KIOSCO GRATIS LOCAL OFFLINE COMPLETO EN HOST

> **EJECUTAR, NO VOLVER A AUDITAR NI VOLVER A PEDIR OTRO PROMPT.** Este archivo **SUSTITUYE N1 original** (que limitaba la corrección a un solo defecto), y NO es otra versión de C2. Director = ChatGPT; manos = Codex Luna. Objetivo: completar **de punta a punta** la misma vertical kiosco offline usando clases y almacén existentes, arreglando todos los **defectos demostrados dentro de esa vertical** en un solo lote seguro, y proteger la fuente antes de editar. NUNCA declarar lanzamiento o PASS físico por pruebas de host. **Si ya existe un resultado posterior de N1/N1-R2, detenerse y devolver el ZIP previo sin repetir ejecución.**

```text
TASK=JOR-N1-R2-CUSTODIA-KIOSCO-OFFLINE-20261120
WIP=D:\codex\Jornato
OUTPUT=D:\codex\_REPORTES\Jornato\JOR-N1-R2-CUSTODIA-KIOSCO-OFFLINE-20261120
DOCS_GITHUB_PR=2
DOCS_AUTHORITY=docs/CODEX_LOTE_ACTUAL.md
GITHUB_REPO=sierraglobalcompany-rgb/Jornato
PR3_HEAD_OBSERVED_BEFORE_RUN=104469b119752f395cf9881e732d582feab9db4e
WIP_HEAD_HISTORICAL=faf5fe283191f8b5a2724b397009512a2caec1b6
C2_V5_RESULT=BLOCKED_VM_SERVICE
C2_V5_ZIP_SHA256=711116067DDBF73E7CE4AD6A102D58E14AD5372D79A981F48978C54A76B35692
QA_PACKAGE_ALREADY_INSTALLED_REPORTED=com.sierraglobalcompany.jornato.b14qa
ANDROID_NATIVE=NOT_RUN
RELEASE=NO_GO
NEXT_OWNER=CHATGPT_DIRECTOR
```

## 0. Reglas de trabajo, precedencia y STOP

**Leyes invariables de PingPongLaw:** L1 KISS/Ponytail (un motor de jornadas + una única fuente de verdad + almacén local ya decidido), L2 antirruido (no auditorías/pruebas redundantes), L3 causa raíz (corrección propietaria), L4 UX humana (estados comprensibles, errores no engañosos), L5 oráculo y evidencia independiente por SHA, L6 antipingpong (un bloque grande + un ZIP). No instalar hooks/skills ni herramientas nuevas. No cambiar criterios de seguridad, semántica de `requestId` y del histórico `requetId`; `SERVER_STORED` NO equivale a `RECOGNIZED`. B19/B20 siguen deny-all salvo contrato posterior.

**Prohibiciones absolutas de esta ejecución:**
- **No tocar teléfono**: no `adb` ni AVD, logcat, package inspection, ports, forward, Activity, install, uninstall, `pm clear`, force-stop, reinicios, `flutter drive`, `flutter run`, `flutter test integration_test` con dispositivo. El APK QA V5 **ya está instalado según el ZIP**. No repetir V3/V4/V5, B17, B21F-S3 (158/2450), H9-M1 (75), F1 widget ni Android C2. No abrir B22, no despliegue.
- **No alterar Git**: no `git add/commit/push/pull/fetch/merge/rebase/cherry-pick/reset/clean/checkout/stash`, force ni cambio de rama; tampoco GitHub Actions. `git status`, `git diff` y consultas Git locales **solo lectura** sí. Nunca publicar WIP, snapshots, diffs o secretos a GitHub; PR2 es documentación, no repositorio avanzado de producto. No hacer red Pro, cuentas reales, producción, pagos, facturación, ATS, contratos OD.
- **No descargas**: dependencias, Flutter SDK, SDK Android, Docker/MariaDB o herramientas pagas. Pruebas host únicamente con SDK y paquetes cacheados, sin usar teléfono.
- **STOP seguro:** ante WIP cambiante por otro agente, imposibilidad de verificar custodia, peligro de pérdida de archivos o violación de privacidad, **no editar**. Generar ZIP de bloqueo. Un servicio fuera de alcance no justifica cambiar arquitectura ni repetir runners.

**Regla de alcance funcional:** Codex puede corregir **varios defectos del mismo flujo** UI kiosco → motor de jornadas → almacén local existente → readback/representación, en **un solo lote**. No extender a módulos Pro/tenant/web/RR. HH. Si para satisfacer la vertical se necesita una **nueva DB/capa de servicios, nuevo schema/migración, permiso de ubicación obligatorio, sincronización o un contrato no aprobado**, NO inventar esa arquitectura: marcar ese criterio `BLOCKED_CONTRACT`/`BLOCKED_MISSING_APPROVED_STORAGE` y completar los criterios independientes que no dependan de ella. No reducir arbitrariamente el trabajo a un bug si existen varios defectos comprobados del **mismo propietario**.

## 1. Preparación y guardias (mínima, no otra auditoría)

1. En `D:\codex\Jornato`, comprobar directorio, rama, HEAD, staged y `git status --porcelain=v1 -uall`; **histórico orientativo**: rama `codex/jor-b08-h4-domain-20261025`, HEAD `faf5fe...`, 234 estados, 223 untracked, 11 modificados, 0 staged. **No asumir que sigue igual**. Si otro Codex ejecuta u ocurren cambios concurrentes, `BLOCKED_CONCURRENT_WIP`; sin checkout/reset/clean.
2. Comprobar si ya existe **cierre de N1 o N1-R2 posterior al ZIP V5** en `D:\codex\_REPORTES\Jornato` o en el historial local (solo nombres, fechas y un manifiesto, sin inspeccionar secretos); si hay evidencia válida de la misma tarea, **no duplicar**. Informar `SUPERSEDED_BY_NEWER_RUN` al Director.
3. Salida bajo `OUTPUT\private\` (**solo local, fuera de ZIP**) y `OUTPUT\delivery\` (**ZIP del retorno**). Resolver rutas y evitar que apunten dentro del WIP, symlinks, junctions, o una carpeta compartida remota. Comprobar espacio suficiente antes de copiar. No tocar archivos de producto hasta que el inventario y copia focal pasen.

## 2. Custodia real, recuperable EN EL ALCANCE, sin falsa seguridad

4. Inventariar SIN seguir enlaces simbólicos: (a) archivos tracked modificados, (b) tracked limpios cuya reconstrucción depende de HEAD Git, (c) untracked fuentes/recursos/configuración **no secreta** necesarios para compilar/entender el código avanzado, (d) ignored críticos y secretos EXCLUIDOS (registrar solo categoría y cantidad). Incluye Dart/Flutter, Laravel/PHP, Android/Kotlin/Java, YAML/manifest, migraciones, scripts, assets imprescindibles, tests y documentación contractual, solo archivos de fuente y configuración autorizados. Excluir `.git`, caches/build, bases, logs, paquetes vendor, secretos, `.env`, keystores, certificados, credenciales, datos de empleados y dispositivos. **No seguir hardlinks/symlinks/junctions**; avisar sobre un archivo ilegible o mutable. No inventariar contenido de otros proyectos.
5. Crear en `private\snapshot_<identificador>` copia **no pública** de fuentes y configuración autorizadas preservando estructura relativa y SHA-256 de cada archivo incluido, con manifest de rutas internas **privado**. Separar la identidad del commit base y comprobar que Git conserva los objetos de HEAD (`git cat-file -e HEAD^{commit}` solo lectura). Opcionalmente crear `git bundle` **privado** solo si sus objetos/alcance y privacidad son verificables; no hacerlo requisito para declarar copia de fuentes focal. No exportar objetos privados a GitHub ni usar `git add` como supuesto respaldo. No copiar secretos aunque se cataloguen como críticos.
6. Construir tres verificaciones distintas: `SNAPSHOT_INTEGRITY` = archivo a archivo tamaño+SHA coincidentes y sin cambio de origen durante captura; `RESTORE_SAMPLE` = restaurar muestra representativa de **5 o más, incluyendo untracked y modificado**, fuera del WIP y comparar hashes; `RESTORABILITY_SCOPE` = si el HEAD Git más el snapshot y los recursos excluidos permitirían recuperar el alcance editado. **NO decir «backup completo», «recuperación integral», «backup fuera del dispositivo»**. Queda fijo `OFF_DEVICE_BACKUP=NO` porque todo está en D:. Si la copia es parcial o un recurso esencial está excluido, registrar `RESTORABILITY_SCOPE=PARTIAL` y concretar categoría sin filtrar datos.
7. Al identificar archivos a editar, guardar PRE exacto de cada uno en `private\before_edits` y hash; si ocurre fallo, preservar ambas versiones sin borrado global, no hacer resets. `BLOCKED_CUSTODY` si no se pueden preservar los candidatos o no hay espacio. No tocar el teléfono para «mejorar» evidencia.

## 3. Reconciliación remota PR3 vs WIP (focal, cero merge)

8. PR3 es **Draft y apilado sobre PR1**, HEAD observado previamente `104469b119752f395cf9881e732d582feab9db4e`. Si hay acceso público read-only **fuera del WIP**, verificar HEAD actual del PR3 y blob SHA de cinco módulos: `lib/src/domain/attendance.dart`, `attendance_archive.dart`, `attendance_csv_report.dart`, `attendance_report.dart`, `location_rule.dart`; sumar UI `lib/main.dart` y tests relativos. Si la lectura no está disponible, utilizar sólo observaciones **históricas** y poner `REMOTE_CURRENT=NOT_VERIFIED`. Nunca ejecutar el puente del PR2 como si fuese vigente: fija commit `78b32284...`, que no coincide con HEAD observado. **No modificar el script de puente durante este lote.**
9. Contrastar para cada módulo **función y comportamiento**, no solo basename: `EXACT_BYTES`, `SAME_BEHAVIOR_OWNER_LOCAL`, `DIFFERENT_RELEVANT_BEHAVIOR`, `MISSING_IN_LOCAL`, `UNKNOWN`. Si un módulo tiene otro nombre o ubicación pero misma responsabilidad, reutilizar propietario local. PR3 tiene `AttendanceLedger.shifts/snapshot`, `AttendanceArchive.encode/decode/reconcile`, `LocationRule` y UI de jornada; esto se verificó en GitHub pero **no** significa que esos componentes pertenezcan al WIP. PR3 tiene 119 tests Flutter y 31 checks Dart **ESCRITOS PERO NOT_RUN**; ninguna de esas cifras equivale a PASS.
10. Guardar `PR3_WIP_MATRIX.csv` sin código fuente sensible, con módulo, HEAD PR3 (si confirmado), bytes iguales SÍ/NO/NO_VERIFICADO, función local responsable, diferencia material, `KEEP_LOCAL|TARGETED_FIX|NO_ACTION|BLOCKED`. No copiar/eliminar/importar módulos por rutina, ni JSON en texto plano fuera del contenedor cifrado.

## 4. Vertical productiva de kiosco GRATIS LOCAL OFFLINE: **cerrar todo lo demostrablemente incompleto de la misma vertical**

11. Leer primero solo las clases propietarias de dominio, UI y almacenamiento local del WIP (no asumir rutas del PR3). Trazar un flujo sintético completo: identificación empresa/sujeto autorizada LOCALMENTE → iniciar jornada → pausar → reanudar → cerrar → ver estado/acumulado → reabrir lectura de dato según capacidad host existente; **sin red**. Cada paso debe usar la **misma** fuente de eventos y cálculo. Crear `KIOSK_VERTICAL_MATRIX.csv`: criterio, método dueño, interfaz/caso, test existente, evidencia previa ligada al SHA, `PRESENT|MISSING_PROVEN|HOST_PASS|NOT_RUN|BLOCKED_CONTRACT`, corrección.
12. Casos requeridos **solo si están dentro del contrato vigente**: secuencia legal, pausa sin entrada rechazada, cierre en pausa según regla ya aprobada, duplicado exacto idempotente, mismo ID con payload distinto rechazado, no-cronología / marcas futuras, cálculo preciso de pausas y cruce de medianoche, horas con un único `now` capturado por interacción, UI sin botones imposibles, ciclo temporal suspendido al background, ningún evento automático, recuperación de lectura en host si el almacén local soporta reabrir sin Android. No añadir geolocalización si es opcional; no cambiar soporte/leyes de jornada ni remuneraciones.
13. **CORREGIR en un mismo bloque los defectos demostrados de toda esa cadena** que puedan solucionarse reutilizando propietarios existentes. Agrupar por causa raíz, no parches en capas; preferir máximo un pequeño conjunto de archivos dueños más tests vecinos en vez de nuevas carpetas. Si está todo implementado pero falta prueba local de esa vertical, ejecutar oráculo focal y documentar sin editar. Si no existe almacén local aprobado o se requiere modificar formato/esquema público, STOP en esa subcapacidad, `BLOCKED_MISSING_APPROVED_STORAGE`/`BLOCKED_CONTRACT`, continuar otras partes seguras. No fabricar cambios por aparentar avance.
14. Pruebas focales locales **host** con SDK/cache instalado y sin descargas (`flutter analyze --no-pub` solo para archivos/impacto si el comando lo permite; `flutter test --no-pub <test_host_específico>` para tests host, nunca `integration_test/` en dispositivo; Dart puro si ya hay harness). No repetir suites aprobadas sin cambio causal. **Si se modificó UI + dominio, ejecutar casos adyacentes en ambas capas** con positivos, negativos y regresión. Capturar test ejecutado, SHA fuente/artefacto, comando y exit; `TEST_WRITTEN` ≠ `TEST_RUN_PASS` ≠ `REUSED_PASS_AT_SAME_HASH`. Si la herramienta falta, `BLOCKED_LOCAL_TOOL`, no instalar nada y no declarar PASS. No hacer builds Android sólo para medir host. Comprobar que los tests host no creen archivos de salida dentro de `OUTPUT\private` ni escriban datos reales de negocio; usar fixtures sintéticos existentes.
15. Tras edición, hashes POST focales y comparación `git diff` de rutas modificadas, control de status pre/post y stage 0; cualquier delta externo **no creado por ti** obliga a detener nuevas ediciones y documentar. No ejecutar commit/stash/reset. Clasificar cada criterio `HOST_PASS_SCOPED|CODE_PRESENT_NOT_TESTED|BLOCKED_CONTRACT|BLOCKED_TOOL|MISSING` y resultado vertical `PASS_HOST_SCOPED` solo si están cubiertos todos los criterios **dentro de alcance autorizado**, con evidencia concreta de integración host; **no decir «kiosco aprobado en producción» ni «Android PASS»**. Si cualquier criterio esencial no demostrado, `PARTIAL_WITH_GAPS` aunque el código parezca correcto.

## 5. Anexo VM Service: máximo una investigación estática focal, no otro C2

16. Reutilizar el ZIP C2 V5 como fuente histórica: APK QA instalado una sola vez, `adb shell logcat --pid=PID` no aportó URI, forward no realizado, driver no ejecutado, oráculos C2 NOT_RUN. **No tocar ADB, procesos ni teléfono**. Inspeccionar únicamente código local Flutter SDK, Gradle/manifest, target `integration_test/kiosk_flow_test.dart` y debug manifest **ya existentes**. Contestar en `VM_STATIC_FINDINGS.md` las condiciones observables que habilitan/avisan Dart VM Service y si tal anuncio necesariamente comparte PID de la app. Si falta evidencia real, `VM_ROOT_CAUSE=UNDETERMINED`, sin especular que SQLCipher falló ni que VM no está activo. Escribir **una** futura ruta no invasiva propuesta con condición de autorización, sin ejecutarla. No convertir este anexo en línea crítica del kiosco.

## 6. Entrega en UN ZIP, sin secretos ni código fuente privado

17. Preparar **solo** `OUTPUT\delivery\JOR-N1-R2-CUSTODIA-KIOSCO-OFFLINE-20261120-UNICO.zip` (nunca sobrescribir un ZIP previo). Lista positiva: `FINAL_REPORT.md` con decisiones/hitos reales, `CUSTODY_SUMMARY.md` (cobertura agregada y restauración muestral, fuera del disco = NO), `PR3_WIP_MATRIX.csv`, `KIOSK_VERTICAL_MATRIX.csv`, `RESULTS.csv` (por puerta y test ejecutado), `NEXT_GATE_MATRIX.md`, `VM_STATIC_FINDINGS.md`, `BLOCKERS.md` si corresponde, `MANIFEST_SHA256.csv` y logs host **sanitizados focales**. No poner código, fuentes, SNAPSHOT privado, `CHANGES.patch`, git diff, nombres de empleados, rutas con datos sensibles, token VM, APK, DB, `.env`, serial, fotos, capturas ni credenciales en ZIP. Conservar diffs/backup solamente en `OUTPUT\private` y entregar la ubicación local sin exponer contenido.
18. Verificar **sin excepciones**: ZIP cerrado, CRC, sin entradas duplicadas ni path traversal/symlink, sin ficheros prohibidos, manifiesto SHA-256 + bytes de todos los miembros excepto manifiesto, SHA-256 externo del ZIP y apertura del ZIP de vuelta. `FINAL_REPORT.md` con SHA/HEAD/estado concretos **no literales de PowerShell**; marcar observación directa vs reporte. Resultado final con único NEXT propietario.

```text
TASK=JOR-N1-R2-CUSTODIA-KIOSCO-OFFLINE-20261120
RESULT=PASS_HOST_SCOPED|PARTIAL_WITH_GAPS|ALREADY_PRESENT_HOST_SCOPED|BLOCKED_CUSTODY|BLOCKED_CONCURRENT_WIP|BLOCKED_LOCAL_TOOL|BLOCKED_CONTRACT|SUPERSEDED_BY_NEWER_RUN
SOURCE_BRANCH=<real>
SOURCE_HEAD=<real>
STAGED_PRE_POST=<real>
WIP_PRESERVED=YES_SCOPED|PARTIAL_EVIDENCE|NO
SNAPSHOT_INTEGRITY=PASS_SCOPED|PARTIAL|BLOCKED
RESTORE_SAMPLE=PASS|FAIL|NOT_RUN
RESTORABILITY_SCOPE=PASS_SCOPED|PARTIAL|BLOCKED
OFF_DEVICE_BACKUP=NO
PR3_HEAD_VERIFIED=<sha|NOT_VERIFIED>
PR3_WIP_COMPARE=PASS_SCOPED|PARTIAL|NOT_VERIFIED
KIOSK_VERTICAL=PASS_HOST_SCOPED|PARTIAL_WITH_GAPS|ALREADY_PRESENT_HOST_SCOPED|BLOCKED
HOST_TARGETED_TESTS=<N_PASS/N_FAIL/NOT_RUN + rutas de logs>
CHANGED_FILES=<rutas o NONE>
VM_ROOT_CAUSE=SOURCE_SCOPED|UNDETERMINED
QA_PACKAGE_INSTALLED=REPORTED_UNCHANGED_NOT_RECHECKED
ANDROID_C2_NATIVE=NOT_RUN
RESTART_READBACK_ANDROID=BLOCKED_HARNESS
TENANT_ISOLATION_ANDROID=BLOCKED_CONTRACT
PRO_HTTP_DB=BLOCKED_CONTRACT
H9_GLOBAL=NO_GO
B22=NOT_AUTHORIZED
RELEASE=NO_GO
ZIP_PATH=<única ruta verificable>
ZIP_SHA256=<SHA256 comprobado>
NEXT_OWNER=CHATGPT_DIRECTOR
```

## 7. Criterio de salida y qué sigue SIN nuevas auditorías

- **Si se completó la vertical:** pruebas host atribuibles por SHA + recuperabilidad focal; Director decide **siguiente macrobloque de integración/custodia Git y tests Android** en función de las brechas verdaderas. No forzar deploy.
- **Si hubo bloqueos parciales:** avanzar en subcapacidades independientes dentro de este lote; el informe distingue gaps reales de test no ejecutado. No abrir otra N1-R3 por gusto.
- **Si no hubo cambios:** debe existir evidencia anterior **válida para el mismo SHA** o tests host actuales suficientes; si solo hay presencia de código usar `PARTIAL_WITH_GAPS`.
- **Puertas posteriores:** integrar WIP con PR3 y respaldo fuera de dispositivo cuando el propietario autorice, retomar pruebas Android con causa/permiso, Pro/tenant/web/empleado/OD, revisión independiente L4/L5, UAT, publicación **solo por GO humano**. Prohibido presentar backend 158/2450 scoped o F1 como release integral.

# 🔴🚨 EJECUTA CODEX LUNA N1-R2 UNA VEZ → ENTREGA UN ZIP ÚNICO → SIGUE CHATGPT DIRECTOR. 🚨🔴