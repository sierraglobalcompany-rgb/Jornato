# CODEX LUNA — JORNATO B16-S1 V1 · MACROBLOQUE PRODUCTIVO PORTAL PRO RESPONSIVE

**TASK_ID:** `JOR-B16-S1-V1-PORTAL-PRO-VERTICAL-20261112`  
**PROYECTO ÚNICO:** Jornato, `D:\codex\Jornato`.  
**DIRECTOR Y ÚNICO ADJUDICADOR:** ChatGPT. **EJECUTOR:** Codex Luna, manos de implementación, sin escoger nuevas arquitecturas ni reinterpretar el producto.  
**DIRECTORIO DE TRABAJO/PRUEBAS/ZIP:** únicamente `D:\codex\_REPORTES\Jornato\JOR-B16-S1-V1-PORTAL-PRO-VERTICAL-20261112_WORK` para temporales/QA, y carpeta de entrega `D:\codex\_REPORTES\Jornato\JOR-B16-S1-V1-PORTAL-PRO-VERTICAL-20261112`.  
**UN SOLO ARCHIVO FINAL EXTERNO:** `JOR-B16-S1-V1-PORTAL-PRO-VERTICAL-20261112-UNICO.zip`, dentro de la carpeta de entrega. Colocar **todo** informe/evidencia/fuente/patch/manifest dentro del ZIP, **nada disperso como entrega**.  
**NEXT_OWNER:** `CHATGPT` después del ZIP. **NO stage, commit, push, merge, deploy ni publicación del código local.**

## 0. DECISIÓN DIRECTIVA: TRABAJO PRODUCTIVO, NO OTRA AUDITORÍA DE S5

Este prompt reemplaza la antigua recomendación de diagnosticar S5. B15-S5 V2 ya entregó `PASS_HOST_SCOPED_WITH_SERVER_GATE`: 30 Flutter host tests por logs, 6/6 fuentes parche reproducido por ChatGPT, ZIP íntegro; `HTTP_KERNEL/REAL_TLS/ANDROID_NATIVE/L5_INDEPENDENT_RUNTIME=NOT_RUN`, y `SERVER_REVOCATION=NOT_RUN_UNCONFIRMED`. **No reabrir S4/S5 ni el writer B14.** B16 comienza ahora. Los gates B13, B14, B15 y Release siguen pendientes; B16 no los cambia por transitividad.

Meta de producto en **UN macrobloque**: **portal web Pro de administración** dentro del backend monolítico existente, que permita a un responsable autorizado ver empresa activa, **Hoy** con calidad de datos, **Sedes**, **Turnos/calendario** y **Reportes/descarga** cuando haya datos y permisos reales; diseño responsive integrado y estados seguros. En ausencia de datos fiables, construir estados vacíos útiles y proteger el cálculo; no rellenar con cifras ficticias. La especificación maestra V5 es candidata, no override de ADR/mockups ni permiso comercial.

### Prohibiciones y preservación

- No tocar ERP, Liquidapro, otros contenedores/redes/volúmenes, C:, configuración global ni HOME; **no crear scripts temporales en C:**. No ejecutar `git clean`, reset, restore, checkout destructivo, ni borrar `.salive`/untracked. No repetir incidente de Docker; no iniciar Docker compartido.
- No modificar sistema personal Flutter/kiosco/PIN/outbox/SQLCipher/ledger B14 salvo que el cambio sea estrictamente necesario y esté justificado por prueba causal nueva; default: **cero cambios a esos árboles**.
- No PostgreSQL ni nuevo backend, nuevo SPA, Node build o framework frontend si no existe; no agregar servicios, colas, proveedor de pagos o paquete externo para mostrar cuatro vistas. **KISS/Ponytail:** usar infraestructura web y vistas/layout/estilos existentes. Si no hay interfaz web, preferir páginas server-rendered **Laravel Blade + CSS ligero ya disponible** en el monolito, sujetas al guard de autenticación que el checkout realmente permita. No inventar segundo repositorio ni autenticación paralela.
- **No inventar autenticación web:** reutilizar usuarios, políticas, tenant y guard/session/Sanctum ya aprobado **si existe**. Si no existe flujo de login web aprobado, preparar las vistas y controladores **protegidos** y probarlas con fixtures Laravel bajo `actingAs`; NO habilitar un login público comercial ni almacenar PAT en `localStorage`, JS, URL o HTML. Documentar `WEB_LOGIN_GATE=BLOCKED_EXISTING_AUTH_CONTRACT`, pero avanzar en las demás partes verificables. Nunca `Auth::loginUsingId` con ID cliente, nunca `auth` bypass por `APP_DEBUG`, nunca usuario administrador fijo.
- No precios, límites de empleados, pasarela, publicidad ni Pro comprado sin entitlements y pagos **aprobados**; distinguir derecho al plan y facturación. Si no hay entitlements confiables, mostrar estado honesto «No configurado / requiere activación», sin prohibir exportación de datos históricos ni escribir permisos falsos.
- No declarar «trabajando», «ausente», nómina o horas realizadas solo por `SERVER_STORED/UNASSESSED`, `reported_events`, reloj del dispositivo o `sync_events.subject_id`. Historial crudo ≠ asistencia reconocida. Si no hay proyección aprobada, panel **Hoy: “Datos no evaluados / Última sincronización desconocida”**, contadores vacíos/indeterminados, no `0 presentes` como certeza.
- Evitar escritura en tablas existentes sin contrato. Sedes/turnos se pueden mostrar **en lectura** si la autorización y origen son comprobables; edición/alta/publicación SOLO si las operaciones y permisos ya están definidos. No crear rutas de escritura ficticias para que parezca completo.
- El usuario conserva primera publicación comercial **integral** B15–B22. Este macrobloque avanza B16 con seguridad, no cambia el plan ni reduce el producto a un MVP.

## 1. INVENTARIO ORIENTADO: UNA SOLA PASADA, SIN PRE-FLIGHT INFINITO

En menos de una inspección focal del código existente, y ANTES de editar:

1. Registrar identidad `git branch`, HEAD, status `--porcelain=v1 -uall` con hash de archivo; listar **tracked + untracked** y sus hashes SHA antes de tocar sus rutas. Si estado difiere de lo históricamente reportado, protegerlo, no resetear.
2. Leer el `AGENTS.md` **local** y ADR/contratos locales pertinentes; consultar el canon PingPongLaw fijo `84e961cadf482d234f4c0ee2ca60e8c7e9b388e8` cuando accesible. Contrastar con checkpoint documental remoto `docs/JORNATO_CONTINUIDAD.md` y último lote guardado; **no sobreescribir AGENTS local** ni copiar ramas de docs sobre WIP.
3. Enumerar en un solo `ROUTE_INVENTORY.md` las rutas `routes/web.php` y `routes/api.php`, middleware reales (web/session, Sanctum, account.active, device.active, abilities, ResolveCompanyMembership), controladores y políticas. Inspeccionar templates/assets y si ya existe portal web. **No dar por válidas rutas solo porque un `CONTRACT_MATRIX.md` diga un nombre**: en S5 su tabla describía `/api/v1/auth/me` y `/api/v1/companies`, mientras el cliente S5 consume `/api/v1/me` y `/api/v1/me/companies`. Esto es una discrepancia documental, NO un fallo runtime demostrado; resolver leyendo fuentes locales reales. Reusar rutas comprobadas.
4. Identificar modelos y asociaciones reales `User`, memberships, `Company`, `Site`, `Shift`, roster/proyecciones, recibos/eventos y entitlements. Mapear fuente → tenant → permiso → presentación. **No introducir joins especulativos** ni asumir `id` globalmente exclusivo sin tenant.
5. Localizar mockups/UX aprobados, si existen. En su ausencia usar diseño neutro, consistente con estilos existentes, marcar `UX_OWNER_APPROVAL=PENDING` y no inventar aprobación. Las fichas candidatas UX-07..10, UX-15/22 y MOD-06/07 orientan estados, no autorizan rediseños ajenos.
6. Entorno: detectar una vez PHP, Composer/vendor, Laravel test env, MariaDB QA aislada. Si la única DB apunta a `127.0.0.1:1` o no hay ambiente aislado, `DB_QA=NOT_RUN_ENV`; **no reemplazar host, no usar datos reales, no arrancar contenedores**. Continuar vistas/funciones con pruebas unitarias deterministas si son posibles, sin falso PASS de integración.
7. Documentar el mapa de decisión de stack web en ≤1 página: **existente → reutilizar**; si no existe, Blade dentro de Laravel y guard ya configurado; si falta guard de web, ruta protegida no publicada y pruebas sintéticas, `WEB_LOGIN_GATE=BLOCKED`. **Después implementar, no pedir otra decisión a ChatGPT ni hacer tercera ronda de diagnóstico.**

## 2. CONTRATO DE AUTORIZACIÓN: IMPRESCINDIBLE ANTES DEL UI

- Toda página del portal debe rechazar usuario anónimo. Los datos de empresa se toman **del servidor y de la membresía válida del usuario autenticado**, no de `company_id`, site ID, cabeceras o parámetros no comprobados. Selector de empresa solo con la lista de membresías autorizadas; al cambiar empresa vaciar tablas/estadísticas/resultados previos del contexto anterior.
- Propietario y admin delegado: permisos **por empresa, sede, recurso y acción**, no roles globales. Si el checkout no demuestra un permiso de edición, implementar lectura y estado «Sin permiso»; no conceder capacidades nuevas por conveniencia.
- Negativos: actor A no consulta empresa B ni sedes/turnos de B por URL directa; rol empleado no ve panel admin; usuario sin membresía o revocado rechaza incluso con cookie/token aún válido; acciones de lectura no escriben eventos de asistencia; no autenticación = redirect login SOLO si flujo existe, o 401/403 según contrato, nunca datos.
- En páginas web con sesión, CSRF para todo POST/PUT/PATCH/DELETE; logout invalida sesión/CSRF según stack; cookie HttpOnly/Secure/SameSite conforme configuración de entorno real; **no habilitar `APP_DEBUG` en producción**. Escapar todas las cadenas de BD en Blade; no usar HTML sin escape para nombres/observaciones. No exponer errores SQL, tokens, secretos ni PII de otras empresas. No usar IDOR a través de enlaces, tablas, descargas.
- **No segundo source of truth** de empresa activa basado solo en JS/localStorage. Si hay sesión web real, contexto tenant server-scoped y verificación por request; si no hay autenticación real, usar flujo de test con `actingAs` sintético y dejar protegido el acceso externo.

## 3. BLOQUE PRODUCTIVO A — SHELL DEL PORTAL WEB RESPONSIVE

Construir en la estructura ya elegida o existente un layout consistente con el branding disponible de Jornato, con navegación: **Hoy · Sedes · Turnos · Informes · Ajustes/Plan**. El objetivo es que no sean botones vacíos. Agrupar pantallas en los archivos existentes para evitar 15 componentes triviales o arquitectura SPA paralela.

- Cabecera: empresa activa, cuenta/rol visible (sin exhibir PII excesiva), accesos permitidos y cerrar sesión si existe guard web. Contexto sin empresa = estado vacío guiado, no acceso a la primera empresa de la DB.
- Responsive: ancho móvil 360 px, tableta 768 px, escritorio 1280 px; controles táctiles, tipografía legible, foco visible, etiquetas asociadas, navegación teclado, sin desplazamiento lateral injustificado. Menu colapsable simple según componentes existentes.
- Estados de datos: `loading`, `empty`, `error`, `forbidden`, `stale/unverified`, `not configured`; nunca mostrar números falsos en una tabla vacía. En servidor render tradicional no fingir spinners perpetuos; comunicar fuente y cobertura.
- Errores: mensajes claros para «sin permisos», «sin información reciente», «empresa no disponible», «datos todavía sin evaluar», «servicio sin conexión»; usuario debe poder volver a empresa disponible.
- Cero ads en portal Pro hasta derechos confirmados; no scripts de analítica que expongan datos personales.
- CSS/Blade sin dependencia CDN no aprobada ni fuentes remotas; rendimiento básico para listados paginados.

## 4. BLOQUE PRODUCTIVO B — HOY / DASHBOARD DE EMPRESA

En la empresa seleccionada, mostrar tarjetas candidatas `Trabajando`, `En descanso`, `Sin marcación esperada`, `Requiere revisión`, pero **solo con proyección laboral realmente reconocida y fecha/ventana/cobertura definidas**. Las reglas se expresan en el servicio/proyección existente, no recalcular ledger en una Blade.

- Con fuente confiable, cada contador debe enlazar un filtro real, reflejar solo la empresa/sede del contexto y enseñar «Última sincronización» con la frescura verificable.
- Con fuente NO verificada (B14 `SERVER_STORED/UNASSESSED`), NO calcular conteos de presencia/ausencia: mostrar `Indeterminado · esperando validación` y la calidad de datos por sede. Si realmente se sabe «0 hechos recibidos», etiquetarlo como observación de recepción, no «0 empleados trabajaron».
- Listar novedades/incidencias **solo** si existe modelo de permisos y source; si no, estado vacío nombrado «Módulo de novedades por completar B17». No inventar tickets.
- Operación de lectura pura: abrir Hoy, cambiar sede, filtrar fecha o refrescar no agrega `AttendanceEvent`, no altera recibos ni autoriza correcciones.

## 5. BLOQUE PRODUCTIVO C — SEDES Y EMPLEADOS RESUMIDOS

- `Sedes`: listado paginado, nombre/estado/empresa, cobertura de sincronización cuando sea verificable; selector y página de detalle sin acceso cruzado a sedes ajenas. Si no existe endpoint/relation, implementar controlador de lectura mínima sobre modelo existente con política/tenant, no duplicar Company/Site ni abrir GET público.
- `Equipo`: opcional en el mismo apartado solo si relación empleado/empresa está probada; mostrar recuento de personas registradas **sin interpretar asistencia**. El admin puede ver roster autorizado, el trabajador no. Nunca exponer PIN/hash, tokens, datos médicos o documentos.
- Edición de sedes/empleados: **solo** cuando haya contrato previamente fijado y autorización de actor. Si falta, presentar el estado y registrar dependencia, sin botón «Guardar» inerte.
- Verificar estado de dispositivos por `last_seen_at` / fuente de sincronía cuando realmente exista; no inventar `online` basado en reloj del navegador.

## 6. BLOQUE PRODUCTIVO D — TURNOS / CALENDARIO

- Mostrar horarios vigentes y futuros por sede/empleado si el esquema tiene `Shift`/asignación autorizada; vista semanal simplificada, fecha y huso local/capacidad de turnos nocturnos. Diferenciar `programado` de `observado`.
- Cambios históricos: no reescribir turnos anteriores ni promover una plantilla a hecho laboral. Alta/edición/publicación solo si existen transiciones/versiones/permisos aprobados; de lo contrario lector funcional + mensaje de configuración pendiente.
- Filtrar por empresa y sede *antes* de paginar/contar; hacer tests de acceso a turnos de otro tenant. Evitar consulta N+1 en 100 empleados; paginar y usar eager loading/índices existentes cuando corresponda.
- Si no hay fuente de turnos del backend, no llenar el calendario con datos de muestra fuera de test. El layout y un caso de test sintético pueden avanzar sin afirmar la funcionalidad productiva.

## 7. BLOQUE PRODUCTIVO E — INFORMES, EXPORTACIONES Y PLANES

- Reportes informativos de datos disponibles: por empresa/sede y rango; **atribuir qué calidad tienen**. Separar «recibos sincronizados» de «asistencia reconocida», con columnas/hora declarada versus recibida si aplica. Nunca convertir `reported_events` QA employee en informe gerencial de asistencia.
- Exportación CSV solo de conjuntos autorizados y con contenido real. Prevenir spreadsheet formula injection prefijando celda textual que empieza con `=`, `+`, `-`, `@` o caracteres de control según política existente; codificación UTF-8 y encabezados estables. No exportar PIN, hashes, emails sin necesidad, ni payload_json. Probar CSV en un caso con cadena maliciosa y empresa A/B.
- Descargas seguras: cabeceras content type/disposition y `Cache-Control: private, no-store`, paginación o límites razonables, no incluir datos ajenos por cambio de filtros o query.
- Si no existe fuente confiable, **no habilitar exportación de horas/sueldos inventados**; puede haber reporte seguro de catálogo sedes/turnos con etiqueta «Programación» y gate `ATTENDANCE_EXPORT=BLOCKED_UNASSESSED`.
- Plan/entitlement: lectura de derecho existente por empresa, nunca cobro automático ni precio/prestaciones inventadas. Sin contrato aprobado, página «Activación Pro pendiente de configuración comercial», sin botones de compra falsos. No degradar acceso a exportar propios registros por ausencia de plan.

## 8. PRUEBAS DE UN SOLO LOTE (ORÁCULOS EXPLÍCITOS)

**Antes de declarar PASS leer exit codes originales.** No correr pruebas anteriores masivas ni repetir 1.000 registros C04. Crear test focal únicamente donde el código cambie, y regresiones vecinas según dueño. Nombrar cada oráculo O01–O28 con `PASS_REAL`, `PASS_HOST_ONLY`, `PARTIAL`, `FAIL`, `NOT_RUN_ENV` o `BLOCKED_CONTRACT` y ruta a log/source SHA.

**Identidad/tenant (O01–O08)**: O01 anónimo sin datos; O02 owner A ve su empresa; O03 owner A no ve empresa B por URL; O04 sede B prohibida; O05 empleado sin rol admin prohibido; O06 membresía revocada prohibida; O07 cambio empresa borra contexto previo; O08 logout/CSRF y cookies comprobados con contratos reales o NOT_RUN.

**Hoy y frescura (O09–O13)**: O09 sin proyección asistencia reconocida muestra indeterminado, no cero; O10 con proyección QA válida muestra conteos correctos; O11 sin cobertura no acusa ausencia; O12 selector sede no filtra datos de otra empresa; O13 GET no escribe hechos.

**Sedes/turnos (O14–O19)**: O14 lista sedes tenant A paginadas; O15 detalle sede ajena 403/404 real; O16 turnos propios visibles si fuente existe; O17 turnos históricos intactos al consultar; O18 turnos nocturnos muestran fecha correcta con timezone; O19 rutas de edición inexistentes o protegidas cuando contrato no aprobado.

**Informes/planes (O20–O24)**: O20 reporte sin datos verificados no fabrica horas; O21 CSV con celda `=1+1` no ejecutable en Excel; O22 CSV no incluye fila empresa B; O23 descarga no-store; O24 plan/cobro no se inventa o se bloquea.

**UI/continuidad (O25–O28)**: O25 móvil 360/tablet 768/desktop 1280 con navegación y estados, capturas de navegador **solo si realmente tomadas**; O26 foco/etiquetas/teclado sin HTML inseguro; O27 rutas/modelos verificados en código no matriz obsoleta; O28 WIP pre/post conservado y ZIP reproducible.

**Matriz de evidencia:** separar `PHPUNIT_FEATURE_WITH_MARIADB_QA`, `LARAVEL_VIEW_HOST_UNIT`, `STATIC_REVIEW`, `BROWSER_REAL`, `HTTP_REAL`, `NOT_RUN_ENV`. Un widget renderizado o mock no demuestra la DB. Si no existe MariaDB aislada, no iniciar ni editar entornos para fabricarla: ejecutar únicamente test viables sobre sintéticos/host y documentar lo pendiente. Jamás atribuir a QA independiente lo ejecutado por Codex. Si un oráculo no aplica por ausencia de contrato aprobado, dejar explícito `BLOCKED_CONTRACT`; no reducirlo silenciosamente.

## 9. ENTREGA Y AUTOCONTROL L1–L6 (SIN PINGPONG)

Hacer exactamente **10 pasadas internas** donde cada pasada examina L1–L6 y produce un hallazgo o descarta uno con evidencia; no generar PASS verde por llenar celdas. Estas son autocomprobaciones de Codex, **NO L5 independiente**. ChatGPT adjudica después. En cada pasada verificar autoridad, diseño, anti-duplicación, causalidad y costo real de QA.

Entregar en **un solo ZIP**, con estas rutas internas mínimas (no archivos externos sueltos):

- `FINAL_REPORT.md`: qué está hecho, qué funcional, qué mock/test-only y qué está bloqueado; salida exacta `B16_S1=PASS_FOCAL/PARTIAL/BLOCKED`, `WEB_LOGIN_REAL`, `PORTAL_HOY`, `PORTAL_SEDES`, `PORTAL_TURNOS`, `PORTAL_REPORTS`, `TENANT_SECURITY`, `L5_INDEPENDENT_RUNTIME`, `B13/B14/B15/RELEASE`; justificación y `NEXT_OWNER=CHATGPT`.
- `SOURCES/`: **todas** las fuentes agregadas y modificadas por el lote (sin secrets). `BASELINES/` capturas reales de inicio de archivos, incluso **UNTRACKED**; `PATCH_CANDIDATE.diff` que se pueda aplicar a baselines. Para nuevas rutas archivo marcador `ABSENT_PRE_B16` claro. `SOURCE_CHANGE_MATRIX.csv` SHA antes/después bytes+tracked/untracked+provenance.
- `TEST_MATRIX.csv` 28 oráculos, filtros y fuentes; `CONTRACT_MATRIX.md` rutas reales/middleware/guard/roles/tablas+referencias; `EVIDENCE/logs/` comandos stdout/stderr originales, exits, sin tokens; `EVIDENCE/ROUTE_INVENTORY.md`; hashes y manifest; `TEN_PASSES_L1_L6.md`; `NEXT_GATE.md` y reporte de incidente si aparece alguno.
- `MANIFEST_SHA256.txt` listar **todos** los miembros menos el propio manifiesto, hash y bytes; verificar CRC, duplicados, rutas, ZIP sha; no incluir bases, llaves, `.env`, cookies, tokens, credenciales, correo real ni PII.
- Estado git pre/post (`git status --porcelain=v1 -uall`), rama/HEAD, staged=0 y evidencia de preservación. **No crear un zip con solo diff, ni depender de ZIPs antiguos** para reproducir la entrega.
- Carpeta final **contiene exactamente un ZIP**. Al responder en chat a propietario: nombre, ruta Windows, tamaño y SHA, resumen técnico de alcance, fallos no resueltos, siguiente responsable; NO enlaces a informes externos para adjuntar. Herramientas/temporales dentro de D:.

## 10. CONDICIÓN DE CIERRE Y CONTINUIDAD

**PASS_FOCAL** solo si existe al menos un flujo real y seguro del portal con fuente tenant adecuada, pruebas ejecutadas atribuibles al SHA y estados honestos; UI únicamente con fixtures es `PARTIAL_HOST_UI`, nunca portal Pro comercial terminado. Si no hay guard aprobado o DB QA: cerrar el máximo trabajo seguro, **no** abrir otra fase de preflight, registrar gate y dar al director el ZIP. No promover pagos/plan/horas. **No merge/release.**

Después de esta entrega ChatGPT audita un ZIP y decide B16 siguiente cierre funcional (solo si necesario) o B17, sin reabrir B15-S5 por ritual. Mantener ruta B16 portal → B17 novedades → B18 cálculos informativos → B19 expedientes/documentos → B20 reclutamiento → B21 QA integral independiente/Android/TLS/B13/B14 → B22 lanzamiento con GO humano escrito.

**ORDEN FINAL A CODEX LUNA:** ejecutar ahora el macrobloque B16-S1 en D:, implementar máximo vertical seguro, probarlo con evidencia verdadera, preservar WIP, entregar un único ZIP, sin commit/push/merge/deploy. NO hacer auditoría adicional ni pedir otra instrucción si puede avanzar de manera segura.
