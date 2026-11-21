# JORNATO — N5-R1 · AUDITORÍA INDEPENDIENTE 10 VERDUGO + 10 JUEZ · DELTA EJECUTIVO

**Corte:** 2026-11-21 (America/Bogota). **Objeto exclusivo:** documento N5 V1 emitido el mismo día, no el producto completo ni una auditoría repetida de C2/N1–N4. El Director actuó como crítico adversarial y revisor de decisiones en 20 **pasadas documentales distintas**; **no** son 20 ejecuciones, ni se ha probado Docker/Pub del usuario desde esta conversación. Codex no deberá reauditar este documento.

**Decisión operativa:** corregir N5 como **N5-R1, mismo TASK** `JOR-N5-DOCKER-NONET-PUB-GATES-20261121`, **solo si N5 V1 NO comenzó**. Si comenzó, no iniciar N5-R1 ni repetir pruebas; recibir ZIP V1 y adjudicarlo. No abrir N6. Entregar a Codex exclusivamente el nuevo [macrobloque corregido](CODEX_LOTE_ACTUAL.md) cuando pase esa condición.

## 1. Cadena de evidencia y alcance

- **Markdown original N5** leído directamente en `/mnt/data/CODEX_JORNATO_N5_DESBLOQUEO_DOCKER_NAMESPACE_PUB_20261121.md`, SHA256 `333C2CC346563F80A9C66FE3E25B586FAE7C0563A4236B971F78AFB10CDA442E`; se comparó con `docs/CODEX_LOTE_ACTUAL.md` del PR2. No confundir la posibilidad de sintaxis con ejecución real.
- **N4 ZIP** `/mnt/data/JOR-N4-FULL-SOURCE-AND-SERVER-QA-20261121-UNICO.zip`, SHA256 `C5B1F0F344ED6E2B280FCFB92126664593715C24B0B27D29A5A0C4460898D1F8`, CRC y manifiesto previamente certificados; releí `FINAL_REPORT.md` y `BLOCKERS.md` directamente. Declaraciones: 232 fuentes/150 server, cache host bloqueado 22 de 79, Docker bloqueado al crear bridge por IPAM; 0 PHP/SQL/8 E2E; WIP 235 status/0 staged; respaldo off-device NO.
- **Política del propietario** `docs/JORNATO_DOCKER_AISLAMIENTO_PROYECTOS_20261121.md`: PHP/BD solo Docker aislado por proyecto; sin puertos, redes, volúmenes ni destrucciones ajenas. Docker disponible según usuario, pero sin acceso remoto directo.
- **GitHub** observado: repo `sierraglobalcompany-rgb/Jornato`; `main 1ee6aae821f8cf177cc64149081ad8847f7fec2e`, PR1 `faf5fe283191f8b5a2724b397009512a2caec1b6`, PR3 `104469b119752f395cf9881e732d582feab9db4e`, PR2 documental. No se examinó el WIP avanzado en Windows, por lo que NO se declara compilación ni release.
- **Referencia externa**: Docker `network_mode:none`/`service:db`: https://docs.docker.com/reference/compose-file/container-spec/ ; dependencia de healthcheck: https://docs.docker.com/compose/how-tos/startup-order/ ; render Compose: https://docs.docker.com/reference/cli/docker/compose/config/ ; Dart Pub `--enforce-lockfile` y `--offline`: https://dart.dev/tools/pub/cmd/pub-get ; salud MariaDB: https://mariadb.com/docs/server/server-management/automated-mariadb-deployment-and-administration/docker-and-mariadb/using-healthcheck-sh . Documentación explica capacidades, no prueba instalación del usuario.
- **Chequeo ejecutado aquí:** PyYAML pudo analizar la plantilla N5: `services.db.network_mode=none`, `services.php.network_mode=service:db`, sin claves de puertos/redes. Es **PASS_SYNTACTIC_ONLY**. No se ejecutaron contenedores ni PHP.

## 2. VERDUGO — 10 pasadas, una por amenaza real

### V01 — Orden ejecutable y concurrencia
**Qué hice:** Comparé el inicio de N5 V1, que solo buscaba entrega previa, con el riesgo de N5 ya iniciado sin ZIP.
**Ataque/hallazgo:** Un segundo arranque podría duplicar cambios, contenedores y evidencia.
**Sentencia y corrección:** Añadí `PROMPT_REVISION=N5-R1` y gate `N5_ALREADY_IN_FLIGHT_OR_FINISHED` antes de escribir o arrancar; conservar N5 V1 si ya comenzó. **Estado:** `NO REINICIAR EN VUELO`.

### V02 — Identidad del lockfile
**Qué hice:** Contrasté N4: 79 paquetes hosted, 22 ausentes del caché por defecto, con el éxito de N2/N3 en el WIP.
**Ataque/hallazgo:** N2/N3 no certifican que su pubspec.lock sea igual al del candidato N4.
**Sentencia y corrección:** Comparar SHA de pubspec.lock de N4 y copia N5, y el de N2/N3 solo si consta; no asumir equivalencia ni PASS de caché. **Estado:** `NO EXTRAPOLAR PASS`.

### V03 — Integridad real de paquetes Pub
**Qué hice:** Inspeccioné la regla original de copiar 22 directorios y verificar sellos.
**Ataque/hallazgo:** Carpetas presentes o rootUri no equivalen a SHA de contenido correcto.
**Sentencia y corrección:** Exigir verificación real de Pub `--offline --enforce-lockfile`; separar DIRECTORY_PRESENT de HASH_VERIFIED y bloquear si no hay procedencia íntegra. **Estado:** `CORREGIR`.

### V04 — Fallback permisivo de Pub
**Qué hice:** Contrasté fallback `flutter pub get --offline` con documentación oficial de `--enforce-lockfile`.
**Ataque/hallazgo:** Offline puede resolver una combinación distinta sin descargar; restaurar lock después no certifica dependencias.
**Sentencia y corrección:** Eliminar fallback; ejecutar solo con `--offline --enforce-lockfile` y SHA lock idéntico antes/después; si flag indisponible, bloquear. **Estado:** `CORREGIR`.

### V05 — Invocación Flutter y cache de artefactos
**Qué hice:** Verifiqué nuevamente la advertencia de N2-R1: `--no-pub` no detiene `cache.updateAll`.
**Ataque/hallazgo:** Un `flutter test --no-pub` podría intentar completar artefactos pese a prohibir descargas.
**Sentencia y corrección:** Confirmar cache/stamps antes de cualquier Flutter CLI, luego `pub get` offline y solo test focal sobre copia N5. **Estado:** `GATE ANTES DEL COMANDO`.

### V06 — Preservación del candidato de N4
**Qué hice:** Contrasté N4=232 fuentes con orden V1 que refiere al candidato en varios pasos.
**Ataque/hallazgo:** Una ejecución o bind de escritura sobre N4 puede alterar la única copia que tiene paridad reportada.
**Sentencia y corrección:** Prohibir modificaciones en candidato N4; ejecutar en copia privada N5 y cotejar hashes PRE/POST sobre originales usados. **Estado:** `CORREGIR CUSTODIA`.

### V07 — Compose sin bridge/IPAM
**Qué hice:** Validé con PyYAML la plantilla original (`db:none`, `php:service:db`, sin ports ni networks) y contrasté Docker Compose official.
**Ataque/hallazgo:** YAML válido no prueba que `docker compose up` no cree red default en instalación concreta.
**Sentencia y corrección:** Revisar modelo renderizado filtrado, único up; verificar inventario redes BEFORE/AFTER y STOP ante nueva red/IPAM, sin variante ni prune. **Estado:** `PASS ESTÁTICO, RUNTIME INCIERTO`.

### V08 — Salud MariaDB y autenticación
**Qué hice:** Examiné `mariadb-admin ping` en healthcheck y guías MariaDB.
**Ataque/hallazgo:** Ping indica liveness, no autoriza SQL autenticado, esquema vacío, usuario mínimo ni migraciones.
**Sentencia y corrección:** Exigir PDO autenticado desde PHP, schema exacto, usuario y volumen N5, tabla vacía antes de Artisan; healthcheck solo liveness. **Estado:** `CORREGIR P0`.

### V09 — Imagen PHP y ejecución real
**Qué hice:** Comparé tags php:8.3-cli y MariaDB 11.8.9 del prompt con dependencias Laravel N4 reportadas.
**Ataque/hallazgo:** La imagen PHP base no garantiza pdo_mysql/mbstring/dom/xml; FAIL por extensión no es bug Laravel.
**Sentencia y corrección:** Verificar `php -m` solo en contenedor propio, bloquear `BLOCKED_PHP_EXTENSIONS` y no instalar/build/alterar otros proyectos. **Estado:** `CLASIFICAR CAUSA`.

### V10 — Valor real de E01–E08 y confidencialidad
**Qué hice:** Contrasté 8 oráculos con topología sin puertos publicados y el requisito de datos sintéticos.
**Ataque/hallazgo:** Un HTTP simulado o solo un estatus sin DB podría crear falsos PASS; env completo o inspect filtrado mal puede filtrar secretos.
**Sentencia y corrección:** Usar test client/Kernel Laravel real dentro de PHP QA con persistencia MariaDB, sanitizar salida; B19/B20 deny-all y OD pendientes. **Estado:** `CORREGIR ORÁCULO`.

## 3. JUEZ — 10 pasadas, contraprueba de cada alternativa

### J01 — Cancelar y relanzar N5 de inmediato
**Argumento a favor:** Se podría ganar certeza sobre el prompt nuevo.
**Contraste adversarial:** Pero N5 V1 podría estar en curso: duplicar crearía más riesgo que beneficio.
**Decisión:** N5-R1 sustituye solo si N5 V1 no empezó; si empezó, adjudicar su ZIP. **Sentencia:** `RECHAZAR RELANZAMIENTO`.

### J02 — Repetir 86+13 pruebas ya aprobadas
**Argumento a favor:** Aportaría números más grandes en el informe.
**Contraste adversarial:** No cambia la incertidumbre de caché/IPAM ni añade evidencia para WIP idéntico.
**Decisión:** Solo test focal del candidato N5 después de resolver Pub; no rehacer suites históricas. **Sentencia:** `RECHAZAR`.

### J03 — Descargar los 22 paquetes Pub por defecto
**Argumento a favor:** Sería el camino más inmediato para compilar.
**Contraste adversarial:** No hay permiso de red y podrían existir en otro cache local legítimo.
**Decisión:** Identificar cache exacto, validar lock e integridad; si faltan bytes, bloqueo nominal y pedir autorización posterior. **Sentencia:** `RECHAZAR DESCARGA AUTOMÁTICA`.

### J04 — Aceptar pub get offline sin enforce
**Argumento a favor:** Podría ser compatible con herramientas viejas.
**Contraste adversarial:** Pero da margen a una resolución distinta del lock; Dart 3.13.7 permite exigir integridad.
**Decisión:** Mantener `--enforce-lockfile` obligatorio y reporte BLOCKED_PUB_FLAGS si no disponible. **Sentencia:** `APROBAR GATE ESTRICTO`.

### J05 — Probar Docker bridge con subred manual o red ajena
**Argumento a favor:** Podría esquivar la falta de IPAM.
**Contraste adversarial:** Crea colisiones y viola aislamiento con otros Codex simultáneos.
**Decisión:** Una sola tentativa none/service:db sin red host; bloqueo limpio si Compose no lo admite. **Sentencia:** `RECHAZAR VARIANTES`.

### J06 — Dar PASS SQL por ping saludable
**Argumento a favor:** Es comprobación rápida y usada en Compose.
**Contraste adversarial:** Liveness no garantiza credenciales ni aislamiento de datos.
**Decisión:** Exigir conexión autenticada PDO, DB sintética vacía, namespace/volumen propio antes de migrar. **Sentencia:** `APROBAR VERIFICACIÓN SQL`.

### J07 — Construir una imagen PHP nueva al faltar extensiones
**Argumento a favor:** Podría resolver el bloqueo funcional.
**Contraste adversarial:** Sin descarga, con hosts compartidos y Dockerfiles ajenos, improvisarlo aumenta riesgo.
**Decisión:** BLOCKED_PHP_EXTENSIONS específico; siguiente permiso solo si se necesita y existe imagen segura. **Sentencia:** `RECHAZAR CONSTRUCCIÓN IMPROVISADA`.

### J08 — Abrir puerto HTTP/DB de Windows para E2E
**Argumento a favor:** Facilita requests de pruebas convencionales.
**Contraste adversarial:** Rompe el objetivo de no puertos y eleva superficie de otros proyectos.
**Decisión:** Ejecutar HTTP Kernel real dentro de PHP contenedor y observar MariaDB; si no hay ruta real BLOCKED_CONTRACT. **Sentencia:** `RECHAZAR PUERTOS HOST`.

### J09 — Corregir código Laravel dentro del WIP en caso de fallo
**Argumento a favor:** Acelera aparente integración.
**Contraste adversarial:** Rompe custodia y contamina la fuente sin respaldo externo aprobado.
**Decisión:** Arreglos focales solo en copia N5 con hashes y entrega; Director integra después de autorizar respaldo y revisar secretos. **Sentencia:** `APROBAR AISLAMIENTO`.

### J10 — Abandonar el bloque si Docker o Pub falla
**Argumento a favor:** Parece preservar seguridad evitando más comandos.
**Contraste adversarial:** Desperdicia el otro carril independiente sin necesitar infraestructura compartida.
**Decisión:** Carriles independientes; cada uno termina PASS/BLOCKED causal y un ZIP; no nuevos bloques hasta adjudicar. **Sentencia:** `APROBAR PROGRESO PARCIAL`.

## 4. Matriz de cambios de N5 V1 a N5-R1

| Elemento | N5 V1 | N5-R1 obligatorio |
|---|---|---|
| Concurrencia | Comprobar ZIP previo | Comprobar también proceso/directorio N5 activo; no duplicar |
| Candidato | Reutilizar N4 | N4 intocable, trabajar solo copia privada N5 y SHA PRE/POST |
| Paquetes Pub | Copiar 22 carpetas/sellos si parecen presentes | Cache íntegra verificada; Pub offline + enforce lockfile, SHA idéntico |
| Artefactos Flutter | `--no-pub` en test | Verificar stamps y universal cache **antes** de CLI |
| Docker | YAML none/service:db | Igual topología KISS, sin otra variante; verificar ausencia de red IPAM real |
| Salud DB | Ping con healthcheck | Ping solo liveness; PDO autenticado y esquema QA vacío |
| PHP | php:8.3-cli como plantilla | Versión local, extensiones verificadas, no build/install de rescate |
| API E2E | E01–E08 | Laravel HTTP Kernel dentro de contenedor y DB real, sin ports host |
| Resultado | PASS/BLOCKED genéricos | Flags causales Pub/SQL/red + evidencia sanitizada |

## 5. Criterio final y ruta de cierre

**N5-R1 es la intervención mínima suficiente de la orden, no una nueva arquitectura.** Toda operación queda sujeta a gates previos. Uno de los dos carriles puede terminar `BLOCKED` y el otro avanzar; no hacer otra búsqueda global o reauditoría a causa de ese bloqueo.

- **L1 KISS:** dos servicios Docker como máximo; no crear otra DB, servicio, runner o tecnología. **L2 antirruido:** no repetir 86 + 9 + 4 ni 158 pruebas históricas por rito. **L3 causa raíz:** Pub, IPAM y extensiones se clasifican como entorno hasta demostrar fallo producto. **L4 UX:** marcación real ya probada en host, no inventar UI. **L5 evidencia:** hashes, exit codes, SQL real, aislamiento. **L6 anti pingpong:** un TASK y un ZIP.
- **Siguiente decisión real tras ZIP N5:** si faltan bytes Pub → solicitud específica de autorización para descargar **solo** paquetes oficiales bloqueados con SHA de lock; si Docker bloquea → resolver entorno mediante decisión del propietario, **sin prune**; si PHP carece extensiones → seleccionar una imagen de QA verificada/autorizada, no compilar a ciegas. Si pasa host/DB, continuar con autorización de backup fuera de D:, publicación de código en destino privado, Android físico, staging/UAT y GO.
- **No aprobado:** código avanzado en GitHub público, recuperación externa, Android SQLCipher/Keystore, B22, producción, release. `OFF_DEVICE_BACKUP=NO`, `RELEASE=NO_GO`, `NEXT_OWNER=CODEX_LUNA_N5_R1_IF_N5_NOT_STARTED; AFTER_ZIP=CHATGPT_DIRECTOR`.

## 6. Reproducción documental del dictamen

1. El comparador de prueba YAML se ejecutó localmente con PyYAML, cargando el bloque YAML del markdown original y del revisado; verificó 2 servicios y los campos de red declarados. No es un test de Docker Desktop.
2. Se validó programáticamente el prompt revisado: TASK idéntico; revisión N5-R1, rama única, siete etapas Flutter, un YAML sin networks/ports, sin nuevas variantes, una sola entrega y estados `RELEASE=NO_GO` y `OFF_DEVICE_BACKUP=NO`.
3. Los informes N4 previos se utilizaron como base factual. Se evitó repetir CRC/tests de N2–N4, auditorías V/J anteriores y suites aprobadas.

**Dictamen definitivo:** `APPROVED_TO_EXECUTE_CONDITIONALLY_N5_R1` solamente cuando N5 V1 no ha empezado y el preflight no detecta otra ejecución. Si Codex ya está trabajando N5 V1, `DO_NOT_RESTART; ADJUDICATE_EXISTING_ZIP`. 