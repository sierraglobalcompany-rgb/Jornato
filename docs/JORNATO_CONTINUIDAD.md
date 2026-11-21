# JORNATO — CONTINUIDAD CANÓNICA · 20 NOV 2026 · N2-R1 CORRECCIÓN ÚNICA ACTIVA

**Orden ÚNICA de CODEX LUNA:** [docs/CODEX_LOTE_ACTUAL.md](CODEX_LOTE_ACTUAL.md), TASK `JOR-N2-SDK-RECOVERY-HOST-GATE-20261120`, REVISION `N2-R1_20261120`. **Es el mismo gate N2, no una ejecución N3**: sustituye la orden N2 previa únicamente si aún no se ejecutó. Si N2 ya empezó o generó ZIP, detener la nueva delegación y adjudicar **ese** resultado antes de intervenir. [Auditoría del delta N2-R1 (10 verdugo y 10 juez)](JORNATO_N2_R1_AUDITORIA_10V_10J_20261120.md).

## Hechos cerrados sin nuevas auditorías

- ZIP N1-R2 `JOR-N1-R2-CUSTODIA-KIOSCO-OFFLINE-20261120-UNICO.zip`, SHA256 `5EACC3643A00D0EC338E1EB62698A1B4AEA88C957FD3B113C0BF25B394E61540`: 10 miembros CRC PASS; 9 miembros de manifiesto 9/9 correcto. `PARTIAL_WITH_GAPS`, correcciones nocturnas/acumulado referencial escritas; **siete archivos de tests host y 73 declaraciones seleccionadas, 0 ejecutadas**. No reabrir N1-R2 ni aprobar por fuente escrita.
- Snapshot privado del WIP de 216 archivos/2.904.617 bytes y muestra de restauración 5/5 **reportados** por Codex; todo en el mismo D:. No es backup externo ni restauración integral. WIP reportado en `D:\codex\Jornato`, rama `codex/jor-b08-h4-domain-20261025`, HEAD `faf5fe283191f8b5a2724b397009512a2caec1b6`, status 234 (223 untracked, 11 modificados), staged 0. ChatGPT no accede al WIP.
- ZIP físico C2 V5 `JOR-H9-C2-PHYSICAL-DART-V5-20261120-UNICO.zip`, SHA256 `711116067DDBF73E7CE4AD6A102D58E14AD5372D79A981F48978C54A76B35692`: `A2_sdk=PASS` Flutter 3.47.8/Dart 3.13.7 y `A5_offline_compile=PASS` **en su entorno reportado**. El SDK no se encontró en PATH/rutas comunes en N1-R2. No hay evidencia de que ambos lotes hayan corrido en el mismo host. APK QA instalado según Codex, C2 `BLOCKED_VM_SERVICE`; **no tocar teléfono/ADB/AVD**.
- Backend B21F-S3 158 tests/2450 assertions `PASS_SCOPED`, H9-M1 75 host PASS y F1 widget focal PASS según lotes históricos; no repetir. `CIPHER_ENGINE/KEYSTORE_EFFECTIVE/IDEMPOTENCY_NATIVE/CORRUPTION_FAIL_CLOSED=NOT_RUN` físico; reinicio Android `BLOCKED_HARNESS`, tenant/Pro `BLOCKED_CONTRACT`.

## Hallazgo material del N2 original y reparación

En [Flutter 3.47.8 `flutter_command.dart`](https://github.com/flutter/flutter/blob/3.47.8/packages/flutter_tools/lib/src/runner/flutter_command.dart), `FlutterCommand._updateCacheAndRunPubGet` actualiza artefactos con `cache.updateAll` **antes** de evaluar el `pub.get` condicionado. Así, `flutter test --no-pub` por sí solo **NO asegura cero descargas**. N2-R1 obliga a revisar artefactos/stamps/caches localmente sin ejecutables Flutter y solo ejecutar la CLI cuando se demuestre que está completa; si faltan, una sola salida `BLOCKED_CACHE_ARTIFACTS` / `SDK_RUNTIME_POLICY_UNVERIFIED`.

## Instrucciones N2-R1, sin pingpong

1. Guardar PRE SHA de seis rutas N1-R2 y siete tests, revisar ausencia de agente concurrente o ZIP N2 posterior, y reutilizar custodia; no copiar de nuevo 216 fuentes.
2. Localizar SDK por pistas delimitadas del WIP y C2 V5; verificar **procedencia de host**, `flutter.bat`, `dart.exe`, artefactos de caché y package-config. Sin escanear unidades enteras, sin descargas, instalaciones o PATH global.
3. Validar los siete tests y fixtures SQLite sintéticos/no red/no datos reales. Solo si SDK/cache y dependencias son compatibles, formato y analyze focal y **los siete archivos de pruebas host**, sin dispositivo. En caso de fallos de producto propios, una campaña de corrección causal y una de regresión focal; resultados PASS/FAIL/SKIP reales y por SHA.
4. Si SDK/caché sigue inaccesible, **un ZIP único de bloqueo causal** sin retoques de producto; Director decide insumo mínimo, sin otra reauditoría de N2. Toda salida sanitizada, diffs privados fuera del ZIP.

## GitHub y puertas hacia release

Repo `sierraglobalcompany-rgb/Jornato` público: `main=1ee6aae821f8cf177cc64149081ad8847f7fec2e`; PR #1 Draft `faf5fe283191f8b5a2724b397009512a2caec1b6`; PR #3 Draft apilado sobre PR1 `104469b119752f395cf9881e732d582feab9db4e` **refs observados antes de este cambio**. PR #2 es documental, **NO** contiene WIP de Windows. No merge, push WIP, ni publicación de secretos/código privado. Las seis leyes PingPongLaw L1 KISS, L2 antirruido, L3 causa raíz, L4 diseño humano, L5 evidencia independiente, L6 antipingpong permanecen.

**Después del ZIP N2:** Director adjudica, prepara respaldo fuera del equipo **con permiso**, concilia PR3 y WIP, integra de forma segura, desbloquea Android C2 con autorización, después Pro/tenant/web/empleados y decisiones OD01–OD08, QA L4/L5/UAT y solo entonces B22, firma y publicación con GO del propietario. **H9_GLOBAL=NO_GO, B22=NOT_AUTHORIZED, RELEASE=NO_GO.**

**NEXT_OWNER=CODEX_LUNA_N2_R1_IF_NO_EXISTING_RUN; AFTER_SINGLE_ZIP=CHATGPT_DIRECTOR.**
