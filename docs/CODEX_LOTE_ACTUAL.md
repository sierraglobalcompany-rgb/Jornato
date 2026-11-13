# CODEX LUNA — JORNATO B17-S1 V2 · MACROBLOQUE PRODUCTIVO DE SOLICITUDES, ESTADOS E HISTORIAL SEGURO

**ORDEN ÚNICA Y DEFINITIVA — SUSTITUYE B17-S1 V1. NO EJECUTAR AMBAS VERSIONES.**  
**TASK_ID:** `JOR-B17-S1-V2-REQUESTS-SECURE-LEDGER-ONEBATCH-20261113`  
**DIRECTOR / ARQUITECTO / JUEZ DE ACEPTACIÓN:** ChatGPT. **EJECUTOR:** Codex Luna, realizar acciones indicadas, no improvisar contratos.  
**PROYECTO LOCAL ÚNICO:** `D:\codex\Jornato`. **TMP, SCRIPT Y REPORTES DEL LOTE:** solo bajo `D:\codex\_REPORTES\Jornato\JOR-B17-S1-V2-REQUESTS-SECURE-LEDGER-20261113\`.  
**SALIDA EXTERNA ÚNICA:** `D:\codex\_REPORTES\Jornato\JOR-B17-S1-V2-REQUESTS-SECURE-LEDGER-20261113\JOR-B17-S1-V2-REQUESTS-SECURE-LEDGER-20261113-UNICO.zip`.  
**REPORTE DE RETORNO:** solo ruta del ZIP, SHA-256 y una línea de estados; **TODAS** las fuentes, parches, reportes y logs deben estar **dentro de ese mismo ZIP**. No entregar carpetas o Markdown sueltos.  
**EJECUTAR UN ÚNICO MACROBLOQUE FUNCIONAL, NO UN PREFLIGHT INTERMEDIO.** Leer contratos una vez, implementar lo seguro, probarlo, empaquetarlo y finalizar. No pedir a ChatGPT que repita otra auditoría por diferencias triviales.

## 0. BASE CERTIFICADA Y LÍMITES QUE NO DEBES CAMBIAR

### Lo que sabemos y lo que NO está certificado

- **Última entrega de código recibida y auditada por ChatGPT:** `JOR-B16-S1-V2-PORTAL-PRO-20261112-UNICO.zip` SHA-256 `0F31F3CC7D3C2E1300E02A112CB8168F1B4D5C5340C6544FA6FB02D7BF0CB933`; ZIP 75 entradas, 74/74 hashes y tamaños, patch 11/11, lint 6/6 **verificados por ChatGPT**. En logs de Codex, PHPUnit **12 pruebas/122 aserciones PASS**, **no reejecutadas por ChatGPT** contra MariaDB real.
- **B16 host parcial:** Blade portal Hoy/Sedes/Informes/Plan, CSS; `server/routes/web.php` incluía solo tres GET protegidos por `auth:web`, `account.active`, **sin login/logout web navegable**. `PortalController` usa `company_memberships` y `sites` con scoping. Los turnos no disponen de calendario/instancia confiable; Hoy indica «Indeterminado»; recibos `SERVER_STORED/UNASSESSED` NO son asistencia reconocida. `actingAs` + mocks no certifican tenant DB real.
- **Identidad personal B15:** existen `employee_identity_links`, GET `/api/v1/companies/{company}/me/attendance` y Flutter personal con token Sanctum. **La vinculación comercial User↔Employee NO está aprobada**. Las rutas reales `/api/v1/me` y `/api/v1/me/companies` se corroboraron en el inventario del ZIP B16; reconfirmar contra el checkout local antes de añadir B17.
- **Bloqueos abiertos:** `B13_GLOBAL=PARTIAL`, `B14_FINAL=NOT_APPROVED`, `B15_GLOBAL=PARTIAL`, `B16_GLOBAL=PARTIAL`, `B17_GLOBAL=NOT_APPROVED`, `LINK_ADMIN_RUNTIME=BLOCKED_PERMISSION_CONTRACT`, `B16_WEB_LOGIN_REAL=BLOCKED_EXISTING_AUTH_CONTRACT`, `MARIADB_QA=NOT_RUN_ENV` salvo evidencia nueva, `L5_INDEPENDENT_RUNTIME=NOT_RUN`, `RELEASE_APPROVED=NO`.
- **Fuentes de autoridad:** código local intacto + instrucciones aprobadas; `AGENTS.md` local; canon PingPongLaw L1–L6 en commit fijo `84e961cadf482d234f4c0ee2ca60e8c7e9b388e8` y `docs/JORNATO_CONTINUIDAD.md` del PR documental #2. La SPEC V5 contiene propuestas funcionales **candidatas**, no autoriza por sí misma permisos comerciales, cálculos o tecnologías diferentes. Stack vigente: Laravel/Sanctum/MariaDB/InnoDB y Flutter; **no PostgreSQL**.
- **Desvíos históricos que NO debes intentar remediar:** inventario Docker de Liquidapro con variaciones de causa no demostrada; script histórico C: de inspección. Sin Docker compartido, sin reparar/borrar contenedores ajenos, sin tocar archivos de C:.

### Reglas de protección absolutas

1. **L1 KISS/Ponytail:** una vertical request/status/history, sin microservicios, SPA, bus, event-sourcing framework, segunda autenticación, nuevas dependencias, reloj de nómina ni un ledger duplicado de asistencia. Máximo **dos tablas focales nuevas si no existe ninguna compatible**; ningún saldo de vacaciones calculado ni tabla nueva de saldos por esta orden. Una clase pequeña para transiciones solo si comparte código entre endpoints; no arquitectura especulativa.
2. **L2 antirruido:** no repetir auditorías B13–B16 ni las pruebas históricas de 1000 eventos, no duplicar docs/ADR/AGENTS; no eliminar ficheros por parecido. Capturar decisiones/contratos una sola vez en `CONTRACT_MATRIX.md` dentro del ZIP.
3. **L3 antiparches:** resolver tenant+identidad+transición+idempotencia en los propietarios de esa lógica; transacción atómica y evento append-only. Prohibido hacer que un test pase deshabilitando middleware, mutando `sync_events`, outbox B14, asistencia, nómina o turnos.
4. **L4 UX:** no inventar pantallas o reglas aprobadas: implementar estados comprensibles y accesibles con estructura Flutter existente. Etiquetar cualquier UX no aprobada como candidato QA. Nunca mostrar «aprobado legalmente», «EPS validó», «vacaciones descontadas» ni «horas trabajadas» por el solo estado de solicitud.
5. **L5 prueba real:** `PASS_STATIC`, `PASS_UNIT`, `PASS_HOST_WIDGET`, `PASS_DB_REAL`, `PASS_HTTP_KERNEL`, `PASS_BROWSER`, `BLOCKED_CONTRACT` y `NOT_RUN_ENV` deben ser estados distintos. Codex es el autor de su QA; su autorrevisión NO equivale a L5 independiente. No llamar 36 tests a 36 oráculos si no se ejecutaron.
6. **L6 antipingpong:** una lectura focal, implementación completa hasta donde hay contrato, RED→GREEN focal, evidencia y ZIP; no crear un B17-S2 automático ni cerrar todo B17 por una infraestructura que no está disponible. Próximo módulo B18 salvo defecto P0/P1 nuevo, localizado y demostrado.
7. **Custodia:** preservar los archivos WIP tracked **y untracked**, branch y HEAD; cero stage/commit/push/merge/deploy/instalación remota; ninguna escritura en GitHub, Hostinger o producción. No `git reset`, `git clean`, `git restore`, checkout destructivo ni migraciones de datos reales. Temporales y artefactos creados por ti solo en D:. Credenciales y datos ficticios, sin enviar email ni salud reales.

## 1. META PRODUCTIVA Y CRITERIO DE FIN DE UNA SOLA EJECUCIÓN

Probar el flujo más completo autorizado con **identidades/empresas/empleados ficticios**:

`token personal autorizado → vínculo activo empresa/empleado verificado EN SERVIDOR → POST solicitud PENDING con idempotencia → 201/folio público opaco → GET lista/detalle propios → CANCEL propia o NEEDS_CLARIFICATION→PENDING con historial de acciones → revisor solo si tiene permiso COMPROBADO → timeline append-only y 409 para transición inválida → vista Flutter «Mis solicitudes» y estados accesibles → ZIP reproducible`.

**Resultado mínimo honesto si falta permiso de revisor:** el solicitante puede crear, consultar, responder aclaración si existe el estado y cancelar en estados permitidos; el **motor de transiciones queda probado internamente con fixture explícito** pero **NO** se publica un endpoint/admin CTA de approve/reject. Declarar `REVIEW_PERMISSION_GATE=BLOCKED_CONTRACT` y `REVIEW_UI=NOT_EXPOSED`. No inventar que owner/admin puede aprobar; no omitir por ello creación+lectura+historial.

**Si la identidad personal o autorización de API falta de verdad:** no crear onboarding ni login de reemplazo, no asociar usuario y empleado por correo/PIN, y **no exponer una ruta insegura**. Implementar el núcleo aislado, modelos y tests con fixtures/host, dejar endpoints públicos fail-closed o no registrados según contrato y `PERSONAL_REQUEST_HTTP=BLOCKED_IDENTITY_CONTRACT`; **nunca etiquetar eso PASS del flujo personal completo**.

### Cinco distinciones de datos obligatorias

- `requested_interval` (periodo solicitado) ≠ `justification_decision` (decisión administrativa) ≠ `observed_attendance` (fichada) ≠ `recognized_work_time` (validada) ≠ `vacation_balance` (saldo validado).
- `APPROVED` significa **aprobación operativa de la solicitud bajo autorización vigente**, NO que EPS emitió incapacidad, NO reconoció un salario ni legalizó la ausencia.
- `SERVER_STORED/UNASSESSED` nunca acredita que se trabajó ni la identidad física de quien fichó.
- `vacation_balance` sin ledger aprobado se expresa `UNKNOWN / NO_CONTRATO`, **no cero** y jamás se descuenta desde B17.
- Cita, urgencia o incapacidad son **categorías declaradas por solicitante**; por defecto no solicitar ni guardar diagnóstico, historia clínica ni archivo de soporte.

## 2. INVENTARIO FOCAL OBLIGATORIO (UNA VEZ, ≤ UNA SECCIÓN EN EL INFORME)

1. En `D:\codex\Jornato`, anotar `git rev-parse HEAD`, `git branch --show-current`, `git status --porcelain=v1 -uall`, `git diff --name-status`, `git diff --cached --name-status`, inventario archivos tracked/untracked que vas a tocar y los SHA256 **antes** de modificarlos. Comparar después; no afirmar que `git status` prueba hash de archivos untracked si no los calculaste.
2. Leer `AGENTS.md`, migraciones/restricciones existentes de `company_memberships`, `companies`, `sites`, `sync_employees`, `employee_identity_links`, `personal_access_tokens` (Sanctum), routes/middleware `auth:sanctum`, `account.active`, `device.active`, abilities, `tenant.company`, tests B15 y clases de Flutter personal/Session. Mirar también `server/routes/web.php` y comprobar que B16 sigue sin login web real.
3. Buscar **una vez** si ya hay modelos/tablas de solicitudes, ausencias, justificaciones, auditoría, idempotency o balance. Si existe contrato compatible, **reutilizarlo**; registrar columnas y nombres reales. Si no, proceder al mínimo de §3. **Nunca inventar FK `site_id`, clave UUID ni índices que choquen con SQL existente**: adaptar solo tras inspeccionar migraciones de base.
4. Determinar en `ROUTE_CONTRACT.md` qué middleware y ability EXISTENTES permiten alta/GET de titular; si no están aprobadas, gate cerrado. **No renombrar rutas antiguas ni crear alias** para resolver documentos contradictorios.
5. Comprobar si hay una **base QA MariaDB aislada ya disponible**, sin crear/iniciar contenedores, sin migrar esquema real de otros módulos. Un `phpunit.xml` con placeholder `127.0.0.1:1` o `.env.testing` inexistente significa que NO debes fingir DB PASS. No repetir diagnosis Docker.
6. Seleccionar patrón visual real Flutter existente para UI; no modificar kiosco, outbox o PortalController salvo enlace de navegación que esté ya protegido y aprobado. Hacer **implementación**, no detenerse tras el inventario.

## 3. CONTRATO DE DATOS — MÍNIMO, PROTEGIDO Y REPRODUCIBLE

### 3.1 Esquema (solo si no hay contrato existente compatible)

Crear dos migraciones o una migración agrupada con **solo** dos tablas cohesionadas:

**`leave_requests`**: PK con tipo real según el esquema; `public_id` aleatorio no enumerable si no existe UUID externo previo; `company_id` FK del mismo tenant, `site_id` solo si fuente aprobada de sede, `employee_id` ligado al identificador real de `sync_employees` y con compañía/sede verificadas, `created_by_user_id` derivado de sesión server, `category` del enum existente o candidato de QA, `starts_at`, `ends_at`, offset/timezone reproducible, `reason_summary` breve y opcional, `status`, `version` entero para CAS, `idempotency_key` y `payload_fingerprint`, timestamps. No usar cascada que destruya solicitudes/historial en bajas de usuario/empresa. Restricciones FK/composite únicas solo si columnas, longitudes y tipos reales admiten ese índice; si no, defensas en transacción+pruebas y marcar limitación explícita, **sin declarar FK existente**.

**`leave_request_events`**: PK real, `request_id` FK restrictiva, `company_id` consistente, `sequence` monotónico por solicitud o versión correlacionada, `transition`, `from_status`, `to_status`, `actor_user_id` derivado del middleware (o actor QA interno etiquetado que NUNCA se expone como humano real), `reason` acotado/neutral, `occurred_at` en reloj servidor y timestamps. El historial es **append-only en la aplicación**; no declarar garantía contra ALTER/DELETE de administradores de base de datos. Evitar `update`/`delete` ordinarios sobre eventos, sin hard-delete, backups reales ni cambios retroactivos. Guardar transiciones atómicamente junto al estado actual.

**Privacidad:** no añadir campos `diagnosis`, `medical_history`, `clinical_record` ni ruta de adjuntos, cifrado médico ficticio, storage público o log con motivos completos. Usar categoría neutral, motivo opcional 0–300 caracteres; si alguien escribe un diagnóstico en texto libre, informar/validar límites, evitar enviarlo a logs o exportaciones; **no asegurar que un regex detecta toda información médica**. Para `sick_leave`/`appointment*`, preferir descripción corta preestablecida o vacía por defecto. La política de datos médicos queda sin aprobación, **no incluir archivos adjuntos**.

**Categorías candidatas QA** (no códigos jurídicos aprobados): `permission`, `appointment_eps`, `appointment_private`, `emergency`, `sick_leave`, `vacation`. Si las categorías aprobadas del checkout son diferentes, reutilizar sus códigos con mapping único documentado y sin enum paralelo.

**Modelo de tiempo:** instantes ISO8601 con offset para eventos/solicitudes de horas o pareja fecha+zona IANA según contrato existente; permitir intervalos multidiarios y nocturnos conservando los límites originales. Rechazar `ends_at <= starts_at`, fecha imposible, string sin timezone en modo timestamp o duración irrazonable según regla documentada (no imponer máximo jurídico inventado). No sumar estos periodos a asistencia ni a nómina, no confundir DST con cambio de día.

### 3.2 Identidad y alcance

- `company_id` de la ruta o query es **selector**, nunca autoridad. Extraer `user_id` de Sanctum autenticado y `employee_id` de **vínculo activo comprobado del mismo tenant**. Comprobar empresa activa, membership activa y condiciones actuales de empleado/sede, sin asumir que `company_memberships` equivale a un empleo.
- `employee_id` **nunca procede de un POST personal**: responder 422 a ese campo, sin ignorarlo en silencio. `created_by_user_id`, `actor_user_id`, `actor_role`, `status`, `version`, `public_id` y `company_id` no son sobrescribibles por mass-assignment.
- GET lista/detalle/acciones con `where company_id` + empleado derivado del vínculo; para revisores solo con policy aprobada que compruebe también sede y operación. 404 sin PII para folio ajeno, 403 para permiso denegado conforme contrato actual. Revocación de vínculo, membership o token debe impedir nuevas operaciones; preservación legal de acceso a históricos se decide por contrato, **no suponer borrado u ocultamiento permanente de derechos del titular**.
- **No crear** ruta comercial de revisión ni botón web de aprobación cuando falta permiso. Un actor QA de test unitario sirve para comprobar transición **pero no sustituye un permiso de HTTP**. Sin login web real no declarar que el revisor navega comercialmente.

### 3.3 Idempotencia de altas y concurrencia

- Al crear, exigir/validar `Idempotency-Key` UUID/valor opaco acotado (p. ej. 16–128 caracteres), **por usuario+empresa**. Guardar índice UNIQUE **real** para `(company_id, created_by_user_id, idempotency_key)` si las columnas/tipos lo permiten; el fingerprint incluirá **todos los datos normalizados que afectan negocio**, incluyendo el `employee_id` resuelto y la categoría, el rango con offset, la sede y el motivo. Excluir tokens y campos derivados no relevantes.
- Construir payload canónico ordenando explícitamente sus claves antes de SHA256 para que distinto orden JSON no produzca distintas huellas. Comparar la misma key+misma huella después de validar tenant/identidad y devolver **mismo folio**, sin insertar solicitud ni evento extra (`200`); misma key+huella diferente ⇒ `409` sin mutaciones. El primer alta devuelve `201` y **un único** evento `submitted`.
- Hacer creación+historial **en UNA transacción**. Con peticiones simultáneas, confiar en UNIQUE real o bloqueo atómico; si una inserción choca, consultar la fila previa scoped dentro de la resolución y comparar fingerprint, **sin duplicar evento**. SQL de error duplicado se captura **solo** para constraint esperado, no silenciar fallos ajenos. Evitar reintentos ilimitados y `sleep` arbitrario.
- Las transiciones `PENDING → ...` usan transacción `lockForUpdate` o CAS de `version` más append del evento **antes del commit**. Dos decisiones concurrentes ⇒ una gana, la otra 409 sin evento terminal duplicado. La prueba de concurrencia **real** solo es PASS si corren dos conexiones separadas en MariaDB QA. Dos calls seriales son test de estado, no de carrera.

### 3.4 Estados y máquina pequeña, sin motor paralelo

| Estado actual | Acción | Actor autorizado | Estado siguiente | Efecto permitido |
|---|---|---|---|---|
| sin solicitud | `submit` | titular vinculado (QA) | `PENDING` | registro y evento `submitted` |
| `PENDING` | `request_clarification` | revisor con policy real | `NEEDS_CLARIFICATION` | evento+motivo (sin diagnóstico) |
| `NEEDS_CLARIFICATION` | `answer_clarification` | titular de la solicitud | `PENDING` | evento de respuesta, sin borrar el anterior |
| `PENDING` | `approve` | revisor con policy real | `APPROVED` | decisión operativa; NO nómina/saldo/horas |
| `PENDING` | `reject` | revisor con policy real | `REJECTED` | motivo breve y auditable |
| `PENDING` o `NEEDS_CLARIFICATION` | `cancel` | titular de la solicitud | `CANCELLED` | evento; no borrado |
| `APPROVED`, `REJECTED`, `CANCELLED` | cualquier transición | ninguno | `409` | NO mutación |

**Error material corregido de V1:** el oráculo O18 NO puede pedir respuesta a aclaración estando en `PENDING`. El flujo correcto exige `NEEDS_CLARIFICATION → PENDING` por el titular; estados `from/to` deben coincidir con la fila histórica y el estado final. Si hay otra máquina aprobada en checkout, respetarla y documentar el único mapping, no imponer esta tabla candidata sobre un contrato ya fijado.

## 4. CONTRATOS HTTP Y FLUTTER — IMPLEMENTAR UN VERTICAL, NO UNA DEMO

### Backend: rutas personal Sanctum según convención real

**Rutas candidatas** únicamente si no hay equivalentes aprobadas; insertar bajo el mismo grupo `auth:sanctum`, `account.active`, `device.active`, ability adecuada y `tenant.company` que usa el GET personal:

- `POST /api/v1/companies/{company}/me/requests` → `201` nueva, `200` replay, `409` key conflict, `422` invalid.
- `GET /api/v1/companies/{company}/me/requests` → paginado acotado, orden estable, sin PII ajena, headers `private, no-store`.
- `GET /api/v1/companies/{company}/me/requests/{request}` → propia; ID ajeno 404, timeline mínimo para titular.
- `POST /api/v1/companies/{company}/me/requests/{request}/cancel` → cancelación propia legal del estado o 409.
- `POST /api/v1/companies/{company}/me/requests/{request}/clarification` → **solo** cuando el estado y contrato admiten la respuesta del titular.
- `GET /api/v1/companies/{company}/requests`, `POST .../{request}/decision` **SOLO** si existe permiso de revisor con evidencia aprobada y middleware probado; si no existe, NO registrar rutas comerciales de revisión.

**Exposición por ambiente:** no abrir enrolamiento ni rutas de demo públicas. Si el acceso laboral está autorizado **únicamente mediante fixtures QA** y no hay contrato productivo de vínculo, impedir activación comercial de **nuevos endpoints de solicitud** fuera del ambiente seguro `testing` mediante gate default-deny **sin desactivar rutas/autoridad preexistentes**. Esto es un estado provisional documentado, NO un permiso comercial. Si un contrato ya aprobado prescribe otro gate, conservarlo y justificarlo con la fuente. `testing` por sí solo NO autoriza usar usuarios/empresas reales.

**Implementación:** reutilizar FormRequest/validación, Eloquent/query builder y policies/middleware reales. Una clase pequeña focal para transiciones e idempotencia cuando efectivamente la comparten acciones; si la lógica cabe coherentemente en el propietario existente, no crear clase adicional. No añadir almacén paralelo, queue, tabla de outbox, notificaciones reales, migraciones destructivas o rutas públicas. Asegurar no-store en detalles y listados.

### Flutter personal: una pantalla útil, no otro login

- Integrar `Mis solicitudes` en la navegación personal **ya existente** sin tocar PIN del kiosco. Reutilizar `PersonalSessionController`, identidad, bearer token en memoria y transporte HTTP con límite corregido por S5; sin cache personal persistente ni nuevo package.
- Crear/consultar con estados visuales: vacío, carga, folio `PENDING`, `NEEDS_CLARIFICATION`, decidido, cancelado, 401, 403, 422, 409 y error/red. **Solo mostrar «Enviada» tras 201 o replay 200 válidos del backend**. Un timeout no autoriza asumir fracaso o repetir con **otra key**: conservar key en memoria para reintento de **la misma acción**; si no existe outbox durable, no mostrar «en cola» ni «se enviará cuando haya conexión».
- Protección A→B: invalidar operación/respuesta de la sesión anterior si cambia token, usuario o empresa; evitar que respuesta tardía, detalles, errores, motivo o folio de A aparezcan en B. Logout limpia datos y no transforma host fake en revocación remota probada.
- Motivos breves y no obligatorios; para citas/incapacidades pedir solo datos de horario/periodo y categoría, sin diagnóstico. No añadir uploads ni selectors de saldo desconocido. Mantener etiquetas/semántica del proyecto si hay UX aprobado; si no, prototipo QA candidato.
- Portal B16: sin login web real ni permiso de revisor aprobado, NO añadir enlace que prometa aprobación navegable; no modificar Hoy/Sedes/Turnos/CSV por B17. Si existe guard/policy de revisión aprobados, solo un enlace focal a listados protegidos; si no, `PORTAL_REVIEW_UI=BLOCKED_CONTRACT`.

## 5. SECUENCIA DE TRABAJO, EN UN SOLO MACROBLOQUE

**F0 — Custodia y fuente real (una vez).** Capturar estado git/sha y prebytes de **cada archivo** a modificar bajo D:. No modificar nada antes de registrar baselines propios. Registrar `BASELINES/ABSENT_PRE_B17` para nuevos archivos sin fingir un preestado vacío como fuente existente. Comprobar schema real. Un archivo WIP modificado por otro autor no se descarta.

**F1 — Motor y DB.** Extender esquema existente o crear las dos tablas si ninguna compatible; implementar resolver identidad/tenant y estado+historial atómico, idempotency. Si no hay DB real, generar migración/tests unit host y marcar `PASS_DB_REAL=NO`; no llenar DB simulada y llamarla persistencia probada.

**F2 — API protegida.** Exponer solo acciones propias con middleware y gate de entorno según §4. 401/403/404/409/422 reales, respuesta minimal JSON, pagination/orden/no-store. La API no contiene un permiso de revisor inventado.

**F3 — Flutter integrado.** Pantalla de listado/alta, cancelación y respuesta aclaración cuando esté permitida, cliente tipado, fixtures de widget y A→B, sin paquetes ni caché paralela. Si falta contrato de sesión, terminar el componente host con integración gate fail-closed, no sustituir el login por fake.

**F4 — Tests focales RED→GREEN.** Reproducir el defecto real cuando hay código previo (scoping, duplicado o transición); si se trata de funcionalidad nueva, RED=`MISSING_FEATURE_EXPECTED` en vez de etiquetarla regresión. Ejecutar pruebas focales y adyacentes necesarias, guardar salida y exit exactos. Nada de B14 1000, suites globales ni Android/AVD/Docker por rutina.

**F5 — QA condicionada por ambiente.** Si MariaDB QA **aislada** existente permite migraciones sintéticas, usarla para doble conexión y rollback; si no `DB_QA=NOT_RUN_ENV`. PHPUnit host con fakes/mocks se registra como `PASS_HOST_MOCKED`, jamás `PASS_DB_REAL`. Flutter widget PASS host ≠ Android. NO ejecutar experimentos sobre DB de producción/otros proyectos.

**F6 — Custodia final + ZIP.** Verificar branch, HEAD, staged, inventario tracked/untracked+hashes de archivos tocados. Reproducir parche en copia aislada y validar SHA de fuentes reconstruidas. Sanear secretos/PII **antes** del ZIP sin alterar el WIP protegido. Entregar una sola salida, no un diagnóstico parcial.

## 6. 36 ORÁCULOS MANTENIDOS (CORREGIDOS), CADA UNO CON VEREDICTO REAL

Crear `TEST_MATRIX.csv` con O01–O36; columnas `id,esperado,ambiente,command,exit,source_SHA256,evidence,result,limit`. Resultado SOLO `PASS_STATIC`, `PASS_UNIT`, `PASS_HOST_MOCKED`, `PASS_HOST_WIDGET`, `PASS_DB_REAL`, `PASS_HTTP_KERNEL`, `PASS_BROWSER`, `BLOCKED_CONTRACT`, `NOT_RUN_ENV`, `FAIL`, `NOT_APPLICABLE_JUSTIFIED`. Para decir PASS citar log+exit+hash; una inspección no es una prueba de backend.

### O01–O08 — Autorización/tenancy

- **O01** Anónimo GET/POST requests → rechazo conforme contrato (401 JSON), sin PII.
- **O02** Token Sanctum sin ability necesaria o revocado → rechazo sin payload personal.
- **O03** Titular A de empresa X crea/lee solo `employee_identity_links` activo y scope X, nunca B.
- **O04** Payload personal con `employee_id`, `company_id` o `actor_user_id` inyectado → 422; no cambia sujeto.
- **O05** Revocado vínculo, usuario inactivo o empresa inactiva → bloqueo de nuevas operaciones; lectura histórica según contrato existente, sin asumir borrado de derechos.
- **O06** Membership simple sin vínculo personal no crea ni lee datos como empleado.
- **O07** Owner/admin sin permiso HR explícito NO puede aprobar/rechazar (ni usar endpoint comercial).
- **O08** Cambiar de usuario/empresa A→B no expone lista, timeline, motivo, token, folio ni errores de A.

### O09–O16 — Altas/lectura/idempotencia

- **O09** POST válido → exactamente una solicitud PENDING y un evento submitted, folio opaco, 201; IDs y actor del servidor.
- **O10** Misma Idempotency-Key + payload semánticamente igual en diferente orden JSON → mismo folio 200, **sin** segundo evento.
- **O11** Misma key + categoría, rango, empleado resuelto o motivo distintos → 409 sin mutaciones ni fuga de datos.
- **O12** Fechas invertidas, timezone ambiguo, tipo/longitud inválidos → 422 y 0 escrituras.
- **O13** Solicitud nocturna/multidía conserva instantes/offset, sin construir horas fichadas.
- **O14** Categoría no permitida o razón > 300 → 422 sin poner entradas médicas en logs.
- **O15** GET lista paginada, detalle e historial para titular, no para otro empleado, orden estable.
- **O16** GET/login/replay de idempotencia no modifica historial, asistencia ni outbox B14.

### O17–O24 — Transiciones, atomicidad y concurrencia

- **O17** Revisor **con policy aprobada o fixture interno NO HTTP**: PENDING→NEEDS_CLARIFICATION con evento+motivo.
- **O18 CORREGIDO** Titular responde **desde NEEDS_CLARIFICATION hacia PENDING** y agrega evento `clarification_answered`; desde PENDING sin aclaración pendiente → 409.
- **O19** PENDING→APPROVED solo revisor aprobado o actor QA interno; no sobrescribe `submitted` ni descuenta saldo.
- **O20** PENDING→REJECTED con motivo breve y actor apropiado; asistencia intacta.
- **O21** PENDING/NEEDS_CLARIFICATION→CANCELLED por titular; estados terminales bloqueados.
- **O22** Doble aprobación, cancel después de decisión o reintento de transición terminal → 409 sin evento duplicado.
- **O23** Carrera 2 conexiones MariaDB (mismo estado esperado) → una sola decisión, otra 409; **NOT_RUN_ENV** sin dos conexiones reales.
- **O24** Error forzado entre actualización de estado y append histórico → rollback de ambos en transacción real; mocks/SQLite no equivalen a MariaDB.

### O25–O30 — Derechos, privacidad y límites

- **O25** 6 horas observadas + 2 justificadas NO aparecen como 8 fichadas; los objetos permanecen separados.
- **O26** Sin ledger homologado, saldo vacaciones=UNKNOWN, nunca cero/descuento automático.
- **O27** Aprobar permiso no muta sueldos, nómina, `sync_events`, attendance, turnos ni calendario.
- **O28** Diagnóstico/soporte clínico NO requerido; motivos limitados; respuesta y logs ajenos no filtran contenido médico.
- **O29** No existen rutas de adjuntos públicos o uploads ficticios sin storage privado+permiso probado.
- **O30** A no extrae de B solicitud/actor/sede/motivo mediante URL, paginado, mensaje o respuesta de error.

### O31–O34 — UI personal y acceso web

- **O31** Flutter personal: vacío, carga, envío confirmado, error, offline, 401/403/409/422 y retry con **misma key** en timeout; sin cola falsa.
- **O32** A→B y logout descartan respuestas tardías y todo dato de A, sin leaks en widgets.
- **O33** Portal B16 no muestra CTA de aprobación comercial sin guard web real + policy HR aprobada; no bypass auth:web.
- **O34** Semántica/teclado/labels/foco/responsive host comprobables; Android/navegador real NOT_RUN si no se ejecutan.

### O35–O36 — Custodia y paquete

- **O35** Branch/HEAD sin cambios, staged=0, WIP tracked/untracked preservado salvo modificaciones B17 autorizadas; temporales propios D:.
- **O36** Un solo ZIP con manifest SHA+bytes, CRC/extracción, patch + baselines, fuentes exactas, reportes y logs genuinos sin secretos; `NEXT_OWNER=CHATGPT`.

**Regla de aceptación:** `B17=PASS_QA_FUNCTIONAL_SCOPED` requiere creación+lectura propia+historial+operaciones de titular probadas efectivamente en entorno compatible, y ninguna fuga. Si DB real no se ejecuta, clasificar `B17=PARTIAL_HOST_OR_CONTRACT` salvo alcance host claramente definido. La suite del autor no demuestra L5 independiente. Un módulo de vacaciones sin ledger real nunca se declara completo ni jurídicamente homologado.

## 7. REPORTES DENTRO DE ZIP (UN ÚNICO ENTREGABLE)

El ZIP deberá incluir:

- `FINAL_REPORT.md`: cambios por ruta, autoría, estado de cada flujo, gates, errores, próximo bloque B18, `NEXT_OWNER=CHATGPT`.
- `CONTRACT_MATRIX.md`/`ROUTE_CONTRACT.md`: qué nombres del prompt eran candidatos, cuáles contratos y schema reales usaste; 401/403/404/409/422 por ruta, DTO, política, version/tenancy, UX flags.
- `SOURCE_CHANGE_MATRIX.csv`: archivo previo, origen tracked/untracked, hash real pre, hash post, razón, oráculos y pruebas.
- `SOURCES/` con **todos** los archivos nuevos/modificados; `BASELINES/` con bytes pre-reales de los existentes y `ABSENT_PRE_B17/` para nuevos, sin obviar archivos originalmente untracked.
- `PATCH_CANDIDATE.diff` reproducible con `dry-run` y `apply` en un **checkout/copias aisladas**, 1:1 con `SOURCES`; para nuevas fuentes untracked usar unified diff `- /dev/null`, sin `git add -N`/stage en el WIP.
- `TEST_MATRIX.csv` O01–O36 y logs originales de RED, GREEN, lint, `route:list` y Flutter focal con comandos y `EXIT_CODE`, o bloqueo exacto.
- `AUDIT_L1_L6_10_PASSES.md` diez autorrevisiones × seis leyes, con observación, contraejemplo, corrección y límite; NO afirmar revisión independiente de Codex.
- `ENV_GATES.md`, `GIT_CUSTODY.md`, `SOURCE_HASHES_PRE_POST.csv`, `NEXT_GATE.md`, `MANIFEST_SHA256.txt`, y logs focales mínimos. ZIP sin `.env`, credenciales, tokens, PII, diagnósticos, dumps, claves, reportes de otro proyecto.
- Cerrar ZIP y comprobar member count, rutas relativas, duplicados, CRC, extracción de muestras, SHA256 **y tamaños 100%**, incluyendo artefacto `PATCH_CANDIDATE.diff`; no inventar auto-hash del manifest ni del ZIP adentro. Reportar hash externo y ruta única.

**No solicitar infraestructura nueva para declarar QA:** si no hay MariaDB disponible, entregar motor y UI probados en host, declarar límites y continuar. Prohibido iniciar Docker compartido. No tocar las 185 entradas del WIP fuera de los archivos estrictamente necesarios (el número actual debe verificarse de nuevo en D:, no asumirlo).

## 8. ALGORITMO DE DECISIÓN Y CIERRE SIN PINGPONG

1. **¿Ya existe contrato de solicitudes?** Sí → adaptar/reutilizar y no migrar duplicado. No → crear máximo las dos tablas conforme schema real.
2. **¿Existe auth personal con vínculo permitido?** Sí para QA → API y Flutter funcional sintético. No → código de dominio y pantalla host segura, endpoints fail-closed; explicar `BLOCKED_IDENTITY_CONTRACT`, **no alterar B13**.
3. **¿Existe autorización real para revisor?** Sí → rutas y transición aprobadas con pruebas. No → motor interno testable, sin endpoints/CTA admin, `BLOCKED_REVIEW_PERMISSION_CONTRACT`.
4. **¿Existe MariaDB QA aislada?** Sí → ejecutar migración+concurrencia+rollback focales con datos ficticios. No → `DB_REAL_NOT_RUN_ENV`, no contenedores nuevos ni renunciar a todo B17.
5. **¿Existe frontend personal seguro?** Sí → implementar pantalla/UI y host tests. No → cliente/DTO host protegido, no crear un login secundario.
6. **¿Ha aparecido un P0/P1 reproducible nuevo?** Documentar causa, bloquear solo la operación insegura, no inventar solución, entregar ZIP con código seguro parcial. Si NO → entregar ZIP y pasar la dirección a ChatGPT y luego B18; no autogenerar S2 ni pedir otra auditoría de prompt.

## 9. FORMATO FINAL QUE DEBE RESPONDER CODEX

Una sola línea de estado y **una ruta ZIP** (no reportes desperdigados):

`TASK_ID=JOR-B17-S1-V2-REQUESTS-SECURE-LEDGER-ONEBATCH-20261113 | B17=... | PERSONAL_REQUEST_HTTP=... | REVIEW_PERMISSION_GATE=... | HISTORY_ATOMIC=... | IDEMPOTENCY=... | DB_REAL=... | FLUTTER_HOST=... | L5_INDEPENDENT_RUNTIME=NOT_RUN | WIP_PRESERVED=... | ZIP_SHA256=... | NEXT_OWNER=CHATGPT | RELEASE_APPROVED=NO`

**FIN DE LA ÚNICA ORDEN. EJECUTAR AHORA. NO ENTREGAR PRE-REPORTE SIN CÓDIGO NI CAMBIAR DE TECNOLOGÍA.**