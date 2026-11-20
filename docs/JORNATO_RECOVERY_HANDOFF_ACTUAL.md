# RECOVERY HANDOFF — JORNATO · C2 ANDROID FÍSICO / SDK LOG PRIVACY · 2026-11-20

> **ACTUALIZACIÓN PRIORITARIA 20-NOV-2026:** La única instrucción ejecutable es **V5** en [CODEX_LOTE_ACTUAL.md](CODEX_LOTE_ACTUAL.md); V4 local y V3 anterior quedan superadas. V5 añade tres controles de privacidad en host y matriz metadata WIP. [Dictamen 10+10 nuevo](JORNATO_AUDITORIA_C2_V5_10V_10J_DELTA_20261120.md). **No repetir instalación si ya hay ZIP físico posterior.** El resto de este Handoff conserva el historial V3, NO es orden independiente.

> **Recovery Universal V6 EJECUTADO en modo `REANUDAR + ACTUALIZAR_POR_DELTA`.** Handoff autónomo para un chat nuevo, NO respaldo del disco Windows, NO autorización de producción, borrado, merge ni despliegue. **Fecha de corte:** 2026-11-20 UTC / 2026-11-19 en Colombia. Responsable de dirección: ChatGPT. Ejecutor local de la próxima orden: Codex Luna.

## A. RECOVERY SEED: primera pantalla

**Producto:** Jornato, app de asistencia y jornadas laborales para pequeñas empresas: kiosco Gratis Local offline; oferta Pro multidispositivo con sincronización, Flutter y almacenamiento local SQLCipher/outbox; backend Laravel/Sanctum/MariaDB; portal web, empleados y módulos RR. HH. **Meta:** terminar, comprobar y lanzar el producto integral, no aprobar hitos parciales como release.

**Hecho más reciente observado:** `JOR-H9-C2-PHYSICAL-RUNNER-SAFE-20261119` = **`BLOCKED_RUNNER_POLICY`**, ZIP SHA256 **`6EED1CA6A13558303D20435A744F95F16B7ED5A3135E4639F18DA6A845F5F4B5`**. Archivo recibido y leído por ChatGPT en este chat: **9 miembros, CRC PASS, manifiesto 8/8 bytes/SHA PASS**, ningún test Android ejecutado. Causa reportada mediante lectura de fuente SDK 3.47.8: aunque `flutter drive --use-existing-app` evita reinstalar/iniciar la app, `reuseApplication` abre `AndroidDevice.getLogReader()`, que ejecuta logcat global y puede transmitir tags de otros procesos; el propio permiso del dueño prohíbe recolectar logs ajenos. Codex bloqueó **antes de instalar**, sin tocar paquetes, sin editar fuente. `RESTART_READBACK=BLOCKED_HARNESS`, `TENANT_ISOLATION` y `PRO_HTTP_DB=BLOCKED_CONTRACT`. `H9_GLOBAL=NO_GO`, `RELEASE=NO_GO`, `B22=NOT_AUTHORIZED`.

**NEXT ÚNICO V5:** ejecutar **solo** [docs/CODEX_LOTE_ACTUAL.md](CODEX_LOTE_ACTUAL.md), TASK JOR-H9-C2-PHYSICAL-DART-V5-20261120, con barreras host verificadas, QA dispositivo condicionada y ZIP único. La ruta V3 que sigue en este documento es HISTÓRICA y NO debe ejecutarse.

**SIGUE: CODEX LUNA**, una sola ejecución local, entregar ZIP único. **DESPUÉS: CHATGPT DIRECTOR** para adjudicar evidencia y continuar el cierre. No repetir C2 V2 ni versiones previas ni las auditorías 10+10 ya escritas.

## B. Identidad y fuentes realmente contrastadas

| Fuente | Corte / SHA | Qué acredita y qué NO acredita |
|---|---|---|
| `Recovery(2).md` | SHA256 `84715587A4641B5CAB5309ED635DE887E935C8BF7D89BEA91A36EB9798B4CF77`, V6 | Modo REANUDAR, 10 controles, jerarquía y permisos; no es estado del WIP |
| PDF `Auditar proyecto GitHub.pdf` | 33 páginas, SHA256 `B1D714B012A93D76BA13002CDA783DBB20FF1F3C42A08D20757D77E00966D6B3` | Historia del chat: B21F, H9-M1/F1/C2, autorización física, V2, GitHub; página 33 registra la V2, **anterior al ZIP de bloqueo por logcat** |
| ZIP C2 Runner Safe recibido | SHA256 `6EED1CA6A13558303D20435A744F95F16B7ED5A3135E4639F18DA6A845F5F4B5` | 9 miembros + 8/8 hashes+CRC; datos sobre APK/SDK/ADB; logs de Codex NO son pruebas Android ejecutadas por ChatGPT |
| Orden C2 Runner Safe V2 adjunta | SHA256 `25A1146276B9EDFD47FE7970560BD60AE6C489585562734F58E8E70E292B5FFA` | Ya auditada 10+10 y subida PR #2; **no contiene salida del último bloqueo**, por eso reemplazada como ejecutable |
| Auditoría V2 adjunta | SHA256 `8BD99F6182411AE10DE2C4CFEB6DFD8AD3570C0F0822FA112C3CB8306D2BC26B` | 20 ángulos documentales del antiguo prompt, NO 20 tests de producto; reutilizar, NO repetir |
| GitHub `sierraglobalcompany-rgb/Jornato` | Al reanudar, `main=1ee6aae821f8cf177cc64149081ad8847f7fec2e`, PR #1 `faf5fe283191f8b5a2724b397009512a2caec1b6` Draft, PR #3 `104469b119752f395cf9881e732d582feab9db4e` Draft; PR #2 docs `78088d4ffe93efbed31aa39504151da6bd7ca466` antes de la actualización de esta sesión | Fuente remota **no refleja** el worktree local de `D:\codex\Jornato` |
| Flutter API | https://api.flutter.dev/flutter/package-integration_test_integration_test_driver/integrationDriver.html ; https://api.flutter.dev/flutter/flutter_driver/FlutterDriver/connect.html | `integrationDriver()` usa `FlutterDriver.connect`, recibe VM URI por parámetro/entorno, y solicita `requestData`; **propuesta técnica, no PASS físico** |
| PingPongLaw canon | `sierraglobalcompany-rgb/PingPongLaw@84e961cadf482d234f4c0ee2ca60e8c7e9b388e8` | Seis leyes L1 KISS/Ponytail, L2 antirruido, L3 antiparches, L4 UX humana, L5 independencia/evidencia, L6 antipingpong; no instalar hooks/skills por rutina |

**RECOVERY_GAP:** el PDF concluye con orden V2 lista; el ZIP Runner Safe subido después (o no incluido al final del PDF) añade `BLOCKED_RUNNER_POLICY`. Este delta quedó conciliado. Estado posterior **en vivo del equipo Windows y si Codex ha arrancado otra tarea**: `NOT_VERIFIED`; la última entrega reporta `NEXT_OWNER=CHATGPT_DIRECTOR`. `CHATGPT_PROJECT`: no se da por leído todo historial ajeno a PDF/adjuntos. `WORKTREE_LOCAL=NOT_VERIFIED_DIRECTLY`.

## C. Decisiones y contratos no reversibles por recuperación

- **Permiso de celular:** el usuario dijo «usa el celular que esta conectado y disponible». Solo un dispositivo Android físico conectado, paquete QA nuevo con datos sintéticos; no borrar, sobrescribir, desinstalar, limpiar, rootear, reiniciar teléfono, modificar permisos globales, leer logs de otras apps ni usar los ocho AVD ajenos. Un fallo de privacidad de Flutter Tool no autoriza relajar esos límites.
- **Identidad APK:** `com.sierraglobalcompany.jornato.b14qa`, debug, `app-b14qa-debug.apk`, SHA256 `BEEA46F75B08CFA440A980BCEE4CC12E2A6B4C7B37A9457B16240C5427157593`, 112.605.171 bytes. MinSdk24, targetSdk36, actividad `MainActivity`, compilado offline con `-Ptarget=integration_test/kiosk_flow_test.dart` **según log y comprobaciones Codex**. APK bytes no adjuntos al ZIP; confirmar en disco antes de instalar. Host driver `test_driver/integration_test.dart` ya existente SHA256 `2F80A384A6D27EAFF7C355E92644A0AB171504857103A4D53579236E8ECDB05F`, test `kiosk_flow_test.dart` SHA256 `30267B4110336B479437CFFE3C31392EF67CD32DEDC684F2179EC47808BB3E30`.
- **Código y WIP:** GitHub main/PR no es el WIP avanzado. WIP informado `D:\codex\Jornato`, rama `codex/jor-b08-h4-domain-20261025`, HEAD `faf5fe283191f8b5a2724b397009512a2caec1b6`; 234 status, 0 staged; fuente sin modificaciones en último ZIP y hashes focales coincidentes. `WIP_PRESERVED=PARTIAL_EVIDENCE`: los demás untracked/ignored no se verificaron byte a byte. Un marcador temporal `.salive` Kotlin ya estaba ausente, no recrearlo. **No checkout/reset/clean/pull ni mezcla ingenua con PR #3 F0 remoto**.
- **Producto:** `requestId` exacto, no normalizar el histórico `requetId` para esconder problemas; `SERVER_STORED` no significa `RECOGNIZED`. B19/B20 DENY-ALL en producto, sin cuentas ni permisos RR. HH. sintéticos elevados a producción. No crear motor/sync/DB/autoridad duplicados. OD01–OD08 (privacidad, cuenta empleado, matriz de roles, login, ATS/CV, firma/docs, remuneración, cobros) **no aprobadas** según histórico, salvo decisión posterior comprobable. `PRO_HTTP_DB` y tenant A/B Android siguen bloqueados por contrato en este gate.

## D. Tabla de QA y trabajo previo reutilizable

| Hito | Estado preciso | No repetir |
|---|---|---|
| B21F-S3 backend | **158 tests / 2450 assertions PASS_SCOPED** reportado en ZIP Nov16 | No volver a reproducir IPAM ni MariaDB/HTTP por este QA Android |
| H9-M1 host | **75 tests host PASS** y bootstrap normal Laravel PASS; Flutter Analyze PASS (según logs) | No rerun sin cambio relacionado |
| F1 visual | Test widget folio **PASS_FOCAL** | No reabrir bug visual |
| C2 readiness | Instrumentación SQLCipher, Keystore, idempotencia y corrupción escrita/analyze PASS | **WRITTEN_NOT_RUN** en Android |
| C2 físico inicial | APK QA compilado offline, paquete ausente; Flutter `test` runner reemplaza/desinstala | `BLOCKED_RUNNER_SIDE_EFFECT`, no usar ese runner |
| C2 Runner Safe (último ZIP) | APK existente, paquetes ausentes, driver host estándar y Flutter reuse verificados; lector logcat no PID-only | **`BLOCKED_RUNNER_POLICY`**; no instalar ni ejecutar aún |
| C2 directo Dart (NEXT) | Driver directo + VM_SERVICE_URL + logcat PID-only en dispositivo | `PLANNED_NOT_RUN`: ejecutar solo si SDK local confirma ruta sin lectura ajena |
| Reinicio proceso Android | No hay harness 2 fases probado | `BLOCKED_HARNESS`; `close/open` no acredita restart |
| Tenant y Pro HTTP/DB | Faltan cuentas/roles/contratos QA autorizados | `BLOCKED_CONTRACT` |
| B22 / lanzamiento | No autorizado | NO merge, release ni deploy; H9 global NO_GO |

## E. Bloqueo exacto y ruta de desatasco

**Bloqueo anterior:** `flutter test` usa `adb install -t -r` y teardown uninstall; no permitido. **Bloqueo nuevo:** `flutter drive --use-existing-app` no instala, pero su Flutter Tool crea lector Android `adb logcat -v time` de alcance global. **Solución diferencial:** no llamar Flutter Tool; invocar host Dart `integrationDriver()` desde `dart run test_driver/integration_test.dart` con `VM_SERVICE_URL` construida desde el PID objetivo y `adb forward` propio; `FlutterDriver.connect()` no necesita que Flutter Tool cree el lector global. Para obtener la URL, leer **solo** `adb shell logcat --pid=PID -d` en el dispositivo. Si el SDK/Android no permite URI PID-only, registrar bloqueo sin tocar datos ni inventar PASS. El comando Dart directo y la validación de permisos están completamente definidos en la orden ejecutable.

**No asumir éxito:** fuente API evidencia mecanismo conceptual; no se ejecutó el driver directo ni se accedió físicamente al teléfono desde ChatGPT. Un `APP INSTALLED`, `VM CONNECTED` o `cipher_version` no certifica los cuatro controles nativos. Acreditar cada test y APK SHA. En caso de bug real corregir solo clase propietaria y test vecino, sin reinstalar en el mismo lote.

## F. Evidencias, incertidumbres y errores documentales detectados

- `VERIFICADO_DIRECTO`: SHA/CRC/manifiesto de ZIP C2 Runner Safe, 9 nombres, hashes de archivos y contenido de logs; PDF 33 páginas y SHA; Markdown y estado GitHub consultado en esta sesión.
- `REPORTADO_RUNTIME`: comandos ADB, hashes locales del APK/SDK, paquetes ausentes, no invasión del teléfono, 234 status/índice estable; están documentados por Codex, **no fueron reproducidos por ChatGPT**.
- `INFERIDO_PROPUESTA`: driver Dart directo evita el lector específico de Flutter Tool; depende de que el SDK real permita conexión con URL de VM Service obtenida sin logcat ajeno.
- `EN_CONFLICTO_DOCUMENTAL`: `FINAL_REPORT.md` del último ZIP incluye **interpolaciones literales sin resolver** (`$branch`, `$head`, bloques `$(...)` con Git status completo). El log `logs/p0_checkout_artifact.txt` y los CSV son fuentes más fiables para branch/HEAD. No interpretar estas plantillas como resultado ya ejecutado ni repetirlas en nuevas evidencias.
- `NO_VERIFICADO`: APK binario (no está dentro del ZIP), el estado real de datos del móvil, el WIP Windows en vivo, a quién corresponde el permiso de cuentas/roles Pro y si el nuevo camino Dart funciona en teléfono.

## G. Continuidad ejecutable, criterio final y responsable

1. Releer **solo** este Handoff + `docs/CODEX_LOTE_ACTUAL.md` + ZIP si hay discrepancia material. GitHub PR #2 es **documental**, main/PR1/PR3 no contienen el árbol avanzado. No reauditar PingPongLaw/H9-M1/F1/C2 ni repetir suites históricas.
2. Codex hace preflight de paquetes ausentes, APK y runner directo, logs PID-only y driver Dart. Si seguro, una instalación QA no reemplazable, una conexión/resultado nativo, ZIP único. Si falla, registra exactamente qué falta; no intenta cambiar SDK ni instalar con -r.
3. Después del ZIP, ChatGPT Director evalúa CIPHER_ENGINE, KEYSTORE_EFFECTIVE, IDEMPOTENCY_NATIVE, CORRUPTION_FAIL_CLOSED y reinicio; define corrección causal si hay FAIL, y **luego** requisitos independientes de H9: QA dispositivo, tenant, Pro, web, accesibilidad, UAT, decisiones OD y L5 independiente. No adelantar B22 sin GO por cada puerta.
4. `NEXT=CODEX_LUNA_JOR_H9_C2_PHYSICAL_DART_V5_20261120`; `OWNER_AFTER_ZIP=CHATGPT_DIRECTOR`; `FIN_DE_GATE=RESULTADOS_NATIVOS_ATRIBUIBLES_A_APK_O_BLOQUEO_TECNICO_ESPECIFICO`; `RELEASE=NO_GO`.

## H. Adjuntos y diez controles Recovery V6

**Archivos para nuevo chat:** este Handoff, último ZIP de Codex, y **solo si hay que reejecutar localmente** el Markdown Codex C2 Dart Directo. PDF de chat anterior se revisó íntegramente en su texto y se visualizaron páginas relevantes, especialmente páginas 27–33 que documentan C2, permiso físico y la V2 publicada. No es necesario generar segundo ZIP con los mismos adjuntos. No reenviar V2 Runner Safe ya desactualizado ni auditoría 10+10 porque está conservada.

| Control | Estado | Verificación/limitación |
|---|---|---|
| P01 identidad | PASS | Jornato y lanzamiento definidos |
| P02 recovery gap | PASS acotado | PDF → V2 → último ZIP bloqueo SDK reconciliados |
| P03 evidencia/recencia | PASS | Fuentes directas/reportadas/inferidas separadas |
| P04 Git/WIP | PASS documental | Ref remoto comprobado; PC Windows no accedido |
| P05 KISS/ruido | PASS | Driver Dart existente, sin segundo framework |
| P06 causa raíz | PASS documental | Lector global del Flutter Tool identificado, solución evita ruta |
| P07 diseño | NO_APLICA en C2 | No UI rediseñada; UX H9 pendiente |
| P08 pruebas/permisos | PASS documental | SHA ZIP, permisos acotados, tests nativos NO_RUN |
| P09 no pingpong | PASS | Único lote residual; viejo V2 desactivado |
| P10 simular relevo | PASS documental | NEXT, rutas, normas, gate de cierre y dueño inequívocos |

```text
MODO=REANUDAR+ACTUALIZAR_POR_DELTA
RECUPERACION=SUFICIENTE_DOCUMENTAL
FUENTE_ULTIMA=JOR-H9-C2-PHYSICAL-RUNNER-SAFE-20261119-UNICO.zip
ULTIMO_RESULT=BLOCKED_RUNNER_POLICY
ULTIMO_ZIP_SHA256=6EED1CA6A13558303D20435A744F95F16B7ED5A3135E4639F18DA6A845F5F4B5
APK_SHA256_REPORTED=BEEA46F75B08CFA440A980BCEE4CC12E2A6B4C7B37A9457B16240C5427157593
ANDROID_QA=NOT_RUN
NEXT=CODEX_LUNA_JOR_H9_C2_PHYSICAL_DART_DIRECT_20261120
H9_GLOBAL=NO_GO
B22=NOT_AUTHORIZED
RELEASE=NO_GO
```
