# JORNATO — READY ROOM DEL SERVIDOR Y ENTREGA PARALELA · S0 · 21-NOV-2026

**NATURALEZA:** preparación operativa independiente realizada por ChatGPT Director, SIN ejecución del servidor ni acceso al WIP Windows. **NO ES NUEVA ORDEN PARA CODEX.** N3-R1 continúa en ejecución y conserva exclusividad sobre `D:\codex\Jornato`, código, APK y QA. Este documento se aloja únicamente en el PR #2 documental.

**RESULTADO S0=PREPARED_DOCS_ONLY; SERVER_RUNTIME=NOT_VERIFIED; DEPLOY=NOT_AUTHORIZED; B22=NOT_AUTHORIZED; RELEASE=NO_GO.**

## 1. Frontera real de evidencias — no inventar hechos

| Fuente/alcance | Evidencia comprobada o históricamente reportada | No demuestra |
|---|---|---|
| GitHub público `sierraglobalcompany-rgb/Jornato` | `main=1ee6aae821f8cf177cc64149081ad8847f7fec2e`; PR #1 F0 Flutter, PR #3 F0 Flutter Draft, PR #2 documental Draft | **No** contiene backend avanzado Laravel ni el WIP Windows |
| Backend B21F-S3 (informes anteriores) | Suite de **158 tests / 2.450 assertions PASS_SCOPED** según reportes anteriores | Instalación fresca en entorno destino, endpoint real expuesto, contrato Pro autorizado o despliegue |
| N2-R1 | ZIP `CC4846C6D901564E246D17B8A28C2B28A772F5A76E00442E0A3BFD19D19B04DB`; **86 PASS host / 7 archivos**, análisis/format PASS según Codex | KioskScreen físico, Android SQLCipher/Keystore ni sincronización E2E |
| N3-R1 | En curso por Codex Luna; única orden del WIP | Nada todavía se puede certificar de N3 hasta recibir su ZIP |
| B21-S1 histórico | El entorno QA de aquel lote carecía de DB usable; no extrapolar ese estado al PASS posterior B21F-S3 | Disponibilidad actual de MariaDB QA o producción |
| Decisiones | OD02 vínculo cuenta–empleado/revocación, OD03 permisos RR. HH., OD04 login web **pendientes**; B19/B20 deny-all | Autorización para habilitar roles, endpoints o cobros |

**Fuentes documentales internas:** `docs/JORNATO_CONTINUIDAD.md`, `docs/JORNATO_RECOVERY_HANDOFF_ACTUAL.md`, `docs/JORNATO_B21F_S3_V2_VERDUGO10_JUEZ10.md`, `docs/JORNATO_B21_S1_DICTAMEN_INDEPENDIENTE_Y_DESBLOQUEO.md`, `docs/PRODUCTO.md` del PR #1. No extrapolar del F0 a la implementación avanzada.

## 2. Separación del trabajo: cero colisiones

| Frente | Responsable ahora | Modificable ahora | Prohibido |
|---|---|---|---|
| N3-R1: app/KioskScreen/candidato WIP | Codex Luna | Solo WIP y carpeta `_REPORTES/Jornato` bajo su orden | No interrumpir, no abrir segundo Codex en WIP, no publicar WIP |
| S0 servidor: contrato, puertas, evidencias | ChatGPT Director | Solo documentos nuevos en rama PR #2 `docs/pingponglaw-l1-l6-canon-84e961c` | Nada en `server/`, `main`, PR1/PR3, prod, DB, secretos ni despliegue |
| S1 servidor: QA con fuente real | **NADIE hasta concluir N3 y autorizar entorno aislado** | No iniciar ahora | No usar `D:\codex\Jornato` concurrentemente ni esquema de otro producto |
| Lanzamiento | Propietario, con criterios L4/L5 | Solo después de UAT + GO explícito | B22, firma, producción y migraciones reales prematuras |

## 3. Diseño operativo mínimo del servidor (SIN código nuevo)

**Mantener arquitectura actual reportada:** Laravel + Sanctum + MariaDB, API de tenant, outbox móvil y portal web ya diseñados. No segundo backend, no microservicios, no Redis/Docker/Kubernetes por defecto. No migrar proveedor ni comprar hosting hasta conocer necesidades y el despliegue existente.

**Inventario que se necesitará, pero NO se puede completar desde GitHub F0:**
1. Versión efectiva de PHP y Laravel: `server/composer.json`, `composer.lock` y runtime del proyecto **real**.
2. `server/routes/*.php` y middleware por ruta, incluyendo habilitación explícita B19/B20; **NO** inferir URLs por convenciones Laravel.
3. `server/database/migrations` y estados efectivos, tablas, índices de idempotencia, tenant e integridad; modelo de eventos, outbox y reintentos.
4. `server/phpunit.xml`, configuración QA/DB (solo nombres y existencia; nunca contenido de `.env*`), pruebas de aislamiento A/B, PAT revocado y autenticación web.
5. Necesidades reales de cola, cron/scheduler, correo, ficheros y almacenamiento; si un subsistema no se usa, marcar `NOT_REQUIRED_CONFIRMED`, no instalarlo.
6. Destino de hosting, sistema operativo/PHP, acceso de despliegue y dominio TLS: `DESTINATION_UNDECIDED` hasta evidencia/decisión del propietario.
7. Fuente revisada de secretos/PII y repositorio privado/destino de respaldo externo autorizado: `NOT_READY` hoy.

**Bloqueo de autoridad:** PR1 y PR3 son sólo F0, por tanto no sirven para desplegar servidor. El PR2 tampoco es un sustituto del WIP. Nunca crear una API alternativa por no tener accesible el código Laravel original.

## 4. Contrato de integración app ↔ servidor (sin endpoints inventados)

| Contrato obligatorio | Criterio de aceptación de S1/S2 | Estado actual |
|---|---|---|
| Identidad espacio/tenant | Las respuestas y mutaciones deben quedar en el tenant autenticado; A no puede consultar, listar ni modificar datos de B | `NOT_VERIFIED_E2E` |
| Identidad actor/sujeto | La cuenta no obtiene identidad de empleado por inferencia; OD02 pendiente, vínculo y revocación deben ser aprobados | `BLOCKED_OD02` |
| Token Sanctum/PAT | PAT inválido, expirado o revocado falla cerrado; privilegios no se heredan entre tenants; no registrar tokens | `PASS_SCOPED_HISTORICAL` / E2E `NOT_RUN` |
| Evento offline/outbox | Identidad de evento, `requestId`, reintentos idempotentes y resolución de colisiones; conservar histórico `requetId` donde exista | `NOT_VERIFIED_E2E` |
| Resultado servidor | `SERVER_STORED` **no** equivale a `RECOGNIZED`; no atribuir aprobación laboral por acuse de transporte | `CONTRACT_INVARIANT` |
| Orden/reloj | `occurredAt` ≠ `recordedAt`; detectar eventos tardíos, relojes manipulados y solapamientos sin borrar trazabilidad | `NOT_VERIFIED_E2E` |
| Permisos RR. HH. | B19/B20 siguen `deny-all` sin OD03/OD06; no habilitar rutas para obtener PASS | `BLOCKED_OD03_OD06` |
| Login web | No crear puente de sesión/role ad hoc; OD04 pendiente | `BLOCKED_OD04` |
| Privacidad | Pruebas solo con dos tenants sintéticos A/B; cero datos laborales reales ni credenciales en ZIP/commits | `REQUIRED` |

**IMPORTANTE:** No fijar verbos HTTP, nombres de rutas, tablas, códigos exactos de error ni payloads antes de extraerlos del código real: la matriz expresa **oráculos**, no contratos de interfaz ya verificados. En la siguiente revisión, emparejar cada fila con `route_name + middleware + controller + test + SHA` observados.

## 5. Puertas de aceptación preparadas para ejecutar DESPUÉS de N3

**S1 · Fuente y custodia [P0].** Obtener código Laravel desde candidato privado autorizado o acceso directo read-only al WIP **cuando Codex haya terminado**, registrar versión, HEAD y hashes, revisar dependencias/secretos y hacer backup privado fuera del equipo con autorización. Si no hay código, `BLOCKED_SOURCE`, no lanzar otro backend. No copiar `.env`, tokens, bases ni datos.

**S2 · QA aislada [P0].** Solo con entorno disposable inequívoco, fixtures falsos y backup; verificar que esquema y usuario DB no apunten a producción, otro proyecto o DB preexistente. Migraciones sobre DB exclusivamente de QA. Reutilizar B21F-S3 `PASS_SCOPED`; ejecutar **solo** pruebas nuevas o causadas por cambios de fuente; nunca repetir 158 tests para aparentar avance. A/B tenant, PAT revocado, idempotencia, integridad de migrations, HTTP mínimo y cola solo si efectivamente usada.

**S3 · Contrato horizontal [P0].** Alinear SDK/cliente Pro con rutas y payloads obtenidos del Laravel real, clasificar `SERVER_STORED`, `RECOGNIZED` y `BLOCKED_CONTRACT`; OD02/03/04 pendientes no se desbloquean inventando roles o consentimientos. No activar B19/B20.

**S4 · Staging de servidor [P1].** Requiere hosting/dominio y acceso aprobados. Checklist de **producción futura**, no estado actual: PHP/extensiones compatibles, `public` como raíz web, TLS HTTPS, `APP_DEBUG=false`, `APP_ENV=production`, `APP_KEY` estable y protegido, DB y backups fuera del público, permisos mínimos de `storage`/`bootstrap/cache`, secretos fuera de Git, salida sin trazas o rutas internas. Preparar estrategia de despliegue reversible por versión/artefacto y de restauración de DB **comprobada**; no asumir rollback automático de migrations.

**S5 · Operación [P1].** Confirmar si existen jobs, correos, scheduler y archivos. Solo si se usan: process monitor para workers, `php artisan reload` o reinicio conforme a versión/capacidades reales, monitoreo/retención sanitizada, scheduler autorizado, cola de fallos y alerta. Evitar poner workers en una app sin colas.

**S6 · Preproducción y GO [P0 para release].** Dos tenants sintéticos A/B; web/Android/servidor integrados; salida offline→online sin duplicar jornadas; test de revocación, corrupción SQLCipher/Keystore/reinicio Android (todavía `NOT_RUN`); pruebas UAT L4 y revisión L5, accesibilidad, firma y decisión explícita del propietario. `RELEASE=NO_GO` hasta entonces.

## 6. Matriz única de ejecución

La tabla editable operacional está en [JORNATO_SERVIDOR_GATES_S0_20261121.csv](JORNATO_SERVIDOR_GATES_S0_20261121.csv), 24 controles con ID, estado, evidencia, dueño, dependencia, salida requerida y bloqueo. **Fuente canónica de los controles del servidor = ese CSV**, no crear diez listas paralelas.

**Regla de gobierno del CSV:** `PASS_SCOPED_REPORTED` no se transforma en `PASS_E2E` sin nueva evidencia. Toda transición exige `run_id, source_SHA, environment_id, proof`; al no disponer de pruebas hoy, los campos quedan `NOT_COLLECTED`.

## 7. Orden de aceleración vinculada a N3 (sin otro Codex ahora)

| Momento | Trabajo | Resultado útil |
|---|---|---|
| **AHORA (en paralelo a Codex N3-R1)** | ChatGPT: este ready room + matriz, contratos y criterios de infraestructura; actualizar docs PR2 | S0 documental terminado, ninguna interferencia |
| **JUSTO AL RECIBIR ZIP N3** | Certificar oráculos N3, hashes y candidato; detectar si existe backend accesible con permiso | Go/no-go hacia integración sin otro 10+10 |
| **PRIMER BLOQUE POST-N3** | Un macrobloque coherente para `SERVER SOURCE + QA aislada + integración contractual`, con preflight de seguridad y permiso | Evidencia de servidor real y reparación de causas, **no** un nuevo inventario sin pruebas |
| **DESPUÉS** | Android nativo y tenant Pro, staging, UAT y release por puertas | Cierre de producto sin promover falsos PASS |

**Separación de propiedad de Git:** ChatGPT actualiza únicamente documentos de PR #2. Codex sigue siendo responsable exclusivo de N3 en Windows. NO habilitar segundo proceso, branch, servidor en producción ni sincronizaciones durante N3.

## 8. Referencias verificables (manuales, no evidencia de Jornato)

- Laravel 13 Deployment: https://laravel.com/docs/13.x/deployment (configuración de producción, salud, servicios persistentes y recarga).
- Laravel 13 Sanctum: https://laravel.com/docs/13.x/sanctum (PAT, abilities y sesiones web).
- Laravel 13 Configuración: https://laravel.com/docs/13.x/configuration (caché de config/secretos).
- Laravel 13 Queues: https://laravel.com/docs/13.x/queues (workers de larga vida si los hay).
- Estas guías **no** confirman versión, hardware, hosting, rutas ni estado de la implementación privada. Comprobar `composer.lock` antes de usar comandos de una versión concreta.

## 9. Límites y NEXT

- **N3-R1=IN_FLIGHT REPORTED BY USER**; ningún ZIP N3 nuevo recibido aquí.
- **SERVER_S0=PREPARED_DOCS_ONLY**; `SERVER_QA_REAL=NOT_RUN_THIS_TURN`; `SERVER_DEPLOY=NOT_RUN`; `H9_GLOBAL=NO_GO`; `B22=NOT_AUTHORIZED`; `RELEASE=NO_GO`.
- No reemplazar `docs/CODEX_LOTE_ACTUAL.md` durante N3; no enviar a Codex prompt nuevo hasta recibir su ZIP.
- **NEXT_OWNER_NOW=CODEX_LUNA_FINISH_N3_R1; DIRECTOR_NEXT=REVIEW_ZIP_AND_ACTIVATE_SERVER_S1.**
