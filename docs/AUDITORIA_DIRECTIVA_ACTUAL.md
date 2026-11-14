# JORNATO — AUDITORÍA B18-S1: 10 VERDUGO + 10 JUEZ (120 JUICIOS) Y ORDEN V2 FINAL

**Fecha:** 2026-11-14 (America/Bogota). **Director:** ChatGPT. **Ejecutor siguiente:** Codex Luna. **Objeto:** SOLO PROMPT B18-S1 y coherencia con contratos de dominio; NO nueva auditoría de B13–B17.

**Material comprobado directamente en esta auditoría:**
- Orden original B18 V1: `CODEX_LUNA_JORNATO_B18_S1_V1_MACROBLOQUE_MOTOR_LABORAL_INFORMATIVO_SIN_NOMINA_ZIP_UNICO_20261113.md`; SHA256 `dccd9eb54b61a145b9b106a5b644fdc85dd9a285c53c0e0d7858bb7906bf8658`, 24970 bytes, 166 líneas. Se leyó su texto completo, incluida matriz O01–O40.
- Orden B18 V2 corregida: `CODEX_LUNA_JORNATO_B18_S1_V2_MACROBLOQUE_MOTOR_INFORMATIVO_TRES_MODALIDADES_QA_ZIP_UNICO_20261114.md`; SHA256 `5657ea05ab6043423b07ee72d402cbe44689e2ea2fae192307631b3571022061`, 33036 bytes, 199 líneas. Se verifican 40 oráculos O01–O40, F01–F07 y una única salida ZIP. **No se ejecutó todavía B18.**
- Dictamen anterior de B17: `JORNATO_B17_S1_DICTAMEN_FORENSE_10_VERDUGO_10_JUEZ_120_LEYES_PLAN_B18_20261113.md`; SHA256 `c04289a33de67ca85d4576cbf94e8d327dda137a8c143331a2f3071f3cfb864d`; contiene la auditoría completa de B17 y no se reabre.
- Anexo B03/H1 (`JORNATO_B03_H1_CONTRATOS_TECNICOS_DOMINIO_V1_2026-10-25.md`): fuente recuperada del Proyecto; dice expresamente **CANDIDATA / PARA REVISIÓN DE NEGOCIO Y QA**, y marca decisiones `[D]`, requisitos `[R]`, propuestas `[P]`, revisión jurídica `[J]`, gate `[G]` y pendientes `[OPEN]`. Preserva las seis magnitudes, **no constituye una aprobación de payroll**.
- GitHub remoto: rama documental `docs/pingponglaw-l1-l6-canon-84e961c`, PR #2 Draft; canon fijo PingPongLaw `84e961cadf482d234f4c0ee2ca60e8c7e9b388e8`. `main` sigue sin código WIP local. Estos datos son lectura documental, no pruebas runtime de Codex.

**Método:** cada pasada atacó una hipótesis de defecto, la contrastó con una contra-decisión independiente y evaluó **L1 KISS/Ponytail, L2 antirruido, L3 antiparches, L4 UX aprobada, L5 QA verificable y L6 antipingpong**. Los 120 juicios de las tablas son de diseño/evidencia; **no son 120 tests ni se está declarando que B18 funcione**.

## Dictamen corto

**Verdugo:** V1 era una orden razonable pero no imponía tres casos monetarios positivos, uno por modalidad; podía confundir un anexo B03 candidato con autoridad final y no excluía explícitamente `calculated_at` de la huella. También faltaban expectativas exactas para medias unidades menores y discrepancias de moneda/intervalos.

**Juez:** mantener el macrobloque, Laravel + MariaDB/Flutter existentes, una sola implementación de cálculo y los O01–O40 sin renumerar. Agregar únicamente F01–F07 como **datos ejecutables de los mismos oráculos**; sin motores adicionales, DB nueva, login inventado, normas Colombia ficticias, servicios pagos ni auditorías previas repetidas.

**Decisión:** **V2 reemplaza V1. SIGUE CODEX LUNA** y debe entregar `JOR-B18-S1-V2-ESTIMADOR-LABORAL-20261114-UNICO.zip`.

---

## 10 PASADAS COMO VERDUGO — REFUTAR LA ORDEN V1

### V01 — Autoridad de B03 y SPEC candidata

**Lo que examiné:** ¿La orden trata vocabulario documental como homologación jurídica o contrato salarial aprobado?

**Evidencia/resultado:** En B18 V1 §0.2 se lee «contrato B03»; el propio B03/H1 se declara CANDIDATA/PARA REVISIÓN, con [P]/[J]/[OPEN].

**Fallo de verdugo:** Ajuste V2: preservar seis magnitudes como estructura técnica, pero no presentar pactos, permisos ni fórmulas como aprobados.

| Ley | Juicio específico |
|---|---|
| **L1** | utilizar el vocabulario B03 sin desplegar un nuevo modelo jurídico de nómina. |
| **L2** | conservar un solo documento de autoridad, evitando una segunda SPEC salarial. |
| **L3** | corregir la causa de autoridad mal atribuida en §0.2, no parchear la UI con un aviso aislado. |
| **L4** | mantener nombres y estados definidos para el producto sin prometer pago legal. |
| **L5** | la lectura de B03 verifica su etiqueta CANDIDATA, no valida una fórmula de Colombia. |
| **L6** | limitar revisión a B18 y no reexaminar B17, cuyo dictamen ya existe. |

### V02 — Estado real y no repetición de B17

**Lo que examiné:** ¿El plan pide volver a verificar todo B13–B17 o falsifica un QA nuevo B18?

**Evidencia/resultado:** La V1 heredó 7/30 PHPUnit B17; no hay ZIP B18 ejecutado; GitHub V1 era una orden, no un resultado.

**Fallo de verdugo:** Conservar evidencia anterior solo como baseline; B18 permanece NOT_EXECUTED y recibe pruebas nuevas únicamente de su motor.

| Ley | Juicio específico |
|---|---|
| **L1** | una inspección focal del propietario de cálculo sustituye otra auditoría general del repo. |
| **L2** | 7/30 tests de B17 no se vuelven a contar como pruebas B18. |
| **L3** | sin fallo de B17 reproducido no nace una corrección de B17-S2. |
| **L4** | no presentar un dashboard B18 como operativo antes del backend correspondiente. |
| **L5** | delimitar QA de B18 futura frente a lo verificado del ZIP previo. |
| **L6** | una orden V2 ejecutable, sin preflight separado ni reauditoría de historia. |

### V03 — Proveniencia de jornadas B14/B17

**Lo que examiné:** ¿Un recibo SERVER_STORED o una licencia aprobada se transforma indebidamente en horas de pago?

**Evidencia/resultado:** V1 §3.2 prohíbe promoción, pero los casos positivos no fijaban todas las fuentes sintéticas y su estatus por modalidad.

**Fallo de verdugo:** V2 exige fuentes ficticias autorizadas explícitas para cada magnitud; sin RECONOCIDO legítimo, UNAVAILABLE.

| Ley | Juicio específico |
|---|---|
| **L1** | un mismo evaluador de procedencia resuelve el origen; no crear conversor de eventos. |
| **L2** | no mezclar solicitud B17 con asistencia ni duplicar el ledger de B14. |
| **L3** | negar por defecto inputs UNASSESSED es la solución causal al falso reconocimiento. |
| **L4** | mostrar JUSTIFICADO y RECONOCIDO en columnas separadas, nunca «8 h trabajadas». |
| **L5** | F01/F06 contrastan positivo QA y negativo de fuente, sin afirmar integración real. |
| **L6** | el gate B14/B17 de tiempo validado se reserva a integración B21. |

### V04 — Fugas de una regla QA a producción

**Lo que examiné:** ¿Una tarifa o factor de fixture podría quedar disponible a usuarios reales al reutilizar B16?

**Evidencia/resultado:** V1 permite factor QA_UNVERIFIED, vista responsive y CSV; el portal B16 carece de login comercial acreditado.

**Fallo de verdugo:** V2 fija ejemplos positivos solo en tests, no ruta productiva ni entitlement inventado; fuera QA, conceptos legales bloqueados.

| Ley | Juicio específico |
|---|---|
| **L1** | conservar un contrato de regla inyectable, no levantar un servicio tarifario adicional. |
| **L2** | no copiar el factor de un fixture como valor por defecto de país. |
| **L3** | cerrar en la capa de acceso QA la exposición, no confiar en esconder el botón. |
| **L4** | el aviso «estimación informativa» es necesario, pero no sustituye control de acceso. |
| **L5** | una Blade con actingAs no acredita un login web comercial. |
| **L6** | entregar motor puro aunque el guard WEB_LOGIN_REAL siga bloqueado. |

### V05 — Tres modalidades pueden quedar como stubs

**Lo que examiné:** ¿El criterio de terminado permite implementar hourly y devolver UNAVAILABLE siempre para daily/monthly?

**Evidencia/resultado:** V1 pedía tres modalidades pero solo definía un caso monetario positivo horario; O11/O12 eran tests de no conversión.

**Fallo de verdugo:** Ajuste material: F01 hourly, F02 daily y F03 monthly_fixed con bases ficticias expresas e importes exactos.

| Ley | Juicio específico |
|---|---|
| **L1** | tres funciones pequeñas o un solo selector de modalidad, sin reescribir un payroll engine. |
| **L2** | F02 no convierte horas en días; F03 no aplica divisor mensual implícito. |
| **L3** | impedir el falso cumplimiento por stubs mediante oráculos de valor numérico esperado. |
| **L4** | los usuarios distinguirán tarifas horarias, diarias y fijas sin etiquetas engañosas. |
| **L5** | cada modalidad exige resultado ejecutado, no `PASS_STATIC` por existir un enum. |
| **L6** | incluir las tres modalidades en el mismo S1 evita otro S2 de ampliación ceremonial. |

### V06 — Aritmética racional y centavos

**Lo que examiné:** ¿Las expresiones «sin float» y «redondeo determinista» bastan para que Codex no use conversiones implícitas?

**Evidencia/resultado:** V1 §4.2 carecía de fórmula operativa precisa, caso de mitad de centavo y política diferencial.

**Fallo de verdugo:** V2 fija segundos/3600, numerador/denominador y redondeo al concepto; F01 y F04 tienen centavos esperados.

| Ley | Juicio específico |
|---|---|
| **L1** | enteros y fracciones racionales bastan; no añadir biblioteca matemática externa. |
| **L2** | la BASE integrada en factor TOTAL no se suma dos veces. |
| **L3** | overflow se previene antes de multiplicar y el denominador cero es error explícito. |
| **L4** | el desglose muestra regla aplicada y si factor es TOTAL/ADDITIONAL. |
| **L5** | HALF_UP 50,5→51 y HALF_EVEN 50,5→50 son expectativas falsables. |
| **L6** | un grupo de fixtures sustituye múltiples rondas de «precisar fórmula». |

### V07 — Huella contaminada por timestamp

**Lo que examiné:** ¿El cálculo repetido con idénticas fuentes obtiene la misma huella cuando cambia la hora actual?

**Evidencia/resultado:** V1 pedía calculated_at y fingerprint y O17 igual, sin excluir de modo normativo el metadato volátil.

**Fallo de verdugo:** V2 excluye hora actual, IDs aleatorios y orden incidental de mapas; F05 prueba repetición estable.

| Ley | Juicio específico |
|---|---|
| **L1** | canonización de entrada antes del hash, sin servicio de snapshots adicional. |
| **L2** | mismo set de segmentos con orden distinto no genera una copia semántica distinta. |
| **L3** | eliminar fuentes no deterministas de la huella corrige la causa del falso cambio. |
| **L4** | la UI puede mostrar fecha del cálculo sin alterar la identidad del estimado. |
| **L5** | O17/F05 exige dos ejecuciones con mismo SHA de inputs y mismo importe. |
| **L6** | una prueba determinista ahorra reconstrucciones y auditorías de falsos cambios. |

### V08 — Versiones de acuerdos y periodos

**Lo que examiné:** ¿El cálculo toma un contrato arbitrario si dos versiones se solapan?

**Evidencia/resultado:** V1 exige segmentación pero no fija respuesta para versiones simultáneas ni semántica de límite inclusivo.

**Fallo de verdugo:** V2 usa periodos semiabiertos y fallo AMBIGUOUS_AGREEMENT; no reescribe acuerdos históricos.

| Ley | Juicio específico |
|---|---|
| **L1** | una partición por frontera temporal es suficiente; no diseñar planificador nuevo. |
| **L2** | versionar acuerdo evita dos bases contradictorias sobre una misma fecha. |
| **L3** | una selección arbitraria «más nuevo» ocultaría conflicto en origen. |
| **L4** | importes parciales muestran periodo y versión del pacto aplicada. |
| **L5** | O16 cubre cambio temporal; conflicto solapado debe tener caso negativo. |
| **L6** | los contratos laborales reales siguen pendientes sin bloquear fixture QA. |

### V09 — Zona horaria y escala monetaria

**Lo que examiné:** ¿La falta de escala de moneda o un offset incoherente termina convertido en número plausible?

**Evidencia/resultado:** V1 menciona timezone y minor units pero sin respuesta obligatoria para moneda sin escala y validación de DST.

**Fallo de verdugo:** V2 define UNAVAILABLE_CURRENCY_SCALE y rechaza offsets inválidos; no generaliza 2 decimales de COP a otras monedas.

| Ley | Juicio específico |
|---|---|
| **L1** | aprovechar date/time de PHP existente y enteros; no nueva API de festivos. |
| **L2** | IANA+offset y UTC se guardan como evidencias distintas, sin doble conversión. |
| **L3** | detectar escala ausente es la causa raíz frente a montos por 100 incorrectos. |
| **L4** | la vista explica error temporal o monetario, no muestra $0. |
| **L5** | O19/O21/fixture negativo distinguen conversión válida e inválida. |
| **L6** | no consultar tasas/leyes actuales para llenar un hueco que requiere aprobación. |

### V10 — Ruta web, permisos, QA y ZIP

**Lo que examiné:** ¿Se puede entregar un estimador privado visible sin login real y con sólo `actingAs`?

**Evidencia/resultado:** B16 tiene rutas protegidas sin contrato de login web operativo; V1 permite vista sintética y CSV condicional.

**Fallo de verdugo:** Mantener servicio + renderer host; ninguna URL pública ni precio/permiso creado; probar el ZIP y WIP sin hacer deploy.

| Ley | Juicio específico |
|---|---|
| **L1** | mantener Laravel monolítico y Blade existente; cero nueva SPA. |
| **L2** | reutilizar saneador CSV B16 sin crear un segundo exportador. |
| **L3** | no remediar un guard ausente saltando auth:web. |
| **L4** | seis magnitudes legibles y aviso de no nómina, aunque la UI siga QA-only. |
| **L5** | PHPUnit host≠MariaDB real≠navegador≠auditor independiente. |
| **L6** | 40 oráculos y un ZIP; sin fase de diagnóstico intermedia ni B18-S2 por costumbre. |

## 10 PASADAS COMO JUEZ — REFUTAR EXCESOS DEL VERDUGO

### J01 — ¿Bloquear B18 hasta homologar todo Colombia?

**Lo que examiné:** El verdugo señala falta de autoridad legal; ¿la solución es posponer también el motor matemático puro?

**Evidencia/resultado:** No. El código de cálculo sintético puede verificarse sin afirmar conformidad normativa.

**Fallo de juez:** APROBAR construcción del motor puro QA; MANTENER legal/payroll/comercial en BLOCKED.

| Ley | Juicio específico |
|---|---|
| **L1** | separación simple entre matemática pura y policy legal aprobable después. |
| **L2** | evitar dos implementaciones provisionales por país. |
| **L3** | la incertidumbre legal se resuelve con gate, no inventando tasas. |
| **L4** | comunicar «no disponible» fuera QA donde faltan reglas. |
| **L5** | resultado unitario no acredita homologación con profesional. |
| **L6** | trabajo B18 sigue sin esperar un informe contable para cada fixture. |

### J02 — ¿Crear microservicio o PostgreSQL para la exactitud?

**Lo que examiné:** ¿Una nueva tecnología resolvería mejor redondeo, transacciones o vigencias?

**Evidencia/resultado:** El stack de trabajo actual es Laravel/PHP y MariaDB; SPEC V5 menciona Postgres como propuesta antigua.

**Fallo de juez:** RECHAZAR microservicios, nuevos paquetes de pago, otra base y backend paralelo.

| Ley | Juicio específico |
|---|---|
| **L1** | cálculos enteros y racionales caben en servicio puro Laravel. |
| **L2** | una sola implementación PHP/Dart, reutilizando si ya hay núcleo real. |
| **L3** | cambiar motor de base no arregla conversiones float ni fuente incompleta. |
| **L4** | la UI no debe depender de infraestructura no existente. |
| **L5** | pruebas PHP del motor son un gate diferente de pruebas InnoDB. |
| **L6** | cambios de plataforma desviarían B18 hacia replanteo total. |

### J03 — ¿Persistir todo estimado en una nueva tabla?

**Lo que examiné:** ¿Para cumplir el snapshot del anexo B03 necesitamos una migración extra obligatoria?

**Evidencia/resultado:** El B03 describe PayEstimateSnapshot conceptual, no aprueba SQL definitivo ni storage de salario personal.

**Fallo de juez:** RECHAZAR nueva tabla por defecto; generar DTO/snapshot transitorio y hash reproducible.

| Ley | Juicio específico |
|---|---|
| **L1** | DTO en memoria evita almacenamiento no requerido por el gate actual. |
| **L2** | no duplicar un modelo existente si se descubre en inspección focal. |
| **L3** | persistencia prematura no remedia ausencia de pacto o permiso. |
| **L4** | la pantalla QA puede renderizar un reporte sin conservar PII. |
| **L5** | si no hay DB real, no declarar persistencia transaccional. |
| **L6** | historial durable condicionado se documenta para B21, no microbloque. |

### J04 — ¿Volver a probar B17 antes de implementar B18?

**Lo que examiné:** ¿La deuda de idempotencia y solicitudes obliga a repetir sus 7 tests/30 assertions?

**Evidencia/resultado:** La incertidumbre B17 sobre DB/Flutter está documentada y no afecta el algoritmo puro cuando se usan fixtures sintéticos.

**Fallo de juez:** RECHAZAR pruebas masivas B17; sólo negativos B18 de fuente B17/PENDING.

| Ley | Juicio específico |
|---|---|
| **L1** | un test focal de entrada B17 basta para proteger la frontera. |
| **L2** | no reutilizar métricas B17 como resultados nuevos B18. |
| **L3** | sin defecto nuevo, reejecutar suites no corrige causa de B18. |
| **L4** | los estados de solicitud no se renombrarán para cuadrar estimación. |
| **L5** | límites B17 permanecen NOT_RUN_ENV hasta integración real. |
| **L6** | el responsable ejecuta un macrobloque y no se persigue la cola. |

### J05 — ¿Aceptar daily/monthly siempre UNAVAILABLE?

**Lo que examiné:** ¿Es más seguro no calcular nunca modalidades no horarias?

**Evidencia/resultado:** Una salida permanentemente bloqueada incumple la meta de soportar las tres modalidades, aunque sea QA.

**Fallo de juez:** RECHAZAR stubs; exigir F02/F03 positivos con insumo explícito y F07 negativo cuando falta base.

| Ley | Juicio específico |
|---|---|
| **L1** | un pequeño evaluador por contrato diario/fijo es suficiente. |
| **L2** | no inventar divisores horario/diario del salario mensual. |
| **L3** | F02/F03 prueban implementación y F07 prueba el guard causal. |
| **L4** | UI diferencia contrato por día de fijo completo. |
| **L5** | outputs 108642 y 2345678 menores son criterios calculables. |
| **L6** | cerrar tres modalidades en S1 impide un S2 innecesario. |

### J06 — ¿Construir también un motor en Dart?

**Lo que examiné:** ¿El Flutter personal requiere replicar todas las fórmulas salariales?

**Evidencia/resultado:** B16 ofrece renderer web; B17 Flutter tiene otros gates y no existe política de salario personal autorizada.

**Fallo de juez:** RECHAZAR motor dual PHP+Dart; mantener fuente única de cálculo existente o PHP.

| Ley | Juicio específico |
|---|---|
| **L1** | evitar duplicar cálculo y pruebas en dos runtimes. |
| **L2** | una fuente de pack/version y huella evita divergencia. |
| **L3** | dos motores crearían inconsistencias que no resuelven origen del tiempo. |
| **L4** | Flutter no publicará salario personal sin permiso demostrado. |
| **L5** | UI host Laravel no equivale a Android Flutter. |
| **L6** | mantener B18 dentro de un único propietario. |

### J07 — ¿Forzar Docker/MariaDB para conseguir PASS?

**Lo que examiné:** ¿B18 no puede avanzar si `server/.env.testing` continúa ausente?

**Evidencia/resultado:** B17 y B16 ya informaron falta de entorno QA aislado; Docker compartido afecta otros proyectos.

**Fallo de juez:** RECHAZAR arranque forzado; ejecutar unit/renderer seguros y reportar DB_REAL=NOT_RUN_ENV.

| Ley | Juicio específico |
|---|---|
| **L1** | servicio puro independiente de DB es prueba de diseño simple. |
| **L2** | no duplicar setup DB en cada lote sin cambio material. |
| **L3** | una DB peligrosa no resolvería identidad ni rule packs faltantes. |
| **L4** | dejar UI deshabilitada comercialmente si no hay permisos. |
| **L5** | guardar logs auténticos de unit y reservar kernel/L5 externo. |
| **L6** | los gates pendientes se consolidan en B21 sin crear S2 automático. |

### J08 — ¿Autorizar valores QA en producción por poner aviso?

**Lo que examiné:** ¿Basta una etiqueta «no es nómina» para permitir acceso comercial al factor QA?

**Evidencia/resultado:** No; sin login/guard y pack homologado, una cifra sintética visible puede confundirse con un derecho salarial.

**Fallo de juez:** RECHAZAR rutas/CSV comerciales; caso QA solo bajo tests y flag testing.

| Ley | Juicio específico |
|---|---|
| **L1** | misma vista testable sin inventar un guard o entitlement financiero. |
| **L2** | no añadir nueva capa de permisos declarados ficticiamente. |
| **L3** | el control servidor de ambiente y autorización previene fuga, el aviso es secundario. |
| **L4** | usuarios no recibirán un importe numérico fabricado como pago cierto. |
| **L5** | unit PASS sobre importe QA no certifica seguridad de browser. |
| **L6** | el bloqueo comercial no impide construir lógica y vista local. |

### J09 — ¿Omitir la UI para acelerar el motor puro?

**Lo que examiné:** ¿Un servicio PHP sin presentación satisface todo el macrobloque?

**Evidencia/resultado:** V1 solicita presentar seis magnitudes; B16 tiene Blade aunque el login real esté pendiente.

**Fallo de juez:** APROBAR renderer Blade/test host reutilizado y prohibir publicación sin guard, sin segundo frontend.

| Ley | Juicio específico |
|---|---|
| **L1** | una vista Blade sencilla reutiliza estilos B16. |
| **L2** | no crear SPA ni widgets Flutter de nómina por rutina. |
| **L3** | no compensar fallo de login web con una ruta pública. |
| **L4** | mostrar estados/fuentes/magnitudes y causa de UNAVAILABLE accesiblemente. |
| **L5** | capturar test de renderer y distinguir screenshot real NOT_RUN. |
| **L6** | funcionalidad visible para QA dentro de S1, sin fase cosmética. |

### J10 — ¿Abrir nueva auditoría del prompt antes de Codex?

**Lo que examiné:** ¿Los límites de B18 justifican V3 o otra ronda de 20 pasadas?

**Evidencia/resultado:** Los defectos materiales identificados V01–V10 ya están traducidos a una orden V2 coherente con 40 oráculos conservados.

**Fallo de juez:** RECHAZAR otra auditoría por inercia; publicar V2 única, ejecutar un ZIP y seguir B19 salvo fallo P0/P1 demostrado.

| Ley | Juicio específico |
|---|---|
| **L1** | V2 tiene un solo servicio de cálculo y un flujo de QA. |
| **L2** | 40 oráculos originales conservados; F01–F07 son datos concretos, no 7 gates repetidos. |
| **L3** | corregir ahora huecos de salida cuantitativa y hash evita remiendos posteriores. |
| **L4** | la experiencia de QA no expone salarios personales. |
| **L5** | el próximo ZIP deberá traer tests ejecutados y SHA, no un dictamen de autor. |
| **L6** | una sola entrega y NEXT_OWNER=CHATGPT, después B19. |

---

## Matriz de rectificaciones V1→V2 (sin otra vuelta)

| Decisión | Defecto material / fuente | Corrección verificable en V2 | Qué NO se reabre |
|---|---|---|---|
| C1 · autoridad | B03 se declara candidata; V1 hablaba de «contrato B03» | §0.2 etiqueta CANDIDATO y no homologa salario | No revisar B03 o SPEC entera |
| C2 · modalidades | V1 O11/O12 negativos podían ocultar stubs daily/monthly | F01 horario = 92588; F02 diario = 108642; F03 fijo mes completo = 2345678 (unidades menores ficticias) | No inventar divisor sueldo fijo |
| C3 · centavos | V1 exigía exactitud sin fórmula y caso de empate | §4.2 fórmula racional; F04 101×1/2 = 51 HALF_UP / 50 HALF_EVEN | No instalar librería matemática nueva |
| C4 · huella | calculated_at aparecía junto al fingerprint, sin exclusión específica | §4.4 y F05: mismo hash y monto, sin importar reloj/orden de mapas | No crear tabla snapshot salarial |
| C5 · fuentes | QA positivo podía confundirse con fuente B14/B17 | F06 `SERVER_STORED/UNASSESSED` => UNAVAILABLE; F07 faltan bases => UNAVAILABLE | No rehacer sync/solicitudes |
| C6 · moneda/vigencias | escala, superposición de acuerdos insuficientemente operativas | F04, `UNAVAILABLE_CURRENCY_SCALE`, periodos semiabiertos/`AMBIGUOUS_AGREEMENT` | No fijar tarifas legales |
| C7 · aceptación | Declarar «3 modalidades» por enum/falta de tests | F01–F07 ejecutados y tabla O01–O40 con fuente, exit y log | No duplicar matriz de oráculos |

**Verificación independiente que sí hice:** leí ambos Markdown B18, anexo candidato B03 y dictamen B17; calculé hashes/estructura y comprobé por aritmética entera las expectativas F01 (`12345*6*5/4=92587.5 → 92588`), F02 (`54321*2=108642`), F03 (`2345678`), F04 (`101/2=50.5`). No inspeccioné ni ejecuté el repositorio local Windows, phpunit del motor nuevo, Laravel, DB, Flutter o Android en esta vuelta.

## Plan de terminación y condiciones inequívocas

**B18 ahora (un macrobloque):** un único motor puro y representación host seguros; F01–F07 con importes/huella falsables, matriz de 40 oráculos, mínimo un renderer QA, logs, baselines y patch. Resultado permitido `PASS_UNIT_SYNTHETIC` solo con tests ejecutados. Todo permiso, fuente real, web/login, DB, homologación y L5 independiente conservan gates.

**B19 siguiente:** expedientes, archivos privados, plantillas, versiones de contratos y firma solo bajo contratos/proveedor real; no confundir hash de integridad con firma electrónica.

**B20:** vacantes, CV, entrevistas, decisiones y transición autorizada candidato→empleado, aislada por tenant; nada de acceso público inseguro a adjuntos.

**B21:** integración y QA L5 del mismo SHA/build, MariaDB, HTTP real, Android hardware, identidad B13–B17, reglas B18 homologadas por profesional, permisos/privacidad B19–B20 y recuperación/backups, sin falsos PASS de mocks.

**B22:** solo si B21 y contratos/precios/legalidad aprobados por el propietario, GO escrito, despliegue/rollback. Nunca publicación/cobro automáticos.

**Recuperación por GitHub:** `docs/CODEX_LOTE_ACTUAL.md` es la orden **única** actual; `docs/AUDITORIA_DIRECTIVA_ACTUAL.md` es esta auditoría; `docs/JORNATO_CONTINUIDAD.md` fija cronología/gates; `AGENTS.md` enlaza continuidad. Todos en rama documental PR #2 Draft; WIP local no se ha publicado.

**NEXT_OWNER=CODEX_LUNA** hasta el ZIP, después **NEXT_OWNER=CHATGPT** para adjudicar B18 y dirigir B19. No repetir 10/10 sin evidencia distinta ni generar B18-S2 por inercia.