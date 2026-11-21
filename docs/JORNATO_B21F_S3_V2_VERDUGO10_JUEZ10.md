# JORNATO — AUDITORÍA EXTERNA DE LA ORDEN B21F-S3 · 10 VERDUGO + 10 JUEZ

**Fecha:** 2026-11-16, Colombia. **Objeto EXCLUSIVO:** Markdown `CODEX_LUNA_JORNATO_B21F_S3_CIERRE_SUITE_VISTAS_B18_B13S3_20261116.md` contra ZIP efectivamente recibido de B21F-S2 y checkpoint GitHub. **No** se ha realizado auditoría nueva de B13–B21, ni pruebas de la aplicación desde el PC Windows, ni reejecutado PHPUnit. **Verdictos sobre la ORDEN, no sobre el producto.**

**Fuentes comprobadas directamente:** (F1) ZIP `JOR-B21F-S2-CIERRE-20261115-UNICO.zip`, SHA256 `4E4117262575AD291A89280AFD521176005779E3F96DDFF4FFA786294244BC1A`, 14 entradas, CRC PASS, `FINAL_REPORT.md`, `ROOT_CAUSE.md`, `RESULTS.csv`, `LOGS/full-suite-once.txt`, `LOGS/commands.txt`; (F2) S3 V1 íntegro, 14.926 caracteres, recibido como Markdown; (F3) repo GitHub `sierraglobalcompany-rgb/Jornato`, PR #2 DRAFT/documental y archivo `docs/CODEX_LOTE_ACTUAL.md` que contiene S3 V1; (F4) PingPongLaw canon L1–L6 previamente cotejado; (F5) código oficial Laravel 13 `RefreshDatabase` y `RequestGuard` ya consultado: **no prueba por sí solo la conducta de Jornato**. `D:\codex\Jornato` permanece **NO INSPECCIONADO** desde esta conversación; todos los datos de su runtime y WIP proceden del ZIP S2.

**Clasificación exacta desde F1:** PHPUnit global previo `158 tests / 2.301 assertions / 7 errors / 10 failures / exit 2`; el mensaje de ruta compilada invalida **explícitamente 7 errores y 8 fallos**. El `FINAL_REPORT.md` los llamó `7+9`; se descarta esa inferencia adicional. B18 sin stack/aserción explícita y B13S3 con `0` vs `1` son **DOS fallos aún no atribuidos**, aunque podrían compartir una causa tras ver el stack real. Focal B17/headers/A↔B/PAT `24/340 exit 0` según logs, no aprobado global. WIP `235`, staged `0` es estado **REPORTADO del momento S2**, no presente garantizado.

## A. DIEZ PASADAS COMO VERDUGO — intentar romper la decisión

### V01 — ¿S3 repite S2 o aporta valor nuevo?
**Inspección:** comparar F2 con `RESULTS.csv` y `full-suite-once.txt` de F1. **Ataque:** sin delta podríamos enviar Codex a ejecutar otra batería de tests. **Hallazgo:** el delta es la primera suite global fallida, que S2 no podía cerrar en su objetivo focal. **Dictamen:** `S3_JUSTIFICADO`, pero prohibir B17 focal, IPAM, B19/B20 y auditorías anteriores. **Ley:** L2/L6. **Acción:** dejar una sola tarea S3, mismo TASK_ID en V2.

### V02 — ¿Estamos inventando una causa para los 17 incidentes?
**Inspección:** contar incidencias con mensaje de `valid cache path` en F1. **Ataque:** atribuir todos los fallos al arnés escondería regresiones. **Hallazgo:** 7 errores y **8** fallos llevan el mensaje; otros **2** no. **Dictamen:** `NO_PRESUMIR_CAUSA_B18_B13S3`; obligar a capturar stack/aserción y clasificar por separado. **Ley:** L3/L5. **Acción:** corregir la matriz causal sin alterar expectativas.

### V03 — ¿La reparación de vistas se aplica tarde?
**Inspección:** orden `runner` → `bootstrap` → `view.compiled`; excepción `Compiler.php:75`. **Ataque:** crear `framework/views` después del bootstrap puede mantener `realpath` falso en config ya cargada. **Hallazgo:** S3 V1 pedía preparar la ruta, pero no fijaba inequívocamente la condición **antes de bootstrap**. **Dictamen:** `CORREGIR`: preparación previa del storage externo, path efectivo y **render real**. **Ley:** L1/L3/L5. **Acción:** cambiar arnés, no controlador/vendor.

### V04 — ¿Se destruye sin querer evidencia SQL S2?
**Inspección:** `FINAL_REPORT.md`: esquema S2 **conservado**; F2 reusa el mismo esquema y admite `migrate:fresh`. **Ataque:** reutilizar un esquema conservado puede borrar huellas/datos que no fueron autorizados a eliminar. **Hallazgo:** «QA desechable» en S2 no equivale a permiso implícito para destruirlo en S3. **Dictamen:** `CORREGIR_P0`: proteger S2; usar esquema QA S3 aislado, existente y autorizado o uno mínimo nuevo por mecanismo ya validado. **Ley:** L1/L5. **Acción:** acotar escritura a un solo esquema con grants efectivos verificados.

### V05 — ¿Se puede aprobar B18 sin entender qué probaba?
**Inspección:** log S2 menciona nombre B18, pero no mensaje ni stack. **Ataque:** atribuirlo a vistas o activar la ruta de remuneración para obtener verde sería parche y desvío de negocio. **Hallazgo:** el mensaje de causa es desconocido. **Dictamen:** `PRIMERA_ASERCION_OBLIGATORIA`; test aislado tras corregir vistas; conservar feature off/ruta ausente si ese es el contrato. **Ley:** L1/L3. **Acción:** reparar solo causa demostrada.

### V06 — ¿B13S3 PASS aislado puede ocultar fuga de estado?
**Inspección:** falla ocurrió en suite, `0 vs 1`; S3 V1 contemplaba aislado. **Ataque:** pasar aislado no demuestra que la suite completa no contamine o que el fallo esté resuelto. **Hallazgo:** orden, cola, DB, guard y evento podrían influir, pero **ninguno está confirmado**. **Dictamen:** `CORREGIR`: registrar estado `ISOLATED_PASS/FULL_PREVIOUS_FAIL`, reproducir solo secuencia mínima si es posible; cierre real condicionado a suite. **Ley:** L3/L5. **Acción:** no cambiar consentimiento ni mock de correo.

### V07 — ¿El runner es reproducible realmente?
**Inspección:** ZIP S2 contiene `LOGS/commands.txt` y probe, pero **no** el script externo completo `run-phpunit.ps1`. **Ataque:** Codex podría adivinar variables o fabricar otra plataforma y comparar ejecuciones no equivalentes. **Hallazgo:** la ubicación/config actual no se conoce desde este chat. **Dictamen:** `CORREGIR`: descubrir script real en D:, registrar hash y receta sanitizada; si falta, recuperar solo lo mínimo demostrable. **Ley:** L1/L5/L6. **Acción:** no crear runner paralelo por costumbre.

### V08 — ¿El test es seguro solo por apuntar a localhost?
**Inspección:** evidencia S2 de esquema/usuario restringido y `RefreshDatabase`; S3 V1 verifica DB principal. **Ataque:** conexiones adicionales, almacenamiento, mail o colas pueden escapar incluso con schema principal confinado. **Hallazgo:** el riesgo existe por efectos laterales, no porque S2 haya causado daño. **Dictamen:** `MANTENER_Y_REFUERZO`: verificar en proceso **todas** las conexiones y efectos, con exclusividad y `APP_ENV=testing`. **Ley:** L5. **Acción:** fail closed para PHPUnit DB.

### V09 — ¿El presupuesto de dos repeticiones bloquea una causa corregible?
**Inspección:** C2 V1 limita a dos iteraciones del mismo caso. **Ataque:** una segunda ejecución sin delta solo repite ruido; una tercera después de un cambio material sí puede ser necesaria. **Hallazgo:** el límite absoluto por número puede impedir progreso útil o inducir parches apresurados. **Dictamen:** `CORREGIR`: presupuesto por **nueva evidencia/causa**, no por ensayo ciego; **máximo dos suites globales** y segunda solo tras delta. **Ley:** L1/L6. **Acción:** usar solo reproducciones focales diferenciadoras.

### V10 — ¿La entrega nos devuelve a otra auditoría?
**Inspección:** C4, gates y NEXT de S3 V1; instrucciones históricas contradictorias en checkpoint. **Ataque:** sin receta externa y estado de cierre preciso, el próximo chat reabre análisis sin fin. **Hallazgo:** ZIP único sí es útil; requiere manifiesto, pruebas completas/stack, recipe y un NEXT único. **Dictamen:** `CORREGIR`: incluir `QA_RUNNER_RECIPE_SANITIZED.md`, preservar prev/post y actualizar un checkpoint único. **Ley:** L2/L5/L6. **Acción:** devolver avance verificable o bloqueo exacto, no otro informe exploratorio.

## B. DIEZ PASADAS COMO JUEZ — impugnar también las objeciones del verdugo

### J01 — ¿Cancelar S3 sería la vía más rápida?
**Controversia:** cancelar evita riesgo de otra suite, pero mantiene 17 incidencias globales sin resolver. **Contraste:** F1 registra suite FAIL; B17 sí estaba focalmente verde. **Sentencia:** `MANTENER S3`, alcance cerrado a vistas/B18/B13S3. **Por qué:** prueba global es gate material para producto; no es ritual ni auditoría repetida.

### J02 — ¿Rehacer toda la autenticación aumenta confianza?
**Controversia:** seguridad es crítica; repetir 24 tests puede parecer prudente. **Contraste:** F1 ya informa 24/340/exit0 y una futura suite global incluye casos B17. **Sentencia:** `NO REPETIR B17 FOCAL` sin delta de auth; sí verificar en corrida global el árbol completo. **Por qué:** ahorro sin falsificar cobertura.

### J03 — ¿Añadir un framework de pruebas es más limpio?
**Controversia:** un runner nuevo resolvería inconsistencias aparentes. **Contraste:** S2 obtuvo QA real y acotada con runner existente. **Sentencia:** `REPARAR RUNNER EXISTENTE EXTERNO`, sin tocar producto/phpunit.xml/vendor. **Por qué:** L1/L2; modificar más capas generaría ruido y riesgo.

### J04 — ¿Exigir nueva DB S3 es una microfase?
**Controversia:** preparación de un esquema adicional suena a otra infraestructura. **Contraste:** QA S2 preservó su esquema; `migrate:fresh` es potencialmente destructivo. **Sentencia:** `PERMITIR UN SOLO SCHEMA QA S3` mediante infraestructura existente, solo cuando no es seguro reutilizar S2. **Por qué:** mínimo costo compatible con preservar evidencia y seguridad de datos.

### J05 — ¿Resolver vistas equivale a PASS de los 17 fallos?
**Controversia:** 15 incidencias explícitas comparten excepción; arreglar ruta puede despejar la mayoría. **Contraste:** B18 y B13S3 carecen de atribución probada. **Sentencia:** `NO`, validar **compilación real**, B18 y B13S3 focal y suite completa. **Por qué:** L5 y no aceptar PASS conceptual.

### J06 — ¿Cambiar el expected de B18 produciría una solución más rápida?
**Controversia:** test de preview apagado podría reflejar requisito viejo. **Contraste:** no hay nueva decisión comercial ni evidencia de cambio aprobado. **Sentencia:** `PROHIBIDO` inventar ruta/pago/preview; conservar contrato hasta demostrar otra cosa. **Por qué:** seguridad y gobierno del producto prevalecen sobre test verde.

### J07 — ¿Podemos declarar B13S3 cerrado al pasar aislado?
**Controversia:** un isolated PASS después de arreglar vista sugiere entorno. **Contraste:** fallo previo bajo suite puede depender de orden/transacciones/cola. **Sentencia:** `NO` hasta pasar suite global. **Por qué:** protege consentimiento, recuperación e idempotencia sin falsa equivalencia entre contextos.

### J08 — ¿Deben correrse cinco suites globales para ganar certeza?
**Controversia:** más repeticiones podrían descubrir defectos flakey. **Contraste:** no hay evidencia de flakiness recurrente; cada suite toca QA y consume tiempo. **Sentencia:** `UNA SUITE`, segunda solo tras delta material y focal PASS, nunca sin causa. **Por qué:** L6 y evidencia suficiente sin ping-pong.

### J09 — ¿Actualización GitHub autoriza tocar PR de código?
**Controversia:** usuario exige continuidad en GitHub. **Contraste:** PR #2 es solo documental; PR #1/main no contienen WIP local. **Sentencia:** publicar **solo prompt, dictamen y checkpoint** en branch documental DRAFT, sin merge/push de producto. **Por qué:** continuidad real sin atribuir ejecución ni reemplazar WIP.

### J10 — ¿Suite PASS autoriza el lanzamiento inmediato?
**Controversia:** deseo legítimo del usuario de terminar rápido. **Contraste:** contratos y autorización H9/Android/web/OD01–OD08 siguen NO_GO. **Sentencia:** `BACKEND_PASS_NO_EQUIVALE_RELEASE`; siguiente entrega debe ser funcional y autorizada, no otra auditoría del mismo prompt. **Por qué:** eliminar burocracia sin saltarse seguridad ni decisiones del dueño.

## C. DICTAMEN ÚNICO Y PLAN DE CIERRE

**Veredicto:** `CORREGIR_Y_UNIFICAR`. **Nuevo valor:** S3 V2 tiene cuatro ajustes materiales, no una fase adicional: (1) preparar vistas **antes** de bootstrap y render real; (2) preservar esquema S2 y aislar destructivos S3; (3) probar B13S3 también en contexto de suite si aislado pasa; (4) preservar receta exacta del runner externo + clasificación causal sin inventar raíz. Las otras modificaciones son precisiones para ejecución segura, no rediseño.

**L1 KISS/Ponytail:** `CUMPLE_COMO_ORDEN`; un runner actual, sin arquitectura. **L2 antirruido:** `CUMPLE`; no reabrir pruebas S2 PASS. **L3 antiparches:** `CUMPLE_CONDICIONADO_A_EJECUCION`; modificar causa, no aserción para forzar verde. **L4 humano:** `NO_APLICA_A_CAMBIO_BACKEND`, no inventar UI. **L5 independiente:** `PENDIENTE_DE_EJECUCION`; este documento es inspección adversarial de instrucciones/artefactos, no verificación independiente de la futura implementación. **L6 antipingpong:** `CUMPLE_COMO_PLAN`; una sola orden ZIP, una suite final y una opcional condicionada.

**Estado que sigue siendo cierto:** `S2=PARTIAL`, `ROOT_B17=GUARD_CACHE_CONFIRMED_IN_TEST_CONTEXT`, `SECURITY_FOCAL=PASS_REPORTED_BY_LOG`, `BACKEND_FULL_SUITE=FAIL`, `B18_ROOT=UNKNOWN`, `B13S3_ROOT=UNKNOWN`, `B21_GLOBAL_H9=NO_GO`, `B22=NOT_AUTHORIZED`, `RELEASE=NO`, `WIP_LOCAL_NOT_READ_DIRECTLY=TRUE`. El prompt S3 V2 **no ejecuta nada** al publicarse.

**Única orden a Codex:** `CODEX_LUNA_JORNATO_B21F_S3_V2_MACROBLOQUE_CIERRE_BACKEND_20261116.md`, `TASK_ID=JOR-B21F-S3-FULLSUITE-CLOSURE-20261116`. **S3 V1 queda reemplazada; no ejecutar las dos.** Si Codex ya inició S3 V1, NO enviar V2 en paralelo: primero determinar si hubo ediciones y evitar trabajo concurrente. Entregar **un solo ZIP** con evidencia/recipe; luego `NEXT_OWNER=CHATGPT_DIRECTOR`. Si el backend pasa, siguiente bloque de producto vertical Android/web + H9/OD, no otra auditoría de la redacción.

# 🚨 SIGUE CODEX LUNA (S3 V2) — DESPUÉS DEL ZIP, CHATGPT DIRECTOR. 🚨
