# JORNATO — AUDITORÍA INDEPENDIENTE DEL DELTA N7 → N7-R1 · 10 VERDUGO + 10 JUEZ

**Corte:** 21 de noviembre de 2026 (America/Bogota). **Director:** ChatGPT. **Objeto limitado:** `docs/CODEX_LOTE_ACTUAL.md` N7 original (Git blob antes de cambios `a74ad0e0ecf54228c7f9b115c33c571cd07e3fc0`), el ZIP N6-R2 recibido y la política de aislamiento Docker. **No auditamos otra vez el proyecto, N1–N6, las suites Flutter, la arquitectura de Laravel ni las 10+10 anteriores.**

**Fuente primaria comprobada:** ZIP real `/mnt/data/JOR-N6-PHP-RUNTIME-CAUSE-ISOLATED-QA-20261121-UNICO.zip`, SHA256 `664724B357008753353065F804817A990CEDE6FE5E6B41BEE2A5AF6A327B5AF4`; la matriz dentro del ZIP declara `/bin/sh` y `php -v` fallando en PHP 8.3/8.4, con `exec format error` o `input/output error`; E01–E08 NOT_RUN. El informe no prueba la causa inferior. Se reabrió el N7 original completo, incluidas su receta PowerShell, código Python y reglas de limpieza.

**Docs Docker contrastadas:** `docker create` crea un contenedor sin arrancarlo pero puede inicializar volúmenes; admite `--pull never`. `docker cp -L` puede leer un contenedor detenido y resolver symlinks. `docker rm` elimina el contenedor propio y `-v` afecta volúmenes anónimos. `ImageID` (config) no es lo mismo que `RepoDigest` (manifest). Referencias oficiales: https://docs.docker.com/reference/cli/docker/container/create/ ; https://docs.docker.com/reference/cli/docker/container/cp/ ; https://docs.docker.com/reference/cli/docker/container/rm/ ; https://docs.docker.com/reference/api/engine/version/v1.57/schemas/ImageInspect/ .

## Fase A — Verdugo (10 ataques, de evidencia a posible fallo)

### V01 — Falso PASS de un archivo truncado (CONFIRMADO POR EJECUCIÓN LOCAL)
- **Prueba:** extraje exactamente el analizador Python del prompt N7; fabriqué 64 bytes con `\x7fELF`, clase 64 y `e_machine=62`, sin tabla de programas ni contenido. El original devolvió **`ELF_X86_64_HEADER_OK`**. No se ejecutaron binarios de terceros.
- **Fallo:** se confunde reconocer tres campos de cabecera con estructura mínimamente íntegra.
- **Remedio N7-R1:** comprobar tamaño real, tabla de programas, límites de segmentos `PT_LOAD`/`PT_INTERP`, clase, endianess, tipo y arquitectura; veredicto nunca `PASS_RUNTIME`.

### V02 — Descarga implícita no prohibida por comando concreto
- **Evidencia:** N7 original usa `docker create --network none ... <IMAGE_ID>` sin `--pull never` explícito, aunque su texto prohíbe descargas.
- **Ataque:** si la imagen no existe o hay interpretación de referencia inesperada, la política no debe depender del default del CLI.
- **Remedio:** verificación local del ID + `docker container create --pull never`, nunca tags como target.

### V03 — `Trim()` antes de la guardia de limpieza
- **Evidencia:** N7 original evalúa `(& docker create ...).Trim()` al crear `$cid`. Un stdout vacío podría producir error antes de manejar el resultado de creación, con posible contenedor propio sin ID registrado.
- **Ataque:** no se sabría si quedó residuo N7; los demás desarrollos comparten daemon.
- **Remedio:** capturar stdout y exit code separadamente, ID con 64 hex, `finally` y recuperación por nombre GUID + label *solo del recurso propio*.

### V04 — Limpieza sin recovery cuando falla captura de ID
- **Evidencia:** el `finally` original solo hace `docker rm` si `$cid` se conoce; el nombre creado está disponible y etiquetado.
- **Ataque:** ante salida CLI anómala se abandona un contenedor detenido N7 sin explicar, mientras `N7_DOCKER_GUARDS` podría parecer correcto.
- **Remedio:** verificar nombre, label, ImageID y estado `created`; eliminar solo si propiedad positiva, de lo contrario `CLEANUP_PARTIAL` y STOP.

### V05 — Comprobación del intérprete dinámico insuficiente
- **Evidencia:** el analizador viejo no lee la tabla `PT_INTERP`, ni discrimina `PT_LOAD` truncado.
- **Ataque:** un ELF de 64 bytes o segmentos fuera de rango pasaría aunque no pudiera cargarse.
- **Remedio:** inspección estática bounded `PT_INTERP`/`PT_LOAD`; incluso si todo parece plausible, conservar `RUNTIME_UNRESOLVED`.

### V06 — Dos imágenes sin discriminación causal
- **Evidencia:** N7 original permite alternativa si “ambigüedad”, sin fijar una prueba concreta que cambiaría la recomendación.
- **Ataque:** repetir la misma observación en 8.4 produciría otro ZIP ambiental sin utilidad.
- **Remedio:** inspección alternativa **solo si el resultado original es ambiguo y la comparación cambiará la decisión**; máximo una tentativa por imagen. No se abre N8 automáticamente.

### V07 — Veredicto demasiado fuerte para metadatos/digests
- **Evidencia:** N6 CSV reporta `repo_digest` igual a ImageID; N7 original lo considera discrepancia a investigar.
- **Ataque:** la diferencia/igualdad de campos por sí sola puede dar falsos diagnósticos de corrupción.
- **Remedio:** guardar ID y RepoDigest por separado; no presentar ninguna relación de ellos como prueba de integridad de bytes.

### V08 — Efectos secundarios de Docker `create`
- **Evidencia:** `docker create` no ejecuta PID1 pero sí crea capa/contendor y, para imágenes con VOLUME, puede crear volúmenes; Docker es compartido y ha sufrido IPAM.
- **Ataque:** afirmar «solo lectura global» sería falso; el contenedor detenido es un recurso real.
- **Remedio:** bloqueo si `Config.Volumes`, `--network none --read-only --pull never`, un contenedor propio, inventario PRE/POST y cleanup por identidad exacta.

### V09 — Riesgo de que error de copia equivalga a corrupción de imagen
- **Evidencia:** N6 ya mostró `input/output error` en ejecución PHP alternativa; `docker cp` también podría fallar.
- **Ataque:** error de I/O podría estar en almacenamiento/runtime y no implica cabecera incorrecta.
- **Remedio:** `IMAGE_FILE_READ_FAIL_OR_PARTIAL` separado de `IMAGE_BYTES_STRUCTURE_BAD_SCOPED` y de `ELF_STRUCTURE_PLAUSIBLE_RUNTIME_UNRESOLVED`.

### V10 — Posible nuevo ping-pong sin salida accionable
- **Evidencia:** sin reglas de parada, N7 podría entregar otro `BLOCKED`, seguido de N8/N9 para seguir probando imágenes.
- **Ataque:** consume tiempo y no contribuye a lanzar Jornato.
- **Remedio:** una decisión principal en `REPAIR_DECISION.md`, permiso específico pendiente y nada de reintentos automáticos; Flutter N5 reutilizado.

## Fase B — Juez (10 contrapruebas de las correcciones propuestas)

### J01 — ¿Eliminar N7 por completo en vez de corregirlo?
- **Argumento adverso:** después de N6, cuatro fallos antes de PHP demuestran suficiente bloqueo ambiental; otro bloque parece redundante.
- **Resolución:** **mantener N7 una sola vez** porque la lectura de archivos sin ejecución diferencia bytes ilegibles/malformados de binarios estructuralmente plausibles y orienta la autorización. No repetir `docker run`.

### J02 — ¿Usar Python del host para leer el binario copiado viola Docker-only?
- **Argumento adverso:** PHP y DB deben estar aislados en Docker.
- **Resolución:** **permitido** leer bytes en Python en Windows; está prohibido ejecutar PHP o SQL en Windows. El script no usa subprocess, DLL loading, red ni ejecuta el ELF.

### J03 — ¿Una cabecera estructural plausible certifica imagen segura?
- **Argumento adverso:** checks de `PT_LOAD`/`PT_INTERP` podrían interpretarse como integridad binaria completa.
- **Resolución:** **no**. Veredicto `ELF_STRUCTURE_PLAUSIBLE_NOT_RUNTIME_PASS`, no se inspeccionan todas las instrucciones ni integridad de todas las capas/deps; PHP sigue bloqueado hasta reparación.

### J04 — ¿Deberíamos añadir reintentos del motor y probar más tags?
- **Argumento adverso:** más datos podrían separar avería de Docker Desktop vs imagen.
- **Resolución:** **rechazado**. Máximo dos IDs de N6, solo una pasada por ID y nada de nuevos tags/downloads; cualquier cambio global requiere autorización y coordinación multi-proyecto.

### J05 — ¿Se puede usar `docker create` seguro en daemon compartido?
- **Argumento adverso:** Docker create muta el inventario global, aun sin PID1.
- **Resolución:** **sí, acotado y condicionado**, si daemon/contexto están estables, imagen sin volúmenes automáticos, espacio adecuado, red none, propietario por label/name/id y limpieza con inventario PRE/POST. Si esos gates fallan, no crear.

### J06 — ¿Por qué añadir `--pull never` si el ID ya está fijado?
- **Argumento adverso:** es redundante.
- **Resolución:** **aceptado como cinturón de seguridad barato**, no como otra arquitectura. Garantiza explícitamente la ley de no descarga si el entorno cambia.

### J07 — ¿Vale la pena un parser ELF en vez del antiguo de 20 líneas?
- **Argumento adverso:** más líneas pueden incrementar fallos en Codex.
- **Resolución:** **sí, porque el viejo tiene un falso positivo reproducido**. El nuevo es stdlib, de solo lectura, fue sometido a seis pruebas sintéticas/locales y entrega estados finitos; no es herramienta permanente del producto.

### J08 — ¿Y si Docker cambia por otro Codex durante PRE/POST?
- **Argumento adverso:** diferencias en inventario podrían ser de otro agente.
- **Resolución:** **no imputar automáticamente a N7**. Solo garantizar que ninguna operación propia apuntó a recursos ajenos; si el estado compartido cambió, `SHARED_ENV_CHANGED_EXTERNALLY`, sin intentar detener/limpiar nada ajeno.

### J09 — ¿Se debe proponer recuperar una imagen oficial de inmediato?
- **Argumento adverso:** sería más rápido que forense.
- **Resolución:** **rechazado antes de evidencia**. Si `docker cp` da I/O, un pull podría no resolver un problema de almacenamiento; si ELF malformado tras copia completa, el permiso de recuperación puntual resulta más defendible. Ninguna acción de red sin autorización.

### J10 — ¿Aprobar release offline o backend con la evidencia N7?
- **Argumento adverso:** Flutter N5 ya pasó y quizá no necesita servidor para Gratis Local.
- **Resolución:** **release NO_GO**: host Flutter no acredita Android nativo, firma, reinicio/SQLCipher/Keystore, respaldo externo ni UAT. N7 solo diagnostica infraestructura; no habilita Android o producción.

## Matriz de decisiones y aceptación del prompt N7-R1

| Control | Comprobación documental/local | Estado |
|---|---|---|
| Validador N7 original | Falso positivo ELF de 64 bytes reproducido | **FAIL confirmado** |
| Validador N7-R1 | 6 casos: 64 bytes, tabla fuera de rango, segmento fuera de rango, ELF mínimo, archivo corto, shell ELF real | **PASS 6/6 en entorno ChatGPT** |
| Sintaxis Python | `python -m py_compile` sobre el analizador nuevo | **PASS** |
| `--pull never` en `docker create` | Confirmado contra Docker CLI oficial | **PASS documental** |
| `docker cp -L` contenedor detenido | Confirmado contra Docker CLI oficial | **PASS documental** |
| PowerShell en Windows usuario | No tengo acceso a esa consola ni daemon | **NOT_RUN** |
| Docker N7 real | Todavía no se ejecutó | **NOT_RUN** |
| Integración producto/Android/servidor | Fuera de alcance de N7 | **NO_GO/NOT_RUN** |
| GitHub PR #2 | Publicar y verificar el prompt, auditoría y handoff | **Pendiente de verificación al cierre de esta tarea** |

**Sentencia:** N7 original NO debe ejecutarse con el analizador ELF defectuoso. Reemplazarlo por `N7-R1`, con **mismo TASK** y sin segundo ejecutor, **SOLO si N7 original todavía no empezó**. Este dictamen realiza 10+10 revisiones documentales/adversariales, no 20 ejecuciones Docker. Después de ZIP N7, **NEXT_OWNER=CHATGPT_DIRECTOR** para decidir reparación mínima del entorno sin perseguir la cola.
