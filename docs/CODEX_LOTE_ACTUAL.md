# CODEX LUNA — JORNATO · MACROBLOQUE ÚNICO H9-M1, V2 AUDITADA (10 VERDUGO + 10 JUEZ)

**ORDEN ÚNICA ACTIVA Y AUDITADA — 19 de noviembre de 2026. Sustituye la versión previa del mismo H9-M1; no abrir una tarea paralela ni repetir auditorías.** El propietario confirmó que **ya tiene Codex**. Ejecuta ahora este trabajo **de principio a fin en una sola intervención**, sin pedirle al propietario que haga pruebas, instale herramientas, elija entre alternativas técnicas o repita instrucciones. **Codex ejecuta, ChatGPT dirige y certifica el alcance después de recibir evidencias.**

`TASK=JOR-H9-M1-REACTIVADO-ANDROID-OFFLINE-PRO-BOOT-20261119`  
`OWNER_ACTUAL=CODEX_LUNA`  
`OWNER_DESPUES=CHATGPT_DIRECTOR`  
`WIP_ORIGEN=D:\codex\Jornato`  
`EVIDENCIAS=D:\codex\_REPORTES\Jornato\JOR-H9-M1-REACTIVADO-20261119`  
`GITHUB_ACTIONS=NO_DISPONIBLES`  
`RELEASE=NO_GO`  
`QA_OWNER=CODEX_LUNA`  
`GITHUB_REFS=READ_ONLY; SIN MERGE/PUSH/CI`

## 1. Contexto congelado: no rehacer trabajo ni seguir un F0 paralelo

**Fuentes de verdad, en orden:** código y contratos aprobados que existan hoy en el WIP avanzado local; `AGENTS.md` local y contrato de producto; fuente canónica PingPongLaw L1–L6 cuando esté accesible; resultados QA verificables por SHA; documentación de los PR remotos como referencia, **no** como sustituto del WIP.

- Repositorio: `sierraglobalcompany-rgb/Jornato`. En la última comprobación de ChatGPT: `main=1ee6aae821f8cf177cc64149081ad8847f7fec2e` (sin WIP avanzado); PR #1 Draft `faf5fe283191f8b5a2724b397009512a2caec1b6`; PR #2 Draft/documental **orden vigente en `docs/CODEX_LOTE_ACTUAL.md` (HEAD variable al publicar esta revisión)**; PR #3 Draft **apilado sobre PR #1** `104469b119752f395cf9881e732d582feab9db4e`. **Verifica el HEAD real antes de usar referencias; no presupongas que siguen iguales.**
- PR #3 contiene un prototipo Flutter F0 temporal en memoria, motor Dart, turnos, JSON de intercambio sin cifrar, informe CSV, evaluación GPS geométrica y pantalla con recálculo cada 30 segundos cuando hay jornada activa, pausa o marca futura; cancela en segundo plano/fin y recalcula al reanudar. **NO** es Android avanzado ni SQLCipher/Keystore productivo. **119 tests Flutter escritos, NOT_RUN**, más **31 checks Dart escritos, NOT_RUN** en esa rama.
- PR #2 contiene el puente de comparación WIP por huellas; en su alcance sintético tuvo **15/15 pruebas Python PASS**, pero **no se ejecutó sobre el WIP real**. El puente solo compara cinco nombres de módulos Dart con base antigua; si el PR #3 ha avanzado, sus blobs aún corresponden a la referencia registrada. **No confundir igualdad de bytes con igualdad funcional.**
- Backend histórico B21F-S3: **158 tests/2.450 assertions PASS_SCOPED**, con runner QA aislado que aportaba configuración de vistas. **No certificó bootstrap NORMAL ni producción.** No repetir esa suite ni abrir otra auditoría B13–B21 salvo que un cambio nuevo lo justifique. Mantener esquemas/containers de otras tareas intactos. Docker/IPAM tuvo bloqueos históricos; evitar imágenes/redes/reintentos exploratorios.
- WIP histórico en Windows: cientos de entradas modificadas/no rastreadas y sin stage según reportes pasados; **ese conteo y SHA ya son históricos**, nunca exigir que coincidan hoy. Puede contener funciones avanzadas ya terminadas: **reutilízalas**.
- Decisiones humanas **OD01–OD08 siguen NO APROBADAS** salvo evidencia de aprobación posterior en el WIP. No inventar consentimiento/retención, asociación empleado-cuenta, permisos RR. HH., acceso web, ATS/CV, firma, homologación salarial ni planes/cobros.
- Las **L1–L6** son KISS/Ponytail, antirruido, causa raíz, diseño humano, evidencia atribuible y anti-ping-pong. Fuente fija: `sierraglobalcompany-rgb/PingPongLaw@84e961cadf482d234f4c0ee2ca60e8c7e9b388e8`, `docs/engineering/LEYES_IMPLEMENTACION_1_A_6.md`. **Léela UNA VEZ por su commit fijo**, no por `main`, sin instalar skills/hook alguno ni repetir una auditoría de las leyes; el Director ya verificó la existencia del documento en GitHub. Si Codex no accede: `CANON_READ=BLOCKED`, aplicar instrucciones locales existentes sin fingir lectura; seguir tareas técnicas seguras.

## 2. Reglas duras de ejecución

1. Trabajar **solo dentro de `D:\codex\Jornato`** y usar la carpeta externa indicada para informes. **No tocar otros proyectos**. Si la ruta no existe, identificar ubicación real sin crear otra aplicación; si no se identifica, cerrar `BLOCKED_WIP_NOT_FOUND` con evidencia útil.
2. **WIP preexistente protegido; solo editar archivos de producto seleccionados después del preflight y sin pisar cambios ajenos.** No ejecutar `git reset`, `clean`, `stash`, `checkout`, `switch`, `pull`, `merge`, `rebase`, `cherry-pick`, `add`, `commit`, `push` ni usar `force`. No pisar untracked, staged, cambios ajenos o worktrees. No sobrescribir historias con copias GitHub. Capturar `git status --porcelain=v1 -uall`, HEAD, rama e índice **antes y después**. Si otro agente toca el mismo archivo, no competir: continuar en otras piezas seguras. **Una ruta con cambios previos NO se puede tratar como archivo limpio**: registrar hash/estado PRE, conservar bytes ajenos y producir delta propio separado. En caso de conflicto de líneas o propietario desconocido, `BLOCKED_WIP_CONFLICT` para esa ruta (no sobrescribirla). No hacer backup masivo ni editar fuera de las rutas autorizadas.
3. **No Actions, servicios de pago, nuevos repositorios, hooks, skills, upgrades de SDK por rutina, alteraciones del sistema, datos reales ni secretos en logs**. No desplegar, publicar APK, firmar release ni convertir pruebas host en PASS físico.
4. Arquitectura **KISS/Ponytail**: una sola lógica de marcación, un almacenamiento aprobado, una outbox/sync existente, un contrato de tenant/actor. No crear backend paralelo, nueva tabla/canal/manager/provider sin necesidad demostrada. No añadir nuevos permisos, GPS real obligatorio, selfie, biometría ni facturación para saltar las OD.
5. Los problemas ya probados se dejan cerrados; **solo tests pertinentes al delta real**. No producir diez nuevas auditorías, veinte prompts, otra reescritura de contrato o planes sucesivos. Después de implementar y corregir, una ronda focal de QA y un único ZIP final. **Las veinte pasadas del Director revisaron ESTA orden, no piden a Codex 20 revisiones del código.**
6. Donde falte SDK, dispositivo, DB QA segura o decisión humana, marcar `NOT_RUN` o `BLOCKED_CONTRACT` **en ese tramo**; avanzar lo independiente. Nunca degradar seguridad ni inventar PASS.

## 3. Ejecución ordenada — actuar, no enviar plan para aprobación

### P0 — Custodia + correspondencia REAL (breve y suficiente)

- Identifica los módulos Flutter/Android y Laravel existentes, el motor de eventos, servicio de almacenamiento local, SQLCipher/Keystore, migraciones ya aplicadas, outbox/receipt y endpoints de sincronización, además de los tests focales. Verifica rutas y contratos por código, no por nombre supuesto. Lee los README/AGENTS/ADR del **WIP actual**. No catalogar los cientos de archivos uno por uno.
- Guardar en carpeta de informes la instantánea **sin secretos** de `HEAD`, rama, `git status` y lista staged; registrar hashes PRE únicamente de archivos candidatos al cambio. **Sin crear backups de todo el repo ni copiar bases.** **Para cada archivo tocado:** PRE path/estado/tracked-vs-untracked/SHA256, POST SHA256, diferencias atribuibles a este lote; un patch de `git diff HEAD` NO prueba autoría si el archivo ya estaba sucio. Si no se puede separar el delta propio, NO incluir un parche ambiguo ni sobrescribir contenido; anotar `PATCH_BLOCKED_PREEXISTING_WIP` y proporcionar instrucciones de aplicación no destructiva.
- Contrastar las capacidades reales del WIP con los cinco módulos F0 de PR #3 solo cuando haya posibilidad de duplicación; revisar diferencias **semánticas**, no importarlas de manera masiva. Si ya existe una función mejor integrada, **no editarla por parecer distinta**. El puente Python del PR #2 es opcional y solo para acotar dudas de coincidencia; no condición de bloqueo, no reauditar sus 15 tests.
- Determinar en **una tabla compacta de máximo 7 renglones**, con rutas reales, prueba/contrato existente y decisión `EXISTE/YA_VALIDADO`, `FALTA/DEFECTO_DEMOSTRADO`, `BLOQUEADO_CONTRATO`. **Regla ejecutable:** si existe y tiene evidencia atribuible, NO reescribir; si existe pero falla, corregir causa raíz; si falta dentro de contrato aprobado, implementar SOLO la pieza mínima; si exige OD/credencial/persona/producción, marcar bloqueo concreto y avanzar lo independiente. No regresar al Director entre pasos.

### P1 — Arranque NORMAL de Laravel, foco quirúrgico (comprobación corta, no nuevo lote backend)

- Verificar **una sola vez** el arranque/configuración normal del servidor y un render/flujo de vistas que el producto realmente use, **sin overlay de QA B21F-S3**. Usar entorno sintético local, sin credenciales ni producción, y sin migraciones destructivas. No iniciar Docker ni MariaDB solo para comprobar vistas. **Si bootstrap normal requiere DB/secretos no disponibles, registrar `BOOT_NORMAL=BLOCKED` con el punto exacto, no conectar DB ajena.**
- Si falla por configuración de vistas, corregir la causa en la configuración Laravel existente y ejecutar el smoke focal. **No crear `config/view.php` por reflejo** si no lo necesita el producto. Si no hay ruta de vistas aplicable, registrar `NOT_APPLICABLE`, no inventar UI ni PASS.
- Reutilizar el PASS_SCOPED anterior de 158/2450: **no repetir toda la suite backend**. Si corriges auth/tenant/arranque, solo las pruebas directamente afectadas y una regresión contigua.

### P2 — Vertical Android OFFLINE duradera, primero el producto (PRIORIDAD DE CÓDIGO)

**Orden dentro de P2 (no crear otro plan):** confirmar si ya existe persistencia cifrada integrada → cerrar secuencia y guardado duradero → validar reinicio/aislamiento → arreglar solo la UI del flujo afectado. Si SQLCipher requiere autorización/SDK faltante, continuar lógica y pruebas host independientes, pero la vertical queda `PARTIAL`/`BLOCKED`, NUNCA `PASS_REAL_DEVICE`.

- Con código real del WIP y usuario ficticio: **entrada → inicio pausa → continuación → salida**. Estado/hora/intervalos correctos, sin pausa prevista ficticia; guardado duradero **antes de confirmar en UI**; cierre, reinicio de proceso/app y lectura idéntica del historial. Jornada nocturna local correctamente atribuida según contrato aprobado. Doble tap y reintento no crean otro evento. **Oráculo mínimo:** mismo `eventId`/payload repetido = un registro; mismo ID con payload distinto = conflicto explícito; nunca confirmar UI antes de persistir atómicamente el evento correspondiente. Un evento con hora futura o reloj retrasado **no se normaliza ni reescribe silenciosamente**.
- Usar el cifrado/aislamiento **ya existentes** (SQLCipher y Keystore cuando apliquen). Verificar por separado escritura, lectura, crash/reinicio, migraciones existentes, corrupción simulada y aislamiento espacio-sujeto. Si falta implementación y las decisiones técnicas ya están aprobadas, completar el menor tramo integrado posible con dependencias gratuitas/permitidas. Si depende de consentimiento, claves o SDK inaccesible, **NO** sustituirlo por JSON o SQLite en claro; dejar `SQLCIPHER=NOT_VERIFIED/BLOCKED` y continuar lo seguro. **Una prueba host con almacenamiento simulado jamás justifica `SQLCIPHER=PASS_VERIFIED`; se exige evidencia del adaptador nativo, almacén real y recuperación, sin incluir claves.**
- UI mínima coherente: estado vigente, horas reales, pausa, offline/pendiente/sincronizado, error recuperable. Comprobar accesibilidad del flujo afectado. El temporizador de PR #3 es **referencia**: solo integrarlo si mejora una UI que no lo tiene; no sobreescribir una pantalla avanzada ni crear otra. Kiosco: eliminar identidad temporal tras comprobante antes del siguiente usuario **si ya corresponde al flujo aprobado**, sin crear nueva autorización OD.

### P3 — Sincronización Pro existente, sin romper Gratis local

**Condición de entrada:** solo iniciar P3 después de identificar motor de marcas y outbox reales, y sin inventar asociación empleado/cuenta. Si P2 no ha persistido correctamente, limitar P3 a inspección de contrato y serialización ya existente: no aprobar envío de eventos que se perderían al reiniciar.

- Revisar de verdad los tipos/campos HTTP y Laravel para `requestId` (ojo con error histórico `requetId`), idempotencia, receipt/ACK, cursor, tenant/actor. **No aceptar fallbacks silenciosos** ni inventar endpoints, tokens, acceso web o asociación empleado-cuenta sin aprobación. **Revisar el `requestId` persistido y enviado en bytes/JSON sanitizados: rechazar explícitamente `requetId` sin reescribir los resultados históricos B14.**
- Probar una secuencia ficticia: eventos creados sin red → outbox duradera → reconexión permitida → envío al backend QA **solo si el entorno aislado es seguro** → ACK/receipt → readback autorizado → reenvío idéntico sin duplicados; **ACK perdido + reenvío** no deben duplicar evento/receipt; errores 401/403/404 y otro tenant no deben filtrar datos. **Si no existe credencial sintética autorizada, probar solo serialización/outbox local y marcar `BLOCKED_CONTRACT` para HTTP; no crear usuarios ni tokens nuevos.** Si no es posible el servidor QA seguro, verificar el contrato/transporte local y declarar `PASS_LOCAL_ONLY` o `BLOCKED_CONTRACT`, nunca `PASS_REAL_HTTP_DB_QA`.
- El modo **Gratis local** no debe depender de login/nube ni bloquearse por Pro. Si una etapa depende de OD01/OD02/OD04/OD08, completar las partes sin decisión pendiente y especificar exactamente el punto bloqueado; no inventar permisos.

### P4 — QA proporcional que ejecuta CODEX (el propietario NO hace pruebas)

- **Todas las pruebas son responsabilidad de Codex.** Codex ejecuta lo disponible **en el equipo local**, nunca solicita al propietario comandos, instalación manual o pruebas de teléfono. Comprobar SDK Flutter/Dart, Android/ADB y backend solo para conocer disponibilidad; no instalar herramientas o manipular dispositivos ajenos automáticamente.
- Ejecutar **una vez después del delta**: análisis del alcance cambiado, unit/widget sobre jornada, cifrado/rehidratación y outbox; smoke focal de arranque normal; integrar en emulador o teléfono **solo si ya disponible y autorizado**. Si hubo cambios efectivos en el motor/pruebas F0, se puede ejecutar la suite Flutter correspondiente en **clon separado de PR #3**, no sobre WIP; sus **119 tests fuente y 31 checks** siguen `NOT_RUN` hasta ejecución real. No distraerse revalidando esos 119 si el WIP avanzado usa otro árbol y el delta no los afecta.
- Si hay Android SDK funcional, APK **debug local** y hash del artefacto, sin firmar, instalar para personas reales ni publicar. **No instalar ni controlar un dispositivo ajeno; si no hay emulador/teléfono ya autorizado, separar `PASS_HOST_ONLY` de `PASS_EMULATOR`/`PASS_REAL_DEVICE`.** Verificar solamente el flujo objeto del lote; señalar plataforma, dispositivo, build y SHA específicos. No afirmar `PASS_REAL_DEVICE` por pruebas host o emulador.
- Al encontrar un fallo, reproducir, corregir **causa raíz** en código propietario y volver a ejecutar el test afectado y vecinos pertinentes **una sola vez**. No usar `skip/xfail`, mocks para falsificar cifrado/red real ni cambiar expected para esconder error.
- Matriz final corta: flujo/offline/reinicio, idempotencia, cifrado, aislamiento, sync, UI y lifecycle, backend normal. Cada fila: `PASS_REAL_DEVICE`, `PASS_EMULATOR`, `PASS_HOST`, `PASS_HTTP_DB_QA`, `PARTIAL`, `NOT_RUN`, `BLOCKED`, o `FAIL` con evidencia; no certificar H9 global por este lote.

## 4. Entrega única obligatoria — sin ping-pong

Crear **un solo ZIP** en `D:\codex\_REPORTES\Jornato\JOR-H9-M1-REACTIVADO-20261119\delivery\JOR-H9-M1-REACTIVADO-20261119-UNICO.zip` con:

1. `FINAL_REPORT.md` (máximo 2 páginas, componentes **realmente** completados/pendientes, raíz de defectos, justificación de nuevas dependencias si las hubo, estado REAL/DEMO/BLOCKED).
2. `RESULTS.csv` (gate, alcance, tipo de prueba, comando, exit, SHA y referencia a log, distinguiendo `PASS_SCOPED` de `NOT_RUN`).
3. `CHANGES.patch` o archivos completos **solo de los archivos que Codex cambió**; incluir rutas untracked propias necesarias, instrucciones de aplicación **no destructiva** y hashes PRE/POST, sin arrastrar el WIP ajeno. **Si un archivo ya estaba modificado, separar delta preexistente de delta nuevo; no entregar `git diff HEAD` entero como si fuera de este lote.**
4. `WIP_PRE_POST.csv` de estado Git/índice/hash de archivos tocados; `BLOCKERS.md` solo si hay bloqueos materiales.
5. Logs de QA focal y metadatos de APK debug (si realmente se generó); `MANIFEST_SHA256.csv` para cada miembro, con bytes y SHA256. Comprobar integridad CRC y manifiesto, calcular SHA256 del ZIP e informarlo.

**NUNCA incluir:** `.env`, passwords, tokens, Keystore/SQLCipher keys, bases, credenciales, fotos/biometría, nómina/CV/PII de empleados, dumps, datos de otras empresas, artefactos de otros proyectos. No adjuntar el WIP completo. Si no hay código cambiado porque todo existe, entregar evidencia real del bloqueo/foco, no fingir una implementación. **Antes de empaquetar, revisar por nombre y contenido los cambios, logs y nombres de archivo contra secretos/PII; si no es seguro, omitir la pieza sensible y explicar el bloqueo.** El manifiesto debe enumerar cada miembro distinto del propio manifiesto (sin autorreferencia) y el SHA256 del ZIP se informa FUERA de él.

**No staged, no commit, no push, no merge, no deploy**. No editar el checkpoint remoto ni generar segundo prompt. Si hay impedimento material, entregar el ZIP con lo avanzado independiente y una sola causa bloqueante priorizada. El siguiente turno es ChatGPT Director; no delegar automáticamente otro lote.

### Respuesta final obligatoria de Codex

~~~text
TASK=JOR-H9-M1-REACTIVADO-ANDROID-OFFLINE-PRO-BOOT-20261119
RESULT=PASS_SCOPED|PARTIAL|BLOCKED
SOURCE_WIP_HEAD_PRE=<HEAD real previo>
SOURCE_WIP_HEAD_POST=<HEAD real posterior>
SOURCE_WIP_BRANCH=<rama local real>
WIP_PRESERVED=YES|NO
PREEXISTING_STAGED_UNCHANGED=YES|NO
FILES_CHANGED=<cantidad y rutas exactas, o NONE>
BOOT_NORMAL=PASS|FAIL|NOT_APPLICABLE|BLOCKED
ANDROID_OFFLINE=PASS_REAL_DEVICE|PASS_EMULATOR|PASS_HOST_ONLY|PARTIAL|BLOCKED
SQLCIPHER=PASS_VERIFIED|PARTIAL|NOT_VERIFIED|BLOCKED
PRO_SYNC=PASS_HTTP_DB_QA|PASS_LOCAL_ONLY|BLOCKED_CONTRACT|NOT_RUN
PR3_FLUTTER_119=PASS|FAIL|NOT_RUN
PR3_SMOKE_31=PASS|FAIL|NOT_RUN
BACKEND_B21F_S3_158_REUSED=YES|NO
H9_GLOBAL=NO_GO
B22=NOT_AUTHORIZED
RELEASE=NO_GO
ZIP_PATH=<ruta absoluta comprobada del único ZIP>
ZIP_SHA256=<SHA-256 real comprobado>
NEXT_OWNER=CHATGPT_DIRECTOR
~~~

**Interpretación del resultado:** `WIP_PRESERVED=YES` significa que todo WIP ajeno se conservó, incluso si Codex cambió sus rutas autorizadas. `BACKEND_B21F_S3_158_REUSED=YES` significa reutilizar evidencia previa `PASS_SCOPED`, nunca certificarla como ejecución actual.

**Criterio de cierre:** trabajo real sobre el WIP actual, trazabilidad de cambios y QA que Codex mismo ejecuta; **no declarar PASS con `exit != 0` ni evidencia de otro SHA; en APK/dispositivo exigir hash de artefacto, y en pruebas host/backend hash del código realmente probado**; no auditar de nuevo lo resuelto ni delegar pruebas al propietario. El macrobloque termina con entrega verificable aunque algunos gates queden `BLOCKED`.

# 🚨 QUIÉN SIGUE AHORA: CODEX LUNA. DESPUÉS DEL ZIP: CHATGPT DIRECTOR. 🚨
