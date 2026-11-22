# JORNATO — AUDITORÍA DELTA N6-R1 → N6-R2 · 10 VERDUGO + 10 JUEZ

**Corte:** 21 de noviembre de 2026 (America/Bogota). **Objeto exacto:** el archivo ya entregado `CODEX_JORNATO_N6_PHP_RUNTIME_QA_UNICO_20261121.md` (N6-R1), frente al ZIP real N5 y la regla de Docker privado por proyecto. **Esta es una auditoría del PROMPT nuevo, no una nueva auditoría del producto ni veinte ejecuciones de software.** El mismo `TASK=JOR-N6-PHP-RUNTIME-CAUSE-ISOLATED-QA-20261121` permanece. No se reinician N2–N5 ni se duplican sus tests. Se preserva el principio KISS/PingPongLaw L1–L6.

## Fuentes exactas y límites

- **Fuente A, N6-R1:** archivo local recibido `CODEX_JORNATO_N6_PHP_RUNTIME_QA_UNICO_20261121.md`, leído en su integridad. Referencias de línea originales: 3–23 precondición y estados; 25–33 evidencia y restricciones; 35–41 preflight; 43–48 pruebas de imagen; 50–58 QA; 60–102 retorno.
- **Fuente B, evidencia N5:** ZIP adjunto `JOR-N5-DOCKER-NONET-PUB-GATES-20261121-UNICO.zip`: **24.069 bytes**, SHA256 `162118EFD4260B97A425E969CB90C06C54A4CAA0003FEC82F2C68A2BD53E84CC`; **10 miembros, CRC correcto y manifiesto 9/9**. En `FINAL_REPORT.md`/`DOCKER_PRIVATE_NETNS_EVIDENCE.csv`: Flutter candidato 9/9 host PASS + analyze/`pub get --offline --enforce-lockfile` PASS; 2 contenedores N5 aislados, cero nuevas redes/puertos y 1 volumen N5; PHP `exec /usr/bin/sh: exec format error`, exit 255; MariaDB `healthy` pero sin autenticación SQL; E01–E08 8 BLOCKED; WIP PRE/POST reportado estable. Son **registros de Codex**, no acceso directo de ChatGPT al PC.
- **Fuente C, remoto GitHub PR #2 documental:** `docs/CODEX_LOTE_ACTUAL.md` N6-R1, `docs/JORNATO_DOCKER_AISLAMIENTO_PROYECTOS_20261121.md`, `docs/JORNATO_CONTINUIDAD.md`, `docs/JORNATO_RECOVERY_HANDOFF_ACTUAL.md`, verificados antes del reemplazo. `main`, PR #1 y #3 son F0, **no contienen WIP avanzado**.
- **Documentación oficial externa** (API, no prueba del entorno del usuario): Docker `docker run` (`--pull=never`, `--entrypoint`, `--platform`): https://docs.docker.com/reference/cli/docker/container/run/ ; inspección de imagen: https://docs.docker.com/reference/cli/docker/image/inspect/ ; `docker version`: https://docs.docker.com/reference/cli/docker/version/ ; Compose `network_mode: none|service:db`: https://docs.docker.com/reference/compose-file/container-spec/ .

## 10 pasadas VERDUGO — ataques específicos al N6 original

### V01 — Riesgo de lanzar dos veces N6
**Inspección:** N6 línea 3 y §1.1 indican comprobar un ZIP N6. **Ataque:** un `output` parcial o un proceso N6 ya ejecutándose sin ZIP puede ser confundido con estado libre. **Evidencia:** ZIP N6 no ha sido aportado a este chat; el estado Windows no es visible. **Corrección:** comprobar archivo de ejecución, propietario y artefactos N6 existentes; si hay estado incierto, `SUPERSEDED_OR_CONCURRENT`, no otra sesión. **Justificación:** L2/L6; evitar dos agentes sobre mismo WIP/Docker.

### V02 — Inspección de imagen no prueba plataforma efectiva
**Inspección:** N6 §1.5 compara imagen y «arquitectura del engine». **Ataque:** `docker context` puede apuntar a otro daemon, `DOCKER_DEFAULT_PLATFORM` puede forzar otra arquitectura y la metadata no acredita binario ejecutable. **Evidencia:** N5 reportó PHP `linux/amd64` sin prueba de ejecución. **Corrección:** registrar contexto, plataforma del servidor, selección efectiva y SHA de imagen; si no hay coincidencia/probe, no declarar causalidad. **Justificación:** L3/L5.

### V03 — Sonda de shell contaminada por el ENTRYPOINT
**Inspección:** N6 §2.2 manda `docker run ... /bin/sh -c '...'` pero **no obliga `--entrypoint /bin/sh`**. **Ataque:** Docker puede invocar primero el entrypoint de la imagen y producir el mismo error, sin saber si el shell está roto. **Corrección:** un probe por ID de imagen con `--entrypoint /bin/sh` explícito y marca de salida; solo después comprobar PHP; si falla shell, un probe PHP directo para discriminar. **Justificación:** la variable bajo estudio debe ser el binario solicitado, no un wrapper.

### V04 — Presupuesto de imágenes indeterminado
**Inspección:** §2.1–2.2 «imágenes candidatas» y «como máximo un probe por imagen seleccionada». **Ataque:** elegir otra imagen tras cada bloqueo perpetúa el pingpong. **Corrección:** máximo **dos imágenes**: original N5 identificada por ID y **una** alternativa cached compatible si existe; una selección estática, ninguna búsqueda recurrente. **Justificación:** L1/L6 y coste de Docker compartido.

### V05 — Imágenes mutable-tag y uso de recursos ajenos
**Inspección:** N6 admite etiquetas/IDs sin instruir a pinning para el comando de ejecución. **Ataque:** un tag local puede ser reemplazado por otra tarea o la alternativa tener origen no confiable. **Corrección:** usar el ID de imagen previamente inspeccionado, no `latest`, sin pulls; otras imágenes pueden reutilizarse **solo como capas de lectura, nunca contenedores/redes/volúmenes de otros proyectos**, y solo si su procedencia es autorizable. **Justificación:** L5/protección multi-proyecto.

### V06 — Al diagnosticar, la sonda puede dejar recursos o exponer información
**Inspección:** §2.2 menciona contenedor efímero, pero no define etiquetas ni limpieza de fallo del propio probe. **Ataque:** `docker run --rm` puede fallar antes del arranque y debe registrarse la posible huella; salida completa de `inspect` filtra env de otras apps. **Corrección:** nombres/labels N6 exclusivos, `--rm`, `--network none`, sin mounts, sin secrets, límites, captura exit, control solo de residuos propios; `inspect --format` de campos permitidos. **Justificación:** aislamiento y L5.

### V07 — El test de extensiones es solo nominal
**Inspección:** §2.3 exige módulos, pero enumera una lista ilustrativa sin trazar `composer.json`/`composer.lock` verdaderos. **Ataque:** un módulo presente puede no satisfacer versión o driver, y un módulo no requerido podría bloquear innecesariamente. **Corrección:** derivar requisito real de `server/composer.json`/lock y probar versión PHP/extensiones **desde imagen**, con distinción REQUIRED vs OPTIONAL; si falta un imprescindible, bloquear sin instalar. **Justificación:** L3 KISS; evitar falsos bloqueos y PASS.

### V08 — Peligro de arranque Laravel con fuente no preservada
**Inspección:** N6 §1.3 permite copia acotada, §3.6 reparar fuente en N6. **Ataque:** copiar incompleto `vendor` o usar bind editable N5 puede invalidar historial y causar fallos falsos. **Corrección:** copia N6 privada de server + vendor que necesita el runtime, sin links, `composer.lock` cotejado, hashes de dueño/archivos focales PRE/POST; no rehacer 232/9.000 hashes sin delta. **Justificación:** L2/L3/L5.

### V09 — MariaDB healthy no asegura datos QA
**Inspección:** §3.4–3.5 menciona PDO y esquema. **Ataque:** liveness `healthy` y `SELECT DATABASE()` no bastan si el volumen se comparte o las tablas son heredadas. **Corrección:** volumen N6 NUEVO con label y namespace, SQL autenticado con usuario sintético, schema nuevo vacío, rutas de conexión exclusivamente loopback, verificaciones de identidad antes de migrar; fallo => STOP. **Justificación:** seguridad de otros proyectos; L5.

### V10 — E01–E08 pueden falsear producto listo
**Inspección:** §3.6 y §4. **Ataque:** pruebas de HTTP de rutas no existentes, mock o contratos OD aún no aprobados pueden declararse PASS, y arreglos en copia N6 no llegan al WIP de lanzamiento. **Corrección:** rutas/policies reales, dos tenants sintéticos, persistencia real; casos sin contrato `BLOCKED_CONTRACT`. Etiquetar cualquier fix `PRIVATE_CANDIDATE_ONLY`, no reclamar release ni merge. **Justificación:** L4/L5/no maquillar lanzamiento.

## 10 pasadas JUEZ — alternativas enfrentadas y sentencias

### J01 — ¿Cancelar N6 y crear un lote N7 más amplio?
**Argumento a favor:** limita errores de imagen. **Contraste:** N5 ya certificó Flutter y creó la topología segura; el único defecto nuevo es el runtime PHP. **Sentencia:** **NO**. Mantener N6 mismo TASK y reemplazar instrucciones solo si no inició. Razón L1/L2/L6.

### J02 — ¿Usar el PHP Windows para descartar error de Docker?
**A favor:** rápido y disponible quizá. **Contra:** rompe regla expresa de aislamiento y no demuestra la imagen PHP de producción/QA. **Sentencia:** **PROHIBIDO**. Probe solo contenedor Docker aislado, sin red. Razón seguridad cruzada.

### J03 — ¿Arreglar IPAM/crear bridge nueva?
**A favor:** simplifica conectividad. **Contra:** N5 ya demostró cero red con dos contenedores, IPAM tiene antecedente de agotamiento. **Sentencia:** **RECHAZADO**. Reusar estructura `none` + `service:db` en N6 solo si pasa PHP. Razón L3 y no interferencia.

### J04 — ¿Probar todas las imágenes PHP que haya?
**A favor:** maximiza posibilidad de descubrir una compatible. **Contra:** varias imágenes pueden pertenecer a otros proyectos, gasto y bucles. **Sentencia:** **DOS MÁXIMO**, con criterio de plataforma y una alternativa local seleccionada antes de sondas; sin pull/build. Razón L1/L6.

### J05 — ¿Confiar solo en las etiquetas `linux/amd64`?
**A favor:** evita contenedores de diagnóstico. **Contra:** N5 ya reportó imagen `linux/amd64` y no pudo arrancar `/usr/bin/sh`. **Sentencia:** comparar daemon+imagen, luego **sonda real diferenciadora** con entrypoint sobreescrito. Razón evidencia > inferencia.

### J06 — ¿Saltarse el shell si PHP directo ejecuta?
**A favor:** `php artisan` puede ejecutarse sin shell. **Contra:** comandos Composer, scripts y runtime del contenedor podrían fallar; N5 depende de shell. **Sentencia:** si shell falla, usar PHP directo **solo para diagnóstico**, no para `APP_QA_PASS`; no introducir workaround de producción. Razón L3, sin parches.

### J07 — ¿Repetir los 86/9+4 tests host y 158/2450 backend?
**A favor:** mayor tranquilidad. **Contra:** no hay delta de código/Flutter ni acceso runtime previo PHP; todo lo repetido pierde tiempo. **Sentencia:** conservar resultados anteriores por SHA/fuente; ejecutar **solo** E01–E08/DB real si se alcanza puerta. Razón L2/L5.

### J08 — ¿Iniciar DB para comprobar si PHP arranca?
**A favor:** reproduce N5 exactamente. **Contra:** N5 ya aisló el fallo de ejecución del shell **antes** de cualquier SQL. **Sentencia:** no arrancar DB hasta superar la prueba de imagen/extensiones/vendor; ahorrar recursos. Razón L3.

### J09 — ¿Corregir directamente Laravel en WIP si falla una prueba?
**A favor:** avance inmediato al producto. **Contra:** WIP grande sin respaldo externo y riesgo de pisar otro proceso, PR público no es fuente. **Sentencia:** corregir solo en copia privada N6 con causa/aserción demostradas y hash PRE/POST; después requerir integración segura. Razón L5 y custodia.

### J10 — ¿Declarar servidor GO si las ocho E2E pasan?
**A favor:** objetivo de aceleración. **Contra:** Android físico, cifrado/Keystore, UAT, backup externo y decisiones OD siguen pendientes. **Sentencia:** máximo `PASS_QA_SCOPED`; `RELEASE=NO_GO` hasta gates reales y aprobación. Razón L4/L5, defensa de lanzamiento.

## Decisión vinculante de esta auditoría

1. **N6-R2 reemplaza solo el texto de N6-R1**, **mismo TASK**, si N6-R1 NO comenzó. Si existe ZIP, carpeta/lock de trabajo o N6 está en vuelo, **NO** ejecutar N6-R2; el Director adjudica primero la evidencia actual.
2. **No se modifica** el candidate N5, WIP, Docker global, redes/volúmenes/puertos de otros proyectos, PR1/PR3/main. Nada de imágenes/paquetes descargados, `prune`, PHP/DB host Windows o re-test de Flutter.
3. **Criterios de salida:** diagnóstico imagen con plataforma/entrypoint + shell y PHP separados; máximo dos imágenes; si gate pasa, **un solo** Compose N6 QA + migraciones en DB sintética y E01–E08; un ZIP sanitario con manifiesto/CRC/SHA y clasificación de causas. Una prueba fallida de entorno no autoriza nuevas variantes ni arreglos silenciosos.
4. Lo completado antes de N6: Flutter candidato N5 9/9 PASS, los 232 archivos con paridad reportada, Docker N5 aislamiento y `E01–E08` pendientes. No reabrir.
5. El resultado no es test nuevo de N6. **N6_RUNTIME=NOT_RUN_BY_DIRECTOR**, `ANDROID_NATIVE=NOT_RUN`, `OFF_DEVICE_BACKUP=NO`, `SERVER_STAGING=NOT_AUTHORIZED`, `RELEASE=NO_GO`.

**NEXT_OWNER=CODEX_LUNA_N6_R2_IF_N6_R1_NOT_STARTED; OTHERWISE=CHATGPT_DIRECTOR_ADJUDICATE_N6_IN_FLIGHT.**
