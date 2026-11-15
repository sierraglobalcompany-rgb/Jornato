# RECOVERY HANDOFF — JORNATO · B21 IPAM RESUELTO, MARIADB REAL Y TRES FALLOS PENDIENTES

**Recovery Universal V6, modo:** `REANUDAR + ACTUALIZAR_POR_DELTA` con handoffs de 2026-11-06 y ZIP B21 IPAM más reciente.  
**Corte documental:** 2026-11-15, America/Bogota. **Director:** ChatGPT; **ejecutor local cuando se autorice una nueva orden:** Codex Luna; **aprobaciones comerciales:** propietario.  
**Naturaleza de este archivo:** relevo autocontenido para otro chat; NO es instrucción ejecutable, copia del código, respaldo de WIP, autorización para editar, instalar, publicar o hacer deploy.

## A. RECOVERY SEED AUTÓNOMO — LEER PRIMERO

> **Jornato** es una app de control de asistencia y jornadas laborales. Contempla kiosco **Gratis Local offline**, edición **Pro** con Flutter/SQLCipher/outbox, backend Laravel/Sanctum/MariaDB, empleados, portal web y funciones de RR. HH. La meta es un **primer lanzamiento integral**, no declarar comercial cada hito aislado.  
> **ÚLTIMO TRABAJO:** `JOR-B21-IPAM-RECOVERY-REAL-DB-QA-20261115`, ZIP SHA-256 `C51440AB28DD218F7A6C6EA35751DAA500B6FC67F45F6823FDD56DB9459E307B`. La recuperación IPAM **funcionó**, MariaDB 11.8.9 propia arrancó y se detuvo después, se aplicaron **11 migraciones** (37 tablas InnoDB); los ejercicios concurrentes B17/B19/B20 figuran PASS en logs de Codex, **B19 con almacenamiento fake**. La suite DB QA terminó **153/156, EXIT=1, TRES FALLOS**: dos por orden textual de `Cache-Control` y **uno B17 de autorización: otro usuario de la misma empresa recibió HTTP 200 donde el test esperaba 404**. Una ejecución separada respondió 404; esto NO borra ni explica el 200. A→B y PAT activo/revocado/expirado siguen parciales/no ejecutados. **RELEASE=NO; B21_GLOBAL=NOT_APPROVED.**
>
> **NEXT ÚNICO = CHATGPT_DIRECTOR_ADJUDICAR_B17_FALLO_DE_ACCESO_Y_PREPARAR_SOLO_CIERRE_FOCAL.** La próxima ejecución local, si se autoriza, debe reproducir y diagnosticar la discrepancia 200/404 sin esconderla; además tratar expectativas `Cache-Control`, completar A→B y PAT con pruebas reales focales. **NO repetir IPAM, Docker pull, 11 migraciones, carreras ya comprobadas, 20 pasadas de prompt ni suites históricas sin relación.** Codex NO tiene orden nueva emitida por este Handoff. Mantener el acceso B17 no aprobado mientras se investiga.

**Estado compacto:** `RECUPERACION=SUFICIENTE_DOCUMENTAL`, `B21_IPAM=PASS_REAL_SCOPED_REPORTED`, `B21_DB=PASS_REAL_DB_SCOPED_REPORTED`, `B21_CONCURRENCY=B17/B19/B20_PASS_SCOPED_REPORTED`, `SUITE=153/156_EXIT_1`, `B17_CROSS_USER=FAIL_OBSERVED_IN_LOGS_ROOT_UNKNOWN`, `TENANT_A_B=NOT_RUN`, `PAT_LIFECYCLE=NOT_RUN`, `WIP_LOCAL=NOT_VERIFIED_DIRECTLY`, `RELEASE_APPROVED=NO`, `NEXT_OWNER=CHATGPT_DIRECTOR`.

## B. IDENTIDAD, FUENTES Y CONFIANZA

| Fuente comprobada ahora | Identificador | Qué demuestra y límite |
|---|---|---|
| **ZIP nuevo aportado** | Archivo subido `JOR-B21-IPAM-RECOVERY-20261115-UNICO(1).zip`, **68.843 bytes**, SHA-256 `c51440ab28dd218f7a6c6ea35751daa500b6fc67f45f6823fdd56db9459e307b` | **VERIFICADO_DIRECTO**: ZIP 36 miembros, CRC PASS, cero duplicados/rutas inseguras, MANIFEST 35/35 bytes+SHA PASS. **REPORTADO_RUNTIME**: ejecución Docker, SQL, concurrencia y PHPUnit; no se ejecutó nada de esto desde el entorno ChatGPT. |
| **Prompt IPAM ejecutado** | `CODEX_LUNA_JORNATO_B21_IPAM_RECUPERACION_Y_QA_REAL_MACROBLOQUE_UNICO_20261115 (1).md`, SHA-256 `36c9b440ac7e79133575a11a32d18f5077f10e74b0edfaf41d34765312d2ad69` | **VERIFICADO_DIRECTO como orden**. Ya fue ejecutado; NO reenviarlo. Conserva 12 DO y añade IPAM01. |
| **Dictamen del lote Docker anterior** | `JORNATO_B21_DOCKER_QA_S1_V2_DICTAMEN_ZIP_IPAM_CAUSA_RAIZ_Y_PLAN_UNICO_20261115(1).md`, SHA-256 `c4248d18283e18c315e75173b96c2281e6878be47f623ffa16b6daaf0ee011a7` | Explica agotamiento IPAM **anterior**, YA SUPERADO por este ZIP. |
| **Recovery Universal V6** | `Recovery(1).md`, SHA-256 `84715587a4641b5cab5309ed635de887e935c8bf7d89bea91a36eb9798b4cf77` | **VERIFICADO_DIRECTO**: modos, reglas, Handoff A–H, diez controles P01–P10; no da permisos de escritura por sí solo. |
| **Recovery histórico 06-nov.** | `JORNATO_RECOVERY_HANDOFF_ACTUALIZADO_2026-11-06(1).md` y `JORNATO_RECOVERY_COMPLEMENTO_AUDITADO_2026-11-06(1).md` | Linaje del producto y B13/B14. **SUPERADOS** como estado actual por entregas B15–B21; conservar solo las decisiones/alertas aún aplicables. |
| **GitHub remoto, leído** | `sierraglobalcompany-rgb/Jornato`; rama docs `docs/pingponglaw-l1-l6-canon-84e961c`; `docs/JORNATO_CONTINUIDAD.md` blob observado `4e6c5fd024de9a1900b05b0a62208c5c7c40af07` **antes de su actualización por este recovery** | En el momento de consulta el checkpoint todavía decía que la orden IPAM estaba **pendiente**, ya OBSOLETO frente al ZIP actual. Su contenido es dirección documental, **NO** prueba del WIP local. |
| **GitHub PR y main, leído** | `main` SHA `1ee6aae821f8cf177cc64149081ad8847f7fec2e`; PR #1 OPEN/DRAFT HEAD `faf5fe283191f8b5a2724b397009512a2caec1b6`; PR #2 OPEN/DRAFT HEAD `ce4e40d678c5d2763c946cde15523de66eb3d00c` **en la consulta previa a actualizar docs** | Los PRs no incluyen el WIP local no publicado. Refrescar solo si un nuevo commit material cambia la acción. |
| **Canon de seis leyes** | `sierraglobalcompany-rgb/PingPongLaw`, commit `84e961cadf482d234f4c0ee2ca60e8c7e9b388e8`, `docs/engineering/LEYES_IMPLEMENTACION_1_A_6.md` blob `0f6e7b4e62d8660c846f135e18dded629d29e0da`, router `.agents/skills/pingponglaw/SKILL.md` blob `c8072a07431e4011cbc566446942dab51f0b45b9` | **CANON_READ=PASS** en GitHub, seis leyes: L1 KISS/Ponytail, L2 antirruido, L3 causa raíz, L4 UX humana, L5 verificación independiente, L6 antipingpong. No instalar skills/hook automáticamente. |

**RECOVERY_SEED:** informe terminal Codex y ZIP B21 IPAM adjuntos. **RECOVERY_GAP:** las fuentes accesibles llegan al ZIP de este turno; el estado posterior en el PC (si Codex volvió a trabajar) es `NO_VERIFICABLE`. **CHATGPT_PROJECT:** no asumir acceso a todos los chats ni archivos no adjuntos. **WORKTREE_LOCAL:** no accesible desde este runtime; WIP declarado no constituye respaldo.

## C. PRODUCTO, LEYES Y CONTRATOS QUE NO SE DEBEN ALTERAR

- **Objetivo funcional:** entradas/salidas, pausas, horarios, tardanzas, ausencias, reportes y correcciones auditadas para pequeñas empresas; kiosco local offline + Pro multidispositivo y web, cuenta personal de empleado, solicitudes, documentos, remuneración **informativa**, ATS con permisos, administración empresa/sede/rol. **Plan ≠ funcionalidad implementada ni release.**
- **Stack y arquitectura aprobada KISS/Ponytail:** Flutter + SQLCipher/outbox local; Laravel/Sanctum + MariaDB/InnoDB en servidor; ledger/sync existentes, sin segundo backend, colas o microservicios nuevos. Android mínimo API 24. No transformar pruebas sintéticas en permisos de negocio.
- **Contrato attendance:** `requestId` correcto, jamás normalizar `requetId` histórico para ocultar el fallo; `SERVER_STORED` ≠ `RECOGNIZED`; un registro transportado no implica asistencia laboral reconocida. Aislamiento empresa/sede/actor. Correcciones justificadas, nunca reescribir historia sin contrato.
- **Autorizaciones B19/B20:** en producto permanecen `DENY-ALL`; autorizadores de prueba con datos ficticios no abren documentos, ATS, CV reales ni rutas públicas. En B19 se probó **DB real + Storage::fake**, no integridad de almacenamiento productivo. Escáner malware no verificado.
- **Decisiones propietario OD01–OD08:** todas `NO_DECIDIDO` conforme `OWNER_DECISIONS.md` del ZIP: OD01 consentimiento/privacidad/retención; OD02 vincular/revocar cuenta↔empleado; OD03 permisos RR. HH. por empresa/sede; OD04 login web y recuperación; OD05 ATS público y CV/antimalware; OD06 plantillas/firma/entrega; OD07 homologación legal de remuneración; OD08 precios/pagos/cancelación/facturación. No atribuir aprobación implícita.
- **Prohibiciones:** sin `git add/commit/push/merge/rebase/reset/clean/stash`, sin deploy, cambios Hostinger/producción/otros proyectos, secrets en ZIP, `docker prune`, reinicios Docker Desktop/daemon/WSL o eliminación de redes/volúmenes ajenos. Docker existente autorizado **solo** para QA aislada de Jornato sin interferencia. No instalar herramientas ni activar hooks por el Recovery.

## D. ESTADO TÉCNICO B21 DEL ZIP NUEVO (EVIDENCIA POR CAPA)

**Runtime reportado por Codex y respaldado documentalmente por archivos del ZIP:** Docker Desktop contexto `desktop-linux`, Engine 29.9.2, Compose 5.6.1; imagen oficial `mariadb:11.8.9`, digest `mariadb@sha256:d36f18d65a0459510b8b0f643b226a6d299e3206486e2b64ff20754a6d291707` **reutilizado sin pull**. Compose `-p jornato_b21_qa_20261115`, red bridge privada explícita `10.0.0.0/28`, gateway `10.0.0.1`, sin solapamientos en inventarios reportados (41 redes Docker, 39 prefijos, 29 rutas Windows, 8 redes de interfaz, 2 WSL). Una sola orden `up` exit 0, DB healthy, SQL de identidad correcto después de dos fallos iniciales de probes (exit 23 y 22 **no ocultarlos**). Proceso Docker propio detuvo únicamente `db` al final; contenedor `exited`, red/datadir/secrets del laboratorio preservados, 3 contenedores ajenos activos con huella IDs/estado/health/puertos idéntica en PRE/DURING/POST **según el reporte**.

**Rutas:** producto en `D:\codex\Jornato`; rama `codex/jor-b08-h4-domain-20261025`; HEAD reportado `faf5fe283191f8b5a2724b397009512a2caec1b6`; `git status --porcelain` 235 entradas y staged 0. Inventario de **237 rutas** (13 TRACKED, 224 UNTRACKED): `bytes_pre=bytes_post`, `sha256_pre=sha256_post` sin distinguir mayúsculas de hex, `UNCHANGED` 237/237. **235 entradas de Git y 237 rutas inventariadas son universos distintos, no una discrepancia de pérdida.** Los ignorados no están respaldados por hashes; `PATCH_CANDIDATE.diff` tiene 0 bytes; sin modificaciones producto. No confundir la carpeta ZIP con el WIP recuperable.

**DB:** 11 migraciones en schema QA vacío `jornato_b21_qa` (identidad SQL real reportada), 37 tablas InnoDB, 136 índices totales, 81 registros de índices primary/unique, 103 registros de columnas FK, 0 triggers; `MIGRATE_EXIT=0`, `STATUS_EXIT=0`. El ZIP contiene `DB_DDL_INDEX_FK.md` con 37 declaraciones CREATE TABLE, **no contiene DB ni dump real**.

| Caso | Clasificación provisional | Evidencia y límite |
|---|---|---|
| **B17 idempotencia** | `PASS_REAL_CONCURRENCY_REPORTED_SCOPED` | Workers PIDs 46844/44292, conexiones 931/932, solape reportado, 201/200, una solicitud y un evento, payload distinto 409. **Esto NO aprueba la lectura entre usuarios del suite que devolvió 200.** |
| **B19 documentos** | `PASS_REAL_DB_CONCURRENCY_REPORTED_STORAGE_FAKE` | Workers pares 26336/15808 y 45032/42424, conexiones 937/938 y 939/940; versiones/eventos únicos y hashes simulados consistentes. `Storage::fake` + QA authorizer, producto `DENY-ALL`; malware/storage real `NOT_VERIFIED`. |
| **B20 entrevistas** | `PASS_REAL_CONCURRENCY_REPORTED_SCOPED` | Workers 23708/33592, conexiones 941/942, intento solapado, un evento/entrevista activa, otro conflicto 409. ATS público/productivo cerrado. |
| **Aislamiento A→B** | `PARTIAL/NOT_RUN` | No hubo ataques adversariales empresa A vs empresa B en HTTP/DB en este lote; esquema y ejemplo mismo-company no bastan. |
| **PAT activo/revocado/expirado** | `NOT_RUN` | Se usaron identidades sintéticas en B17, pero no se probó ciclo PAT completo. |
| **PHPUnit DB real** | **`FAIL`, exit 1** | **156 tests, 2398 aserciones, 153 PASS y 3 FAIL** según `LOGS/phpunit-suite-summary.txt`; no elevar suite global a PASS. |

**Los tres fallos de la suite: dos** aserciones comparan literalmente `Cache-Control: private, no-store, max-age=0` esperado contra `max-age=0, no-store, private` observado. Directivas parecen equivalentes **según el resumen**, pero falta revisar su contrato y la prueba exacta; no editar test por inercia. **Tercero:** un test B17 **en el mismo proceso** esperaba `404` al consultar solicitud de otro usuario de la misma empresa y obtuvo `200`; harness **de otro proceso** reportó `404`. **EN_CONFLICTO**; podría ser autorización o aislamiento de estado de tests, y NO se determinó causa. La ausencia de logs crudos individuales en el ZIP impide atribuirla. Tratar como **riesgo de exposición de solicitudes entre usuarios hasta demostrar lo contrario**; no etiquetar resuelto.

**DO01–DO12:** DO01–DO05 `PASS_REAL_*_SCOPED` reportados; DO06 y DO10 `PARTIAL_REAL_DB_SCOPED`; DO07–DO09 `PASS_REAL_CONCURRENCY` reportados; DO11–DO12 `PASS_REAL_SCOPED` reportados. `I01_I24_DELTA.csv` solo modifica I03–I07; **no se convierten automáticamente I01–I24 completos en PASS**. `RELEASE=NO`, `B21_GLOBAL=NOT_APPROVED`, `L5_INDEPENDENT_RUNTIME=NOT_COMPLETADO`.

## E. ESTADO DE BLOQUES, HISTORIAL BREVE Y BLOQUEOS

| Bloque | Estado que debe conservarse | Lo que NO se repite |
|---|---|---|
| B08–B12 (local/Android) | Desarrollo y QA focales históricos; inicio estable Android global aún no certificado. | No resucitar F1 o toda la regresión por continuidad. |
| B13 (tenancy, alta, consentimientos) | `PARTIAL`, contratos comerciales/legal y verificación pendientes. | No habilitar signup público por test sintético. |
| B14 (sync) | `PARTIAL` histórico; raw `requestId` y hardware/UX han tenido gates específicos. | No borrar el fallo original de `requetId` ni reejecutar el viejo F1. |
| B15 (empleado) | S1–S5 tuvieron PASS host/API scoped; identidad cuenta↔empleado y Android real pendientes. | No declarar app empleado totalmente disponible. |
| B16 (portal) | S1 host parcial, web login real sin contrato aprobado. | No crear segunda autenticación. |
| B17 (solicitudes) | Idempotencia concurrente real **focal favorable**, suite con **acceso 200 inesperado**. | No abrir permiso ni aceptar lectura como PASS. |
| B18 (remuneración informativa) | Motor sintético, legal y DB/web completo pendientes. | No afirmar nómina legal homologada. |
| B19 (documentos) | DB concurrente real con almacenamiento fake, permisología comercial cerrada. | No subir CV reales, habilitar documentos ni escaneo ficticio. |
| B20 (ATS) | DB concurrente real, servicio sintético, rutas públicas/HR cerradas. | No abrir reclutamiento comercial. |
| B21 (QA global H9) | Integración DB real mejorada, **3 fallos en suite**, A→B/PAT pendientes, UX/hardware/accesibilidad/L5 pendientes. | No reabrir IPAM ni 11 migraciones por inercia. |
| B22 (lanzamiento) | `NOT_AUTHORIZED` | No firmar, publicar, hacer deploy, merge ni facturación. |

**Riesgos adicionales:** WIP local casi totalmente no publicado; no hay backup externo cifrado verificado (`OFF_DEVICE_BACKUP=NOT_DONE` en históricos), pero el usuario **no autoriza** exigir un disco adicional como bloqueo rutinario: trabajar en D, no convertir esto en excusa para otro lote documental. No se ha observado el estado de Codex en vivo ni otra tarea local posterior al ZIP: `CODEX_ACTIVE_NOW=NOT_VERIFIED`.

## F. EVIDENCE LEDGER, CONTRADICCIONES Y ACEPTACIÓN

| ID | Afirmación | Clase | Fuente | Regla |
|---|---|---|---|---|
| E01 | ZIP tiene 36 miembros y 35/35 entradas SHA+bytes válidas | `VERIFICADO_DIRECTO` | Archivo ZIP físico montado; CRC y manifiesto contrastados | Integridad ≠ test runtime. |
| E02 | Ruta IPAM `/28` no se superpone | `REPORTADO_RUNTIME` / inspección de CSV | `IPAM_SELECTION.md`, `IPAM_INVENTORY_SANITIZED.csv`; hashes de inventarios sin rutas completas | PASS scoped a ventana; no garantizar eternamente subred libre. |
| E03 | 11 migraciones/37 tablas InnoDB | `REPORTADO_RUNTIME` + DDL inspeccionado | `DB_MIGRATIONS_LOG.txt`, `DB_DDL_INDEX_FK.md` | Evidencia de QA sobre DB ficticia, no de producción. |
| E04 | B17/B19/B20 trabajan concurrentemente | `REPORTADO_RUNTIME` | `LOGS/concurrency-sanitized.json`, `CONCURRENCY_B17_B19_B20.csv` | PIDs/CONNECTION_ID y solape reportados; no reejecutados por ChatGPT. |
| E05 | PHPUnit exit 1, 153/156, tres fallos | `REPORTADO_RUNTIME` | `LOGS/phpunit-suite-summary.txt`; **no trae raw completo** | Bloquea PASS global del suite. |
| E06 | B17 mismo-empresa otro usuario da 200 en suite, 404 por otro proceso | `EN_CONFLICTO` | Resumen PHPUnit vs `LOGS/concurrency-sanitized.json` | Prioridad de diagnóstico, no elegir el PASS conveniente. |
| E07 | WIP 237/237 sin cambios | `VERIFICADO_DIRECTO` solo consistencia de CSV; runtime `REPORTADO` | `SOURCE_HASHES_PRE_POST.csv`, `GIT_CUSTODY.md` | No se leyó D:\codex\Jornato en este chat. |
| E08 | Otros contenedores no afectados | `REPORTADO_RUNTIME` | `DOCKER_ISOLATION_PRE_POST.csv`, `LOGS/docker-isolation-summary.json` | Tres activos con hash igual, sin garantía de aislamiento físico absoluto. |
| E09 | GitHub activo aún decía ejecutar IPAM | `VERIFICADO_DIRECTO REMOTO` al consultar | `docs/JORNATO_CONTINUIDAD.md` y `docs/CODEX_LOTE_ACTUAL.md` del PR #2 antes de actualizar | Se deben desactivar órdenes ya realizadas; no confundir rama de docs con WIP. |

**Recuperación no inventa porcentajes de lanzamiento:** `PRODUCT_READY_PERCENT=NO_ESTIMABLE`. La comparación de `Cache-Control` sugiere fragilidad del test, pero no demuestra que el contrato sea correcto; el 200 podría ser bug grave de control de acceso o contaminación de estado de prueba. Solo logs/código/tests actuales de D pueden resolver la contradicción.

## G. CONTINUIDAD EJECUTABLE SIN PING-PONG (NEXT ÚNICO)

1. **Al abrir otro chat:** leer este Handoff íntegro; contrastar solo si apareció un ZIP/commit **posterior** al SHA `c51440ab...` o si hay trabajo concurrente. No recorrer de nuevo 20 pasadas, auditorías B13–B21 ni el IPAM ya resuelto. Si el nuevo chat ve GitHub, revisar checkpoint ya actualizado por este Recovery y no tomar el antiguo prompt IPAM como vigente.
2. **ChatGPT Director, inmediatamente:** adjudicar el ZIP `JOR-B21-IPAM-RECOVERY-20261115-UNICO.zip` como **PASS_SCOPED para IPAM/migraciones/concurrencia, pero `PARTIAL/NO_GO` global**, con prioridad de seguridad **B17_HTTP_200_UNEXPECTED**. Con el ZIP solo no es posible reparar el código o decidir que el 200 sea correcto; falta traza cruda y árbol local actual.
3. **Próximo lote local SOLO si el usuario lo solicita o se autoriza expresamente como ejecución:** un macrobloque focal que, en **D** y con la MariaDB propia ya creada (contenedor detenido), verifique estado/propiedad sin reiniciar Docker ni tocar ajenos; reproduzca **exactamente** test B17 del 200 junto con el harness 404, muestre test name/response/auth context en logs sanitizados, pruebe escenarios `owner vs other user same-company` y **empresa A→B**. Determinar en qué capa pierde el scope (autenticación, policy, query, cache, fixture, estado estático/transaction/test isolation) con evidencia, sin adivinar. Corregir **solo causa raíz** si hay defecto reproducido y permitido; tratar `Cache-Control` mediante contrato semántico, sin relajar seguridad. Completar negativos PAT activo/revocado/expirado contra DB real, repetir solo las 3 pruebas fallidas y regresiones directas, y entregar **un solo ZIP** con logs/patch/baselines/hash/estado Docker+WIP. Si el fallo contradice un contrato no aprobado, dejar `BLOCKED_CONTRACT`, no crear permisos.
4. **Prohibición específica:** NO crear nuevo lote IPAM, no destruir la red propia, no repetir 11 migraciones ni B19/B20 salvo cambio causal, no abrir B22; no llamar el suite 156/156 PASS por dos pruebas de header arregladas mientras siga el 200.
5. **Tras resolver P0/P1:** ChatGPT decidirá cierre A→B y PAT, consolidar B21 H9 real (Android, web, accesibilidad, seguridad, performance, UX humana y L5 independiente), solicitar OD02/OD03/OD04 (y restantes OD) al propietario en bloque cuando proceda, y B22 **solo con GO escrito**. Ninguna decisión legal o comercial se infiere del QA.

**NEXT:** `CHATGPT_DIRECTOR_REVISAR_RIESGO_B17_200_Y_DEFINIR_UN_SOLO_LOTE_FOCAL_POST_RECOVERY`. **ENCARGADO_NEXT: CHATGPT**. **CODEX_ACTIVE_NOW: NO_VERIFICADO**. **NUEVO_PROMPT_CODEX: NO_GENERADO_POR_ESTE_RECOVERY**.

## H. ADJUNTOS, GITHUB Y DIEZ CONTROLES RECOVERY V6

- **Archivo de relevo:** `JORNATO_RECOVERY_HANDOFF_2026-11-15_B21_IPAM_DB_REAL_3_FALLOS.md` (único Markdown descargable generado por esta recuperación).
- **ZIP de continuidad adicional:** `NO_NECESARIO`: el ZIP primario B21 IPAM ya está adjunto, íntegro, y los Markdown fuente existen. No crear segundo ZIP que duplique evidencias ni incorporar DB, secretos o WIP.
- **GitHub:** rama documental PR #2; `main` sin WIP; la continuidad documental puede quedar sincronizada mediante acción GitHub **solo documental** si el permiso histórico del propietario sigue vigente. Una escritura debe verificarse después de realizarla y nunca presentarse como edición del checkout D.
- **Fuentes inaccesibles:** Windows D: en vivo, logs crudos completos de PHPUnit, base MariaDB actualmente detenida, test/fuente local actual, credenciales y estado posterior de Codex; no deducirlos de GitHub.

| Control V6 | Resultado de esta recuperación |
|---|---|
| **P01** Identidad/alcance | PASS: Jornato, B21 IPAM y objetivo de handoff definidos. |
| **P02** Historial/gap | PASS documental: seed 06-nov y ZIP 15-nov conciliados; eventos posteriores en PC no verificables. |
| **P03** Verdad/recencia | PASS: latest ZIP vs checkpoint remoto obsoleto; directo/reportado/conflicto separados. |
| **P04** Git/WIP | PASS con límite: main/PR remotos leídos; WIP privado solo reportado. |
| **P05** KISS/antirruido | PASS: un handoff, sin ZIP auxiliar ni prompt duplicado. |
| **P06** Causa raíz/antiparches | PASS: IPAM resuelto; B17 200/404 sin causa afirmada. |
| **P07** Diseño/UX | PASS documental: meta de lanzamiento integral y QA UX/Android pendientes; no rediseño. |
| **P08** Evidencia/permisos | PASS con límite: ZIP/manifest comprobados; runtime solo según logs, sin secrets. |
| **P09** L6 trabajo en vuelo | PARTIAL: no se puede comprobar si Codex ejecuta otra tarea local posterior; no delegar dos. |
| **P10** Simulación de relevo | PASS documental: este archivo permite conocer trabajo, riesgo B17, no repetir, criterios y responsable; no equivale a QA de aplicación. |

```text
MODO=REANUDAR+ACTUALIZAR_POR_DELTA
RECUPERACION=SUFICIENTE_DOCUMENTAL
BASE_VERIFICADA=RECOVERY_V6+2_MD_B21_IPAM+ZIP_C51440AB...+GITHUB_CANON_PR2+PINGPONGLAW_CANON
DELTA=IPAM_RESUELTO; MARIADB_QA_REAL; 11_MIGRACIONES; CONCURRENCIA_B17_B19_B20_SCOPED; SUITE_153_156_FAIL_3
REALIZADO=ZIP_AUDITADO_INTEGRIDAD+EVIDENCIA_RECONCILIADA+HANDOFF_CREADO
PRUEBAS_NUEVAS_DEL_PRODUCTO=NOT_RUN_POR_CHATGPT
B17_ACCESS_CONTROL=FAIL_REPORTADO_UNRESOLVED_200_VS_404
B21_GLOBAL=NOT_APPROVED; RELEASE_APPROVED=NO; B22=NOT_AUTHORIZED
NEXT=CHATGPT_DIRECTOR_ADJUDICAR_B17_FALLO_200_Y_PREPARAR_CIERRE_FOCAL
ENCARGADO_NEXT=CHATGPT
```