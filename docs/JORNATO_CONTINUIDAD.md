# JORNATO — CONTINUIDAD CANÓNICA · 21-NOV-2026 · N7 CERRADO / A1 ANDROID QA DISPONIBLE

**OBJETIVO ACTUAL:** acelerar Jornato por **Android offline** mientras se mantiene **Docker Desktop / Laravel BLOQUEADO Y SIN INSPECCIÓN**. **ÚNICA ORDEN QUE SE PUEDE ENVIAR A CODEX:** [CODEX_LOTE_ACTUAL.md](CODEX_LOTE_ACTUAL.md), `TASK=JOR-A1-ANDROID-OFFLINE-APK-QA-CANDIDATE-20261121` (A1-R1). Se preparó después de la instrucción «continúa» del propietario. **No implica que Codex ya haya iniciado A1**: antes de correr, exigir guard A1 no iniciado ni ZIP A1 existente. NO ejecutar el [borrador Docker RO](CODEX_JORNATO_DOCKER_DESKTOP_DIAGNOSTICO_RO_CONDICIONAL_20261121.md): `ACTIVATED_BY_DIRECTOR=NO`, continúa sin autorización; no borrar ni reescribir ese archivo.

## Hechos cerrados — no volver a auditar

1. **N5 Flutter host candidato PASS_SCOPED:** ZIP `JOR-N5-DOCKER-NONET-PUB-GATES-20261121-UNICO.zip`, SHA256 `162118EFD4260B97A425E969CB90C06C54A4CAA0003FEC82F2C68A2BD53E84CC`. Reutilizó candidato N4 232 archivos (150 `server/`, **82 app-side**); lock Pub SHA256 `F515D69563850E8893A17585D8BAB57A8E6484E18CE1FEF4BDDC6BB836F83B34`, cache hosted 79/79 exacto, `flutter pub get --offline --enforce-lockfile` exit0, `flutter analyze --no-pub` 0 issues, `flutter test --no-pub test/kiosk_screen_actions_test.dart` 9/9 PASS. No acredita Android. N2 86 PASS host, N3 9+4 PASS host, no repetir.
2. **C2 físico anterior:** `JOR-H9-C2-PHYSICAL-DART-V5-20261120-UNICO.zip`, APK QA debug `app-b14qa-debug.apk` (112.605.171 bytes), SHA256 `BEEA46F75B08CFA440A980BCEE4CC12E2A6B4C7B37A9457B16240C5427157593`, package `com.sierraglobalcompany.jornato.b14qa`, Android API30 arm64 Mi A3. Según Codex se instaló una vez y quedó instalado, pero VM Service no apareció en logcat PID-only: `BLOCKED_VM_SERVICE`; `CIPHER_ENGINE`, `KEYSTORE_EFFECTIVE`, `IDEMPOTENCY_NATIVE`, `CORRUPTION_FAIL_CLOSED` NOT_RUN, `RESTART_READBACK=BLOCKED_HARNESS`. El APK C2 no es el APK de la fuente N5 y NO se reutiliza como build nuevo.
3. **N7-R1 cerrado:** ZIP SHA256 `BFB06C090009B7EA7FDB886D52FDE86C09FA3F0E828755BCBF06D1435B14D1EB`, 7 miembros 6/6 manifiesto. PHP `docker cp` parcial/erróneo, raíz storage/runtime no demostrada. No diagnosticar ni mutar Docker global; la alternativa RO pendiente de autorización NO se ejecuta.
4. Laravel PHP ^8.3 / 13.40.0 / Sanctum 4.3.3: E01–E08 **no ejecutadas**, no hay Docker QA funcional. B19/B20 DENY-ALL; OD02/03/04 pendientes. `requestId` y legado `requetId` no mezclar; `SERVER_STORED != RECOGNIZED`.
5. WIP local reportado: `D:\codex\Jornato`, rama `codex/jor-b08-h4-domain-20261025`, HEAD `faf5fe283191f8b5a2724b397009512a2caec1b6`, 235 rutas (224 untracked, 11 modified), staged0 e índice `25CC609803D7E68D5F3ECF428198B2432CF1EA37030546735DD3F03299D905E1` estable hasta N7 según Codex. **No hay fuente avanzada en remoto público** y no hay backup fuera de D:.

## Único bloque A1 que sí agrega valor

- **App-only:** copiar desde el candidato N5 las 82 rutas fuera de `server/` a **copia aislada A1**, comprobando 82/82 SHA sin rearmar WIP/HEAD; mantener N5 original inmutable.
- Preflight real Flutter/JDK/Gradle/SDK/Android flavors y caches; `--offline` de Gradle NO garantiza que el wrapper no descargue su distribución cuando no está instalada. Guard contra descarga obligatoria. Si no hay cachés completos/aislables, cerrar con nombre y versión precisa.
- **Un APK QA debug** compilado offline desde A1, una variante existente deducida del Gradle Kotlin real; verificar salida, SHA, firma debug, package/manifest/ABI/SDK con herramientas locales. Máximo una reparación causal privada y un reintento de la **misma variante**.
- **No teléfono, ADB/AVD, instalación, VM Service, Laravel, MariaDB, Docker, redes o producción.** APK/artefactos privados en D:, un ZIP sanitario de informe y evidencia, nunca APK/fuentes/claves en ChatGPT/GitHub público. Preparar gate físico posterior bajo autorización expresa y sin repetir la ruta C2 bloqueada como si fuera una prueba PASS.
- Aunque APK QA compile: `ANDROID_PHYSICAL=NOT_RUN`, `OFF_DEVICE_BACKUP=NO`, `H9_GLOBAL=NO_GO`, `B22=NOT_AUTHORIZED`, `RELEASE=NO_GO`.

## Gobierno/GitHub

- Repo público `sierraglobalcompany-rgb/Jornato`; main `1ee6aae821f8cf177cc64149081ad8847f7fec2e`; PR #1 F0 Draft HEAD `faf5fe283191f8b5a2724b397009512a2caec1b6`; PR #3 F0 Draft apilado HEAD `104469b119752f395cf9881e732d582feab9db4e`; PR #2 DOCUMENTAL. No publicar WIP ni hacer push, merge o deploy desde A1.
- Políticas: PingPongLaw L1 KISS, L2 antirruido, L3 causa raíz, L4 UX, L5 prueba reproducible, L6 antipingpong. Varios Codex en proyectos separados; no interferir con recursos globales; PHP/DB solo Docker aislado, pero **Docker no se toca en A1**.
- El contrato original F0 [PRODUCTO](https://github.com/sierraglobalcompany-rgb/Jornato/blob/faf5fe283191f8b5a2724b397009512a2caec1b6/docs/PRODUCTO.md) distingue F1 offline, F2 kiosco/sensores y F4 backend Pro. No declarar piloto funcional por simple build.

**NEXT_OWNER=CODEX_LUNA_A1; AFTER_ONE_ZIP=CHATGPT_DIRECTOR.**
