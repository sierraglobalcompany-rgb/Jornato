# JORNATO — COMPLEMENTO AUDITADO DEL RECOVERY V6 · B21 IPAM / 3 FALLOS · PLAN FINAL HASTA B22

**Fecha de corte documental:** 2026-11-15 (America/Bogota). **Tipo de entrega:** UN SOLO archivo Markdown complementario; NO sustituye el Recovery principal, NO constituye código, una orden de Codex, un respaldo de Windows ni aprobación comercial.  
**Recuperación principal verificada (adjunto):** `JORNATO_RECOVERY_HANDOFF_2026-11-15_B21_IPAM_DB_REAL_3_FALLOS.md` · 22,749 bytes · SHA-256 `a5d22314409f4d6cb37eda83aa720f5281635720635f8be0466fedd3e3113cce`.  
**ZIP primario verificado (adjunto):** `JOR-B21-IPAM-RECOVERY-20261115-UNICO(1).zip` · 68,843 bytes · SHA-256 `c51440ab28dd218f7a6c6ea35751daa500b6fc67f45f6823fdd56db9459e307b`.  
**Recovery Universal V6 leído:** `Recovery(1).md` · SHA-256 `84715587a4641b5cab5309ed635de887e935c8bf7d89bea91a36eb9798b4cf77`.  
**Último hito técnico:** `JOR-B21-IPAM-RECOVERY-REAL-DB-QA-20261115` = `PARTIAL`; red IPAM propia resuelta, MariaDB QA real y migraciones/carreras ejecutadas **según los logs**, suite `153/156; 3 FAIL; exit 1`, B21 global/Release `NO_APROBADO`.  
**Siguiente responsable confirmado:** `CHATGPT_DIRECTOR`; **NUEVA_ORDEN_CODEX=NINGUNA** al corte. Continuar solo con evidencia local nueva o autorización para un bloque de QA focal.

> ## 🚨 DECISIÓN DE DIRECCIÓN: B17 LECTURA ENTRE USUARIOS = NO_GO HASTA ACLARAR 200/404
> La prueba B17 de mismo-tenant/otro usuario devuelve 200 en una suite que esperaba 404, mientras otro arnés aislado reportó 404. **No declarar fuga confirmada ni seguridad aprobada**; reproducir primero la diferencia, identificar causa raíz con test/fuente auténticos y no habilitar permisos HR/comerciales.

## A. Alcance y conciliación contra GitHub (lectura actual, no suposición)

**Repo:** `sierraglobalcompany-rgb/Jornato`. **`main` remoto SHA** `1ee6aae821f8cf177cc64149081ad8847f7fec2e` (consultado realmente en este turno; no contiene WIP de D:). **PR #1:** OPEN/DRAFT HEAD `faf5fe283191f8b5a2724b397009512a2caec1b6`. **PR #2:** OPEN/DRAFT HEAD `ad9420906dcf2ba4b38a7141467f3b28816f10a4`, rama `docs/pingponglaw-l1-l6-canon-84e961c`. **GitHub `docs/JORNATO_RECOVERY_HANDOFF_ACTUAL.md`** blob `f3bf90ea730e0377245e562761bbd7f7fa81abda` es la copia publicada del Recovery adjunto. **`docs/JORNATO_CONTINUIDAD.md`** blob `6f8684a11e1ecdbcb92b494d32f86af372a2c68d` identifica `NEXT_OWNER=CHATGPT_DIRECTOR`, ZIP IPAM ya ejecutado y **SIN ORDEN CODEX**. **`docs/CODEX_LOTE_ACTUAL.md`** blob `1504a260b7cfdee2e0f9eb6e517964bc1220d47c` desactiva la orden IPAM ejecutada. AGENTS.md remite al checkpoint pero en su propia explicación histórica menciona B15 como futuro: **no interpretar el texto antiguo como el estado actual**; la cabecera nueva del checkpoint prevalece. No se ha comprobado el checkout Windows desde este chat.

**PingPongLaw REALMENTE LEÍDO en GitHub:** repositorio `sierraglobalcompany-rgb/PingPongLaw`, commit fijo `84e961cadf482d234f4c0ee2ca60e8c7e9b388e8`, documento `docs/engineering/LEYES_IMPLEMENTACION_1_A_6.md`, blob `0f6e7b4e62d8660c846f135e18dded629d29e0da`; router `.agents/skills/pingponglaw/SKILL.md`, blob `c8072a07431e4011cbc566446942dab51f0b45b9`. L1 KISS/Ponytail; L2 antirruido; L3 antiparches/causa raíz; L4 UX humana; L5 verificación independiente; L6 antipingpong. **Seis leyes, no nueve.** No activar hooks/instalar skills por recuperación.

### Evidencia primaria cotejada una sola vez

| Fuente del último ZIP | Hecho comprobable | Límite obligatorio |
|---|---|---|
| ZIP y `MANIFEST_SHA256.csv` | 36 miembros; CRC PASS; **35/35 hashes y bytes correctos**; 0 nombres duplicados o rutas inseguras | Integridad de archivo ≠ aprobación de ejecución runtime |
| `LOGS/phpunit-suite-summary.txt` | 156 tests, 2.398 aserciones, **153/156**, exit **1**, tres fallos descritos | No hay traza completa ni nombres de test en el ZIP; impedir diagnóstico fingido |
| `LOGS/concurrency-sanitized.json` y CSV | B17, B19 y B20 con 2 trabajadores/conexiones y solape reportado; B19 `STORAGE_FAKE` | PASS por contrato/fuente sintética; no autoriza lectura RR. HH. ni almacenamiento real |
| `DB_MIGRATIONS_LOG.txt`, `DB_DDL_INDEX_FK.md` | 11 migraciones, 37 tablas InnoDB, resumen de FK/índices y CREATE TABLE | SQL de QA reportado por Codex, no migraciones de producción |
| `TENANT_PAT_RESULTS.csv` | A→B no ejecutado; PAT activo/revocado/expirado NOT_RUN | No sumar estos casos a test suite verde |
| `DOCKER_ISOLATION_PRE_POST.csv` | Tres contenedores ajenos activos estables según metadatos del experimento | No afirmar estabilidad byte a byte de 105 contenedores ni aislamiento físico absoluto |
| `SOURCE_HASHES_PRE_POST.csv` y `GIT_CUSTODY.md` | 237 rutas pre/post internamente coincidentes; staged 0 reportado | No es backup ni prueba independiente de archivos ignorados o del disco D: |

**Gates congelados para no desviarse:** `IPAM=PASS_SCOPED_REPORTED`, `DB_MIGRATIONS=PASS_REAL_SCOPED_REPORTED`, `B17_WRITE_IDEMPOTENCY=PASS_SCOPED_REPORTED`, `B17_READ_OTHER_USER=FAIL_IN_SUITE_CAUSE_UNKNOWN`, `B19_CONCURRENCY=PASS_DB_REAL_STORAGE_FAKE_REPORTED`, `B20_CONCURRENCY=PASS_DB_REAL_SYNTHETIC_REPORTED`, `TENANT_A_B=NOT_RUN`, `PAT_LIFECYCLE=NOT_RUN`, `PHPUNIT=FAIL_153_156`, `B21_GLOBAL=NOT_APPROVED`, `RELEASE_APPROVED=NO`, `B22=NOT_AUTHORIZED`.

**REGISTRO DE RIESGO NORMATIVO:** OD01–OD08 siguen sin aprobar (privacidad/retención, vínculo cuenta-empleado, matriz de roles HR, login web, ATS+CV/antimalware, documentos/firma, homologación salarial, planes/cobros). No transformar fixtures QA ni documentación candidata en autorización de negocio. `OFF_DEVICE_BACKUP=NOT_DONE` al último historial: pedir decisión por separado antes de cambios de alto impacto, sin bloquear la investigación de B17 por inercia.

---

## B. FASE VERDUGO — 10 PASADAS PARA ATACAR EL RECOVERY Y EL RUMBO

**Metodología:** cada pasada revisó una superficie distinta del Recovery principal con fuente verificable, hipótesis adversarial y reparación focal. Las seis leyes siguientes a cada pasada son juicios del **documento/plan**, NO tests ejecutados del producto.


### V01. Jerarquía de fuentes y fecha real

**Qué revisé:** Leí el Handoff 15-nov A–H y lo comparé con el checkpoint canónico actual: su ZIP C514… es el último recibido; GitHub ya desactivó IPAM y mantiene NEXT=ChatGPT. El PR #2 ya tiene un HEAD posterior al corte anotado en el Handoff.

**Ataque del verdugo:** Un chat nuevo podría tratar el HEAD remoto viejo o el prompt IPAM histórico como tarea activa, duplicando Docker.

**Reparación razonada:** Anclar en el bloque más reciente del checkpoint, usar el nuevo ZIP como último hecho y separar la rama de documentos del checkout D:. No reeditar el Handoff principal solo para actualizar una línea histórica.

- **L1:** L1: una única fuente activa y un complemento, sin tercer plan.
- **L2:** L2: descartar la orden IPAM histórica como activa.
- **L3:** L3: deriva documental se corrige con prioridad temporal, no reensamblando todo.
- **L4:** L4: el relevo debe dar NEXT legible en la primera pantalla.
- **L5:** L5: GitHub confirma dirección, no ejecución del WIP.
- **L6:** L6: no delegar dos órdenes a Codex.

### V02. Integridad ZIP contra inferencias de runtime

**Qué revisé:** Recalculé SHA256 del ZIP: C51440AB…E307B; 68.843 bytes, 36 miembros, CRC válido, 35/35 entradas con tamaño y hash correctos, sin rutas de escape ni duplicados.

**Ataque del verdugo:** El Handoff puede ser leído como certificado de que ChatGPT ejecutó PHP, SQL o Docker. La validez del ZIP solo certifica bytes y trazabilidad documental.

**Reparación razonada:** Mantener etiquetas VERIFICADO_DIRECTO_ARCHIVO y REPORTADO_RUNTIME. No convertir log autorreferente de Codex en prueba independiente de servicios.

- **L1:** L1: preservar un solo paquete primario.
- **L2:** L2: no reextraer/rehashear ZIPs viejos.
- **L3:** L3: resolver la frontera de evidencia sin falsear PASS.
- **L4:** L4: etiquetas PASS fáciles de interpretar.
- **L5:** L5: QA independiente runtime sigue pendiente.
- **L6:** L6: revisar solo evidencia nueva del futuro lote.

### V03. Tres fallos sin trazas crudas

**Qué revisé:** Abrí LOGS/phpunit-suite-summary.txt: 156 pruebas, 2.398 aserciones, 153 PASS, 3 FAIL, exit 1. No hay stdout/stderr crudo individual ni nombre exacto de test/cadena de request y respuesta.

**Ataque del verdugo:** Intentar parchear B17 o los headers con solo el resumen obliga a adivinar. También sería un error presentar los tres como fallos de la aplicación: dos pueden ser aserciones frágiles.

**Reparación razonada:** Primera tarea focal: recuperar test name, expected/actual, contexto auth, middleware, request, seed y orden de ejecución desde el runtime local; no tocar negocio hasta causa demostrada.

- **L1:** L1: evidencia puntual, sin suite monstruosa.
- **L2:** L2: no repetir 153 tests ya verdes al diagnosticar.
- **L3:** L3: obtener traza antes de cambiar código.
- **L4:** L4: respuestas 403/404 coherentes para el usuario autorizado/no autorizado.
- **L5:** L5: archivo del ZIP no contiene raw y debe declararse.
- **L6:** L6: mismo macrobloque recoge traza y corrige si procede.

### V04. B17 lectura mismo tenant 200/404

**Qué revisé:** La suite declara HTTP 200 donde esperaba 404 para otro usuario de la MISMA empresa; LOGS/concurrency-sanitized.json declara 404 en arnés de proceso diferente.

**Ataque del verdugo:** Dos resultados opuestos no prueban que el permiso esté bien: posible falla de scope por solicitante, fuga de guard, caché, fixture contaminada, rol, membership o secuencia de tests.

**Reparación razonada:** Clasificar B17_READ_OTHER_USER=FAIL_REPORTADO_POR_SUITE / ROOT_UNKNOWN / SECURITY_HOLD. Reproducir en mismo proceso y proceso limpio, captura del usuario/tenant/requestId real sintético, sin afirmar vulnerabilidad definitiva.

- **L1:** L1: mismo controller/policy/query, no segundo autorizador.
- **L2:** L2: una matriz de auth mínima.
- **L3:** L3: buscar origen 200 antes de parchear status.
- **L4:** L4: no revelar solicitudes ajenas.
- **L5:** L5: resultado 404 de otro proceso no invalida 200.
- **L6:** L6: un único diagnóstico de causa raíz, no ensayos eternos.

### V05. Contaminación de estado y semántica de test

**Qué revisé:** El Handoff enumera hipótesis, pero no define orden causal de comparación: suite conjunta, test aislado, dos tests encadenados, mismas fixtures, start/tearDown, caché y Auth context.

**Ataque del verdugo:** Un `actingAs`, token, tenant scope estático o una transacción pendiente puede dar 200 solo después de otros tests sin que la consulta aislada lo reproduzca.

**Reparación razonada:** Fijar secuencia de reproducción acotada: 1) test fallido solo; 2) par precedente→fallido si existe orden; 3) clase focal; 4) suite completa una sola vez tras reparación para certificar regreso. Guard/DB/cache/fixture por cada caso.

- **L1:** L1: reutilizar PHPUnit actual.
- **L2:** L2: máximo pasos que aíslan causalidad, no permutación exponencial.
- **L3:** L3: comparar contexto antes/después del test.
- **L4:** L4: error no debe abrir lectura ajena.
- **L5:** L5: mismo tree SHA y mismos IDs sintéticos.
- **L6:** L6: stop al encontrar causa y validar regresión.

### V06. Cache-Control no es licencia para relajar seguridad

**Qué revisé:** Dos fallos del resumen comparan `private, no-store, max-age=0` con `max-age=0, no-store, private`.

**Ataque del verdugo:** La igualdad de directivas parece semántica, pero si se modifica a `public` o se pierde `no-store` al corregir el test existiría una regresión de privacidad.

**Reparación razonada:** Decidir primero si el contrato exige orden literal o conjunto de directivas; si no exige orden, comprobar tokens sin importar orden y seguir exigiendo private/no-store/max-age=0. No cambiar respuesta productiva solo para un test.

- **L1:** L1: aserción semántica pequeña en el test existente.
- **L2:** L2: no crear middleware de headers nuevo.
- **L3:** L3: corregir causa del FAIL, no silenciar test.
- **L4:** L4: respuestas sensibles sin caché compartida.
- **L5:** L5: verificar valores efectivos y ausencia de public.
- **L6:** L6: mismo lote que B17.

### V07. Concurrencia válida solo en su capa

**Qué revisé:** El ZIP registra dos workers/sesiones para B17/B19/B20; B19 usa `Storage::fake`, B20 es flujo ATS sintético y la suite global falla.

**Ataque del verdugo:** Aceptar un PASS scoped de idempotencia como aceptación de autenticación, almacenamiento privado, CV, web o producto completo sería falso.

**Reparación razonada:** Conservar PASS scoped de la carrera, no repetirla salvo cambio al escritor/lock. Mantener otros contratos y H9 sin aprobar.

- **L1:** L1: servicios y DB existentes, sin broker.
- **L2:** L2: reutilizar PIDs/CONNECTION_ID reportados.
- **L3:** L3: no mezclar fallos de auth con idempotencia de escritura.
- **L4:** L4: ATS/HR siguen cerrados.
- **L5:** L5: storage fake y QA authorizer explícitos.
- **L6:** L6: no rehacer carreras B19/B20.

### V08. Frontera empresa A→B, PAT y roles

**Qué revisé:** TENANT_PAT_RESULTS.csv confirma A→B no ejecutado; PAT activo/revocado/expirado NOT_RUN; B19/B20 DENY-ALL.

**Ataque del verdugo:** Un 404 mismo-company no demuestra aislamiento entre empresas, token revocado, sesiones web ni permisos por acción; inventar permisos QA en rutas públicas afectaría a terceros.

**Reparación razonada:** Plan de pruebas negativas reales por middleware y servicio existentes con dos empresas ficticias y PAT lifecycle; mantener web y RR. HH. BLOCKED_CONTRACT hasta OD02/OD03/OD04.

- **L1:** L1: mismo guard/policy server-side.
- **L2:** L2: tabla pequeña de matriz A/B/PAT, no suite duplicada.
- **L3:** L3: cada 200 inesperado apunta a frontera causal.
- **L4:** L4: rechazo de acceso claro sin enumeración de datos.
- **L5:** L5: capas HTTP y SQL etiquetadas separadamente.
- **L6:** L6: una sola pasada de QA adversarial focal.

### V09. Protección WIP y Docker de otros proyectos

**Qué revisé:** El CSV afirma 237/237 hashes antes/después iguales y 3 contenedores activos ajenos estables; MariaDB Jornato quedó detenida pero red/volumen/datos propios preservados.

**Ataque del verdugo:** El ZIP no es backup del WIP ni prueba que 105 contenedores ajenos estén intactos byte a byte; la subred 10.0.0.0/28 puede colisionar en otra fecha, o una orden de limpieza podría dañar otras apps.

**Reparación razonada:** Reusar solo recursos de Jornato tras verificar propiedad/huella actual y seguridad IPAM; nunca `prune`, `down -v`, ni borrar desconocidos. Marcar backup externo cifrado NO_HECHO sin convertirlo en bloqueo de diagnóstico seguro.

- **L1:** L1: un laboratorio propio ya creado.
- **L2:** L2: no reconstruir MariaDB ni repetir migraciones automáticamente.
- **L3:** L3: verificar colisión actual si se reusa red.
- **L4:** L4: la app de otros proyectos debe seguir disponible.
- **L5:** L5: pre/post de contenedores ajenos solo metadatos.
- **L6:** L6: no otro macrobloque de infraestructura.

### V10. Camino a publicación sin GO ficticio

**Qué revisé:** El Handoff recopila OD01–OD08, H9, C04 RAW histórico, Android/ANR y backup, pero no fija puertas priorizadas por efecto en lanzamiento.

**Ataque del verdugo:** Un chat nuevo puede seguir generando auditorías B21 y posponer decisiones de producto o, en el extremo opuesto, saltar a B22 por el número 153/156.

**Reparación razonada:** Definir orden determinista P0 auth → P1 A/B+PAT+suite → P2 Android/C04/UX → P3 contratos OD y verticales → P4 H9 integral independiente → P5 GO/B22. Porcentaje de completitud no estimable.

- **L1:** L1: bloques de producto existentes, una línea de entrega.
- **L2:** L2: gate por dependencia, no por volumen de prompts.
- **L3:** L3: seguridad antes de habilitar casos felices.
- **L4:** L4: UAT humana antes de comercial.
- **L5:** L5: QA humano/L5 mismo build.
- **L6:** L6: cerrar cada gate una vez y no auto-encadenar trabajo.


---

## C. FASE JUEZ — 10 PASADAS CONTRADICTORIAS PARA CONFIRMAR O RECHAZAR LA SOLUCIÓN

**Criterio judicial:** no asumir que la crítica del verdugo era correcta; contrastar costo, riesgos, evidencia y falsas equivalencias.

### J01. ¿Confiar en la recuperación principal sin complemento?

**Argumento a favor:** El Handoff ya contiene A–H, leyes, fuentes, datos del ZIP y NEXT correcto; no hay que sustituirlo.

**Contraargumento adversarial:** Sí existen vacíos de granularidad en reproducción de B17, pruebas HTTP y secuencia hacia H9 que impactan la siguiente orden.

**Fallo del juez y justificación:** Mantener Handoff como base; agregar este único complemento de delta, referenciado desde el checkpoint, sin duplicar textos extensos.

- **L1:** L1: un anexo y no un segundo Handoff.
- **L2:** L2: concentrar solo riesgos todavía abiertos.
- **L3:** L3: complemento es contrato de ejecución, no reescritura histórica.
- **L4:** L4: resumen inicial inequívoco.
- **L5:** L5: citar el ZIP verificado.
- **L6:** L6: el siguiente chat no reaudita ambos documentos.

### J02. ¿Dar por probado un bug de seguridad B17?

**Argumento a favor:** Un 200 inesperado puede exponer una solicitud ajena; la expectativa 404 consta en el test y merece alta prioridad.

**Contraargumento adversarial:** Falta código/tests crudos; podría provenir de contaminación o contrato legítimo distinto aún no aprobado. Afirmar explotación real es excesivo.

**Fallo del juez y justificación:** Mantener SECURITY_HOLD/B17_NOT_APPROVED por comportamiento observado, causalidad NOT_DETERMINED. Corregir solo después de reproducir en runtime actual.

- **L1:** L1: política real en un solo sitio.
- **L2:** L2: evitar una nueva autorización provisional.
- **L3:** L3: distinguir hipótesis y causa observada.
- **L4:** L4: preservar privacidad aun ante duda.
- **L5:** L5: 200 y 404 coexisten en evidencia.
- **L6:** L6: investigar en un lote focal.

### J03. ¿Repetir toda la suite 156 pruebas inmediatamente?

**Argumento a favor:** La suite falló y al final requerirá una certificación repetible del mismo árbol.

**Contraargumento adversarial:** Repetirla al inicio no captura la traza faltante ni discrimina fallo por orden; añade ruido y puede alterar recursos QA.

**Fallo del juez y justificación:** Primero 3 fallos y secuencias causales acotadas; después **una** regresión completa 156/156 sobre el árbol final si el entorno lo permite, con captura cruda y exit.

- **L1:** L1: PHPUnit estándar.
- **L2:** L2: una sola regresión total al final, no cada cambio.
- **L3:** L3: diagnóstico primero, cobertura después.
- **L4:** L4: errors retornados deben ser consistentes.
- **L5:** L5: 156/156 solo si realmente se ejecutó.
- **L6:** L6: no loop de suite completa.

### J04. ¿Aceptar el 404 de arnés separado como prueba de seguridad?

**Argumento a favor:** El arnés probó rechazo en un escenario, con datos sintéticos.

**Contraargumento adversarial:** No reproduce exactamente el contexto, proceso y el estado residual de la suite que produjo 200.

**Fallo del juez y justificación:** Retenerlo como NEGATIVO_REPORTADO_EN_ARNÉS_SEPARADO, nunca como refutación del FAIL; probar mismo contexto tras otros tests y fixtures.

- **L1:** L1: misma ruta y policy.
- **L2:** L2: comparar sin nueva implementación paralela.
- **L3:** L3: diferencia de proceso como pista causal.
- **L4:** L4: defensa por defecto ante acceso ajeno.
- **L5:** L5: trazas independientes con mismo tree.
- **L6:** L6: no resolver por mayoría de resultados.

### J05. ¿Modificar Laravel para devolver 404 en cualquier caso?

**Argumento a favor:** El 404 parece requerido por el test de ocultación de solicitudes.

**Contraargumento adversarial:** Forzar 404 por middleware genérico podría romper acceso legítimo del propio solicitante; cambiar rol/actor sin OD aprobada inventaría producto.

**Fallo del juez y justificación:** Resolver en identidad solicitante, ownership/actor y consulta tenant-scoped existentes; garantizar positivos legítimos y negativos ajenos antes de aprobar.

- **L1:** L1: no otro policy engine.
- **L2:** L2: una corrección causal en owner real.
- **L3:** L3: evitar status hardcodeado como parche.
- **L4:** L4: solicitante sigue viendo lo suyo.
- **L5:** L5: positivos y negativos juntos.
- **L6:** L6: no segunda fase para reparar la reparación.

### J06. ¿Ignorar dos fallos Cache-Control porque solo cambia orden?

**Argumento a favor:** En muchos escenarios HTTP el orden textual de estas directivas no cambia la semántica; el resumen contiene los mismos tokens, pero el contrato concreto aún no fue examinado.

**Contraargumento adversarial:** El contrato del producto aún no se ha inspeccionado; `Cache-Control` protege datos sensibles y no se puede eliminar un token para «pasar».

**Fallo del juez y justificación:** Comparar directivas normalizadas del header real y exigir todas las garantías, sin modificar el servidor si su semántica ya era correcta.

- **L1:** L1: assertion/parser pequeño ya existente.
- **L2:** L2: no rehacer middleware.
- **L3:** L3: el fallo puede estar en test, no en producto.
- **L4:** L4: respuestas privadas sin almacenamiento en caches.
- **L5:** L5: valores semánticos probados.
- **L6:** L6: corregir en misma tanda.

### J07. ¿Declarar B17 global aprobado por carrera concurrente?

**Argumento a favor:** La prueba de escritura idempotente entre dos workers es favorable y no debe descartarse.

**Contraargumento adversarial:** El test de lectura de otro usuario sigue fallido; escritura segura no garantiza lectura privada.

**Fallo del juez y justificación:** Conservar `B17_WRITE_IDEMPOTENCY=PASS_SCOPED_REPORTED`; `B17_READ_AUTH=NO_GO`; módulo B17 global PARTIAL.

- **L1:** L1: no bifurcar el servicio B17.
- **L2:** L2: no rehacer el lock sin cambio.
- **L3:** L3: dos defectos/superficies distintos.
- **L4:** L4: los datos ajenos quedan protegidos.
- **L5:** L5: PASS por caso, no por módulo completo.
- **L6:** L6: enfocar nuevo trabajo en lectura.

### J08. ¿Cerrar la QA B21 usando solo MariaDB?

**Argumento a favor:** La integración real de DB ya permitió confirmar migraciones y carreras, avance significativo.

**Contraargumento adversarial:** B19 storage fake; B16 login web pendiente; Android ANR/C04 C10; H9 seguridad, accesibilidad, UX, rendimiento, L5 humano siguen abiertos.

**Fallo del juez y justificación:** Conservar H9 global NOT_APPROVED, aplicar gates por canal y construir matriz no redundante hacia aceptación final.

- **L1:** L1: un producto, múltiples capas existentes.
- **L2:** L2: no recalcular 11 migraciones.
- **L3:** L3: separar faltantes por capa.
- **L4:** L4: validar un flujo real por rol/dispositivo.
- **L5:** L5: build exacto y revisor separado.
- **L6:** L6: no saltar a B22.

### J09. ¿Exigir backup cifrado externo como bloqueo inmediato?

**Argumento a favor:** El WIP local no está en GitHub y existe riesgo real de pérdida; copia externa recuperable es importante antes de lanzamiento o cambios mayores.

**Contraargumento adversarial:** El propietario no autorizó destino cifrado separado ni proceso destructivo; imponerlo ahora bloquearía diagnóstico B17 que es seguro y focal.

**Fallo del juez y justificación:** Registrar `OFF_DEVICE_BACKUP=NOT_DONE`, solicitar decisión cuando se vaya a tocar/transferir WIP masivo o publicar; nunca usar `git push` como respaldo implícito.

- **L1:** L1: respaldo único recuperable cuando se autorice.
- **L2:** L2: no volver al ritual P0/B14 para diagnosticar B17.
- **L3:** L3: tratar riesgo estructural antes de operaciones críticas.
- **L4:** L4: continuidad del servicio y datos del negocio.
- **L5:** L5: restauración de muestra para afirmar PASS.
- **L6:** L6: no convertirlo en microbloque automático.

### J10. ¿Emitir directamente otra orden CODEX en este complemento?

**Argumento a favor:** El usuario solicita solo un Markdown complementario, auditado y verificable, para un chat nuevo.

**Contraargumento adversarial:** Enviar una orden ejecutable sin fuente local de los tres fallos y sin solicitud expresa de delegación puede reabrir un ping-pong; el slot GitHub ya dice sin orden Codex.

**Fallo del juez y justificación:** Documentar el próximo lote de forma suficientemente determinada para que ChatGPT lo emita al autorizarse, pero no generar otra orden activa ni iniciar Docker.

- **L1:** L1: documento de continuidad, no implementación.
- **L2:** L2: no dos prompts casi iguales.
- **L3:** L3: fuente/causa antes de parche.
- **L4:** L4: preservar requisitos UX originales.
- **L5:** L5: nueva evidencia será auditada una sola vez.
- **L6:** L6: NEXT=ChatGPT director, luego Codex si autorizado.


---

## D. Auditoría del Recovery V6 original — controles P01–P10 sin duplicar su contenido

| Control | Veredicto del complemento | Reparación necesaria para el próximo chat |
|---|---|---|
| P01 Identidad y alcance | PASS | Producto Gratis/Pro e intención de lanzamiento integral claramente definidos. |
| P02 Historia y Recovery Gap | PASS documental / LOCAL_UNKNOWN | El ZIP IPAM supera los bloqueos Docker previos; actividad posterior en D no comprobada. |
| P03 Verdad y recencia | PASS | El GitHub consultado ya indica NO ORDEN CODEX; preferir su cabecera a instrucciones antiguas dentro de histórico. |
| P04 Git/WIP | PASS con límite | GitHub `main`/PRs no son copia del WIP local; hashes CSV son internos al ZIP. |
| P05 L1/L2 simple/antirruido | PASS | Este complemento **no** reemplaza Handoff; no copiar 91 KB de historia del checkpoint. |
| P06 L3 causa raíz | PARTIAL legítimo | IPAM resuelto; B17 200/404 todavía sin causa observable; los 2 headers no se clasifican sin contrato. |
| P07 L4 diseño humano | PARTIAL de producto | QA Android, ANR, C04 RAW, C10 y web están abiertos; sin inventar aprobaciones visuales. |
| P08 L5 evidencia y permisos | PARTIAL de producto | ZIP íntegro sí; QA runtime ejecutada por Codex, revisor externo no ha reproducido los 3 fallos. |
| P09 L6 ejecución en vuelo | PARTIAL | `CODEX_ACTIVE_NOW=NOT_VERIFIED`; no lanzar nueva tarea simultánea sobre D/Docker sin conocer estado actual. |
| P10 Simulación de relevo | PASS documental | Con Handoff + este complemento + ZIP se conoce NEXT y qué no repetir; no equivalen a QA de aplicación. |

**Regla de conteo auditado:** **10 V + 10 J = 20 pasadas; 6 leyes por pasada = 120 juicios explícitos**, 0 tests de producto ejecutados por este complemento, y cero auditorías repetidas de B13–B21. Juez y verdugo son contraste DOCUMENTAL, no una certificación independiente de runtime.

## E. Plan directivo optimizado hasta finalizar la aplicación — puertas con condiciones de salida

| Puerta / prioridad | Trabajo REAL, no reauditoría histórica | Evidencia de cierre y dueño | NO hacer |
|---|---|---|---|
| **P0 — Seguridad B17, inmediata** | Localizar test de 200, traza cruda y contexto actual; reproducir 200/404 en mismo proceso y proceso limpio; comparar actor solicitante, titular, compañía, membership, policy, fixture, middleware, cache, transacción y orden de ejecución. Si hay bug: corregir causa raíz en servicio/policy existente. | **Owner próximo:** ChatGPT define lote; Codex lo ejecuta al autorizarse. PASS solo con lectura propia permitida, otra persona mismo tenant denegada, otro tenant denegado y mismo tree SHA/exit 0. | No fabricar 404 ni conceder rol nuevo; no elegir el resultado cómodo. |
| **P1 — Regresión de seguridad focal** | Semántica `Cache-Control` en dos aserciones; pruebas A→B lectura/escritura, PAT válido/revocado/expirado, membership activa/revocada en DB/HTTP donde exista contrato; ejecutar las tres pruebas fallidas y regresiones directas. | Logs crudos saneados con test names y expected/actual; **una** suite DB completa al final si cambió el contrato consumidor y el ambiente está disponible, no 10 suites. Meta `156/156` del árbol final SOLO si realmente se ejecuta. | No bajar `private`/`no-store`, no modificar `phpunit.xml` fail-closed ni abrir B19/B20. |
| **P2 — B13/B14 y kiosco Android real** | C04 candidato nuevo con 1.000 hechos RAW `requestId` si sigue siendo gate obligatorio, sync/receipts/feed/pull por cursor; APK SHA/firma instalado y arranque estable; atribuir ANR por proceso, C10 captura local completa; C07 portable solo tras decisión contractual. | Evidencia Android real por SHA, SQLCipher/HTTP/MariaDB, capturas legibles/QA separado. El histórico `requetId` permanece FAIL documentado. | No normalizar `requetId` para pasar, no reinstalar app sobre datos cifrados ajenos, no afirmar arranque por render. |
| **P3 — Identidad comercial B15/B16** | Resolver OD02 vínculo/revocación empleado↔cuenta, OD04 sesión/login web, roles/tenancy B13, canal de invitación y auth ya existente; E2E de usuario legítimo. | Contrato aprobado por propietario + revisión legal/seguridad donde aplique; pruebas de PAT/revocación, tenant A/B, web navegador real y Flutter cliente. | No segundo login/SPA/motor de identidad, no `actingAs` como login comercial. |
| **P4 — Verticales RR. HH. B17–B20** | OD03 roles HR y acciones por empresa/sede; B17 solicitudes/ledger, B18 estimación informativa con revisión laboral, B19 documentos reales con almacenaje privado/antimalware cuando esté disponible, B20 ATS y CV bajo OD05/OD06/OD07. | Flujo positivo autorizado y negativos cross-tenant; datos ficticios antes del permiso; UAT con actor; evidencia exacta de storage/escáner o `BLOCKED_EXTERNAL`. | No llamar nómina legal a estimador; no convertir `Storage::fake` en storage productivo; no usar CV reales sin política. |
| **P5 — H9 / B21 aceptación integral** | Mapa de 110+ escenarios de SPEC V5 **solo como candidato hasta aprobar alcance**, seguridad, amenazas, rendimiento, offline/sync, hardware, accesibilidad, UX con humanos, evidencia L5 independiente en mismo árbol/build. Reusar PASS scoped previos con SHA y capa sin reejecutar por ritual. | Matriz con fuente/versión/entorno, defectos P0/P1 cerrados, checklist de pruebas reales de usuarios, no GO por simple conteo. Revisores: ChatGPT + propietario/QA independiente. | No declarar global PASS por 156 PHPUnit o por migraciones DB. |
| **P6 — Preparación y B22** | Aprobaciones OD01–OD08, respaldo recuperable autorizado, restauración de muestra y runbook; hosting, firma APK, tiendas, monitoreo/rollback/billing, revisión jurídico-contable y GO expreso. | `OWNER_GO=ESCRITO`, evidencia de seguridad/privacidad y backup validado, rollback ensayado sobre entorno propio, release etiquetado. | No push/merge/deploy/tienda/facturación por inferir autorización de QA. |

**Reglas de eficiencia:** si una puerta está bloqueada por contrato, avanzar solo en trabajo independiente seguro y etiquetarlo; no abrir permisos provisionales para conseguir PASS. Un solo bloque Codex de tamaño suficiente cuando corresponda, un ZIP con todos los logs/diffs/baselines y SHA, revisión del director una sola vez sobre evidencia NUEVA. Las pruebas históricas permanecen válidas únicamente para su árbol, build y capa originales. No inventar porcentaje del producto: `PRODUCT_READY_PERCENT=NO_ESTIMABLE`.

## F. Especificación operativa predecidida del PRÓXIMO lote focal (NO es prompt autorizado aún)

**LO_HECHO_CHATGPT:** ZIP B21 auditado, GH sincronizado, fallos priorizados, esta revisión y plan. **LÍMITE_REAL:** no accedo al checkout, PHP runtime, MariaDB Docker ni stdout crudo del PC D. **OBJETIVO_CODEX FUTURO:** resolver 200/404 sin adivinar, semántica de headers y negativos A/B/PAT en UNA ejecución. **REQUISITOS:** identificación SHA/tree y prueba exacta, fixtures ficticios, dos scopes tenant/persona, evidencia de proceso aislado y suite conjunta, solo usar MariaDB Jornato YA creada tras verificar que su red/puerto siguen libres, no otras redes, no reinstalar. **BASE:** `D:\codex\Jornato` WIP, rama/HEAD reales a registrar, no asumir que la base remota incluye WIP. **NO TOCAR:** `main`, PR #1/#2 del producto, Hostinger, otros Docker/AVD, production, secretos, B19/B20 DENY-ALL, phpunit.xml fail-closed. **QA:** cuatro grupos de escenarios: 1) propio/same-company-other/A→B, 2) revocación PAT y membresía, 3) cache headers por token, 4) regresión 3 fallos y una suite final si es imprescindible. **CIERRE:** log + caso reproducible + patch byte-exact si hay código cambiado + 1 ZIP manifest, statuses por capa, `NEXT_OWNER=CHATGPT_DIRECTOR`.

**Orden de diagnóstico recomendada para no perseguir la cola:** (i) snapshot no destructivo de 3 fallos y runner; (ii) comprobar propietario vs otro usuario, empresa y membership; (iii) reproducir aislado → pareja de tests que lo precede → clase de tests; (iv) aislar transacción/guard/Cache; (v) fijar causa; (vi) único arreglo pequeño si está autorizado; (vii) negativos A/B+PAT; (viii) una regresión final; (ix) ZIP. **No modificar código en ausencia de reproducción y contrato existente.**

## G. Recovery universal: uso del complemento al iniciar otro chat

1. Abrir **el Handoff principal** `JORNATO_RECOVERY_HANDOFF_2026-11-15_B21_IPAM_DB_REAL_3_FALLOS.md` o su equivalente `docs/JORNATO_RECOVERY_HANDOFF_ACTUAL.md` en GitHub; después leer **este complemento**. No reemplazar el Handoff original: proporciona historia de contrato y estados completos.
2. Tener disponible el **ZIP primario** `JOR-B21-IPAM-RECOVERY-20261115-UNICO.zip`, SHA256 `C51440AB28DD218F7A6C6EA35751DAA500B6FC67F45F6823FDD56DB9459E307B`, solo si hay que verificar logs/artefactos. No adjuntar toda historia B13–B21 por costumbre.
3. Confirmar en GitHub **solo** si el checkpoint cambió después de `ad9420906dcf2ba4b38a7141467f3b28816f10a4` o existe nuevo ZIP/local WIP que modifique NEXT; `main` y PR #2 son documentación, no prueba de D. Si hay una orden Codex más reciente, prevalece esa evidencia con autor y fecha, no lanzar tarea paralela.
4. `NEXT_OWNER=CHATGPT_DIRECTOR`. **No hay prompt Codex vigente**; no emitirlo automáticamente por estar referido aquí. Si el usuario solicita continuar/desarrollar y autoriza un lote, crear exactamente uno para cerrar B17 + A/B/PAT+headers, sin repetir IPAM/migraciones/carreras B19/B20. Después del ZIP, el director adjudica exclusivamente lo nuevo.
5. Si falta el checkout/SQL, los límites reales son `WORKTREE_LOCAL=NOT_VERIFIED`, `TEST_RAW=UNAVAILABLE_FROM_ZIP`, `B17_ROOT=UNKNOWN`. No inventar arreglos, no declarar fuga confirmada ni restaurar indebidamente archivos del historial. Si un contrato de propietario falta, etiquetar `BLOCKED_CONTRACT` y hacer trabajo independiente seguro.

## H. Auditoría de integridad documental del complemento (diez controles, ejecución una sola vez)

| ID | Control | Resultado |
|---|---|---|
| Q01 | El seed permite conocer último producto, ZIP y NEXT en 30 segundos | PASS |
| Q02 | Handoff principal vs complemento sin órdenes contradictorias | PASS: NEXT=ChatGPT, sin orden Codex vigente; actividad local no verificada |
| Q03 | Último ZIP/manifest y límites de evidencia correctos | PASS documental, runtime Codex reportado |
| Q04 | Github `main`/PRs vs WIP D separados | PASS |
| Q05 | Seis leyes y 20 pasadas específicas reflejadas | PASS documental; 120 juicios |
| Q06 | B17 200/404 conservado sin presuponer causa | PASS, riesgo P0/P1 abierto |
| Q07 | Dos Cache-Control no invisibilizados ni relajados | PASS, contrato a comprobar |
| Q08 | OD01–OD08 y B21/H9/B22 con GO distinto | PASS |
| Q09 | Protección Docker, WIP y secreto dentro del relevo | PASS en instrucciones, no ejecución local |
| Q10 | Ruta concreta al siguiente hito sin otra auditoría del mismo ZIP | PASS de simulación documental |

**Estado final del suplemento:** `RECOVERY_COMPLEMENT=COMPLETE_DOCUMENTAL`, `VERDUGO=10/10`, `JUEZ=10/10`, `L1_L6_JUDGEMENTS=120`, `TESTS_NEW=NOT_RUN`, `B17_ACCESS=NO_GO_UNTIL_CAUSE`, `IPAM=PASS_SCOPED_HISTORICAL`, `SUITE=153/156_EXIT_1`, `B21_GLOBAL=NOT_APPROVED`, `RELEASE_APPROVED=NO`, `CODEX_NEW_ORDER=NONE`, `NEXT_OWNER=CHATGPT_DIRECTOR`.

# 🚨🚨 SIGUE CHATGPT DIRECTOR 🚨🚨

**PRÓXIMO:** CONVERTIR ESTE DIAGNÓSTICO EN UN ÚNICO BLOQUE TÉCNICO FOCAL PARA CODEX LUNA **SOLO CUANDO SE AUTORICE**, PRIORIZANDO EL 200/404 DE B17, SEGURIDAD A/B, CICLO PAT Y CACHE-CONTROL. NO SE EJECUTA IPAM DE NUEVO. NO HAY RELEASE.