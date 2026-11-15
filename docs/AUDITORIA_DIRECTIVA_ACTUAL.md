# JORNATO — B21-DB-DOCKER-QA S1 V1→V2 | Auditoría adversarial de 10 VERDUGO + 10 JUEZ (120 juicios L1–L6)

**Fecha:** 2026-11-15 (America/Bogota). **Naturaleza:** revisión independiente DOCUMENTAL del prompt antes de ejecutarlo; NO hubo acceso al Docker Desktop del propietario, a MariaDB, a D: ni ejecución de SQL, PHPUnit, Flutter o Android durante esta auditoría. **Autoridad:** ChatGPT director; Codex Luna ejecutor; propietario autorizó expresamente *usar Docker ya instalado sin interferir con otros proyectos*. NO autorizó cambiar daemon/WSL/servicios ajenos, habilitar RR. HH. o lanzar.

## 0. Evidencia, no repetición, alcance

- Orden EXACTA V1: `CODEX_LUNA_JORNATO_B21_DB_DOCKER_QA_S1_V1_MACROBLOQUE_INTEGRACION_AISLADA_ZIP_UNICO_20261115.md` (SHA-256 `ba7c30d733f6b23752b8a9d442ed3810f7338dd5009d0b473e270653740f2029`). Se leyó íntegra (183 líneas), y se contrastó con GitHub `docs/CODEX_LOTE_ACTUAL.md` blob `02d7c3a32da61d4ebbc5ba91022ea2eb1e9b026b`, rama `docs/pingponglaw-l1-l6-canon-84e961c`, PR #2 Draft.
- Canon leído en GitHub: `sierraglobalcompany-rgb/PingPongLaw`, commit `84e961cadf482d234f4c0ee2ca60e8c7e9b388e8`, seis leyes L1 KISS/Ponytail, L2 antirruido, L3 antiparches, L4 UX, L5 QA independiente, L6 antipingpong.
- Último ZIP B21-S1 V2 YA AUDITADO: SHA-256 `68CBA9DBBF91D0CE93B1618F15239A928EAA2AC8D66A6AD7F5EF83573C26F98B`, 28 miembros, 27/27 manifiesto, 24 oráculos **catalogados**, cero DB real/cambios de código. No reanalizarlo. NO hay resultado nuevo B21 Docker QA; el usuario pidió auditar exclusivamente el PROMPT.
- Externamente se comprobó documentación oficial: Docker Engine advierte que **versiones anteriores a 28.0.0** podían exponer puertos ligados a localhost desde la LAN (https://docs.docker.com/engine/network/port-publishing/); Docker Hub lista la etiqueta oficial `mariadb:11.8.9` (https://hub.docker.com/_/mariadb/tags/?name=11.8.9); Compose soporta secretos por archivo y puertos con host_ip (https://docs.docker.com/compose/how-tos/use-secrets/ y https://docs.docker.com/reference/compose-file/services/). **La disponibilidad pública NO acredita configuración local real ni ausencia de interferencia.**
- Se conservan **12/12 filas DO01–DO12 literalmente idénticas** entre V1 y V2. No inflar matrices ni renumerar. No se hacen 120 tests: a continuación hay **120 juicios documentales** específicos sobre las instrucciones.

## 1. Decisión de dirección

**V1 tiene un diseño base correcto**: un Compose, solo `db`, etiqueta MariaDB oficial, ruta D, red propia, secrets, no `prune`, WIP protegido, un ZIP. No se cambia esa arquitectura. **V1 no estaba blindada contra Engine <28 y no obligaba a que las tres carreras probaran los servicios de aplicación**; también dejaba al criterio de Codex los márgenes de recursos y la revisión del YAML normalizado. Estas brechas justifican V2 FOCAL antes del primer Docker QA, no otra secuencia de auditorías de Jornato. **Resultado:** B21-DB-DOCKER-QA S1 V2 como ÚNICA orden vigente, V1 histórica NO ejecutada.

**Juicio de corrección adversarial:** si bloquea el gate Engine o capacidad, eso es preferible a exponer MariaDB a la LAN o presionar Docker de los otros proyectos. Si las pruebas ejecutan solo SQL, acreditan `DB_CONSTRAINT_ONLY`, NO `B17/B19/B20_CONCURRENCY_REAL_SERVICE`. Mantener `B21_GLOBAL=NOT_APPROVED`, `L5_INDEPENDENT_RUNTIME=NOT_RUN`, `RELEASE_APPROVED=NO`.

## 2. Diez pasadas como VERDUGO — primero detectar el defecto

### V01 — Autoridad, custodia y antipingpong

**Qué revisé:** Leí encabezado y Fase 0/1 de V1, último B21 PARTIAL y checkpoint GH.

**Ataque adversarial:** Codex puede reejecutar B21-S1 V2 o alterar WIP confundiendo nuevo DB QA con reimplementación previa.

**Contraste/defensa:** No hay ZIP ejecutado de B21-DB-Docker V1; el alcance está permitido por el usuario y es distinto del B21-S1 ya entregado.

**Fallo sustentado:** Conservar nuevo lote Docker; registrar V1 sustituida y prohibir reabrir B13–B21; sin cambios en WIP salvo falla reproducida.

- **L1:** Un solo Compose nuevo, ninguna capa paralela.
- **L2:** No copiar fuentes anteriores ni relanzar suites host ya aceptadas.
- **L3:** Solo corregir el fallo SQL/producto que se demuestre en QA.
- **L4:** UX no cambia en este laboratorio.
- **L5:** Separar existencia del prompt de ejecución acreditada.
- **L6:** Codex ejecuta; director adjudica luego del ZIP.

### V02 — Exposición de red en versiones anteriores del motor

**Qué revisé:** Contrasté puertos V1 y advertencia oficial Docker Engine 28.0.0.

**Ataque adversarial:** `127.0.0.1` en Engine anterior a 28 podría ser accesible desde la LAN: V1 no verificaba versión.

**Contraste/defensa:** Docker Desktop instalado no informa versión de Engine ni que usa modo Linux.

**Fallo sustentado:** Agregar Engine >=28.0.0, OSType=linux, bind efectivo loopback, abortar sin cambiar daemon/firewall.

- **L1:** Una comprobación de versión evita infraestructura de aislamiento artificial.
- **L2:** No inspeccionar configuraciones de otros proyectos.
- **L3:** Corregir el gate de exposición, no implantar proxy o firewall.
- **L4:** Acceso QA sin UI ni puerto remoto.
- **L5:** La seguridad de la red requiere observación del Engine real.
- **L6:** Sin versión comprobable: BLOCKED, no investigar diez caminos alternativos.

### V03 — Capacidad y daños colaterales por presión

**Qué revisé:** Revisé preflight RAM, disco D, root de imágenes y límites de contenedor.

**Ataque adversarial:** “margen razonable” obligaba a Codex a juzgar sin umbrales; pull y DB podrían consumir C:/RAM compartidos.

**Contraste/defensa:** Limitar el contenedor a 768 MiB no limita image pull, WSL ni cache global.

**Fallo sustentado:** Fijar umbrales previos medibles, sin cambios globales; obtener docker stats solo lectura de servicios activos.

- **L1:** Un límite claro de recursos para un solo contenedor.
- **L2:** Ningún prune ni telemetría invasiva.
- **L3:** Causa raíz del riesgo: compartición física del Engine.
- **L4:** Otros servicios deben permanecer usables.
- **L5:** Medir antes/durante/después, no declarar “cero interferencia” por definición.
- **L6:** Abortar si faltan datos fiables, sin probar cambios de configuración.

### V04 — Proyecto Compose y YAML normalizado

**Qué revisé:** Comprobé `-p`, `-f`, un servicio, límites, secrets, red y puerto efímero.

**Ataque adversarial:** `config --quiet` puede validar sintaxis sin demostrar lo que realmente se normaliza o monta.

**Contraste/defensa:** V1 ya usa un proyecto exclusivo y `pull_policy: never`, que son decisiones correctas.

**Fallo sustentado:** Mantener la arquitectura y exigir comparación del modelo normalizado antes de `up`.

- **L1:** Se conserva un solo YAML y servicio.
- **L2:** No introducir otro orquestador.
- **L3:** Verificar la configuración efectiva es la solución de causa raíz.
- **L4:** No hay interfaz nueva.
- **L5:** Compare host_ip, montaje, secrets, imagen y recursos reales.
- **L6:** No permitir “quitar” una opción de seguridad para hacer pasar YAML.

### V05 — Secretos y Windows/Linux

**Qué revisé:** Inspeccioné `MARIADB_*_FILE`, archivos secretos y política de evidencia.

**Ataque adversarial:** Bytes aleatorios crudos pueden incluir saltos de línea y ciertos métodos PowerShell pueden imprimir el secreto.

**Contraste/defensa:** La documentación de Docker/MariaDB sí respalda secretos montados en `/run/secrets` en Linux.

**Fallo sustentado:** Exigir texto ASCII criptográfico sin saltos, ACL del usuario, cero argv/log/ZIP; Linux container mode.

- **L1:** Los secrets nativos de Compose bastan.
- **L2:** No agregar vault ni credenciales en repositorio.
- **L3:** Protección en generación, no regex de redacción posterior.
- **L4:** Sin credenciales visibles en UI ni capturas.
- **L5:** Prueba de permisos/redacción distinta de autenticación DB.
- **L6:** Un camino de generación, no alternativas a prueba y error.

### V06 — Origen de imagen y etiqueta

**Qué revisé:** Contrasté MariaDB oficial Docker Hub y el tag 11.8.9.

**Ataque adversarial:** Una etiqueta inexistente bloquearía todo o permitiría que Codex use latest/imagen ajena.

**Contraste/defensa:** La etiqueta 11.8.9 existe; el mayor riesgo no es su ausencia sino cambiar de origen sin necesidad.

**Fallo sustentado:** Conservar imagen oficial exacta, como máximo un pull, digest anotado, sin tocar imágenes ajenas.

- **L1:** Una sola imagen versionada.
- **L2:** No reutilizar etiquetas de otra app ni purgar caché.
- **L3:** Un digest real elimina ambigüedad de procedencia.
- **L4:** QA de DB sin cambios en interfaces.
- **L5:** Tag presente en Docker Hub no prueba que se haya descargado.
- **L6:** No abrir V3 por especulación sobre versión.

### V07 — Data-dir, detención y propiedad

**Qué revisé:** Revisé bind D:/data, labels y stop db.

**Ataque adversarial:** Compose podría montar accidentalmente otro directorio por resolución relativa de rutas y escribir en datos ajenos.

**Contraste/defensa:** V1 ya prohíbe mounts externos, `down -v` y WSL/global restart.

**Fallo sustentado:** Exigir config normalizado+inspect SOLO contenedor propio y conservar data; parada limitada a db.

- **L1:** Bind D explícito; sin volumen extra.
- **L2:** Nada de borrar ni mover datos de otras apps.
- **L3:** La verificación del path real ataca el riesgo, no el nombre del proyecto.
- **L4:** Datos de laboratorio ficticios.
- **L5:** El estado del archivo no prueba la ruta montada: inspect propio sí.
- **L6:** Si no monta D, bloquear sin cambiar Docker Desktop.

### V08 — PHPUnit fail-closed y caché Laravel

**Qué revisé:** Revisé sección C1 del prompt y estado `DB_PORT=1` de B21.

**Ataque adversarial:** PHPUnit XML/caché Laravel puede ignorar overrides y migrar otra base, aunque Compose esté healthy.

**Contraste/defensa:** Un archivo XML temporal fuera del repo es válido solo si se demuestra config efectiva.

**Fallo sustentado:** Exigir SQL desde el mismo runner, `config:cached` comprobado, usuario QA, puerto/BD verificables; cero cambios a config productiva.

- **L1:** Un único runner temporal local y un schema.
- **L2:** No modificar phpunit.xml ni caches ajenas.
- **L3:** Resolver la conexión efectiva antes de tocar DDL.
- **L4:** Sin rutas comerciales para tests.
- **L5:** Conexión real del mismo proceso como evidencia, no solo env impreso.
- **L6:** No ejecutar migraciones para “ver si funciona”.

### V09 — Falso PASS de concurrencia SQL

**Qué revisé:** Leí C3: CONNECTION_ID, barrera, B17/B19/B20.

**Ataque adversarial:** Dos sesiones SQL pueden validar UNIQUE/FK sin ejecutar el servicio ni su manejo de errores/idempotencia.

**Contraste/defensa:** La V1 ya distinguía transacciones secuenciales, pero no obligaba a pasar por métodos productivos.

**Fallo sustentado:** V2 requiere dos workers PHP de cada servicio, start barrier y SQL final; SQL-only se etiqueta DB_CONSTRAINT_ONLY.

- **L1:** Reusar los servicios ya creados, no copiar reglas de dominio en SQL.
- **L2:** Un solo harness reusable por tres carreras.
- **L3:** Probar servicio completo y no solo su capa inferior.
- **L4:** Estado de negocio observable sin app web comercial.
- **L5:** Evidencia de workers, IDs y barrera; no inferir por timestamps aislados.
- **L6:** Tres pruebas nuevas focales, no toda la matriz H9.

### V10 — Cierre, derechos y rastreabilidad

**Qué revisé:** Revisé DO01–DO12, ZIP y clasificación H9.

**Ataque adversarial:** Un ZIP íntegro con checks PASS_STATIC podría volver a presentarse como progreso de producto.

**Contraste/defensa:** La V1 ya deja B21_GLOBAL y RELEASE como NOT_APPROVED; conservar ese límite.

**Fallo sustentado:** Preservar 12/12 DO textualmente, exigir evidencia de cada PASS, L5 runtime pendiente y un solo ZIP.

- **L1:** 12 oráculos originales, no 120 pruebas inventadas.
- **L2:** No duplicar reportes ni empaquetar datadir.
- **L3:** Atribuir cada fallo a su causa verificable.
- **L4:** No autorizar funciones HR/ATS públicas.
- **L5:** Mismo árbol+logs+comandos por prueba; director independiente después.
- **L6:** Sin nueva revisión B21 S1 ni pingpong.


## 3. Diez pasadas como JUEZ — contrastar la corrección y descartar complejidad

### J01 — ¿Es correcta una V2 frente a ejecutar V1?

**Qué revisé:** Contrapuse los fallos de seguridad/validez de V1 con el costo de cambiar instrucciones.

**Ataque adversarial:** Conservar V1 ahorra una revisión documental pero arriesga exposición en Engine antiguo y falsas pruebas.

**Contraste/defensa:** No es un fallo demostrado del producto y no requiere reabrir módulos.

**Fallo sustentado:** Admitir V2 focal de esta orden solamente; no cambiar las 12 pruebas DO ni crear B21 S2.

- **L1:** Cambiar criterios operativos, no arquitectura.
- **L2:** V1 queda histórica, no borrada.
- **L3:** Corregir antes de ejecutar es más barato que mitigar DB expuesta.
- **L4:** Sin rediseño visual.
- **L5:** No confundir auditoría pre-ejecución con validación Docker real.
- **L6:** Orden V2 única, Codex continúa.

### J02 — ¿Dejar Engine antiguo con loopback?

**Qué revisé:** Evalué tolerar Engine<28 por comodidad versus warning oficial de LAN.

**Ataque adversarial:** Rechazar la verificación de versión puede dejar servicio alcanzable desde otro equipo.

**Contraste/defensa:** Hacer upgrade de Docker sería peor: alteraría otros proyectos y está prohibido.

**Fallo sustentado:** Bloquear en Engine<28 y pedir decisión separada después, no intentar firewall/upgrade.

- **L1:** Un gate de versión sustituye capas de red extra.
- **L2:** No tocar daemon ni contenedores terceros.
- **L3:** Atajar exposición antes del arranque.
- **L4:** Protección del usuario y colaboradores de la LAN.
- **L5:** Version observable; no inferir seguridad por 127 en YAML.
- **L6:** Si bloquea, reportar una vez, no iterar sin autorización.

### J03 — ¿Son excesivos umbrales de disco y RAM?

**Qué revisé:** Contrasté límites 768MiB y pull image con recursos compartidos.

**Ataque adversarial:** Fijar números puede bloquear máquinas con menos espacio aun si DB pequeña cabría.

**Contraste/defensa:** Aquí la no interferencia de proyectos es condición superior al rendimiento de Jornato.

**Fallo sustentado:** Mantener márgenes conservadores, documentando valor real y causa; no ajustar Docker global.

- **L1:** Un criterio sencillo por recurso.
- **L2:** No correr utilidades de limpieza como atajo.
- **L3:** Prevenir saturación es preferible a reparar daños.
- **L4:** Mantener otras aplicaciones responsivas.
- **L5:** Un PASS requiere lectura real de métricas.
- **L6:** Un bloqueo honesto evita 10 intentos de recursos.

### J04 — ¿Mantener puerto aleatorio o fijar 3306?

**Qué revisé:** Contrasté Compose ports y colisiones con servicios existentes.

**Ataque adversarial:** Puerto fijo 3306 podría coincidir con otro proyecto; el host_ip corto mal escrito podría abrir 0.0.0.0.

**Contraste/defensa:** Compose permite host_ip y publica puerto efímero si se valida; versión real manda.

**Fallo sustentado:** Mantener random-loopback y comprobar `docker port`+inspect propio; fallback explícito sin wildcard.

- **L1:** Sin proxy ni reglas de firewall.
- **L2:** No tocar puertos existentes.
- **L3:** Verificar binding efectivo y asignación.
- **L4:** Solo acceso local del desarrollador.
- **L5:** PASS requiere 127.0.0.1 en runtime.
- **L6:** No probar puertos al azar repetidamente.

### J05 — ¿Secret manager externo?

**Qué revisé:** Comparé Docker secrets por archivo con vault remoto/credenciales env.

**Ataque adversarial:** Un vault obliga a red/cuentas y complica QA; variables CLI dejan trazas.

**Contraste/defensa:** Compose file secrets en Linux permiten archivos nuevos en D y no exigen terceros.

**Fallo sustentado:** Conservar secretos nativos temporales y ACL, excluidos del ZIP.

- **L1:** Solo dos secrets, sin servicios nuevos.
- **L2:** Sin duplicar contraseñas en archivos de test.
- **L3:** Generarlas bien desde origen.
- **L4:** Ninguna credencial visible.
- **L5:** ACL + logs sanitizados observables.
- **L6:** No investigar proveedores comerciales.

### J06 — ¿Reutilizar imagen MariaDB de otros proyectos?

**Qué revisé:** Contrapuse tag oficial con usar contenedor/imagen ajena para evitar pull.

**Ataque adversarial:** Reusar otro contenedor viola separación de datos y puede bloquear producción.

**Contraste/defensa:** La descarga oficial nueva tiene coste de disco medido y controlable si hay margen.

**Fallo sustentado:** Prohibir reutilizar contenedor ajeno; un pull del oficial solo si falta la imagen correcta.

- **L1:** Un solo MariaDB de Jornato.
- **L2:** No mutar tags/volúmenes ajenos.
- **L3:** Causa raíz: aislamiento de propiedad.
- **L4:** Sin impacto funcional sobre otras apps.
- **L5:** Digest identifica la versión usada.
- **L6:** Evitar búsqueda interminable de imágenes alternativas.

### J07 — ¿Borrar el laboratorio al finalizar?

**Qué revisé:** Comparé down -v, prune, stop db y data persistente.

**Ataque adversarial:** Borrar volúmenes arriesga confusión y obliga a repetir migraciones.

**Contraste/defensa:** Conservar un contenedor activo también consume recursos y puede alterar los demás.

**Fallo sustentado:** Detener solo db; preservar data D y reportar ID/estado; sin borrar terceros.

- **L1:** Stop simple del servicio único.
- **L2:** Nada de limpieza global.
- **L3:** Evita repetir preparación y riesgo de colisión.
- **L4:** No hay exposición después de parar.
- **L5:** Verificar contenedor stopped, no asumir.
- **L6:** Facilita siguiente QA sin nueva orden infra.

### J08 — ¿Modificar `.env` o phpunit.xml para poder migrar?

**Qué revisé:** Examiné fallback de runner temporal y config Laravel.

**Ataque adversarial:** Editar WIP para un test puede contaminar estado y despliegue.

**Contraste/defensa:** Una config temporal fuera de repo con vars de proceso es suficiente si se acredita conexión efectiva.

**Fallo sustentado:** Exigir prueba desde runner exacto, sin config:clear/cache sobre WIP; bloquear si no se consigue.

- **L1:** Un runner QA reutilizado.
- **L2:** No crear envs sueltos en el proyecto.
- **L3:** Arreglar fuente de conexión, no silenciar puerto fail-closed.
- **L4:** No afectar login/servicio web.
- **L5:** Identidad de DB y usuario antes de DDL.
- **L6:** No pedir otra ronda para descubrir env alternativo.

### J09 — ¿Permitir test SQL-only como PASS de aplicación?

**Qué revisé:** Contrapuse dos conexiones reales con protección de idempotencia del servicio.

**Ataque adversarial:** SQL UNIQUE prueba el índice, pero no eventos de negocio ni respuesta idempotente.

**Contraste/defensa:** Si los servicios solo pueden simularse por contrato, hay valor parcial que debe etiquetarse.

**Fallo sustentado:** Separar DB_CONSTRAINT_ONLY, DB_REAL_SERVICE y BLOCKED_CONTRACT; dos workers para PASS de aplicación.

- **L1:** Usar los métodos B17/B19/B20 existentes.
- **L2:** Un mismo arnés de concurrencia.
- **L3:** Observar transacción + evento + respuesta.
- **L4:** QA interno sin rutas públicas.
- **L5:** PASS_REAL requiere barrera y servicio, no solo DB.
- **L6:** Foco en tres carreras; nada de repetir 110 casos.

### J10 — ¿Cerrar H9/B21 global y lanzar B22 al terminar?

**Qué revisé:** Contrasté DO12 y el plan original H9 de SPEC V5.

**Ataque adversarial:** MariaDB con carreras correctas no prueba Android, UX, accesibilidad, privacidad ni legal.

**Contraste/defensa:** El usuario quiere terminar pronto, pero un GO falso provocaría retrabajo de producción.

**Fallo sustentado:** Aceptar solo B21-DB-QA scoped; dejar H9 global/B22 no aprobados; ZIP único y siguiente director.

- **L1:** Cerrar integración DB sin crecer arquitectura.
- **L2:** No duplicar matrices históricas.
- **L3:** Registrar blockers residuales con dueño concreto.
- **L4:** Accesibilidad/UX pendientes de H9.
- **L5:** L5 independiente nunca autodeclarada por Codex.
- **L6:** Al recibir ZIP, director decide siguiente paso sin reauditar pasado.

## 4. Matriz V1→V2: solo diferencias materiales

| Riesgo V1 | Decisión V2 | Por qué NO es otro parche ni una auditoría previa |
|---|---|---|
| Engine/localhost no validado por versión | `Engine >= 28.0.0`, OSType Linux, vinculación 127 efectiva; bloquear si no | Frena exposición antes de ejecutar; no modifica daemon ni otros contenedores |
| Margen RAM/disco “razonable” | 1,5 GiB RAM disponible, 2 GiB en D, 1 GiB en storage de imágenes antes del pull, registrar stats solo lectura | Hace falsable la no interferencia física; nada de `prune` |
| `compose config --quiet` únicamente | Comprobar también modelo normalizado: imagen, un servicio, host_ip, mounts D, secrets, límites, red no externa | Detecta degradación de una restricción silenciosa sin rediseñar Compose |
| Credenciales en archivos sin formato especificado | RNG cripto, ASCII sin saltos, ACL local, sin argv/log/ZIP | Evita filtraciones y errores de inicialización sin proveedor extra |
| `DB_PORT=1` y configuración/cache Laravel | Comprobar credenciales/puerto/schema efectivos desde **el mismo runner** antes de migrar; sin tocar phpunit.xml/caché | Evita migrar otra DB y falsos PASS |
| Dos sesiones SQL pero sin obligación de pasar por los servicios | Dos **workers del servicio existente** por B17/B19/B20, barrera START, SESSION_ID, logs del método y SQL final; DB-only etiquetado como tal | Prueba contrato end-to-end del dominio sin abrir rutas comerciales |
| Auditoría de cambios indiferenciada | Cada PASS con evidencia/archivo/exit code; DO01–DO12 idénticos | Una entrega útil, no 20 rondas repetidas |

## 5. Qué NO se va a hacer

No ejecutar B21-S1 V2 histórico, no repetir B13–B20, no crear otro Dockerfile, no añadir segundo servicio, no cambiar Compose de otros proyectos, no bajar Docker Desktop, no puertos wildcard, no instalar MariaDB en Windows, no cambiar `phpunit.xml` ni el login real, no dar permisos RR. HH., no atribuir consentimiento ni legalización de salarios, no lanzar B22. No afirmar que este Markdown ejecutó pruebas o inspeccionó el equipo del propietario.

## 6. Plan final y retorno

**Codex Luna ejecuta un único macrobloque**: (A) preflight del Engine y protección de ajenos; (B) MariaDB Docker oficial aislada y healthy con storage D; (C) migraciones, tenant y carreras de los métodos reales B17/B19/B20; (D) detener **solo** `db`, comparar antes/después y empaquetar evidencias **en un ZIP**. Los 12 oráculos originales DO01–DO12 permanecen como criterio; si faltan recursos/autorización de seguridad, **BLOCKED justificado, nunca PASS**. No más análisis recursivo antes de ejecutar.

- **Archivo único de prompt V2:** `CODEX_LUNA_JORNATO_B21_DB_DOCKER_QA_S1_V2_MACROBLOQUE_DOCKER_AISLADO_CONCURRENCIA_REAL_ZIP_UNICO_20261115.md`.
- **ZIP único que Codex debe devolver:** `JOR-B21-DB-DOCKER-QA-S1-V2-20261115-UNICO.zip` bajo `D:\codex\_REPORTES\Jornato\JOR-B21-DB-DOCKER-QA-S1-V2-20261115\delivery\`.
- **NEXT_OWNER actual:** `CODEX_LUNA`. **Después del ZIP:** `CHATGPT_DIRECTOR`. No reiniciar Codex por costumbre. `B21_GLOBAL=NOT_APPROVED`; `RELEASE_APPROVED=NO`.

**Auditoría final**: 10 pasadas V01–V10 + 10 J01–J10, cada una con L1–L6 = **120 juicios documentales**, 0 tests Docker/MariaDB ejecutados en esta revisión. En caso de contradicción con historia anterior, prevalece el checkpoint canónico de GitHub y el ZIP real más reciente que entregue el usuario.