# JORNATO — DICTAMEN N5-R1 Y SIGUIENTE MACROBLOQUE CAUSAL N6

**Corte:** 21 de noviembre de 2026 (America/Bogota). **Director:** ChatGPT. **Objeto:** ZIP realmente adjunto `JOR-N5-DOCKER-NONET-PUB-GATES-20261121-UNICO.zip`, no N5 V1 ni ejecución en Windows. **Decisión:** `N5=PARTIAL_WITH_GAPS` aceptado por puertas; `N6` focal PHP. No repetir 10+10 de N5-R1 ni pruebas N2–N5 aprobadas.

## 1. Verificación independiente del paquete

- ZIP entregado SHA256 **`162118EFD4260B97A425E969CB90C06C54A4CAA0003FEC82F2C68A2BD53E84CC`**, **24.069 bytes**, **10 miembros**, `ZipFile.testzip()=None`, manifiesto **9/9** archivos coincidentes en SHA256, tamaño y CRC32. Estructura correcta; incluye `FINAL_REPORT.md`, `BLOCKERS.md`, `CANDIDATE_DELTA_SUMMARY.csv`, `DOCKER_PRIVATE_NETNS_EVIDENCE.csv`, `FLUTTER_HOST_RESULTS.csv`, `N5_GATE_MATRIX.csv`, `PHP_DB_E2E_RESULTS.csv`, `PUB_CACHE_GAP.csv`, `WIP_GUARDS.csv`, `MANIFEST_SHA256.csv`.
- Inventario `CANDIDATE_DELTA_SUMMARY.csv`: **232** rutas únicas, `status=UNCHANGED_FROM_N4` en todas, con SHA y bytes declarados. **No incluye el código fuente**; paridad efectiva del árbol Windows según informe de Codex, no reconstruida por ChatGPT. Los 150 archivos del servidor proceden de N4 (reportado). `server/vendor`: 8.963 archivos cotejados y 109 pares lock/vendor (según Codex).
- `PUB_CACHE_GAP.csv`: **79** paquetes `hosted`, raíz de caché única `WIP_CONFIG_ROOT_1`, los 22 huecos de la caché por defecto localizados en raíz usada por N3; metadatos SHA hospedados 79/79 coincidentes (según reportes). N5 ejecutó `flutter pub get --offline --enforce-lockfile` **exit 0**, SHA lock PRE/POST `F515D69563850E8893A17585D8BAB57A8E6484E18CE1FEF4BDDC6BB836F83B34` inalterado, `package_config` 87 entradas sin WIP, análisis de pantalla/test exit 0 y **9/9 test KioskScreen PASS** en copia N5. Esto acredita host candidato acotado, **no** Android, APK ni UX nativo. La palabra genérica “Downloading packages…” de Pub no demuestra descarga de red en una ejecución con `--offline`.
- `DOCKER_PRIVATE_NETNS_EVIDENCE.csv`: proyecto `jornato-n5-qa-211121`, **Compose up único exit 0**, dos contenedores propios, **0 redes N5**, **0 puertos publicados**, un volumen etiquetado; inventario externo de **107** contenedores, **42** redes, **96** volúmenes antes de N5 reportado sin cambios externos (N5 añade 2 propios y 1 volumen). DB (`387467db1762`) mode `none` healthy por ping, PHP (`68a27835c845`) compartió su namespace y salió **255** por `exec /usr/bin/sh: exec format error`; contenedores N5 detenidos, volumen `jornato-n5-qa-211121_n5_data` preservado.
- `PHP_DB_E2E_RESULTS.csv`: **E01–E08 8/8 `BLOCKED_ENV`**, 0 invocaciones kernel, 0 PDO autenticaciones, 0 migrations. `WIP_GUARDS.csv`: rama `codex/jor-b08-h4-domain-20261025`, HEAD `faf5fe283191f8b5a2724b397009512a2caec1b6`, 235 rutas (224 untracked, 11 modified), stage 0, índice `25CC609803D7E68D5F3ECF428198B2432CF1EA37030546735DD3F03299D905E1`; **es reporte del ejecutor**, no lectura directa de Windows por ChatGPT.

## 2. Dictamen causal — no fabricar error de Laravel

| Puerta | Dictamen del Director | Fundamento |
|---|---|---|
| ZIP CRC/manifiesto | **PASS_VERIFIED** | Verificación con bytes reales 10 miembros, 9/9 manifiesto |
| Integridad fuente N5 | **PASS_REPORTED_SCOPED** | 232 hashes consignados; código no adjunto |
| Flutter candidato host | **PASS_SCOPED_REPORTED** | `--offline --enforce-lockfile`, analyze 0 issues, test 9/9 |
| Topología Docker aislada | **PASS_STRUCTURE_REPORTED** | 0 redes, 0 puertos, 2 contenedores propios; no se hizo SQL |
| Arranque PHP | **FAIL_RUNTIME** | Shell `exec format error`; la causa subyacente NO fue identificada |
| MariaDB identidad SQL | **NOT_VERIFIED** | `mariadb-admin ping` sin auth no prueba usuario/esquema |
| Migraciones E2E | **NOT_RUN, 8 BLOCKED_ENV** | PHP no arrancó; sin llamadas ni mutaciones |
| Seguridad cross-project | **PASS_SCOPED_REPORTED** | No hubo cambios externos atribuibles según inventario Codex |
| Android / respaldo externo / release | **NO_GO** | `ANDROID_NATIVE=NOT_RUN`, `OFF_DEVICE_BACKUP=NO`, `H9=NO_GO`, B22 no autorizado |

**Causa inmediata establecida:** fallo del intérprete `/usr/bin/sh` antes de ejecutar PHP. **NO está establecida** la razón interna (plataforma, formato del binario, entrypoint, imagen dañada o runtime). Docker sí permitió un namespace de red privado sin bridge/IPAM; no repetir ese experimento como si hubiera fallado la red. **No** atribuir defecto al código Laravel, a las migraciones o a la lógica tenant por ausencia de pruebas.

## 3. Decisión adversarial mínima y rechazo de alternativas

1. **NO** otra campaña Pub: se cerró el bloqueo de 22 paquetes y el smoke host en la copia N5.
2. **NO** resetear todo Docker, borrar IPAM/redes, usar host networking ni tocar los 107 contenedores externos. La prueba de aislamiento N5 sí funcionó.
3. **NO** inferir `SQL_AUTH` de `healthy`. Mantener DB/migraciones E2E bloqueadas hasta PHP funcional y PDO autenticado contra esquema N6 nuevo.
4. **SÍ** diagnosticar PHP antes de DB: inspección estática de plataforma/entrypoint/imagen y **un probe sin red**. Si falta una imagen PHP local compatible con extensiones, reportar bloqueo y el permiso técnico mínimo; no descargar ni improvisar extensiones sin autorización.
5. **SÍ** avanzar en mismo N6 hasta migraciones y E01–E08 **solo si** imagen/arquitectura/shell/extensiones/vendor y aislamiento son PASS; no abrir OD02/03/04 ni B19/B20.
6. **NO** editar WIP ni fuentes N5. Crear copia privada N6, conservar N5 detenido y volumen propio. Ningún PR de código sin custodia fuera de equipo/autorización. Un ZIP sanitario para el Director.

**Orden propuesta y activa una vez publicada:** [CODEX_LOTE_ACTUAL.md](CODEX_LOTE_ACTUAL.md) = `JOR-N6-PHP-RUNTIME-CAUSE-ISOLATED-QA-20261121`. Mantener fuentes originales y matrices ya adjudicadas. No 10+10 nuevos: el usuario no los solicitó esta vez y N5 ya fue auditado exhaustivamente antes de ejecutarse.

## 4. Referencias y permanencia

- [Política Docker transversal](JORNATO_DOCKER_AISLAMIENTO_PROYECTOS_20261121.md): PHP + DB exclusivamente Docker aislado por proyecto, no host Windows.
- [Continuidad](JORNATO_CONTINUIDAD.md), [Handoff](JORNATO_RECOVERY_HANDOFF_ACTUAL.md), [S1](JORNATO_SERVIDOR_S1_KIT_ACTIVACION_POST_N3_20261121.md) y [S2](JORNATO_S2_PAQUETE_DESPLIEGUE_Y_PISTAS_DE_RELEASE_20261121.md): sirven de documentación, **no** requieren otra auditoría ni duplicar herramientas.
- Manual Docker image inspect: https://docs.docker.com/reference/cli/docker/image/inspect/ ; Compose network_mode: https://docs.docker.com/reference/compose-file/container-spec/ . Son bases conceptuales, no confirmación de arquitectura del PC.

**NEXT_OWNER=CODEX_LUNA_N6, AFTER_ZIP=CHATGPT_DIRECTOR. RELEASE=NO_GO.**
