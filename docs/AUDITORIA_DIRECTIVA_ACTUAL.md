# JORNATO — AUDITORÍA DIRECTIVA B17-S1 V2: 10 VERDUGO + 10 JUEZ, 120 CONTROLES Y PLAN B17–B22

**Corte:** 2026-11-13. **Objeto auditado:** orden B17-S1 V1, última evidencia B16-S1 V2 y propuesta correctiva B17-S1 V2. **No existe todavía ZIP de ejecución B17.**
**Autoridad:** decisiones y contratos aprobados del propietario > evidencia del checkout local > PingPongLaw L1–L6 commit fijo `84e961cadf482d234f4c0ee2ca60e8c7e9b388e8` > SPEC V5 candidata. El repositorio documental GitHub es un checkpoint, NO espejo del WIP D:.
**Leyes:** L1 KISS/Ponytail; L2 antirruido; L3 antiparches/causa raíz; L4 UX y contratos humanos; L5 evidencia independiente/estados; L6 antipingpong. En cada pasada se emite un juicio específico para cada una. **No son pruebas de ejecución ni certificación legal.**

## 1. Evidencia y límites reales

- **B16 ZIP fuente:** `JOR-B16-S1-V2-PORTAL-PRO-20261112-UNICO.zip` SHA-256 `0F31F3CC7D3C2E1300E02A112CB8168F1B4D5C5340C6544FA6FB02D7BF0CB933`. En el turno anterior ChatGPT comprobó CRC, 75 miembros, 74/74 hashes, 11/11 replay, PHP lint 6/6. `SOURCES/server/routes/web.php` contiene rutas GET protegidas `auth:web`/`account.active` sin login comercial; `CONTRACT_MATRIX.md` documenta mocks y blockers. No reejecutamos MariaDB ni navegador.
- **QA Codex B16:** PHPUnit 12 pruebas, 122 aserciones y CSV sintético. Son logs reportados, no independientes de MariaDB. B16 permanece `PARTIAL_HOST_OR_CONTRACT`.
- **Orden V1 objeto:** CODEX_LUNA_JORNATO_B17_S1_V1_MACROBLOQUE_SOLICITUDES_NOVEDADES_LEDGER_QA_SOLO_D_UN_ZIP_20261113.md, SHA256 `867c5cd3e8b7b969da85581b0af641307f3fa060a48bfe2f7d170fccd3234a2f`; verificada por lectura. Contiene contradicción concreta: §4.3 usa `NEEDS_CLARIFICATION → PENDING` mientras O18 exige responder aclaración en `PENDING`.
- **Prompt corregido V2:** CODEX_LUNA_JORNATO_B17_S1_V2_MACROBLOQUE_SOLICITUDES_PRIVACIDAD_IDEMPOTENCIA_QA_SOLO_D_ZIP_UNICO_20261113.md, SHA256 `2aade11d524cf18c37ad0b23ad2a5f7c230aa339419235e253c38d36bfabecb7`. Contiene 36 oráculos **sin ampliar el conteo**, tabla de transiciones no contradictoria, idempotencia contra carreras, privacidad estricta y un único ZIP.
- **Criterio de revisión:** P = adecuado en el alcance documental; A = cambio material incorporado en V2; L = limitación/evidencia no ejecutada. Estos son **dictámenes estáticos de 120 controles**; no generar 120 PASS simulados.

## 2. Diez pasadas del VERDUGO (intentar invalidar el lote)

### V01 — Jerarquía y alcance aprobado
**Evidencia:** SPEC V5 es candidata y el checkout local es la autoridad de código; V1 no demuestra permiso comercial.
**Contraejemplo adversarial:** Forzar códigos o nuevas pantallas de V5 sobre contratos aprobados.
**Fallo razonado:** Preservar esquemas reales; cerrar aprobación comercial y trabajar con QA sintética.
- **L1 [P]:** KISS: una vertical de solicitudes, no un nuevo dominio de RR. HH.
- **L2 [A]:** No copiar requisitos candidatos como norma comercial fija.
- **L3 [P]:** Consultar contrato existente antes de crear migraciones.
- **L4 [L]:** La UX de solicitudes aún requiere aceptación humana.
- **L5 [L]:** No hay ejecución B17 para acreditar comportamiento.
- **L6 [P]:** Una sola orden corregida, no otra fase de auditoría.

### V02 — WIP y reconstrucción forense
**Evidencia:** B16 ZIP 75/74 hashes/11 patch aceptados; estado de D: procede de logs, no acceso actual.
**Contraejemplo adversarial:** Rehacer B16 desde main y perder ocho archivos untracked.
**Fallo razonado:** Prebytes tracked+untracked y marcadores ABSENT; ningún reset/stage.
- **L1 [P]:** Reutilizar el monolito y checkout actual.
- **L2 [P]:** No duplicar evidencias antiguas dentro de otro repositorio.
- **L3 [A]:** El replay debe incluir ficheros nuevos sin staging.
- **L4 [L]:** No existe respaldo externo off-device acreditado.
- **L5 [P]:** SHA del ZIP B16 es evidencia de su paquete, no de D: hoy.
- **L6 [P]:** No repetir auditoría B16 antes del trabajo B17.

### V03 — Identidad del empleado
**Evidencia:** B15 employee_identity_links existe; membership es distinta de ser empleado; enrolamiento comercial bloqueado.
**Contraejemplo adversarial:** Tomar employee_id libre del POST y exponer peticiones de B.
**Fallo razonado:** Empleado derivado de vínculo activo y tenant verificados por servidor, 422 a IDs forjados.
- **L1 [P]:** Un solo vínculo real, sin login duplicado.
- **L2 [P]:** No guardar otro mapa User-Employee.
- **L3 [P]:** La autoridad pertenece al backend del recurso.
- **L4 [A]:** No anunciar autoservicio comercial sin vínculo autorizado.
- **L5 [L]:** HTTP Laravel contra DB real sigue sin ejecutar.
- **L6 [P]:** Gate comercial no bloquea test local sintético.

### V04 — Autorización del revisor
**Evidencia:** B16 owner/admin solo sirve para lectura de portal, no hay policy HR aprobada.
**Contraejemplo adversarial:** Crear approve para todo owner/admin o dar rol implícito.
**Fallo razonado:** Solo dominio de transiciones probado con fixture; ruta/CTA review ausente sin policy.
- **L1 [P]:** No añadir jerarquía de roles paralela.
- **L2 [P]:** Reutilizar policies reales si aparecen.
- **L3 [P]:** Fail-closed para mutación sensible.
- **L4 [A]:** No mostrar botón de aprobar inoperable.
- **L5 [L]:** Permiso comercial sigue no documentado.
- **L6 [P]:** Alta/lectura propia pueden avanzar sin approvals comerciales.

### V05 — Máquina de estados O18
**Evidencia:** V1 §4.3 define NEEDS_CLARIFICATION→PENDING, pero O18 pide responder estando PENDING.
**Contraejemplo adversarial:** Implementar aclaración desde PENDING y pasar un test falso.
**Fallo razonado:** Alinear estado, evento from/to y oráculo O18 explícitamente.
- **L1 [P]:** Una tabla de transiciones sencilla.
- **L2 [A]:** Eliminar contradicción documental, no inventar otro estado.
- **L3 [P]:** Corregir causa de falso positivo en el oráculo.
- **L4 [P]:** Una aclaración observable para el titular.
- **L5 [L]:** Hasta ejecutar, la máquina es diseño no runtime.
- **L6 [P]:** Resolver ahora en V2, no como B17-S2.

### V06 — Idempotencia y duplicados
**Evidencia:** V1 exige key+payload pero no fija normalización estable/UNIQUE vs carrera.
**Contraejemplo adversarial:** Dos POST simultáneos generan dos folios por select-before-insert.
**Fallo razonado:** Unique tenant+actor+key, hash canónico, transaction y control de choque exacto.
- **L1 [P]:** Una regla única en backend/DB, sin broker ni cola.
- **L2 [P]:** No crear tabla idempotency adicional si columna basta.
- **L3 [P]:** La atomicidad resuelve el fallo de raíz.
- **L4 [L]:** Un replay duplicado en UI no puede atribuirse a tiempo trabajado.
- **L5 [L]:** Sin dos conexiones MariaDB no hay PASS de carrera.
- **L6 [P]:** Pruebas focales y no 1000 eventos B14.

### V07 — Historial append-only realista
**Evidencia:** V1 usa término inmutable sin delimitar garantías de DBA; eventos nuevos deben ser insert-only.
**Contraejemplo adversarial:** Afirmar prueba criptográfica de inmutabilidad que el esquema no ofrece.
**Fallo razonado:** Registrar append-only en aplicación, FK y secuencia; prohibir falsa garantía física.
- **L1 [P]:** Dos tablas focales máximo, no infraestructura event-sourcing.
- **L2 [P]:** Reusar audit ledger existente si lo hay.
- **L3 [P]:** Transición y evento dentro del mismo commit.
- **L4 [P]:** Mostrar timeline claro y no borrar decisiones.
- **L5 [L]:** No hay ensayo de rollback DB todavía.
- **L6 [P]:** Guardar alcance y seguir al siguiente módulo.

### V08 — Privacidad médica y logs
**Evidencia:** V1 admite reason_summary libre en categorías médicas; no se probó contrato de almacenamiento sensible.
**Contraejemplo adversarial:** Almacenar diagnósticos o anexos clínicos en tabla/listado y ZIP.
**Fallo razonado:** Categoría neutral, motivo opcional corto, sin adjuntos ni logs sensibles; no presumir detección perfecta.
- **L1 [P]:** No crear storage privado o cifrado ficticio.
- **L2 [A]:** Reducir campos opcionales con alta sensibilidad.
- **L3 [P]:** Evitar la fuente del leak, no solo redactarlo al final.
- **L4 [P]:** No exigir historia clínica para una cita.
- **L5 [L]:** Política jurídica de datos sensibles sin aprobar.
- **L6 [P]:** Conservar la vertical sintética sin ese dato.

### V09 — Fechas, zonas y jornada
**Evidencia:** Intervalos de noche y múltiples días; ninguna proyección de turnos/duración laboral aprobada.
**Contraejemplo adversarial:** Convertir 23:00–07:00 en 8 horas trabajadas automáticamente.
**Fallo razonado:** Guardar instante+zona de forma inequívoca, sin cálculo de asistencia ni saldo.
- **L1 [P]:** Persistir el rango, no construir motor de tiempo.
- **L2 [P]:** No duplicar turnos B08 ni B14.
- **L3 [P]:** Rechazar timezone ambiguo en la validación.
- **L4 [P]:** Pantalla distingue duración pedida de fichada.
- **L5 [L]:** DST/intervalos requieren test focal nuevo.
- **L6 [P]:** No reabrir backlog de reglas B18 en B17.

### V10 — QA de falsa certeza
**Evidencia:** B16 12/122 PHPUnit con actingAs/Mockery, MariaDB/browser no ejecutados.
**Contraejemplo adversarial:** Llamar PASS DB a un rollback simulado o a dos llamadas seriales.
**Fallo razonado:** Separar host, mocks, kernel, MariaDB doble conexión y navegador con estados propios.
- **L1 [P]:** No depender de contenedor nuevo.
- **L2 [P]:** Matrices focales sin suites repetidas.
- **L3 [P]:** Probar cada capa en su dueño.
- **L4 [L]:** UX física y login siguen pendientes.
- **L5 [A]:** PASS debe citar ejecución y SHA, no solo criterio.
- **L6 [P]:** Cerrar bloque con PARTIAL si DB no disponible.

## 3. Diez pasadas del JUEZ (contrastar y rechazar soluciones sobredimensionadas)

### J01 — ¿Replantear B17 por no tener MariaDB QA?
**Evidencia:** Últimas pruebas de server fueron host/Mockery; no hay base aislada acreditada.
**Contraejemplo adversarial:** Detener el producto hasta instalar Docker compartido.
**Fallo razonado:** RECHAZAR: implementar núcleo y host tests; DB_REAL=NOT_RUN_ENV.
- **L1 [P]:** No infraestructura nueva.
- **L2 [P]:** No ruido de diagnósticos repetidos.
- **L3 [P]:** Causas de DB documentadas sin modificar terceros.
- **L4 [L]:** No proclamar recorrido comercial validado.
- **L5 [L]:** Concurrencia real queda sin ejecutar.
- **L6 [P]:** Avanzar a B18 tras ZIP sin vuelta S2 automática.

### J02 — ¿Eliminar todo endpoint mientras falta enrolamiento comercial?
**Evidencia:** La identidad personal QA existe, aprobación comercial del vínculo no.
**Contraejemplo adversarial:** Exponer ruta comercial sin vínculo aprobado o abandonar código útil.
**Fallo razonado:** CONSERVAR API QA con default-deny fuera de testing si solo hay fixture, sin login nuevo.
- **L1 [P]:** Reusar Sanctum y gate existente.
- **L2 [P]:** No duplicar enrolamiento.
- **L3 [P]:** Fail-closed en el acceso real.
- **L4 [A]:** La UI debe etiquetar acceso de QA.
- **L5 [L]:** El flujo real sigue bloqueado por contrato.
- **L6 [P]:** Bloquear solo exposición, no implementación.

### J03 — ¿Crear un almacén de saldos de vacaciones?
**Evidencia:** No existe ledger homologado de días/saldo de B17.
**Contraejemplo adversarial:** Suponer cero, descontar días o agregar tercera tabla.
**Fallo razonado:** RECHAZAR: marcar UNKNOWN y no tocar balance.
- **L1 [P]:** Dos entidades request/history bastan.
- **L2 [P]:** No duplicar libro contable.
- **L3 [P]:** Causa raíz es falta de fuente/autoridad.
- **L4 [P]:** Mensaje de estado claro y no engañoso.
- **L5 [L]:** Saldo legal pendiente de B18/legal.
- **L6 [P]:** No mezclar segundo dominio en este lote.

### J04 — ¿Usar la tabla de asistencias como historial de permisos?
**Evidencia:** B14 eventos SERVER_STORED/UNASSESSED no son tiempo validado.
**Contraejemplo adversarial:** Convertir permisos en AttendanceEvent para reutilizar infraestructura.
**Fallo razonado:** RECHAZAR: historial propio de solicitudes, sin mutar B14.
- **L1 [P]:** Separación mínima por función.
- **L2 [P]:** No contaminar un ledger con otro significado.
- **L3 [P]:** La transacción vive en solicitudes.
- **L4 [P]:** Mostrar hechos diferenciados en pantalla.
- **L5 [L]:** No hay prueba DB real para esa separación aún.
- **L6 [P]:** No reabrir B14 por costumbre.

### J05 — ¿Crear una segunda autenticación web para revisores?
**Evidencia:** B16 tiene auth:web sin login navegable real y sin policy HR aprobada.
**Contraejemplo adversarial:** Implementar `/login` de emergencia para aprobación y certificar portal.
**Fallo razonado:** RECHAZAR: no mostrar rutas mutadoras web hasta contrato aprobado.
- **L1 [P]:** Mantener una auth, no dos.
- **L2 [P]:** No crear token/web bridge no solicitado.
- **L3 [P]:** No saltarse middleware para hacer test verde.
- **L4 [A]:** Informar que revisión web no es navegable.
- **L5 [L]:** Web browser E2E sigue NOT_RUN.
- **L6 [P]:** Terminar backend+empleado sin esa dependencia.

### J06 — ¿No implementar ninguna UI Flutter?
**Evidencia:** B15 posee área personal host y sesión, es útil construir presentación de peticiones.
**Contraejemplo adversarial:** Entregar solo migraciones y abrir S2 para hacer la pantalla.
**Fallo razonado:** RECHAZAR: integrar lista/alta/estados en un macrobloque si sesión existente segura.
- **L1 [P]:** Una pantalla en Flutter existente.
- **L2 [P]:** No rehacer kiosco ni navegación global.
- **L3 [P]:** Response stale se maneja en sesión propietaria.
- **L4 [P]:** Error, vacío, folio, retry y etiquetas.
- **L5 [L]:** Android físico no se certifica con widget.
- **L6 [P]:** No microfase UI posterior.

### J07 — ¿Simular offline con outbox falsa?
**Evidencia:** No hay confirmación de outbox personal de requests.
**Contraejemplo adversarial:** Mostrar “en cola” después de timeout y generar nueva key al reintento.
**Fallo razonado:** RECHAZAR: misma key y estado desconocido hasta 200/201 válido.
- **L1 [P]:** No añadir outbox paralela.
- **L2 [P]:** No duplicar reintentos B14.
- **L3 [P]:** Reusar idempotencia backend causal.
- **L4 [P]:** UX expresa incertidumbre, no éxito ficticio.
- **L5 [L]:** Sin red real solo widget muestra estados.
- **L6 [P]:** Resolver en el mismo lote.

### J08 — ¿Probar race con SQLite o llamadas seriales?
**Evidencia:** Laravel QA sin MariaDB aislada, modelos existentes usan MariaDB/InnoDB.
**Contraejemplo adversarial:** Dos calls secuenciales etiquetadas concurrencia DB real.
**Fallo razonado:** RECHAZAR: unit/host honestos; O23 y O24 NO_RUN_ENV salvo dos conexiones.
- **L1 [P]:** No motor alternativo por conveniencia.
- **L2 [P]:** Evitar matrices inventadas.
- **L3 [P]:** La UNIQUE y transacción son la causa robusta.
- **L4 [L]:** No UX requiere aparentar race verde.
- **L5 [A]:** No falsear `PASS_DB_REAL`.
- **L6 [P]:** No forzar otro lote antes de B18.

### J09 — ¿Convertir aprobación en saldo/sueldo?
**Evidencia:** SPEC candidata distingue horas observadas y justificadas; políticas legales no homologadas.
**Contraejemplo adversarial:** Un status APPROVED suma a jornada o paga automático.
**Fallo razonado:** RECHAZAR: decisión operativa sin efectos de nómina ni vacaciones.
- **L1 [P]:** No crear motor salarial B18 antes de su etapa.
- **L2 [P]:** No duplicar cálculo de otras áreas.
- **L3 [P]:** Evitar escritura laboral sin fuente de verdad.
- **L4 [P]:** Texto visible no induce consecuencias ficticias.
- **L5 [L]:** Legal approval sigue pendiente.
- **L6 [P]:** B17 termina vertical request/history.

### J10 — ¿Otra auditoría de prompt antes de Codex?
**Evidencia:** V2 corrige O18, carrera idempotency, privacy, gates y preserva 36 oráculos.
**Contraejemplo adversarial:** Crear V3 sin evidencia nueva; cambiar criterios otra vez.
**Fallo razonado:** RECHAZAR: ejecutar V2 como único lote, pedir ZIP completo, adjudicar luego B18.
- **L1 [P]:** Solución mínima suficiente y testeable.
- **L2 [P]:** Un solo prompt completo y un solo ZIP.
- **L3 [P]:** Sin parches documentales sucesivos.
- **L4 [P]:** Contratos UX pendientes declarados.
- **L5 [L]:** Ejecución B17 aún NO realizada.
- **L6 [P]:** Siguiente responsable Codex con tarea cerrada.

## 4. Balance trazable y cambios reales V1 → V2

**Recuento documental:** 87 favorables, 10 ajustes, 23 límites = 120 juicios. No es una matriz de QA ejecutada.

| Defecto/riesgo V1 | Corrección V2 | Evita |
|---|---|---|
| O18 contradice estados | NEEDS_CLARIFICATION→PENDING; PENDING inválido para responder | Test falso y transición incoherente |
| Idempotency sin algoritmo/UNIQUE explícitos | fingerprint canónico, índice real, conflicto y transacción | Folios/eventos duplicados por retry y race |
| Privacidad de motivos médicos abierta | motivo opcional 0–300, categorías neutrales, sin soporte ni logs clínicos | Exposición de datos sensibles |
| Inmutabilidad no delimitada | append-only aplicación, FK/sequence, no afirmar defensa frente DBA | Promesa falsa de auditoría inviolable |
| Alcance QA vs comercial ambiguo | acceso fail-closed fuera de testing si solo vínculo sintético, respetar contrato aprobado | Rutas laborales públicas sin enrolamiento validado |
| Tester con actor QA podría pasar como permiso admin | domain unit fixture interno, sin endpoint web ni CTA | Escalada de privilegios |
| Estado `APPROVED` confundido con derecho | status operativo sin saldo, horas, nómina ni EPS validada | Falsa homologación laboral |
| Retry Flutter tras timeout | conservar misma idempotency key hasta respuesta 200/201 | Solicitudes duplicadas al reintentar |
| `PASS_DB_REAL` deducido de mocks | O23/O24 requieren conexiones MariaDB reales | Falso positivo L5 |
| WIP untracked histórico | baselines pre-edición y patch 1:1 sin staging | Pérdida o falso replay |

### Decisiones que NO se cambiaron por no existir evidencia nueva
- Se mantienen **36** oráculos O01–O36, sin subir artificialmente su número; O18 se corrige, no se renombra el producto ni se repite S1.
- No añadir tabla de vacaciones, microservicio, SPA, auth nueva, login web, turnos ni auditoría event-sourcing.
- Reutilizar Laravel/Sanctum/MariaDB y Flutter existentes; SPEC V5 sigue candidata y la aprobación legal/comercial sigue pendiente.
- No repetir las 12 pruebas B16/122 aserciones ni rehacer el CSV; los tests B17 son focales, con regresiones vecinas por impacto.

## 5. Plan concreto de finalización B17–B22, sin falsas aprobaciones

| Bloque | Producto completo que debe dejar | Evidencia suficiente | Gate explícito / dependencia |
|---|---|---|---|
| **B17-S1 V2 — AHORA** | Request personal PENDING + folio, lista/detalle, historial, cancelación y aclaración, política reviewer solo si aprobada; Flutter integrada host | 36 oráculos, fuente+patch+logs, PHP/Flutter focal, DB real si hay QA aislada | `REVIEW_PERMISSION_GATE` y `EMPLOYEE_LINK` comerciales, MariaDB/Android/L5 según ejecución |
| **B18** | Reglas laborales informativas por fecha/país y desglose entendible; exportaciones solo validadas | Fixtures Colombia 2025/26/27, 42 h semanales, descanso distinto de domingo, recargos, fijo sin doble pago; revisión contador/jurídica | No calcular salarios como verdad legal sin pack homologado; separar fichado/justificado/reconocido |
| **B19** | Expediente y contratos versionados, documentos privados, copias y firma real o explícitamente pendiente | A/B de acceso, privacidad, plantillas con versiones, hash archivo y recepción | SHA de PDF no equivale a firma legal; proveedor/jurídico pendientes |
| **B20** | Reclutamiento: vacante, CV, revisión, agenda y transición candidate→employee | Archivo malicioso, permisos, enlace revocable, retención, E2E sintético | Sin publicar formulario o procesar CV reales si privacidad no aprobada |
| **B21** | QA integral del mismo build: B13/B14/B15/B16/B17–B20 y Android/navegador/server | L5 verdaderamente independiente, tests multi-tenant DB, dos dispositivos/offline, visual acceso/roles, 0 P0/P1 | Resolver login web, vínculo, revocación PAT, privacidad, textos y hardware |
| **B22** | Lote de publicación integral con rollback y soporte | APK/aab firmados, servidor apto, docs, planes/precios/legales autorizados, informe GO propietario | **Prohibido deploy/merge/comercialización sin GO escrito y puertas B21** |

**Finalidad de dirección:** no crear B17-S2 por rutina. Si un contrato crítico bloquea solo una operación, cerrar esa puerta y completar lo independiente; luego avanzar B18. No inferir porcentaje real de producto desde el número de tests.

## 6. Recuperación y custodia del proyecto en GitHub

- Rama documental `docs/pingponglaw-l1-l6-canon-84e961c`; PR #2 DRAFT, `main` sin WIP. `AGENTS.md` enlaza `docs/JORNATO_CONTINUIDAD.md`.
- Actualizar **los mismos dos archivos**: `docs/CODEX_LOTE_ACTUAL.md` con el **texto completo** V2 y `docs/JORNATO_CONTINUIDAD.md` con estado/auditoría/hashes. No crear copias V3 paralelas ni prometer que GitHub tiene los bytes de fuentes locales.
- Codex no realiza escrituras remotas de código. ChatGPT acepta la evidencia del futuro ZIP B17 y actualiza el checkpoint, preservando fuente que no se ha publicado.
- Nombre esperado de único ZIP: `JOR-B17-S1-V2-REQUESTS-SECURE-LEDGER-20261113-UNICO.zip` en D:, con parches y manifest, sin .env ni PII.

## 7. Decisión final de responsabilidad

**QUIÉN SIGUE: CODEX LUNA.** Ejecutar B17-S1 V2 una sola vez, entregar ZIP. **Después sigue ChatGPT** para dictamen y avance B18. `RELEASE_APPROVED=NO`, `B17_GLOBAL=NOT_APPROVED` hasta evidencia nueva.