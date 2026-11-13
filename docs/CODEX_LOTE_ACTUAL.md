# CODEX LUNA — JORNATO B17-S1 V1 · MACROBLOQUE ÚNICO DE SOLICITUDES, NOVEDADES Y TRAZABILIDAD

**TASK_ID:** `JOR-B17-S1-V1-REQUESTS-LEDGER-VERTICAL-20261113`  
**QUIÉN DIRIGE / DECIDE / ACEPTA:** ChatGPT. **QUIÉN EJECUTA:** Codex Luna.  
**ÚNICA RAÍZ DE TRABAJO:** `D:\codex\Jornato`. **ÚNICOS REPORTES / SCRIPTS / TMP:** `D:\codex\_REPORTES\Jornato\JOR-B17-S1-V1-REQUESTS-LEDGER-20261113\`.  
**SALIDA ÚNICA:** `D:\codex\_REPORTES\Jornato\JOR-B17-S1-V1-REQUESTS-LEDGER-20261113\JOR-B17-S1-V1-REQUESTS-LEDGER-20261113-UNICO.zip`.  
**VERSIÓN Y ESTADO BASE:** B16-S1 V2 `PARTIAL_HOST_OR_CONTRACT`, SHA entrega `0F31F3CC7D3C2E1300E02A112CB8168F1B4D5C5340C6544FA6FB02D7BF0CB933`; B15-S5 host PASS, HTTP/Android/L5 pendientes.  
**MANDATO:** ejecutar, probar en alcance realizable, preservar WIP, empaquetar un ZIP y devolverlo. **NO detenerse tras preflight**, no pedir nuevas instrucciones por detalles resolubles contra contratos existentes. Esta es la orden íntegra; no ejecutar B16-S1 otra vez.

---

## 0. LEYES Y PROHIBICIONES INNEGOCIABLES

1. **L1 KISS + Ponytail:** Laravel monolítico + Sanctum, Flutter existente y tablas MariaDB/InnoDB existentes. Máximo **dos tablas nuevas cohesivas** si no existe un esquema compatible: solicitud y evento de historial. Una tercera tabla de saldos **NO está autorizada** sin fuente aprobada; evitar repositorio/servicio/framework paralelos, nuevo login o motor de asistencia.
2. **L2 Antirruido:** no reemplazar ADR, leyes, UX aprobada o WIP; leer `AGENTS.md` local y contrastar el canon fijo PingPongLaw `84e961cadf482d234f4c0ee2ca60e8c7e9b388e8` y el checkpoint de PR #2 **solo como documentación**. No instalar automáticamente ni sobrescribir `AGENTS.md`; el `main` remoto NO contiene el WIP.
3. **L3 Antiparches:** implementar transiciones y autorización en el dueño real; una transacción por cambio de estado, con evento histórico atómico. Prohibido duplicar ledger de asistencia o alterar `sync_events`, `AttendanceEvent`, outbox B14, historial original o nómina para pasar tests.
4. **L4 UX humana:** seguir pantallas/códigos aprobados si los hay; no inventar diseños comerciales ni CTA falsos; mostrar fuente, estado, explicación, recibo y vacío/error/acceso denegado. El prototipo propuesto requiere aprobación humana, no se marca `UX_OWNER_APPROVAL=PASS` por tests.
5. **L5:** distinguir `PASS_STATIC`, `PASS_HOST`, `PASS_DB_REAL`, `PASS_BROWSER`, `NOT_RUN_ENV`, `BLOCKED_CONTRACT`; autorrevisión de Codex no es auditoría independiente. Sin MariaDB QA, no declarar persistencia ni transacción real verificadas.
6. **L6 Antipingpong:** un macrobloque completo. No revisar S1–S5, B14/C04 ni suite completa por rutina. Cualquier problema ajeno se anota con causa/evidencia y se continúa lo independiente; **solo STOP** por riesgo de fuga/alteración de datos o WIP no preservable.
7. **Ambiente y autorización:** sin borrados, `git clean/reset/restore/checkout` destructivo, `stage`, commit, push, merge o deploy del código local; sin correo real, contratos reales, datos médicos reales, credenciales reales, servicios pagos, producción ni apertura de inscripciones. No tocar Liquidapro, Docker compartido, otros repositorios ni el script histórico en C:. Ajustar `TEMP/TMP` de procesos propios a D: si se necesita. Backup externo sigue dispensado por propietario para desarrollo, **no afirmar OFF_DEVICE_BACKUP**.
8. **Gate vigente:** `B13_GLOBAL=PARTIAL`, `B14_FINAL=NOT_APPROVED`, `B15_GLOBAL=PARTIAL`, `B16_GLOBAL=PARTIAL`, `RELEASE_APPROVED=NO`, `L5_INDEPENDENT_RUNTIME=NOT_RUN`, `LINK_ADMIN_RUNTIME=BLOCKED_PERMISSION_CONTRACT` si no existe norma aprobada. **No cambiar estos estados por un test focal**.

## 1. BASE DE EVIDENCIA QUE NO SE REANALIZA

- B16 implementó `PortalController`, `PortalCsvCell`, vistas Blade, CSS y 3 GET protegidos. ZIP B16: 75 entradas, CRC, 74/74 SHA y patch 11/11 byte-exacto comprobados por ChatGPT; logs reportan PHPUnit 12 pruebas / 122 aserciones, no DB real ni navegador.
- `server/routes/api.php` real tiene `/api/v1/me`, `/api/v1/me/companies`, `auth:sanctum`, `account.active`, `device.active`, `token.ability`, `tenant.company` donde proceda. **Verificar rutas actuales** antes de tocar; no confiar en la `CONTRACT_MATRIX` histórica S5 contradictoria.
- Portal no tiene login/logout web comercial; `actingAs` no demuestra acceso desde navegador. B16 `Hoy` da `Indeterminado` correctamente; sin calendario verificado ni saldo de vacaciones. **NO modificar esos criterios**.
- B15 cuenta con `employee_identity_links` y GET propio; el vínculo comercial y los permisos de enrolamiento siguen sin aprobar. La suite host B15 no prueba backend real ni identidad física. S3 `reported_events` en testing es noticia de ficha **no de autoría ni tiempo trabajado**.

## 2. OBJETIVO PRODUCTIVO: UN VERTICAL DE SOLICITUD CON REGISTRO Y TRAZABILIDAD

Al final debe poder demostrarse con **usuarios y empresas sintéticos**:

`Empleado identificado legítimamente → solicita permiso/cita/incapacidad/vacaciones → recibe folio y estado PENDING → puede leer SOLO su solicitud → un revisor habilitado por una política existente solicita aclaración / aprueba / rechaza → queda evento histórico inmutable → titular ve decisión y motivo → cancelación/reintento no duplica ni altera asistencia.`

**La implementación del recorrido de revisión depende de una autorización existente comprobable.** Si no existe, NO inventar que todos los `owner/admin` pueden decidir. Construir el motor transaccional y los tests de su dominio con actor QA explícito; mantener ruta productiva de decisión protegida/no expuesta y declarar `REVIEW_PERMISSION_GATE=BLOCKED_CONTRACT`, sin degradar creación/lectura propia. Esto es parcial honesto, **no permiso para omitir todo el backend**.

**Separaciones obligatorias:**
- `requested_time`, `approved_justification`, `vacation_balance`, `observed_attendance`, `recognized_work_time` son hechos **distintos**. Ninguna solicitud crea marca ni transforma 6 horas trabajadas + 2 justificadas en 8 horas fichadas.
- `sick_leave`/`appointment` no implican enfermedad verificada, EPS aprobada, reconocimiento salarial ni derecho automático; son categorías de solicitud o constancia. No almacenar diagnóstico médico como campo requerido.
- La aprobación de una solicitud **no altera vacaciones, nómina, asistencia, calendario histórico, recargos, sanciones ni liquidación**. Su efecto posterior queda pendiente de política/ledger de saldos validado en siguiente etapa o gate legal, preservando la intención aprobada de B17.
- Eventos históricos de solicitud son inmutables; no hacer hard-delete ni actualizaciones que destruyan quién decidió/por qué/cuándo. No crear un `AuditService` genérico para otras áreas.

## 3. INVENTARIO FOCAL (UNA SOLA VEZ, NO ENTREGABLE AISLADO)

1. `git status --porcelain=v1 -uall`, `git branch --show-current`, `git rev-parse HEAD`, `git diff --name-status`, `git diff --cached --name-status`; registrar baseline `HASHES_PRE.csv` para TODOS los archivos que realmente vaya a tocar, incluso untracked. No modificar basura/archivos ajenos.
2. Inspeccionar `AGENTS.md`, SPEC/ADR aprobados, `server/routes/api.php`, migraciones `company_memberships`, `sync_employees`, `employee_identity_links`, API `MyAttendanceController`, policy/middleware `tenant.company`, `account.active`, `device.active`, roles, y cualquier request/leave/balance ya existente. Para Flutter comprobar sesión personal y navegación, sin romper kiosco.
3. Si hay un contrato de solicitudes/historial compatible, **extenderlo**, no crear tablas duplicadas. Si no existe, implementar el esquema focal descrito en §4. Documentar hechos `FOUND / ABSENT / UNVERIFIED`, no un bloque adicional de diagnóstico.
4. Inspeccionar si hay `phpunit.xml` con puerto falso `127.0.0.1:1`, `.env.testing` ausente, e infraestructura QA privada ya disponible. **No crear/iniciar Docker o MariaDB compartida** para esta orden. El trabajo con código y tests host continúa.
5. Identificar exactamente una acción UI reutilizable; no generar rediseño de portal B16. Si autenticación web real aún bloqueada, `actingAs` sintético sirve solo para QA de vistas y el acceso real queda bloqueado.
6. No hacer `fetch`, `checkout` de remoto, stage ni reset. El repositorio de GitHub es continuidad documental, NO base desde la cual reconstruir o pisar el checkout.

## 4. MODELO MÍNIMO SEGURO, SOLO SI NO EXISTE CONTRATO PREVIO

### 4.1 Tabla `leave_requests` (nombre definitivo según convención existente)

Mínimo: `id` interno no predecible o PK, `company_id` FK, `site_id` FK compuesto/validador tenant, `employee_id` FK compuesto/validador tenant, `created_by_user_id` (actor autenticado o admin registrador si permitido), `category` código conocido, `starts_at`, `ends_at`, zona horaria original o contrato existente, `reason_summary` breve y acotado, `status`, `version`, `idempotency_key` por actor/tenant, `created_at`, `updated_at`. SQL coherente con migraciones actuales. FKs/cascadas no deben borrar historial laboral.

Si existe fuente estable de `employee_identity_links`, el `employee_id` **siempre se resuelve en servidor** para la cuenta personal; nunca aceptar `employee_id` enviado por trabajador como autoridad. La petición administrativa en nombre de trabajador solo si permiso ya aprobado; si no, no habilitarla.

### 4.2 Tabla `leave_request_events` (historial append-only)

Mínimo: `id`, `request_id`, `company_id`, `transition` (`submitted`, `clarification_requested`, `clarification_answered`, `approved`, `rejected`, `cancelled`), `from_status`, `to_status`, `actor_user_id`, `actor_role`/contexto derivado, `reason` acotada cuando corresponda, `occurred_at`, `created_at`. Solo inserciones por el servicio de transición, no update ni delete normales. Si hay audit ledger existente y compatible, **reutilizarlo**.

**No crear tercera tabla** de días de vacaciones o turnos. Un saldo no validado se muestra `UNKNOWN`, jamás `0`, `aprobado legalmente`, `descontado` o negativo por inferencia. No migraciones destructivas ni backfill automático sobre datos reales.

### 4.3 Categorías y estados

Contrastar nombres aprobados primero. Si no existen, usar **propuesta local de QA**: `permission`, `appointment_eps`, `appointment_private`, `emergency`, `sick_leave`, `vacation` (categorías de solicitud, NO clasificaciones jurídicas definitivas). Estados: `PENDING`, `NEEDS_CLARIFICATION`, `APPROVED`, `REJECTED`, `CANCELLED`. Si el dominio ya define estados distintos, mapear una vez con tests y documentar la equivalencia, no duplicar enums.

Transiciones permitidas por defecto **candidato QA**: `PENDING → NEEDS_CLARIFICATION|APPROVED|REJECTED|CANCELLED`; `NEEDS_CLARIFICATION → PENDING` por solicitante con aclaración, `NEEDS_CLARIFICATION → CANCELLED` por titular; terminales `APPROVED|REJECTED|CANCELLED` sin reapertura silenciosa. Una corrección posterior es NUEVA solicitud vinculada / proceso aprobado, nunca overwrite de un evento firmado. Solicitud PENDING sin efecto laboral automático.

### 4.4 Concurrencia, duplicados y privacidad

- Crear/decidir dentro de **transacción MariaDB** y actualizar estado+insertar historial de forma atómica. `version` o `SELECT … FOR UPDATE` según patrón existente; carrera doble decisión → una aplicación y la otra `409`, sin dos eventos terminales. Concurrencia real solo PASS tras ejecutar contra MariaDB; dos requests seriales no prueban carrera.
- Clave de idempotencia proporcionada por cliente/QA con validación tamaño; scoped `company_id + actor_user_id + key` en restricción DB, mismo contenido devuelve **mismo folio**, contenido distinto bajo misma key `409`; si no existe contrato anterior, definir hash estable de payload excluyendo campos derivados. Ninguna solicitud duplicada por retry.
- Validar orden y zona horaria de fechas; instantes con offset o zonas identificables, no parser ambiguo de cadenas locales. Turnos nocturnos y días múltiples NO se recortan a medianoche; no calcular jornada laboral sin esquema de turnos homologado.
- Nunca incluir diagnósticos, PDF médico, certificados o datos personales de otros en respuestas/logs/ZIP. Los adjuntos quedan `SUPPORT_UPLOAD=BLOCKED_PRIVATE_STORAGE_CONTRACT` si no hay storage privado, permisos y validación de archivo demostrados; no fingir «adjunto recibido».
- Los IDs enviados por URL son localizadores, no autoridad: `where company_id` + `where employee_id` derivado del token para titular; para revisor verificar policy aprobada por empresa/sede/acción en cada request. Status `403/404` coherente con contrato sin filtrar nombres o existencia ajena.

## 5. ENDPOINTS Y AUTORIZACIÓN: REUTILIZAR, NO PARALELIZAR

Usar rutas que no colisionen con `server/routes/api.php` y middleware existentes. Contrato orientador, ajustar una vez a nomenclatura real y dejar `ROUTE_CONTRACT.md`:

- `GET /api/v1/companies/{company}/me/requests`: paginar MIS solicitudes, solo vinculadas a Employee activo en ese tenant.
- `POST /api/v1/companies/{company}/me/requests`: crear PENDING sintética con idempotency, validación y recibo, 201 nueva / 200 replay mismo payload / 409 payload distinto.
- `GET /api/v1/companies/{company}/me/requests/{request}`: detalle propio e historial permitido, no diagnóstico ni ajenos.
- `POST /api/v1/companies/{company}/me/requests/{request}/clarification`: responder a necesidad de aclaración; si el contrato no la permite, no abrir ruta productiva.
- `POST /api/v1/companies/{company}/me/requests/{request}/cancel`: cancelación del titular en estado permitido; 409 para terminal.
- `GET /api/v1/companies/{company}/requests` y `POST /api/v1/companies/{company}/requests/{request}/decision` **SOLO si existe permiso explícito aprobado de revisión**, no deducido de owner/admin; si no, rutas no expuestas y servicio de transición testado con actor QA sintético interno (no fake PASS comercial).

Laravel: un controlador propio de recursos (o dos si división de permisos es material), un pequeño dominio de transición bien localizado, FormRequest/validation existente y migración si procede. Scope empresa/sede/empleado en queries, reutilizar `auth:sanctum`, `account.active`, `device.active`, `tenant.company`, `token.ability` y `employee_identity_links` sin bypass. No crear un login o policy global con nuevos privilegios.

**Visibilidad comercial:** no activar deliberadamente empleados reales mientras `LINK_ADMIN_RUNTIME=BLOCKED_PERMISSION_CONTRACT`. Si no se prueba el enlace con cuentas QA synthetic, entregar dominio/endpoint fail-closed y declarar `EMPLOYEE_REQUEST_API=BLOCKED_IDENTITY_LINK`, no exponer formularios activos que guarden contra otro sujeto.

## 6. UI QUE APORTA VALOR SIN PROMETER ACCESO QUE NO EXISTE

- **Empleado Flutter personal:** añadir en el área personal ya creada un acceso «Mis solicitudes» que liste estado/folio/rango y permita crear en una única pantalla cuando sesión personal + vínculo QA + ruta sean válidos. Estados reales: sin solicitudes, pendiente, requiere aclaración, aprobado, rechazado, cancelado, 401/403, timeout, offline, pendiente de envío **solo si se ha persistido una outbox real**. NO mostrar «enviada» antes del HTTP 201; sin outbox aprobada mostrar «No se pudo enviar; reintentar». Tokens en memoria y A→B sin caché ajena. Host/widget QA sintético no es Android PASS.
- **Portal Blade B16:** añadir **solo** navegación «Solicitudes» y vista de revisión/lectura cuando la ruta, el guard web y el permiso de revisión estén aprobados. Sin login web comercial aprobado, puede producirse render QA `actingAs` marcado como **no navegable comercialmente**; no dar CTA de aprobar cuando el permiso está bloqueado. Mantener Hoy/Sedes/Turnos/CSV y CSS existentes; no hacer una SPA nueva.
- **Experiencia:** mostrar categoría neutral, franja, explicación mínima, estado, decisiones/fecha/actor según rol y recibo. Al aprobar no anunciar horas trabajadas ni saldo descontado. No exigir historial médico o diagnóstico para iniciar una solicitud de cita.
- Si el código existente no permite integración de Flutter en el mismo lote sin credenciales reales, terminar backend funcional + cliente tipado host y dejar `FLUTTER_PERSONAL_REQUEST_UI=PARTIAL_HOST`; nunca reducir al solo diseño o screenshots sin código.

## 7. MATRIZ DE ACEPTACIÓN — 36 ORÁCULOS CON RESULTADO REAL

Crear `TEST_MATRIX.csv` con O01–O36, caso, precondición, comando, exit, estado, fuente hash y limitación. Cada oráculo debe quedar `PASS / FAIL / BLOCKED_CONTRACT / NOT_RUN_ENV / NOT_APPLICABLE_JUSTIFIED`; **no inflar** PASS por tests de mocks o por control que no tiene implementación.

### A. Identidad/tenant y acceso (O01–O08)

- **O01:** usuario anónimo → 401 sin PII.
- **O02:** token sin ability requerida → 403/401 de contrato, no acceso.
- **O03:** titular A empresa X crea y lee solo su ficha; tenant de B rechazado.
- **O04:** `employee_id` arbitrario en payload no cambia titular; 422 o ignorado según contrato (prefiere 422).
- **O05:** vínculo revocado, empleado inactivo o empresa inactiva → no nueva solicitud/lectura; sin acceso histórico ajeno.
- **O06:** miembro de empresa sin vínculo laboral personal → fail closed.
- **O07:** owner/admin sin permiso explícito no puede aprobar solicitud.
- **O08:** cambio empresa/usuario A→B no expone requests, historial ni errores de A.

### B. Crear/consultar/idempotencia (O09–O16)

- **O09:** alta válida PENDING devuelve folio y audit event submitted.
- **O10:** mismo idempotency key+payload → mismo folio, no segundo evento.
- **O11:** mismo key + payload distinto → 409, nada mutado.
- **O12:** fechas inválidas/invertidas → 422 sin persistir.
- **O13:** rango nocturno y rango multi-día preservan fechas/zona; no inventar horas de trabajo.
- **O14:** categoría inválida/reason excesivo → 422, sin secreto en log.
- **O15:** lista y detalle paginados por titular; 404 para otro empleado.
- **O16:** GET y login NO crean AttendanceEvent/sync receipt ni cambian estados.

### C. Estado, historial y carrera (O17–O24)

- **O17:** transición válida `PENDING→NEEDS_CLARIFICATION` conserva from/to/actor/motivo.
- **O18:** titular responde aclaración a PENDING con evento histórico.
- **O19:** decisión APPROVED por policy existente o actor QA interno explícito: nuevo evento, sin reescribir original.
- **O20:** REJECTED con motivo no altera asistencias.
- **O21:** titular CANCELLED desde PENDING/NEEDS_CLARIFICATION; terminales no cancelables.
- **O22:** transición inválida `APPROVED→APPROVED` o doble aprobación → 409 y sin duplicado.
- **O23:** carrera real dos decisiones sobre la misma solicitud (solo MariaDB QA) → una gana/otra 409.
- **O24:** error transaccional entre update y append revierte ambos; SQL QA real si disponible.

### D. Contabilidad laboral y privacidad (O25–O30)

- **O25:** 6 horas observadas + 2 horas justificadas jamás resultan 8 horas fichadas.
- **O26:** ausencia de saldo vacaciones -> UNKNOWN, no cero y no descuento.
- **O27:** solicitud aprobada no produce de oficio sueldo/recargo/ausencia laboral/saldo.
- **O28:** diagnóstico/soporte médico no se exige ni aparece en ZIP/log/HTML/JSON ajeno.
- **O29:** archivos privados solo si contrato seguro previo; de lo contrario ruta no activa.
- **O30:** sitio/empresa/empleado externo no figura en historial, listado, CSV o mensajes de error.

### E. UX/accesibilidad (O31–O34)

- **O31:** Flutter personal estados vacío, pending, error 401/offline/retry sin éxito ficticio.
- **O32:** sesión A→B/respuestas tardías no deja solicitud, token, recibo ni motivo de A en B.
- **O33:** portal respetará guard/permisos; no CTA falso de revisar o aprobar.
- **O34:** móvil/teclado/foco/lectura: widget host PASS documentado; visual real NO RUN si no existe emulador/Chrome autorizado.

### F. Custodia/entrega (O35–O36)

- **O35:** tracked/untracked WIP protegidos; git branch/HEAD/staged/diff before-after comparados, no cambios fuera de Jornato; temporales D:.
- **O36:** **exactamente un ZIP** con fuentes+patch+baseline+logs+matriz+manifest, CRC/extracción/hash reproducibles y sin secretos.

## 8. QA ORDENADA PARA EVITAR REPETICIÓN Y FALSE PASS

1. **RED una sola vez** para los defectos nucleares nuevos: A accede petición B, idempotency duplica, transición ilegal acepta y/o horas fingidas (solo los casos aplicables). Guardar log y exit. Si no hay implementación anterior, `RED=EXPECTED_MISSING_ROUTE/CLASS` no se disfraza de bug existente.
2. **GREEN foco**: php -l, PHPUnit Feature/Unit tests de B17 contra Laravel y mocks claramente identificados. Registrar cantidades/exit y SHA. No correr suite total B13/B14/B15/B16 salvo un test vecino cuando los archivos tocados lo justifiquen.
3. **MariaDB real aislada**: solo si ya está disponible y no es Docker compartido; migrar en DB temporal sintética. Pruebas transaccionales/idempotencia/carrera doble/tenant con dos conexiones. Si falta: `MARIADB_QA=NOT_RUN_ENV`; lint y test host no prueban persistencia.
4. **Flutter**: analyzer + tests focales request/session sólo si se modificó el cliente; no AVD API24 ni build sqlite3 reintentado sin hipótesis causal. Backend aislado ≠ client UI real.
5. **UI web**: Blade render/foco/campos y autorización bajo actingAs sintético, no decir navegable en navegador ni login real. Ningún mock implica runtime HTTP real.
6. **Privacidad y seguridad**: comprobar que ZIP no contiene `.env`, `.key`, tokens, emails/personas reales, contenido médico, dumps ni paths de otros proyectos.
7. **Revisión forense propia**: hacer 10 pasadas L1–L6 con observaciones y artefactos, sin etiquetar la autoauditoría como L5 independiente. Auditoría de ChatGPT después del ZIP decide si el lote alcanza PASS focal o PARTIAL y continúa B18.

## 9. DETERMINACIÓN DE RESULTADOS SIN CONFUSIÓN

- `B17=PASS_QA_FUNCTIONAL_SCOPED` solo si alta/consulta/transiciones/historial permitidos completan recorridos reales con fuentes y test atribuido; `PASS_DB_REAL` separado cuando realmente se ejecuta MariaDB.
- `B17=PARTIAL_HOST_OR_CONTRACT` si se implementa modelo y API/Flutter pero persisten fuentes de permisos, identidad o runtime no aprobadas. **Eso no habilita B17_GLOBAL ni el Release.**
- `B17=BLOCKED_CRITICAL_SECURITY` si detectas fuga entre tenants o mutación de hechos laborales. Frenar la acción insegura y entregar evidencia; no improvisar autorización.
- `LEAVE_BALANCE=UNKNOWN_NOT_AUTHORIZED`, `LEGAL_ENTITLEMENT=NOT_APPROVED`, `REVIEW_PERMISSION_GATE=BLOCKED_CONTRACT` cuando corresponda. No llamar aprobado legalmente a solicitud aprobada operativamente.
- `B16_WEB_LOGIN_REAL=BLOCKED_EXISTING_AUTH_CONTRACT` sigue hasta que se apruebe implementación, y no bloquea por sí solo endpoint de trabajador con Sanctum válido en QA.

## 10. PAQUETE ÚNICO Y MANIFIESTO EXIGIDO

Crear SOLO `JOR-B17-S1-V1-REQUESTS-LEDGER-20261113-UNICO.zip` en la ruta indicada. Dentro del ZIP incluir como mínimo:

- `FINAL_REPORT.md` con `TASK_ID`, resumen funcional con rutas reales, fuentes, DATA GATES, cambios exactos, estado y NEXT_OWNER=CHATGPT.
- `CONTRACT_MATRIX.md`: contratos preservados, esquema, autorización, categorías, estados, relaciones tenant, fuente de fechas y dato laboral.
- `SOURCES/` con todos los archivos nuevos/modificados finales (no código ajeno).
- `BASELINES/` de cada archivo existente con bytes preedición; marcadores `ABSENT_PRE_B17/` de nuevos. Para archivos untracked, **incluir también su preestado real**.
- `PATCH_CANDIDATE.diff` que aplique sobre baselines y reproduzca las fuentes finales byte a byte; si no puede representarse con Git diff por untracked, crear unified patch fiable sin staging, y verificar dry-run+apply en copia aislada.
- `TEST_MATRIX.csv` O01–O36; logs originales con comandos completos, outputs y exit, aclarando placeholders/mock/DB/Flutter.
- `AUDIT_L1_L6_10_PASSES.md`: diez pasadas de Codex × seis leyes, observación y corrección, sin fingir independencia.
- `ENV_GATES.md`, `GIT_CUSTODY.md`, `SOURCE_HASHES_PRE_POST.csv`, `NEXT_GATE.md` y `MANIFEST_SHA256.txt` SHA+bytes por miembro excepto manifiesto. ZIP CRC y muestras de extracción, SHA256 del ZIP completo.

Limitar reporte a un único ZIP, sin `.md` adicional por fuera. No empacar la fuente/README privado del usuario si no forma parte del diff; no filtrar datos/secretos. Registrar cualquier script QA propio en D: y dejarlo dentro del ZIP solo si es necesario para reproducir el resultado. No reclamar haber actualizado GitHub: el director se encarga de documentación, Codex no escribe remoto.

## 11. SALIDA DE UNA SOLA LÍNEA PARA EL DIRECTOR

Tras generar ZIP devolver un resumen conciso con:

`TASK_ID=... | B17=... | REQUEST_API=... | REVIEW_PERMISSION_GATE=... | LEDGER_HISTORY=... | MARIADB_QA=... | FLUTTER_QA=... | PORTAL_WEB=... | L5_INDEPENDENT_RUNTIME=NOT_RUN | WIP_PRESERVED=... | ZIP_SHA256=... | RELEASE_APPROVED=NO | NEXT_OWNER=CHATGPT`.

**NO pedir otra auditoría de prompt ni otra autorización para hacer trabajo local permitido.** Si gate contractual impide una acción comercial, entregar el máximo vertical seguro y documentar la dependencia en vez de hacer otro preflight. Luego seguirá la dirección de B18 o un único defecto crítico probado, nunca un B17-S2 por rutina.

**FIN DE LA ORDEN. SIGUE CODEX LUNA: EJECUTAR B17-S1 V1 EN D: Y ENTREGAR EXACTAMENTE UN ZIP.**