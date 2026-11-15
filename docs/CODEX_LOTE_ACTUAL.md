# CODEX LUNA — JORNATO B20-S1 V2 · MACROBLOQUE FINAL ATS SEGURO Y RECLUTAMIENTO QA

**ESTA ES LA ÚNICA ORDEN EJECUTABLE.** Sustituye B20-S1 V1, que NO se debe ejecutar. La V1 nunca fue implementada; este documento corrige instrucciones ambiguas de su texto, no fallos observados del código B20. **Ejecutor:** CODEX LUNA. **Director y aceptador:** ChatGPT. **No pedir otro micro-prompt.**

**TASK_ID:** `JOR-B20-S1-V2-ATS-ROOT-CAUSE-ONEBATCH-20261115`  
**WORK_ROOT:** `D:\codex\Jornato` (Windows 11 Home; usar su checkout WIP real, no el `main` remoto).  
**REPORT_ROOT:** `D:\codex\_REPORTES\Jornato\JOR-B20-S1-V2-ATS-ROOT-20261115`  
**OUTPUT_ZIP EXACTO:** `D:\codex\_REPORTES\Jornato\JOR-B20-S1-V2-ATS-ROOT-20261115\JOR-B20-S1-V2-ATS-ROOT-20261115-UNICO.zip`  
**NEXT_OWNER tras entrega:** `CHATGPT_DIRECTOR_AUDIT_B20_THEN_B21`. **RELEASE_APPROVED=NO**.

## 0. Situación real y límites de autoridad

- ÚLTIMO BLOQUE ACEPTADO: `B19_GLOBAL=PARTIAL_HOST_OR_CONTRACT`. ZIP B19 SHA256 `4C906785C63B500B76B7088D5B65261CEB062BF7DB0EF70F4ADEE3357243B44D`: 70 miembros, manifest 69/69, patch 17/17 byte exactos y `php -l` 17/17 reejecutados por ChatGPT. Los 16 PHPUnit/96 aserciones son **solo evidencia de Codex** con repositorio memoria/Storage::fake; no equivalen a MariaDB. `AppServiceProvider` contiene binding **DenyAllDocumentAccessAuthorizer**; NO alterarlo ni abrir rutas B19.
- B13–B18: auditorías y QA focal ya realizadas; **NO repetirlas**. `B13–B19_GLOBAL=PARTIAL/NOT_APPROVED`, `WEB_LOGIN_REAL=BLOCKED_EXISTING_AUTH_CONTRACT`, `HR_POLICY=BLOCKED_CONTRACT`, `PERSONAL_IDENTITY=BLOCKED_CONTRACT`, `PRIVATE_STORAGE_PRODUCTION=NOT_VERIFIED`, `L5_INDEPENDENT_RUNTIME=NOT_RUN`. No permiso comercial de reclutamiento, aviso de privacidad aprobado, retención aprobada, escáner malicioso, endpoint público ni email real. No inventarlos.
- La SPEC V5 MOD-12 / UX-21 / B20-H8 **es candidata**. El objetivo B20-S1 es construir el vertical ATS de servicio + persistencia + visualización de QA sintética, **cerrado para público**. No confundir esta entrega con módulo comercial completo. B21 integrará y probará las puertas pendientes; B22 requiere GO escrito propietario. No cambiar alcances comerciales ni homologar decisiones legales unilateralmente.
- En GitHub rama documental `docs/pingponglaw-l1-l6-canon-84e961c`, `docs/JORNATO_CONTINUIDAD.md` / `docs/CODEX_LOTE_ACTUAL.md` registran el rumbo. **No copiar esa rama sobre el WIP local** y NO tocar GitHub. Canon L1–L6 fijo `84e961cadf482d234f4c0ee2ca60e8c7e9b388e8` en repositorio PingPongLaw.

## 1. Leyes L1–L6 traducidas a ejecución, sin ruido

1. **L1 KISS/Ponytail:** Laravel monolito, Eloquent + PHPUnit + Blade existentes, `private-files` configurado; un agregado B20, servicios/repo concretos y cuatro tablas como techo **solo si no hay ATS compatible**. Nada de SPA, paquetes nuevos, colas, eventos async, segundos motores, servicios nube, Docker compartido ni nuevas DB.
2. **L2 Antirruido:** inspección dirigida **una vez**: `server/routes/{api,web}.php`, auth/policies/tenancy, migraciones de `companies`, `sites`, B14 `sync_employees`, B19; `AppServiceProvider`, storage privado, Blade B16, PHP tests. Buscar `recruitment|vacancy|application|candidate|interview`; reutilizar lo compatible. Sin inventario de todo el sistema ni escanear otros proyectos.
3. **L3 Antiparches:** arreglar invariantes de identidad, estados, idempotencia y agenda en sus fuentes. `company_id` del contexto servidor QA tipado, o de membresía real autorizada cuando exista; nunca conceder poder a `company_id/actor_id/site_id` del JSON/URL. No meter candidatos en `users`, `sync_employees` ni `EmployeeDocumentVault`.
4. **L4 UX humana:** Blade host con vistas `DRAFT`, `RESTRICTED`, `EMPTY`, `NOT_AVAILABLE`, agenda con zona horaria y errores claros; render HTML escapado y legible móvil. Ningún botón de “publicar”, “enviar aviso”, “ver CV” o “contratar” si no funciona con permisos reales; no representar fixtures como personas verdaderas.
5. **L5 Verificación:** diferenciar `PASS_HOST_SYNTHETIC`, `PASS_STATIC`, `BLOCKED_CONTRACT`, `NOT_RUN_ENV`. Test con repositorio memoria/Storage::fake **no** prueba UNIQUE/locks/FO/DB, permisos IAM ni escaneo antimalware. L5 independiente de producto queda pendiente hasta ejecución sobre mismo SHA en B21.
6. **L6 Antipingpong:** un macrobloque A–F, 40 oráculos canónicos **sin renumerar**, ejecuciones focales; una sola reproducción de patch y un ZIP. No 40 suites, no reauditoría B19 ni V3 ritual. Diez breves autocontroles L1–L6 del propio B20 dentro del ZIP, sin 10 ciclos de builds.

## 2. Paso cero y custodia: solo D: sin destruir WIP

**A.** Leer `AGENTS.md` local y `docs/JORNATO_CONTINUIDAD.md` si existen; prevalece WIP actual y esta orden para B20. En `D:\codex\Jornato` registrar `git branch --show-current`, `git rev-parse HEAD`, `git status --porcelain=v1 -uall` y staged actual. Inventariar ruta, tamaño y SHA256 de **todos los archivos de producto existentes incluidos untracked** antes de editar, excluir caches ignoradas sin baseline, no afirmar hash de lo no capturado. El recuento 199 de B19 es histórico, NO gate numérico fijo. Registrar una matriz exacta PRE/POST.

**B.** Nunca `git add/reset/clean/stash/rebase/checkout`, no commit/push/merge/deploy ni limpieza de cambios de terceros. Si hay staged ajeno, no tocar; dejar explícito. No escribir en `C:`, no abrir/modificar otros repos ni Docker compartido. Temporales y pruebas solo `D:\codex\_RUNTIME\Jornato` o subcarpeta segura D: con `TEMP/TMP` del proceso dirigidos allí cuando sea necesario. No instalar herramientas para obtener PASS. No crear/alterar `.env` de producto ni romper PHP/Flutter existentes.

**C.** Una página `REUSE_DECISIONS.md`: rutas y tablas reales disponibles, nombre del disco privado, policy real (o ausente), modelos reutilizables; decidir 0–4 tablas. Sólo editar archivos pertinentes B20 y `AppServiceProvider` si binding necesario; si se modifica archivo compartido, incluir baseline real y regresión focal vecina. Una ausencia de MariaDB QA aislada no detiene las fases B–D.

## 3. Contrato de dominio concreto que debes implementar

### 3.1 Modelo mínimo (sin framework ATS paralelo)

Si no hay entidades equivalentes, máximo **cuatro tablas nuevas InnoDB**:

| Tabla | Campos mínimos, clave y función |
|---|---|
| `recruitment_vacancies` | `id`, `company_id`, `site_id?`, `title`, `description_short` sin PII, `state`, `token_hash` nullable, `token_version`, `expires_at_utc`, `revoked_at_utc`, `created_by_actor_ref_hash`, UTC timestamps; único tenant+id. DRAFT/READY_FOR_PUBLICATION/CLOSED |
| `recruitment_applications` | `id`, `company_id`, `vacancy_id`, `candidate_ref` UUID sintético, `state`, `cv_storage_key?`, `cv_sha256?`, `cv_bytes?`, `malware_status=NO_VERIFICADO`, UTC timestamps; vínculos tenant+vacancy por índice/FK compuesto |
| `recruitment_interviews` | `id`, `company_id`, `application_id`, `interviewer_ref` sintético, `start_at_utc`, `end_at_utc`, `timezone` IANA, `state` SCHEDULED/CANCELED/COMPLETED, UTC timestamps; índices tenant+interviewer/tiempo y tenant+application/tiempo |
| `recruitment_events` | `id`, `company_id`, `actor_ref_hash`, `request_id` UUID, `payload_fingerprint` SHA256, `operation`, `resource_type/id`, `outcome_ref` para replay, `affected_resource_refs?` JSON sin PII cuando una mutación cancela citas, `from_state/to_state`, `reason_code`, `occurred_at_utc`; **UNIQUE(company_id, actor_ref_hash, request_id)**; eventos append-only de aplicación |

Usar las claves y constraints reales del esquema. Antes de escribir FK compuesta, comprobar que el padre tiene índice/candidata UNIQUE compatible; crear índice candidato compatible **solo en las tablas B20** si procede, no alterar masivamente B14. No permitir pares `company_id/vacancy_id/application_id` inconsistentes por consulta o relación. `site_id` solo donde existe y pertenece a `company_id`; no exigir sede inventada. No guardar email real, documento personal, teléfono, dirección, diagnóstico, salario, CV real, identidad de postulante sin contrato o contraseñas. IDs opacos para UI; fixtures `CAND-QA-001` etc no son personas reales.

**Regla de densidad de eventos:** una mutación de negocio lógica produce **un evento de auditoría B20** junto con su cambio de estado (la mutación puede afectar entrevista/aplicación, pero es una operación). No crear un segundo evento con el mismo `request_id` porque el UNIQUE canónico lo prohibiría. No sobrescribir ni borrar entradas para ocultar resultado; append-only a nivel aplicación, **NO** afirmar WORM/DB inviolable.

### 3.2 Autorización única, sin inventar roles

Crear `RecruitmentAccessAuthorizer` con acciones explícitas `VACANCY_READ/WRITE`, `APPLICATION_SUBMIT_QA/READ/DECIDE`, `INTERVIEW_WRITE/READ`, `CV_READ`, `HANDOFF`. Vincular **`DenyAllRecruitmentAccessAuthorizer` en el contenedor Laravel productivo**, no al `owner/admin` por nombre. `AllowSyntheticRecruitmentAccessAuthorizer` SOLO en namespace de tests (por DI), con fixture tipado empresa/actor/vacante y rol QA; JAMÁS resolverlo desde request HTTP, bandera env o proveedor productivo. Cada comando y consulta debe llamar `authorize` y confirmar tenant, sitio y pertenencia del recurso. El input cliente no determina autoridad. Una ruta protegida no es segura solo por estar oculta: en B20 **NO crear rutas B20 públicas ni QA** hasta contratos reales de RR. HH., consentimiento, CSRF/auth y rate limit aprobados. `route:list` deberá conservar cero rutas ATS añadidas.

**Separación muy importante:** un token QA puede permitir, dentro de un método de servicio exclusivamente de prueba, solicitar la creación de una postulación sintética vinculada a una vacante; NO concede permiso de reclutador, consulta de postulaciones, cambio de empresa, entrevista ni lectura CV. En ausencia de política real, el autorizador productivo deniega incluso con un token válido. El titular de una postulación QA usa un contexto/candidate_ref sintético específico, no es una cuenta `users` ni un PAT de kiosco.

### 3.3 Máquina de estados sin ambigüedades

**Vacantes:** `DRAFT → READY_FOR_PUBLICATION → CLOSED`. `READY_FOR_PUBLICATION` es aptitud editorial **no publicación**; no URL real, webhook o email. Editar DRAFT mediante mutación versionada en eventos; no editar en silencio una vacante READY si ya tiene postulaciones. Cierre revoca token y bloquea nueva postulación.

**Postulaciones (tabla exacta):**

| Desde | Hacia permitido | Prohibido |
|---|---|---|
| `RECEIVED_QA` | `SCREENING`, `REJECTED`, `WITHDRAWN` | saltar a entrevista terminada o contratación |
| `SCREENING` | `INTERVIEW_SCHEDULED`, `REJECTED`, `WITHDRAWN` | saltar a empleado, saltar a SHORTLISTED |
| `INTERVIEW_SCHEDULED` | `INTERVIEWED`, `REJECTED`, `WITHDRAWN` | cerrar entrevista sin registro o contratar |
| `INTERVIEWED` | `SHORTLISTED`, `REJECTED`, `WITHDRAWN` | retorno a RECEIVED_QA |
| `SHORTLISTED`, `REJECTED`, `WITHDRAWN` | ninguna sin contrato nuevo aprobado | auto-reapertura |

La cadena `RECEIVED_QA→SCREENING→INTERVIEW_SCHEDULED→INTERVIEWED→SHORTLISTED` conserva el happy path del **O17 original**; `WITHDRAWN/REJECTED` son salidas terminales válidas también desde fases tempranas. Cuando una decisión terminal `WITHDRAWN/REJECTED` afecte una entrevista futura `SCHEDULED`, marcarla `CANCELED` **en la misma transacción de empresa** y registrar sus referencias en el único evento de la mutación; nunca dejar una cita activa para un candidato retirado/rechazado ni generar dos eventos con el mismo `request_id`. Al pasar a `INTERVIEWED`, confirmar entrevista existente y pasarla a `COMPLETED` junto con la transición y el evento único. Una evaluación no crea ausencia ni marca de fichaje. `READY_FOR_HR_HANDOFF` es **solo una proyección** sobre SHORTLISTED, no un evento de contratación. Handoff real debe devolver `HANDOFF_BLOCKED_CONSENT_IDENTITY_HR` sin insertar usuarios, `sync_employees`, B19, B17 ni B18.

**Derechos del candidato ≠ estado de postulación.** `RIGHTS_REQUESTED` es `event.operation`/`reason_code` para registrar la solicitud de derechos sintética sin borrar datos ni declarar que se cumplió. El estado de la postulación solo cambia si además hubo acción `WITHDRAW` independiente, con request_id propio. No crear otra tabla para derechos ni mentir sobre eliminación/retención.

### 3.4 Invitación QA: valor efímero, hash persistente

Generar token de invitación con `random_bytes(32)`/CSPRNG, codificación estable segura, persistir **solo digest SHA-256** y `token_version`, expiración UTC y revocación. Entregar el token crudo **una sola vez** como valor de retorno en memoria al llamador del test DI; no guardarlo en DB, archivo, log, PHP debug, respuesta HTTP, plantilla, `FINAL_REPORT`, ZIP ni `TEST_MATRIX`. En una prueba QA, el test guarda el token en variable local y lo presenta de nuevo al servicio QA; no imprimirlo. Comparar hash con `hash_equals` después de localizar la vacante scopeada; cerrada/revocada/vencida/reemplazada ⇒ respuesta DENY genérica. Token QA NO autoriza lectura/operación HR y NO crea URL pública. Un token para vacancy A no acepta la vacancy B; la comprobación no puede depender del ID de empresa que envíe el supuesto candidato.

**Postulación QA solo si:** estado vacancy `READY_FOR_PUBLICATION` + token vigente + actor/contexto QA inyectado + PDF **sintético** válido + `request_id` nuevo + `candidate_ref` opaco. Cierre y revocación bloquean. Reintento con token vencido debe DENY aun si se conoce `request_id`, para no validar identidad por replay. Dos candidate_refs distintos nunca se deduplican por nombre, correo o CV; solo `request_id` válido por actor+empresa define idempotencia.

### 3.5 Idempotencia y transacción: sin carrera ni segundo ledger

- Cada operación mutativa recibe UUID4 `request_id` **único por operación intencional** y actor/contexto QA estable; se valida formato. `fingerprint = sha256(canonical(operation, company_id, actor_ref_hash, resource_ref, normalized_payload, cv_sha256_if_any))` con orden de campos estable, UTF-8, sin timestamps actuales, UUID generados del servidor ni whitespace incidental. No loggear payload con PII, token ni datos crudos.
- **Autorizar primero**, validar token y recurso; luego calcular huella con SHA del PDF validado **sin escribirlo todavía** y buscar evento de `(company, actor, request_id)`. Si existe y fingerprint igual ⇒ `REPLAY` con mismo resource_id/outcome, **sin escribir otro CV** y con un solo evento; si distinto ⇒ `CONFLICT` (no mutación, no CV nuevo). En ejecución inicial registrar cambio del dominio **y evento de resultado en la misma transacción DB corta**. Primer éxito `CREATED`, replay `REPLAYED`, conflicto `CONFLICT`; HTTP 201/200/409 solo para contrato futuro, NO exponer endpoint ahora.
- La unicidad SQL es autoridad para concurrencia; bajo carrera por el mismo request_id, manejar violación UNIQUE recuperando el evento confirmado y comparando fingerprint **sin duplicar**. Pruebas in-memory demuestran semántica secuencial, no bloqueos MariaDB. No insertar el evento en transacción diferente a la mutación que representa.
- Para guardado CV **en petición nueva confirmada no-replay**, validar/limitar bytes y hacer búsqueda de idempotencia previa **fuera de transacción**, escribir el objeto en `private-files` con clave aleatoria B20 propia antes de la transacción, hacer read-back checksum y luego iniciar transacción corta de metadatos+evento. Si fallo/race tras escribir: limpiar **solo la clave nueva del intento actual**, nunca la clave de otro request ya confirmado. Si crash deja objeto huérfano, informar `ORPHAN_POSSIBLE`, sin crear una nueva cola ni fingir atomicidad disco+SQL. En replay comprobado, no duplicar archivo. `CV=NO_VERIFICADO` en todo resultado host.
- Cuando haya MariaDB QA aislada ya disponible ejecutar 2 conexiones para carreras de idempotencia; si no, `IDEMPOTENCY_DB=IMPLEMENTED_DB_UNRUN`, `DB_REAL=NOT_RUN_ENV`. No fingir que FakeStorage/SQLite prueban UNIQUE+locks InnoDB.

### 3.6 Agenda: lock correcto a escala de empresa

Validar `start_at_utc < end_at_utc`, timezone IANA explícita y coherente con offset/local si se suministra; intervalos semiabiertos `[start,end)` (adyacencia permitida). Para un actor entrevistador y/o candidato, buscar conflicto **en toda la empresa** (no solo dentro de una vacante): activo `SCHEDULED`, `existing_start < new_end AND existing_end > new_start`, igual `interviewer_ref` **o** `candidate_ref` de aplicación. No confiar en texto de UI.

**En DB:** adquirir `lockForUpdate` sobre **la fila ya existente de `companies` del company_id** dentro de transacción corta, luego consultar conflictos y crear/reagendar/cancelar entrevista+evento en esa misma transacción. Todas las mutaciones de agenda B20 de la empresa deben respetar ese mismo bloqueo, evitando carreras incluso entre vacantes distintas; no bloquear solo vacancy ni solo interview existente porque eso dejaría libre la primera inserción. `companies` ya existe por B13; NO crear tabla de locks o quinta tabla. Se acepta la serialización por empresa en este primer ATS de bajo volumen; registrar como decisión para performance B21, no como garantía probada antes de dos conexiones DB. `COMPLETED` no se reprograma. Reagendar conserva el estado histórico en evento; cancelar marca `CANCELED` y no borra la fila. Si la postulación se retira, la próxima acción sobre su entrevista debe quedar bloqueada y la cancelación, cuando proceda, debe auditarse sin fingir avisos entregados.

**FAKE/host** prueba los solapes secuenciales, cruce de medianoche y adyacencias. `SCHEDULING_CONCURRENCY=IMPLEMENTED_DB_UNRUN` salvo dos conexiones MariaDB QA con la misma build y resultado verificable. Sin agenda Google, WhatsApp, SMS, emails ni contactos externos.

### 3.7 CV, almacenamiento y privacidad de QA

- **Solo PDF sintético** creado en test: máximo **2 MiB**, rechazo si > límite antes de guardar (leer en chunks hasta límite+1), extensión `.pdf`, contenido MIME `finfo`, `%PDF-` y estructura mínima `xref/trailer/startxref/%%EOF`, hash/bytes de fuente y read-back. La comprobación de estructura no demuestra PDF benigno ni antimalware; `MALWARE_SCAN=NO_VERIFICADO`. No instalar antivirus ni guardar/descargar CV reales. En producción, todo flujo de CV está **DENY-ALL**.
- Usar disco `private-files` existente, verificando que `serve=false`, local privado y raíz fuera de webroot. Adaptador B20 mínimo con key aleatoria `recruitment/{uuid}/{uuid}.pdf`; **no reutilizar el validador de key de B19**, limitado a `documents/{uuid}/{uuid}.pdf`, ni cambiarlo. Nada de URL firmada o ruta de descarga. `Storage::fake` únicamente en tests y resultados `PASS_HOST_FAKE`, nunca `PRIVATE_STORAGE_PRODUCTION=PASS`.
- Texto libre corto o motivo tipificado sin diagnósticos; nada de PII verdadera, email, teléfono, cédula, dirección, firma, imagen real o CV real en fixtures/logs/ZIP. Privacy notice, consentimiento, retención y borrado reales pendientes, **NO se deduce consentimiento de un token**. Registrar `RIGHTS_REQUESTED` como petición QA no como eliminación realizada. No activar vías públicas ni probar con postulantes reales.

### 3.8 UI honesta y productividad sin framework

Crear/reutilizar un componente Blade host en vistas de portal para lista vacantes, estado editorial, postulaciones sintéticas, entrevistas, acciones `RESTRICTED/NOT_AVAILABLE` y timeline. Renderizar test con `Blade::render()` o mecanismo del proyecto y variables sintéticas; navegación responsive sin enlaces a rutas ATS inexistentes, sin CTA clicable simulado, escape `{{ }}`, sin PII. Vacantes y postulaciones listadas por tenant y con orden estable (`created_at`, `id`), página máx. 50. La UI es `PASS_HOST_PREVIEW` si se ejecuta render; **NO** afirmar que el portal web real accede a ese Blade: `WEB_LOGIN_REAL=BLOCKED_EXISTING_AUTH_CONTRACT`.

## 4. Ejecución en una sola sesión, sin improvisación

**FASE A (lectura focal y baseline, una sola vez):** inventario WIP y sha; contratos y rutas reales; tabla/repo existente, `companies` para lock, storage y authorizer; `REUSE_DECISIONS.md` de máximo una página. No detenerse salvo daño real o incertidumbre de custodia.

**FASE B (código):** carpeta compatible `server/app/Services/B20`, modelos Eloquent, migración para 0–4 tablas, repositorio Eloquent y fake **solo de tests**, authorizer DENY-ALL y binding mínimo en `AppServiceProvider`. Un servicio `RecruitmentService` con comandos `createDraft`, `editDraft`, `markReady`, `closeVacancy`, `issueOrRotateQaToken`, `revokeQaToken`, `submitSyntheticApplication`, `transitionApplication`, `scheduleInterview`, `rescheduleInterview`, `cancelInterview`, `recordRightsRequest`, `blockedHandoff` y consultas paginadas; usar nombres de estilo local si existen. Implementar una acción de comienzo a fin, no solo clases vacías.

**FASE C (vertical y UI):** con `AllowSyntheticRecruitmentAccessAuthorizer` **inyectado en tests**, correr: crear vacante DRAFT → editar → READY → token QA → POST sintético con PDF QA → replay misma key y conflicto otro payload → screening → agendar/entrevistar → shortlist/reject/withdraw según fixture → consulta timeline → intento handoff bloqueado. En paralelo un caso retiro desde RECEIVED_QA y uno RIGHTS_REQUESTED sin mutar application state. Renderizar Blade con contenido sintético y estados claros. Mantener ruta comercial cerrada y sin personal real.

**FASE D (tests focales):** `php -l` únicamente PHP B20 y shared tocados; `vendor/bin/pint --test` si ya está; PHPUnit B20 tests, 40 oráculos agrupados (no 40 suites). Include suite de negativos: A/B, deny-all contenedor, token expire/rotate/closed, idempotencia, FK tenant, CV bytes, XSS/SQL parameterized, agenda inter-vacancy mismo interviewer y misma candidate, adyacente, DST, RIGHTS_REQUESTED, actor kiosk, handoff. Si no hay MariaDB QA aislada, generar migration pero `DB_REAL=NOT_RUN_ENV`, `CONCURRENT=IMPLEMENTED_DB_UNRUN`. `php artisan route:list` una sola vez para confirmar ninguna nueva ruta B20. **No reejecutar B19** salvo test focal de shared `AppServiceProvider` editado.

**FASE E (auditoría compacta y custodia):** registrar cada O con evidencia y alcance, 10 pasadas internas L1–L6 orientadas a B20, no reauditoría B13–B19. Capturar PRE/POST WIP; patch contra BASELINES originales tracked/untracked y nuevos absent; replay exacto **una vez** en árbol aislado, validar cada source byte y manifests, sin editar producto extra. No stage/commit/push/merge/deploy.

**FASE F (ZIP único):** empaquetar solamente lo especificado abajo, confirmar zip CRC/manifest y SHA256 total; texto final con estado honesto y `NEXT_OWNER=CHATGPT`, NO abrir B20-S2 ni publicar releases.

## 5. Oráculos CANÓNICOS O01–O40 (texto preservado byte por byte desde V1)

Cada O registrarlo en `TEST_MATRIX.csv` columnas `oracle_id,requirement,command,test_case,expected,observed,exit_code,evidence_sha256,status,scope,limitation`. Lo **PASS_HOST_FAKE** solo si se ejecutó prueba focal; lo **PASS_STATIC** solo si se inspeccionó fuente; `NOT_RUN_ENV`, `BLOCKED_CONTRACT`, `NOT_APPLICABLE_EXPLAINED` para lo no probado. Las precisiones de las secciones 3.3–3.7 concretan cómo satisfacer los oráculos originales, sin renumerarlos. Una evidencia puede dar soporte a varios O, pero ningún O pasa con sólo una afirmación.

- **O01.** Inventario WIP: HEAD/branch/status/staged y hash pre/post de todas las rutas existentes; ningún archivo previo no autorizado cambia.
- **O02.** No stage/commit/push/merge/deploy ni escritura fuera de D:; sin Docker ajeno ni nuevas dependencias.
- **O03.** Contratos reales leídos una vez: tenant, auth, permisos, private-files, B19, esquema usuarios/empleados y rutas; decisiones de REUSE/NO_REUSE.
- **O04.** Default deny: el contenedor real niega todos los comandos ATS sin política de reclutamiento aprobada.
- **O05.** Sin rutas web/API públicas de ATS, ningún guard nuevo y ningún endpoint QA permanente.
- **O06.** Crear vacante QA con company/site y actor derivados de contexto sintético; estado DRAFT y campos mínimos normalizados.
- **O07.** Editar borrador registra evento, no altera postulaciones históricas y no elude permiso ni tenant.
- **O08.** Transiciones de vacante explícitas DRAFT→READY_FOR_PUBLICATION→CLOSED; sin publicación comercial falsa.
- **O09.** Token QA criptográficamente aleatorio: DB solo hash, vigencia UTC, nunca cuerpo/log, no usar IDs predecibles.
- **O10.** Rotar/revocar token invalida el anterior; token vencido/falso/cerrado falla sin revelar datos del postulante.
- **O11.** Registrar postulación QA sintética requiere vacancy compatible y token QA vigente, con recibo opaco sin PII.
- **O12.** Idempotencia misma clave+fingerprint devuelve el mismo ID sin evento extra; payload diferente = CONFLICT.
- **O13.** Dos postulaciones de personas distintas no se deduplican por nombre/correo/CV; company y vacancy separan ámbito.
- **O14.** Actor y contexto se derivan de sesión/objeto QA, no se confía company/role desde JSON o URL.
- **O15.** Vacante de tenant A no se consulta, edita o postula desde tenant B, ni por ID, filtro o token.
- **O16.** Kiosco/PAT empleado no tiene facultad ATS por defecto, ni puede consultar candidatos.
- **O17.** Estados de postulación RECEIVED_QA→SCREENING→INTERVIEW_SCHEDULED→INTERVIEWED→SHORTLISTED/REJECTED/WITHDRAWN.
- **O18.** Transición fuera de orden, duplicada o terminal rechazada sin mutar estado ni append-only.
- **O19.** Historial conserva estado previo/nuevo, actor, razón tipificada, UTC y recurso, sin datos sensibles.
- **O20.** No existe conversión automática candidato→empleado, cuenta, B19 dossier, B17 permiso o B18 salario.
- **O21.** Intento de handoff requiere política HR, consentimiento y contrato explícitos; resulta BLOCKED_CONTRACT sin insert de empleado.
- **O22.** Entrevista QA se programa con inicio<fin, zona IANA válida y UTC persistido, incluso al cruzar medianoche.
- **O23.** Dos entrevistas del mismo candidato o entrevistador en intervalos solapados se rechazan, sin confiar solo en test secuencial.
- **O24.** Reagendar/cancelar entrevista registra evento; nunca se borra ni se finge notificación entregada.
- **O25.** Concurrencia de agenda real MariaDB requiere locking/transacción y dos conexiones: NOT_RUN_ENV si no existe QA aislada.
- **O26.** CV PDF QA sintético: máximo 2 MiB, MIME/bytes/estructura, llave opaca privada, hash de bytes y no webroot.
- **O27.** CV con firma falsa .pdf/.exe o tamaño excedido es rechazado; no interpretar finfo como escaneo antimalware.
- **O28.** CV conserva MALWARE_SCAN=NO_VERIFICADO; prohibida descarga/envío público o comercial sin políticas e inspección real.
- **O29.** No persistir diagnósticos, identificaciones, direcciones, teléfonos o correos reales en tests/logs/artefactos.
- **O30.** Consentimiento, política de privacidad, retención, eliminación y revocación sin aprobación = BLOCKED; registrar solicitud de derechos sin borrar por cuenta propia.
- **O31.** No public job link real: URL/QR/captcha/rate limit/email delivery marcados BLOCKED; link QA es token interno sin ruta.
- **O32.** Blade host con estados DRAFT/RESTRICTED/EMPTY/NOT_AVAILABLE, navegación humano-móvil y contenido escapado.
- **O33.** Lista de vacantes y postulaciones page<=50, orden estable, filter tenant e IDs opacos; no filtrar PII.
- **O34.** Validación negativa sobre HTML injection/SQL injection en títulos y mensajes, con consultas parametrizadas.
- **O35.** Migraciones y FK/índices del modelo mínimo inspeccionados; MariaDB real solo PASS si realmente se ejecuta.
- **O36.** Tests host unit/feature focales PASS con datos sintéticos; no convertir mocks en prueba DB, navegador o CV real.
- **O37.** No correos SMS/WhatsApp ni calendario externo enviados; estado entrega NOT_RUN/NOT_CONFIGURED.
- **O38.** No tocar B19 deny-all, B14 ledger, B18 estimador ni reglas laborales salvo regresión provocada por archivo modificado.
- **O39.** Patch --dry-run y apply contra baselines reales en copia aislada reconstruye todas las SOURCES exactas.
- **O40.** ZIP único pasa CRC, 100% manifest hashes/bytes/rutas seguras, informe con límites y NEXT_OWNER=CHATGPT.

## 6. ZIP ÚNICO Y DECLARACIÓN DE RESULTADOS

Entregar **exactamente un archivo ZIP** en `OUTPUT_ZIP` y ofrecer al usuario su ruta Windows y SHA256; no regar informes ni archivos de evidencias por fuera del ZIP entregable. Dentro: `FINAL_REPORT.md`, `CONTRACT_MATRIX.md`, `ENV_GATES.md`, `REUSE_DECISIONS.md`, `TEST_MATRIX.csv` (40 filas O01–O40), `AUDIT_L1_L6_10_PASSES.md` (10 autocontroles de Codex × L1–L6), `GIT_CUSTODY.md`, `SOURCE_CHANGE_MATRIX.csv`, `SOURCE_HASHES_PRE_POST.csv`, `BASELINES/` (preimagen real de cada fuente modificada + `.absent.txt` de cada nueva), `SOURCES/` (todas las fuentes nuevas/cambiadas), `PATCH_CANDIDATE.diff`, `LOGS/` con comando/resultado/exit code reales y `MANIFEST_SHA256.csv` para todos los otros miembros con columnas `path,bytes,sha256`; manifest excluido de sí mismo. CRC y rutas seguras; zero duplicates/traversal, ningún secreto ni `.env`, binarios privados o PII. No incluir repos completo ni ZIP B19.

`TEST_MATRIX.csv` no puede tener PASS si solo hay simulación no relacionada o prueba que no se ejecutó. Registrar `HOST_SYNTHETIC_QA`, `DB_REAL=NOT_RUN_ENV` o scope real, `WEB_PUBLIC=BLOCKED_CONTRACT`, `MALWARE_SCAN=NOT_VERIFIED`, `RIGHTS_PROCESS=BLOCKED_CONTRACT`, `HR_POLICY=BLOCKED_CONTRACT`, `HANDOFF=BLOCKED_CONTRACT`, `L5_INDEPENDENT_RUNTIME=NOT_RUN`, `RELEASE_APPROVED=NO`. No se promete que 40 oráculos equivalgan a 40 tests.

La última línea de `FINAL_REPORT.md` debe ser (sustituir estados de entorno según evidencia, sin inventarlos):

`TASK_ID=JOR-B20-S1-V2-ATS-ROOT-CAUSE-ONEBATCH-20261115 | B20_GLOBAL=<PARTIAL_HOST_OR_CONTRACT/FAILED/BLOCKED> | ATS_QA=<PASS_HOST_SYNTHETIC/PARTIAL/BLOCKED> | DB_REAL=<PASS_SCOPED/NOT_RUN_ENV> | PUBLIC_ATS=BLOCKED_CONTRACT | HR_POLICY=BLOCKED_CONTRACT | CV_REAL=BLOCKED | L5_INDEPENDENT_RUNTIME=NOT_RUN | WIP_PRESERVED=<...> | GITHUB_WRITES=NO | RELEASE_APPROVED=NO | NEXT_OWNER=CHATGPT`

Si no se pudo completar QA host, NO escribir `PASS_HOST_SYNTHETIC`: dar PARTIAL/FAILED motivado; si no hubo MariaDB 2 conexiones, NO escribir PASS. No hacer stage/commit/push/merge/deploy, no reiniciar Codex salvo fallo demostrado de proceso, no realizar segunda auditoría del prompt. **Quién continúa después del ZIP: CHATGPT DIRECTOR para adjudicar B20 y preparar B21 de integración independiente, no otra microfase B20 ritual.**