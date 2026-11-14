# CODEX LUNA — JORNATO B18-S1 V2 · MACROBLOQUE PRODUCTIVO DE REMUNERACIÓN INFORMATIVA Y CIERRE EXPLICABLE

**TASK_ID:** `JOR-B18-S1-V2-ESTIMADOR-LABORAL-EXPLICABLE-ONEBATCH-20261114`  
**DIRECTOR/RESPONSABLE DE ACEPTACIÓN:** ChatGPT. **EJECUTOR:** CODEX LUNA. No improvisar requisitos, autorizaciones, arquitectura ni un nuevo lote de auditoría.  
**RAÍZ ÚNICA:** `D:\codex\Jornato`. Temporales, copias y reportes propios exclusivamente bajo `D:\codex\_REPORTES\Jornato\JOR-B18-S1-V2-ESTIMADOR-LABORAL-20261114\`. No escribir C:.  
**ZIP ÚNICO FINAL:** `D:\codex\_REPORTES\Jornato\JOR-B18-S1-V2-ESTIMADOR-LABORAL-20261114\JOR-B18-S1-V2-ESTIMADOR-LABORAL-20261114-UNICO.zip`. Entregar SOLO este ZIP, no quince reportes por separado.  
**PROHIBICIONES:** NO stage, commit, push, merge ni deploy de código; NO `git reset/clean/checkout` destructivos, NO borrar untracked/dirty, NO intervenir otros proyectos/Docker compartido, NO cambiar main, NO publicar datos reales, NO instalar dependencias de pago. No migrar producción. No suponer que PR #2 documental contiene el código local.  
**B18 V1:** ORDEN HISTÓRICA SUSTITUIDA; NO EJECUTAR V1 NI REPETIR SU AUDITORÍA DE B17. B18 V2 se audita aquí ANTES de Codex, sin nueva entrega B18 recibida.
**ESTADO PREVIO A RESPETAR:** B17-S1 V2 recibido como `PARTIAL_HOST_OR_CONTRACT`. ZIP recibido SHA256 `745B608028B8522C0013789EE939869FF4D946CE4C1199545BB50A346A82D75A`; 63 miembros, manifiesto 62/62, patch 15/15 y lint PHP 9/9 verificados de forma independiente; PHPUnit 7/30 atribuido a Codex, DB_REAL/Flutter/HTTP-kernel/L5 NOT_RUN. B17 no es ausencia justificada aprobada ni tiempo pagable; `REVIEW_PERMISSION_GATE=BLOCKED_CONTRACT`, `PERSONAL_REQUEST_HTTP=BLOCKED_IDENTITY_CONTRACT`, `RELEASE_APPROVED=NO`. B13/B14/B15/B16 siguen pendientes de integración. NO repetir esos lotes por rutina.

## 0. REGLAS DE AUTORIDAD, CONTRATOS Y CORTE

0.1 Leer ANTES de modificar `AGENTS.md` que realmente rija el checkout, README, documentación local aprobada y el canon fijo PingPongLaw `sierraglobalcompany-rgb/PingPongLaw@84e961cadf482d234f4c0ee2ca60e8c7e9b388e8`, `docs/engineering/LEYES_IMPLEMENTACION_1_A_6.md`. Contrastar con `docs/JORNATO_CONTINUIDAD.md` de la rama documental **si está disponible**; la orden y el ZIP mandan sobre estados desactualizados de docs. Si falta acceso al canon, registrar `CANON_READ=BLOCKED` y conservar reglas existentes; no inventar cumplimiento. Leyes: L1 KISS/Ponytail, L2 antirruido, L3 antiparches, L4 UX aprobada, L5 QA independiente y estado real, L6 antipingpong.

0.2 **El anexo B03/H1 es CANDIDATO documental y no decisión firmada de nómina:** fija vocabulario y seis magnitudes a preservar, pero todo `[P]`, `[J]` o `[OPEN]` sigue sujeto a aprobación. No aprobar reglas salariales porque estén escritas en B03 o SPEC V5. **Las seis magnitudes a conservar son:** `PROGRAMADO`, `OBSERVADO`, `JUSTIFICADO`, `RECONOCIDO`, `CLASIFICADO`, `ESTIMADO_MONETARIO`. Una marcación recibida por B14 (`SERVER_STORED/UNASSESSED`) **no** acredita `OBSERVADO` validado, `RECONOCIDO` ni `CLASIFICADO`. Una solicitud B17 `PENDING` o `APPROVED` tampoco acredita horas trabajadas. No inventar «8 h trabajadas» al ver 6 h trabajadas + 2 justificadas.

0.3 **SPEC V5 B18 es candidata de alcance**, no aprobación de fórmulas jurídicas. Mantener stack efectivo Flutter + Laravel monolítico + Sanctum + MariaDB/InnoDB, no imponer PostgreSQL mencionado en SPEC candidata. Tarifas, recargos, topes diarios/semanales, divisor del valor hora, festivos, país, descanso contractual, deducciones, retención, prima, cesantías, seguridad social, cumplimiento y firma contable **NO están homologados** en el contexto demostrado. CERO números legales por defecto y CERO pretendida «nómina legal Colombia». No afirmar vigencia legal de 42 h ni de otros umbrales sin fuente/regla versionada y aceptación expresa posterior.

0.4 No cambiar la UX aprobada ni categorías de B17. No inventar acceso del contador, salario público, precio Pro, cobro/entitlement, política de edición, contrato de empleado ni tablas financieras nuevas solo para satisfacer un test. Si un contrato falta, documentar gate y construir las partes puras/QA seguras.

### 0.5 Decisiones CERRADAS por el director en auditoría B18 V2 (10 verdugo + 10 juez)

- **No hay evidencia nueva de ejecución B18.** El último ZIP probado sigue siendo B17 V2; no repetir su PHP 9/9, ZIP 62/62, reproducción 15/15 o QA histórica. Inspeccionar solo código relevante de B18 una vez en `D:` y construir.
- **Un solo motor puro PHP o el motor Dart ya canónico si existe; nunca ambos.** Una sola fuente de reglas de redondeo por cálculo. El núcleo puede dar `PASS_UNIT_SYNTHETIC` sin MariaDB; producto no comercial hasta contratos, login y L5.
- **Tres ejemplos monetarios QA POSITIVOS obligatorios, uno por modalidad:** `hourly`, `daily`, `monthly_fixed`, cada uno con insumos completos ficticios y una expectativa aritmética de centavos; NO aceptar que `daily` y `monthly_fixed` sean solo stubs que devuelven `UNAVAILABLE` por diseño. No calcular esas modalidades sin bases explícitas del fixture.
- **Huella reproducible:** la huella de insumos DEBE excluir `calculated_at`, IDs aleatorios de ejecución, orden incidental de diccionarios y timestamps de log; incluir valores/versiones/periodos/moneda/identidad sintética/estados de procedencia/política de cálculo ordenados canónicamente. Reejecutar a distinta hora => misma huella y centavos. El timestamp de presentación puede diferir.
- **QA sintética ≠ regla homologada:** los 3 resultados positivos solo son válidos dentro de un caso unitario determinista con factor/regla explícitos y etiqueta `QA_UNVERIFIED`. Fuera de QA, si no existe homologación, `LEGAL_HOMOLOGATION=BLOCKED` y los conceptos dependientes se marcan `UNAVAILABLE`, nunca se ofrece monto vendible ni URL nueva.
- **Cierre de bloque:** si se ejecutan y pasan los tres ejemplos positivos, negativos de procedencia, redondeo y UI host/Blade, se admite `B18_PURE_ENGINE=PASS_UNIT_SYNTHETIC` y `B18_PREVIEW=PASS_HOST_SYNTHETIC`, nunca `B18_GLOBAL=PASS` por la sola ausencia de fallos. Si ni siquiera hay tests puros ejecutables, `B18=PARTIAL_ENV` con razón, NO inventar un PASS ni pedir otra auditoría.

## 1. OBJETIVO DE PRODUCTO Y DEFINICIÓN DE TERMINADO EN ESTE LOTE

Desarrollar **un estimador informativo reproducible, que explica de dónde sale cada cifra**, con seis magnitudes separadas; modalidades `hourly`, `daily` y `monthly_fixed` cuando los datos necesarios existen; entrada expresamente tipada y proveniencia autorizada; periodos y vigencias; cálculo exacto en unidades monetarias menores sin `double/float`; resumen por concepto; exportación protegida donde haya ruta/permiso ya aprobados; vista responsive si el portal B16 y sus permisos existentes permiten hacerlo. Construir en UNA entrega un motor y su presentación segura, no solo un README, pero no publicarlo como nómina definitiva.

**Vertical de éxito sintético QA:** un caso explícito con 6 horas `RECONOCIDO` + 2 horas `JUSTIFICADO` (sin observación de esas 2 h), acuerdo horario, factor candidato QA definido en fixture y fecha/periodo expresos produce separación correcta de magnitudes y desglose monetario SOLO sobre insumos autorizados de ese caso; se puede volver a calcular y obtener exactamente el mismo resultado/huella. Un insumo exclusivamente `SERVER_STORED/UNASSESSED`, B17 PENDING o ausencia de pacto/reconocimiento/rule pack validable debe producir `UNAVAILABLE` con razones, **no $0 ni una nómina de mentira**. Los componentes de UI/export no mostrarán salario personal fuera de un ámbito autorizado.

**Estados de salida separados:** `B18_PURE_ENGINE`, `B18_QA_PREVIEW`, `B18_DB_INTEGRATED`, `B18_WEB_REAL`, `B18_LEGAL_HOMOLOGATION`, `B18_L5_RUNTIME`, `B18_GLOBAL`, `RELEASE`. PASS de pruebas unitarias ≠ homologación jurídica.

## 2. INVENTARIO RÁPIDO, REUTILIZACIÓN Y DECISIÓN DE ARQUITECTURA (SIN PINGPONG)

2.1 Una única inspección focal **solo lectura**: `git status --porcelain -uall`, HEAD, baseline hashes; `server/app`, `server/routes`, `server/resources/views`, `server/tests`, `lib/src`, `test`; localizar `PayAgreementVersion`, `CountryRulePack`, `PayEstimateSnapshot`, ledger B03/B08, tipos `recognized`, export CSV B16, planes y permissions ya aprobados. Guardar matriz `REUSE_DECISIONS.md` con ruta/hash, dueño y criterio. **No buscar durante horas ni repetir auditorías históricas**. Mantener 185+ rutas WIP; no asumir que el árbol publicado en GitHub tiene el software.

2.2 Orden de decisión: (A) si ya existe motor laboral exacto, ampliarlo en su propietario; (B) si existe núcleo de asistencia pero no salarial, crear un solo servicio puro coherente (recomendación: `server/app/Services/B18/InformationalPayEstimator.php` junto a DTO/enum estrictamente necesarios) reutilizando PHP/Laravel; (C) si el motor puro está ya escrito en Dart y es fuente canónica, reutilizarlo y adaptar pruebas sin un segundo motor. **No dos motores PHP/Dart divergentes, no microservicios, no paquete Composer nuevo, no migración de nómina**. Explicar cuál opción eligió y evidencia. Preferir cambios en 4–10 fuentes de producto si el código lo permite; los tests pueden ser más.

2.3 Si B16 portal tiene rutas `auth:web` sin login web real, se puede crear vista/componente Blade y tests con `actingAs` sintético, pero **no exponer enlace/CTA comercial** ni nuevo login. Si un permiso finanzas/contador aprobado NO existe, no registrar rutas reales de estimación privada ni PDF/CSV comercial; conservar vista QA aislada o servicio puro sin ruta. Sin política de payroll, **NO convertir owner/admin en contador universal**. QA exclusivamente ambiente `testing` y flag explícito default OFF para cualquier preview que maneje datos sintéticos. No hace falta fabricar tabla de usuarios, nuevo Sanctum guard o proveedor externo.

2.4 **No crear una tabla adicional** por costumbre. El reporte puede generarse determinísticamente en memoria con un snapshot DTO estructurado y fuentes/hashes. Persistir sólo si existe un modelo aprobado con migración compatible y test DB real. Si el usuario final exige historial durable, registrar `B18_PERSISTENCE_CONTRACT=PENDING` con lugar previsto, no crear staging de datos sensibles. No leer ni modificar datos reales de empleados. No `migrate:fresh` sobre base compartida.

## 3. CONTRATOS DE ENTRADA Y PROVENIENCIA — PROHIBIDO INFERIR HECHOS

3.1 Contrato de entrada tipada (nombres adaptar a la base actual): `company_id`, `employee_id`/ID se derivan del servidor si hay consulta autenticada; `period.start/end`, `timezone_iana`, `currency_iso_4217`, `agreement_version_ref` con `effectiveFrom/effectiveTo`, `modality`, `base_amount_minor`, `frequency`, `basis_policy_ref`, `recognizedSegments` con `startUTC/endUTC/sourceDecisionRef/provenanceStatus`, `justifiedSegments` con `sourceApprovalRef/status` separado, `scheduleSegments` separado, `rulePack` con `country/version/valid_from/to/approval_status/source_refs`, `calculation_context` con versión del motor, política de redondeo y fuentes. Campos no verificables => `UNAVAILABLE` con motivo concreto.

3.2 Tipo de magnitud obligatorio, sin aliases ambiguos: `PROGRAMADO` ≠ `OBSERVADO` ≠ `JUSTIFICADO` ≠ `RECONOCIDO` ≠ `CLASIFICADO` ≠ `ESTIMADO_MONETARIO`. Regla de frontera: **ninguna** entidad `sync_events`, `server_receipts`, `leave_requests` ni hora de dispositivo se promueve automáticamente a `RECONOCIDO` por entrar a la base. El pack de clasificación requiere regla explícita válida para el tiempo y contrato; si no existe, `CLASIFICADO=UNAVAILABLE`, `ESTIMADO_MONETARIO=UNAVAILABLE`. No «remunerar» ausencias sin política de pago por tipo y país aprobada. El ejemplo de 2 h justificadas solo sirve para mostrar dos columnas distintas, no para sumarlas como trabajadas.

3.3 Mínimo de seguridad: estado origen `VERIFIED_RECOGNITION` debe contener fuente/actor decisor autorizado, tenant, empleada/o, intervalo no solapado y versión de decisión; `SOURCE_UNVERIFIED`, `CLIENT_DECLARED`, `SERVER_STORED/UNASSESSED`, `PENDING`, `NO_MATCH` no elevan el cálculo. No crear un endpoint POST donde el cliente pueda marcar `recognized=true` o enviar IDs autoritativos de empleados. QA fixtures sintéticos **dentro de test**, sin ruta abierta que reciba un salario de cualquier cuenta.

3.4 Tratar contratos `hourly`, `daily`, `monthly_fixed` por separado: fijo mensual **no** se divide de oficio por 30/240/horas esperadas; acuerdos diarios **no** se convierten por defecto a tarifa horaria; recargos no se suman dos veces a la base incluida en fijo. Si falta divisor, pacto o política de proporción/hora expresos, devolver `UNAVAILABLE` del concepto afectado y no inventar una regla. Permitir resultado parcial **por concepto** explicando lo calculable y lo no calculable; prohibido declarar total completo cuando faltan componentes obligatorios.

3.5 Vigencia: dos acuerdos en el mismo periodo obligan a segmentación explícita por fecha sin reescribir salarios históricos. Jornadas que cruzan medianoche, festivo o zona deben mantener intervalos reales y fuente; funciones de calendario **solo** si pack con zona/fecha aprobado. Nunca inferir descanso contractual igual a domingo. Días/meses semanas y cierres de quincena se definen en los contratos, no en constantes globales inventadas.

## 4. MOTOR DE CÁLCULO — REPRODUCIBLE Y EXPLICABLE

4.1 Implementar un único `EstimateResult`/DTO con `status=COMPLETE_SYNTHETIC_QA|PARTIAL|UNAVAILABLE`, `blocks[]` para seis magnitudes, `concepts[]` cada uno `{type, quantity_seconds, amount_minor|null, factor_numerator, factor_denominator, component=BASE|ADDITIONAL, applied_rule_ref, source_refs, warning_codes}`, `totals` solo para bloques íntegros, `contract_versions`, `country_rule_version`, `engine_version`, `rounding_policy_ref`, `input_fingerprint`, `calculated_at` (**metadato excluido de la huella y de las comparaciones de determinismo**), `blocking_reasons[]`, `is_legal_payroll=false`. Cero `approved`, `paid`, `legally_compliant` inventado. Si no hay snapshot seguro de fuente, `source_refs` no contiene PII ni IDs explotables fuera del tenant.

4.2 Aritmética exacta: minor units de moneda + duración en **segundos enteros**, factor racional de enteros; sin `float`, redondeo determinista declarado (p.ej. al cierre de concepto, definido por fixture, no como ley). Guardar el resto o razonar medio-centavo y no truncar silenciosamente. Prevención de overflow, denominadores cero y cifras negativas donde prohibidas. Si se usa librería decimal **ya instalada**, no agregar otra. Para 1.25× expresar 5/4 y declarar si representa monto TOTAL o solo ADICIONAL; prohibido duplicar salario fijo. **Implementación obligatoria:** cantidades enteras en unidades menores, duración en segundos y productos racionales; fórmula para tarifa/hora: `round_policy(base_minor_per_hour × seconds × factor_numerator / (3600 × factor_denominator))`. Aplicar exactamente una vez el redondeo al cerrar cada concepto (no en cada segundo), con overflow/denominador/escala comprobados ANTES de operar; dividir/cancelar por MCD si hace falta, sin `float` ni riesgo de conversión silenciosa. Para moneda con escala desconocida, `UNAVAILABLE_CURRENCY_SCALE` (no asumir dos decimales).

4.3 Clasificación temporal: no crear `CountryRulePack Colombia legal definitivo`. Crear contrato versionado que permita **inyectar exclusivamente en tests** factores/umbrales explícitos de la fixture con estado `QA_UNVERIFIED`. Ninguna fixture se instala como regla de producción; si no existe pack legalmente homologado, la UI productiva muestra «No disponible — requiere reglas verificadas». Si se encuentra un pack de Colombia aprobado previamente con SHA, autoridad y fecha, reutilizarlo sin editar números, y probar vigencias. No copiar tarifas de la memoria del modelo ni de Internet sin aprobación del propietario y revisión profesional.

4.4 Validador central: intervalos ISO RFC3339 con offset y timezone IANA del acuerdo/empresa; conversión UTC sin sumar/descontar horas DST al azar. Orden, duración > 0, no solape de segmentos reconocidos, gaps trazables, límites explícitos técnicos; errores `INVALID_*` no se convierten en 0. Dos empresas nunca se mezclan en un estimador. No almacenar payloads médicos ni tokens. Si la fuente cambia, nuevo fingerprint/version; no reescribir un informe previo como si fuera igual. **Serializar canónicamente antes de hash**: ordenar claves, ordenar listas por referencia estable de origen/intervalo, normalizar periodos UTC/RFC3339, fijar codificación y versión del esquema. Dos ejecuciones en diferente hora con mismas entradas deben devolver misma huella, sin incluir `calculated_at`, request ID, orden casual de mapas o reloj del proceso. Rechazar intervalos sin zona válida, offset contradictorio o segmento que cruza la vigencia de pacto sin partirlo en límites semiabiertos `[start,end)`. No atribuir a B14/B17 estado RECONOCIDO en producción.

4.5 Desglose obligatorio de ejemplo QA:
- Programado: 8 h, fuente de turno sintético; observado: 6 h, fuente sintética fiable; justificado: 2 h (aprobación QA sintética); reconocido: **6 h**; clasificado: 6 h «ordinarias de fixture» (si existe regla QA explícita); monetario: 6 h × valor horario pactado × factor QA explícito; las 2 h justificadas aparecen APARTE sin automatismo de pago.
- Con solo `SERVER_STORED/UNASSESSED`: reconocido, clasificado y total monetario **UNAVAILABLE** (no 0), con causa `SOURCE_NOT_RECOGNIZED`.
- Con salario fijo y ausencia de `basis_policy_ref` o pack: no inventar prorrateo/recargos; `PARTIAL/UNAVAILABLE` con motivo.

### 4.6 Tabla cerrada de fixtures numéricas QA y resultado esperado (NO tasas de ley)

Codex DEBE implementar los casos **F01–F07 dentro del macrobloque**, no documentarlos solamente. Los ejemplos usan moneda `COP` (ISO 4217) únicamente como **etiqueta de formato de prueba**, con escala explícita del fixture de dos decimales (100 unidades menores = 1 mayor); las cuantías, factores y reglas son completamente ficticios y NO legales. No generalizar la escala de COP a monedas con escala distinta. Los factores se aplican **una sola vez** al concepto, sin sumar una BASE segunda vez cuando el componente es TOTAL.

| Fixture | Modalidad, entradas sintéticas y regla | Resultado exacto en unidades menores | Gate |
|---|---|---|---|
| F01 | `hourly`, 12.345 menores/h, 6 h RECONOCIDAS, factor TOTAL 5/4, HALF_UP al concepto; 2 h JUSTIFICADAS separadas | `92.588`; `RECONOCIDO=6h`, `JUSTIFICADO=2h` y ninguna suma de 2h a pago | `PASS_UNIT_SYNTHETIC`, NO salario real |
| F02 | `daily`, 54.321 menores/día, **dos días expresamente reconocidos para pagar** por una fuente ficticia distinta de sumar horas, factor TOTAL 1/1 | `108.642`; no hubo conversión horaria implícita | QA solo |
| F03 | `monthly_fixed`, acuerdo vigente el mes completo, 2.345.678 menores/periodo mensual, `full_period_basis=EXPLICIT_QA`, sin prorrateo ni recargos | `2.345.678` de base; no inferir horas del monto fijo | QA solo |
| F04 | `hourly`, 101 menores/h, 3600 s, factor TOTAL 1/2; política HALF_UP y política HALF_EVEN en dos corridas | `51` con HALF_UP; `50` con HALF_EVEN; distinta política produce distinta huella | QA solo |
| F05 | mismo F01, repetir con reloj distinto, claves JSON en otro orden y segmentos en otro orden, pero mismas fuentes y versiones | **mismo** importe `92.588`, **misma huella**; `calculated_at` puede diferir | QA solo |
| F06 | 6h solo `SERVER_STORED/UNASSESSED` o B17 `PENDING`, sin decisión reconocedora; opcionalmente acuerdo horario presente | monetario `UNAVAILABLE`, motivo de fuente; **no** valor 0 | Seguridad/fuentes |
| F07 | `daily` sin fuente de días pagables; `monthly_fixed` periodo parcial sin base de prorrateo aprobada, o pack inexistente fuera QA | concepto afectado `UNAVAILABLE`; sin fórmula inferida | Seguridad/contrato |

**Cálculo visible F01:** `12345×(6×3600)×5/(3600×4) = 92587.5` menores; HALF_UP ⇒ `92588`. La BASE de 74070 menores ya está incluida en ese concepto TOTAL; no sumar 74070 + 92588. **No usar `round()` de punto flotante**. F02 y F03 prueban que las modalidades tienen una ruta positiva real con bases expresas; no autorizan crear reglas legales. **Un fixture solo declarativa/no ejecutada NO obtiene PASS.**

### 4.7 Estados de implementación por modalidad y errores de cálculo

- El motor debe retornar **por modalidad** `CALCULABLE_SYNTHETIC`, `UNAVAILABLE_CONTRACT`, `UNAVAILABLE_SOURCE`, `UNAVAILABLE_RULE` o `INVALID_INPUT`, más códigos detallados. No transformar falta de pacto en importe cero. `COMPLETE_SYNTHETIC_QA` solo existe cuando no falte ningún componente obligatorio del caso F01/F02/F03; de lo contrario `PARTIAL` o `UNAVAILABLE`.
- F01 y F04 requieren operaciones racionales seguras que nunca conviertan enteros a double. Si se usa tipo entero nativo, verificar el tamaño máximo **antes de multiplicar** y devolver `OVERFLOW`, sin wraparound. Una cifra negativa/no finita o una moneda sin escala aceptada es `INVALID_INPUT`/`UNAVAILABLE`, no compensación silenciosa.
- Acordar `effectiveFrom/effectiveTo` sobre periodos semiabiertos; segmentación de O16 por versión, con fuentes y huellas distintas. Si hay dos acuerdos válidos solapados para misma empresa/empleado/instante, retornar `AMBIGUOUS_AGREEMENT` (no elegir arbitrariamente).
- La UI o exportación QA debe mostrar el nombre de cada magnitud y explicitar por qué faltan montos; ningún número de dinero QA será servido por un endpoint de producción. No registrar datos reales en fixtures.

## 5. PRESENTACIÓN MÍNIMA DE PRODUCTO — SIN PANTALLA FICTICIA

5.1 Reutilizar la estructura web B16 y componentes responsive **si son compatibles con UX aprobada**; no añadir otra SPA. Crear panel de solo lectura «Cierre informativo (QA)» con los seis bloques, desglose de conceptos, fuentes, estado y advertencias, dos ejemplos sintéticos de pruebas accesibles SOLO a test/fixtures; no inyectar datos sintéticos en la aplicación productiva. Si `WEB_LOGIN_REAL=BLOCKED_CONTRACT`, NO mostrar CTA público ni afirmar navegación comercial. Si la infraestructura web no compila, continuar servicio de dominio y vista widget/Blade validada con test host, gate explicitado.

5.2 Si ya existe ruta/permiso **aprobado** de finanzas e informe, integrar lectura a fuente autorizada del tenant y exportar reutilizando CSV B16 con saneamiento anti formula, separación de datos y permisos; si no, NO registrar endpoint de reporte real ni inventar `finance:read`. Una exportación sin permiso comercial solo se testea con fixture sintética y nunca se expone en producción. CSV que exporta `UNAVAILABLE` muestra esa palabra y causa, jamás COP 0. No PDF/firma/descarga salarial pública.

5.3 En tabla por conceptos distinguir «base incluida» de «recargo adicional». Fecha/huso y método de cálculo legibles; advertencia visible permanente **«Estimación informativa; no constituye nómina ni liquidación legal»** para salida QA. Accesibilidad: labels reales, contraste y teclado en interfaz existente, mensajes no ocultos por color, móvil/tablet/web razonable. El input QA no pedirá nombre/identificación real ni diagnósticos B17.

## 6. PLAN DE EJECUCIÓN ÚNICO — CODIFICAR, PROBAR, EMPAQUETAR

**G0 / Custodia de 1 pasada:** registrar HEAD/branch, `git status --porcelain -uall`, lista/hashes de todos los archivos WIP (incluidos untracked y `.salive`) y código propietario relevante. NO stage ni tocar untracked ajeno. Detectar cambios paralelos del propietario por SHA; si existe conflicto, no sobrescribir, trabajar en copia aislada y reportar. Un solo inventario y una sola matriz de reutilización.

**G1 / Contrato e implementación:** implementar fuente `server/app/Services/B18/*` o propietario equivalente ya existente; motor puro, DTO y validador; contrato de regla inyectable por QA. No añadir API pública, tabla nueva, servicio externo o wrapper genérico solo para obtener `PASS`. Incluir tratamiento de límites y errores.

**G2 / Presentación:** integrar parcial B16 de forma segura si hay `auth:web`/permission aprobada y renderer existente; de lo contrario vista/presentador testable en host sin ruta accesible comercialmente. Mantener interfaz y mensajes honestos, CSV focal reutilizado únicamente si hay un scope autorizado. No tocar Flutter de B17 salvo que contrato existente ya habilite reporte por trabajador y sea seguro.

**G3 / Tests focales:** ejecutar F01–F07 y unit tests puros y un renderer test en herramientas realmente disponibles; un RED opcional *solo si hay defecto reproducible*; GREEN. En caso de necesitar DB con QA aislada existente, permitir una ejecución kernel focal sintética; si no, `DB_REAL=NOT_RUN_ENV` y no arrancar Docker compartido. No repetir B13-B17 suites masivas; máximo regresiones vecinas por dependencia modificada. No declarar `L5_INDEPENDENT_RUNTIME=PASS` por la autorrevisión de Codex. Si compila aquí, guardar stdout, stderr y código de salida auténticos, no texto inventado.

**G4 / Seguridad y oráculos:** verificar además cada F01–F07 con `fixture_id`, entrada exacta, centavos esperados/reales, política y huella en `LOGS/fixtures.txt`. Verificar todos los oráculos abajo con estados `PASS_EXECUTED`, `PASS_STATIC`, `BLOCKED_CONTRACT`, `NOT_RUN_ENV`, `FAIL` y `NOT_APPLICABLE_WITH_REASON`; para cada uno fuente SHA y log/resultado. Solo `PASS_EXECUTED` cuando test realmente se corrió. Ningún PASS de remuneración legal sin aprobación de regla. Versiones de paquetes, país, periodo y contrato explícitas.

**G5 / Parche reproducible y ZIP:** registrar hashes pre/post de fuentes touched, baselines byte exactos y marcadores `ABSENT_PRE_B18` para nuevas fuentes; elaborar un patch 1:1 que pase `git apply --check` / dry-run y replay en **copia aislada**. Empaquetar informes, logs y patch, no duplicar fuentes sin justificación. Validar CRC, manifest SHA256/tamaño de TODOS los miembros salvo propio manifiesto, ruta no absoluta ni `..`, reextracción muestras; no secretos, PII, certificados, `.env` ni datos de empresa. El único ZIP queda en la ruta acordada.

**G6 / FINAL:** informar `TASK_ID`, `HEAD_PRE/POST`, `WIP_BASE/FINAL`, `CHANGED`, `NEW`, `STAGED=0`, gates puros/QA/DB/web/legal/L5, `ZIP_SHA256`, `NEXT_OWNER=CHATGPT`, `RELEASE_APPROVED=NO`. NO prometer entregar luego. No pedir permiso para otro prompt o diagnóstico. Tras B18 el director adjudicará el ZIP e iniciará B19; las reglas legales reales se homologarán en B21/experto jurídico, sin bloquear construcción segura de B18.

## 7. MATRIZ DE 40 ORÁCULOS FALSABLES (NO ASUMIR TODOS PASS)

Cada oráculo debe aparecer en `TEST_MATRIX.csv` como una sola fila: ID, esperado, ámbito, comando, exit, evidencia, SHA de fuente, resultado, límite. **Nunca fabricar pruebas.**

**Identidad y fuentes (O01–O08)**
- O01: seis magnitudes tipadas distintas; ningún campo `totalHours` ambiguo.
- O02: B14 `SERVER_STORED/UNASSESSED` no eleva RECONOCIDO.
- O03: B17 solicitud PENDING/APROBADA no eleva OBSERVADO ni RECONOCIDO automáticamente.
- O04: falta fuente `RECONOCIDO` devuelve UNAVAILABLE, no cero.
- O05: `company_id` y empleado no se aceptan como autoridad de cliente.
- O06: A/B interempresa no comparten fuentes en memoria, DTO ni CSV.
- O07: fuente/reconocimiento con versión cambia fingerprint de entrada y resultado.
- O08: los DTO no contienen salud, PAT, PIN, GPS bruto ni PII no necesaria.

**Matemática y modalidades (O09–O18)**
- O09: **ejecutar F01** horario 6h × factor QA 5/4 = `92.588` menores, resultado exacto y sin sumar base dos veces.
- O10: 6 h RECONOCIDO + 2 h JUSTIFICADO ≠ 8 h trabajadas.
- O11: **ejecutar F03 y F07** fijo mensual completo = `2.345.678` menores QA; parcial sin basis => UNAVAILABLE.
- O12: **ejecutar F02 y F07** diario dos días expresos = `108.642` menores QA; sin días reconocidos => UNAVAILABLE.
- O13: no duplicación BASE y ADDITIONAL en mismo concepto.
- O14: **ejecutar F04**, 101 menores/h × 1h × 1/2 => `51` HALF_UP y `50` HALF_EVEN, sin floats.
- O15: números negativos/overflow/denominador 0 se rechazan.
- O16: acuerdo cambia a mitad de periodo: segmentación por vigencias.
- O17: **ejecutar F05** en relojes/orden de claves diferentes, importe `92.588` y huella idénticos; no incluir `calculated_at`.
- O18: diferencia explícita entre ingreso parcial y total completo.

**Calendario y normativa (O19–O26)**
- O19: timezone+offset RFC3339 y UTC válidos preservan duración real.
- O20: cruce de medianoche no crea horas extra por algoritmo.
- O21: DST/offset inconsistente es error, no salario silenciosamente distinto.
- O22: intervalos reconocidos solapados no se cuentan dos veces.
- O23: pack país/version sin aprobación da LEGAL_HOMOLOGATION=BLOCKED.
- O24: país sin pack vigente: conceptos afectados UNAVAILABLE.
- O25: descanso contractual distinto de domingo no se asume.
- O26: no hay festivos/recargos/umbral semanal hardcoded sin fuente vigente.

**Producto y privacidad (O27–O34)**
- O27: panel QA separa seis magnitudes y muestra causas de UNAVAILABLE.
- O28: no hay ruta pública, permisos ficticios ni auth paralela.
- O29: advertencia «no es nómina» visible en vista de QA.
- O30: CSV sintético prueba neutralización de fórmulas + UTF-8 (si se habilita).
- O31: ausencias justificadas no son presencia ni pago por defecto.
- O32: ingresos/estimación real no accesibles por otro tenant/empleado.
- O33: HTML/Blade seguro contra escaping de razones/reglas.
- O34: estado B16 sin login web sigue BLOCKED, no comercial navegable.

**Custodia y QA (O35–O40)**
- O35: HEAD/branch y WIP original intactos salvo fuentes autorizadas.
- O36: baselines, marcadores y patch reproducen postestado byte exacto.
- O37: unit/domain realmente ejecutados (con exit y logs) o NOT_RUN_ENV.
- O38: DB/navegador/Flutter/L5 estados separados, sin falsos PASS.
- O39: manifest, CRC, SHA externo y seguridad ZIP PASS reales.
- O40: solo un ZIP, RELEASE=NO, NEXT_OWNER=CHATGPT y sin stage/commit/push/merge/deploy.

## 8. AUTOAUDITORÍA OBLIGATORIA DE CODEX — 10 PASADAS × 6 LEYES, NO 60 TESTS

En `AUDIT_L1_L6_10_PASSES.md` escribir **diez** pasadas, cada una con L1–L6 y cuatro aspectos por ley: observación, contraejemplo, corrección concreta y límite. No copiar la misma frase 60 veces. Pasadas: (1) fuentes/versiones, (2) reutilización de motor, (3) separación magnitudes, (4) base/recargos, (5) precisión matemática, (6) zonas/periodos, (7) permisos, (8) UX/CSV, (9) QA genuina y WIP, (10) finalización/gates. Si un test no corre, mantener `NOT_RUN`; el propio ejecutor NO satisface L5 independiente.

## 9. CONTENIDO OBLIGATORIO DEL ZIP ÚNICO

- `FINAL_REPORT.md`: resultado, fallos/limitaciones, qué hace el usuario con el bloque B18, próxima dirección B19.
- `SOURCE_CHANGE_MATRIX.csv`, `SOURCE_HASHES_PRE_POST.csv`: origen, porqué, baseline y SHA de cada fuente.
- `BASELINES/**`, `ABSENT_PRE_B18/**` y `SOURCES/**` de todos los archivos modificados/creados; no incluir WIP ajeno en ZIP sin necesidad (solo hashes/inventario).
- `PATCH_CANDIDATE.diff`, `LOGS/patch-replay-final.txt`; `MANIFEST_SHA256.txt` sin auto-hash circular.
- `CONTRACT_MATRIX.md`: jerarquía B03/B17/B18, 6 magnitudes, modalidades, norma versionada/NO_GO, permisos.
- `TEST_MATRIX.csv` 40 oráculos + `LOGS/fixtures.txt` para F01–F07 y sus importes/huellas reproducibles, `LOGS/*.txt` reales con comando+exit y versión; `ENV_GATES.md`.
- `AUDIT_L1_L6_10_PASSES.md` + `NEXT_GATE.md` + `GIT_CUSTODY.md`.
- Validación externa SHA256 y número de miembros del ZIP; nunca ocultar NOT_RUN.

## 10. PLAN DE LLEGADA A JORNATO COMERCIAL (SIN RESETEAR LOS GATES)

1. **B18 ahora:** cerrar un núcleo informativo técnicamente correcto con QA y fuente de cálculo versionada; sin reglas legales sin homologar.
2. **B19:** documentos/expedientes/plantillas y entrega privada; firmas reales solo con proveedor y consentimiento aprobados, no SHA= firma.
3. **B20:** reclutamiento, CV seguros, entrevistas y transición autorizada candidato→empleado.
4. **B21:** integración sistemática en mismo SHA/build de login/signup/legal B13; outbox y reconocimiento B14; dispositivo/Flutter B15; portal B16; permisos B17; motor B18 con revisor laboral/contable; documentos B19; ATS B20; dispositivos reales, pruebas negativas y seguridad. No completar en un único fake PASS.
5. **B22:** go/no-go escrito del propietario tras B21, planes/tarifas/políticas/términos aprobados, publicación/rollback/soporte. No lanzar ni cobrar antes.

**FINAL: NEXT_OWNER=CODEX_LUNA HASTA DEVOLVER EL ZIP; DESPUÉS NEXT_OWNER=CHATGPT.** B18 V2 SUSTITUYE V1, NO EJECUTAR AMBOS. No se permite abrir por rutina B18-S2 ni exigir otro prompt para avanzar. Apliques estas instrucciones y entrega resultados reales, parciales si el entorno lo requiere; nunca pases gates no ejecutados.