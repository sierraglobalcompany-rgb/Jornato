# CODEX LUNA — JORNATO H9-M1 · VERTICAL ANDROID OFFLINE → SINCRONIZACIÓN PRO Y BOOT NORMAL · MACROBLOQUE ÚNICO

**TAREA NUEVA:** `JOR-H9-M1-ANDROID-OFFLINE-SYNC-20261116`. **ESTA ES LA ÚNICA ORDEN SIGUIENTE**, ejecutable después de la entrega de B21F-S3 V2. **Responsable ahora: CODEX LUNA. Después del ZIP: CHATGPT DIRECTOR.** Trabaja únicamente en `D:\codex\Jornato`; evidencias sólo en `D:\codex\_REPORTES\Jornato\JOR-H9-M1-ANDROID-OFFLINE-SYNC-20261116`. **No hagas otra auditoría o plan para decidir si actuar: inspecciona el código vigente y ejecuta lo autorizado en un solo macrobloque.**

## 0. Resultado final buscado y límites de aceptación

**OBJETIVO:** convertir el próximo tramo real del desarrollo en una vertical verificable de la app: **registro de jornada y pausas con persistencia local offline en Android/kiosco**, cierre coherente tras reinicio y **sincronización Pro idempotente con el backend que ya existe**, sin inventar otro sistema. Se parte de la realidad del WIP local, no del prototipo antiguo de GitHub. Completar en el mismo lote los defectos realmente observados y pruebas focales pertinentes. Si una parte ya está implementada y validada en el árbol/entorno pertinente, **reutiliza evidencia y NO la rehagas**. Si la función no existe pero corresponde al contrato vigente, impleméntala con la solución mínima integrada a los módulos actuales; no te limites a enumerar pendientes.

**SEGUNDA OBLIGACIÓN DE BAJO COSTO:** comprobar que el **backend puede inicializar su configuración normal** y resolver las vistas que usa el producto **sin el overlay de QA S3**. No es otra ronda backend; un smoke de arranque/configuración y render con datos ficticios y **sin migraciones/destrucción**. Si detectas un defecto real de producto, corrige la causa mínima y prueba su impacto focalmente. **No presupongas que falta `config/view.php`: constata si se necesita en este árbol y cómo arranca realmente.**

**Cierre de esta orden:** `VERTICAL_ANDROID_OFFLINE=PASS_REAL_DEVICE|PASS_EMULATOR|PASS_WIDGET_ONLY|PARTIAL|BLOCKED`, `PRO_SYNC=PASS_REAL_HTTP_DB_QA|PASS_LOCAL_ONLY|BLOCKED_CONTRACT|NOT_RUN`, `BOOT_NORMAL=PASS|FAIL|BLOCKED`, `WIP_SAFE=PASS|FAIL`, `NEXT_OWNER=CHATGPT_DIRECTOR`. **No confundir PASS de esta vertical con aceptación H9 completa, B22, tiendas, firma ni lanzamiento.**

## 1. Hechos verificados: no perseguirse la cola

- ZIP S3 recibido por ChatGPT: `JOR-B21F-S3-FULLSUITE-20261116-UNICO.zip`, **SHA256** `DDE6B70681908DE341D46F4992D26CB04FF0275EA371DE928342E1D0ACF96280`, 19 entradas, CRC PASS, 18/18 manifiesto de SHA y tamaños PASS. Log PHPUnit final: `OK (158 tests, 2450 assertions)`, reporte `exit 0`. B18 1/3 y B13S3 1/80 PASS aislados. `B21F_S3_BACKEND_QA=PASS_SCOPED`, **no** PASS de producción.
- Esos tests usaron un **runner de QA externo** que añadió `view.paths` y `view.compiled`; **NO** se verificó configuración de vistas de servidor en arranque normal/producción. B13S3 histórico S2 (contador correo 0 vs 1) no se volvió a reproducir; **causa histórica desconocida**, no abrir investigación sin nuevo fallo.
- El ZIP informa **cero cambios de producto en S3**, índice sin stage, **235 entradas WIP**, rama local `codex/jor-b08-h4-domain-20261025`, HEAD `faf5fe283191f8b5a2724b397009512a2caec1b6`. Son datos del instante S3; **verifica estado actual antes de trabajar**. B17 fue corregido en un test untracked en S2 y su SHA S3 `448841295D81ECEB82E6394076F55B62A61A9A133AADD686ABF51D04E0DACBDA`; no tocar si no cambia el contrato.
- MariaDB 11.8.9 QA S3 y test 158/2450 **ya cumplieron**, contenedor QA propio `exited` tras S3 según logs; esquemas S2/S3 **se conservaron**. **NO repetir suite backend, IPAM, migraciones desde cero, nuevas redes, auditorías B13–B21 o carreras antiguas**. Cualquier uso nuevo de DB debe ser exclusivo, sintético, aislado, autorizado por preflight y en su propio esquema temporal; nunca usar/eliminar esquemas S2/S3 retenidos.
- GitHub al último cotejo: `main=1ee6aae821f8cf177cc64149081ad8847f7fec2e`; PR #1 código prototipo draft `faf5fe283191f8b5a2724b397009512a2caec1b6`; PR #2 **documentación**. GitHub **NO contiene el WIP móvil/backend avanzado**. No hacer pull/reset para «sincronizar» con main. Reconciliar si el Git remoto avanzó pero no integrar por reflejo.
- Producto vigente: **Android primero**, piloto Colombia, eventos **entrada, inicio de pausa, fin de pausa, salida**; secuencias inválidas y duplicaciones prohibidas; trabajo calculado por intervalos reales; turnos nocturnos asociados a la entrada; pausa prevista sin evento artificial; gratis local sin nube y sin publicidad bloqueante; Pro sincroniza con los contratos existentes. Kiosco borra identidad temporal tras comprobante. No convertir BDM-Menor ni 196 pruebas históricas en QA de Jornato.

## 2. Leyes, contratos y prohibiciones

Aplica el canon PingPongLaw `sierraglobalcompany-rgb/PingPongLaw@84e961cadf482d234f4c0ee2ca60e8c7e9b388e8`: **L1 KISS/Ponytail, L2 antirruido, L3 causa raíz, L4 diseño humano, L5 evidencia atribuible, L6 anti-ping-pong**. Lee `AGENTS.md` local y contratos/ADR efectivos antes de editar. Si difieren de documentos remotos, preserva decisiones locales aprobadas y registra conflicto sin borrarlas.

**PROHIBIDO:** `git add/commit/push/pull/merge/rebase/reset/clean/stash/checkout` de otra rama, alterar índice, `force`, sobrescribir untracked, cambiar política de ejecución PowerShell, instalar hooks o 9 skills por reflejo; nuevo backend, nueva autenticación, nuevo esquema de roles, pagos/ATS público, publicación, Hostinger, dispositivos reales con datos personales, permisos nuevos, facturación, firmas, cambios legales, despliegue, CI pagado, imágenes Docker adicionales, redes y contenedores ajenos, `docker prune`, `down -v`, `migrate:fresh` en DB conservada/ajena. No reabrir el `DENY-ALL` de B19/B20.

**Decisiones aún humanas NO APROBADAS:** OD01 privacidad/retención; OD02 asociación/revocación empleado↔cuenta; OD03 matriz RR. HH.; OD04 acceso y recuperación web; OD05 ATS/CV/antimalware; OD06 firma/entrega documental; OD07 homologación salarial; OD08 planes/cobros/facturación. No inventar respuestas para conseguir flujos positivos. No usar datos/credenciales de producción. Se permite QA sintética por los contratos técnicos YA existentes; no confundir pruebas con autorización comercial.

## 3. EJECUCIÓN ÚNICA DE PRINCIPIO A FIN — NO VOLVER AL DIRECTOR ENTRE PASOS

### P0. Preflight breve, custodia e identificación exacta

1. En D: confirma ruta, rama, HEAD, `git status --porcelain=v1 -uall`, contenido del índice (`git diff --cached --name-only` o equivalente no mutador), huella de `git status` y archivos potencialmente afectados. **No exigir exactamente 235 ni staged=0 si hubo progreso nuevo**: conservar lo que encuentres, y parar únicamente ante conflicto real en archivo objetivo. Captura hashes PRE para archivos que editarás, incluida la prueba B17 y los contratos clave. No recontar todo WIP de 237 rutas sin necesidad; realiza inventario focal y checksum de estado suficiente.
2. Identifica `flutter/`, `android/`, `lib/`, paquetes Dart, tests Flutter, motor de marcas, persistencia SQLCipher, outbox, controladores/métodos API existentes y las rutas de prueba Android ya aprobadas. **Descubrir rutas, no inventarlas**; si hay varias apps, usa sólo el módulo Jornato previsto. Verifica herramientas disponibles (`flutter --version`, `flutter doctor -v`, `adb devices -l`, `php --version`) con comandos de consulta que NO cambien instalaciones ni emuladores ajenos. Reutiliza emulator/AVD únicamente si el entorno local permite una instancia propia sin invadir otra tarea.
3. Evita colisión con otros agentes; compara timestamps y locks de archivos objetivo. Si existe ejecución concurrente del **mismo lote**, no la dupliques. Si otros proyectos usan Docker, déjalos intactos. Explicita la razón técnica de los módulos elegidos y no produzcas un plan maestro alterno.

### P1. Smoke mínimo del backend en bootstrap NORMAL (sin overlay S3)

4. Con entorno **local de pruebas sintético, sin conexión a producción ni DB externa**, inspecciona `server/bootstrap/app.php`, config de vistas actual, service providers, plantillas existentes y rutas reales de render. Verifica que el arranque y **un render Blade permitido por el producto** pueden funcionar con configuración normal (o por defecto del framework) y directorio de compilación apropiado, sin inyectar el overlay S3. **NO iniciar migraciones ni conectar Docker** para un simple smoke de vistas. No simules un PASS únicamente creando un directorio vacío; verifica el proceso que realmente resolverá configuración de vistas.
5. Si hay fallo demostrado por configuración ausente, corrige dentro del patrón estándar **mínimo ya usado por Laravel** y prueba un render focal; conserva ubicación/contratos sin nueva capa. Si el backend no usa vistas en el flujo real, anota límite y no crees archivos de configuración decorativos. No introducir credenciales. Si editas configuración backend, ejecuta pruebas de impacto directo de ese cambio; **solo** plantea la suite completa una vez si el cambio material y su contrato la requieren, con DB QA totalmente confinada y sin tocar S2/S3. `BOOT_NORMAL` es independiente de `BACKEND_QA_S3=PASS`.

### P2. Cerrar una jornada local OFFLINE de extremo a extremo (primero funcionalidad real)

6. Reutiliza motor de eventos/persistencia existentes. Implementa o corrige **sólo lo que falte** para que un actor sintético autorizado pueda hacer: **entrada → pausa → continuación → salida**, incluyendo recálculo de intervalos, cierre, lectura del histórico al reiniciar proceso/app y protección contra doble tap/reintento. No sustituir persistencia con una lista en memoria y declararla offline real.
7. **No sacrificar cifrado/aislamiento:** si ya hay SQLCipher/Keystore, verificar escritura/lectura, reinicio y aislamiento por espacio/empresa/actor; si faltan piezas esenciales de cifrado, implementar la vía existente y compatible con licencias gratuitas, sin almacenar datos personales reales en claro ni meter un paquete nuevo sólo por estética. Si cifrado real no puede probarse por limitación de SDK/dispositivo, marcar `STORAGE_ENCRYPTION=NOT_VERIFIED` y `VERTICAL_ANDROID_OFFLINE≠PASS_REAL_DEVICE`.
8. Respetar reglas de negocio existentes: turnos nocturnos, pausas reales, timezone y reloj; no «normalizar» discrepancias históricas para obtener PASS. Una pausa prevista no crea una marca. Si GPS está activo según política, exigir lectura y restricciones de precisión/edad/radio existentes; si no está activo, NO pedir GPS. Selfie, NFC, QR o reconocimiento 1:1 no se inventan como dependencias nuevas. **En kiosco borrar identificación temporal después de comprobante y antes del siguiente usuario**.
9. La UI debe mostrar claramente estado actual, hora registrada, offline/pendiente/sincronizado, error recuperable y navegación accesible. No rediseño masivo ni botones ficticios. No añadir publicidad obstructiva. Pruebas widget focales para los estados realmente tocados.

### P3. Sincronización PRO con backend existente, sin romper GRATIS LOCAL

10. Verifica primero las rutas/tipos/campos reales Flutter ↔ Laravel y el contrato aprobado de outbox, **`requestId` exacto**, idempotencia, receipts y cursor; contrasta el fallo histórico escrito como `requetId` y **no lo reetiquetes como PASS ni aceptes silent fallback**. **Gratis local nunca requiere nube**. Pro sólo sincroniza cuando ya hay autorización sintética válida por contrato técnico; no crear login comercial OD02/OD04, no abrir R.R. H.H. por fixtures.
11. Con los módulos ya existentes, ejecutar la cadena verificable con datos sintéticos: varios eventos locales offline → outbox duradero → reconexión → API/DB QA aislada cuando sea seguro → receipt/evento idempotente → readback autorizado del mismo actor/empresa; reenviar el mismo evento no debe duplicar jornada/receipt. Verificar rechazo cross-tenant y actor diferente **reutilizando gates backend S2/S3 si el contrato servidor no cambió**, sin repetir su suite global. Registrar bytes/crudos sanitizados del `requestId`, `idempotency_key` o su equivalente real; no fijar nombres que no existan sin mapeo documentado.
12. Si la identidad empleado↔cuenta o un endpoint realmente requiere OD02/OD04 no aprobado, marcar `BLOCKED_CONTRACT` **solo en ese tramo**; continuar completando el offline local y las pruebas de transporte que no abran permisos. No crear segundo servicio de sync/otra tabla/cola/canal por ansiedad. Si no hay acceso seguro a MariaDB QA o Docker está ocupado, hacer pruebas Flutter/host y evidencia de integración limitada `PASS_LOCAL_ONLY`, no inventar `PASS_REAL_HTTP_DB_QA`.

### P4. Pruebas y aceptación proporcionadas — no suites históricas rituales

13. Ejecuta una vez por delta real: `flutter analyze` del alcance tocado (o equivalente), tests unit/widget específicos de jornada/persistencia/restart/outbox, e integración con emulador/teléfono sintético **si está disponible y permitido**. Si el SDK falta, no afirmes QA de dispositivo ni instales automáticamente toolchains gigantes; documenta bloqueo, pero entrega código/progreso verificable donde haya herramientas. Compilar APK **debug local** cuando el entorno lo permita, verificar nombre, hash, `minSdk` aprobado (>=24) y arranque; no firma release ni publicación. Un log de Flutter tests host no sustituye teléfono.
14. Matriz por puerta: (a) secuencias válidas/invalidas; (b) idempotencia de doble toque; (c) datos tras reinicio; (d) aislamiento y cifrado local; (e) reconexión/pro sync y raw `requestId`; (f) 401/403/404 legítimos sin permisos nuevos; (g) kiosco limpia actor; (h) UI y accesibilidad focal; (i) backend bootstrap normal. Para cada una registra `PASS_REAL_DEVICE`, `PASS_EMULATOR`, `PASS_HOST`, `PASS_HTTP_DB`, `PARTIAL`, `NOT_RUN`, `BLOCKED_CONTRACT` y SHA/build. **No hacer 110 escenarios de H9 sin producto/build/contrato aprobado**; no repetir 158 tests del backend ni 24 focales solo por costumbre.
15. Si un test falla, identifica causa raíz, corrige mínima función y su test/caller; repetir focal y vecinos afectados UNA vez tras cambio. No parche de estado, `skip`, xfail ni modificar el esperado para esconder un fallo. Una corrección en backend que toque auth/tenant exige regresión focal apropiada, no permiso nuevo ni reinicio total de QA.

### P5. Cierre documental útil, un ZIP y devolver control

16. Captura PRE/POST de `git status`, índice y hashes de **archivos tocados**; no redactes WIP ajeno. Construye un **ZIP único** `JOR-H9-M1-ANDROID-OFFLINE-SYNC-20261116-UNICO.zip` con: `FINAL_REPORT.md` en 1–2 páginas; `RESULTS.csv` (caso/contrato/PASS-LIMITADO/NOT_RUN/sha); `CHANGES.patch` o archivos exactos tocados **solo si hubo cambios** (incluye rutas untracked necesarias y instrucciones de aplicación no destructiva); `WIP_PRE_POST.csv`; logs/salida de comandos y pruebas; metadata de APK debug y SHA si existe; 1–3 capturas sanitizadas del flujo real si están permitidas; `BLOCKERS.md` sólo si hay bloqueos materiales; `MANIFEST_SHA256.csv` de cada miembro restante con bytes+SHA; `ZIP_SHA256.txt` fuera del ZIP sólo si hace falta informar checksum. Validar CRC, hashes, cantidad y rutas; **no ZIPs paralelos** ni reporte disperso.
17. No poner en ZIP: secretos, tokens reales, `.env`, datos de DB, claves SQLCipher, firmas, cookies, clientes reales, fotos personales, CV ni contenido de otros proyectos. Solo datos ficticios y logs sanitizados. Si el ZIP contiene un archivo de producto para actualizar, conservar su contexto WIP y limitarlo al diff de causa raíz; no enviar todo el repositorio.
18. Terminal de salida **sin consulta adicional al director**:

```text
TASK=JOR-H9-M1-ANDROID-OFFLINE-SYNC-20261116
RESULT=PASS_SCOPED|PARTIAL|BLOCKED
BOOT_NORMAL=PASS|FAIL|BLOCKED
ANDROID_OFFLINE=PASS_REAL_DEVICE|PASS_EMULATOR|PASS_WIDGET_ONLY|PARTIAL|BLOCKED
SQLCIPHER_PERSISTENCE=PASS|PARTIAL|NOT_VERIFIED|BLOCKED
PRO_SYNC=PASS_REAL_HTTP_DB_QA|PASS_LOCAL_ONLY|BLOCKED_CONTRACT|NOT_RUN
WIP_PRESERVED=YES|NO
FILES_CHANGED=<cantidad y rutas, o NONE>
BACKEND_S3_PASS_REUSED=YES
H9_GLOBAL=NO_GO
RELEASE=NO
ZIP_PATH=<ruta real del único ZIP>
ZIP_SHA256=<hash real comprobado>
NEXT_OWNER=CHATGPT_DIRECTOR
```

**STOP SOLO POR RIESGO REAL:** si falta autorización/SDK/dispositivo/contrato de una subparte, terminar lo independiente y marcar la subparte bloqueada, sin fabricar PASS ni lanzar segundo agente. **No cambiar de producto ni abrir nuevas fases. La meta es avanzar la aplicación Android, no seguir escribiendo auditorías.**

# 🚨 QUIÉN SIGUE: CODEX LUNA — MACROBLOQUE H9-M1. DESPUÉS DEL ZIP: CHATGPT DIRECTOR. 🚨
