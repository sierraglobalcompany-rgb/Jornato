# CODEX LUNA — JORNATO B19-S1 V2 · MACROBLOQUE FINAL DE EXPEDIENTE DOCUMENTAL PRIVADO

**ORDEN ÚNICA. NO EJECUTAR B19-S1 V1.**  
**TASK_ID:** `JOR-B19-S1-V2-PRIVATE-DOCUMENT-VERTICAL-ONEBATCH-20261114`  
**DIRECCIÓN/ACEPTACIÓN:** ChatGPT. **IMPLEMENTADOR:** Codex Luna. **Propietario comercial y legal:** usuario; ningún GO está implícito.  
**REPO QUE PUEDES TOCAR:** `D:\codex\Jornato` exclusivamente. **Carpeta temporal/reportes:** `D:\codex\_REPORTES\Jornato\JOR-B19-S1-V2-PRIVATE-DOCUMENT-VERTICAL-20261114\`; si hay pruebas runtime propias, `D:\codex\_RUNTIME\Jornato` aislado.  
**ÚNICA SALIDA PARA ADJUNTAR:** `D:\codex\_REPORTES\Jornato\JOR-B19-S1-V2-PRIVATE-DOCUMENT-VERTICAL-20261114\JOR-B19-S1-V2-PRIVATE-DOCUMENT-VERTICAL-20261114-UNICO.zip`. NINGUNA entrega dispersa.  
**ESTADO ENTRANTE:** B18-S1 V2 entregado, `B18_GLOBAL=PARTIAL_HOST_OR_CONTRACT`; el último paquete verificado tenía SHA256 `F7FF2C839097566CC8987AA246C02C916A73C68917093EFD485364E07A561944`. B19 NO EJECUTADO. B13/B14/B15/B16/B17 siguen con puertas contractuales/runtime pendientes. `RELEASE_APPROVED=NO`.

## 0. Operación concreta y criterio de avance

Crear **un recorrido de documentos privados real en QA sintética** con el Laravel/Blade/almacenamiento que ya exista: **crear expediente autorizado en contexto de prueba → subir PDF sintético de bytes → registrar documento/versión/evento → generar otra versión sin sobrescribir → listar/ver historial → descargar exclusivamente con revalidación de autorización → comprobar los mismos bytes/hash**. Implementar en el mismo lote una plantilla de contrato solo como **borrador QA versionado**, checklist sintético y clasificación de copia externa `UNVERIFIED`; PDF productor, firma, entrega, acceso personal/comercial y legalidad conservan bloqueos si no hay contrato real.

**No sustituir valor por un mockup:** si hay PHP/Storage y unit tests, implementar el núcleo y ejecutarlo; si hay Laravel Feature/DB QA aislada real, añadir pruebas sobre los modelos. Si falta entorno, reportar alcance exacto sin fabricar PASS. El motor de documentos no depende de habilitar B16 login web, B17 permiso RRHH ni proveedor de firma: se puede trabajar bajo contexto TEST sintético en una capa de servicio, **sin registrar rutas QA públicas ni crear un bypass**. Al finalizar, el siguiente bloque será B20; B19-S2 solo ante defecto P0/P1 nuevo y reproducible.

**Prohibiciones permanentes:** no `git reset/clean/stash/checkout --`, stage/commit/push/merge/deploy del WIP, no rebase, no manipular Docker/Liquidapro u otros proyectos, no escribir a C:, no cambiar globalmente Windows. No usar datos reales ni secretos en archivos, fixtures, logs o ZIP. `main` remoto documentalmente atrasado NO reemplaza el estado local. No pagar, instalar servicios externos, ni liberar archivos de terceros.

## 1. Autoridad, lectura única, leyes L1–L6

Lee una vez el canon PingPongLaw **fijado** en `sierraglobalcompany-rgb/PingPongLaw` commit `84e961cadf482d234f4c0ee2ca60e8c7e9b388e8`, `docs/engineering/LEYES_IMPLEMENTACION_1_A_6.md`, y el `AGENTS.md` del checkout local. Si falla acceso, `CANON_READ=BLOCKED`; no declarar que lo leíste. Seis leyes: L1 KISS/Ponytail, L2 no duplicar/ruido, L3 causa raíz/no parche, L4 UX aprobada, L5 prueba independiente sin falsos PASS, L6 avanzar sin pingpong. **Esta orden fue auditada por ChatGPT antes de ejecutarla: no repitas esa auditoría**. El control interno de Codex será una sola revisión focal de su código antes de entregar (10 pasadas L1–L6 pedidas en el ZIP), sin volver a discutir el prompt.

Prioridad: seguridad y acceso > permisos/aprobaciones reales del propietario > contratos que existan en código > UX aprobada > SPEC V5/B03 **candidatas** > creación mínima. La SPEC V5 MOD-11/UX-20 fija el objetivo de expedientes, documento privado, versiones, PDF condicionado y firma no fingida. **No** fija roles RR. HH. comerciales, plantillas legales aprobadas, proveedor de firma, base de retención, antivirus ni cifrado efectivo. No atribuir aprobaciones inexistentes al propietario.

**Inspección focal de 1 pasada máxima:** comprueba checkout actual de `server/routes/{api,web}.php`, auth y tenant/roles, modelos/migrations, `config/filesystems.php`, storage privado, `server/resources/views/portal`, tests previos B16–B18, productores PDF y `composer.lock`, contratos de documentos ya existentes. Decide `REUSE/EXTEND/CREATE`, con path y SHA de cada owner afectado en `REUSE_DECISIONS.md`. No volver a auditar B13–B18, ni correr baterías completas previas salvo regresión específica por archivo compartido modificado.

**Custodia pre/post:** registrar HEAD, branch, stage inicial, paths y hash de todo el WIP material (tracked y untracked) para asegurar preservación. El corte histórico reporta 193 entradas antes de B18 y seis fuentes nuevas; **NO asumas que hoy son 199**: el checkout actual manda. Excluir solo efímeros de build/vendor con patrón justificado. No borrar ni tocar trabajo ajeno. No stage ni commit.

## 2. Arquitectura KISS, propiedad de cada dato y máximo vertical útil

Reutiliza patrones reales de Laravel Eloquent, migraciones InnoDB, `Storage::disk(...)` privado y vistas Blade B16. **Entidades lógicas** (no tres tablas obligatorias si ya hay equivalentes): `Document` (tenant+empleado+clase+estado), `DocumentVersion` (FK doc/tenant, número monotónico, key privada, SHA-256, bytes, MIME, actor, request_id, fingerprint), `DocumentEvent` (append-only, acción, actor+tenant, versión, fecha). Solo crea tablas/columnas y tests estrictamente necesarios para estas invariantes; índices y FK de `company_id` y relaciones congruentes, **no tablas paralelas de entrega, firmas, marketing, nómina, antivirus o catálogo por inercia**. Un catálogo/checklist/plantilla QA puede ser definición local versionada sin DB extra si no hay consumidores de persistencia comercial. No añadir microservicios, framework SPA, jobs, colas, motor de contrato distinto ni infraestructura de firma.

**Fuente única de autorización:** nunca confíes en `company_id`, `employee_id`, nombre de archivo o `actor_id` del cliente como prueba de propiedad. Revalidar en servidor sujeto, empresa activa, membresía y permiso documental **expresamente existente**, incluidos sede/temporalidad, en CADA create/list/version/download/event/template. `owner/admin` ≠ permiso HR. No registrar rutas de lectura/subida/descarga comercial si guard web/identity/HR permission falta o es inventado. Un `actingAs` TEST y una policy simulada permiten probar lógica, NO prueban identidad comercial. No crear `if testing then allow` en una ruta expuesta ni manipular middleware `device.active` o `auth:*` de B13–B17.

**Privacidad:** metadatos sin PHI en logs, UUID aleatorios de storage, no almacenar diagnósticos, PDF real de trabajadores, PIN, selfie, GPS, secretos ni nombre completo de empleado en rutas. Emplear solo documentos ficticios y un titular sintético. Clasificaciones `HR_RESTRICTED`, `EMPLOYEE_COPY`, `GENERAL` o equivalentes existentes; un documento médico **no** se mezcla con listados generales. Se permite crear copia sintética del titular con contexto autorizado, pero no darla por entregada.

## 3. Algoritmo determinista de subida y idempotencia — NO INVENTAR

Implementa el flujo siguiente en **el mismo servicio owner**; adaptación mínima solo si el esquema ya existente lo exige. No sostener transacción DB mientras se recibe un archivo de red o se calcula su SHA.

1. **Prevalidación estricta antes de escritura:** compañía y empleado por tenant; actor de sesión/contexto sintético de test; permiso real si ruta activa; `request_id` UUID estable por intento, nombre de tipo/document_kind permitido, privacy_class, tamaño máximo **2 MiB para QA de B19** (configurarlo, nunca prometer que es el límite legal definitivo); MIME real por `finfo` + firma PDF de fixture; rechazar tamaño desconocido que se expanda sin límite. El nombre mostrado se sanea y escapa, jamás se transforma en path. Permitir Unicode de display que sea seguro; rechazar traversal, CRLF y separadores de ruta como key o cabecera.
2. **Huella canónica:** `SHA256(canonical_json([operation, company_id, actor_id, target_document_id_or_CREATE, document_kind, privacy_class, metadata_normalized, binary_sha256, binary_bytes]))`. Orden de keys fijo; no usar `now()`, filename original sin saneamiento, UUID de storage ni orden de entradas. Repetir misma petición+payload da la misma huella. `request_id` **no** forma parte de la huella de contenido; sirve para buscar la operación. Si el repositorio ya tiene canon equivalente, reutilízalo y registra su definición, no hagas hash nuevo incompatible.
3. **Clave de idempotencia DB:** unique sobre `(company_id, actor_id, request_id)` **en la tabla de operaciones/versión ya existente si es suficiente**; o columna/índice existente equivalente. Si se reutiliza un request_id para otro documento, operación o binario, responder `409` sin modificar nada. La clave y huella quedan en versión/operación persistida, nunca en un `Map` de memoria. Antes de escribir bytes nuevos, se permite una consulta anticipada por `(company_id,actor_id,request_id)` con comparación de huella para devolver `200` o `409` sin IO redundante; **la UNIQUE transaccional sigue siendo la autoridad frente a carreras**. Para crear documento y primera versión, la primera fila de versión reserva esa clave en la MISMA transacción de la nueva cabecera. Si no existe persistencia adecuada, añade mínimo campo/índice en owner, sin inventar un microledger de idempotencia. Recuperar respuesta original por lookup de la versión (`document_id`, `version_no`, hash) ante retry coincidente.
4. **No bloquear BD durante IO:** primero validar y escribir bytes sintéticos en una **key nueva aleatoria**, solo del mismo tenant, en el disco privado. Al finalizar leer/confirmar `bytes` y `SHA256` de esa key. La key privada puede ser ya la definitiva: no se necesita rename ni una segunda copia. Solo después abrir **transacción DB corta** para `lockForUpdate` de `Document` existente, obtener siguiente `version_no`, insertar versión (índices UNIQUE `(document_id, version_no)` y `(company_id, actor_id, request_id)`), insertar evento con actor/tenant; COMMIT. Para create nuevo, insertar cabecera+versión+evento en misma transacción. Nunca `UPDATE` de versiones antiguas ni sobrescribir una key existente. Version_no empieza en 1 salvo convención existente.
5. **Carrera/reintento:** si colisiona UNIQUE por mismo idempotency key, releer versión ya confirmada por ese tenant+actor+request_id; si huella coincide devuelve misma referencia `200` sin nueva versión; si difiere `409`. Para solicitud inicial nueva devuelve `201`. Si colisión `(document_id,version_no)` por carrera distinta, usar lock en fila de documento y reintento acotado (máximo 2) **solo sobre DB**, nunca escribir bytes en key ajena. Si no hay DB real para demostrar bloqueo y colisión, `DB_CONCURRENCY=NOT_RUN_ENV`, no `PASS` por PHPUnit mock.
6. **Compensación por fallo:** si falla DB/validación después de escribir **un objeto nuevo de ESTE intento**, eliminar únicamente esa key creada en este intento, sin tocar versión antigua ni objeto usado por request ganador. Si el delete falla, reportar `ORPHAN_PRIVATE_OBJECT_UNCONFIRMED`, key interna saneada solo en registro de QA restringido, sin afirmar atomicidad cross-store. Un crash súbito entre key y commit podría dejar un huérfano no referenciado; **no hay reconciliador autónomo ni borrado por barrido** sin contrato de retención. Documentar gate de mantenimiento manual futuro; no añadir jobs ni limpieza de documentos históricos por este bloque.
7. **Límites:** no transformar error storage/DB en éxito. El fichero solo se hace visible a un lector autorizado **después de commit de metadatos y evento**. No aceptar `file_path` externo como parámetro de descarga. El resultado de un host fake acredita `PASS_HOST_FAKE_STORAGE`, no `PASS_DB_ATOMICITY` ni privacidad real.

**Ejecutar tests focales**: (a) create 201 y bytes iguales, (b) replay mismo UUID/fingerprint 200 misma versión y sin nuevo evento, (c) mismo UUID distinto hash 409 sin escritura visible, (d) versión 2 conserva versión 1, (e) DB fallo post-object borra solo key nueva, (f) file-store fallo no crea metadata, (g) concurrencia 2 writers MariaDB real si entorno aislado disponible, si no NOT_RUN. Evitar crear 20 abstracciones para poder simularlo.

## 4. Lectura/descarga, privacidad y plantillas con comportamiento falsable

**Descarga segura en QA y solo con identidad/policy comprobada si se habilita ruta:** query por tenant+empleado+doc+version, revalidar permiso de lectura **y** descarga, obtener key opaca desde fila DB, leer archivo privado y comprobar `(bytes,sha256)` antes de iniciar respuesta. Para el máximo QA de **2 MiB**, puede leerse en buffer acotado `max+1` (nunca `.get()` de objeto ilimitado); si archivo mayor/alterado/missing, negar la descarga antes de emitir un byte. `Cache-Control: private, no-store`; `X-Content-Type-Options: nosniff`; `Content-Disposition: attachment; filename=` seguro (nombre genérico si hay duda), `Content-Type: application/pdf` solo si verificado. No abrir `Range` ni `HEAD` parcialmente soportados: responder de forma coherente hasta implementar completamente. No exponer `Storage::url`, `asset`, `public`, `storage:link`, webroot, enlaces presignados o un controlador que lee una key dada por usuario.

**Prueba de almacenamiento privado:** `Storage::fake` demuestra IO y acceso scoped bajo test, **no demuestra** cifrado en reposo, ubicación privada efectiva del entorno real, malware-free, IAM, ni ausencia de CDN. Inspeccionar configuración disk existente y comprobar que el real configurado no es `public`, no está bajo `public/`, no genera URL pública y no expone documentación por controlador. Si solo existe disk público y no hay privado compatible, no activar rutas ni carga comercial; crear config local mínimo para private disk ya soportado **sin dependencia externa**, probarlo sintéticamente. Estado `B19_PRIVATE_STORAGE=PASS_HOST_FAKE_STORAGE_ONLY`, y `PRODUCTION_STORAGE_AUDIT=NOT_RUN` sin verificación runtime real. `ENCRYPTION_AT_REST=NOT_VERIFIED` hasta evidencia.

**Content validation:** fixture PDF sintético **estructuralmente válido** (xref/trailer/`%%EOF`, no solo una cabecera `%PDF`) generado por test, extension+mime+finfo. Eso **no** garantiza ausencia de JavaScript, malware, poliglotas ni legalidad del contrato; dejar `MALWARE_SCAN=NOT_VERIFIED`. En producción, jamás admitir documentos personales verdaderos en este gate. No instalar antivirus/escáner/PDF externo por conveniencia. Rechazar archivos ejecutables disfrazados, path traversal, CRLF en filename, PDF vacío/tamaño >2MiB y lectura corrupta con casos negativos.

**Versiones y registros:** `DocumentEvent` append-only por servicio con actor y UTC (no meter contenido/PII en eventos); no prometer WORM ni inmunidad a DBA. La versión anterior debe ser accesible solo si la policy autoriza y su fichero sigue íntegro. Error 404/403 sin confirmar existencia cross-tenant; listados/búsquedas/paginación deben aplicar filtros en query, no después de cargar colección. Igual hash entre dos empresas no da deduplicación global.

**Plantillas QA y UX:** tipo de contrato y versión con catálogo **candidato** (si ya existe owner, reutilizar; si no, definición mínima documentada sin nueva tabla por defecto). Merge solo de campos permitidos (`company_display`, `employee_display`, `position`, `date`); escapar salida Blade/HTML/JS, rechazar HTML arbitrario, `eval`, expresiones, URLs y recursos externos. v1 no cambia al crear v2. Mostrar vista previa *BORRADOR — NO VALIDADO JURÍDICAMENTE*. PDF genuino solo cuando un productor **ya instalado** pase QA; de lo contrario `PDF_GENERATION=BLOCKED_DEPENDENCY`, con preview HTML segura. Checklist sintético distingue `PENDING/PRESENT/NOT_REQUIRED` sin inventar obligación legal. Copia externa supuestamente firmada: `EXTERNAL_COPY_UNVERIFIED` con bytes, nunca `SIGNED_VERIFIED`; SHA ≠ firma. Solicitud de entrega ≠ entrega confirmada; `DELIVERY_ACK=NOT_RUN_CONTRACT` si faltan canal/identidad. Sin botón comercial «Firmar» ni cambio de estados por un PDF llamado signed.pdf.

**Interfaz útil sin auth fake:** extender Blade existente y sus estilos para un **expediente QA** listado, versiones/descarga condicional, estados `EMPTY`, `RESTRICTED`, `UNAVAILABLE`; no registrar nuevas rutas públicas si no existe un guard web+permission real. Si solo hay `actingAs` sintético, comprobar render/escape en test, etiquetar `WEB_REAL=BLOCKED_CONTRACT`. UX sin CTA falso, foco/labels/contraste, responsive si el renderer existente lo soporta, ningún CSS framework nuevo.

## 5. Pruebas y clasificación HONESTA (una pasada de cada clase)

Matriz O01–O42 **se conserva** con los mismos identificadores y significados de V1, sin fabricar 42 PASS. Para cada O: `oracle_id, description, test_command, fixture, observed_result, exit_code, evidence_sha256, status, evidence_scope, limitation`. `status` conserva `PASS_EXECUTED|FAIL|BLOCKED_CONTRACT|NOT_RUN_ENV|NOT_APPLICABLE_EXPLAINED`; `evidence_scope` obligatorio `UNIT_PURE|HOST_FAKE_STORAGE|LARAVEL_FEATURE_NO_DB|MARIADB_ISOLATED|WEB_BROWSER|STATIC_ONLY`. Un O marcado PASS exige comando real y log; `STATIC_ONLY` no da PASS de runtime. Fila no ejecutable `NOT_RUN_ENV` o `BLOCKED_CONTRACT`, con causa y próximo test exacto, **no se reescribe el oráculo**.

**Batería mínima realmente valiosa** (no 42 tests inútiles): positive upload/private+readback+version+event+download, negative IDOR A/B read and bytes; 401/403/404 si rutas reales, idempotency 201/200/409, correlación/unique por request_id, content MIME spoof, bytes >2 MiB, PDF corrupt, metadatos de error/CSV, falla DB y storage, salida sin filtrado en URL, template XSS, copia de firma unverified. Con Laravel Feature si el test harness está disponible y no destruye DB; MariaDB real concurrency solo con instancia QA AISLADA ya disponible. Si falta `.env.testing` y DB QA, no crear/alterar Docker ajeno ni hacer operaciones a redes externas.

**No reejecutar B13–B18**; correr solo regresión vecina con hipótesis concreta si se modifica un archivo común. Tests host `php -l` focal + `phpunit --filter <B19>` cuando disponible. Si test ambiente falla por path de `C:` o DB faltante, preservar la salida y reportar; nunca escribir C: para forzar PASS. Al empaquetar, auditor externo podrá reconstruir fuentes, no repetir pruebas profundas ya cerradas.

## 6. Plan de construcción de un solo bloque (SIN pedir nuevas decisiones)

**P0, máximo una vez:** leer owner local y contratos, inventariar WIP; marcar componentes `REUSE/EXTEND/CREATE`. Capturar SHA inicial de baselines reales, sin stage.
**P1, núcleo completo:** migración(s) solo si faltan tablas existentes, índices tenant+FK+unique, servicio de documentos, bytes privados, idempotencia/versión/evento, recuperación de falla; respetar algoritmo §3 y no añadir tabla de firma/cobro/retención.
**P2, consumidores:** test+render Blade en QA protegido; historial/descarga; plantilla sintética/checklist en el owner existente; PDF real solo si productor ya existe; copia externa no verificada; no exponer comercialmente sin auth/permiso.
**P3, pruebas focales:** cubrir flujos y negativos del §5, ejecutar cada clase viable una sola vez, corregir únicamente fallos efectivamente reproducidos por causa raíz. No autoatribuir L5 independiente.
**P4, entrega:** un ZIP D: con `FINAL_REPORT.md` (estado B19 + gates), `CONTRACT_MATRIX.md`, `REUSE_DECISIONS.md`, `TEST_MATRIX.csv` O01–O42, `ENV_GATES.md`, `SOURCE_CHANGE_MATRIX.csv`, `SOURCE_HASHES_PRE_POST.csv`, `GIT_CUSTODY.md`, `AUDIT_L1_L6_10_PASSES.md` (10 verificaciones propias reales, L1–L6 cada una), `NEXT_GATE.md` (B20 productivo por defecto), `SOURCES/`, `BASELINES/` (bytes exactos para modificados o marcador `ABSENT_PRE_B19` para nuevos), `PATCH_CANDIDATE.diff`, `LOGS/`, `MANIFEST_SHA256.csv`. Reportar si ciertos comportamientos son `BLOCKED` en vez de fabricarlos.

`PATCH_CANDIDATE.diff` debe aplicar con GNU `patch --dry-run`, luego `patch -p1` en COPIA aislada contra todos los baselines, y reconstruir 100% `SOURCES` **byte exactas** para todo archivo tocado; si el preestado de untracked es desconocido no fingir `git show HEAD` como baseline. MANIFEST cubre **todos** los miembros no-manifiesto con SHA256+bytes, CRC ZIP seguro (sin rutas absolutas, traversal, symlinks maliciosos), test de extracción aislada. Hash SHA256 exterior después de empaquetar; un validador distinto del empaquetador vuelve a abrir/extract/hashes. No incluir secretos, datos reales ni fotos/documentos de trabajadores, sólo fixtures sintéticos y scripts sin credenciales. WIP no relacionado 100% idéntico antes/después y HEAD/branch intactos. **No modificar el index/staging**: si ya estaba vacío seguirá vacío; si tiene contenido preexistente no limpiarlo y reportar bloqueo de custodia, sin afirmar stage=0.

**Reporte final preciso:** `B19_DOCUMENT_CORE=PASS_HOST_FAKE_STORAGE_ONLY` solo si el recorrido completo corre de verdad con Storage::fake. `B19_DB_ATOMICITY=IMPLEMENTED_DB_UNRUN` si no hay MariaDB QA, `B19_PRIVATE_STORAGE=PASS_FAKE_ONLY / PRODUCTION_UNVERIFIED`, `B19_SIGNATURE_VERIFIED=NO`, `B19_LEGAL_TEMPLATES=BLOCKED_OWNER_LEGAL`, `B19_WEB_REAL=BLOCKED_CONTRACT`, `B19_GLOBAL=PARTIAL_HOST_OR_CONTRACT`, `L5_INDEPENDENT_RUNTIME=NOT_RUN`, `RELEASE_APPROVED=NO`; si algo falló, degradar, no aprobar de forma ficticia. Prohibido afirmar que un SHA equivale a firma, que fake disk equivale a cifrado o que 42 oráculos documentados son 42 tests ejecutados.

**Siguiente dueño:** `NEXT_OWNER=CHATGPT` tras entregar un ZIP; en ausencia de defecto P0/P1 REAL, próximo bloque B20 (reclutamiento), B21 QA integral de todos los contratos pendientes B13–B20, B22 solo GO escrito del propietario.

## 7. Los 42 oráculos de aceptación ORIGINALES de B19 V1 — INALTERADOS

Los identificadores y criterios de V1 se preservan íntegros. Los apartados anteriores son **instrucciones para demostrar esos criterios**, no oráculos nuevos o un cambio de definición. La prueba que falta queda pendiente en su misma fila.

- **O01** Reutilización: no duplicar modelo/auth/storage previamente existente.
- **O02** Guard comercial cerrado si identidad, permiso RR. HH. o enlace empleado no están acreditados.
- **O03** Expediente enlazado a empresa y empleado autorizados; `company_id` no procede de confianza al cliente.
- **O04** Registro `Employee` inactivo no autoriza copia propia automáticamente.
- **O05** Acceso cruzado A→B denegado para metadata.
- **O06** Acceso cruzado A→B denegado para descarga de bytes.
- **O07** Roles: admin/owner no equivale a HR permission explícita.
- **O08** Scopes sede/rol temporal invalidado en cada operación.
- **O09** Listado paginado sin fuga en count/búsqueda.
- **O10** Estado `EMPTY`, `RESTRICTED`, `NOT_AVAILABLE` honesto, sin presentar cero documentos cuando falla DB.
- **O11** Subida PDF fixture válido y privado, hash+bytes correctos, event registrado.
- **O12** Subida rechaza `../`, ruta absoluta, backslash, Unicode peligroso; nunca storage key desde nombre del usuario.
- **O13** MIME real/extension y `finfo` concordantes, contenido PDF incorrecto se rechaza.
- **O14** Tamaño máximo QA configurado y validado durante streaming, no solo header.
- **O15** Acceso directo de disco público/URL pública imposibilitado; sin `storage:link` de documentos.
- **O16** Archivo sin escáner antivirus se etiqueta como NO VERIFICADO, no limpio.
- **O17** Nueva versión agrega, nunca reemplaza bytes/version anterior.
- **O18** Versionado monotónico + unique por doc bajo concurrencia real o estado NOT_RUN_ENV explícito.
- **O19** Cadena de eventos auditables append-only con actor+tenant+versión+fecha.
- **O20** Fallo de escritura DB tras objeto privado invoca limpieza **solo del objeto propio** o declara huérfano.
- **O21** Fallo storage no publica metadata descargable ni evento falso de éxito.
- **O22** Idempotencia mismo request+hash = misma versión; mismo request con payload/hash distinto = 409, sin filas duplicadas.
- **O23** Hash idéntico entre tenants no produce deduplicación ni exposición.
- **O24** Download revalida tenant, rol y version actual en servidor.
- **O25** Download verifica hash de bytes antes de entregar cuerpo (no basta GET de metadata).
- **O26** Cabeceras `private, no-store`, `nosniff`, content disposition seguro.
- **O27** Descarga corrupta/missing storage falla cerrada, no filtra bytes parciales.
- **O28** No se difunden filenames sensibles, body, PAT, GPS o contenido en logs y errores.
- **O29** Plantilla con versión y campos permitidos, sin cláusulas legales predeterminadas.
- **O30** Escape XSS y rechazo de variables/recursos remotos de plantilla.
- **O31** Plantilla v1 no se reescribe por crear v2.
- **O32** Productor PDF real solo si existe y está probado; de lo contrario `BLOCKED_DEPENDENCY`.
- **O33** Copia externa supuestamente firmada se guarda `EXTERNAL_COPY_UNVERIFIED`, nunca firma validada.
- **O34** Hash != firma electrónica/digital; no botón «firmado» sin proveedor.
- **O35** Solicitar entrega != entrega confirmada; recibo solo con evidencia real.
- **O36** Checklist sintético pendiente/presente/no exigido sin reglas legales automáticas.
- **O37** Privacidad: documentos médicos separados y acceso restringido; no diagnósticos por defecto.
- **O38** No borrado automático ni retención de plazos inventada.
- **O39** CSRF/protección contra modificación sin guard web, rutas nuevas cerradas.
- **O40** Render host/Blade accesible, móvil y estados de fallo sin UI comercial falsa.
- **O41** ZIP/manifest SHA + patch replay reproducibles sobre baselines tracked/untracked reales.
- **O42** Custodia WIP, ningún cambio remoto, README/checkpoint no mutados fuera del alcance, gates B19 honestos.

**Ejecución de pruebas:** (a) `php -l` focal, PHPUnit en `server` para pruebas B19 que no requieran DB, Storage::fake y seguridad; (b) regresiones vecinas B16/B17/B18 solo si tocaste su owner, con hipótesis; (c) test Feature/MariaDB aislado si existe, contra mismo árbol; (d) navegador/Android solo si disponibles y autorizados. Si no existen, NOT_RUN, sin migraciones destructivas. **L5 verificación independiente del SHA exacto se deja NOT_RUN hasta que un evaluador distinto la ejecute**, no se autoacredita por pruebas de Codex.

## 8. Evaluación final sin más pingpong

**REGLA DE DECISIÓN de Codex:** si no hay permisos o login comercial, no preguntes ni inventes. Construye el vertical de documentos seguro y comprobable con contexto TEST, sin habilitar rutas públicas. Si falta PDF o firma, deja preview versionado y estado UNVERIFIED, no stubs que aparentan éxito. Si falta MariaDB, prueba host y entrega el gate abierto, no reintentes Docker. Si una parte reutilizable ya pasó antes y no cambió, no la reaudites. No prepares B19 V3/S2. El director resolverá eventuales defectos nuevos al recibir el ZIP. Un solo paquete, no 15 PDFs sueltos.

**FIN — CODEX LUNA EJECUTA B19-S1 V2 EN D: Y ENTREGA `JOR-B19-S1-V2-PRIVATE-DOCUMENT-VERTICAL-20261114-UNICO.zip`.**