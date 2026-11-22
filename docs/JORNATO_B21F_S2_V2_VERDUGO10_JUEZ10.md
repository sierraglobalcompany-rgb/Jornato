# JORNATO — DICTAMEN DIRECTIVO SOBRE B21F-S2 · 10 VERDUGO + 10 JUEZ

**Fecha de corte:** 2026-11-15, America/Bogotá (turno nocturno 15→16). **Objeto exacto:** `CODEX_LUNA_JORNATO_B21F_S2_CIERRE_GUARD_HEADERS_DB_QA_AISLADA_20261115.md`, 16.312 bytes, SHA-256 `aacfeec3dae743a3c8245bebb14a3e4ee7db18190fa7180609c92e2215dbaf3e`. **Resultado:** `CORREGIR_Y_UNIFICAR`, manteniendo `TASK_ID=JOR-B21F-S2-CIERRE-20261115`; única versión para enviar = `CODEX_LUNA_JORNATO_B21F_S2_V2_MACROBLOQUE_CIERRE_FOCAL_20261115.md`. No es V4 de B21F ni una fase nueva.

## 0. Alcance real, fuentes y límite de independencia

**Trabajo ya hecho y que NO repetí:** auditorías 10+10 del antiguo B21F V2/V3; revisión de integridad del ZIP B21F; IPAM, 11 migraciones y concurrencias B17/B19/B20 del histórico B21. Esta revisión se restringió a **nuevas decisiones introducidas por S2**: posible guard cacheado, modificación previa a runtime, base temporal, `RefreshDatabase`, precedencia `phpunit.xml`, actividad Docker concurrente, aislamientos A/B y PAT, regresión y protección de WIP. No ejecuté Docker, PHP, PHPUnit, Git sobre Windows, ni toqué WIP; no se verificó código de `D:\codex\Jornato` directamente.

**Fuentes inspeccionadas:**

- Texto integral de S2 original, 65 líneas/16.312 bytes, SHA arriba; recuperación principal y complemento entregados.
- ZIP físico previo `JOR-B21F-SECURITY-20261115-UNICO.zip`, SHA-256 **`EABF0AFB32385BA111D96E6A161721EDBCF665C026A3AC76111B4E663EC97F56`**; sus `FINAL_REPORT.md`, `SECURITY_CONTEXT.md`, `LOGS/static-causal-analysis.txt`, `LOGS/guard-and-db-safety.txt`, `LOGS/db-safety-blocker.txt`, `LOGS/historical-b21-failures.txt`, `LOGS/process-concurrency.txt` y `LOGS/commands-and-results.txt` se leyeron una vez. Sus logs son **reporte del ejecutor**, no pruebas reejecutadas por el director.
- GitHub vía conector directo: repo [`sierraglobalcompany-rgb/Jornato`](https://github.com/sierraglobalcompany-rgb/Jornato); `main=1ee6aae821f8cf177cc64149081ad8847f7fec2e`; PR #2 OPEN/DRAFT HEAD observado inicialmente `adaeb4161d682165b810a26ed48c1f5a78bc305f`; `docs/CODEX_LOTE_ACTUAL.md` blob `e25efd350b5262bb154e8d91abfbedf814cf5899` era S2 original; `docs/JORNATO_CONTINUIDAD.md` blob `b49c8cfde3ba72186aaf00275c8fa5f19a1c135c` contenía S2 preparada y B21F PARTIAL. GitHub documental **NO contiene el WIP funcional de D:**.
- Canon [`PingPongLaw @84e961c`](https://github.com/sierraglobalcompany-rgb/PingPongLaw/blob/84e961cadf482d234f4c0ee2ca60e8c7e9b388e8/docs/engineering/LEYES_IMPLEMENTACION_1_A_6.md): L1 KISS/Ponytail; L2 antirruido; L3 causa raíz; L4 UX humana; L5 evidencia independiente; L6 antiping-pong.
- Fuente oficial, solo por verificación puntual, [`RequestGuard.php` Laravel v13.40.0](https://github.com/laravel/framework/blob/v13.40.0/src/Illuminate/Auth/RequestGuard.php): `user()` devuelve `$this->user` almacenado y `setRequest()` cambia la petición sin invalidarlo; [`MakesHttpRequests.php`](https://github.com/laravel/framework/blob/v13.40.0/src/Illuminate/Foundation/Testing/Concerns/MakesHttpRequests.php) `withToken()` añade encabezado Authorization; [`RefreshDatabase.php`](https://github.com/laravel/framework/blob/v13.40.0/src/Illuminate/Foundation/Testing/RefreshDatabase.php) llama `migrate:fresh` al primer refresh. **Esto fundamenta riesgos, NO demuestra por sí solo el root cause del caso Jornato.**

**Tipo de revisión:** auditoría adversarial documental conducida por ChatGPT **separadamente de Codex, pero no una certificación independiente runtime ni una segunda organización evaluadora**. Veinte pasadas aquí significan veinte pruebas de decisión argumentadas, **NO veinte ejecuciones de producto**.

## 1. VERDUGO — 10 ataques a decisiones NUEVAS de S2

### V01 — ¿S2 vuelve a ejecutar un trabajo cerrado?
**Qué hice:** comparé S2 con el estado `B21F V3=PARTIAL`, su ZIP y el slot del PR #2. Confirmé que B21F no tocó fuentes ni ejecutó PHPUnit, y que el bloqueo cambió a seguridad del runner/guard. **Ataque:** S2 podía reescribir la historia llamando otra vez «diagnóstico B21», creando un bucle. **Reparación:** conservar mismo TASK_ID, fijar esta V2 como revisión puntual de S2 y eliminar instrucciones de repetir IPAM, migraciones y carreras. **Ley puesta a prueba:** L2/L6. **Conclusión:** S2 sí aporta trabajo nuevo, no reabrir B21F V3.

### V02 — ¿El parche estático se puede confundir con seguridad aprobada?
**Qué hice:** revisé E0 y cierre de S2 original: permitía añadir `Auth::forgetGuards()` basado en la hipótesis y entregar un ZIP tras `php -l` cuando Docker estuviera ocupado. **Ataque:** `php -l` valida sintaxis, no autoriza solicitudes entre usuarios. **Reparación:** congelar expectativa original 404 y positivo 200 legítimo, etiquetar todo cambio de test `CANDIDATO_ESTÁTICO`, prohibir `ROOT_CONFIRMED`/`PASS` sin HTTP real y permitir salida honesta sin parche si no se prueba la causa. **Ley:** L3/L5.

### V03 — ¿El 200/404 tiene una sola explicación?
**Qué hice:** cotejé los nombres históricos y análisis del ZIP con `RequestGuard` upstream; comprobé que el caché del usuario **es plausible**, y que una petición nueva con token no implica automáticamente guard nuevo. **Ataque:** culpar solo a PHPUnit podría ocultar un verdadero fallo de policy o tenant scope. **Reparación:** diseñar experimento con lector legítimo, ajeno mismo tenant y ajeno otro tenant, guard limpio y proceso independiente; cambiar producto únicamente tras atribuir causalidad. **Ley:** L3/L5.

### V04 — ¿Limpiar guards globalmente sería el arreglo más corto?
**Qué hice:** enfrenté el uso de `Auth::forgetGuards()` en B13 con el cambio worker→owner B17. **Ataque:** poner esa limpieza en middleware/controlador o login productivo sería un parche de seguridad peligroso, y usar `Auth::logout` podría romper otros contratos. **Reparación:** ubicarla **solo en la transición de actor de prueba** si el código local confirma el patrón; mantener filtro productivo original y regresiones para evitar que un test artificial esconda exposición real. **Ley:** L1/L3.

### V05 — ¿Los headers son simplemente una cuestión de orden?
**Qué hice:** inspeccioné los dos fallos reportados `private, no-store, max-age=0` frente a `max-age=0, no-store, private`. **Ataque:** cambiar la aserción a «contiene private» podría admitir `public`, pérdida de `no-store`, duplicados incompatibles o una alteración del servidor. **Reparación:** comparar directivas sin depender del orden, pero exigir las tres, prohibir `public` y contradicciones; helper privado mínimo solo si no existe. **Ley:** L1/L3/L5.

### V06 — ¿El esquema nuevo basta para afirmar que la suite es segura?
**Qué hice:** confronté la regla de esquema desechable con `RefreshDatabase` oficial y con el hecho de que PHPUnit podría usar sesiones, colas, archivos o conexiones adicionales. **Ataque:** `migrate:fresh` sobre DB temporal puede ser seguro mientras otro test borra otra DB o escribe fuera de ella. **Reparación:** preflight sobre bootstraps, conexiones secundarias, efectos externos, privilegios efectivos y config del mismo proceso antes de cualquier test; bloqueo proporcional si no hay aislamiento. **Ley:** L1/L5.

### V07 — ¿La «config efímera externa» es una puerta trasera del fail-closed?
**Qué hice:** evalué el `DB_PORT=1` reportado en `server/phpunit.xml` y la propuesta de sobrescribir configuración. **Ataque:** un override CLI puede no prevalecer sobre `<env force="true">`, caché Laravel o bootstrap; una conexión iría al esquema incorrecto. **Reparación:** no editar `phpunit.xml`; emplear el mecanismo ya comprobado o archivo externo aislado, y **probar configuración efectiva dentro del mismo bootstrap PHPUnit** más grants SQL confinados; si falla, no ejecutar. **Ley:** L3/L5.

### V08 — ¿Cualquier proceso Docker ajeno debe paralizar al equipo?
**Qué hice:** leí el log de actividad concurrente que solo identificaba dos PIDs y no el recurso concreto. **Ataque:** declarar bloqueo global por detectar `docker.exe` —sin evidencia de colisión— repite B21F `PARTIAL` indefinidamente; lo contrario, arrancar sin comprobar propiedad, sería imprudente. **Reparación:** aislar el contenedor **propio**, labels/puerto/bind e interferencias sobre ese recurso; un proceso ajeno no bloquea edición ni lint, pero si no se puede asegurar exclusividad del contenedor se detiene solo E1/E2. **Ley:** L1/L6.

### V09 — ¿Tenancy y PAT pueden probarse inventando permisos?
**Qué hice:** contrasté S2 con `SECURITY_CONTEXT.md`: ruta B17 actual `/api/v1/companies/{company}/me/requests/{public_id}`, middleware Sanctum, `api:read`, QA gate y creador como dueño. **Ataque:** simular un owner revisor o crear endpoints para PAT haría pasar tests que no corresponden a contratos OD03. **Reparación:** usar rutas/factories auténticas, probar A→B/B→A, activo/revocado/expirado sin habilitar HR; donde el contrato falte marcar `BLOCKED_CONTRACT`. **Ley:** L1/L4/L5.

### V10 — ¿Una suite completa y un ZIP pueden ser otro ritual?
**Qué hice:** revisé E2/E3 y la matriz PASS en S2: faltaba vetar la suite completa aun si pasaban focales cuando otras rutas tenían efectos laterales. **Ataque:** `156/156` o ZIP íntegro no certifica H9 ni seguridad de producción; repetir todas las pruebas cada vez sería ping-pong. **Reparación:** suite completa **una sola vez** solo si todo su runner es seguro; si no, focales + `BLOCKED_SAFETY`; un ZIP reproducible con diffs incluso para archivos untracked, sin adjuntar paquetes históricos. **Ley:** L2/L5/L6.

## 2. JUEZ — 10 contrapruebas del diagnóstico del verdugo

### J01 — ¿Cancelar S2 por haber fallado B21F?
**A favor:** B21F ya gastó una vuelta sin modificar el producto. **En contra:** el ZIP nuevo aportó un posible mecanismo causal y un bloqueo de DB reproducible; el próximo lote sí puede cambiar tests y alcanzar un gate. **Decisión:** **NO cancelar**, continuar mismo S2 con instrucciones más precisas. **Justificación:** no repetir una investigación inicial pero tampoco abandonar un P0 de control de acceso. **L1/L6**.

### J02 — ¿Prohibir todo cambio antes de tener MariaDB?
**A favor:** sin HTTP no se demuestra arreglada la seguridad. **En contra:** la hipótesis de autenticación y las aserciones de orden se pueden reparar de forma acotada y dejar listas sin tocar DB ni otros proyectos. **Decisión:** permitir **únicamente candidato de test estático respaldado por lectura**, con lint y etiqueta `PARTIAL`, y mantener producto sin cambios salvo bug reproducido. **Justificación:** avance reversible sin aprobación falsa. **L3/L5**.

### J03 — ¿La sospecha de guard cacheado permite declarar ROOT_B17?
**A favor:** `RequestGuard` memoiza y B13 limpia el guard. **En contra:** el método exacto podría tener otra fuente de 200; no se ejecutó bajo las mismas condiciones. **Decisión:** conservar `ROOT_UNKNOWN` hasta prueba diferenciadora con identidad real del token/guard en proceso limpio. **Justificación:** fuente upstream explica posibilidad, no hecho del producto. **L3/L5**.

### J04 — ¿Debe corregirse directamente la autorización del controlador?
**A favor:** 200 donde se esperaba 404 es un posible riesgo de datos ajenos. **En contra:** el controlador reportado filtra por `company_id` y `created_by_user_id`; forzar 404 rompería el positivo legítimo. **Decisión:** revisar y probar el guard/test primero, controlador/policy **solo si prueba real demuestra defecto allí**. **Justificación:** menor cambio completo, sin parche. **L1/L3**.

### J05 — ¿Basta aceptar cualquier combinación de `Cache-Control`?
**A favor:** el orden literal suele ser irrelevante. **En contra:** falta de `no-store` o `public` puede crear una regresión grave. **Decisión:** aserción semántica **estricta** que sigue exigiendo la protección. **Justificación:** no tocar servidor si directivas válidas y tampoco suavizar test. **L1/L5**.

### J06 — ¿La configuración externa de PHPUnit es demasiado compleja?
**A favor de quitarla:** crear runner alterno puede generar duplicidad. **En contra:** el fail-closed de `phpunit.xml` impide ejecutar de forma segura con el esquema histórico; sin mecanismo temporal seguro no hay cierre HTTP. **Decisión:** preferir runner QA existente; **solo si no basta**, una configuración externa efímera verificada sin modificar producto y sin dar privilegios globales. **Justificación:** complejidad condicional mínima, no nuevo framework. **L1/L2/L5**.

### J07 — ¿Debe impedirse toda operación Docker si hay una CLI ajena activa?
**A favor:** no causar interferencias en otros proyectos. **En contra:** presencia de un cliente no es prueba de conflicto sobre contenedor Jornato. **Decisión:** protección por recurso y tarea concreta, STOP si la exclusividad no puede comprobarse, sin inspección invasiva de procesos ajenos. **Justificación:** respeta al propietario sin fabricar un bloqueo permanente. **L1/L6**.

### J08 — ¿Pedir pruebas A/B y PAT en un solo lote no aumenta el alcance?
**A favor de omitirlas:** B17 y headers son los tres fallos. **En contra:** A/B y PAT ya fueron exigidos en B21F y permanecen `NOT_RUN`, y el mismo runner temporal habilita su comprobación. **Decisión:** incluir **solo** escenarios negativos/positivos ya contratados en las rutas existentes, sin OD03/OD04 inventadas. **Justificación:** economía de un único entorno y una regresión focal. **L2/L5/L6**.

### J09 — ¿Obligar a ejecutar 156 tests ahora sería un control correcto?
**A favor:** se necesita regresión del árbol final. **En contra:** una suite puede invocar servicios o DB secundarios y los tests previos no prueban su aislamiento presente. **Decisión:** suite completa una vez, **condicional a seguridad del runner entero**; si inseguro, guardar pruebas focales verificadas y `BLOCKED_SAFETY`. **Justificación:** seguridad primero, sin reabrir todas las pruebas por ritual. **L1/L5**.

### J10 — ¿Publicar otra versión no es exactamente el ping-pong prohibido?
**A favor de cancelar:** se han emitido V1/V2/V3 del B21F y ahora S2. **En contra:** S2 original contiene riesgos nuevos verificables que afectan DB y la interpretación de un posible bug P0; el usuario pide 10+10 explícitas antes de ejecutarlo. **Decisión:** **UNA sola S2 V2 y cerrar el ciclo documental**; actualizar `CODEX_LOTE_ACTUAL.md` + checkpoint en el PR #2, mantener misma TASK_ID, no generar S3 sin resultado de código nuevo. **Justificación:** corrige fallos materiales y deja solo una orden. **L2/L6**.

## 3. Veredicto y plan único

| Pregunta | Decisión comprobable |
|---|---|
| ¿Sigue correcto el objetivo? | **SÍ.** Cerrar B17 seguridad 200/404, los 2 headers, tenant A↔B, PAT y regresión segura. |
| ¿Se repite trabajo aprobado? | **NO** se repiten IPAM, 11 migraciones de B21, carreras B19/B20, auditorías antiguas ni revisión completa del ZIP. |
| ¿La V1 S2 era ejecutable sin reservas? | **NO.** Modificación estática podía confundirse con root confirmado; runner temporal no cubría conexiones laterales y proceso Docker ajeno se interpretaba como bloqueo demasiado amplio. |
| ¿Solución de arquitectura? | Reusar Laravel/Sanctum/PHPUnit, esquema QA propio confinado, tests existentes; sin nuevo middleware, auth, base productiva ni infraestructura. |
| ¿Qué evidencia nueva debe producir Codex? | Archivos afectados + diff/baselines, resultado HTTP de test con actor correcto, encabezados seguros, A/B/PAT reales, config efectiva DB, suite condicional y un ZIP verificable. |
| ¿Qué no se autoriza? | Commit/push/merge/deploy código, datos reales, cambio de roles, `DENY-ALL`, producción, modificación de `server/phpunit.xml`, usar DB histórica con `RefreshDatabase`, B22. |
| ¿Quién sigue? | `CODEX_LUNA` **solo con S2 V2**; tras ZIP `CHATGPT_DIRECTOR` revisa delta nuevo. |

**Resultado técnico heredado que NO cambia por esta auditoría:** `B17_ROOT=UNKNOWN`, `HEADERS_2=PARTIAL_REPORTED`, `TENANT_A_B=BLOCKED_ENV`, `PAT=BLOCKED_ENV`, `SUITE_FINAL=NOT_RUN_ENV`, `B21_GLOBAL_H9=NO_GO`, `B22=NOT_AUTHORIZED`, `RELEASE=NO`. **No se ejecutaron pruebas del producto durante estas 20 pasadas.**

**Regla final anti-bucle:** esta es la última revisión pre-ejecución sobre S2, salvo nueva evidencia **material y concreta**. Tras la entrega de Codex, comparar exclusivamente el delta y dar paso a H9/decisiones comerciales restantes, no volver a preguntar si el mismo prompt es bueno.

# 🚨 SIGUE CODEX LUNA — SOLO S2 V2 — DESPUÉS CHATGPT DIRECTOR 🚨