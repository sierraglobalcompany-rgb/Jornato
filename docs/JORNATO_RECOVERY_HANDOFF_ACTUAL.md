# JORNATO — RECOVERY HANDOFF · A1 ANDROID OFFLINE QA, DOCKER PAUSADO

**PARA UN CHAT NUEVO: LEER PRIMERO** [Continuidad vigente](JORNATO_CONTINUIDAD.md) → [única orden A1](CODEX_LOTE_ACTUAL.md). Director ChatGPT; ejecutor Codex Luna. **NO relanzar A1 si se inició o ya entregó ZIP A1**, no reabrir N2–N7 ni volver a ejecutar la auditoría Docker. El propietario indicó «continúa» tras acordar priorizar la app offline y aplazar diagnóstico global Docker.

## Qué está demostrado

- N5 Flutter candidate host PASS: Pub 79/79 offline, `kiosk_screen_actions_test.dart` 9 PASS, `flutter analyze` PASS; candidato privado N5 232 fuentes (82 app + 150 servidor) hashes N4/N5 sin delta reportado. ZIP N5 SHA256 `162118EFD4260B97A425E969CB90C06C54A4CAA0003FEC82F2C68A2BD53E84CC`.
- C2 creó APK antiguo QA debug `app-b14qa-debug.apk`, SHA `BEEA46F75B08CFA440A980BCEE4CC12E2A6B4C7B37A9457B16240C5427157593`, package `.b14qa`, instalado en Xiaomi Mi A3; VM Service PID-only bloqueado, pruebas físicas críticas NOT_RUN. No reinstalar/sustituir ni usar ese APK como A1.
- N7-R1 ZIP SHA `BFB06C090009B7EA7FDB886D52FDE86C09FA3F0E828755BCBF06D1435B14D1EB`: Docker PHP lectura/copia de imagen falló, causa subyacente no demostrada. [Borrador diagnóstico RO Docker](CODEX_JORNATO_DOCKER_DESKTOP_DIAGNOSTICO_RO_CONDICIONAL_20261121.md) sigue sin autorización y NO se ejecuta. Servidor Laravel E01–E08 bloqueado, no correrse en Windows.
- WIP reportado D:\codex\Jornato HEAD `faf5fe...`, 235 rutas, index `25CC609803D7E68D5F3ECF428198B2432CF1EA37030546735DD3F03299D905E1` (ver continuidad por SHA exacto), sin backup fuera D:. No hay código avanzado en GitHub.

## Único A1

Generar **APK QA debug nuevo** desde copia aislada N5 app-only de 82 rutas, Gradle SDK y Pub **offline** preflight, una variante Android auténtica, máximo una reparación causal en copia, no WIP. Verificar SHA, firma debug y Android manifest estático. No device, ADB, emulador, install, Docker, PHP, DB, staging o releases. Mantener APK en `A1_ROOT/private/product`, enviar **UN ZIP único sanitario** con resultados y hashes, sin APK ni fuentes/secretos. Producto QA no equivale a release Android físico.

Si faltan dependencias de Gradle/SDK, un informe preciso de bloqueo y ninguna descarga. Si hay APK, el Director decide más tarde una prueba física bajo autorización y un método que no dependa exclusivamente del VM Service C2. No pedir al propietario que realice pruebas técnicas repetitivas.

**Estados finales de esta orden:** `ANDROID_PHYSICAL=NOT_RUN`, `OFF_DEVICE_BACKUP=NO`, `RELEASE=NO_GO`, `B22=NOT_AUTHORIZED`. GitHub PR #2 solo documental; main/PR1/PR3 sin tocar. PingPongLaw L1–L6, KISS, no parches ni doble ejecución.

**NEXT_OWNER=CODEX_LUNA_A1; AFTER_ZIP=CHATGPT_DIRECTOR.**
