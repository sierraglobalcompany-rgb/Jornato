# JORNATO B20-S1 — AUDITORÍA ADVERSARIAL V1→V2: 10 VERDUGO + 10 JUEZ · 120 JUICIOS L1–L6

**Fecha:** 2026-11-15 (America/Bogota). **Director:** ChatGPT. **Estado:** B20 NOT_EXECUTED; B19 PARTIAL_HOST_OR_CONTRACT; RELEASE_APPROVED=NO. **Resultado:** ejecutar B20-S1 V2, no V1. **No se realizó QA de B20 ni se inspeccionó el checkout D: directamente.**

## 0. Autoridad y alcance exactos

- Archivo base inspeccionado íntegramente: `CODEX_LUNA_JORNATO_B20_S1_V1_MACROBLOQUE_ATS_VACANTES_POSTULACIONES_ENTREVISTAS_SEGURAS_ZIP_UNICO_20261114.md`, SHA256 `04d5cd56eb2f6048f78e2ed76ab106b32dfad91dfed8759e9a31bd775b18cbca`, 120 líneas. La misma V1 estaba en la rama documental GitHub como `docs/CODEX_LOTE_ACTUAL.md`, blob Git `8a4893f252630fd2d3b19755b82871b9a39ee606` al inicio de esta revisión.
- Evidencia B19 independiente heredada (NO reejecutada hoy): ZIP SHA `4C906785C63B500B76B7088D5B65261CEB062BF7DB0EF70F4ADEE3357243B44D`; CRC/manifest 69/69, patch 17/17 y PHP lint 17/17 se verificaron en cierre B19. Sus 16 PHPUnit/96 assertions constan **en logs de Codex**, no son tests independientes de B20. Se leyó en el ZIP B19 `SOURCES/server/app/Providers/AppServiceProvider.php`, `CONTRACT_MATRIX.md`, `REUSE_DECISIONS.md` para comprobar contratos reales disponibles: B19 tiene binding DENY-ALL y disco privado `private-files` (resultado productivo todavía no validado).
- SPEC V5 `MOD-12`, `UX-21`, `B20-H8` define vacantes, postulaciones, entrevistas, candidatos y pase a empleado; documento **candidato**, no permiso legal. Canon PingPongLaw L1–L6 fijado en GitHub `sierraglobalcompany-rgb/PingPongLaw` commit `84e961cadf482d234f4c0ee2ca60e8c7e9b388e8`. B20 no había entregado ZIP; no se alegan defectos runtime. Resto B13–B19 cerrado en alcance focal y NO reauditable por costumbre.
- **Prompt definitivo V2:** `CODEX_LUNA_JORNATO_B20_S1_V2_MACROBLOQUE_ATS_ESTADOS_IDEMPOTENCIA_AGENDA_SEGURA_ZIP_UNICO_20261115.md`, SHA256 `b8c1ac379cb1c3705f39ecc4286f5d3a65041242eb098bc0253434cd4304a5ea`. Conserva **literalmente O01–O40 de la V1** en su sección 5; los cambios son especificaciones ejecutables, no cambio de los gates establecidos.

## 1. Método — se ejecutan 10 pasadas VERDUGO y después 10 JUEZ

En V01–V10 intenté falsar la viabilidad/seguridad del prompt original usando pasajes y contrato B19. En J01–J10 cuestioné mis propias correcciones por exceso, verificando si lo mínimo suficiente hace avanzar el producto. Cada pasada reporta: **qué se inspeccionó, evidencia, acusación adversarial, decisión justificada y seis decisiones concretas L1–L6**. Son **20×6=120 juicios documentales, nunca pruebas ejecutadas del software**. Para comprobar trabajo ya hecho se utilizó el checkpoint GitHub y no se repitieron tests de B13–B19.

## 2. Diez pasadas VERDUGO (primera ronda)

### V01 — Orden y jerarquía de evidencia
**Qué inspeccioné:** La V1 es la orden activa de GitHub; B19 fue el último ZIP y no hay entrega B20.
**Evidencia:** GitHub docs/CODEX_LOTE_ACTUAL.md blob 8a4893; V1 líneas 1–14; B19 ZIP SOURCES/CONTRACT_MATRIX.
**Contraargumento/adversario:** Se podía confundir el dictamen de B19 con pruebas de B20 y ordenar otra ronda sobre B13–B19.
**Fallo y justificación:** No reauditar bloques cerrados; B20 será una única ejecución productiva QA sintética, sin declarar PASS antes del ZIP.

- **L1:** Conservar Laravel y el monolito; ningún cambio de stack por auditoría documental.
- **L2:** No reciclar 16 pruebas B19 como 16 pruebas de B20 ni copiar sus modelos.
- **L3:** Verificar solo dependencias que B20 consuma: companies, private-files y provider.
- **L4:** La interfaz ATS no puede mostrar hechos de negocio no construidos.
- **L5:** No existe aún runtime B20; etiquetar los 120 juicios como documentales.
- **L6:** Evitar una B20-S0 de solo diagnóstico y enviar un solo lote.

### V02 — Custodia del WIP y baselines
**Qué inspeccioné:** El WIP local no está en main; las 199 rutas B19 eran un conteo histórico.
**Evidencia:** V1 líneas 25–31, 61–65, O01/O39; reporte B19 GIT_CUSTODY.
**Contraargumento/adversario:** Si Codex reconstruye desde main o limpia untracked, pierde trabajos aceptados aunque el patch B20 pase.
**Fallo y justificación:** Exigir hash de cada ruta preexistente y baselines auténticos, aislando archivos B20, sin reset ni stage.

- **L1:** Una captura PRE/POST simple sustituye nuevos sistemas de backup improvisados.
- **L2:** No duplicar el repo completo en el ZIP; guardar solo fuentes del lote.
- **L3:** No corregir divergencia WIP clonando main encima.
- **L4:** Si una pantalla previa cambia, registrar su regresión visible focal.
- **L5:** Diferenciar custodia reportada por Codex de inspección directa de D:.
- **L6:** Un solo replay byte-exacto, no cadenas de verificaciones repetidas.

### V03 — Permisos ATS frente a rol owner
**Qué inspeccioné:** La ausencia de permiso de reclutamiento no equivale a permiso implícito de dueño.
**Evidencia:** V1 líneas 18–22, 41–44, O04/O16; B19 AppServiceProvider real contiene DenyAllDocumentAccessAuthorizer.
**Contraargumento/adversario:** Autorizar por nombre de rol o activar QA desde variable web filtra candidatos entre tenants.
**Fallo y justificación:** Un solo authorizer ATS productivo DENY_ALL y authorizer synthetic solo por inyección de tests; cero rutas nuevas.

- **L1:** Una interfaz y una implementación DENY_ALL; nada de RBAC alterno.
- **L2:** Preservar bindings B19 intactos; no copiar permisos de documentos al ATS.
- **L3:** Cada consulta/comando revalida tenant y recurso, no solo menú oculto.
- **L4:** Blade debe expresar RESTRICTED sin botones de publicar o contratar.
- **L5:** Unit DI QA no demuestra autorización de IAM en servidor real.
- **L6:** Dejar contrato HR para la integración transversal B21.

### V04 — Estado de vacante y significado de publicación
**Qué inspeccioné:** READY_FOR_PUBLICATION era editorial, pero token podía parecer publicación pública.
**Evidencia:** V1 §3.3 líneas 45–49 y O08–O11/O31.
**Contraargumento/adversario:** Un token QA no debe crear una URL pública, ni DRAFT aceptar postulaciones, ni CLOSED mantener token utilizable.
**Fallo y justificación:** V2 define publicación editorial aislada y exige READY, token y contexto de test para submit interno.

- **L1:** Reutilizar tres estados de vacante sin entidad de publicación adicional.
- **L2:** No agregar endpoint QA público ni tabla extra de enlace.
- **L3:** Cerrar vacante revoca token de forma coherente con creación de postulación.
- **L4:** Mostrar READY como pendiente de publicar, nunca PUBLICADA.
- **L5:** Solo probar invitaciones en host sintético; sin rate limit real publicable.
- **L6:** Preservar O08–O11 sin cambiar sus textos de aceptación.

### V05 — Retiro y rechazo antes de entrevista
**Qué inspeccioné:** La secuencia de postulación era lineal y podía prohibir WITHDRAWN antes de la entrevista.
**Evidencia:** V1 §3.3 línea 47 y oráculos O17–O18.
**Contraargumento/adversario:** Aplicar la flecha literalmente bloquearía retirar una candidatura en SCREENING/RECEIVED_QA; un test feliz no lo detectaría.
**Fallo y justificación:** V2 fija tabla de transiciones: REJECTED/WITHDRAWN desde etapas no terminales, cierre irreversible; O17 literal preservado.

- **L1:** Una tabla de estados explícita elimina condicionales dispersos.
- **L2:** No crear una máquina de estados genérica reusable para todo Jornato.
- **L3:** Una decisión terminal no muta historial anterior y rechaza reingreso.
- **L4:** Retiro temprano se expresa con mensaje comprensible.
- **L5:** Prueba focal para retiro directo desde RECEIVED_QA, no inferir PASS por happy path.
- **L6:** Mantener los 40 oráculos sin renumeración ni relajar el gate.

### V06 — Derechos del titular distintos del workflow
**Qué inspeccioné:** La V1 pedía estado RIGHTS_REQUESTED que no figura en su máquina RECEIVED_QA→...
**Evidencia:** V1 línea 57 y O17/O30.
**Contraargumento/adversario:** Usar RIGHTS_REQUESTED como estado de postulación rompe transiciones y genera falsas solicitudes de borrado cumplidas.
**Fallo y justificación:** Registrar evento de derechos independiente del estado; retiro es acción distinta con request_id distinto.

- **L1:** Un evento existente basta; no tabla extra de solicitudes de derechos para QA.
- **L2:** No duplicar campos de privacidad en vacantes y entrevistas.
- **L3:** No borrar expediente o postulación sin política legal aprobada.
- **L4:** La interfaz indicará “petición registrada, no resuelta”, sin prometer eliminación.
- **L5:** El test verifica evento creado y estado original intacto.
- **L6:** Procesos reales de derechos pasan a B21 con aprobación jurídica.

### V07 — Token efímero y secreto en QA
**Qué inspeccioné:** La V1 exigía token consumible y a la vez prohibía imprimirlo en cualquier cuerpo.
**Evidencia:** V1 §3.3 línea 49 y O09/O10.
**Contraargumento/adversario:** Codex podía guardar el token en logs para simular uso, o inventar ruta de entrega para probarlo.
**Fallo y justificación:** V2 devuelve token una única vez solo en memoria al test DI, almacena hash y no lo serializa a HTTP/artefacto.

- **L1:** No usar vault de secretos ni tabla de tokens adicional.
- **L2:** Reutilizar CSPRNG, hash_equals y campos de vacancy.
- **L3:** Revocar, rotar o vencer deniega incluso con request_id conocida.
- **L4:** No renderizar URL pública ficticia ni token en pantalla.
- **L5:** Tests negativos de rotación y token entre vacantes; logs sin secreto.
- **L6:** No solicitar un sistema de email antes del cierre B20.

### V08 — Idempotencia en eventos y reintentos
**Qué inspeccioné:** El UNIQUE de recruitment_events no aclaraba si un comando podía crear más de un evento ni cómo reconstruir replay.
**Evidencia:** V1 §3.1 líneas 37–40, §3.3 línea 50, O12/O19.
**Contraargumento/adversario:** Dos eventos por mismo request_id violarían UNIQUE; reintento después de crear recurso podría duplicar aplicación.
**Fallo y justificación:** Una mutación lógica, un evento+outcome_ref+estado en una transacción; fingerprint determinista y replay seguro.

- **L1:** Una tabla de eventos sirve como registro de idempotencia; no crear quinta tabla.
- **L2:** No agregar event bus ni outbox por conveniencia.
- **L3:** Primero autorizar; mismo hash 200/replay, distinto 409; recuperar carrera por UNIQUE.
- **L4:** La UI no duplica tarjetas de postulaciones tras reintento.
- **L5:** SQLite/memoria prueba semántica serial, no carreras en InnoDB.
- **L6:** QA de dos conexiones se reserva si hay MariaDB aislada.

### V09 — Carreras en agenda entre distintas vacantes
**Qué inspeccioné:** La V1 pedía lock por vacancy/application pero también no solapar entrevistador en toda empresa.
**Evidencia:** V1 §3.4 líneas 51–53, O23/O25.
**Contraargumento/adversario:** Dos vacantes distintas pueden insertar entrevistas del mismo entrevistador sin bloquear la misma fila.
**Fallo y justificación:** V2 usa lock transaccional breve de fila `companies` por company_id para todas las operaciones de agenda, consulta global de solapes.

- **L1:** Un lock de fila existente evita nueva tabla de locks y advisory API.
- **L2:** No añadir otra agenda ni motor calendario externo.
- **L3:** La condición half-open rechaza solape y permite adyacencia; mismo candidato y entrevistador.
- **L4:** Mostrar hora local e IANA sin prometer notificación.
- **L5:** Test de carrera con dos conexiones solo si MariaDB QA disponible, nunca fake=concurrency PASS.
- **L6:** Aceptar serialización por empresa como decisión simple de primera versión.

### V10 — Privacidad de CV, disco y falso PASS
**Qué inspeccioné:** La V1 reusaba disco privado, pero MIME y Storage::fake no son escaneo ni cifrado verificado.
**Evidencia:** V1 §3.5 líneas 54–57 y O26–O31; B19 CONTRACT_MATRIX y REUSE_DECISIONS del ZIP.
**Contraargumento/adversario:** Atribuir permiso de empleado al candidato o activar descarga de PDF sin malware/consentimiento crea riesgo no verificado.
**Fallo y justificación:** CV solo PDF ficticio, lectura limitada, prefijo ATS propio, estado NO_VERIFICADO y rutas/producto cerrados.

- **L1:** Usar disco `private-files` existente, sin segundo almacenamiento.
- **L2:** No cambiar validador de key B19 `documents/...` para admitir recruitment.
- **L3:** Validar tamaño/bytes/finfo y limpiar solo key nueva ante falla.
- **L4:** No mostrar CV real ni datos sensibles en plantilla host.
- **L5:** Storage fake solo PASS_HOST_FAKE, nunca privacidad/escaneo productivo.
- **L6:** Guardar evidencia focal y no repetir suite B19 entera.

## 3. Diez pasadas JUEZ (segunda ronda)

### J01 — ¿Suspender todo ATS hasta tener contratos legales?
**Qué inspeccioné:** B19 está cerrado comercialmente pero su núcleo con fake fue útil; B20 tiene igual frontera.
**Evidencia:** B19 CONTRACT_MATRIX; V1 §0/§3.2; SPEC V5 B20-H8 candidato.
**Contraargumento/adversario:** Detener todo no mejora seguridad de lo no expuesto y posterga integración B21.
**Fallo y justificación:** RECHAZAR paralización general: implementar backend y vistas en QA sintética, con denegación productiva.

- **L1:** Avance útil sin crear una cuenta nueva de reclutador.
- **L2:** Mantener bloqueos contractuales explícitos en vez de workarounds.
- **L3:** No usar fixtures como permisos reales.
- **L4:** UI muestra restringido mientras no exista acceso web real.
- **L5:** PASS solo para host y fuentes comprobadas.
- **L6:** Después de ZIP, avanzar B21, no B20-S2 automático.

### J02 — ¿Crear URL pública de pruebas para completar flujo?
**Qué inspeccioné:** El flujo real B20 exige enlace público, pero aviso/antibot/rate limit no están aprobados.
**Evidencia:** SPEC V5 MOD-12; V1 O05/O31 y PRIVATE routes B19 ausentes.
**Contraargumento/adversario:** Un endpoint QA olvidado puede recibir CV reales fuera de consentimiento.
**Fallo y justificación:** RECHAZAR: token solo en servicio de test sin ruta ni HTTP; público sigue BLOCKED.

- **L1:** No usar servidor web secundario solo para tests.
- **L2:** No agregar `/_qa` ni ruta staging en producción.
- **L3:** Conservar límite explícito de autorización por acción.
- **L4:** La vista renderizada no enlaza rutas inexistentes.
- **L5:** route:list confirma no rutas ATS nuevas.
- **L6:** No enviar otra fase de limpieza de endpoints.

### J03 — ¿Construir cuatro tablas aunque ya haya ATS?
**Qué inspeccioné:** La SPEC no exige recrear entidades si hay grano compatible.
**Evidencia:** V1 §§1/3.1, O03/O35; B19 creó tres tablas específicas de expediente.
**Contraargumento/adversario:** Cuatro tablas duplicadas añadirían migraciones y code path inútiles.
**Fallo y justificación:** CORREGIR: máximo cuatro, cero si hay equivalentes; 4 solo si faltan y sirven al caso feliz.

- **L1:** Emplear Eloquent sobre contratos previos cuando coincidan.
- **L2:** No reutilizar sync_employees como candidato.
- **L3:** No cambiar esquema B19 solo para sostener ATS.
- **L4:** Mostrar datos sintéticos sin desplegar otra UI de reclutamiento.
- **L5:** Inspeccionar FK y UNIQUE, sin declarar DB PASS sin migración real.
- **L6:** Lectura focal una vez antes de implementar.

### J04 — ¿Agregar event sourcing, cola y CQRS por idempotencia?
**Qué inspeccioné:** Una mutación exige evento de auditoría y respuesta repetible, no proyecciones distribuidas.
**Evidencia:** V1 §3.1 UNIQUE, O12/O19; normas L1–L3.
**Contraargumento/adversario:** Nueva infraestructura aumenta fallos sin aportar seguridad demostrada.
**Fallo y justificación:** RECHAZAR: evento append-only en tabla 4, transacción y resultado; un solo servicio.

- **L1:** Código simple con un comando y un evento por mutation.
- **L2:** Evitar tabla nueva de command log.
- **L3:** Guardar outcome_ref para replay determinista.
- **L4:** Historial legible antes/después sin PII.
- **L5:** Revalidar DB en B21, no prometer atomicidad con fake.
- **L6:** No pedir refactor grande al terminar B20.

### J05 — ¿Ofrecer token por email/URL real para probarlo?
**Qué inspeccioné:** Un token persistido en claro en email/log anularía secreto y anonimato.
**Evidencia:** V1 O09/O10/O31, §3.3.
**Contraargumento/adversario:** Simular un email enviado o URL pública daría falso alcance operativo.
**Fallo y justificación:** RECHAZAR; retorno efímero solo al caso de prueba, hash persisted, sin token en ZIP.

- **L1:** Usar random_bytes y SHA256 ya disponibles.
- **L2:** No añadir proveedor email o manejo de secretos nuevo.
- **L3:** Hash_equals sobre digest de vacancy scoped.
- **L4:** Blades nunca muestran token ni “link activo”.
- **L5:** Probar que logs/manifiesto excluyen tokens; evidencia solo hashes no sensibles.
- **L6:** Entrega sin solicitud posterior de credenciales.

### J06 — ¿Habilitar reclutadores con rol owner/admin?
**Qué inspeccioné:** El owner autenticado de B13 no prueba consentimiento de candidato ni permiso ATS.
**Evidencia:** B19 deny-all real, V1 §3.2 y O16.
**Contraargumento/adversario:** La apertura rápida sería autorización incorrecta incluso si endpoint bajo auth:web.
**Fallo y justificación:** RECHAZAR: DENY_ALL productivo ATS y rol QA solo test DI; bloqueo comercial explícito.

- **L1:** Interfaz authorizer pequeña, no nuevo RBAC.
- **L2:** No copiar B19 `DocumentAccessAuthorizer` como ATS grant.
- **L3:** Cada action revalida company/vacancy/application.
- **L4:** Botones desactivados con razón de falta de permiso.
- **L5:** Prueba contenedor productivo DENY_ALL necesaria, aun con tests fake positivos.
- **L6:** B21 resolverá policy tras contrato real.

### J07 — ¿Poner lock solo por vacancy para mejorar throughput?
**Qué inspeccioné:** Una entrevista de un entrevistador puede abarcar varias vacantes de su empresa.
**Evidencia:** V1 O23 y línea 52; V2 define conflicto cross-vacancy.
**Contraargumento/adversario:** Optimización local permitiría carreras en primeras inserciones de otra vacante.
**Fallo y justificación:** RECHAZAR: lock sobre company existente para operaciones agenda; comprobar `existing_start < new_end` y `existing_end > new_start`.

- **L1:** Una fila padre conocida evita locks distribuidos.
- **L2:** No introducir quinta tabla resource_lock.
- **L3:** Cerrar/reagendar y agendar usan mismo lock, corto sin IO.
- **L4:** La agenda presenta solape como conflicto, no confirmación.
- **L5:** Dos conexiones MariaDB son condición de PASS concurrencia.
- **L6:** Performance se reevalúa en B21 solo si carga justifica.

### J08 — ¿Procesar CV reales con etiqueta “sintético”?
**Qué inspeccioné:** Un CV real contiene datos personales aunque el filename sea QA.
**Evidencia:** V1 §3.5, SPEC V5 MOD-12 privacidad, B19 storage fake.
**Contraargumento/adversario:** Etiquetar datos reales como ficticios no genera consentimiento/retención/escaneo válidos.
**Fallo y justificación:** RECHAZAR: fixtures PDF inventados y no identificables, cero endpoints públicos, malware NOT_VERIFIED.

- **L1:** Una misma ruta de disco privado con prefijo ATS acotado.
- **L2:** No copiar expedientes B19 ni usar archivos del usuario.
- **L3:** Definir key aleatoria/limpieza sin tocar otra key.
- **L4:** No mostrar nombres/email/identidades reales en QA.
- **L5:** MIME/estructura PDF no prueban ausencia de malware.
- **L6:** Entrega ZIP libre de PII para revisión del director.

### J09 — ¿Eliminar UI hasta aprobar autenticación web?
**Qué inspeccioné:** La especificación UX-21 necesita estados legibles, pero el portal real está bloqueado.
**Evidencia:** V1 §4 Fase C y O32; B16 web auth incompleto.
**Contraargumento/adversario:** Sin ninguna vista B20 se convertiría en scaffold y no demostraría legibilidad futura.
**Fallo y justificación:** RECHAZAR retirada total: componente Blade renderizado en host con datos sintéticos y sin ruta activa.

- **L1:** Reusar estilos Blade B16, no nueva SPA.
- **L2:** No crear UI duplicada de candidatos en Flutter.
- **L3:** No usar datos live ni prometer acciones.
- **L4:** Render host accesible/móvil con estados restringido/empty.
- **L5:** Afirmar HOST_RENDER, no browser ni portal comercial.
- **L6:** Una prueba de render no justifica reabrir B16.

### J10 — ¿Generar V3 y otra auditoría ritual antes de Codex?
**Qué inspeccioné:** V1 no fue ejecutada; V2 cubre raíces concretas con O01–O40 literales.
**Evidencia:** Comparación programa de los 40 O; GitHub B20 V1 actual al corte; falta ZIP B20.
**Contraargumento/adversario:** Una ronda más consumiría tiempo sin nuevo fallo observado.
**Fallo y justificación:** RECHAZAR. Aprobar V2 como una sola orden ejecutable y exigir ZIP único; después B21 independiente.

- **L1:** Arquitectura queda monolítica y cuatro tablas como techo.
- **L2:** Las 20 pasadas actuales ya documentan correcciones sin duplicación.
- **L3:** No alterar criterios de O01–O40 para perseguir métricas verdes.
- **L4:** Priorizar recorrido completo vacancy→decision en QA.
- **L5:** No se otorgó certificación de software antes de ejecutar la orden.
- **L6:** Codex implementa y vuelve solo con ZIP, ChatGPT adjudica.

## 4. Matriz de correcciones reales V1→V2 (no nuevo scope)

| Falta V1 comprobada | Decisión V2 verificable | Oráculos conservados |
|---|---|---|
| Token QA utilizable pero prohibición ambigua de entregar su valor | Solo retorno efímero en memoria al test, digest persistido, nunca URL/HTTP/log/ZIP | O09–O11, O31 |
| Secuencia lineal bloqueaba retirar/rechazar antes de entrevista | Tabla explícita de transiciones tempranas y estados terminales; cancelación correlativa de entrevistas pendientes con evento único | O17–O19, O24 |
| `RIGHTS_REQUESTED` no era estado de aplicación válido | Evento de privacidad separado del estado de postulación; no simular borrado | O17, O30 |
| UNIQUE de evento no especificaba resultado del replay ni cantidad de eventos por comando | Una mutación=un evento/outcome_ref/response; fingerprint estable, 201/200/409 semánticos, DB corta | O12, O19, O35 |
| Lock por vacante/aplicación no evita entrevista simultánea del mismo entrevistador en diferentes vacantes | Lock de fila companies por empresa, comprobación global de solapes, dos conexiones para QA DB | O22–O25 |
| CV y storage fake se podían confundir con malware/cifrado probado | Prefijo propio B20, read bounds y no descarga/publicación reales, contrato de privacidad cerrado | O26–O31, O36 |
| WIP de main podía confundirse con local | Baselines reales tracked/untracked, patch replay exacto, un ZIP, GitHub solo documental | O01–O03, O38–O40 |

## 5. Decisiones de autoridad, pendientes y ruta mínima a GO

**B20 debe cerrar técnicamente un circuito en QA host (no una vitrina vacía):** vacante borrador → READY sin publicación → token interno revocable → aplicación PDF sintética → evaluación → agenda sin solapes → decisión → historial y pase bloqueado; consulta tenant y preview Blade sintética. Persistencia Eloquent y migración 0–4 tablas solo si no hay equivalentes. Authorizer productivo deniega todo hasta aprobación. No URLs/correos/CV reales, no nuevas cuentas, no migración de empleados, no frameworks ni Docker.

**Gates para B21, NO aprobados hoy:** permisos reales RR. HH./consentimiento/aviso/retención, login web, MariaDB real + concurrencia dos conexiones, almacenamiento/cifrado/malware, rutas públicas con rate limiting, Android/outbox, datos de nómina legales, QA L5 independiente del mismo build y revisión UX humana. B21 no debe confundir “no aprobado” con “defecto probado”: realizar primero una matriz de dependencias y un solo ciclo integrado donde el entorno sea seguro. B22 requerirá autorización escrita y evidencia antes de release; NO omitir módulos ni anunciar GO por QA sintética.

**Entrega de Codex:** `JOR-B20-S1-V2-ATS-ROOT-20261115-UNICO.zip` bajo D:\codex\_REPORTES\Jornato\JOR-B20-S1-V2-ATS-ROOT-20261115, con fuentes, baselines, patch byte exacto, 40 oráculos, tests/logs reales, hashes, auditoría interna 10×L1–L6 y reporte. `NEXT_OWNER=CODEX_LUNA` hasta ese ZIP; después `NEXT_OWNER=CHATGPT` para aceptar B20 y enviar macrobloque B21. No stage, commit, push, merge ni deploy del WIP.

## 6. Reglas de recuperación en otro chat

Leer en este orden: `docs/JORNATO_CONTINUIDAD.md`, `docs/CODEX_LOTE_ACTUAL.md`, `docs/AUDITORIA_DIRECTIVA_ACTUAL.md` de la rama documental; luego último ZIP realmente adjuntado. `main` no contiene necesariamente el código WIP; no reconstruirlo desde PR documental. B20 V1 queda SUPERSEDIDA sin ejecución y esta auditoría no debe repetirse salvo evidencia concreta nueva. Nunca fingir permisos, DB, navegador o normas legales aprobadas.