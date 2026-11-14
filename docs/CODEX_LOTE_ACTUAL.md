# CODEX LUNA — JORNATO B19-S1 V1 · MACROBLOQUE PRODUCTIVO DE EXPEDIENTE PRIVADO Y DOCUMENTOS

**TASK_ID:** `JOR-B19-S1-V1-DOCUMENT-VAULT-ONEBATCH-20261114`  
**Ejecutor:** Codex Luna. **Director y aceptación:** ChatGPT. **Producto:** Jornato, **no** CarpiNova, AlquilaPro, Liquidapro, BDM ni otros repositorios.  
**Raíz exclusiva de trabajo:** `D:\codex\Jornato`. **Temporales, QA y reportes:** exclusivamente bajo `D:\codex\_REPORTES\Jornato\JOR-B19-S1-V1-DOCUMENT-VAULT-20261114\` o `D:\codex\_RUNTIME\Jornato`, sin cambiar globalmente el Windows del propietario.  
**ÚNICO ENTREGABLE EXTERNO:** `D:\codex\_REPORTES\Jornato\JOR-B19-S1-V1-DOCUMENT-VAULT-20261114\JOR-B19-S1-V1-DOCUMENT-VAULT-20261114-UNICO.zip`. Al final solo el enlace al ZIP, hash SHA-256, estado por gates y `NEXT_OWNER=CHATGPT`. No dispersar informes.  
**ENLACE CANÓNICO DE DIRECCIÓN:** `docs/JORNATO_CONTINUIDAD.md` y `docs/CODEX_LOTE_ACTUAL.md` de la rama documental PR #2 GitHub; el código real avanzado puede ser WIP privado local no publicado. **No clonar `main` encima del WIP.**

## 1. Mandato y límite que no debes reinterpretar

Implementa en **un lote** el vertical B19 de Jornato: expediente privado por empleado y empresa; ingreso y conservación de **documentos reales solo con datos sintéticos de QA**; versiones inmutables con hash y auditoría; listados e historial; checklist básico configurable por una definición sintética; plantillas versionadas **no aprobadas legalmente**; vista previa/descarga privada si existen herramientas previamente disponibles; copia externa supuestamente firmada marcada **no verificada**, entrega documental y recibos con estados honestos. Preferir reutilización de Laravel/Blade/almacenamiento privado y políticas existentes. **NO** introducir microservicios, SPA, segundo login, proveedor de firma, biblioteca nueva de PDF, servicio S3 pago, motor documental paralelo, un segundo canon o permisos mágicos.

**Resultado que NO se autoriza:** no presentar contrato legalmente válido, firma electrónica o digital autenticada, relación laboral aprobada, plantilla legal conforme, archivo cifrado en reposo, entrega efectiva ni permiso comercial sin prueba. Un SHA-256 certifica integridad de bytes, **no identidad del firmante, consentimiento ni validez jurídica**. El B18 informativo sigue sin homologación y no se toca.

**Última entrega cerrada por ChatGPT:** B18-S1 V2, ZIP exterior SHA256 `F7FF2C839097566CC8987AA246C02C916A73C68917093EFD485364E07A561944`, 48 miembros, manifiesto 47/47, 6/6 fuentes reconstruidas y php-lint 5/5. Codex reportó 16 tests/103 assertions; ChatGPT reejecutó once checks de fixtures puros PHP satisfactoriamente. `B18_GLOBAL=PARTIAL_HOST_OR_CONTRACT`; DB real, login web y homologación NO. **Prohibido repetir B18-S1 tests/auditorías globales por rutina**: solo regresión vecina con hipótesis y SHA, sin doble trabajo.

**Gates heredados que no se “arreglan” en este lote por comodidad:** B13 login/consentimiento/revisión SMTP, B14 reconocimiento asistencia, B15 identidad personal, B16 login web/tenancy real, B17 permisos RR. HH. e identidad laboral real, B18 reglas legales; L5 independiente de producto, Android/TLS/DB aislada y release. `LINK_ADMIN_RUNTIME=BLOCKED_PERMISSION_CONTRACT`, `WEB_LOGIN_REAL=BLOCKED_EXISTING_AUTH_CONTRACT`, `REVIEW_PERMISSION_GATE=BLOCKED_CONTRACT`, `RELEASE_APPROVED=NO`. No tocar middleware `device.active`, `auth:*`, policies ni tablas de los bloques anteriores para fingir PASS.

## 2. Las seis leyes y prioridad

Leer realmente el canon `PingPongLaw` fijado al SHA `84e961cadf482d234f4c0ee2ca60e8c7e9b388e8`, ruta `docs/engineering/LEYES_IMPLEMENTACION_1_A_6.md`, y `AGENTS.md` del checkout disponible. **Si no hay acceso, anotar `CANON_READ=BLOCKED`, no inventar lectura.** L1 simplicidad suficiente y segura/Ponytail; L2 antirruido y evitar duplicados; L3 causas raíz; L4 UX aprobada y estados humanos; L5 verificación independiente, nunca convertir logs del autor en L5; L6 avance antipíng-pong. Prioridad: seguridad/autorizaciones > decisiones del dueño > UX aprobada > contratos reales encontrados > implementación mínima. Las SPEC V5 y B03 son base documental candidata; **no** atribuirles aprobación jurídica ni inventar precios, tiempos de retención o roles.

## 3. Inventario focal de 1 sola pasada (sin rediagnóstico B13–B18)

Abrir lectura de rutas actuales reales antes de escribir: `server/routes/{api,web}.php`, `server/app/Models`, migrations, storage disks (`config/filesystems.php`), auth, middleware membership/company, `server/resources/views/portal`, test suites B16/B17, `server/composer.lock`, README/ADR y SPEC/UX-20 presentes en WIP. Registrar matriz `REUSE_B19.csv`: **propietario actual**, `reuse` / `extend` / `create because absent`, SHA preestado y causalidad. Nunca asumir por la documentación que existe un modelo, un login, una policy o `dompdf`: constatarlo en el checkout.

Antes de escribir, capturar HEAD, branch, staged/index, estado de  todos los archivos tracked/untracked (incluye nombres y hash SHA256 de **todos** los 193 WIP reportados al cierre B18; comprobar inventario actual real, que puede diferir). Excluir solo rutas efímeras de vendor/build identificadas explícitamente y justificar exclusiones. Si aparecen cambios de terceros, conservarlos y no borrarlos. **No `git clean`, `git reset`, `git checkout --`, `git stash`, stage, commit, push, merge, deploy, manipular Docker compartido ni crear scripts en C:.** No abrir puertos ni hacer despliegue real.

**Regla de avance:** este inventario es máximo una pasada de inspección focal. Si no existe un contrato de permisos de RR. HH., no se hace un nuevo ciclo de ingeniería de auth: construir núcleo desacoplado y testable con sujeto y contexto sintéticos, cerrando rutas comerciales. Si existe implementación de documentos compatible, **extenderla** en su propietario y no crear tablas/servicios duplicados.

## 4. Arquitectura mínima aprobada

Un solo vertical en Laravel del proyecto: `Documento` con dueño `company_id`, `employee_id`, `document_kind`, `privacy_class`, `status` y metadata **sin rutas públicas**; `DocumentoVersión` inmutable con hash SHA-256 de bytes, storage key opaca generada por servidor, tamaño, MIME real validado, uploader actor autorizado y timestamp; `DocumentoEvento` append-only con acción, actor/ámbito, estado anterior/siguiente, referencia de versión y razón no clínica. Checklist y plantillas: reutilizar entidad existente, o usar **un catálogo/versionado sencillo** con alcance QA. No exigir un máximo artificial de tablas: crear **solo las estrictamente necesarias** para transacción, índice tenant + FK compuesto y trazabilidad; explicar cada tabla y su owner. No crear 15 clases si lo resuelve un servicio transaccional, repositorio Eloquent existente, controlador focal y tests.

**Separación:** archivo binario privado ≠ metadata/index ≠ plantilla candidata ≠ confirmación de entrega ≠ firma verificada. Un `EXTERNAL_SIGNED_COPY_UPLOADED_UNVERIFIED` es una afirmación del cargador; no se convierte en `SIGNED_VERIFIED`, ni por nombre del PDF, hash o registro de entrega. `SignatureProvider=NOT_CONFIGURED`; `DIGITAL_SIGNATURE_VERIFIED=NO` hasta proveedor autorizado, clave/cadena, sello, política aplicable y prueba real, fuera de B19-S1.

**Almacenamiento:** `Storage::disk(...)` de Laravel en disco **no público** existente, probado con `Storage::fake(...)` en tests; nunca usar `public`, `storage:link`, webroot, `asset()`, URL pública, disco temporal compartido ni nombres original del usuario como path. Guardar key aleatoria opaca por company/document/version, sin confundir path con autorización. Si los documentos reales requieren cifrado en reposo y no está comprobado el mecanismo vigente, declarar `ENCRYPTION_AT_REST=NOT_VERIFIED` y **no admitir datos reales**. No integrar servicio externo ni instalar dependencia por este gate.

**Ciclo binario y DB**: la operación debe ser idempotente; validar y reservar en transacción, escribir en almacenamiento privado, confirmar metadata y evento solo con hash/bytes comprobados. Como filesystem y DB no comparten transacción, definir compensación simple para fichero huérfano (si falla DB, eliminar solo el objeto nuevo identificado; nunca versión ajena) y estado de recuperación si falla limpieza. No pretender atomicidad entre sistemas por usar `DB::transaction`. Escritura de nueva versión jamás reescribe/sobrescribe bytes de la anterior. Documentar fallos inyectados y recuperación. Evitar jobs, colas o transacciones distribuidas si no existen.

**Autorización:** contexto de servidor con compañía, empleado, actor, membresía vigente, scopes de sede, permiso documental explícito y estado de empleado. `company_id` de URL/body no es prueba de pertenencia; exigir filtros por tenant de cada `find`, `download`, `version`, `list`, template y event. `actingAs` y fixtures sintéticos prueban lógica, NO un onboarding laboral comercial ni permisos de RR. HH. inexistentes. Si no existe guard/policy aprobado, rutas sensibles de upload/read/download/list/revisor **NO deben estar expuestas comercialmente**; permitir QA host aislada con fixture/autoridad explícitamente sintética. No ampliar `owner/admin` por default. A y B tienen IDs de documentos que no deben ser intercambiables aunque haya igual nombre/hash de bytes.

**Documentos y datos sensibles:** solo fixtures sintéticos, nombres y códigos genéricos. No diagnósticos, historia clínica, selfie, firma/identificación auténtica, JWT, PAT ni PII en nombres, URL, event log, snapshots, mensajes de error, ZIP o repositorio. Clasificación documental `HR_RESTRICTED`/`EMPLOYEE_COPY`/`GENERAL` o clases existentes aprobadas; documentos médicos, si son necesarios, en almacén segregado y nunca visible a portal general. Política de retención, eliminación y derechos del titular **PENDIENTE LEGAL/OWNER**; no automatizar borrado, plazo o conservación inventados.

## 5. Comportamientos y flujos obligatorios (un solo lote)

**A. Expediente:** listar por empresa/empleado después de resolver scope de servidor; estado `EMPTY/LOADING/RESTRICTED/UNAVAILABLE` honesto. Cada ficha muestra clase, estado, fecha, número de versiones, vencimiento **solo si fuente declarada** y procedencia. Lista paginada, sin consultar documentos de terceros por paginación o búsqueda. Cuando falte identidad laboral aprobada, el personal no ve expedientes comerciales, y el núcleo se prueba con contextos sintéticos.

**B. Ingesta privada:** tipos básicos `application/pdf` como caso feliz; solo admitir imágenes si ya hay pipeline seguro y se prueban por contenido. Validar extensión, MIME por magic/content (`finfo` o librería existente), tamaño explícito razonable para QA (ej. 2 MiB; valor definitivo configurable/pendiente), no fiarse de Content-Type del cliente. Evitar poliglotas triviales y firmas falsas. Rechazar nombres de path, traversal, Unicode extraño/path separators, encabezados y `../` en storage key; preservar nombre original solo si está saneado y no se convierte en ruta ni log sensible. PDF con JavaScript/macros/encriptado o malware no se puede declarar seguro únicamente por `%PDF`: marcar `MALWARE_SCANNING=NOT_VERIFIED`, usar solo fixtures creados para tests y **sin carga productiva de documentos de terceros** hasta protección aprobada. Cero descarga parcial por error o alias público.

**C. Versiones y evidencia:** cada reemplazo crea nueva `version_no` monotónica única por doc, hash bytes, timestamp UTC, actor y `document_event`. Viejo binario, metadata y hash permanecen accesibles solo a autorizado; nunca `UPDATE file_key` silencioso. Inserciones simultáneas deben resolver colisión de `document_id+version_no` sin duplicados si DB real disponible; si no, `DB_CONCURRENCY=NOT_RUN_ENV`, aun si mock verde. Hash igual dentro de dos tenants **no genera deduplicación global** ni enlace cruzado.

**D. Lectura/descarga:** consulta autenticada de metadata/versión en servidor y lectura del disco privado por key resuelta desde DB (no parámetro del usuario), 404/403 sin filtrar nombre, scoped. `Cache-Control: private, no-store`, `X-Content-Type-Options: nosniff`, `Content-Disposition: attachment` o inline solo con política y sanitización, sin inferir MIME de nombre de archivo. Body binario debe coincidir byte por byte con hash; rechazo si checksum no concuerda, **sin entregar bytes corruptos**. Probar `HEAD`, `Range`, streaming o respuestas parciales solo si la implementación realmente los soporta; si no soportados, bloquear de forma coherente. No registrar contenido ni token.

**E. Plantillas/contratos:** catálogos versionados *candidatos* y campos tipados permitidos (`company_display`, `employee_display`, `position`, dates) con escaping y referencias a plantilla/versión. Sin cláusulas legales predeterminadas, sin `eval`, HTML de usuario sin sanitizar, enlaces externos automáticos, recursos remotos, ejecutables ni variables arbitrarias; versiones antiguas reproducibles. Generar PDF real **solo si** ya existe un productor PDF compatible, probado y seguro en el proyecto; no instalar `dompdf` o SaaS para lograr PASS. Si falta, entregar preview seguro/HTML de QA, `PDF_GENERATION=BLOCKED_DEPENDENCY` y registrar contrato de productor que faltó. Generar PDF no implica que plantilla o contrato sean legalmente válidos.

**F. Checklist/copia/firmas:** checklist de documentos mínimos por tipo de cargo **sintético y configurable**, sin convertirlo en obligación legal; marcar pendiente/presente/no exigido con evento. Subir una copia externa supuestamente firmada produce `EXTERNAL_COPY_UNVERIFIED` con versión privada y hash; `SIGNATURE_VERIFIED=NO`, `SIGNATURE_PROVIDER=NOT_CONFIGURED`. Registrar entregas y recibos únicamente si existe evidencia real del destinatario: solicitud de entrega ≠ notificación enviada ≠ acceso efectuado ≠ recepción confirmada. A falta de canal y identidad laboral verificados, `DELIVERY_ACK=NOT_RUN_CONTRACT` y no mostrar «Entregado». No habilitar botón firmar electrónicamente sin proveedor aprobado.

**G. UI:** extender portal Blade B16 sin CSS/arquitectura nueva si los estilos existentes alcanzan. Un listado de documentos y vista de versiones de QA, estados y acceso denegado; no añadir CTA comercial a navegación de producción si login/permiso no existen. No generar mockup propio que contradiga UX-20 aprobada; documentar qué vista/aprobación faltó. Accesibilidad: foco visible, labels, contraste razonable, errores asociados, pantalla móvil, fechas no ambiguas, botón disabled con explicación concreta y no «Firmar» si no hay firma.

## 6. Seguridad, regresiones y errores que no puedes introducir

No abrir descarga por `document_id` sin `company_id` comprobado ni depender solo de UI. Probar: empleado de A vs B, empleado inactivo, tercero sin rol, empleado con acceso a copia propia pero no RR. HH., actor con rol sin scope de sede, cambio de empresa A→B y respuesta tardía; 401/403/404 sin filtrar metadata. Intentos `../../`, nombre PDF malicioso, extensión engañosa, encabezados CRLF, PDF corrupto, contenido excesivo, concurrent insert, fallo DB después de almacenar, fallo storage antes de registrar, falta de permiso de leer y de descargar, intento de sobrescribir versión, acceso de otra empresa con hash idéntico. Prevención de IDOR, XSS en plantillas, CSV si hay export (preferir no exportar todo el expediente en B19), CSRF en escrituras si guard web existente y no publicar rutas CORS abiertas. No usar datos reales.

No fingir `file scanned clean`, `encrypted`, `signed`, `delivered`, `legally binding`, `browser PASS`, `HTTP real PASS` si no ocurrió. El hecho de una vista Blade renderizada bajo `actingAs` solo demuestra vista y policy simuladas. Sin `server/.env.testing` con MariaDB real aislada, marcar `DB_REAL=NOT_RUN_ENV` y seguir adelante; no iniciar Docker ajeno. No editar B18 ni B17 para acomodar un test B19 (salvo defecto de integración directamente reproducido que haga insegura B19 y sea imposible aislar; registrar motivo y parche focal, no refactor transversal).

## 7. Oráculos O01–O42 — deben existir en matriz y ejecutarse cuando el entorno permita

Cada fila de la matriz exige `oracle_id`, `meaning`, `source_owner`, `test_name`, `command`, `exit_code`, `status`, `output SHA`, `limitation`; NO rellenar 42 PASS genéricos. Elige test unit/Feature real y fixture aislado, sin crear una batería de mocks que finja lectura de archivo real. **Estados válidos:** `PASS_EXECUTED`, `FAIL`, `BLOCKED_CONTRACT`, `NOT_RUN_ENV`, `NOT_APPLICABLE_EXPLAINED`. Documentar cada oráculo concreto.

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

## 8. Plan de ejecución en el mismo lote (no cinco solicitudes nuevas)

**P1 — Anclar/reutilizar:** leer lo necesario una vez; producir inventario de archivos, contratos y WIP; decidir clases/tabla/disco reutilizados. No pedir confirmación intermedia si la ruta segura está especificada.

**P2 — Implementar:** crear clases y migración(es) focales con índices tenant + FK, servicio de documentos/versión, storage privado y manejo de fallo, controlador API/Blade solo si hay guard auténtico (si no, lógica con QA host), renderer de expediente, plantilla/copia externa/entrega con estatus no verificados. No apilar decoradores, repositorios adicionales y helpers sin consumidor. Si faltan contratos, terminar lo seguro e informar bloqueo, sin escribir stubs de éxito.

**P3 — Validar:** ejecutar las pruebas focales ejecutables y clasificar cada O01–O42; si una prueba nueva falla, corregir causa antes de reportar; no declarar prueba no ejecutada como PASS. Demostrar al menos un recorrido sintético completo **subir bytes privados → registrar metadata/versión → nueva versión → listar/descargar autorizadamente → evento auditable**, o marcar exactamente qué infraestructura lo bloqueó. Para PDF y firma, sí se permiten BLOCKED honestos, pero sin ocultar que el módulo está parcial.

**P4 — Empaquetar:** no stage/commit/push/merge/deploy. Capturar pre/post hashes completos de WIP, diff de cambios y baselines **byte exactos** para modificados; para archivos nuevos marcador ABSENT_PRE_B19. `PATCH_CANDIDATE.diff` debe aplicarse con `patch --dry-run` sobre copia aislada y reconstruir 100 % de `SOURCES` byte exactos. Manifiesto (SHA256 + bytes) de todos los miembros del ZIP, CRC, rutas seguras, sin enlaces absolutos, sin secretos ni PHI; un archivo ZIP final y comprobación por un proceso distinto al empaquetador. No copiar `.env`, keys, token, credenciales ni binarios de trabajadores; solo fixtures sintéticos.

**P5 — Cierre:** `FINAL_REPORT.md` una página a tres (estados, resultados genuinos, gates, riesgos, next), `CONTRACT_MATRIX.md`, `REUSE_DECISIONS.md`, `ENV_GATES.md`, `TEST_MATRIX.csv` O01–O42, `SOURCE_CHANGE_MATRIX.csv`, `SOURCE_HASHES_PRE_POST.csv`, `GIT_CUSTODY.md`, `AUDIT_L1_L6_10_PASSES.md` (diez pasadas internas genuinas, L1–L6 cada una), `NEXT_GATE.md` (B20 productivo salvo defecto P0/P1 demostrable), `LOGS` y `SOURCES`, baselines y patch, todos DENTRO del ZIP. El auditor director hará su propia verificación y no necesita otros archivos dispersos.

## 9. Exit codes / estados y autoridad

- `B19_DOCUMENT_CORE=PASS_UNIT_SYNTHETIC` **solo** si storage real bajo fake privado, hash bytes, versiones y acceso scoped se probaron; si no, `PARTIAL`/`NOT_RUN` según evidencia.
- `B19_DB_ATOMICITY=PASS_INTEGRATION` **solo** con MariaDB real y fallos inyectados; de lo contrario `IMPLEMENTED_DB_UNRUN` / `NOT_RUN_ENV`.
- `B19_PRIVATE_STORAGE=PASS_HOST_SCOPED` **solo** sin acceso público y con lectura/descarga, no porque exista disk config.
- `B19_TEMPLATE_DRAFT=PASS_QA_DRAFT` si preview versionado seguro; esto NO implica aprobación jurídica.
- `B19_PDF_GENERATION=BLOCKED_DEPENDENCY` si no hay librería compatible ya existente; no instalarla por cuenta propia.
- `B19_SIGNATURE_VERIFIED=NO`, `SIGNATURE_PROVIDER=NOT_CONFIGURED`, `B19_LEGAL_TEMPLATES=BLOCKED_OWNER_LEGAL` hasta evidencia nueva.
- `B19_WEB_LOGIN_REAL=BLOCKED_CONTRACT` y `B19_PERSONAL_IDENTITY_REAL=BLOCKED_CONTRACT` mientras sigan las puertas B16/B15; no fingir que role mocks son acceso productivo.
- `B19_GLOBAL=PARTIAL_HOST_OR_CONTRACT` salvo prueba integral efectiva en el mismo SHA; `RELEASE_APPROVED=NO` siempre sin GO escrito.

**Entrega única:** ZIP exacto con hash SHA-256 exterior, miembros, tests, tabla de estados y `NEXT_OWNER=CHATGPT`. Con el ZIP B19 final, ChatGPT evaluará el alcance y asignará B20 reclutamiento/ATS, sin abrir B19-S2 ni otra ronda de auditorías por mera ausencia de DB/browser/proveedor de firma.

## 10. Regla final de ahorro de trabajo

**ACTUAR, NO DAR VUELTAS:** leer lo esencial una vez, ejecutar vertical implementable completo, corregir errores observados, empacar pruebas y seguir. No repetir QA B13–B18 salvo código compartido alterado o regresión concreta. No mutar criterios de aceptación fijados. Ningún reporte dice «terminado comercialmente» si solo pasó fixtures. **FIN DEL MACROBLOQUE.**