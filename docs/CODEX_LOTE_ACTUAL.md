# CODEX LUNA — JORNATO B21-S1 V2 · MACROBLOQUE DE INTEGRACIÓN REPRODUCIBLE Y CIERRE DE GATES

**ORDEN ÚNICA, NO PRE-EVALUACIÓN:** sustituye por completo `B21-S1 V1`. No ejecutar V1 ni crear V3 o microbloques por inercia.

**TASK_ID:** `JOR-B21-S1-V2-INTEGRATION-ROOT-20261115`  
**EJECUTA:** CODEX LUNA · **DIRIGE, AUDITA Y ACEPTA:** ChatGPT Director  
**PRODUCTO LOCAL:** `D:\codex\Jornato` (Windows 11 Home).  
**ÚNICA ENTREGA:** `D:\codex\_REPORTES\Jornato\JOR-B21-S1-V2-INTEGRATION-ROOT-20261115\JOR-B21-S1-V2-INTEGRATION-ROOT-20261115-UNICO.zip`.  
**RELEASE:** `NO_GO` salvo futura aprobación escrita y verificación B21 global. `NEXT_OWNER=CHATGPT_DIRECTOR` después del ZIP.

## 0. Contrato fijo y punto de partida — no reabrir B13–B20

- B13–B20 son avances PARCIALES, no producto listo. Último ZIP ejecutado y adjudicado por el director: B20 V2 `D4D5E1E1F3DFF63859990704AD90BACB0C498340C047751FDC45F001A8DFDF4F`: 74 miembros, manifiesto 73/73, parche 21/21, `php -l` 21/21 independientemente; 11 PHPUnit/84 aserciones son logs Codex con memoria y `Storage::fake`. No volver a comprobar esos ZIP ni repetir suites host antiguas sin modificar su árbol/contrato.
- Código WIP REAL vive en D:, no en `main` GitHub. `AGENTS.md`, `docs/JORNATO_CONTINUIDAD.md`, canon L1–L6 (`sierraglobalcompany-rgb/PingPongLaw` commit `84e961cadf482d234f4c0ee2ca60e8c7e9b388e8`) y el código local actual orientan la implementación. SPEC V5 y B03/H1 son **CANDIDATAS**: etiquetar `[P]/[J]/[OPEN]` como pendientes; no aprobar por defecto privacidad, salario, RR. HH., consentimientos, cobros ni firmas.
- **L1 KISS/Ponytail:** monolito y proveedores actuales; **L2:** una comprobación por causa, no duplicar; **L3:** corregir raíz reproducible; **L4:** UX real/estado claro, no pantallas engañosas; **L5:** separar evidencia autor/investigador independiente; **L6:** un macrobloque, sin microórdenes ni ping-pong.
- El B21-S1 actual es **integración focal**, NO el hito global B21/H9. La SPEC V5 prevé 110+ casos de sistema, pruebas con humanos, accesibilidad, seguridad, rendimiento, Android/hardware, independencia L5 y mismo SHA/build. **Nunca llamar `B21_GLOBAL=PASS` solo por I01–I24, ni pasar automáticamente a B22**. Preparar puerta para esos ensayos reales.

## 1. Límites de ejecución obligatorios

1. Trabajar solo en `D:\codex\Jornato`; archivos temporales propios en `D:\codex\_RUNTIME\Jornato\B21-S1-V2` y reporte en carpeta de entrega indicada. No escribir en C: (lectura de binarios del SO permitida), otros proyectos, instancias DB compartidas, Hostinger, GitHub, producción, medios físicos ajenos ni AVD no verificados. Sin instalación de servicios, descarga de software, cambios de firewall o privilegios.
2. PROHIBIDO `git add/commit/push/merge/reset/clean/stash/checkout/rebase`, deploy, borrar/reemplazar WIP, mover ignorados, reescribir historial o tocar ramas. La evidencia solo se recopila; `git status --porcelain=v1 --untracked-files=all`, HEAD, rama y staged al inicio y final. Si staged ya no es 0 antes de comenzar, **NO alterar ni limpiar ese staging**: registrar discrepancia y preservar.
3. Inventario **único y acotado** (sin revisar repositorios anteriores): `server/routes`, `server/config`, guards, memberships/companies/employees/roles, migraciones actuales y PHPUnit; Flutter personal solo lo necesario para contratos API. Inspeccionar providers B17/B19/B20 para confirmar deny-all. Una tabla `GATES_PRE.csv` con ruta+línea e indicio; no repetir búsquedas para cada oráculo.
4. Cualquier modificación se hace **solo después de demostrar** defecto reproducible o laguna de integración con caso negativo concreto; cero cambios de arquitectura, segunda autenticación, SPA, otro ledger, nueva base o rutas públicas ATS/documentos. Mantener B19 y B20 `DENY-ALL`; propietario/administrador **no** implica permiso de RR. HH.
5. Datos y fixture **100% ficticios**. Prohibido incluir tokens/PAT, claves, secretos, correos reales, datos médicos, empleados o datadir en logs/ZIP. IDs opacos y SHA de datos sintéticos; redacción de stdout/stderr conservando mensajes útiles.

## 2. Plan de trabajo ejecutable (una sola pasada por gate)

### Fase A — MariaDB propia, esquemas y concurrencia REAL (prioridad 1)

**A1. Selector DB sin parches automáticos.** Inspeccionar una vez binarios/servicios locales y `server/.env.testing`, `phpunit.xml`, configuración y migraciones. La SPEC candidata menciona PostgreSQL, pero los módulos recientes usan migraciones InnoDB/MariaDB: **mandan la configuración/implementación existentes verificadas; jamás cambiar motor por la documentación candidata**. Permitir MariaDB/MySQL local solo si es una instancia **exclusiva de Jornato QA**, con binarios preexistentes, proceso y datadir propios bajo D:, bind `127.0.0.1`, puerto no ocupado y usuario de mínimo privilegio; base inequívocamente vacía. No conectar a base de otra app ni intentar `migrate:fresh`/`drop` sobre DB no certificada como QA propia. Comprobar identificador del proceso, datadir y nombre DB antes de migrar. Si no hay medios permitidos, escribir **una sola** causa concreta `DB_REAL=NOT_RUN_ENV`, no instalar/forzar Docker ni simular MySQL usando SQLite, y seguir fases B–D sin reintentar A.

**A2. Si DB aislada existe:** migrar **toda la cadena real** desde una base limpia (incluye migraciones fundacionales anteriores a B13 y B17/B19/B20); usar versiones verdaderas del repositorio. Verificar tipos de `company_id`/`site_id`, índice padre real para FKs compuestas, collation/engine, unicidad `company_id+actor+request_id`, migraciones reversibles en datos ficticios. No suponer que toda tabla exige la misma FK compuesta: registrar `EXISTING_OK`, `SCHEMA_GAP_REPRODUCED` o `NOT_VERIFIED`, enlazando SQL observado. Corregir únicamente el fallo migratorio reproducido, sin agregar índices por intuición ni modificar datos históricos. No escribir en bases comerciales. Conservar SQL/DDL y comandos seguros saneados.

**A3. Concurrencia NO secuencial:** usar **dos conexiones/sesiones MariaDB simultáneamente activas** verificando IDs de conexión distintos (`CONNECTION_ID()` o equivalente), con barrera controlada y timeout/rollback/cleanup. Para B17, B19 y B20 comprobar por separado: (i) misma clave+huella repetida → **una mutación y un evento**, (ii) misma clave+distinta huella → conflicto sin mutación, (iii) excepción deliberada → rollback de objetos/filas DB (y reconocer que DB no garantiza limpieza de objeto físico). En B20 dos vacantes de una misma empresa, mismo entrevistador y franja superpuesta deben dar **una entrevista activa**, mientras franjas adyacentes sí pueden coexistir. No simular concurrencia con dos llamadas secuenciales ni presentar lock sintético como `PASS_REAL`. Evitar sleeps indefinidos; preservar pruebas y diagnóstico incluso en deadlock/timeouts.

**A4. A/B multiempresa:** con fixtures DB reales y peticiones/servicios existentes, probar company/site, empleado, solicitud B17, versión B19 y ATS B20, incluyendo lectura, escritura, filtro, paginación y exportación en superficies que existan. **No abrir rutas bloqueadas para probarlas**: comprobar servicio/policy/consulta DB con el scope real disponible, indicar la capa precisa y 403 si solo existe HTTP protegido. Una policy deny-all puede pasar la denegación pero **no** demuestra path feliz ni acceso autorizado a tenant A.

**Salida A válida:** `DB_REAL=PASS_REAL_SCOPED` con SQL/migraciones/IDs de dos conexiones y logs; si hay DB pero tests fallan, `DB_REAL=FAIL_REPRODUCED`, no `NOT_RUN_ENV`; sin DB propia, `NOT_RUN_ENV`. Nunca marcar PASS por `--pretend`, SQLite o fakes.

### Fase B — identidad actual y contrato de acceso (prioridad 2)

**B1. Mapa mínimo, con rutas reales:** `account/user -> membership vigente -> company activa -> employee opcional -> scope/rol/policy -> device/PAT`; resolver server-side por request. Confrontar `server/routes/api.php` y ruta `/api/v1/me` + `/api/v1/me/companies` con consumidor Flutter existente **solo si archivos actuales muestran discrepancia**; sin alias, migraciones ni modificaciones de rutas por rumores de B15. No confundir login, marcación y recepción.

**B2. Denegación por estado:** probar expiración/revocación de membership, tenant ajeno, rol no autorizado, token revocado, dispositivo revocado, CSRF/session web cuando exista. Si no hay guard/flujo web comercial aprobado, `WEB_LOGIN_REAL=BLOCKED_EXISTING_AUTH_CONTRACT`, `HTTP_WEB_E2E=NOT_RUN` y prueba negativa de acceso, **sin** crear segundo login ni llamar autenticación real a `actingAs`.

**B3. Conectar una frontera real SI existe la identidad:** un único recorrido autorizado, por ejemplo token QA preexistente permitido -> `/api/v1/me` -> empresas activas -> datos del mismo tenant -> rechazo cross-tenant y token revocado, con respuestas redactadas; `PAT_REAL=PASS_REAL_SCOPED` únicamente si backend/kernel+DB actuaron realmente. Si está bloqueado por texto legal, falta de vinculación user/employee o policy inexistente, escribir `IDENTITY_CHAIN=BLOCKED_CONTRACT` con **un requisito preciso y dueño**, y continuar B4; no inventar policy/consentimiento.

**B4. Fallback PRODUCTIVO cuando falla A o B3:** crear o reforzar **el mínimo test de contrato reutilizable** (no otra suite completa) que compruebe mapa de identidad y rechazo de empresa A/B en la capa host/proveedor existente, o esquema/replay de las rutas existentes; trabajar sobre tests actuales, nunca permitir escape productivo. Debe producir prueba falsable y resultado propio o `BLOCKED_EXACT_SOURCE` si el consumidor mismo no existe. **No fabricar un PASS real**. Si el contrato ya está cubierto con SHA previo y sin delta, reutilizarlo y pasar a C; no crear archivo decorativo.

### Fase C — ocho fronteras B13–B20 sin repetir suites (prioridad 3)

Registrar C01–C08 en `CROSS_FLOW_RESULTS.csv`; ejecutar solo acciones permitidas y clasificarlas `DB_REAL`, `HTTP_KERNEL_DB_REAL`, `PHP_HOST_FAKE`, `FLUTTER_HOST`, `WEB_BROWSER`, `ANDROID_PHYSICAL`, `STATIC` o `BLOCKED`. **No sumar estas capas como un PASS global.**

- **C01 identidad:** tenant A/B, membresía activa/revocada, operador versus trabajador, validación servidor; `actingAs` es host, no login comercial.
- **C02 B14 outbox:** un mismo evento offline se envía dos veces, un solo recibo; `SERVER_STORED/UNASSESSED` no asciende a tiempo reconocido. Sin dispositivo y sync real, limitar al kernel/API host identificado.
- **C03 B15 personal:** PAT y revocación real, app personal y estado de sincronización; Flutter host sólo si SDK local disponible. No tocar AVDs/dispositivos ajenos ni afirmar GPS/QR/WiFi físico sin ensayo.
- **C04 B16 web:** sesión guardada por flujo existente, Hoy «Indeterminado», sedes/CSV scoped y rechazo A/B. Blade render host ≠ navegador real. Sin login aprobado, conservar cierre comercial.
- **C05 B17:** creación de solicitud titular, estado, histórico, retry, permisos justificados ≠ marcaciones; revisión HR denegada si falta policy.
- **C06 B18:** **no volver a calcular F01–F07** salvo modificar consumidor; comprobar solo proveniencia cruzada `OBSERVADO/RECONOCIDO` y QA pack `UNVERIFIED` siempre cerrado fuera de tests.
- **C07 B19:** versiones/download hash con read acotado y tenant; fake storage ≠ IAM privado/AV/cifrado en producción. Permiso HR productivo debe seguir deny-all.
- **C08 B20:** 0 rutas ATS públicas; deny-all y token QA efímero; agenda DB en A3; ningún CV real, publicación ATS o handoff comercial.

Si una frontera está bloqueada, **continuar las otras siete** en el mismo lote y registrar un único blocker. No añadir endpoints temporales para pasar Cxx. QA de UX: documentar qué superficies reales se ven y qué aún requiere dueño/navegador/dispositivo, sin fotos inventadas.

### Fase D — seguridad, QA global aún pendiente y decisiones (prioridad 4)

**D1. Negativos de seguridad por capa disponible:** auth default deny B19/B20, IDOR entre empresas, CSRF/sesión web, CSV injection, MIME/traversal/download, PII/tokens en logs, storage fuera de webroot, expiración PAT y rate-limits solo donde esté implementado. No vulnerar datos ajenos ni reclamar verificación de malware, cifrado en reposo, permisos IAM o políticas de retención sin evidencia real.

**D2. Matriz global:** mapear 110+ escenarios V5 y gates H4–H9 como `HISTORICAL_PASS_SCOPED_WITH_SHA`, `EXECUTED_THIS_LOT`, `NOT_RUN`, `BLOCKED_CONTRACT` o `NOT_APPLICABLE_JUSTIFIED`. Registrar `TREE_OR_BUILD_SHA`, versión de runtime y test real. **B21-S1 no es B21/H9 completo**: quedan QA independiente L5 de árbol exacto, pruebas con dueño/empleado sin guía, accesibilidad, amenazas, rendimiento, 2+ dispositivos offline, Android/iOS/MDM según modalidad y UAT. Dar cobertura real, no 110 PASS declarados ni reejecutar mecánicamente pruebas host anteriores.

**D3. Decisiones externas:** `OWNER_DECISIONS.md` **máximo 8 preguntas separadas**, sin respuestas inventadas. Para cada una: `ID | Sí/No u opción | recomendación | impacto y rutas afectadas | revisión jurídica/contable | owner | estado=NO_DECIDIDO`. Agrupar: (1) aviso privacidad/consentimiento/retención, (2) invitación cuenta↔empleado, (3) permisos HR por acción/empresa, (4) web login e invitación/sesión, (5) ATS público/CV/malware y derechos, (6) plantillas/firma/entrega, (7) homologación legal remuneración y exportación, (8) planes/precios/billing. No suponer que pedir al director desbloquea aprobación legal/tercero. Si una decisión ya está expresamente aprobada en documentación vinculante, citarla y no preguntar otra vez.

**D4. `RELEASE_GATES.csv`:** por gate `status,layer,real_evidence_sha,blocking_owner,exit_criterion,affected_module`. Estados precisos: `PASS_REAL_SCOPED`, `PASS_HOST_SCOPED`, `FAIL_REPRODUCED`, `PARTIAL`, `NOT_RUN_ENV`, `BLOCKED_CONTRACT`, `NOT_VERIFIED`, `NO_GO`. **`RELEASE_APPROVED=NO`, `B21_GLOBAL=NOT_APPROVED`, `L5_INDEPENDENT_RUNTIME=NOT_RUN`** a la entrega de Codex hasta dictamen independiente y GO escrito. Si se reproduce P0/P1 de producto, corregir en el mismo lote si es seguro y focal; sino registrar NO_GO con fuente. `B21_S1` puede ser `PASS_SCOPED` o `PARTIAL`, jamás GO comercial.

## 3. Oráculos B21 V1 conservados textualmente (24 criterios; NO 24 suites)

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

Estos **24 criterios originales** se conservan literalmente. Agregar **solo evidencia operativa**: para I01–I24 consignar `ID,criterio,fuente/ruta,expected,observado,comando,cwd,exitcode,log,estado,layer,tested_tree_sha,bloqueo`. No transformar un static check en QA real, ni un `NOT_RUN_ENV` en PASS. Para I05–I07 anexar IDs de las **dos conexiones concurrentes**, barrera y resultados (o `NOT_RUN_ENV`); para I22 indicar casos de SPEC cubiertos realmente. Falsable importa más que contar tests.

## 4. Reglas antipingpong de ejecución y salida

- **Solo una preinspección** de entorno, una tentativa DB si está permitido, luego pasar adelante. No rescatar la misma DB con cinco variantes ni crear otro «diagnóstico S2» como entrega. Si una barrera de seguridad/proceso rechaza iniciar un servicio, detener esa vía; no buscar cómo eludir la policy.
- Trabajar en cambios de producción únicamente con defecto nuevo reproducido/contrato existente autorizado. **Prueba host de frontera** si falta DB real, solo si no está ya acreditada por SHA anterior; no inventar trabajo por llenar el ZIP. Priorizar remoción de impedimento real sobre ampliación de auditoría.
- Toda prueba que se diga ejecutada: comando exacto, versión, working dir, salida completa redactada, código de retorno, fuente SHA y `ENV_GATES.md`. `L5_INDEPENDENT` siempre reservado al director, nunca firmado por Codex.
- No reejecutar baterías B13–B20 ya adjudicadas salvo código consumidor cambiado o necesidad explícita de regresión focal. Nunca emitir «nueva SPEC» o decisiones unilaterales de producto.
- Si A/B fallan por ambiente, **continuar C/D** y devolver reporte honesto + evidencias de tests de contratos pertinentes. Si el estado sigue `PARTIAL`, decirlo una sola vez con bloqueos accionables; no crear B21-S2 automática.

## 5. ZIP único de evidencia y custodia

Crear exclusivamente `JOR-B21-S1-V2-INTEGRATION-ROOT-20261115-UNICO.zip`, bajo la carpeta de entrega declarada. Contenido mínimo:

`FINAL_REPORT.md`, `GATES_PRE.csv`, `ENV_GATES.md`, `RELEASE_GATES.csv`, `OWNER_DECISIONS.md`, `ORACLES_I01_I24.csv`, `CROSS_FLOW_RESULTS.csv`, `COVERAGE_B13_B20.csv`, `SOURCE_CHANGE_MATRIX.csv`, `SOURCE_HASHES_PRE_POST.csv`, `PATCH_CANDIDATE.diff`, `BASELINES/`, `SOURCES/`, `LOGS/`, `AUDIT_L1_L6_10_PASSES.md`, `MANIFEST_SHA256.csv`.

**Regla parche real:** si hay cambios, `PATCH_CANDIDATE.diff` debe reconstruir byte a byte cada archivo final de `SOURCES/` sobre `BASELINES/` incluyendo marcadores `.absent` de nuevos y preimágenes verdaderas de untracked. Replay seguro en otra carpeta bajo D:. Si no hay cambio de código, diferenciar `NO_PRODUCT_CODE_CHANGE` y parche vacío legítimo; **no fabricar fuentes o «0/0 PASS» de funcionalidad**. SHA256+bytes de todos los miembros excepto manifiesto y CRC de ZIP verificado. No incluir binarios MariaDB, datadir, credenciales, token, APK, información de empleados ni rutas de otros proyectos.

**WIP:** conservar 100% de archivos previos distintos de los estrictamente modificados con justificación, rama/HEAD, staging y excluidos. Reportar `unchanged/changed/added/removed`, hash pre/post; no afirmar identidad de ignorados sin hash inicial. Solo un ZIP visible en carpeta delivery; archivos intermedios dentro de área propia pero no entregar dispersos.

**Reporte terminal exacto (una línea):**
`TASK_ID=JOR-B21-S1-V2-INTEGRATION-ROOT-20261115 | B21_S1=PASS_SCOPED/PARTIAL/NO_GO | DB_REAL=... | IDENTITY_CHAIN=... | WEB_REAL=... | C01_C08=... | B21_GLOBAL=NOT_APPROVED | L5_INDEPENDENT_RUNTIME=NOT_RUN | RELEASE_APPROVED=NO | WIP=... | ZIP_SHA256=... | NEXT_OWNER=CHATGPT_DIRECTOR`

**Siguiente actor:** CODEX LUNA hasta que entregue ese ZIP; luego CHATGPT DIRECTOR audita una sola vez lo NUEVO, define qué bloqueos son de usuario/profesionales y si falta B21 global. **No ejecutar B22 ni decir que el programa está listo por haber cerrado B21-S1.**