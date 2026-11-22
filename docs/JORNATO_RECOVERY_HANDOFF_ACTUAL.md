# JORNATO — RECOVERY HANDOFF ACTUAL · A2-R3 CONDICIONAL · 22 NOV 2026

**LECTURA OBLIGATORIA PARA CHAT NUEVO:** [continuidad canónica](JORNATO_CONTINUIDAD.md) → [orden CODEX activa solo condicional](CODEX_LOTE_ACTUAL.md) → [auditoría delta 10 Verdugo/10 Juez](JORNATO_A2_R3_AUDITORIA_DELTA_10_VERDUGO_10_JUEZ_20261122.md). **La primera pregunta NO es otra auditoría:** ¿A2-R2 ya empezó o entregó ZIP? Si sí, **NO enviar R3**; inspeccionar resultado R2 y avanzar. Si no, A2-R3 sustituye R2 manteniendo `TASK=JOR-A2-GRADLE-DEPS-APK-QA-20261122` y una sola compilación.

## Evidencias irrepetibles

- A2-R1 ZIP auditado SHA256 `C891EC71F5D30511065E0F902B1D97A19F5AA22F2D913FA48770E8D6328B6B24`, 7 archivos CRC PASS, manifiesto 6/6. Construcción **NOT_RUN**. Causa: `FlutterPlugin.kt` requiere `storage.googleapis.com/download.flutter.io`, no permitido por whitelist R1. El plugin lo añade, no hay que alterar scripts Gradle. A2-R1 reporte: fuentes 82/82, Pub offline SHA lock `F515D69563850E8893A17585D8BAB57A8E6484E18CE1FEF4BDDC6BB836F83B34`, 31.270 archivos de caché privada cotejados, WIP intacto. No se reejecutan.
- A1 caché Gradle faltante 22 variantes/21 GAV; N5 Flutter 9/9 host PASS; Android APK nuevo NOT_BUILT, dispositivo físico NOT_RUN. Sin APK no hay manifiesto fusionado/certificado. SourceSet QA debug `usesCleartextTraffic=true`, no usar datos reales ni distribuir QA. Certificación Android SQLCipher/Keystore/corrupción/rehidratación pendiente.
- WIP privado Windows `D:\codex\Jornato` HEAD `faf5fe283191f8b5a2724b397009512a2caec1b6`, 235 entradas, 0 staged, índice SHA `25CC609803D7E68D5F3ECF428198B2432CF1EA37030546735DD3F03299D905E1` según Codex. App candidata exclusivamente en D: A2/private; no backup externo, NO publicar WIP, ni Git en producto. Otros proyectos Codex en PC concurrente, no tocar Docker ni caches ajenas.
- Laravel/servidor N4–N7 bloqueado por Docker PHP; no abrir diagnóstico global sin autorización. NO reejecutar N2/N3/N4/N5/N6/N7, A1 o A2-R1. E2E E01–E08 de backend no ejecutadas. B19/B20 deny-all, OD02/03/04 sin aprobar; `requestId`/legado `requetId` y `SERVER_STORED` ≠ `RECOGNIZED`.

## Una sola orden siguiente (si procede)

**CODEX LUNA A2-R3:** reutilizar checkpoint R1 private, verificar que **R2 no comenzó**, inspeccionar solo URI del repo engine realm/variables, permitir Gradle oficial a rutas exactas HTTPS del plugin; cachés/signing/temp privadas. Ejecutar UNA `:app:assembleB14qaDebug` sin `--offline` (faltantes conocidos); otro intento exclusivamente por un error real de fuente propia con fix focal **en copia privada**. No agregar repos, ni descargar JDK/SDK, ni reinstalar Gradle, ni usar Android físico/Docker. Si construye APK nueva: `apksigner`, `aapt`/`apkanalyzer`, SHA256, merged manifest, `QA_DEBUG_CLEARTEXT`, un ZIP de evidencias sin APK. Si falla: causa exacta, no más reintentos. Un ZIP `delivery-r3/`, conservar ZIP `delivery/` R1. **RELEASE=NO_GO**.

PR #2 `docs/pingponglaw-l1-l6-canon-84e961c` publica solo instrucción/auditoría/handoff; `main`, PR1 y PR3 sin cambios de código, sin merge. Leyes KISS/antirruido/causa raíz/UX/QA independiente/antipingpong. No pedir al usuario repetir estado disponible en ZIP.

**NEXT=CODEX_LUNA_A2_R3_CONDICIONAL; AFTER_NEW_ZIP=CHATGPT_DIRECTOR; IF_R2_ALREADY_STARTED=CHATGPT_DIRECTOR_ONLY.**
