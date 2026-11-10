# JORNATO — CONTINUIDAD CANÓNICA DE DIRECCIÓN (DOCUMENTAL)

**Corte:** 2026-11-07, posterior a entrega B15-S1, Colombia. **Tipo:** checkpoint vivo de dirección y trazabilidad, NO código probado ni aprobación comercial.  
**Director / aceptación:** ChatGPT. **Ejecutor local:** Codex Luna, solo con un lote previamente dirigido. **Propietario:** decide autorizaciones de publicación, contratos y UX aprobados.  
**Siguiente tarea:** `B15-S4 V2 — macrobloque Flutter personal + «Mi jornada» + aislamiento A→B`; la orden V1 está sustituida, S4 todavía no ejecutado.n personal Flutter y consulta segura sobre API existente (QA sintética)`. S3 ya entregado y aceptado solo en alcance focal reportado.n QA testing-only + flag explícito, sin asistencia reconocida`; B15-S2 entregó GET fail-closed sin datos ni Flutter personal. V2 sustituye V1; todavía NO ejecutada.  
**Política de transferencia:** 1 prompt descargable .md para Codex; 1 ZIP final con código, informe y evidencias. Evitar nuevas vueltas de diagnóstico.

## 1. Jerarquía y fuentes vigentes

1. Decisiones y autorizaciones expresas del propietario, seguridad, leyes obligatorias, contratos aprobados.
2. UX/mockups aprobados y código local comprobado con SHA + QA atribuible.
3. Leyes L1–L6 de [PingPongLaw en commit fijo `84e961cadf482d234f4c0ee2ca60e8c7e9b388e8`](https://github.com/sierraglobalcompany-rgb/PingPongLaw/blob/84e961cadf482d234f4c0ee2ca60e8c7e9b388e8/docs/engineering/LEYES_IMPLEMENTACION_1_A_6.md); leer realmente, no inferir autoload.
4. [`AGENTS.md` de esta rama](../AGENTS.md), contratos y ADR locales; **no sobrescribir reglas existentes al sincronizar**.
5. SPEC V5 histórica = **candidata**, no autorización de nuevos módulos/criterios por sí sola.

L1=KISS/Ponytail, L2=antirruido/no eliminación ciega, L3=causa raíz/no parches, L4=UX humana y aprobada, L5=verificación independiente sin falsos PASS, L6=antiping-pong con dirección de ChatGPT. Cada auditoría de diez pasadas verifica las seis leyes con un juicio sustentado por pasada. No equivale a 60 ejecuciones de QA.

## 2. Identidad del proyecto, alcance y restricción operativa

- **Producto:** Jornato, control de asistencia y gestión laboral de Colombia, con **primer lanzamiento comercial integral**, no MVP recortado por defecto.
- **Arquitectura aprobada:** Flutter Android offline + SQLCipher/outbox; un Laravel/Sanctum + MariaDB/InnoDB. No bifurcar motores de sincronía, login ni backend. `LOGIN != FICHAJE`; consentimiento no se presume; `SERVER_STORED != RECOGNIZED`.
- **Checkout real:** `D:\codex\Jornato`; rama histórica `codex/jor-b08-h4-domain-20261025`; HEAD de referencia `faf5fe283191f8b5a2724b397009512a2caec1b6`. **Ambos son referencias**, Codex debe leer valores actuales. El trabajo B08–B14 y S1–S4 avanzado es WIP LOCAL, gran parte untracked.
- **Discos:** desarrollo, QA y reportes solo D:. Sin teléfono físico, cuentas reales ni SMTP real por defecto. No `git clean/reset/checkout/restore`, no forzar eliminación de temporales bloqueados, no alterar configuración global.
- **Backup:** `PUERTA_A_BACKUP=WAIVED_BY_OWNER_FOR_DEVELOPMENT`, `OFF_DEVICE_BACKUP=NOT_DONE`, `RESTORE_SAMPLE=NOT_RUN`. No reabrir como puerta de desarrollo; reconocer riesgo sin pretender haber respaldado.
- **Publicación:** Sin stage/commit/push/merge/deploy de código local por Codex sin autorización. Esta rama documental sí fue actualizada por el director con instrucción expresa de mantener GitHub al día.
- **Remoto:** `main=1ee6aae821f8cf177cc64149081ad8847f7fec2e` al corte; PR #1 `faf5fe283191f8b5a2724b397009512a2caec1b6` OPEN/DRAFT, tiene instrucciones antiguas; PR #2 OPEN/DRAFT alberga el `AGENTS.md` ampliado y este checkpoint. **NO está en main**. No afirmar recuperabilidad del WIP desde GitHub. Verificar GitHub actual al retomar.

## 3. Estado verificable, hecho por hecho

| Bloque | Estado al corte | Qué se acreditó / qué NO |
|---|---|---|
| B13-S1 | `PASS_QA_FOCAL_REPORTADO`, no comercial | Registro sintético, verificación firmada, empresa/owner transaccional; tests 20/169 + 15/194 reportados; rutas cerradas para registro público. |
| B13-S2 | `PASS_QA_FOCAL_REPORTADO` | Rechaza campos ajenos `actor_id/member_id` con 422. El 201 previo ignoraba los campos; **no hay prueba de suplantación de empleado**. Consentimientos GET/POST/DELETE existentes; semántica legal de DELETE sin extrapolar. |
| B13-S3 | `PASS_QA_FOCAL_REPORTADO` | Reenvío de verificación por URL firmada nativa; recuperación tras fallo de entrega; 9/107 y regresiones reportadas; SMTP no probado. |
| B13-S4 | `S4_PARTIAL` | ZIP `JOR-B13-S4-V2-ONBOARDING-QA-CAUSAL-20261107-UNICO.zip`, SHA256 `6F4BB90ECEAECAF58454EB2298FA3DDB6791691C1661641B92B322D3C2CA340D`. Catch de `TransportExceptionInterface` solo en notificación después de persistir usuario; 500 RED, 202 GREEN, 14 pruebas y 194 aserciones reportadas. SHA/CRC/parche y lint verificados separadamente por ChatGPT; no reejecución DB independiente. `S4-07=NOT_RUN` carrera real; `S4-10=FAIL_LITERAL` por 4 rutas visibles en `APP_ENV=testing` con flag off aunque endpoint 404; local/production sin rutas. No calificar esto como explotación de seguridad demostrada. |
| B13 global | `PARTIAL` | Textos legales no aprobados, SMTP real no probado, registro público NO, S4-07 y S4-10 sin cerrar, L5 runtime pendiente. |
| B14 C04 nuevo | `PASS_TECNICO_REPORTADO_CON_RESERVAS` | 1000 identidades y recibos reconciliados en paquete V7; hashes local/remote representan objetos distintos. JSON persistido raw de 1000 eventos no verificado independientemente. C04 original con tres `requetId` sigue fallo histórico. C10 visual completado. C07 portable NOT_RUN y no consta puerta obligatoria aprobada de B14. Advertencia de fallback de FlutterSecureStorage requiere atención dirigida si se reproduce. |
| B14 global | `FINAL_NOT_APPROVED` | QA técnico útil, pero aceptación integral y L5 independiente no ejecutadas. **No repetir 1000 eventos** sin hipótesis nueva. |
| B15-S1 | `PARTIAL_FUNCTIONAL`, QA host focal reportada | ZIP `JOR-B15-S1-V2-EMPLOYEE-MI-JORNADA-20261107-UNICO.zip`, SHA-256 `56D47D88A3F5DDD65B2E423EB5F5F1A1CFAAAC31F4675227F33B74DC39B94A68`. Tarjeta `Mi jornada local` en kiosco PIN, NO app personal. ZIP CRC, tamaños y 64/64 hashes verificados por ChatGPT; 2 tests widget, 1 scope, 1 actor y Flutter analyze PASS por logs del ejecutor. APK sin build (hook sqlite3 `DartWorker` OS error 22); AVD API24 sin `sys.boot_completed` y cero evidencia nativa. `IDENTITY_GATE=BLOCKED_CONTRACT`: membresía empresa no vincula User a Employee, backend sin ruta personal. Estado de código local sin publish: 163→167 entradas Git status, 11 tracked dirty, 4 nuevas (3 fuentes/test + 1 marcador Kotlin de 0 bytes). L5 runtime NO. No presentar widget kiosk como app del empleado. |
| B16–B20 | Pendientes de implementación/aceptación | Portal Pro, novedades, reglas laborales informativas, expedientes, reclutamiento. |
| B21 / B22 | `NOT_STARTED` / `RELEASE_NO` | QA independiente, seguridad, UX, privacidad, revisión jurídica, hardware y GO propietario antes de publicación. |

**No deducir PASS global** de un ZIP intacto, el número de tests, un mensaje de Codex, una matriz de leyes o revisiones del propio implementador. Cambiar el estado solo con prueba nueva y adjudicación del director.

## 4. Próxima operación — B15-S2, vertical personal real sin ping-pong

**Decisión de dirección para candidato QA, no contrato comercial aprobado:** probar primero vínculo explícito tenant-scoped `User ↔ Employee` en Laravel; usuario verificado puede pertenecer a varias empresas, pero una membresía de empresa o un e-mail coincidente NO autoriza lectura laboral. Un empleado debe asociarse a una cuenta mediante acción autenticada de administrador autorizado, con verificación tenant, estado y revocación; sin auto-vinculación. Evitar agregar el vínculo a dispositivos PIN/kiosco ni alterar el ledger. Revisar contratos existentes ANTES de elegir detalle de cardinalidad y esquema; documentar contradicciones y no aplicar migraciones sobre datos reales. La decisión sobre cardinalidad simultánea/histórica se registra como `CONTRACT_CANDIDATE_QA` hasta validación por autoridad de producto.

**Objetivo del próximo lote B15-S2:** un único corte vertical QA genuino: vínculo de empleado autorizado → login Sanctum personal (no marca) → `GET Mi jornada` de trabajador activo con backend filtrando sujeto por token + tenant → estados propios + negativos A/B y cross-tenant; reutilizar sincronización/ledger real si existe, sin fake. Un widget de kiosco no satisface esto.

1. Identificar contrato real y tablas `User`, `company_memberships`, `sync_employees`, eventos almacenados y auth; mostrar rutas/consumidores. Escoger **la forma más simple segura** de relación, sin segunda auth. Si falta contrato irreductible de asociación laboral y hay dos alternativas sustantivas, entregar implementación QA mínima aislada con límites explícitos; no publicar ni habilitar datos reales.
2. Negativos: token A no accede eventos de empleado B/empresa C ni por IDs/cabeceras; cuenta sin vínculo/empleado inactivo/membresía revocada/token revocado no accede; un login/GET/logout no crea eventos. No aceptar `employee_id` cliente como autoridad.
3. Solo si hay contrato backend consistente y reutilización existente, sumar cliente móvil personal mínimo. No mezclar sesión personal con `KioskEmployeeSession` ni reaprovechar PIN de kiosco. No agregar marcación, GPS/QR/NFC/Wi-Fi/IP o push por este lote: pertenecen a B15 posterior y requieren QA real.
4. Tests MariaDB QA aislada + HTTP 401/403/404 genuino según contrato + Flutter focal cuando aplique; logs originales con exit. **No repetir APK/AVD ahora**: el hook sqlite3 y boot de API24 son tareas técnicas separadas, salvo evidencia nueva causal que habilite única intervención.
5. Proteger WIP de D:, no sobrescribir `AGENTS.md` local, sin GitHub escritura desde Codex. Entregar **un único ZIP** con informe, fuentes, hashes, parche reproducible, pruebas, matriz 10×6 y NEXT. **NEXT_OWNER=CHATGPT** tras la entrega.
6. Actualizar este documento vivo con nuevo resultado adjudicado por ChatGPT; jamás convertir integridad ZIP o tests host en QA Android/server independiente.


### Corrección de dirección B15-S2 V2 — auditoría adversarial 2026-11-07

**Estado:** `B15-S2=NOT_EXECUTED`. Se auditó la orden V1 contra el ZIP B15-S1 duplicado, el contrato backend documentado y el canon fijo; se publicó prompt corregido V2 **en la conversación**: `CODEX_LUNA_JORNATO_B15_S2_V2_IDENTIDAD_SEGURA_LECTURA_PROPIA_UN_ZIP_20261107.md`, SHA-256 `54c5ccb46b0f5d07274a12fa871fcc71c9635ad429b0f412271ce75ec8957904`. **Este nombre/hash no indica que los bytes del prompt estén en GitHub**; el checkpoint conserva todo lo necesario para reconstruir dirección, y el usuario puede adjuntar el prompt para ejecución. Auditoría V2: 10 pasadas × L1-L6, 24 decisiones favorables documentales, 20 rectificaciones y 16 límites pendientes; NO 60 tests runtime.

**Tres correcciones que prevalecen a la orden V1:**
1. **Permiso de vinculación:** no inventar capacidad admin por tener rol owner ni usar coincidencia de correo/PIN/membresía. Si el permiso/contrato de vinculación laboral no existe, implementar enlace **solo como fixture interno sintético QA**, sin ruta administrativa productiva expuesta; aun así probar consulta personal con Sanctum cuando la autorización del usuario sea genuina.
2. **Cardinalidad:** el máximo de una asociación activa usuario/empleado por empresa es **restricción conservadora temporal de QA**, no política comercial aprobada; simultaneidad, recontratación y revinculación históricas quedan pendientes de contrato. Verificar esquema actual antes de elegir tabla, FKs, tenant y UNIQUE; carreras deben probarse **realmente en MariaDB**, no por dos requests secuenciales.
3. **Lectura laboral confiable:** demostrar vínculo tenant+empleado+evento; `SERVER_STORED/UNASSESSED` de B14 **no** implica asistencia reconocida. No exponer `sync_events.payload_json` bruto ni usar `requestId` como identidad laboral. Si no existe proyección atribuible, implementar enlace y endpoint seguro sin filas falsas, informar `MY_JOURNEY_DATA_GATE=PARTIAL_NO_TRUSTWORTHY_SOURCE`.

**Entrega Codex próxima:** única ejecución en `D:\codex\Jornato`, Laravel/Sanctum/MariaDB, negativos A/B/C, revocación, login/GET sin marcación, SHA de fuentes finales y evidencia MariaDB/HTTP **si se ejecuta**; Flutter personal solo con sesión aislada real, sin reutilizar PIN. No AVD API24 ni C04 de 1.000 eventos por inercia; no stage/commit/push/merge/deploy de código. Exactamente un ZIP `JOR-B15-S2-V2-IDENTIDAD-LECTURA-PERSONAL-QA-20261107-UNICO.zip`. `NEXT_OWNER=CHATGPT`; después actualizar **este archivo**, no crear otra versión. Continuar B15 restante → B16 portal → B17 novedades → B18 reglas informativas → B19 documentos → B20 contratación → B21 L5 integral y deudas B13/B14 → B22 únicamente GO humano escrito.

### Auditoría de entrega B15-S2 V2 — 2026-11-07

**Entregado, no autoaprobado:** `JOR-B15-S2-V2-IDENTIDAD-LECTURA-PERSONAL-QA-20261107-UNICO.zip`, SHA256 `BF88F37C16BE867054869BCA9DE131E8664393570ABFE0B92E94F92EF1968453`, 76.578 bytes, 30 archivos; 29/29 miembros del manifiesto verificados, CRC y rutas seguras. ChatGPT ejecutó `php -l` propio en los cuatro PHP incluidos: 4/4 PASS. Las 31 pruebas/923 aserciones MariaDB 11.4.13 son ejecución **reportada por Codex**, no L5 runtime independiente. En la primera tentativa hubo `MySQL server has gone away` (30 pruebas, 2 errors); causa exacta no demostrada; la segunda ejecución final fue verde. Se verificaron hashes de las 8 fuentes finales contra `SOURCE_HASHES_PRE_POST.csv`; el replay de patch 8/8 lo reporta Codex, no se ha reejecutado por ChatGPT.

**Código nuevo:** `employee_identity_links` con FK tenant/sede/empleado, unique de ranuras activas revocables y check de estado; GET `/v1/companies/{company}/me/attendance` requiere cuenta+Sanctum+membership+api:read, comprueba vínculo activo. **No retorna ningún evento**, incluso estando vinculada la cuenta: `data=[]`, `link_required/source_not_verified`. No hay POST de vínculo comercial ni Flutter personal. `B15_S2=PARTIAL_PRODUCTIVE` por término del ejecutor; aceptación directiva más precisa: `PASS_QA_FOCAL_FAIL_CLOSED` + `MI_JORNADA_REAL=NO`.

**Bloqueos preservados:** `LINK_ADMIN_RUNTIME=BLOCKED_PERMISSION_CONTRACT` (ni owner/admin implícito ni autocoincidencia de email/PIN); `MY_JOURNEY_DATA_GATE=PARTIAL_NO_TRUSTWORTHY_SOURCE` (el `subject_id` viene del cliente y `SERVER_STORED/UNASSESSED` no acredita actor físico ni asistencia reconocida); concurrencia real de enlaces NOT_RUN; Flutter personal NOT_IMPLEMENTED; `L5_INDEPENDENT_RUNTIME=NOT_RUN`; B13/B14/Release no aprobados.

**Hallazgo L2 documental:** el `SOURCES/docs/JORNATO_CONTINUIDAD.md` del ZIP contiene dos bloques de B15-S2, uno preliminar `30 tests/871 assertions` y otro final `31/923`. El último es resultado final del lote; no borrar historia B14 ni trasladar esta duplicación a este checkpoint remoto. Corregir el duplicado local solo al modificar el documento en un próximo lote.

**Decisión directiva B15-S3 V2 (ORDEN CORREGIDA, NO EJECUTADA):** La V1 quedó supersedida tras auditoría adversarial de diez pasadas × seis leyes (29 decisiones favorables documentales, 18 ajustes en orden, 13 límites). No hubo un ZIP S3 ni pruebas S3 nuevas. **Riesgo principal de V1:** un flag default OFF podía activarse accidentalmente fuera de QA. V2 exige **simultáneamente** `app()->environment('testing')` Y opción QA explícita: `production/local+flag ON => reported_events=[]`. Los vínculos `User↔Employee` siguen solo con fixtures sintéticos; no hay permiso de enrolamiento comercial. No inferir autor humano, asistencia, presencia u horas desde `sync_events.subject_id`, `actor_id` de payload o `SERVER_STORED/UNASSESSED`.

**V2 — alcance exacto:** ampliar GET `/v1/companies/{company}/me/attendance` existente mediante `reported_events` para reportes **que mencionan una ficha** con tenant+sede+subject+receipt verificados en columnas persistidas de MariaDB QA y estado explícitamente «no verificado»; `data=[]` se conserva para asistencia reconocida. Prohibidos JOIN por UUID sin tenant, devolución de `payload_json`, reclasificación o horas, endpoint paralelo, escrituras en GET y suplantación por IDs del cliente. Distinguir hora declarada del dispositivo y hora recibida por el servidor. Cero registros fuera de testing incluso con flag ON. Si la relación de recibo no se puede verificar, FAIL CLOSED y evidencia, sin inventar esquema. QA sintética real: HTTP A muestra 1+ reporte propio, B/empresa ajena cero; flags y revocaciones negativos. Si falta fuente o permiso: `S3=PARTIAL`, nunca PASS por 200 vacío. Flutter personal permanece `NOT_IMPLEMENTED` si no existe sesión personal segura; siguiente trabajo funcional B15-S4, no nueva tarjeta kiosco ni otro diagnóstico B14.

**Orden V2 descargable (conversation artifact; NO en GitHub):** `CODEX_LUNA_JORNATO_B15_S3_V2_REPORTE_NOVERIFICADO_QA_AISLADO_UN_ZIP_20261107.md`, SHA-256 `6dc530cdd3b5fd96a3c035721de065001f85eb6886526df052c796430d32879e`. Informe director 10×6 `JORNATO_B15_S3_V2_AUDITORIA_DIRECTOR_10X6_PLAN_FINAL_GITHUB_20261107.md`, SHA-256 `474be452874a9c7e3020e0bb697d84d364849420204efbc5b0189e2dbeb07aa3`. **ZIP esperado:** `JOR-B15-S3-V2-REPORTES-FICHA-QA-20261107-UNICO.zip`. No usar V1 después de esta corrección; si ya comenzó V1, aplicar solo diferencias sin resetear trabajo. `NEXT_OWNER=CODEX_LUNA` hasta recibir ZIP; luego `NEXT_OWNER=CHATGPT`. B13/B14/B15 global y Release permanecen sin aprobación.

### B15-S3 adjudicado; B15-S4 V2 revisado por verdugo ×10 y juez ×10 — 2026-11-10

**Última entrega real:** `JOR-B15-S3-V2-REPORTES-FICHA-QA-20261107-UNICO.zip`, SHA256 `89bd6b6db05c88818366101852bd8f0c1a60b1478d7318f8610ecce004289962`; archivo 74 miembros, CRC y 73/73 hashes/bytes verificados directamente. Pruebas S3 focales 9/323 y regresiones 32/911 por logs de Codex; **L5 runtime independiente NO ejecutada**. `B15_S3=PASS_QA_REPORTED_VIEW`, `B15_GLOBAL=PARTIAL`; `data=[]` no representa asistencia reconocida y `reported_events` no prueba autoría. `APP_ENV=testing` más flag QA son requisitos simultáneos para exponer registros.

**Lecciones ambientales no atribuibles:** inventario Docker antes/después reportó dos contenedores y una red Liquidapro ausentes, sin causa/actor demostrados; los nombres de 51 volúmenes coincidieron, no sus contenidos. No tocar recursos ajenos. Script histórico creado en `C:\Users\felip\AppData\Local\Temp\jornato_s3_existing_zip_inspect.py` incumplió D:; no borrarlo/repararlo sin autorización y colocar trabajo temporal futuro solo en D:.

**RUMBO VIGENTE: B15-S4 V2 MACROBLOQUE, NO EJECUTADO.** La orden S4 V1 queda sustituida por V2 tras 10 pasadas adversariales como verdugo y 10 como juez, con contraste L1–L6 cada vez. En las fuentes B13/B15 existe login Sanctum y el endpoint de jornada personal, **pero** las rutas protegidas atraviesan `device.active`: no está acreditado que un celular personal tenga un mecanismo autorizado para satisfacerlo. **Prohibido** eliminar/bypassear middleware, simular login como integración real o añadir segunda autenticación. Implementar en una sola entrega **sesión personal Flutter + pantalla real «Mi jornada» + empresa activa + logout + seguridad A→B y respuestas tardías + pruebas host/widget**. HTTP real solo si el contrato de dispositivo lo admite y se ejecuta en un entorno sintético seguro; de lo contrario `PERSONAL_API_INTEGRATED=BLOCKED_DEVICE_CONTRACT`, sin bloquear la UI/cliente probado en host. Token en almacenamiento seguro existente **solo si se verifica**; de lo contrario memoria-only QA, sin persistir token en claro. Sin caché personal de jornadas ni cambios a kiosco PIN/ledger/outbox B14. El acceso a reported_events permanece solo QA y siempre indica «No verificado».

**Orden única ejecutable fuera de GitHub:** `CODEX_LUNA_JORNATO_B15_S4_V2_MACROBLOQUE_FLUTTER_PERSONAL_FINISH_QA_UN_ZIP_20261110.md`, SHA256 `ecf6e2da40b19af75650ddf20ca40e508f072547ca7dc8e20f8718c057cb475d`. **Auditoría de decisión:** `JORNATO_B15_S4_V2_VERDUGO_10_JUEZ_10_AUDITORIA_DIRECTIVA_PLAN_20261110.md`, SHA256 `385c7ecfd360a8b09e3dafc3c555ea5e9753cd883259217a1bb8d35fd5fb17a8`. Estos archivos son artefactos descargables de la conversación, **no están almacenados en GitHub**; no fingir recuperación de sus bytes desde el repositorio. El ZIP único que entregará Codex: `JOR-B15-S4-V2-MACROBLOQUE-PERSONAL-20261110-UNICO.zip`.

**Estados no modificables sin evidencia nueva/autoridad:** `B13_GLOBAL=PARTIAL`; `B14_FINAL=NOT_APPROVED`; `B15_GLOBAL=PARTIAL`; `LINK_ADMIN_RUNTIME=BLOCKED_PERMISSION_CONTRACT`; `L5_INDEPENDENT_RUNTIME=NOT_RUN`; `RELEASE_APPROVED=NO`. S4 sigue `NOT_EXECUTED` a este corte. `NEXT_OWNER=CODEX_LUNA` hasta entrega del ZIP, después `NEXT_OWNER=CHATGPT`. Trabajo local solo D:, preservar WIP; sin stage/commit/push/merge/deploy del código. Avanzar con módulos B15 restante → B16 portal Pro → B17 permisos → B18 cálculos informativos → B19 documentos → B20 reclutamiento → B21 QA integral y puertas pendientes → B22 solo GO escrito.

## 5. Plan de primera publicación integral

| Etapa | Entrega | Evidencia/gate de salida |
|---|---|---|
| B15-S2 | Vincular sujeto empleado autorizado y leer jornada propia (candidato QA) | Laravel/MariaDB tenant+Sanctum, 0 hechos al login, A/B/C negativos, sin inventar contrato comercial |
| B15 resto | Historial, solicitudes, GPS/QR/Wi-Fi/IP/NFC y notificaciones según contratos | No sensor PASS sin dispositivo/hardware y política validada |
| B16 | Portal web Pro multiempresa/sede, turnos/reportes, roles/plan | Autorización por tenant, reportes reales, no cobros inventados |
| B17 | Novedades/ausencias/vacaciones, ledger | No falsificar horas observadas, revisión legal |
| B18 | Cálculos informativos, recargos, exportaciones | Reglas Colombia versionadas, fixtures y validación profesional |
| B19 | Expedientes/documentos/contratos/firma | Privacidad, acceso, versiones/firma efectiva |
| B20 | Selección/CV/agenda | Seguridad de archivos, aislamiento, privacidad |
| B21 | Integración y auditoría independiente | Resolver S4-07/S4-10, B13 legal/SMTP, reservas B14, dispositivos, QA E2E |
| B22 | Preparación distribución/despliegue | `GO` escrito del propietario + evidencia B21, nunca autopublicar |

## 6. Cómo retomar en un chat nuevo

Leer primero este documento, el `AGENTS.md` de la misma rama y el canon PingPongLaw fijo; contrastar luego la última entrega ZIP que el usuario adjunte. **No confundir el último checkpoint publicado con el estado actual local**. Si hay un ZIP más reciente, adjudicarlo antes de actualizar esta hoja. No preguntar de nuevo por D:, el backup-waiver, KISS, seis leyes, un ZIP o rol de Codex. Actualizar **este mismo archivo** en la misma rama documental, no crear `CONTINUIDAD_V2/V3`.

**Ramas/PR:** documentos publicados en rama `docs/pingponglaw-l1-l6-canon-84e961c`, PR #2 OPEN/DRAFT. `main` no tiene aquí el WIP; fusionar o publicar únicamente con autorización expresa.
