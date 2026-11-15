# JORNATO — B21-S1 V1→V2 · AUDITORÍA ADVERSARIAL: 10 VERDUGO + 10 JUEZ / 120 JUICIOS L1–L6

**Corte:** 2026-11-15, America/Bogota · **Tipo:** juicio de diseño de orden Codex, NO auditoría de runtime B21 ni liberación comercial.  
**Base directa inspeccionada:** `CODEX_LUNA_JORNATO_B21_S1_V1_MACROBLOQUE_INTEGRACION_REAL_GATES_UN_ZIP_20261115.md` SHA256 `74dc8dc43b87557f4792e3c069c57e60dcdcf2967b3cf8a4584fca94dc4204c9` (108 líneas); `JORNATO_B20_DICTAMEN_INDEPENDIENTE_VERDUGO10_JUEZ10_PLAN_B21_20261115.md` SHA256 `02a500a811dd26151827a18840fcb4463edb826df0bccd930d2c50f4d2c398d9`; migración ATS B20 y `CONTRACT_MATRIX.md` del ZIP B20; canon GitHub L1–L6 commit `84e961cadf482d234f4c0ee2ca60e8c7e9b388e8` y continuidad de GitHub PR #2 documental. La SPEC V5 está marcada **CANDIDATA NO APROBADA**.  
**Salida corregida:** `CODEX_LUNA_JORNATO_B21_S1_V2_MACROBLOQUE_INTEGRACION_CONCURRENCIA_IDENTIDAD_GATES_ZIP_UNICO_20261115.md` SHA256 `3dc8cc835376b83aadb53920930edfe49301911dcd7e38df6e5c27b8ba83150a`; 24 oráculos I01–I24 **copiados sin alterar su texto de V1**. B21 V2 no ejecutada. No atribuir un fallo de implementación a B21 sin código/ZIP nuevo.

## Fallo global del agente externo

**SUSTITUIR V1 POR V2**. Tres defectos de ejecución que alteran la posibilidad de llegar a un resultado válido: (1) «dos conexiones» podía dar un falso PASS con pruebas secuenciales; (2) la orden permitía cambiar esquemas/índices sobre supuestos sin comprobar el DDL y la DB existente; (3) la falta de DB/identity podría dejar un ZIP puramente documental sin probar ninguna frontera nueva. Cuarto ajuste de gobernanza: diferenciar S1 focal de B21/H9 global (110+ escenarios, UX, hardware, accesibilidad, amenazas/rendimiento, L5). Se corrige el método de prueba **sin cambiar criterios I01–I24 ni inventar permisos**. Los estados B13–B20 ya juzgados se conservan sin repetición.

**L1–L6 por cada pasada:** L1 KISS/Ponytail; L2 Antirruido; L3 Causa raíz; L4 UX humana; L5 Verificación independiente; L6 Antiping-pong. Los 120 textos siguientes son **juicios documentales**; 0 nuevos tests B21 se ejecutaron durante esta revisión.

## FASE 1 — DIEZ PASADAS VERDUGO (buscar fallos del plan)

### V01 — Cadena de autoridad y continuidad

**Qué se examinó:** GitHub orden V1 B21 vigente; B20 último ZIP recibido; SPEC V5/B03 candidatas.

- **L1:** No ampliar stack por una SPEC candidata.
- **L2:** No volver a revisar B13–B20 ya adjudicados.
- **L3:** Corregir ambigüedad de orden B21 y nada más.
- **L4:** Estado de gates comprensible en futuro chat.
- **L5:** GitHub documental != código local D:.
- **L6:** Una V2 única y un ZIP.

**Veredicto adversarial:** APROBADO_CON_AJUSTE: V2 sustituye V1 sin atribuir tests nuevos.

### V02 — Protección del WIP y reversibilidad

**Qué se examinó:** V1 protege staging y HEAD pero no detalla qué pasa si staging inicial no está en cero.

- **L1:** Inventario focal de fuentes tocadas.
- **L2:** No limpiar staging ajeno aunque no sea cero.
- **L3:** No resetear checkout para cumplir preflight.
- **L4:** Incluir razón de cada fuente modificada.
- **L5:** Hash previo/posterior y ausencia de hash se distinguen.
- **L6:** Un preflight, no diez inventarios.

**Veredicto adversarial:** AJUSTE: no modificar staging preexistente; documentar condición.

### V03 — Plataforma DB y autorización de entorno

**Qué se examinó:** B20 migración requiere InnoDB; SPEC V5 candidata contiene PostgreSQL; V1 pide MariaDB sin arbitrar conflicto.

- **L1:** Utilizar DB del código actual y QA aislada.
- **L2:** No instalar una segunda plataforma por rutina.
- **L3:** Comparar configuración, migraciones y parent FK antes de parche.
- **L4:** Mensaje `NOT_RUN_ENV` explica imposibilidad.
- **L5:** No declarar SQLite `PASS_REAL`.
- **L6:** Una tentativa segura, sin trucos de policy.

**Veredicto adversarial:** AJUSTE: manda el motor implementado; ninguna migración destructiva.

### V04 — Integridad de esquema multitenant

**Qué se examinó:** Migración B20 muestra FK compuesta a sites(company_id,id); no se verificó índice padre por MariaDB real.

- **L1:** Un esquema real, no esquema paralelo.
- **L2:** Reutilizar índice padre si existe.
- **L3:** Corregir solo FK fallida demostrada.
- **L4:** Falla debe vincularse a tabla/columna.
- **L5:** DDL real o estado `NOT_VERIFIED`.
- **L6:** No añadir índices especulativos.

**Veredicto adversarial:** AJUSTE: `SCHEMA_GAP_REPRODUCED` requiere evidencia SQL.

### V05 — Concurrencia verdadera

**Qué se examinó:** V1: “dos conexiones DB independientes”; no exige barrera simultánea y permite llamadas secuenciales.

- **L1:** Dos sesiones, un controlador de barrera.
- **L2:** No crear framework de concurrencia nuevo.
- **L3:** Probar lock + UNIQUE real de B17/B19/B20.
- **L4:** Sin duplicados ni bloqueo colgado.
- **L5:** IDs CONNECTION_ID y logs de ambos actores.
- **L6:** Timeout/rollback/cleanup en mismo lote.

**Veredicto adversarial:** DEFECTO MATERIAL V1: pruebas secuenciales no prueban carrera; V2 añade barrera.

### V06 — Atomicidad entre DB y storage

**Qué se examinó:** B19 almacena objetos antes de transacción DB; V1 pide “rollback y ausencia orfandad” sin separar ambos sistemas.

- **L1:** DB transacción corta, objeto fuera.
- **L2:** No añadir coordinador distribuido.
- **L3:** Rollback DB != GC de archivo privado.
- **L4:** Errores separan limpieza y crash orphans.
- **L5:** Probar SQL y estado de objeto por separado.
- **L6:** No fabricar falso PASS de atomicidad completa.

**Veredicto adversarial:** AJUSTE: validar límites físicos, no prometer transacción DB+filesystem.

### V07 — Identidad comercial y auth real

**Qué se examinó:** B15 PAT, B16 login y B17 vínculo cuenta-empleado siguen parcialmente bloqueados.

- **L1:** Una auth existente.
- **L2:** No crear ruta/login QA accesible públicamente.
- **L3:** Leer rutas actuales antes de tocar contrato.
- **L4:** Denegación clara y acceso legítimo solo aprobado.
- **L5:** actingAs != login real / PAT revocado host != revocación server.
- **L6:** Un contrato faltante, un owner identificado.

**Veredicto adversarial:** AJUSTE: recorrido feliz solo si identidad concreta aprobada; si no, fallback útil.

### V08 — Autorización RRHH y aislamiento ATS

**Qué se examinó:** B19/B20 authorizers productivos DENY-ALL, B20 no abrió rutas según evidencia previa.

- **L1:** Mantener proveedores cerrados.
- **L2:** No crear permisos ficticios owner/admin.
- **L3:** Negativos cross-tenant en capa que exista.
- **L4:** No prometer documentación/candidaturas visibles.
- **L5:** Un deny-all es prueba negativa, no prueba happy-path.
- **L6:** Mantener gate para aprobación del dueño.

**Veredicto adversarial:** CONSERVAR: ninguna ruta pública ni HR hasta contrato aprobado.

### V09 — Pérdida de valor por ambiente bloqueado

**Qué se examinó:** V1 permite entregar únicamente matrices si DB e identidad fallan; riesgo de una auditoría más sin desarrollo.

- **L1:** Un test de frontera reutilizable solo ante laguna real.
- **L2:** No añadir test decorativo si ya existe SHA probada.
- **L3:** Ejecutar mínimo caso falsable con host/guard existente.
- **L4:** Mejorar mensajes de error y pasos reales.
- **L5:** No cambiar `NOT_RUN_ENV` a PASS por tener test host.
- **L6:** Continuar C/D sin crear B21-S2.

**Veredicto adversarial:** DEFECTO MATERIAL V1: V2 fija fallback productivo pequeño y verificable.

### V10 — Confusión B21-S1 y QA integral H9

**Qué se examinó:** SPEC V5 B21 exige 110+ QA, UX sin guía, accesibilidad, amenazas/performance, L5 independiente; V1 cierra 24 oráculos.

- **L1:** Una etapa de integración focal, no todo H9.
- **L2:** No recontar inventario 110 como 110 PASS.
- **L3:** Mantener criterio global de QA real.
- **L4:** UAT humano/Android requieren contexto físico.
- **L5:** Reporte `B21_GLOBAL=NOT_APPROVED` hasta L5.
- **L6:** B22 no automático.

**Veredicto adversarial:** DEFECTO MATERIAL V1: separar inequívocamente S1 de hito global.

## FASE 2 — DIEZ PASADAS JUEZ (desafiar también las correcciones)

### J01 — ¿Conservar V1 intacta?

**Contraargumento comprobado:** Contradicciones de prueba y dirección sí impactan el resultado.

- **L1:** V2 focal es menor que nuevo plan.
- **L2:** No rehacer módulos anteriores.
- **L3:** Corregir instrucciones de concurrencia/DB.
- **L4:** Codex recibe decisiones cerradas.
- **L5:** 24 oráculos intactos y diff comprobado.
- **L6:** Ejecutar V2 sin V3.

**Fallo del juez:** RECHAZADO CONSERVAR V1: V2 necesaria y suficiente.

### J02 — ¿Exigir MariaDB antes de cualquier trabajo?

**Contraargumento comprobado:** Sin DB segura, requisito de entorno no debe detener tests de contrato autorizados.

- **L1:** Un intento DB acotado.
- **L2:** No instalar por fuerza ni Docker compartido.
- **L3:** Focalizar causas DB, no parches de infraestructura.
- **L4:** Reporte simple de bloqueo.
- **L5:** DB `NOT_RUN_ENV` sin disfraz.
- **L6:** Continuar B–D en el mismo lote.

**Fallo del juez:** RECHAZADO BLOQUEO TOTAL; avanzar de forma segura.

### J03 — ¿Usar SQLite o fake para cerrar migraciones?

**Contraargumento comprobado:** B17/B19/B20 dependen de InnoDB, bloqueo y FK; SQLite no valida eso.

- **L1:** Usar motor realmente existente.
- **L2:** No duplicar repositorios fake.
- **L3:** El defecto es de capa DB.
- **L4:** Claridad sobre “test host”.
- **L5:** Concurrencia real solo dos conexiones MariaDB.
- **L6:** Fakes previos no se reejecutan.

**Fallo del juez:** RECHAZADO FALSO PASS; permitir fake solo como host etiquetado.

### J04 — ¿Añadir índices/FK a todas las tablas por consistencia?

**Contraargumento comprobado:** No se conoce DDL actual de índices padres ni tipo de tenant en todas las tablas.

- **L1:** Cambio mínimo real.
- **L2:** No esquemas en paralelo.
- **L3:** Índice nuevo solo tras fallo comprobado.
- **L4:** Integridad visible sin promesa falsa.
- **L5:** Mostrar DDL y motivo.
- **L6:** No expandir alcance a migración universal.

**Fallo del juez:** RECHAZADO PARCHE PREVENTIVO.

### J05 — ¿Dos conexiones secuenciales bastan?

**Contraargumento comprobado:** LockForUpdate y UNIQUE bajo carrera requieren interleaving verificable.

- **L1:** Barreras simples.
- **L2:** No biblioteca de orquestación masiva.
- **L3:** Reproducir colisión.
- **L4:** Timeout/cleanup preserva entorno.
- **L5:** Connection ID y secuencia de ambos commits.
- **L6:** No duplicar 110 tests.

**Fallo del juez:** RECHAZADO: exigir sesiones solapadas o `NOT_RUN_ENV`.

### J06 — ¿Crear segunda autenticación/proveedor HR para completar recorrido?

**Contraargumento comprobado:** La legitimidad de rol/consentimiento no está aprobada.

- **L1:** Reusar auth actual.
- **L2:** No nuevo login ni CTA público.
- **L3:** Resolver contrato y aceptar bloqueo.
- **L4:** Denegación explícita en UX.
- **L5:** host actingAs no legitima acceso comercial.
- **L6:** Owner decide con pregunta concreta.

**Fallo del juez:** RECHAZADO: conservar default deny.

### J07 — ¿Rehacer todas las pruebas B13–B20 para tener más PASS?

**Contraargumento comprobado:** Los SHA previos ya tienen alcance conocido y no prueban runtime.

- **L1:** Solo frontera y delta.
- **L2:** No repetir suites host sin cambios.
- **L3:** Prueba integración donde falla contrato.
- **L4:** Diagnósticos legibles.
- **L5:** L5 independiente aún pendiente.
- **L6:** No ciclo permanente de auditorías.

**Fallo del juez:** RECHAZADO: matriz con proveniencia.

### J08 — ¿Promover S1 a B21 global e iniciar B22?

**Contraargumento comprobado:** SPEC V5 requiere QA 110+, UX real, hardware, rendimiento y legal.

- **L1:** Hito S1 acotado.
- **L2:** No ocultar deudas en un resumen.
- **L3:** Cerrar gates reales antes GO.
- **L4:** UAT humano independiente.
- **L5:** L5 y mismo tree/build no comprobados.
- **L6:** B22 solo aprobación escrita.

**Fallo del juez:** RECHAZADO: `B21_GLOBAL=NOT_APPROVED`.

### J09 — ¿Implementar permisos legales/ATS sin aprobación para permitir E2E?

**Contraargumento comprobado:** El test no puede legitimar contrato jurídico pendiente.

- **L1:** Deny by default.
- **L2:** No segunda policy oculta.
- **L3:** No convertir fixture QA en permiso.
- **L4:** CV/PII de terceros protegidos.
- **L5:** Documentar policy ausente como BLOCKED_CONTRACT.
- **L6:** Decisión de propietario agrupada ≤8.

**Fallo del juez:** RECHAZADO: separar code/test de decisión externa.

### J10 — ¿Crear B21-S2 automáticamente ante gate inaccesible?

**Contraargumento comprobado:** El mismo bloqueo no mejora multiplicando informes; debe haber actor externo o entorno seguro.

- **L1:** Una tarea productiva completa.
- **L2:** Un ZIP; sin evidencias sueltas.
- **L3:** Diagnóstico final accionable y frontera host si nueva.
- **L4:** Salida y actor claros.
- **L5:** No afirmar PASS sin comando/log.
- **L6:** ChatGPT acepta delta; owner decide próximos pasos.

**Fallo del juez:** RECHAZADO: una sola orden V2 con resultado parcial honesto.

## Controles de calidad de la orden V2

| Control | Evidencia/criterio | Resultado de revisión documental |
|---|---|---|
| ID y raíz única | Orden empieza `# CODEX LUNA`, TASK_ID `B21-S1-V2` | PASS documental |
| Criterios preservados | Las 24 líneas `I01`…`I24` son idénticas a V1 | PASS, comparación textual |
| DB no inventada | MariaDB exclusiva en D:, sin tocar DB externa ni `migrate:fresh` sin acreditar pertenencia | PASS de instrucciones |
| Carrera no fingida | Requiere IDs de dos sesiones, interleaving/barrera, timeout/cleanup | PASS de instrucciones; NO ejecutado |
| FK no especulativas | DDL real antes de cambios y `SCHEMA_GAP_REPRODUCED` | PASS de instrucciones; NO ejecutado |
| B19/B20 por defecto | Mantiene denegación productiva; pruebas host etiquetadas | PASS de instrucciones |
| S1 frente a H9 | S1 `PARTIAL/PASS_SCOPED`; B21 global `NOT_APPROVED`, B22 no GO | PASS de instrucciones |
| Antirruido | 1 tentativa DB, 1 inventario, solo tests frontera/delta, un ZIP | PASS de instrucciones |
| Alcance de evidencia | V2 no trae nuevos logs runtime; su eficacia queda a prueba de Codex | PENDIENTE |

## Matriz de rumbo — una sola continuación

**Codex Luna ahora:** ejecutar V2 **sin releer/auditar los ZIP ya juzgados**. DB real si y solo si infraestructura propia y segura, pruebas simultáneas comprobables, identidad autorizada sin crear una, ocho fronteras y 24 oráculos con estados falsables. Si DB no está, ejecutar una prueba de contrato de frontera faltante solo cuando realmente agregue cobertura, más plan de bloqueo específico. Un único ZIP con hashes, diff/baselines y logs.

**ChatGPT Director después:** adjudicar el ZIP B21 una sola vez, distinguir P0/P1 real de barrera legal/infraestructura, pedir decisiones de propietario en bloque cuando corresponda, completar B21/H9 global en la misma versión/build realmente probado y considerar B22 solo tras GO escrito. No convertir `NOT_RUN_ENV`/`BLOCKED_CONTRACT` en `PASS` por inercia.

**Gates aún abiertos según último estado B20:** MariaDB/locks reales, identity chain B13–B17, web login y empresa real B16, permisos HR B17/B19/B20, ATS público/consentimiento/CV malware, reglas salariales homologadas B18, L5 runtime y dispositivos. No hay evidencia de que estos bloqueos hayan sido resueltos en B21 al momento de redactar V2.

**Ruta documental de continuidad:** rama `docs/pingponglaw-l1-l6-canon-84e961c`, PR #2 DRAFT, `docs/CODEX_LOTE_ACTUAL.md` debe contener V2, `docs/AUDITORIA_DIRECTIVA_ACTUAL.md` esta auditoría, `docs/JORNATO_CONTINUIDAD.md` la única orden activa. `main` permanece sin WIP del producto. **Siguiente actor: CODEX LUNA.**