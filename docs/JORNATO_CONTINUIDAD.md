# JORNATO — CONTINUIDAD CANÓNICA · 22-NOV-2026 · N7 CERRADO / A1-R2 CONDICIONAL

**PRIMERA LECTURA:** [ÚNICA ORDEN CODEX](CODEX_LOTE_ACTUAL.md) → [AUDITORÍA DELTA A1 10 VERDUGO + 10 JUEZ](JORNATO_A1_R2_AUDITORIA_10_VERDUGO_10_JUEZ_20261122.md) → [Recovery Handoff](JORNATO_RECOVERY_HANDOFF_ACTUAL.md).

**ÚNICO `TASK` A1**: `JOR-A1-ANDROID-OFFLINE-APK-QA-CANDIDATE-20261121`, `PROMPT_REVISION=A1-R2-20261122`. Sustituye el prompt A1-R1 **únicamente si todavía NO comenzó A1**. Si existe trabajo iniciado, carpeta A1 en progreso o ZIP A1 previo, NO se ejecuta esta revisión ni se abre otro Codex: recibir/adjudicar el resultado anterior. No crear A2 por defecto.

## Hechos probados, no repetir

- **Fuente N5:** el ZIP `JOR-N5-DOCKER-NONET-PUB-GATES-20261121-UNICO.zip` fue abierto directamente, SHA256 `162118EFD4260B97A425E969CB90C06C54A4CAA0003FEC82F2C68A2BD53E84CC`. `CANDIDATE_DELTA_SUMMARY.csv`: 232 registros, **82 no-server + 150 server**, incluye `android/gradlew.bat`, wrapper jar y Gradle Kotlin scripts. El ZIP **no** contiene código fuente. El candidato completo es privado en D: y debe existir allí para construir A1.
- **N5 Flutter host:** Pub 79/79 paquetes y `flutter pub get --offline --enforce-lockfile` PASS, SHA `pubspec.lock=F515D69563850E8893A17585D8BAB57A8E6484E18CE1FEF4BDDC6BB836F83B34`; 9/9 test real KioskScreen y analyze PASS candidato. No repetir N2 86 host, N3 9+4 host, ni N5 host en WIP sin cambio causal.
- **C2 Android anterior:** ZIP `JOR-H9-C2-PHYSICAL-DART-V5-20261120-UNICO.zip`, SHA256 `711116067DDBF73E7CE4AD6A102D58E14AD5372D79A981F48978C54A76B35692`. APK debug viejo SHA `BEEA46F75B08CFA440A980BCEE4CC12E2A6B4C7B37A9457B16240C5427157593`, paquete `com.sierraglobalcompany.jornato.b14qa`, instaló según Codex en Xiaomi Mi A3 API30, VM Service BLOQUEADO, pruebas Android críticas NOT_RUN. No sustituirlo ni instalar otro APK en A1.
- **N7 Docker cerrado:** ZIP SHA `BFB06C090009B7EA7FDB886D52FDE86C09FA3F0E828755BCBF06D1435B14D1EB`. Causa real de errores de lectura PHP aún no identificada; diagnóstico Docker global de solo lectura `ACTIVATED_BY_DIRECTOR=NO`, no autorizado. **PHP/BD solo Docker aislado por proyecto**, pero **A1 no toca Docker**.
- **WIP reportado, no accedido directamente por Director:** `D:\codex\Jornato`, rama `codex/jor-b08-h4-domain-20261025`, HEAD `faf5fe283191f8b5a2724b397009512a2caec1b6`, 235 rutas (224 untracked, 11 modified), 0 staged, índice SHA `25CC609803D7E68D5F3ECF428198B2432CF1EA37030546735DD3F03299D905E1` según N7. Código avanzado no subido GitHub; NO BACKUP off-device.

## Qué corrige A1-R2 frente a A1-R1 (DELTA, no otra etapa)

1. Guard no duplicación PRE y ZIP ya entregado; mismo task y mismo directorio A1 solo si virgen.
2. Copia únicamente 82 app-side, verificación con N5 CSV SHA, candidato N5 y WIP inmutables; nada server.
3. Generar `android/local.properties` con `flutter.sdk` y `sdk.dir` en A1, `pubspec.lock` SHA fijo, `PUB_CACHE` privado A1 clonado desde N5 validado, sin usar package_config del WIP.
4. Gradle Wrapper puede descargar antes de `--offline`: comprobar distribución exacta instalada, y sembrar `GRADLE_USER_HOME` privado con cache de origen RO (artefactos más metadatos), sin copiar credenciales/locks ni depender de cache compartido editable.
5. Aislar `.android/debug.keystore`/certificado QA, `ANDROID_USER_HOME`, TEMP/TMP; si no puede demostrarse, STOP; no reutilizar claves release, ni sustituir APK C2 instalado.
6. Derivar una única tarea Gradle de `productFlavors` REAL + target `lib/main.dart`; hacer **una build**; solo defecto de código inequívoco permite un arreglo dentro de A1 y **un único retry igual**. Inspeccionar APK real, SHA, firma, launcher y manifest. APK guardado PRIVADO D:, ZIP contiene solo informes/manifest hashes, nunca APK ni fuentes.

**Criterios:** `PASS_APK_QA_SCOPED` solo por APK nuevo QA firmado + metadatos reales; Android físico/Keystore/SQLCipher/reinicio y restauración todavía NOT_RUN. `OFF_DEVICE_BACKUP=NO`, `H9_GLOBAL=NO_GO`, `B22=NOT_AUTHORIZED`, `RELEASE=NO_GO`.

## Gobierno / GitHub

- Repo público `sierraglobalcompany-rgb/Jornato`; antes de esta revisión: main `1ee6aae821f8cf177cc64149081ad8847f7fec2e`, PR #1 Draft F0 HEAD `faf5fe283191f8b5a2724b397009512a2caec1b6`, PR #3 Draft F0 HEAD `104469b119752f395cf9881e732d582feab9db4e`, PR #2 DRAFT documental. No merge, push de WIP, acciones o publicación desde A1.
- PingPongLaw L1 KISS / L2 antirruido / L3 causa / L4 UX / L5 evidencia verificable / L6 evitar pingpong. ChatGPT Director decisiones; CODEX Luna ejecución. Múltiples programas en carpetas separadas: nunca alterar gradle/pub/sdk de otros proyectos ni Docker global.
- Contrato de producto sigue sin nómina; Local sin nube. `requestId` y legado `requetId` no mezclarlos; `SERVER_STORED != RECOGNIZED`; B19/B20 DENY-ALL; OD02/03/04 pendientes. Pro y Laravel quedan bloqueados en otro frente, no dependencias de APK offline QA.

**NEXT_OWNER=CODEX_LUNA_A1_R2_IF_NOT_STARTED; AFTER_ZIP=CHATGPT_DIRECTOR.**
