# JORNATO · DICTAMEN INDEPENDIENTE DEL ZIP N4 + DECISIÓN ÚNICA N5 · 21 NOVIEMBRE 2026

**Objeto exclusivo:** la entrega `JOR-N4-FULL-SOURCE-AND-SERVER-QA-20261121-UNICO.zip`, no repetir auditorías 10+10, suites ni pruebas Android. Director: ChatGPT. **N4 TERMINADO** (`PARTIAL_WITH_GAPS`) y único paso siguiente propuesto `JOR-N5-DOCKER-NONET-PUB-GATES-20261121`.

## Evidencia independiente de ZIP (realmente inspeccionada)

- Archivo recibido, tamaño **21.966 bytes**, SHA-256 **`C5B1F0F344ED6E2B280FCFB92126664593715C24B0B27D29A5A0C4460898D1F8`**; ZIP 12 miembros, CRC correcto, manifiesto 11/11 archivos con SHA-256 y bytes coincidentes. 232 rutas del `FULL_SOURCE_COVERAGE.csv` sin duplicidad case-insensitive.
- `FULL_SOURCE_COVERAGE.csv`: **232** archivos; 150 `server`, 25 `android`, 19 `lib`, 14 `test`, 7 root, 8 docs, 5 integration_test, 3 assets, 1 test_driver; **230 overlays WIP** y 2 entradas `HEAD` (el `SOURCE_EXCLUSIONS_SUMMARY.md` explica 13 objetos HEAD superpuestos con 11 overlays). Esta paridad fue **calculada por el verificador de Codex en Windows y reportada en el ZIP**; ChatGPT no recibió los 232 archivos fuente ni puede confirmar directamente sus bytes.
- N4 declara comparación de 56 overlays N3 y 216 referencias N1; WIP HEAD `faf5fe283191f8b5a2724b397009512a2caec1b6`, rama `codex/jor-b08-h4-domain-20261025`, status 235 (224 untracked/11 tracked modified), staged 0 e índice SHA `25CC609803D7E68D5F3ECF428198B2432CF1EA37030546735DD3F03299D905E1` **PRE=POST reportado**.
- SDK Flutter 3.47.8/Dart 3.13.7, ocho artefactos host presentes. `pubspec.lock`: 79 hosted packages; **22 directorios o sellos no presentes en cache predeterminada**. No hubo `flutter analyze`, `flutter test` ni `pub get` N4; `BLOCKED_OFFLINE_CACHE`. No confundir con falta universal de paquete: N2/N3 sí ejecutaron host y pueden haber usado otra ruta `PUB_CACHE`.
- Fuente `server/` **150 archivos**, 11 migraciones, 34 declaraciones API: `composer.json` PHP ^8.3, `composer.lock` Laravel 13.40.0, Sanctum 4.3.3, PHPUnit 12.5.43; 109 pares vendor instalados reportados coincidentes. **Estático**: no hubo `php`, `artisan`, `phpunit`, DB ni validación de extensiones runtime.
- Docker 29.9.2/Compose 5.6.1 y dos imágenes PHP/MariaDB cacheadas según Codex. Config Compose de N4 validó, pero al intentar su red bridge interna Docker devolvió `all predefined address pools have been fully subnetted`. No se creó ningún recurso N4 (contendor/red/volumen), ni se ejecutó E01–E08. `SERVER_DOCKER_COMPLIANCE=NOT_RUN`, no es un PASS; tampoco evidencia de interferencia en otros proyectos. No cambiar config daemon/IPAM para obtener verde.
- ZIP no contiene código, parches, secretos, capturas, logs crudos ni datos de trabajadores. **`OFF_DEVICE_BACKUP=NO`; `ANDROID_NATIVE=NOT_RUN`; `H9_GLOBAL=NO_GO`; `B22=NOT_AUTHORIZED`; `RELEASE=NO_GO`.**

## Dictamen del Director

**N4=PARTIAL_ACCEPTED_SCOPE.** La preparación del candidato y lectura estática del Laravel avanzaron materialmente. Ni el smoke Flutter del candidato ni la seguridad/runtime real del servidor están certificadas. Dos bloqueos de **entorno**, no fallos demostrados de código: Pub cache y Docker IPAM. No reabrir N4, no otra campaña de hashes 232/232, no 158 pruebas PHP ni 86 Flutter host por rito.

**N5: DOS carriles, UNA sola entrega.**

1. **Pub:** antes de descargar los 22 paquetes, ubicar el cache que sí resolvió las pruebas N3 examinando `PUB_CACHE`, `package_config.json` del WIP y caches locales conocidos. Resolver el `pubspec.lock` exacto con `--offline --enforce-lockfile` si existe material íntegro, y ejecutar una sola prueba `KioskScreen` y análisis focal **sobre candidato aislado**, no WIP. Si realmente faltan paquetes, declarar `BLOCKED_PUB_PACKAGES` con nombres/versions; próxima decisión explícita de descarga oficial será del propietario.
2. **Docker PHP+MariaDB:** Docker oficial documenta `network_mode: none` (solo loopback) y Compose `network_mode: service:{name}`. En principio es posible que PHP y MariaDB compartan un **namespace de red privado del mismo Compose**, sin crear puente ni consumir pools IPAM. **NO está probado en el host**, así que N5 limita a una sola topología/ejecución, sin puerto expuesto y sin redes ajenas. Si el Compose interpreta que necesita crear puente o falla por otro motivo, detenerse y clasificar; nunca usar red host/default, prune, subred forzada ni modificar daemon. Si pasa, comprobar extensiones PHP, vendor, DB QA sintética y únicamente E01–E08 sobre rutas reales, luego limpiar SOLO recursos N5. No inventar API ni permisos.

**Sobre aislamiento:** este namespace sin red externa es una propuesta de aislamiento temporal QA, **no reemplaza la red bridge dedicada estándar** en futuros entornos ni permite desplegar producción. Ambos contenedores son de un solo proyecto; compartir loopback dentro de ese proyecto es intencional. La disponibilidad efectiva depende de Docker Desktop y la configuración Compose local.

## Gobierno / siguiente responsable

- Prompt Codex único: `CODEX_JORNATO_N5_DESBLOQUEO_DOCKER_NAMESPACE_PUB_20261121.md`. La orden anterior N4 y borrador post-N4 `NO_EJECUTAR` quedan cerrados. **No enviar simultáneamente otros prompts.**
- Código avanzado continúa **solo en WIP privado Windows**; GitHub PR #2 se usa exclusivamente para documentos. `main` y PR #1/#3 F0 no sustituyen la fuente backend. No push/merge ni backup externo sin permiso y revisión de secretos.
- Mantener PingPongLaw L1–L6, `requestId` / histórico `requetId`, `SERVER_STORED != RECOGNIZED`, OD02/03/04 pendientes, B19/B20 deny-all. Cuando el ZIP N5 llegue, adjudicarlo y decidir la próxima puerta funcional, sin otra auditoría del mismo prompt.

**NEXT_OWNER=CODEX_LUNA_N5; AFTER_ONE_ZIP=CHATGPT_DIRECTOR.**

## Referencias técnicas oficiales consultadas (no sustituyen evidencia Jornato)

- Docker Compose network modes: https://docs.docker.com/reference/compose-file/container-spec/
- Docker none network: https://docs.docker.com/engine/network/drivers/none/
- Docker Compose service startup: https://docs.docker.com/compose/how-tos/startup-order/
- Dart pub offline y enforce-lockfile: https://dart.dev/tools/pub/cmd/pub-get
