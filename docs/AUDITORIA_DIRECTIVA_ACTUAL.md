# JORNATO — AUDITORÍA ADVERSARIAL B19-S1 V1 → V2: 10 VERDUGO, 10 JUEZ, 120 JUICIOS L1–L6

**Corte:** 2026-11-14 (America/Bogota). **Director:** ChatGPT. **Alcance:** calidad de la ORDEN B19 todavía no ejecutada, no nueva QA B18 ni certificación comercial. **Próximo ejecutor:** Codex Luna.  
**Archivo sometido a crítica:** `CODEX_LUNA_JORNATO_B19_S1_V1_MACROBLOQUE_EXPEDIENTES_DOCUMENTOS_PRIVADOS_PLANTILLAS_FIRMAS_QA_ZIP_20261114.md`. **Nueva orden V2:** `CODEX_LUNA_JORNATO_B19_S1_V2_MACROBLOQUE_DOCUMENTOS_PRIVADOS_ATOMICO_IDEMPOTENTE_ZIP_UNICO_20261114.md`.

## 1. Qué se leyó y qué NO se pudo verificar

- **Fuente directa:** el Markdown original B19 V1 completo de 25.383 bytes, §1–§10 y O01–O42. Se verificó que B19 NO tiene entrega de ejecución al presente corte. La V2 conserva **textualmente los 42 oráculos O01–O42** del prompt V1 (sin renumerar, quitar o alterar expectativas).
- **Fuentes directas documentales:** GitHub `sierraglobalcompany-rgb/Jornato` rama documental `docs/pingponglaw-l1-l6-canon-84e961c`, `docs/JORNATO_CONTINUIDAD.md`, `docs/CODEX_LOTE_ACTUAL.md`, `AGENTS.md` y canon `sierraglobalcompany-rgb/PingPongLaw` fijado SHA `84e961cadf482d234f4c0ee2ca60e8c7e9b388e8`. SPEC V5 MOD-11/UX-20 es fuente **candidata**, no autorización jurídica ni permisos técnicos aprobados.
- **Herencia de B18:** ZIP `JOR-B18-S1-V2-ESTIMADOR-LABORAL-20261114-UNICO.zip`, SHA `F7FF2C839097566CC8987AA246C02C916A73C68917093EFD485364E07A561944`. La revisión anterior confirmó replay 6/6 fuentes y fixtures PHP 11 checks independientes; B18 sigue `PARTIAL_HOST_OR_CONTRACT`. No se repitieron esas pruebas en esta auditoría B19.
- **No observado:** checkout vivo de `D:\codex\Jornato`, auth/Storage realmente activos allí, MariaDB QA, permisos HR aprobados, almacenamiento real privado/cifrado, escáner malware, productor PDF, proveedor de firma y build/navegador. **No afirmar B19 PASS, P0 explotado ni L5 runtime**. Las observaciones a continuación son **defectos del prompt/ausencias de instrucciones**, salvo que se indique claramente otro origen.

## 2. Resultado ejecutivo y correcciones materiales de V2

**VEREDICTO:** `B19_V1=REQUIRES_INSTRUCCIONES_CAUSALES`; `B19_V2=PROMPT_AUDITADO_LISTO_PARA_CODEX`; `B19_RUNTIME=NOT_EXECUTED`; `RELEASE_APPROVED=NO`.

**Ajustes que evitarán un B19-S2 correctivo:** clave de idempotencia y huella canónica (201/200/409); transacción DB **corta** que no cubre IO de archivos; manejo de colisiones de versiones y fallos; explicitación de crash y huérfano NO resuelto automáticamente; validación de bytes acotados **antes** de emitir descarga; prueba privada con `Storage::fake` distinguida de privacidad de despliegue; y matriz de 42 oráculos con `evidence_scope` para no fabricar PASS. Se conserva toda funcionalidad esencial B19 (checklist, plantilla QA, PDF condicionado, firma externa no verificada, descarga/documento). No se agregan colas, SaaS, frameworks ni auth.

**Regla judicial:** la corrección de un defecto de **instrucciones** no implica un defecto demostrado de **código**; no existe aún un código B19 ejecutado y compartido. No se declara «vulnerabilidad explotada» por un caso que todavía no se ha implementado.

## 3. Diez pasadas como VERDUGO — refutar la orden original

### V01 — Autoridad y no repetición

**Qué hice:** Inspeccioné §1–§3 de V1, la continuidad documental y el canon L1–L6. B19 sigue NOT_EXECUTED; B18 tiene 11 checks PHP independientes, pero no DB/portal real.

**Contraargumento / riesgo:** Una orden nueva podría repetir auditorías antiguas o tomar los acuerdos de SPEC V5 como permisos jurídicamente aprobados.

**Decisión justificada:** Dejar B13–B18 como evidencia heredada; B19 es el único desarrollo y el estado de contratos sigue bloqueado.

- **L1:** El núcleo documental usa Laravel y disk existentes, no rehace B18.
- **L2:** No se duplican las seis leyes en otro archivo de código ni una SPEC nueva.
- **L3:** No se atribuye un error hipotético a B18 para justificar cambios.
- **L4:** UX-20 es referencia de diseño, no licencia comercial.
- **L5:** Los 11 checks previos no certifican la nueva persistencia.
- **L6:** Una sola entrega B19 debe preceder a B20 sin S2 automático.

### V02 — Autorización e IDOR

**Qué hice:** Contrasté V1 §4 autorización, §6 negativos y O02–O10/O24. El gate HR y login web continúan sin contrato acreditado.

**Contraargumento / riesgo:** La frase «actingAs y QA» es insuficiente si Codex registra rutas abiertas o reusa owner/admin como HR.

**Decisión justificada:** V2 exige autorización por operación y tenant, y sin contrato no publica nuevas rutas; tests directos de service con contexto ficticio.

- **L1:** Una policy real existente es suficiente; no se construye otra auth.
- **L2:** No se copian roles inventados de B16/B17 al módulo documental.
- **L3:** La causa de acceso indebido es identidad/tenant, no un botón oculto.
- **L4:** La UI muestra RESTRICTED, no «Subir» operativo por defecto.
- **L5:** Unit/actingAs no certifican flujo comercial de acceso.
- **L6:** Gate cerrado permite desarrollar el owner sin otra discusión de login.

### V03 — Idempotencia con carrera

**Qué hice:** Leí V1 §4 «la operación debe ser idempotente» y O22 sin clave ni fingerprint ni UNIQUE definidos.

**Contraargumento / riesgo:** Dos subidas simultáneas podrían crear dos versiones, o una segunda petición distinta con mismo identificador recibir aceptación indebida.

**Decisión justificada:** V2 fija request UUID, fingerprint canónico, UNIQUE compuesto, respuesta 201/200/409 y relectura tras conflicto.

- **L1:** Índice en versión/operación existente antes que una tabla nueva.
- **L2:** No repetir el ledger de B17 ni usar un cache paralelo.
- **L3:** La UNIQUE DB y la relectura corrigen la carrera de raíz.
- **L4:** Una carga reintentada no crea duplicados visibles al empleado.
- **L5:** Mock secuencial NO equivale a carrera InnoDB PASS.
- **L6:** Un algoritmo único permite a Codex implementar sin diseñar otro protocolo.

### V04 — Transacción que engloba IO

**Qué hice:** Analicé V1 §4 «validar y reservar en transacción, escribir» y O20–O21. No hay regla sobre duración de locks.

**Contraargumento / riesgo:** Se podría mantener un bloqueo de fila durante una descarga lenta, deadlock o fallo de storage, afectando fiabilidad y rendimiento.

**Decisión justificada:** V2 recibe/valida/escribe key nueva antes, y limita DB::transaction a lock+inserts+evento.

- **L1:** Key privada definitiva evita staging distribuido y rename adicional.
- **L2:** No instalar colas/jobs/compensadores generales.
- **L3:** Separar IO y locks ataca latencia y contención real.
- **L4:** La UI informa ERROR, no documento exitoso antes del commit.
- **L5:** DB real con fault injection queda NOT_RUN sin entorno aislado.
- **L6:** No crear una fase «arquitectura de archivos» distinta de B19.

### V05 — Ventana de caída y huérfanos

**Qué hice:** Confronté exigencia V1 de compensación y la realidad de filesystem y DB no atómicos.

**Contraargumento / riesgo:** El proceso puede morir después de escribir bytes y antes de COMMIT: try/catch no garantiza limpiar ese huérfano.

**Decisión justificada:** V2 delimita delete solo de key propia en fallo capturable, y deja reconciliación de crash pendiente sin barridos destructivos.

- **L1:** Una recuperación conservadora es mejor que una infraestructura nueva.
- **L2:** No crear tarea programada de limpieza ni logs con ruta sensible.
- **L3:** No prometer transacción distribuida corrige el supuesto falso.
- **L4:** No mostrar éxito si solo existe el objeto sin evento.
- **L5:** No hay prueba legítima de cero huérfanos ante kill -9.
- **L6:** La limitación queda en B21 sin detener el vertical sintético.

### V06 — Versionado monotónico y alias

**Qué hice:** Revisé V1 O17–O19, §5.C y ausencia de lockForUpdate explícito.

**Contraargumento / riesgo:** Una prueba de v1→v2 secuencial no certifica orden ni evita sobrescribir al aumentar concurrencia.

**Decisión justificada:** V2 fija lock sobre Document para asignar `version_no`, UNIQUE(doc_id,version_no), nueva key y no UPDATE de versiones.

- **L1:** Reusar DocumentVersion existente basta; no snapshot ledger extra.
- **L2:** No copiar binarios para «versionar» una key compartida.
- **L3:** UNIQUE más bloqueo atiende la causa, no reintentos ciegos.
- **L4:** Versiones anteriores siguen disponibles solo a lector autorizado.
- **L5:** Concurrencia 2 conexiones DB requerida para PASS de carrera.
- **L6:** Un test sintético positivo más DB gate evita B19-S2 por ceremonia.

### V07 — Descarga íntegra y memoria

**Qué hice:** Comparé V1 §5.D «hash antes de entregar» y su ausencia de un límite real al leer.

**Contraargumento / riesgo:** Codex podría usar `Storage::get()` sin tope, producir O25 PASS con archivo pequeño y exponerse a consumo arbitrario ante un objeto alterado.

**Decisión justificada:** V2 fija límite de bytes 2 MiB QA, buffer max+1, hash previo a cualquier emisión y fallo cerrado.

- **L1:** Buffer acotado es razonable en el límite QA; no streamer complejo.
- **L2:** No crear una segunda capa de caché o CDN para descarga.
- **L3:** La vulnerabilidad reside en lectura no acotada, no en la cabecera HTTP.
- **L4:** Archivo corrupto no provoca descarga parcial al usuario.
- **L5:** Fake Storage prueba bytes, no disponibilidad real ni reposo cifrado.
- **L6:** Prueba focal del límite sustituye auditoría de todo el servidor.

### V08 — Privacidad, MIME y antimalware

**Qué hice:** Analicé §5.B/O12–O16/O37 y la tentación de tomar magic `%PDF` como seguridad.

**Contraargumento / riesgo:** Un PDF con extensión válida no está escaneado; rechazar TODO Unicode puede romper nombres legítimos, y el filename no debe ser key.

**Decisión justificada:** V2 separa filename de presentación y key privada, exige contenido y tamaño acotado, deja malware/PHI/retención cerrados.

- **L1:** Un fixture estructuralmente válido basta para funcionalidad QA.
- **L2:** No instalar scanner o PDF vendor solo para decir PASS.
- **L3:** El problema real es exposición no autorizada, no la presencia de Unicode seguro.
- **L4:** Display Unicode seguro puede ser legible y escapado.
- **L5:** MIME/finfo no demuestra malware-free ni cifrado.
- **L6:** Se avanza con datos ficticios y sin uploads comerciales.

### V09 — Firma, PDF y entrega

**Qué hice:** Revisé V1 §5.E–F y O29–O36 frente a SPEC V5 MOD-11.

**Contraargumento / riesgo:** Un hash/preview o filename signed.pdf puede confundirse con firma verificada, y «solicitar entrega» con acuse.

**Decisión justificada:** V2 mantiene template QA y versiones, PDF sólo si productor existente probado, copy UNVERIFIED y delivery sin ACK.

- **L1:** Reusa render Blade, no construir PKI ni tercero de firma.
- **L2:** No duplicar plantillas legales ni módulo de mensajería.
- **L3:** Separar los hechos corrige el falso vínculo entre hash y firma.
- **L4:** La interfaz muestra BORRADOR/NO VERIFICADO inequívocamente.
- **L5:** Sin proveedor/firma, firma real siempre NOT_RUN.
- **L6:** B19 produce evidencia útil y permite seguir B20 sin inventos.

### V10 — Custodia, matriz y falsos PASS

**Qué hice:** Contrasté O01–O42 con estados permitidos y que el ZIP B18 no contiene código local íntegro en GitHub.

**Contraargumento / riesgo:** «42 oráculos» puede confundirse con 42 ejecuciones; reproducir sólo git HEAD perdería untracked. Storage::fake no acredita privacidad del disk real.

**Decisión justificada:** V2 preserva 42 IDs, añade evidence_scope, copia preestados binarios, ZIP único y gate production storage separado.

- **L1:** Una tabla de test y un manifest son suficientes.
- **L2:** Sin 42 suites duplicadas ni segundo paquete de evidencias.
- **L3:** La raíz del falso PASS es nivel de evidencia mal expresado.
- **L4:** Estados UI PASS y BLOCKED se distinguen.
- **L5:** L5 externo no lo crea el propio Codex con sus logs.
- **L6:** Permite aceptar B19 acotado y pasar al siguiente módulo.

## 4. Diez pasadas como JUEZ — contradecir soluciones excesivas

### J01 — ¿Suspender B19 hasta login HR real?

**Qué hice:** Contrapuse el riesgo V02 al hecho de que el núcleo documental admite pruebas directas con sujeto sintético sin rutas comerciales.

**Contraargumento / riesgo:** Suspender toda implementación repetiría el bloqueo B16/B17 sin mejorar seguridad.

**Decisión justificada:** Rechazo suspensión; aceptar servicio+tests sin rutas públicas y conservar WEB_REAL=BLOCKED.

- **L1:** Implementar dueño del dato sin segundo login.
- **L2:** No inventar permiso «document.manage» si no está aprobado.
- **L3:** El bloqueo es frontera de acceso, no ausencia del servicio.
- **L4:** La UI bloqueada no promete capacidad que carece.
- **L5:** Feature tests sintéticos no prueban login real.
- **L6:** Seguimos con B19 sin crear B16-S2.

### J02 — ¿Añadir microservicio y cola de almacenamiento?

**Qué hice:** Consideré la ventana de inconsistencia V04–V05 y opciones de saga/outbox/jobs.

**Contraargumento / riesgo:** Esas piezas serían infraestructura extra sin contrato/entorno QA y complicarían el WIP.

**Decisión justificada:** Rechazo; key nueva, transacción DB corta, delete compensatorio y reserva de crash.

- **L1:** Transacción+servicio existentes son suficientes.
- **L2:** No replicar outbox B14 para cargas privadas.
- **L3:** El crash no se resuelve con una cola no probada.
- **L4:** Estado UNAVAILABLE es preferible a falso «Guardado».
- **L5:** No certificar recuperación tras muerte del proceso.
- **L6:** No posponer B20 para construir infraestructura especulativa.

### J03 — ¿Rechazar cualquier PDF sin antivirus?

**Qué hice:** Opondría «no malware-free» a la exigencia de un recorrido vertical verificable.

**Contraargumento / riesgo:** Bloquear también PDFs sintéticos impediría probar storage, hash y versiones.

**Decisión justificada:** Permitir SOLO fixtures sintéticos aislados; negar producción hasta controles aprobados.

- **L1:** Utilizar PDF fixture pequeño de test sin nuevos servicios.
- **L2:** No instalar scanner como parche al falso PASS.
- **L3:** La amenaza surge de aceptar archivos no confiables reales.
- **L4:** El usuario ve estado no verificado, nunca «clean».
- **L5:** QA fake no valida antivirus.
- **L6:** Se entrega el flujo, gate comercial abierto.

### J04 — ¿Usar checksum de descarga en streaming ilimitado?

**Qué hice:** Evalué el trade-off de memoria V07 y necesidad de asegurar bytes antes de primera emisión.

**Contraargumento / riesgo:** Transmitir mientras calcula hash expone bytes parciales si el final es corrupto.

**Decisión justificada:** Para el límite QA fijado, buffer acotado y hash previo; mayores archivos quedan BLOCKED.

- **L1:** No crear sistema multipart ni temp-file complejo.
- **L2:** No segundo algoritmo hash diferente en API y servicio.
- **L3:** Se corrige la emisión prematura desde su origen.
- **L4:** El usuario no recibe un PDF corrupto parcialmente.
- **L5:** El test de contenido grande necesita medir bytes, no sólo header.
- **L6:** Permite cierre focal sin expandir a infraestructura masiva.

### J05 — ¿Publicar endpoints bajo APP_ENV testing?

**Qué hice:** Contrapuse facilidad de QA con exposición de rutas en build incorrecto.

**Contraargumento / riesgo:** Un route «temporal» podría sobrevivir a configuración y exponer documentos bajo un flag.

**Decisión justificada:** Rechazo; tests del servicio y Feature aislados, rutas sólo con guard+policy reales.

- **L1:** No nueva auth ni middleware bypass.
- **L2:** No dispersar cierres test-only por docenas de rutas.
- **L3:** Evitar ruta insegura corrige exposición en su propietario.
- **L4:** CTA deshabilitada y explicación visible.
- **L5:** Browser real no probado con actingAs.
- **L6:** No exigir deploy ni acceso a red para B19.

### J06 — ¿Instalar librería PDF, firma o cifrado nuevo?

**Qué hice:** Comparé alcance MOD-11 y gates actuales de firma, productor y encriptación.

**Contraargumento / riesgo:** Una biblioteca añadida solo para pasar tests no sustituye verificación legal, clave ni política de acceso.

**Decisión justificada:** Rechazo instalaciones; entregar preview HTML versionada y copia externa unverified si faltan productores.

- **L1:** Reusar sólo proveedor existente y probado.
- **L2:** No duplicar otras bibliotecas del repositorio.
- **L3:** La causa del bloqueo es aprobación/integración, no clase faltante.
- **L4:** Etiqueta BORRADOR evita falsa validez.
- **L5:** PDF/sello/cifrado real requieren pruebas distintas.
- **L6:** B19 sigue productivo sin inventar ley ni vendor.

### J07 — ¿Crear una tabla por cada función documental?

**Qué hice:** Revisé entidades de V1 y el riesgo de tablas para checklist, plantilla, delivery, firma, idempotencia, auditoría.

**Contraargumento / riesgo:** Nueve tablas nuevas aumentarían migraciones sin consumidor comercial validado.

**Decisión justificada:** Rechazo; reutilizar Document/Version/Event, mantener catálogos QA ligeros salvo necesidad demostrada.

- **L1:** Máximo número de tablas es el mínimo técnico real, no un número fijo.
- **L2:** No duplicar datos en otra bitácora de evento.
- **L3:** Únicamente FK+UNIQUE corrigen duplicados.
- **L4:** La UI puede leer la proyección sin persistir estados falsos.
- **L5:** Migraciones DB siguen NOT_RUN si no hay instancia.
- **L6:** Entregar vertical suficiente sin «modelo perfecto» previo.

### J08 — ¿Convertir los 42 oráculos en 42 tests duplicados?

**Qué hice:** Examiné si cada criterio requiere ejecución independiente o si varias expectativas comparten un test real.

**Contraargumento / riesgo:** Exigir 42 suites aumentaría ruido y daría incentivos a mocks triviales.

**Decisión justificada:** Conservar los 42 criterios y una batería pequeña con evidencias trazables a cada fila.

- **L1:** Una prueba puede cubrir varios oráculos si demuestra sus expectativas.
- **L2:** No repetir php -l B18 ni pipelines anteriores.
- **L3:** Un solo test causal por error, no parches para la matriz.
- **L4:** Los estados no ejecutados son honestos con usuario.
- **L5:** Cada PASS necesita comando+log+scope; no un texto «OK».
- **L6:** Entrega de un ZIP, no 42 entregables aislados.

### J09 — ¿Exigir MariaDB/Android/browser para aceptar núcleo B19?

**Qué hice:** Contrasté falta de `.env.testing` y el scope Storage fake/test de código.

**Contraargumento / riesgo:** No hay infraestructura aislada acreditada; Docker compartido está prohibido por custodia.

**Decisión justificada:** Rechazo el falso gate de bloqueo total; PASS host acotado posible, DB/browser/Android siguen pendientes.

- **L1:** Tests PHP/Storage fake aprovechan recursos disponibles.
- **L2:** No crear MariaDB/docker-compose extra para B19.
- **L3:** El problema es entorno, no defecto demostrado del algoritmo.
- **L4:** UI QA puede ser evaluada por render host sin promesa comercial.
- **L5:** PASS_RUNTIME_REAL exige su entorno exacto y L5 independiente sigue NOT_RUN.
- **L6:** La ausencia de QA de entorno no desencadena B19-S2 automático.

### J10 — ¿Volver a auditar B19 V2 antes de ejecutarla?

**Qué hice:** Contrapuse cada cambio V2 a V1, conservando O01–O42 sin cambios y el siguiente vertical B20 definido.

**Contraargumento / riesgo:** Otra ronda sin nueva evidencia sería pingpong; pero no debemos llamar V2 PASS de runtime.

**Decisión justificada:** Aprobar la orden V2 documentalmente, pasar a Codex y exigir paquete único.

- **L1:** La solución mínima ya está especificada por owner y algoritmo.
- **L2:** No generar V3, ADR paralelo ni segunda lista de leyes.
- **L3:** No existe hallazgo de producto B19 aún porque NO fue ejecutado.
- **L4:** El resultado comercial sigue bloqueado aunque la UI funcione en host.
- **L5:** La verificación externa ocurrirá al recibir ZIP y observar evidencia.
- **L6:** NEXT_OWNER=CODEX_LUNA, después CHATGPT→B20.

## 5. Matriz de trazabilidad V1→V2 y decisiones fijas

| Concern V1 | Cambio V2 | Cómo se prueba o queda pendiente | Estado antes de Codex |
|---|---|---|---|
| Idempotencia genérica de ingesta | UNIQUE `(company_id,actor_id,request_id)` + fingerprint canónico y 201/200/409 | Intento repetido mismo hash, cambio de payload, dos transacciones DB aisladas | `SPEC_FIXED`, `DB_RUN=NO` |
| DB + storage | Key privada nueva antes de transacción corta; borrar únicamente objeto propio en fallo | Fallo storage, fallo DB, inyección crash reconocida como limitación | `SPEC_FIXED`, `ATOMIC_CROSS_STORE=NO` |
| Concurrencia versión | `lockForUpdate` del documento + UNIQUE(version_no) y retry acotado | Dos conexiones MariaDB QA si existe; si no NOT_RUN | `SPEC_FIXED`, `DB_RUN=NO` |
| Descarga y checksum | Límite 2 MiB QA, buffer `max+1`, hash antes de salida, headers privados | Bytes reales, corrupto/missing/grande sin emisión parcial | `SPEC_FIXED`, `HOST_RUN=NO` |
| `Storage::fake` | Nivel de evidencia fake ≠ privacidad/cifrado del disk de producción | Fake Storage host + revisión config, product audit aparte | `SPEC_FIXED`, `PRODUCTION_STORAGE_AUDIT=NO` |
| PDF/plantilla/firma | Borrador versionado, PDF existente solo si verificado, copia externa UNVERIFIED | Prueba XSS, versiones, guard, no false signed/delivered | `SPEC_FIXED`, `LEGAL/SIGNATURE=BLOCKED` |
| 42 oráculos | Mismos O01–O42 + scope/command/fixture por criterio | Matriz no infla PASS a partir de mocks | `SPEC_FIXED`, `TESTS_B19=NOT_RUN` |
| WIP y handoff | Baselines tracked/untracked, patch byte-exacto, un ZIP y continuidad docs-only | Control externo al recibir entrega | `NEXT_OWNER=CODEX_LUNA` |

### 5.1 Límites de aceptación no negociables

No hacer release ni afirmar B19 comercial con `actingAs`, fixture PDF o fake disk. El status `PASS_HOST_FAKE_STORAGE_ONLY` significa que se probaron bytes, hashes y acceso simulado local, **no** que haya cuenta/permiso reales, cifrado at rest, antimalware, firma jurídica, consentimiento o entrega efectiva. Se preservan restricciones B13–B18 y el plan B20 reclutamiento → B21 QA independiente/integración/seguridad → B22 sólo GO del propietario. **No abrir B19-S2 automáticamente** por ausencia de MariaDB, proveedor PDF o login real.

## 6. Contrato de GitHub y de transferencia de chat

El **único prompt** ejecutable es V2, debe guardarse como texto completo en `docs/CODEX_LOTE_ACTUAL.md` del PR #2 documental; esta auditoría completa en `docs/AUDITORIA_DIRECTIVA_ACTUAL.md`; `docs/JORNATO_CONTINUIDAD.md` debe contener los hashes, la versión vigente y los gates. `main` y el WIP D: siguen sin escritura ni despliegue. Si el chat termina, leer primero esas tres rutas y la última entrega ZIP nueva. No volver a leer y reauditar B18 ni regenerar la orden V1 por costumbre.

**ÚNICO ZIP esperado:** `JOR-B19-S1-V2-PRIVATE-DOCUMENT-VERTICAL-20261114-UNICO.zip`. Codex incluirá todos los cambios y pruebas en ese archivo, no reportes dispersos.

**SIGUE CODEX LUNA.**