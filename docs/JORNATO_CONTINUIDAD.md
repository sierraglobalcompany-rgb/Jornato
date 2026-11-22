# JORNATO — CONTINUIDAD CANÓNICA · N5-R1 CERRADO / N6 ACTIVO · 21-NOV-2026

> **UNA SOLA ORDEN ACTIVA:** [CODEX_LOTE_ACTUAL.md](CODEX_LOTE_ACTUAL.md) = `JOR-N6-PHP-RUNTIME-CAUSE-ISOLATED-QA-20261121`. [Dictamen N5 real](JORNATO_N5_DICTAMEN_Y_N6_20261121.md). **No ejecutar de nuevo N5-R1**, ni sus 10 verdugo/10 juez, ni N4/N3/N2. Si N6 comenzó o existe ZIP N6 posterior, recibir/adjudicar ese ZIP ANTES de cualquier prompt nuevo. **Codex Luna ejecutor, ChatGPT Director; un único ZIP por tarea.**

## Fuente de verdad al corte

- ZIP N5 `JOR-N5-DOCKER-NONET-PUB-GATES-20261121-UNICO.zip` SHA256 `162118EFD4260B97A425E969CB90C06C54A4CAA0003FEC82F2C68A2BD53E84CC`, **24.069 bytes**, **10 miembros CRC PASS**, manifiesto 9/9 SHA+bytes+CRC correcto. **N5=PARTIAL_WITH_GAPS**.
- **Flutter candidato N5 PASS host acotado**: se encontró caché exacta 79/79 metadata de lock, 22 gaps predeterminados eran falsa ausencia, `flutter pub get --offline --enforce-lockfile` exit 0, lock SHA `F515D69563850E8893A17585D8BAB57A8E6484E18CE1FEF4BDDC6BB836F83B34` intacto; `flutter analyze --no-pub` PASS, `flutter test --no-pub test/kiosk_screen_actions_test.dart` **9/9 PASS**. N2=86 host PASS, N3=9+4 host PASS previos. No repetir sin delta. Sin Android nativo.
- **Candidato N4/N5**: 232 rutas, 150 backend, hashes 232/232 sin cambio **reportados** (ZIP no contiene fuentes). `server/vendor` 8.963 archivos, 109 pares compatibles reportados. Laravel 13.40.0/PHP ^8.3/Sanctum 4.3.3/PHPUnit 12.5.43, 11 migraciones, 34 declaraciones rutas API. No certificar backend E2E por inventario.
- **Docker N5**: Engine 29.9.2, Compose 5.6.1, un `up` exit 0, DB `network_mode:none`, PHP `network_mode:service:db`, 2 contenedores propios, 0 redes nuevas, 0 puertos publicados, 1 volumen propio. La red privada **sí se construyó sin IPAM**. `db` healthy solo ping; PHP exit 255 con `exec /usr/bin/sh: exec format error`, causa profunda **desconocida**. PHP/Artisan/SQL/migraciones **NO RUN**; E01–E08 **8/8 BLOCKED_ENV**. N5 PHP y DB contenedores reportados detenidos, volumen N5 `jornato-n5-qa-211121_n5_data` conservado. No tocarlo sin permisos/ownership nuevos.
- **WIP** `D:\codex\Jornato`: branch `codex/jor-b08-h4-domain-20261025`, HEAD `faf5fe283191f8b5a2724b397009512a2caec1b6`, 235 rutas (224 untracked/11 modified), 0 staged, índice SHA `25CC609803D7E68D5F3ECF428198B2432CF1EA37030546735DD3F03299D905E1`, según Codex; ChatGPT no tiene acceso directo Windows ni al WIP avanzado. 

## Decisión N6 cerrada: evitar perseguirse la cola

1. **Solo una causa pendiente:** recuperar un runtime PHP Docker compatible (imagen/OS/arch/entrypoint/shell/extensiones). Preflight read-only de imagen daemon, máximo un probe shell aislado y un probe binario si discrimina causa. Sin repetir arranque stack N5, sin cambiar Docker global.
2. Si PHP funciona, un **único Compose nuevo N6** con dos servicios privados, DB `none` y PHP `service:db`, sin nueva red ni puertos; DB y volumen sintéticos N6 nuevos; comprobar auth/schema por PDO y correr migraciones y E01–E08 reales en el MISMO bloque. Si PHP falla, retornar bloqueo preciso y no iniciar MariaDB.
3. Reusar candidato N5 por lectura, copia N6 privada; no tocar WIP ni repos. Flutter ya aprobado y no se repite. Preservar contenedores/volumen N5 detenidos para custodia sin operar recursos ajenos.
4. Ley transversal del dueño: **todo PHP/BD Docker aislado por proyecto**, múltiples Codex concurrentes en otros directorios, no puertos/redes/volúmenes ajenos, no `prune`, sin descargas, sin acceso datos laborales. [Política Docker](JORNATO_DOCKER_AISLAMIENTO_PROYECTOS_20261121.md).

## Gobierno y release

- Repo GitHub público `sierraglobalcompany-rgb/Jornato`: main `1ee6aae821f8cf177cc64149081ad8847f7fec2e`, PR1 F0 Draft `faf5fe283191f8b5a2724b397009512a2caec1b6`, PR3 F0 Draft `104469b119752f395cf9881e732d582feab9db4e`, PR2 **DOCUMENTAL**. WIP avanzado NO publicado, off-device backup **NO**. No merge/commit/deploy de producto ni PR de fuentes sin autorización y examen secretos.
- PingPongLaw L1 KISS L2 no ruido L3 causa raíz L4 UX humana L5 evidencia verificable L6 no pingpong. `requestId` / histórico `requetId`, `SERVER_STORED != RECOGNIZED`; B19/B20 deny-all, OD02/OD03/OD04 bloquean funciones sin contrato aprobado. Android nativo, SQLCipher/Keystore/corrupción/restart y UAT pendientes. 
- `H9_GLOBAL=NO_GO`, `B22=NOT_AUTHORIZED`, `SERVER_STAGING=NOT_AUTHORIZED`, `OFF_DEVICE_BACKUP=NO`, `RELEASE=NO_GO`. No vender un PASS Flutter host como release.

**NEXT_OWNER=CODEX_LUNA_N6; AFTER_ZIP=CHATGPT_DIRECTOR.**
