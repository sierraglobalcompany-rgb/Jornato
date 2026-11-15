# CODEX LUNA — JORNATO B20-S1 V1 · MACROBLOQUE ÚNICO ATS SEGURO Y RECLUTAMIENTO

**TASK_ID:** `JOR-B20-S1-V1-ATS-SECURE-QA-ONEBATCH-20261114`  
**DIRECTOR/ACEPTADOR:** ChatGPT. **EJECUTOR:** Codex Luna, sin reinterpretar requisitos.  
**TRABAJO EXCLUSIVO EN:** `D:\codex\Jornato`; temporales y reportes propios solo bajo `D:\codex\_REPORTES\Jornato` / `D:\codex\_RUNTIME\Jornato`. Nunca `C:`, otros proyectos ni Docker compartido.  
**SALIDA EXACTA:** `D:\codex\_REPORTES\Jornato\JOR-B20-S1-V1-ATS-SECURE-QA-20261114\JOR-B20-S1-V1-ATS-SECURE-QA-20261114-UNICO.zip`  
**ENTREGAR SOLO UN ZIP** con informe, fuentes, patch, baselines, logs, 40 oráculos, hash-manifest y custodia. No archivos dispersos.  
**ESTADO ANTERIOR CONFIRMADO:** B19 V2 ZIP SHA256 `4C906785C63B500B76B7088D5B65261CEB062BF7DB0EF70F4ADEE3357243B44D`; 70 miembros, 69/69 manifest y 17/17 patch verificados por director; PHP syntax 17/17 PASS; PHPUnit 16/96 **solo en logs Codex** con `Storage::fake` y repo in-memory. `B19_GLOBAL=PARTIAL_HOST_OR_CONTRACT`; no login web HR, ni autorización ATS, ni MariaDB QA, ni malware/consentimiento/legal aprobados. `RELEASE_APPROVED=NO`. B13–B18 no se reabren.

## 0. MISIÓN PRODUCTIVA Y REGLA DE NO DESVIACIÓN

**Implementa B20 de una sola vez:** gestión segura de borradores de vacante → token de invitación QA revocable → recepción de postulación **sintética y no pública** → evaluación/estados → agenda de entrevista → historial auditable → decisión y handoff **bloqueado sin contrato**. Debe ser ejecutable vía servicio y vistas Blade host con pruebas focales, no solo esquema, scaffolding o maqueta. Prohibido crear endpoints públicos, integrar reclutadores externos o habilitar CV reales sin condiciones de seguridad aprobadas. El origen es SPEC V5 MOD-12 / UX-21 / B20-H8, **candidato**, no una autorización para tratamiento comercial de datos.

**Éxito del bloque:** flujo QA sintético coherente, seguro y comprobable, con gates explícitos de privacidad, reclutador, publicación y datos reales. Una API productiva cerrada por defecto NO es un fracaso; declararla operativa para público sí lo sería. No dividir en B20-S2 ni volver a pedir instrucciones si el siguiente paso local es seguro. No declarar RELEASE.

## 1. LÍMITES ARQUITECTÓNICOS L1–L6 (SIN ARQUITECTURA PARALELA)

1. **L1 KISS/Ponytail:** reutilizar Laravel, Eloquent, migraciones, PHPUnit, `private-files`, Blade/CSS B16 y autenticación/tenant existentes; un agregado ATS y repositorio simples. **NO** SPA/React, microservicio, cola nueva, Elasticsearch, otra DB, motor de anuncios o nueva librería. No nuevos packages Composer/npm.
2. **L2 Antirruido:** antes de escribir, una única inspección dirigida de `server/routes`, `app/Services`, `app/Models`, `app/Providers`, `config/filesystems.php`, migraciones B13/B14/B17/B19, vistas portal y pruebas. Buscar `vacancy`, `candidate`, `application`, `recruitment`, `interview` para reutilizar entidades compatibles. No inspeccionar proyectos ajenos. No imprimir secretos.
3. **L3 Causa raíz:** `company_id/site_id`, roles y actor SIEMPRE del contexto autenticado o del fixture QA inyectado, nunca del cuerpo del postulante. NO usar `users`/`sync_employees` como candidatos ni B19 `EmployeeDocumentVault` como CV: su autorizador productivo DENY-ALL y su key solo acepta `documents/...`; reutilizar **el disco privado/config**, no alterar el contrato documental.
4. **L4 UX humana:** títulos claros, vacantes borrador, postulaciones recibidas, agenda por fecha/zona, estados restringido/no disponible; vistas Blade sin CTA público o promesas de notificación. CV no visible/descargable en cliente si no tiene contrato válido. HTML escapado; móvil legible.
5. **L5 Evidencia:** no confundir host, fake storage, SQLite, mocks o lectura estática con migración/locks MariaDB, browser E2E, tasa-límite pública o malware. Si no existe MariaDB QA aislada, `DB_REAL=NOT_RUN_ENV` y seguir con el vertical host. Registro de comandos reales y resultados; L5 independiente integral permanece NOT_RUN.
6. **L6 Antipingpong:** una única ejecución amplia, 40 oráculos que pueden agruparse en tests focales; evitar reejecutar 16 pruebas B19/otros verticales, salvo test vecino del archivo realmente tocado. 10 autorrevisiones breves L1–L6 dentro del mismo lote, no 10 rondas de compilación/auditoría. Un ZIP, luego B21, no otro prompt B20 por rutina.

## 2. PASO CERO: CUSTODIA LOCAL, NO NUEVO DIAGNÓSTICO

- Leer `AGENTS.md` y `docs/JORNATO_CONTINUIDAD.md` locales **sin sustituirlos por el remoto**; el checkpoint GitHub PR #2 es documental, `main` no contiene el WIP local. Confirmar raíz `D:\codex\Jornato` y no asumir que el commit remoto es HEAD local.
- Capturar rama, HEAD, `git status --porcelain=v1 -uall`, staged=0 o valor real, hash SHA256 de **cada una de las rutas WIP preexistentes** —incluidas untracked— y lista de rutas. Si hay staged ajeno: no limpiar, no tocarlo; documentar y reducir alcance. No `git clean`, `git reset`, checkout, stash, rebase ni `git add`.
- En B19 el usuario informó 199 rutas preexistentes, una modificada y 16 nuevas; el conteo **NO** es requisito fijo: registrar inventario ACTUAL y comparar sin falsos PASS. Cache PHPUnit ignorada sin hash previo = excluir de afirmación byte exacta.
- Seleccionar únicamente archivos B20 para cambio; si tocar `AppServiceProvider` o CSS, baseline real y regresión focal; no reemplazar configuraciones compartidas ni fusionar un checkout antiguo.
- Chequeo del entorno por lectura breve: `php -v`, ejecutables PHP/Composer locales, `server/phpunit.xml`, DB QA aislada disponible SIN iniciarla, disco privado existente. No instalar herramientas, no escribir caches en C:. No repetir pruebas B13–B19.

## 3. CONTRATOS ATS EXACTOS Y NO NEGOCIABLES

### 3.1 Modelos y persistencia mínimos

- Antes de migrar, comprobar si ya existen tablas/objetos ATS con el mismo grano. Reutilizar si encajan. Si no: **como máximo cuatro tablas** InnoDB: `recruitment_vacancies` (tenant/site/estado, título/alcance, token_hash/vence/revocado), `recruitment_applications` (vacancy/tenant, candidate_ref opaco, estado, CV solo metadata, consentimiento=QA_SYNTHETIC), `recruitment_interviews` (application, start/end UTC, timezone, interviewer_ref, state) y `recruitment_events` (evento append-only, before/after, actor_ref, request_id, fingerprint, occurred UTC). Sin tabla separada para tokens, firma, email o reclutador si no se necesita.
- FKs tenant-estrictas, índices útiles por `(company_id, vacancy_id)`, `(company_id, application_id)`, fechas y actor; índice `UNIQUE(company_id, actor_ref_hash, request_id)` en eventos para mutaciones idempotentes. Para filas que deban vincular simultáneamente tenant/vacante/aplicación, FKs compuestas cuando el esquema existente las soporte; no inventar IDs ni relaciones para facilitar tests.
- `actor_ref_hash` proviene de usuario servidor autenticado para operaciones internas **solo cuando exista policy aprobada**. Para QA únicamente: fixture sintético inyectado con UUID estable, sin registrarlo en logs. Ninguna ruta recibe `company_id` y concede autoridad con ese valor. `request_id` UUID4 sintético, scope company+actor y fingerprint con operación, resource, payload normalizado y CV SHA si aplica.
- No almacenar en B20 contraseñas, número de documento nacional, fotos, geolocalización, diagnósticos, CV real, salario, cuentas de empleados o token en claro. Tests con `CAND-QA-001`, `CAND-QA-002`, fechas ficticias; ningún candidato real.
### 3.2 Control de accesos
- Definir `RecruitmentAccessAuthorizer` único y `DenyAllRecruitmentAccessAuthorizer` como **binding productivo** en Laravel. La clase de servicio debe llamar `authorize` en TODO comando/consulta; reválidar company/site/vacancy/application y actor en cada operación; ante mismatch devolver 404 genérico o 403 sin filtrar PII.
- Un `AllowSyntheticRecruitmentAccessAuthorizer` existe **solo en pruebas** y requiere contexto QA tipado, nunca puede resolverse por configuración productiva ni por request HTTP. No agregar `Route::get/post` público ni `qa` en `routes/api.php`/`web.php`. No abrir login del reclutador ni otorgar ATS a `owner/admin` o al PAT empleado automáticamente.
- Si existe una policy de RR. HH. real aprobada en el checkout (verificar código + tests), se puede integrar con ella, **sin ampliarla**. En caso contrario `HR_RECRUITMENT_PERMISSION=BLOCKED_CONTRACT`, rutas cerradas, negocio host utilizable solo sintéticamente.
### 3.3 Máquina de estados y semántica de producto
- Vacante: `DRAFT → READY_FOR_PUBLICATION → CLOSED`; `READY_FOR_PUBLICATION` significa revisada como candidato de publicación, **no publicada**. `PUBLIC_URL_ACTIVE=NO` mientras faltan privacidad/consentimiento/rate limit/malware/policy.
- Postulación QA: `RECEIVED_QA → SCREENING → INTERVIEW_SCHEDULED → INTERVIEWED → SHORTLISTED | REJECTED | WITHDRAWN`. Una decisión terminal no se reabre sin transición explícita aprobada; `SHORTLISTED` no significa contrato ni empleado. Adjuntar motivo tipificado y evento inmutable por transición. Fechas UTC y zona IANA explícita.
- Selección: `READY_FOR_HR_HANDOFF` puede existir como **vista derivada de SHORTLISTED**, pero NO crea `sync_employees`, cuenta, documento B19, permiso B17 ni salario B18. Intentar conversión real debe responder `HANDOFF_BLOCKED_CONSENT_IDENTITY_HR` y demostrar que no hay inserciones externas.
- Token de invitación QA generado con `random_bytes`/CSPRNG; almacenar solo hash SHA256, `expires_at_utc`, `revoked_at`, `token_version`. Rotar reemplaza digest, revocar bloquea, vencer bloquea; comparación hash constante. **Sin URL pública**: token solo se consume en servicio QA interno, nunca se imprime en ZIP/logs. Un token no concede lectura del ATS ni del expediente.
- Reintento mismo `(company, actor, request_id)` + mismo fingerprint devuelve mismo ID y 200 sin duplicar estado/evento; diferente fingerprint da 409. Bloquear filas correspondientes en transacción corta, serializar operaciones conflictivas mediante lock por vacancy/application; UNIQUE DB es defensa, no garantía afirmada sin DB real. Para POST sintético sin usuario, actor QA tipado/derivado, no confiar en `actor_id` del JSON.
### 3.4 Agenda sin integraciones ficticias
- Crear entrevista con `start_utc < end_utc`, timezone IANA, entrevistador opaco del contexto QA y vínculo application+tenant. Rechazar conflictos de tiempo por intervalos semiabiertos `[start,end)` de **mismo candidato o entrevistador en misma empresa**; una entrevista que termina exactamente cuando otra empieza NO solapa.
- Detectar conflictos bajo locks de BD focales y reproducir secuencial en fake; si no hay MariaDB QA, marcar `CONCURRENT_SCHEDULING=IMPLEMENTED_DB_UNRUN`, no PASS. Reprogramar/cancelar es otro evento, conserva evidencia previa, no borra filas históricas; la notificación es `NOT_CONFIGURED`, no «enviada».
### 3.5 CV, privacidad y consentimiento
- Máximo de **2 MiB** para CV PDF **sintético en QA**, con extensión `.pdf`, MIME real `finfo`, cabecera/estructura PDF mínimas, hash SHA256 sobre bytes, lectura acotada antes de entregar, clave opaca y almacenamiento `private-files` reutilizado fuera de `public`. La validación MIME/estructura NO es antivirus. `CV_MALWARE_SCAN=NO_VERIFICADO`, no reutilizar B19 documento de empleado ni ampliar el authorizer deny-all.
- Si el adaptador de storage B19 no acepta keys ATS —lo hace: solo `documents/UUID/UUID.pdf`— **no modificarlo**. Crear un adaptador B20 mínimo y seguro con su propio prefijo opaco `recruitment/UUID/UUID.pdf`; QA `Storage::fake` para demostrar bytes + checksum. Sin nuevas dependencias. No permitir descarga ni procesamiento comercial, ni presigned URL hasta escáner/política autorizados.
- `CONSENT_NOTICE_APPROVED=NO`, `RETENTION_POLICY_APPROVED=NO`, `CANDIDATE_RIGHTS_PROCESS=NOT_APPROVED`, `PUBLIC_RATE_LIMIT=NOT_CONFIGURED`, `CV_PRODUCTION_INGEST=BLOCKED`. No registrar diagnósticos ni campo libre irrestricto; no permitir datos reales. Si se simula retiro/solicitud de eliminación: registrar evento y estado `RIGHTS_REQUESTED`, **sin borrar unilateralmente** ni fingir eliminación efectiva.

## 4. OPERACIÓN ORDENADA Y EJECUTABLE POR CODEX — UNA SOLA SESIÓN DE TRABAJO

**Fase A — Reutilizar y planificar en una sola lectura (máximo una página en log).** Anotar rutas reales, tablas ATS previas, qué piezas se reutilizan, baseline de `AppServiceProvider`, decisión de 0–4 tablas, y restricciones del entorno. No una auditoría repetida. Si el WIP contiene cambios no esperados, aislar solo los archivos B20 y preservar el resto.
**Fase B — Implementar núcleo.** Agregar dominio B20 en `server/app/Services/B20` o directorio ya compatible; repositorio Eloquent + in-memory solo para tests (NO segunda arquitectura de producción), authorizer default-deny, `Vacancy/RecruitmentApplication/Interview/RecruitmentEvent`, migración nueva si necesaria, servicio de comandos, store PDF QA sintético, configuración `b20.php` con todos los flags públicos false. No derivar permisos de `owner/admin` por nombre.
**Fase C — Vertical funcional integrado.** En una sola prueba host se debe poder crear vacante borrador QA, preparar/rotar token, simular postulación CV sintético a través de servicio interno, listar una sola empresa, evaluar, agendar entrevista sin choque, registrar entrevista/decisión y obtener timeline con hash, sin convertir a empleado. Vistas Blade componentes/preview interno para `EMPTY`, `RESTRICTED`, `NOT_AVAILABLE`, etc., render sin route/web activa y con datos sintéticos etiquetados. **No entregar solo modelos/migraciones.**
**Fase D — QA focal única.** Escribir tests unit/feature sin DB con repositorio en memoria, `Storage::fake` y autorización QA por DI; negativos de tenant, role, token, CV, XSS, fechas, idempotencia, intervalos, retiro y handoff. Ejecutar `php -l`, Pint focal y PHPUnit focal. Ejecutar migración/locks/2 conexiones solo si ya existe MariaDB QA aislada y preconfigurada; si no, `DB_REAL=NOT_RUN_ENV`. `route:list` una sola vez para confirmar cero rutas ATS, sin necesidad de navegador ni Android. No reejecutar B19 ni otros módulos por calendario.
**Fase E — Cierre y evidencia.** Hacer un único replay del patch en clon temporal aislado partiendo de baselines EXACTOS, comparar byte a byte TODAS las fuentes modificadas/agregadas; comprobar WIP completo pre/post, manifests, hash ZIP y límites. Una autoauditoría de 10 pasadas **L1–L6**, corta, enfocada a B20, SIN volver al director con un microbloque.

## 5. ORÁCULOS O01–O40 (NO SON 40 SUITES DE TEST)

Cada O debe registrarse en `TEST_MATRIX.csv`: `oracle_id,requirement,command,test_case,expected,observed,exit_code,evidence_sha256,status,scope,limitation`; usar `PASS_HOST_FAKE`, `PASS_STATIC`, `NOT_RUN_ENV`, `BLOCKED_CONTRACT`, `NOT_APPLICABLE`, **sin etiquetas PASS para escenarios no ejecutados**. Los casos O01–O40 pueden agruparse en pocos tests. Nunca convertir una inspección o fake en DB real.

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

## 6. ENTREGABLE Y RESPONSABILIDAD, SIN PING-PONG

Crear sólo un ZIP en la ruta exacta definida arriba con: `FINAL_REPORT.md`, `CONTRACT_MATRIX.md`, `ENV_GATES.md`, `REUSE_DECISIONS.md`, `TEST_MATRIX.csv` (40 O), `AUDIT_L1_L6_10_PASSES.md` (10 pasadas propias), `GIT_CUSTODY.md`, `SOURCE_CHANGE_MATRIX.csv`, `SOURCE_HASHES_PRE_POST.csv`, `BASELINES/` (todos los preestados; nuevos `.absent.txt`), `SOURCES/` (todos los archivos producto cambiados/nuevos), `PATCH_CANDIDATE.diff`, `LOGS/` (comandos/salidas reales, no inventadas), `MANIFEST_SHA256.csv` para todos los demás miembros. Sin datos personales, credenciales, `.env`, certificados ni discos/caches completos.

El manifest registra `path,bytes,sha256` de cada miembro excepto el mismo manifest; CRC y rutas seguras, nombres sin duplicación. Verificar en copia aislada que patch reproduce fuentes **exactas**; si baseline no es original y se reconstruyó, declararlo; no ocultar fallos. No incluir copia completa del repositorio ni el ZIP anterior. Cualquier output adicional va dentro del mismo ZIP.

`FINAL_REPORT` terminará con línea exacta: `TASK_ID=JOR-B20-S1-V1-ATS-SECURE-QA-ONEBATCH-20261114 | B20_GLOBAL=<PARTIAL_HOST_OR_CONTRACT/PASS_SCOPED> | ATS_QA=<...> | PUBLIC_ATS=BLOCKED_CONTRACT | HR_POLICY=<...> | CV_REAL=BLOCKED | DB_REAL=<...> | L5_INDEPENDENT_RUNTIME=NOT_RUN | WIP_PRESERVED=<...> | GITHUB_WRITES=NO | RELEASE_APPROVED=NO | NEXT_OWNER=CHATGPT`.

`NEXT=CHATGPT_DIRECTOR_AUDIT_B20_THEN_B21`. No commit local, stage, push, merge, deploy, cambio a GitHub ni nueva auditoría completa de B13–B19. **Codex implementa B20 y devuelve ese ZIP; ChatGPT decide B21, donde se unifican los gates de verdad con QA independiente.**