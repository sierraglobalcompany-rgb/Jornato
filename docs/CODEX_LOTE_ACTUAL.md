# CODEX LUNA — JORNATO B16-S1 V2 · MACROBLOQUE ÚNICO DEL PORTAL WEB PRO

**TASK_ID:** `JOR-B16-S1-V2-PORTAL-PRO-VERTICAL-ONEBATCH-20261112`  
**DIRECTOR TÉCNICO Y ACEPTACIÓN:** ChatGPT. **EJECUTOR:** Codex Luna. Ejecuta las decisiones de esta orden; no rediseñes la arquitectura ni solicites una serie de preflights.  
**PROYECTO:** solo `D:\codex\Jornato`. **TEMP/QA/REPORTES:** únicamente `D:\codex\_REPORTES\Jornato\JOR-B16-S1-V2-PORTAL-PRO-20261112_WORK` y subcarpetas. **ENTREGA:** `D:\codex\_REPORTES\Jornato\JOR-B16-S1-V2-PORTAL-PRO-20261112\JOR-B16-S1-V2-PORTAL-PRO-20261112-UNICO.zip`.  
**OUTPUT AL PROPIETARIO:** exactamente **un ZIP** con todo el código, pruebas, baselines, diff, informe, manifiesto y evidencias. Ningún otro archivo entregable externo. `NEXT_OWNER=CHATGPT` después de entregarlo.  
**REEMPLAZA:** B16-S1 V1. Si B16 V1 ya comenzó localmente, **no deshacer ni repetir trabajo válido**: integrar solamente deltas aún necesarios, conservar hashes y estado.  
**RESTRICCIONES:** sin `git add`, `commit`, `push`, `merge`, `deploy`, force push, `git clean`, `reset`, `restore` ni checkout destructivo. No publicar código en GitHub, no modificar otros proyectos, Docker compartido, HOME, configuraciones globales ni disco C:. No borrar WIP, archivos untracked, marcadores Kotlin ni temporales preexistentes. No asumir que la documentación remota está instalada en el checkout local.

## 0. ORDEN EJECUTIVA QUE NO DEBES REINTERPRETAR

**Construye el máximo vertical REALMENTE SEGURO del portal web Pro de Jornato en el monolito Laravel existente**, con UI responsive, empresa activa, pantalla Hoy, sedes, turnos/calendario, informes y exportaciones sobre fuentes/roles comprobados. Al terminar, un responsable autorizado debe poder recorrer las secciones disponibles usando datos propios reales de la base sintética QA cuando el contrato lo permita; si falta autenticación web aprobada, la entrega será un vertical protegido con pruebas del lado servidor y gate explícito, **nunca** una pantalla que se venda como accesible en producción.

No se trata de crear un mock, una arquitectura paralela o abrir seis nuevas fases. La UI se termina dentro del mismo macrobloque. No alterar el kiosco, Flutter personal, los eventos del ledger, B14 outbox ni el estado de permisos laborales por conveniencia. **Una lectura de sync/recibo no es asistencia reconocida**. No inventar horas, ausencia, salarios, precios, cobros, facturación o un derecho Pro vigente.

**Verdad base verificable del último lote S5:** ZIP SHA-256 `ECCA94F4F1D23310A8A859B918DD117D3BF6907A609D5CB06DEC8208C2AB54AC`; seis fuentes reproducidas byte a byte en auditoría ChatGPT; 30 tests host Flutter PASS según logs de Codex; Laravel kernel, TLS, Android y revocación PAT real `NOT_RUN`. Esto **no** certifica el portal. `B13_GLOBAL=PARTIAL`; `B14_FINAL=NOT_APPROVED`; `B15_GLOBAL=PARTIAL`; `L5_INDEPENDENT_RUNTIME=NOT_RUN`; `RELEASE_APPROVED=NO`. S5 cerrado a nivel host, NO crear B15-S6 por inercia.

**Normas obligatorias:** leyes PingPongLaw L1–L6 versión fija `84e961cadf482d234f4c0ee2ca60e8c7e9b388e8`, fuente Ponytail 5.3.2 fijada, `AGENTS.md` local, ADR/códigos aprobados y decisiones del propietario. La SPEC V5 es **candidata**: usarla para alcance, no para anular ADR/mockup aprobado. Primera publicación comercial **integral**, no MVP reducido. Antiparches: corregir causas, reutilizar owners, tests focales reales y no reescribir módulo por conveniencia.

## 1. GATE CERO — INVENTARIO UNA VEZ, MÁXIMO ÚTIL, SIN AUDITORÍA CIRCULAR

Ejecuta e incluye en el ZIP, al comienzo (comandos adaptados a PowerShell/Windows; salida saneada):

1. `git branch --show-current`; `git rev-parse HEAD`; `git status --porcelain=v1 -uall`; `git diff --name-status`. Guardar stdout, stderr y exit. Capturar hashes SHA-256/bytes de **cada archivo que vayas a modificar**, sea tracked o untracked, antes de editar; no suponer que `git diff` documenta untracked. No alterar archivos de otro lote sin causa.
2. Leer `AGENTS.md` local, ADR, contratos de roles, pantallas y tests pertinentes en `D:\codex\Jornato`. Comparar conflictos reales con [`AGENTS` remoto](https://github.com/sierraglobalcompany-rgb/Jornato/blob/docs/pingponglaw-l1-l6-canon-84e961c/AGENTS.md) y [`JORNATO_CONTINUIDAD`](https://github.com/sierraglobalcompany-rgb/Jornato/blob/docs/pingponglaw-l1-l6-canon-84e961c/docs/JORNATO_CONTINUIDAD.md); **no descargar/checkout/fusionar** la rama documental encima del WIP. Si canon remoto no accesible, registrar límite, no inferir validación.
3. Inspeccionar `server/routes/web.php`, `server/routes/api.php`, middleware aplicados **por ruta**, `User`, membresías, empresa, sedes, turnos/asignaciones, recibos/proyecciones, entitlements y tests actuales. Verificar si ya existen vistas, layouts, componentes y rutas portal. **No inventar nombres de columnas o rutas**. Limitar el inventario a owner del flujo (máximo dos carpetas vecinas si no hay razón causal).
4. Comprobar y resolver documentalmente la discrepancia S5: `CONTRACT_MATRIX.md` registra `GET /api/v1/auth/me`, `GET /api/v1/companies`, mientras el cliente Flutter S5 **incluido en su ZIP** consulta `GET /api/v1/me`, `GET /api/v1/me/companies`. No decidir por el texto: la fuente de verdad son las rutas y controladores del checkout. Registrar nombres/argumentos/middleware exactos y confirmar qué consumidores existen. **No renombrar rutas o añadir alias sin necesidad demostrada de este portal.** No tocar Flutter por ello.
5. Delimitar entorno QA: **no activar Docker**, no modificar `server/.env.testing`, no reemplazar host placeholder `127.0.0.1:1`, no usar BD de otros proyectos. Si se puede leer una MariaDB aislada explícitamente sintética y ya autorizada, documentar identidad de instancia con secretos REDACTED y ejecutar test focal; de lo contrario `DB_QA=NOT_RUN_ENV`, continuar vista, contratos y pruebas unitarias que no requieran BD real. No «arreglar» el entorno compartido de paso.
6. Elegir un solo stack en 10 líneas del `CONTRACT_MATRIX.md`: **primero reutilizar web frontend existente**; si está ausente y Laravel tiene web guard y policies compatibles, usar Blade + CSS local. Evitar nuevo SPA, Vite/Node si no existe, microservicio, React/Vue como dependencia creada por este lote, paquetes nuevos o segundo sistema de roles.
7. Registrar una matriz **fuente/tabla existente → tenant/rol → operaciones autorizadas → vista → prueba**; luego ejecutar, sin solicitar una nueva orden. Ante contradicción irreversible con una regla aprobada, preservar seguridad, entregar el máximo producto independiente y enumerar **una sola** decisión que requiere el dueño.

**STOP limitado, NO proyecto detenido:** si una acción implica borrar historia, migrar datos reales, crear nueva autenticación comercial o ampliar privilegios sin permiso, no la ejecutes. Las vistas/consultas seguras restantes continúan. Nunca un nuevo informe de preflight como producto final.

## 2. DECISIONES DE ARQUITECTURA OBLIGATORIAS (KISS + PONYTAIL)

**A. Solo una identidad y un monolito.** Reutiliza `User`/Laravel, guard/políticas/membership ya aprobados. **No** PAT en `localStorage`, URL, JS, HTML ni cookie manual. No credenciales estáticas, `APP_DEBUG` bypass, `Auth::loginUsingId($request->id)`, suplantación por cabecera `company_id` o una ruta «demo admin» pública. `APP_ENV=testing` por sí mismo tampoco concede roles.

**B. Gate web claro; NO fingir que hay login real.** Verifica si existe autenticación web operable, con validación de cuenta, sesión, CSRF y revocación. Si existe: integrar su middleware/guards, sin duplicar login. Si no existe, **NO crear un segundo contrato de autenticación de forma implícita**: construir vistas/controladores **siempre tras `auth`/membership/permission real y con tests `actingAs` sintéticos**, protegerlas de anónimo, documentar `WEB_LOGIN_REAL=BLOCKED_EXISTING_AUTH_CONTRACT`, `PORTAL_BROWSER_E2E=NOT_RUN`, y **no declararlas navegables por usuarios comerciales**. No abrir endpoints para que la vista se vea en Chrome. Si el contrato existente exige validación del dispositivo u otras abilities, mantenerlo; no introducir excepción web silenciosa.

**C. Empresa activa server-scoped y verificada por request.** Seleccionar exclusivamente empresas donde el usuario tiene membresía vigente y capacidad para consultar el recurso. La empresa/sede suministrada por URL, formulario o query es **selector no autoridad**; siempre resolver y filtrar desde backend. Evitar una «empresa actual» global en caché o `localStorage`. Al cambiar empresa, sin resultados previos, incluyendo paginación y exportaciones.

**D. Lectura inicialmente, escritura solamente bajo contrato autorizado.** No incorporar nuevas rutas POST para crear sedes, publicar turnos, cambiar roles o corregir eventos si faltan transiciones/policies aprobadas. Eso no significa poner botones falsos: mostrar valores reales y explicar la acción disponible, ocultar CTA inexistente y registrar gate. Si ya existe el contrato de escritura, implementa UI mínima y test de permisos/CSRF, sin bloquearlo por comodidad.

**E. Semántica de tiempo.** Conservar `programado` vs `observado` vs `recibido` vs `reconocido`; mostrar TZ de la empresa y fuente explícita. Una hora declarada por dispositivo no es un hecho laboral aprobado; «sin datos de kiosco» no significa «ausente»; cero registros evaluados ≠ cero trabajadores presentes. No calcular nómina en B16. Un turno nocturno 23:00–07:00 conserva fecha/instancia sin reescribir historia.

**F. Diseño humano, no adorno.** Si hay mockup aprobado, seguirlo; si no, layout limpio existente, foco, etiquetado, contraste, responsive y estados reales, `UX_OWNER_APPROVAL=PENDING`. No crear quince componentes para cuatro vistas. No cambiar el kiosco ni la app empleado para perseguir simetría visual.

## 3. MACROBLOQUE PRODUCTIVO 1/5 — SHELL Y NAVEGACIÓN PROTEGIDA

- Construir dentro del código web Laravel existente una navegación completa **Hoy · Sedes · Turnos · Informes · Configuración/Plan**. Rutas separadas por responsabilidad pero sin capas artificiales. Layout único, parciales solo si se reutilizan, CSS local sin CDN/píxeles/analytics externos.
- Header: empresa activa (selector de las autorizadas), nombre de contexto, acceso a preferencias/plan **solo si existe consulta**, logout si la sesión web lo admite. Una membresía revocada durante la sesión invalida la vista del recurso en la siguiente solicitud.
- Render server-side si Blade; si ya existe frontend con servidor, adaptar a su patrón. Evitar componentes JS que guardan datos de empleados entre tenants; forzar un nuevo request validado para cambiar empresa.
- UX: ancho móvil 360 px, tablet 768, escritorio 1280; menú desplegable con teclado, foco visible, `aria-label`/labels, title/landmarks, tablas con desplazamiento horizontal controlado, sin flujo bloqueado por gráficos. Error 401/403/404 y estado sin empresa claros, sin stack traces.
- No permitir que cualquier ruta de desarrollo renderice datos de B; no poner fixtures de empleados de QA incrustados en vistas productivas.
- Evidencia: route:list por entorno si puede ejecutarse, pruebas de autorización y capturas reales solo si navegador se ejecuta. Si no navegador: `BROWSER_REAL=NOT_RUN`, y test de salida HTML Blade **no cuenta como responsive visual aprobado**.

## 4. MACROBLOQUE PRODUCTIVO 2/5 — HOY CON CALIDAD DE FUENTE

- Construir Hoy con resumen de empresa y sedes **realmente autorizadas**, freshness derivada de columna real en caso de existir y fecha/índice mostrados con TZ. Sin `last_seen_at` fiable: «Última sincronización no disponible», no «Online».
- Las cuatro métricas candidatas son **Trabajando**, **En descanso**, **Sin marcación esperada**, **Requiere revisión**. Activarlas solo con proyección de asistencia **reconocida**, reglas vigentes y cobertura de kioscos/sedes. Sin esa base, render «Indeterminado — datos todavía sin evaluar» en cada métrica, sin 0, porcentajes ni colores de sanción.
- Cuando exista **solo** evento recibido/UNASSESSED, mostrar una sección separada «Reportes recibidos (no verificados)», con totales de recepción solamente cuando el join empresa/sede/recibo sea comprobable. No llamarlo «presencia» y no reutilizar el visor QA personal B15-S3 como fuente de dashboard productivo.
- Estados de error, sin sede, multi-sede, turno nocturno y fuente stale. Nunca construir una proyección SQL ad hoc distinta del owner actual solo para poblar cards.
- Click de tarjetas dirige a filtro real si la métrica es comprobable; sin métrica comprobable no renderizar enlace inerte. GET no crea AttendanceEvent, no cambia recibos ni emite sanciones.

## 5. MACROBLOQUE PRODUCTIVO 3/5 — SEDES, EQUIPO Y CONTROL DE TENANCY

- Listar sedes reales de empresa seleccionada, con paginación server-side (p.ej., 25 por página), estado registrado y detalle. Query filtra tenant **antes** de paginar; no tomar `site_id` como autoridad. Si relación sede/empresa está ausente, bloquear ese subflujo y señalar tabla/contrato ausente; no crear un Site 2.0.
- Mostrar datos mínimos: nombre, identificación administrativa no sensible, estado, última sync **solo si real**. No mostrar PIN/hash, tokens, salarios, historias médicas, documentos, emails sensibles o payloads crudos. El total de empleados registrado no indica asistencia.
- Si existe relación equipo/roster aprobada, añadir sección mínima «Equipo registrado» con filtro por sede; empleado simple sin poder admin ve 403. Consulta de empleados limitada al tenant y a columns allowlist.
- Altas/edición de sedes, sedes asociadas, invitaciones y desactivación **solo** con rutas y permisos ya aprobados. De lo contrario, vista de consulta útil sin botón inerte. Si acciones existen: hacer CSRF, reglas de versión y pruebas negativas 403/cross-tenant.
- Evitar N+1: leer paginado y eager load solo si hay relación existente; no crear índices ni hacer migraciones por optimización especulativa.

## 6. MACROBLOQUE PRODUCTIVO 4/5 — TURNOS / CALENDARIO

- Detectar fuente aprobada de `Shift`/instancias/plantillas/asignaciones en Laravel. Si existen, página de turnos por semana con selector fecha y sede; diferenciar programado vs marcado, vigencia y cambio futuro; mostrar horas y fechas en TZ local sin romper 23:00→07:00.
- Históricos son inmutables por GET. No derivar un turno desde AttendanceEvent, ni suplir un turno faltante con una plantilla sintética. Fechas en UTC de almacenamiento vs horario de presentación documentadas.
- Ante backend sin turnos: vista de «No hay horarios publicados en este servidor» con gate `TURNOS_SOURCE=BLOCKED_NO_SCHEMA`, pruebas de vacío; **no** tabla con filas fake ni `PORTAL_TURNOS=PASS_REAL`.
- Si el contrato de alta/edición/versiones y policies ya existe, integrar UI mínima para esa operación, con rechazo de solapamientos, permisos, CSRF, test de historia no reescrita. Si no, interfaz de lectura sin CTA de publicación.
- Informar número de turnos **programados** (si es verificable) y no inferir empleados «ausentes» por no ver marcación.

## 7. MACROBLOQUE PRODUCTIVO 5/5 — INFORMES, EXPORTACIÓN Y PLANES

- Informes filtrables por empresa/sede/intervalo: únicamente datasets existentes y que el actor puede consultar. Mínimos útiles donde hay fuentes: catálogo de sedes, programación de turnos; si fuente recibos/ledger está autorizada y auditada, resumen separado «recepción no verificada», sin aprobación, horas trabajadas ni nombres de autor inferidos.
- Exportar CSV **solo** de filas que el usuario está autorizado a consultar, con headers estables, codificación UTF-8; escape CSV RFC4180/función estándar. Aplicar **neutralización de fórmulas a campos textuales** cuyo contenido efectivo tras espacios o controles iniciales comience `=`, `+`, `-`, `@` o variantes de control; probar el vector `=1+1` y valores precedidos de whitespace. No anular arbitrariamente números negativos ni transformar datos originales en base.
- Defender descargas: filtro tenant antes de consulta, límite de filas o streaming acotado, `Content-Type: text/csv`, `Content-Disposition: attachment` con nombre fijo seguro, `Cache-Control: private, no-store`, nunca payload_json, PIN, token, email innecesario o PII de empresa B.
- Plan Pro: mostrar derechos existentes solo si se demuestra su fuente y alcance empresa; si no, «Activación/comercialización aún no configurada» con cero botones de pagar/activar ficticios. No bloquear exportación de datos del titular por ausencia de entitlement. No integrar ni simular cobros.
- Vistas sin datos fiables tienen un vacío **funcional** pero `PORTAL_REPORTS=PARTIAL_SOURCE_GATE`, no PASS ficticio.

## 8. QA Y ACEPTACIÓN — 32 ORÁCULOS SIN REDUNDANCIA

**Ejecutar test focal de código nuevo y regresiones vecinas; no suites B13/B14/B15 completas ni bucle Docker. Cada O debe registrar:** expectativa falsable, entrada fixture sintético, ruta, fuente, exit, evidencia, y resultado **`PASS_KERNEL_QA`, `PASS_VIEW_HOST`, `PASS_STATIC_ONLY`, `PARTIAL`, `FAIL`, `NOT_RUN_ENV`, `BLOCKED_CONTRACT`**. Ningún PASS solo porque la UI se abre con datos fake o por el número bruto de aserciones.

**Autorización y sesión**
- `O01` anónimo no lee nada.
- `O02` propietario/admin A autorizado ve empresa A.
- `O03` URL/query company=B usando credencial A rechaza sin filtrar datos.
- `O04` site de empresa B en URL/filtro de A rechaza.
- `O05` empleado común sin permiso admin no accede al portal gerencial.
- `O06` membresía revocada o cuenta deshabilitada rechaza nueva solicitud.
- `O07` cambio empresa A→B revalida todas las consultas y no retiene filas/estados A.
- `O08` acciones de sesión: CSRF, cookies, logout y retorno prohibido, o gate explícito si web guard inexistente.

**Hoy y fuentes**
- `O09` sin proyección reconocida muestra IND/UNKNOWN, no contador 0 inventado.
- `O10` con proyección legítima de fixture aprobado calcula conteos solo si fuente y política existen; si no, `BLOCKED_CONTRACT`, no fake PASS.
- `O11` con sync ausente no declara «ausente» al trabajador.
- `O12` filtro de sede A/B no cruza reportes.
- `O13` GET Hoy no escribe evento/recibo/corrección.
- `O14` hora del cliente/recibo no se presenta como hora laboral reconocida.

**Sedes y turnos**
- `O15` listado A real o mock host explícitamente clasificado, paginado.
- `O16` detalle sede B por URL desde A 403/404 según contrato.
- `O17` roster restringido y datos mínimos, sin PIN ni médico.
- `O18` turnos de A se ven solo si fuente vigente existe.
- `O19` turno 23:00–07:00 cruza medianoche sin dividir identidad.
- `O20` GET de turnos no reescribe histórico ni concede publicación.
- `O21` acción de alta/edición o está correctamente restringida/testeada, o NO EXISTE CTA inerte.

**Informes, CSV y plan**
- `O22` informe sin fuente reconocida no inventa horas o sueldo.
- `O23` CSV con `=1+1`, `\t=1+1`, ` +cmd` queda neutralizado sin romper encoding y sin alterar origen.
- `O24` CSV de empresa A no contiene filas B por parámetro, enlace ni cambio de sesión.
- `O25` descarga `no-store`, tipo seguro, nombre fijo, límites.
- `O26` sin entitlement/cobro aprobado no muestra compra/activación falsos.

**UI, regresión y custodia**
- `O27` a 360/768/1280 px la navegación/tabla se adapta **solo con captura navegador real**, o `BROWSER_REAL=NOT_RUN` y PASS_VIEW_HOST estrictamente limitado a markup.
- `O28` teclado/foco/labels y cadenas escapadas; XSS literal no ejecutable en HTML.
- `O29` ruta/middleware confirmados en checkout, no solo matriz S5.
- `O30` no hay nueva SPA, backend alterno, identidad, código de marcado ni cambio al kiosk.
- `O31` fuentes tracked/untracked + hashes pre/post preservados, sin stage, sin git reset/clean.
- `O32` ZIP único completo verificable, parche se aplica sobre baselines, hashes+CRC y manifest.

**QA operativa:**
1. Una única ejecución RED focal cuando existe bug nuevo para documentar causa; GREEN con salida original y tests funcionales; si no se puede RED sin riesgo, declarar no ejecutada.
2. Si MariaDB QA **ya existe aislada** y autorizada, ejecutar tests Laravel feature correspondientes, con 401/403/404/200/CSV y asserts sobre datos, no solo status. Si no, host/static sin inventar MariaDB; evitar SQLite como sustituto de la seguridad MariaDB sin etiquetarlo claramente como prueba no equivalente.
3. Si existe navegador real accesible y sin conexiones externas, comprobar al menos páginas 360/768/1280 y una navegación de teclado; conservar capturas o `BROWSER_REAL=NOT_RUN`. No afirmar responsivo aprobado solo por HTML renderizado.
4. Laravel `route:list`, `php -l` y render Blade cuando sean seguros en ambiente actual. Documentar cada comando con exit y SHA fuente. Si ruta ausente/auth no configurado, no forzar configuración compartida.
5. Nunca L5 independiente para las propias pruebas de Codex. Si un test falla, corregir causa en este único lote y reejecutar solo test focal; no emitir PASS falso.

## 9. EMPAQUETADO ÚNICO Y CADENA DE CUSTODIA

Dentro de **un solo ZIP** colocar como mínimo:

- `FINAL_REPORT.md`: objetivo, funciones reales/QA/blocked, métricas/flags `B16_S1`, `PORTAL_WEB_LOGIN`, `PORTAL_HOY`, `PORTAL_SEDES`, `PORTAL_TURNOS`, `PORTAL_REPORTS`, `CSV_EXPORT`, `TENANT_SECURITY`, `BROWSER_REAL`, `L5_INDEPENDENT_RUNTIME`, `B13_GLOBAL`, `B14_FINAL`, `B15_GLOBAL`, `RELEASE_APPROVED`, next owner.
- `CONTRACT_MATRIX.md`: ruta/archivo+línea, middleware/abilities/roles, DB tabla/columnas reales, fuente asistencia versus sync, UX aprobada o candidata, decisión de stack. Si backend faltante, `BLOCKED_CONTRACT` explícito.
- `SOURCES/`: todos los archivos de código nuevos/modificados solo del macrobloque, sin secretos. `BASELINES/`: copia de bytes de **antes** de cada archivo modificado, incluyendo untracked; rutas nuevas con marcador `ABSENT_PRE_B16`. `PATCH_CANDIDATE.diff`: reproducible sobre esos baselines; no usar Git HEAD como baseline de WIP untracked.
- `SOURCE_CHANGE_MATRIX.csv`: path, tracked/untracked, bytes/sha256 pre/post, canonical ownership, evidencia diff. `TEST_MATRIX.csv`: O01–O32 resultados individuales con log/exit y regla aplicada; `AUDIT_L1_L6_10_PASSES.md`: 10 autorrevisiones, seis leyes cada una, hallazgos no decorativos.
- `EVIDENCE/`: `git_identity_pre_post.txt`, status pre/post exactos, comandos originales/exit, logs PHP/Blade/test, `ROUTE_INVENTORY.md`, `ENV_GATES.md`, capturas navegador solo si reales, QA incident report solo si incidentes nuevos, hashes/patch replay, `NEXT_GATE.md`.
- `MANIFEST_SHA256.txt`: incluir todos los miembros salvo manifiesto con hash y bytes; comprobar `ZipFile.testzip()/CRC`, unicidad de rutas, no traversal/symlink peligroso, sin `.env`, tokens, claves, backups DB, cookies, sesiones, PII ni credenciales. Registrar SHA256 final del ZIP en salida Codex, no dentro del mismo ZIP a menos que se evite autorreferencia.

**No entregar** un informe externo aparte ni una carpeta con 40 ficheros como adjuntos. La única ruta externa que se devuelve al dueño es el ZIP de entrega. Archivos de QA temporales dentro de D: no son entregables.

## 10. AUTOCONTROL Y SALIDA — L1–L6 SIN PINGPONG

Hacer **10 pasadas internas Codex**, seis leyes por pasada, revisando: arquitectura y riesgo real (L1); duplicación/eliminación no ciega (L2); causa raíz y oráculos (L3); UX aprobada, roles y errores (L4); pruebas genuinas y runtime atribuible (L5); avance funcional útil y ZIP único (L6). Estas son autorrevisiones **NO** auditoría independiente. No repetir todas las pruebas por cada pasada; una revisión puede referenciar evidencia única y explicar el hallazgo específico.

**Gate del paquete:** `PASS_FOCAL` requiere UI y al menos un recorrido de lectura real con tenant/guard correctos, test ejecutado contra fuente válida, sin privilegios inventados; `PARTIAL_HOST_OR_CONTRACT` si solo vistas/fixtures o auth/DB bloqueados. **Nunca** `RELEASE_READY` ni `B16_GLOBAL=PASS` porque se abran cuatro pestañas. Registrar `WEB_LOGIN_REAL` separadamente del render con `actingAs`.

**Rumbo después:** ChatGPT audita el ZIP una vez y decide B16 ajuste solo si un defecto concreto impide usar lo construido, de lo contrario continúa al vertical B17; quedan pendientes (sin recortarlos) controles físicos/autorización B15, portal Pro integral B16, novedades B17, reglas salario B18, expedientes B19, selección B20, pruebas independientes B21 y lanzamiento B22 con GO humano. No recomendar automáticamente otra ronda de prompts, no rehacer S5 ni B14.

**ORDEN FINAL:** ejecutar cambios en el checkout actual de D:, hacer QA focal posible, conservar las evidencias y entregar exactamente `JOR-B16-S1-V2-PORTAL-PRO-20261112-UNICO.zip` con `NEXT_OWNER=CHATGPT`. Si no se puede probar una parte por ambiente/contrato, continuar las otras partes y declararla NOT_RUN/BLOCKED; **no parar el macrobloque completo** ni simular capacidad productiva.