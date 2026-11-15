# CODEX LUNA — JORNATO B21-S1 V1 · MACROBLOQUE ÚNICO DE INTEGRACIÓN REAL Y CIERRE DE GATES

**TASK_ID:** `JOR-B21-S1-V1-REAL-INTEGRATION-GATE-CLOSURE-20261115`  
**RESPONSABLE DE EJECUCIÓN:** CODEX LUNA; **DIRECTOR/ACEPTACIÓN:** ChatGPT.  
**RAÍZ ÚNICA PRODUCTO:** `D:\codex\Jornato`; **salida única:** `D:\codex\_REPORTES\Jornato\JOR-B21-S1-V1-REAL-INTEGRATION-GATES-20261115\JOR-B21-S1-V1-REAL-INTEGRATION-GATES-20261115-UNICO.zip`.  
**SIGUE:** CODEX LUNA. Al entregar el ZIP: `NEXT_OWNER=CHATGPT_DIRECTOR`.

## 0. Decisión vinculante — no auditar otra vez lo ya aceptado

B13–B20 son **avances parciales**, NO módulos terminados ni release. B20-S1 V2 entregó ZIP SHA256 `D4D5E1E1F3DFF63859990704AD90BACB0C498340C047751FDC45F001A8DFDF4F`; el director verificó ZIP 74 miembros, manifiesto 73/73, replay de 21/21 fuentes y `php -l` 21/21 independientes. Los **11 PHPUnit/84 assertions** provienen de logs Codex, con repositorio en memoria y `Storage::fake`; B20 no ejecutó MariaDB ni concurrencia, y 40 oráculos NO son 40 suites. No repetir CRC, replays ni host tests B13–B20 por ceremonia. Ejecutar de nuevo **solo** la prueba mínima afectada por un cambio concreto o una matriz transversal que faltaba.

Objetivo de B21-S1: **cerrar con implementación y evidencia real el mayor número de dependencias compartidas** que mantienen bloqueados el registro/autenticación, el portal, las solicitudes y las funciones Pro; validar migraciones y conflictos en base aislada; presentar un itinerario ejecutable de las aprobaciones inevitables. Este lote NO autoriza producción, firma, cobros, reglas salariales, acceso ATS público ni permisos RR. HH. supuestos. Éxito B21-S1 ≠ GO comercial: no esconder lo pendiente.

**Leyes fijas** L1 KISS/Ponytail, L2 antirruido, L3 raíz, L4 UX humana, L5 verificación independiente, L6 antipingpong; canon externo solo documental `sierraglobalcompany-rgb/PingPongLaw` commit `84e961cadf482d234f4c0ee2ca60e8c7e9b388e8`. Las decisiones del dueño se respetan; SPEC V5 y B03/H1 contienen propuestas `[P]/[OPEN]` y pendientes `[J]`, no licencias para inventar consentimientos o salarios.

## 1. Seguridad operativa y única preinspección (ejecutar una vez)

1. Trabaja **solo** en `D:\codex\Jornato`, y evidencias/temporales nuevos bajo `D:\codex\_REPORTES\Jornato` y `D:\codex\_RUNTIME\Jornato\B21`. No tocar `C:` salvo lectura inevitable del sistema, no otros repositorios, MariaDB o Docker compartidos, Hostinger, producción, GitHub Actions ni infraestructura pagada.
2. No `git add`, `commit`, `push`, `merge`, `reset`, `clean`, `stash`, `checkout`, `rebase`, deploy o borrado. Respeta `HEAD`, rama, 0 staged, tracked/untracked y archivos ignorados preexistentes. Captura **una vez** `git status --porcelain=v1 --untracked-files=all`, HEAD/rama, y SHA256+bytes de fuentes que realmente tocarás, incluidas las untracked; no recrear el WIP desde `main` ni tocar archivos ajenos.
3. Inspecciona **una vez** rutas API/web, auth/guards/PAT, `companies`, `memberships`, `employees`, vínculo cuenta↔empleado, roles/policies, flags `testing`, migrations, provider, archivos `phpunit.xml`, Flutter personal y directorios de test existentes. Usa lectura del repo real, **no inventes nombres ni columnas**. Anota contratos encontrado/ausente con ruta y línea. No repetir búsquedas de repos ni preflights si ya hay evidencia.
4. Haz matriz `GATES_PRE.csv`: `gate,owner,prestatus,source_of_truth,action_now,proof_or_blocker`. No cambies criterios de aprobación ya fijados, conserva los resultados B13–B20; si hay conflicto de versiones documentales, prevalece el **código local actual** más especificación aprobada, no el `main` rezagado.
5. Prioridad de modificación: **una raíz existente y tests transversales**, sin capas genéricas ni arquitectura nueva. No crear una segunda autenticación, otra SPA, otra base, otro ledger paralelo ni instalar una librería de pagos/firma/ley sin aprobación. Si una ruta está explícitamente `DENY-ALL`, mantenerla cerrada salvo que exista **permiso específico aprobado, comprobado y probado negativamente**.

## 2. Macrobloque A — DB QA aislada y migración verdadera (primera prioridad productiva)

1. Detecta si hay **MariaDB/MySQL local realmente disponible y seguro** para Jornato (binario local/servicio exclusivo identificado, permisos de arranque, puerto libre, bases vacías, usuario limitado). NO uses instancia de otro producto, credenciales reales ni `root` compartido. No desactives TLS/seguridad en instancia compartida. Si puedes provisionar una instancia **aislada bajo D:** con los binarios ya instalados y configuración propia para tests sin afectar otros servicios, hazlo; si exige descargar/instalar software, habilitar privilegios, manipular datos ajenos o resolver una policy que lo impide, marca `DB_REAL=NOT_RUN_ENV` con causa exacta **una sola vez** y continúa B/C/D.
2. En instancia aislada: migrar desde cero el esquema actual, incluido B17, B19, B20; demostrar **schema, FKs compuestas tenant, índices UNIQUE, transacciones y rollback** en una DB de QA vacía. Si una migración falla, corregir **la causa mínima en esa migración** sin cambios destructivos a datos existentes. No fingir que `migrate --pretend`, SQLite o inspección SQL equivalen a MariaDB. Guardar log y versión exacta DB.
3. Ejecutar dos **conexiones DB independientes reales** sobre idempotencia/retry B17, B19 y B20; repetir mismo request/huella → una fila y un evento; mismo request/huella distinta → conflicto; demostrar rollback y ausencia de orfandad referencial. En B20 probar agendas simultáneas en dos vacantes de la **misma empresa** y mismo entrevistador, intervalo adyacente permitido, conflictivo denegado. Cuando no se pueda ejecutar, `IMPLEMENTED_DB_UNRUN` (no PASS).
4. Tests intertenant A/B: consultas y modificaciones con IDs ajenos de empleado, sitio, B16, B17, B19 y B20 deben denegar sin revelar datos; comprobar cada scope con fixtures solamente. Priorizar regresiones nuevas que cruzan módulos, no reejecutar toda batería antigua.
5. **Salida A:** `DB_REAL=PASS_SCOPED` con logs reales y SHA del árbol probado, o `DB_REAL=NOT_RUN_ENV` con diagnóstico único. Nunca llamar `PASS` a un fake.

## 3. Macrobloque B — identidad y contratos reales (segunda prioridad productiva)

1. Resuelve **desde el código y tests actuales** el mapa `UserAccount → Membership activa → Company → Employee opcional → role/policy`; distingue operador kiosco, trabajador y propietario. Valida `tenant` por servidor, status/expiry/revocación de membership en **cada request**; jamás confiar en `company_id`, `actor_id`, `employee_id`, `site_id` enviados por cliente.
2. Reconciliar las rutas reales B15 (`/api/v1/me`, `/api/v1/me/companies`) con servidor y consumidor Flutter: si no hay inconsistencia actual demostrable, **NO modificar rutas**. No equiparar login con marcación. Revocación PAT real solo PASS cuando kernel DB/HTTP revoque y rechace de verdad el token, no por logout host.
3. Identifica por **ruta+prueba** qué componentes existen para alta de cuenta, sesión web, verificación email, invitación, vínculo empleado-cuenta, creación de empresa, consentimiento versionado y recuperación. **Implementa o conecta SOLO los eslabones que ya cuentan con contrato aprobado y sujeto/permiso inequívocos**, sobre la auth/guard existentes. Usa política deny-by-default si falta aprobación del propietario o textos legales. No agregar login paralelo ni `actingAs` fuera de tests como mecanismo comercial.
4. Integra **un recorrido real extremo a extremo** si el contrato lo permite: cuenta de QA autorizada → empresa/membership → lectura autenticada de identidad/empresa → sesión web B16 o API personal B15/B17 → comprobar 401/403 al revocar/cambiar a empresa B. Adjuntar requests/responses saneados (sin token, email o datos personales). Si faltan contratos, producir `IDENTITY_CHAIN=BLOCKED_CONTRACT` con campo exacto, archivo y decisión externa faltante, más pruebas host negativas; no fingir happy-path.
5. No ampliar permisos de RR. HH. por ser owner: revisión B17, expediente B19 y ATS B20 siguen cerrados hasta existir policy aprobada para *acción* y tenant. Preparar en `OWNER_DECISIONS.md` preguntas **mínimas sí/no** con consecuencias, no implementar respuestas inventadas.

## 4. Macrobloque C — recorridos integrados y UX útil (tercera prioridad)

Ejecuta solo recorridos permitidos por contratos efectivamente disponibles; marcar explícitamente la capa probada (`PHP_UNIT`, `LARAVEL_HTTP_KERNEL_DB`, `FLUTTER_HOST`, `WEB_BROWSER`, `ANDROID_PHYSICAL`, `STATIC_ONLY`). Orden:

- **C01** B13 identidad y tenant A/B: login real (si está aprobado), empresa activa, expiración/revocación y rechazo de intruso. `actingAs` no cuenta como login real.
- **C02** B14 outbox: evento offline→recibo `SERVER_STORED/UNASSESSED` sin convertirlo en asistencia validada; dos envíos mismo ID no duplican, conflicto visible.
- **C03** B15 app personal: PAT, identidad laboral, historial/estado, logout y rechazo real del token revocado si servidor QA disponible. Si no hay safe AVD/dispositivo, **no borrar ni reconfigurar AVD ajenos**; marcar Android `NOT_RUN_ENV`.
- **C04** B16 portal Blade: identidad web y empresa activa, Hoy «Indeterminado» sin fuente, sedes y CSV scoped, 403 cross-tenant, navegador responsive **solo si hay navegador QA accesible**; si no, host HTML/asset no equivale a UAT visual.
- **C05** B17: solicitud titular y estado/historial; justificar ≠ horas fichadas; solicitud aprobada NO crea saldo ni permiso de pago.
- **C06** B18 motor QA exacto: reutilizar pruebas ya aceptadas; **solo** prueba frontera de integración/proveniencia si cambia consumidor. 42h/recargos/nocturno país sin pack homologado permanecen NO LEGALES. No crear API salarial pública.
- **C07** B19 PDF privado: autorización deny-all hasta policy aprobada; verificación storage real según disponibilidad, lectura acotada y checksum, versión/tenant; `Storage::fake` no es auditoría IAM ni cifrado.
- **C08** B20 ATS: sin rutas públicas, token QA no entrega identidad; QA DB lock de entrevista con dos conexiones, event idempotente. CV real, malware, retención, consentimiento y conversión candidato→empleado siguen BLOQUEADOS.

**Si falta una dependencia**, completa las otras Cxx y deja un único registro consolidado; no crees un ciclo B21-S2 solo para volver a observar la misma ausencia. No habilitar `testing`/debug en producción ni saltarse checks de identidad para “hacer pasar” los E2E.

## 5. Macrobloque D — seguridad, decisión propietario y cierre integrador

1. Seguridad: verificar rutas públicas y defaults `DENY-ALL` B19/B20, CSRF y sesión web cuando exista, IDOR/tenant, CSV injection, pdf traversal/tipo/bytes, filtrado de logs y token PAT, acceso a archivos vía webroot, **sin pruebas destructivas**. Ejecuta scan/dependencias si ya hay herramientas disponibles sin consumo pago; los scanners ausentes se marcan `NOT_VERIFIED`, no `PASS`.
2. Genera una **matriz única B13–B20** de cobertura y dependencias: función, evidencia previa válida (SHA), qué cambió B21, nueva prueba necesaria, prueba ejecutada+estado, dueño del bloqueo, criterio de desbloqueo. El inventario de ~110 casos de SPEC V5 es **lista de aceptación pendiente**, no 110 pruebas verdes: no reejecutar 110 si ya hay evidencia focal, ni prometerlos como realizados.
3. `OWNER_DECISIONS.md` no debe pedir permisos ambiguos. Presenta **como máximo 8 decisiones** que impiden GO, cada una: `ID | pregunta concreta (sí/no o elección) | recomendación técnica | impacto | contrato/ley que requiere abogado/contador | estado=NO_DECIDIDO`. Al menos: texto de privacidad/consentimiento y retención, contrato empleado-cuenta/invitación, autorización RR. HH. por acción, portal web real, ATS público/CV/malware, plantillas/firma, regla legal de remuneración, precios/entitlements/billing (solo si siguen abiertos). Sin atribuir aprobación al dueño por silencio.
4. Crea `RELEASE_GATES.csv` de estados explícitos: `PASS_REAL`, `PASS_HOST_SCOPED`, `PARTIAL`, `NOT_RUN_ENV`, `BLOCKED_CONTRACT`, `NOT_VERIFIED`, `NO_GO`. Nunca `GO` si queda P0/P1 probado, migración no validada, privacidad legal no aprobada, Android/recibo físico pendiente, WIP sin entrega reproducible o autorización de propietario ausente. `L5_INDEPENDENT=NOT_RUN` para la revisión que hará ChatGPT, aunque Codex haga su autocontrol.
5. Entrega ruta final B22 en tres grupos breves: **(i) resuelto ahora con evidencia, (ii) pendiente por entorno/dispositivo, (iii) requiere decisión externa**. No generar otra SPEC/ADR paralela ni un plan de 100 tareas.

## 6. Oráculos B21 (24 verificables; no 24 suites)

| ID | Criterio exigido | Estado correcto si no hay entorno/contrato |
|---|---|---|
| I01 | SHA/HEAD/WIP pre y post preservados, sin staged | FAIL si alteraste base ajena |
| I02 | API/web/guard/tenant reales identificados por ruta+línea | NOT_VERIFIED si solo se infiere |
| I03 | MariaDB QA aislada no afecta otros productos | NOT_RUN_ENV si no se puede aislar |
| I04 | Migraciones B13–B20 reales sobre DB vacía y FKs | NOT_RUN_ENV, no SQLite como sustituto |
| I05 | B17 idempotencia y rollback dos conexiones | NOT_RUN_ENV |
| I06 | B19 versiones y rollback dos conexiones | NOT_RUN_ENV |
| I07 | B20 overlap/carrera y UNIQUE entre vacantes | NOT_RUN_ENV |
| I08 | Denegar company/site A→B en DB/kernel | NOT_RUN_ENV si no hay DB |
| I09 | Ruta `/me` real vs cliente sin alias inventado | BLOCKED_CONTRACT si no existe |
| I10 | PAT revocado rechazado por backend real | NOT_RUN_ENV si no hay kernel/DB |
| I11 | Sesión web B16 real sin segundo login | BLOCKED_CONTRACT |
| I12 | Vinculación empleado-cuenta autenticada y restringida | BLOCKED_CONTRACT |
| I13 | B14 outbox idempotente sin promocionar `UNASSESSED` | NOT_RUN_ENV o PASS acotado |
| I14 | B15 personal/Flutter contra identidad real | BLOCKED_CONTRACT o NOT_RUN_ENV |
| I15 | B16 Hoy, sedes, CSV y 403 cross-tenant | BLOCKED_CONTRACT/NOT_RUN_ENV |
| I16 | B17 permiso no crea marcación ni sueldo | PASS_HOST_SCOPED o PASS_REAL |
| I17 | B18 sin cálculo legal por fixture no homologado | PASS_HOST_SCOPED o PASS_REAL |
| I18 | B19 privado B19 conserva DENY-ALL comercial | PASS_STATIC + kernel si posible |
| I19 | B20 conserva 0 rutas ATS públicas y DENY-ALL | PASS_STATIC + kernel si posible |
| I20 | Probar storage real solo si aislado, sin fuga/IAM falso | NOT_VERIFIED |
| I21 | Android real solo con dispositivo/AVD seguro autorizado | NOT_RUN_ENV |
| I22 | 110+ escenarios inventariados con cobertura real y faltantes | PASS documental, nunca 110 PASS inventados |
| I23 | OWNER_DECISIONS <=8, sin respuestas atribuidas | PASS documental |
| I24 | Parche final, ZIP, manifiesto y logs verificables | FAIL si faltan pruebas reclamadas |

Oráculo = **criterio**; usar el mismo test para varios criterios si es válido. Para cada I01–I24 registrar `ID,alcance,comando_o_inspección,resultado_esperado,resultado_observado,estado,log,limitación,nueva_fuente_sha`. Si hay un fallo **material reproducido**, corregirlo en el MISMO macrobloque y repetir solo test focal y consumidor afectado; no abrir auditoría en espiral.

## 7. Pruebas e informe: resultados honestos, sin carrera en círculos

- Pruebas host existentes B13–B20: usar como evidencia histórica (referencias y SHA); reejecutar solo cuando cambia fichero/contrato compartido y en un conjunto mínimo. Si decides una QA completa 110+ para salida de B21, debe ser ejecución real con mismo árbol/build, no transcripción de listas.
- Registrar comando exacto, cwd, exit code, stdout/stderr redactados, versión PHP/Flutter/MariaDB, tree/patch SHA, SHA de fixtures y timestamps; distinguir test **real** de test **fake**, static y `NOT_RUN`.
- No reinstalar todo, no repetir preflight, no gastar GitHub Actions, no pedir permiso al director por una ausencia ya conocida, no hacer cambios especulativos. No desplegar ni fusionar PR #2 documental.

## 8. Entrega: SOLO UN ZIP, cero dispersión

Crear **exactamente** `JOR-B21-S1-V1-REAL-INTEGRATION-GATES-20261115-UNICO.zip` con:

`FINAL_REPORT.md`, `GATES_PRE.csv`, `RELEASE_GATES.csv`, `OWNER_DECISIONS.md`, `ORACLES_I01_I24.csv`, `COVERAGE_B13_B20.csv`, `SOURCE_CHANGE_MATRIX.csv`, `SOURCE_HASHES_PRE_POST.csv`, `PATCH_CANDIDATE.diff`, `BASELINES/` (preimágenes reales, `.absent` de nuevos), `SOURCES/` (solo finales tocados), `LOGS/` (pruebas realmente corridas, fallos y bloqueos), `ENV_GATES.md`, `AUDIT_L1_L6_10_PASSES.md` (autocontrol Codex, NO L5 independiente), `MANIFEST_SHA256.csv`. El ZIP no incluirá credenciales, datos de empleados, DB/datadir, APK privado no solicitado ni archivos de otros proyectos.

El `PATCH_CANDIDATE.diff` debe reconstruir **byte exacto** cada fuente nueva/cambiada al aplicarse a `BASELINES`; verificar en carpeta aislada. Incluir SHA256+tamaño de todos los miembros menos manifiesto, CRC, no traversal/duplicados. Si no se modifica código porque **todos** los cambios reales están bloqueados, entregar igualmente diagnóstico único, tests/gates que sí corriste, matriz y decisión `PARTIAL`; **NO declarar que B21 está terminado comercialmente**.

**Reporte terminal exacto:** `TASK_ID | B21_S1=PASS_SCOPED/PARTIAL/NO_GO | DB_REAL=... | IDENTITY_CHAIN=... | WEB_REAL=... | ATS_PUBLIC=BLOCKED | L5=NOT_RUN | WIP=... | RELEASE_APPROVED=NO | ZIP_SHA256=... | NEXT_OWNER=CHATGPT_DIRECTOR` y enlace D: al **único ZIP**. Director continuará con aceptación focal y B22 solo tras GO escrito del propietario.