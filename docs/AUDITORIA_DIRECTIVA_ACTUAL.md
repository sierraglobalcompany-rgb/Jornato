# JORNATO — DICTAMEN FORENSE B17-S1 V2 Y PLAN MACROBLOQUE B18
**Fecha:** 2026-11-13/14 UTC; referencia operativa Colombia. **Director:** ChatGPT. **Ejecutor siguiente:** Codex Luna. **Tipo:** análisis independiente de contenido/paquete más 20 pasadas documentales; NO QA integral.

## 1. Hechos comprobados directamente

| Control | Evidencia real y resultado |
|---|---|
| ZIP B17 V2 | SHA256 `745B608028B8522C0013789EE939869FF4D946CE4C1199545BB50A346A82D75A` coincide; 147.794 bytes, **63 entradas**, CRC `testzip()=None`, rutas seguras y nombres únicos. |
| Manifiesto | **62/62** miembros no-manifiesto con SHA256 y tamaños contrastados directamente desde bytes. |
| Reproducción patch | `patch -p1` sobre copia aislada de `BASELINES/**` con exit 0; **15/15 fuentes SOURCES** iguales byte por byte. |
| PHP lint | Nueve fuentes PHP B17 verificadas aquí con `php -l`: **9/9 PASS**. |
| Contrato PHP focal | Invocación directa de `PersonalRequestContract::interval` acepta Bogota -05:00→UTC, rechaza offset +03:00 incongruente; `nextStatus(NEEDS_CLARIFICATION, answer_clarification)=PENDING`. Es prueba directa pequeña, no suite. |
| PHPUnit atribuido a Codex | `7 tests/30 assertions`, exit 0 según log del ZIP. Primer intento 7/27 una falla por **orden textual de cabeceras**; test corregido; NO se reejecutó PHPUnit desde este análisis con el vendor del checkout. |
| Rutas | Cinco rutas B17 constan en `route:list` aportado; no se ejecutó HTTP real. Las rutas requieren Sanctum, active account, device.active, membership, QA gate y ability. |
| MariaDB/HTTP/Flutter/Android | No ejecutados. `phpunit.xml` documentado usa `127.0.0.1:1`; Flutter/Dart ausentes del entorno de Codex. `DB_REAL=NOT_RUN_ENV`, `FLUTTER_HOST=NOT_RUN_ENV`, `L5_INDEPENDENT_RUNTIME=NOT_RUN`. |
| WIP | `178/185` intactos, 7 modificados y 8 nuevos, staged 0 **según archivo de custodia de Codex**; no inspección directa del checkout Windows. |

## 2. Dictamen y reservas

**B17_S1=PARTIAL_HOST_OR_CONTRACT** como etiqueta operativa del lote (en realidad los tests ejecutados fueron PHP unit; no Flutter). Se admite implementación localizada de esquema, funciones, rutas QA y UI escrita. No se acepta envío personal real, permiso de revisor ni atomicidad/concurrencia de MariaDB hasta ejecutar ese runtime. `HISTORY_ATOMIC=IMPLEMENTED_DB_UNRUN`; `IDEMPOTENCY=IMPLEMENTED_UNIT_DB_UNRUN`. Las cinco rutas no son comercializables: solo ambiente testing con flag QA y vínculo laboral sintético. `RELEASE_APPROVED=NO`.

**Riesgos a arrastrar a B21 sin convertirlos en otro B17-S2:** (i) integridad/foreign keys de las dos tablas por ejecutar en MariaDB; (ii) consultas A/B y revoked link, donde lectura histórica del creador está deliberadamente permitida por contrato O05, sujeto a revisión de privacidad; (iii) dos conexiones concurrentes; (iv) rollback de transición+evento; (v) widget y limpieza A→B; (vi) ausencia de aprobación HR; (vii) texto libre de motivo puede contener datos clínicos voluntarios, aunque la app no pida diagnóstico.

**Criterio de rumbo:** avanzar B18 en una sola orden. No convertir B14 SERVER_STORED/UNASSESSED en tiempo reconocido ni solicitud B17 en presencia o pago. El contrato B03 exige seis magnitudes separadas: PROGRAMADO, OBSERVADO, JUSTIFICADO, RECONOCIDO, CLASIFICADO, ESTIMADO_MONETARIO. B18 solo produce cálculos informativos con fuentes y rule packs explícitos; no homologación legal, nómina fiscal o desembolso.

## 3. Diez pasadas COMO VERDUGO — buscar refutaciones

### V01 — Integridad de entrega
**Ataque:** ¿Puede un ZIP íntegro disimular software roto?  **Fallo:** Aceptar bytes, no funcionalidad.

| Ley | Juicio sustentado |
|---|---|
| L1 | 63 miembros y 15 fuentes focales, sin multiplicar entregas. |
| L2 | 62 entradas del manifiesto sin duplicados ni rutas traversal. |
| L3 | SHA/CRC no reparan comportamiento; separar evidencia. |
| L4 | no hay validación visual de la pantalla Flutter. |
| L5 | comprobación independiente ZIP, CRC y 62/62; no equivale a DB. |
| L6 | no repetir paquete ni pedir reempaquetado sin defecto material. |

### V02 — Reproducción de cambios
**Ataque:** ¿El parche depende de archivos implícitos que faltan?  **Fallo:** Reproducible en copia aislada.

| Ley | Juicio sustentado |
|---|---|
| L1 | 7 fuentes previas más 8 ausentes => parche focal de 15. |
| L2 | 15/15 posteriores coinciden byte por byte al reproducir. |
| L3 | diff aplicó con patch -p1 exit 0 en copia, no checkout real. |
| L4 | fuentes UI modificadas; no asumir fidelidad visual. |
| L5 | replay independiente directo, no afirmar WIP de Windows inspeccionado. |
| L6 | continuar sin duplicar inventario de 185 rutas del ejecutor. |

### V03 — Concurrencia e idempotencia
**Ataque:** ¿Se duplica una solicitud al enviar dos POST iguales?  **Fallo:** Diseño favorable; NOT_RUN DB.

| Ley | Juicio sustentado |
|---|---|
| L1 | una tabla UNIQUE company+creator+keyHash, no broker nuevo. |
| L2 | fingerprint y hash reutilizan un contrato canónico, no dos claves. |
| L3 | controla error MySQL 1062 y conflicto, pero concurrencia no ejecutada. |
| L4 | retry con misma key no debe parecer doble envío en UI. |
| L5 | 7/30 unit PHP no ejercitan UNIQUE ni 2 conexiones reales. |
| L6 | trasladar prueba de concurrencia al gate B21, no S2 ceremonial. |

### V04 — Identidad y tenancy
**Ataque:** ¿El selector company o email suplanta un empleado?  **Fallo:** Fail-closed; pendiente prueba DB.

| Ley | Juicio sustentado |
|---|---|
| L1 | usa existing employee_identity_links, no autenticación paralela. |
| L2 | joins company/site/employee/membership sin coincidencia por email. |
| L3 | el usuario viene de Sanctum y la ficha de vínculo servidor. |
| L4 | solicitudes ajenas 404 por owner+tenant en show. |
| L5 | lectura de código favorable, test HTTP cross-tenant no ejecutado. |
| L6 | conservar bloqueo de enrolamiento comercial, avanzar núcleo B18. |

### V05 — Máquina de estados
**Ataque:** ¿O18 sigue contradictorio?  **Fallo:** Corrección V2 plasmada, runtime parcial.

| Ley | Juicio sustentado |
|---|---|
| L1 | mapeo puro único nextStatus, no workflow engine externo. |
| L2 | NEEDS_CLARIFICATION→PENDING coincide con O18. |
| L3 | transición y appendEvent en la misma transacción de código. |
| L4 | no mostrar una aprobación sin permiso RR. HH. |
| L5 | prueba unit 7/30 reportada y prueba directa PHP focal, DB no ejecutada. |
| L6 | no rediseñar la máquina de estados por falta de permiso. |

### V06 — Atomicidad del historial
**Ataque:** ¿Se puede aprobar/cancelar sin evento o mutar pasado?  **Fallo:** IMPLEMENTED_DB_UNRUN.

| Ley | Juicio sustentado |
|---|---|
| L1 | dos tablas vinculadas, no Event Sourcing general. |
| L2 | sequence/version y unique por request, sin duplicar B14. |
| L3 | update versionado y appendEvent comparten DB::transaction. |
| L4 | timeline devuelve transiciones mínimas para el titular. |
| L5 | rollback, lock y migración en MariaDB no ejecutados. |
| L6 | anotar gate B21, no declarar atomicidad PASS. |

### V07 — Privacidad clínica
**Ataque:** ¿El campo motivo se convierte en historia médica?  **Fallo:** Riesgo residual documentado.

| Ley | Juicio sustentado |
|---|---|
| L1 | no hay adjuntos, biometría ni tablas clínicas. |
| L2 | motivo opcional máximo 300 caracteres, sin duplicar expediente B19. |
| L3 | texto libre NO garantiza ausencia de diagnóstico por regex. |
| L4 | interfaz debe evitar inducir el ingreso de información médica sensible. |
| L5 | escaneo estático y esquema no prueban que el usuario nunca escriba PHI. |
| L6 | no crear filtro clínico artificial; gate privacidad B19/B21. |

### V08 — Seguridad del gate QA
**Ataque:** ¿Podría activarse accidentalmente en producción?  **Fallo:** Inspección favorece cierre doble.

| Ley | Juicio sustentado |
|---|---|
| L1 | un middleware QA focal reutiliza auth y device.active. |
| L2 | testing AND flag true, default false, sin rutas de revisor. |
| L3 | no bypass de Sanctum ni permiso productivo inventado. |
| L4 | el trabajador aún no tiene enrolamiento comercial. |
| L5 | route:list 5 rutas no es ejecución HTTP ni guard activo end-to-end. |
| L6 | no forzar gate en producción para «probar» el módulo. |

### V09 — Flutter y experiencia
**Ataque:** ¿Las nuevas pantallas están verdaderamente probadas?  **Fallo:** NOT_RUN_ENV, no PASS.

| Ley | Juicio sustentado |
|---|---|
| L1 | reutiliza PersonalScreen, PersonalApi y sesión, sin nueva app. |
| L2 | cero outbox personal falso o caché de datos médicos. |
| L3 | manejo de sesiones A→B escrito pero no ejecutado. |
| L4 | widget/teclado/foco sin render real; UX por verificar. |
| L5 | Flutter no disponible, ninguna prueba widget ejecutada. |
| L6 | no bloquear B18 por ausencia SDK; acumular gate B21. |

### V10 — Custodia y release
**Ataque:** ¿Se está confundiendo script verde con sistema terminado?  **Fallo:** NO_GO comercial correcto.

| Ley | Juicio sustentado |
|---|---|
| L1 | 7 cambios y 8 altas, sin reemplazar B13–B16. |
| L2 | hashes de 178/185 WIP son reporte Codex, no observación Windows propia. |
| L3 | no migración real; no «arreglar» con Docker ajeno. |
| L4 | usuario real no tiene flujo HR autorizado. |
| L5 | B17 parcial, 7 unit/30; DB, HTTP, Flutter, L5 NOT_RUN. |
| L6 | no abrir B17-S2 automático; entregar siguiente vertical B18. |

## 4. Diez pasadas COMO JUEZ — contradicción de soluciones

### J01 — Aceptar avance parcial
**Contradicción:** ¿Deberíamos rechazar B17 completo por falta de DB?  **Fallo motivado:** Rechazar rechazo total, mantener límites.

| Ley | Juicio sustentado |
|---|---|
| L1 | código de dominio y rutas protegidas sí son avance útil. |
| L2 | no rehacer controller solo porque el kernel no corrió. |
| L3 | no se ha demostrado defecto causal de integridad o TENANT. |
| L4 | usuario aún no puede usar solicitudes comerciales. |
| L5 | aceptación técnica estática/unit focal, NO aprobación funcional. |
| L6 | avanzar B18 con lista de gates remanentes. |

### J02 — No aprobar identidad comercial
**Contradicción:** ¿Basta el vínculo sintético para activar la API?  **Fallo motivado:** Rechazar activación.

| Ley | Juicio sustentado |
|---|---|
| L1 | usar relación existente con QA sin duplicar usuario/empleado. |
| L2 | no confundir member con employee verificado. |
| L3 | default OFF responde 404 en no-testing incluso con flag. |
| L4 | ninguna pantalla «solicitud enviada» comercial real sin auth. |
| L5 | permisos/link real pendientes por aprobación; no sobrerreportar. |
| L6 | no delegar «habilitar registro» a Codex en siguiente lote. |

### J03 — No convertir solicitud en reconocimiento
**Contradicción:** ¿Podemos alimentar B18 con estados B17?  **Fallo motivado:** Rechazar inferencia.

| Ley | Juicio sustentado |
|---|---|
| L1 | conservar seis magnitudes B03 en un mismo dominio. |
| L2 | B17 PENDING/APPROVED no se transforma en hecho fichado. |
| L3 | B14 SERVER_STORED no es fuente reconocida de pago. |
| L4 | mostrar JUSTIFICADO distinto de RECONOCIDO. |
| L5 | no datos reales con proveniencia aprobada, B18 usar fixture. |
| L6 | esta decisión evita una futura corrección contable grave. |

### J04 — No inventar sueldo ni ley
**Contradicción:** ¿Podemos fijar tasas de recargo 2026 de memoria?  **Fallo motivado:** Rechazar sin rulepack aprobado.

| Ley | Juicio sustentado |
|---|---|
| L1 | un único motor explicable, parámetros versionados. |
| L2 | no segundo motor ni copiar tablas de internet sin homologación. |
| L3 | valores por país/fecha deben tener fuente y vigencia. |
| L4 | mostrar «no disponible», nunca $0 calculado sin base. |
| L5 | sin contador/revisor jurídico no hay conformidad salarial. |
| L6 | implementar cálculo QA sin hipotecar release. |

### J05 — No sobrediseñar persistencia B18
**Contradicción:** ¿Necesitamos tabla nómina nueva ahora?  **Fallo motivado:** Rechazar por falta de fuente fiable.

| Ley | Juicio sustentado |
|---|---|
| L1 | DTO snapshot determinista sin escritura hasta contrato. |
| L2 | evitar tablas pay_* duplicadas con futuros B18/B21. |
| L3 | falta origen RECONOCIDO persistente, no parchear con SQL falso. |
| L4 | información sensible no disponible para usuarios no autorizados. |
| L5 | QA puro puede probar cálculos sin DB. |
| L6 | no abrir una etapa de migración innecesaria. |

### J06 — No exigir UI comercial ficticia
**Contradicción:** ¿Debe existir un portal financiero con login inventado?  **Fallo motivado:** Rechazar login paralelo, crear componente seguro.

| Ley | Juicio sustentado |
|---|---|
| L1 | reutilizar Blade B16 si hay guard aprobado. |
| L2 | no SPA nueva ni segunda sesión. |
| L3 | WEB_LOGIN_REAL sigue BLOQUEADO por contrato. |
| L4 | panel QA etiquetado informativo con seis magnitudes. |
| L5 | fixture/render no certifica navegador real. |
| L6 | aceptar trabajo productivo sin CTA inseguro. |

### J07 — Garantizar precisión sin librerías nuevas
**Contradicción:** ¿Puede usarse float por comodidad?  **Fallo motivado:** Rechazar redondeo ambiguo.

| Ley | Juicio sustentado |
|---|---|
| L1 | integer minor units + racionales con guardas, o decimal existente. |
| L2 | cero nuevas dependencias por rutina. |
| L3 | evita duplicación de base salarial y overflow silencioso. |
| L4 | desglose con factor total vs adicional visible. |
| L5 | fixtures de límite/medio centavo repetibles. |
| L6 | menos QA correctiva por cifras cambiantes. |

### J08 — Probar sin fingir integración
**Contradicción:** ¿B18 debe esperar una MariaDB aislada?  **Fallo motivado:** Rechazar bloqueo del núcleo puro.

| Ley | Juicio sustentado |
|---|---|
| L1 | pruebas domain PHP y vista host suficientes para avance focal. |
| L2 | no repetir 1.000 eventos ni suites B14 históricas. |
| L3 | si faltan fuentes, estado UNAVAILABLE con razón, no mock comercial. |
| L4 | no pantalla de salario real en cuentas sintéticas. |
| L5 | DB_REAL y L5 independiente permanecen NOT_RUN. |
| L6 | macrobloque B18 funcional acotado, después B19. |

### J09 — Custodia y GitHub
**Contradicción:** ¿Subimos el WIP a main para evitar pérdida?  **Fallo motivado:** Rechazar sin autorización.

| Ley | Juicio sustentado |
|---|---|
| L1 | mantener checkout D: y reports un solo ZIP. |
| L2 | GitHub PR #2 es documental, no fuente de ejecutable. |
| L3 | preserve 193 WIP rutas reportadas sin reset/clean. |
| L4 | datos de nómina no deben publicarse en repositorio. |
| L5 | hashes/documentación no equivalen a respaldo restaurado. |
| L6 | actualizar un solo checkpoint y orden, sin nuevas ramas docs. |

### J10 — Plan de fin y siguiente actor
**Contradicción:** ¿Abrimos B17-S2 o otra auditoría del prompt?  **Fallo motivado:** Rechazar, B18 productivo.

| Ley | Juicio sustentado |
|---|---|
| L1 | completar B18 con núcleo y vista en un lote. |
| L2 | estados B13–B17 heredados sin prometer PASS global. |
| L3 | motivos de gates externos se preservan para B21. |
| L4 | después B19/B20 y QA integral sin recortar alcance. |
| L5 | B22 únicamente GO escrito del propietario. |
| L6 | NEXT_OWNER=CODEX_LUNA después de dictamen; ZIP único. |

## 5. Contabilidad de la auditoría

- **20 pasadas**, cada una con seis juicios diferenciados = **120 juicios documentales**, ninguno equivalente a un nuevo test end-to-end. Los estados PASS provienen de bytes/lint/ejecuciones focales expresamente identificadas.
- Verdugo: los 10 hallazgos quedaron contextualizados; no se evidencia defecto crítico reproducido que exija rehacer B17 antes de B18.
- Juez: descarta un B17-S2 inercial, una segunda autenticación, cambios en permisos de RR. HH., cálculos salariales implícitos y despliegue prematuro.

## 6. Plan de ejecución y finalización

| Bloque | Producto, no solo pruebas | Gate honesto |
|---|---|
| **B18-S1 ahora** | Motor determinista de estimación con seis magnitudes, contrato salarial versionado, precisión decimal y vista QA explicable. | Nunca cifras legales ni salarios reales sin regla/actor/fuente aprobados. |
| **B19** | Expedientes privados, documentos versionados, trazabilidad, contrato/otrosí y copia al trabajador. | Firma real solo proveedor/consentimiento verificables; hash ≠ firma. |
| **B20** | Reclutamiento, vacantes, CV, entrevistas y transición candidato→empleado. | Archivos maliciosos, consentimiento y acceso cross-tenant evaluados. |
| **B21** | QA integral independiente de todas las puertas B13–B20. | MariaDB, Flutter/Android físico, permisos, reportes, cálculos legales contables, privacidad, integración por mismo SHA. |
| **B22** | Lanzamiento comercial integral. | GO escrito del propietario, planes/términos/precios, build firmado y rollback. |

## 7. Entrega y transferencia

- **Único prompt vigente propuesto:** `CODEX_LUNA_JORNATO_B18_S1_V1_MACROBLOQUE_MOTOR_LABORAL_INFORMATIVO_SIN_NOMINA_ZIP_UNICO_20261113.md` (SHA consignado al publicarlo en GitHub).
- **ZIP exigido a Codex:** `JOR-B18-S1-V1-ESTIMADOR-LABORAL-20261113-UNICO.zip` con fuentes, preestado, patch, matrix de 40 oráculos, logs reales, 10 controles L1–L6, informe y SHA manifest.
- **Estado final:** `B17_GLOBAL=PARTIAL`, `B18=NOT_EXECUTED`, `B13/B14/B15/B16_GLOBAL=PARTIAL/NOT_APPROVED`, `RELEASE_APPROVED=NO`.
- **NEXT_OWNER=CODEX_LUNA** hasta entregar ZIP B18; luego `NEXT_OWNER=CHATGPT_DIRECTOR` para adjudicación.