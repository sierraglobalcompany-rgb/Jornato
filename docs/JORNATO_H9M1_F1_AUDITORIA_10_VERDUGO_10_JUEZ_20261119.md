# JORNATO — AUDITORÍA ADVERSARIAL F1 · 10 VERDUGO + 10 JUEZ · SIN REPETIR H9-M1

**Fecha:** 19 de noviembre de 2026, Colombia. **Objeto exacto:** `CODEX_JORNATO_H9M1_F1_CIERRE_FOCAL_POST_ZIP_20261119.md` (90 líneas, 12.966 bytes antes de esta revisión). No es la auditoría histórica de H9-M1 V2 realizada el mismo día. **Salida única:** `CODEX_JORNATO_H9M1_F1_V2_VERDUGO10_JUEZ10_20261119.md`; misma tarea `JOR-H9-M1-F1-VISUAL-NATIVE-SCOPE-20261119`, sin crear fases.

**Método:** 20 pasadas **documentales** distintas sobre esta **orden nueva**; se contrasta la promesa de cada instrucción con (i) ZIP real H9-M1, (ii) estado GitHub remoto y canon PingPongLaw vigente ya verificado, (iii) documentación oficial Flutter de scroll/visibilidad. Las pasadas fueron realizadas por ChatGPT en dos roles adversariales. **NO** son veinte ejecuciones de Flutter, auditor independiente externo o verificación física de Windows. Codex no debe repetirlas. Las 10+10 del prompt H9-M1 anterior ya están registradas en otro documento y quedan cerradas.

## Cadena de evidencia mínima, verificada antes de decidir

- ZIP `JOR-H9-M1-REACTIVADO-20261119-UNICO.zip`: SHA-256 `571f0b288f8b582797af4043417a2a1b44935b60d649f592172751f402d9a0b6`; 16 archivos, CRC OK y 15/15 hashes/tamaños del manifiesto válidos. **No** incluye WIP completo, APK ni base de datos.
- `LOGS/widget-test-failure.txt`: caso `personal session exposes request submission and its server folio`, warning Flutter `tap(ExpansionTile)` centro `(400,647)` fuera de viewport `800×600`, line 153; folio faltante line 155; suite `+78 -1`, exit 1. **Es una hipótesis causal fuerte de prueba, no una validación del negocio ni del servicio HTTP.**
- `LOGS/flutter-host-tests-final.txt`: 75 tests host PASS según logs; `LOGS/flutter-analyze-after-fix.txt` PASS; Laravel boot `portal.error` PASS; APK `productDebug` built-not-installed SHA `59522127...FB5233C3D`. SQLCipher/Keystore Android no ejecutado; Pro HTTP/DB sin autorización.
- `WIP_PRE_POST.csv`: HEAD histórico `faf5fe283191f8b5a2724b397009512a2caec1b6`, staged 0, 235 entradas, índice PRE=POST; **untracked `personal_models.dart` sí cambió un byte** (paréntesis). `test/widget_test.dart` no cambió según su SHA. No inferir integridad de untracked por `git status`.
- `RESULTS.csv` tiene campos `sha256` ambiguos que no son necesariamente hashes de los logs indicados; `MANIFEST_SHA256.csv` sí coteja bytes/hashes dentro del ZIP. La nueva orden separa `log_sha256`, `source_sha256` y `artifact_sha256`.
- GitHub (antes de la actualización documental de esta auditoría): `main=1ee6aae821f8cf177cc64149081ad8847f7fec2e`, PR #3 F0 Draft `104469b119752f395cf9881e732d582feab9db4e`, PR #2 Draft `df8ba870d656631ce61541562f9d737d58817632`. Remote F0 **no sustituye** WIP. Las 119 pruebas F0 + 31 checks Dart están escritas pero `NOT_RUN` en el remoto.
- Flutter oficial: [`WidgetController.ensureVisible`](https://api.flutter.dev/flutter/flutter_test/WidgetController/ensureVisible.html) requiere elemento construido; [`scrollUntilVisible`](https://api.flutter.dev/flutter/flutter_test/WidgetController/scrollUntilVisible.html) permite desplazamiento repetido en `Scrollable`, con límite. No copiar un snippet que presupone un widget lazy ya construido.

## I. Verdugo — 10 pasadas de ataque al encargo F1 (cada una: prueba, fallo, corrección)

| # | Ataque realizado y fuente contrastada | Hallazgo / riesgo real | Corrección vinculante en V2 |
|---|---|---|---|
| **V01** | Cotejé el F1 con el ZIP y la auditoría anterior H9-M1 | La orden podía reabrir QA histórica y meter una segunda iteración H9. | Mantener misma TASK F1 y separar evidencia `REUSED` de tests efectivamente ejecutados. Prohibir repetir H9-M1, 75 host y 158 backend por ritual. |
| **V02** | Crucé el WIP reportado y su `status` con `WIP_PRE_POST.csv` | Untracked editado no se refleja en el conteo Git; riesgo de sobrescribir bytes ajenos. | PRE/POST SHA-256 y copia de bytes **solo de objetivo**, delta propio, no `git diff` vacío para untracked. |
| **V03** | Contrasté stacktrace con premisa “es solo scrolling” | Warning fuera de viewport está demostrado; éxito de envío no está demostrado solo con ese log. | Reproducir focal, verificar identidad solicitud/folio y transporte de test antes de declarar causa exclusivamente visual. |
| **V04** | Examiné la propuesta `ensureVisible(ExpansionTile)` vs API oficial Flutter | Finder puede apuntar a otra tarjeta; en listas lazy `ensureVisible` falla si el elemento no se construyó. | Finder único de solicitud, `ensureVisible` para construido y `scrollUntilVisible` acotado/scrollable correcto para lazy; no hardcodear UUID del log. |
| **V05** | Evalué `pumpAndSettle` frente a animaciones y timers | Un `pumpAndSettle` indiscriminado puede demorar o fallar con animaciones periódicas; máscara de test. | Bombeo proporcional/acotado, registrar que gesto alcanzó tile; conservar aserción exacta del folio y exit 0. |
| **V06** | Cuestioné el alcance de `SQLCipher=PASS` al ver `NATIVE_GATE_NOT_RUN` | Presencia de `PRAGMA cipher_version` no prueba custodia real de clave Keystore ni persistencia tras proceso. | Evidencia nativa **por seis subgates**: motor cipher, clave, readback, idempotencia, aislamiento y corrupción, todos diferenciados. |
| **V07** | Contrasté `adb list-only` y APK sin instalar | ADB `AUTHORIZED` no equivale a permiso para usar teléfono físico; APK built no significa instalado ni funcional. | Selección explícita de un AVD propio desechable, sin instalación/ADB en físico, ni nuevos SDK y sin PASS host como nativo. |
| **V08** | Verifiqué bloqueo QA Pro y error histórico `requetId` | Si Codex improvisa credenciales/roles, podría acceder a datos o falsificar idempotencia; normalización no borra B14. | HTTP/DB sólo con QA sintética preautorizada; si no, `BLOCKED_CONTRACT`; conservar nombre `requestId` exacto sin workaround. |
| **V09** | Crucé `RESULTS.csv`, logs y manifiesto del ZIP | Un único campo `sha256` puede apuntar a input y no al log, haciendo inverificable un PASS. | Columnas `source_sha256`, `log_sha256`, `artifact_sha256`; hashes reales, manifest excluye sí mismo, CRC, sin secretos. |
| **V10** | Revisé semántica `PASS_SCOPED` / `PARTIAL` / `NOT_RUN` del prompt | Podía haber aprobación visual con prueba nativa fallida y una etiqueta global optimista. | `PASS_SCOPED` sólo si C1 pasa y no hay FAIL nuevo; fallo nativo observado fuerza PARTIAL; H9/release siempre NO_GO. |

**Conclusión verdugo:** F1 tenía un objetivo correcto, pero faltaban oráculos para evitar aprobar erróneamente la UI, el cifrado o los hashes. No se necesita otra arquitectura.

## II. Juez — 10 pasadas de contraste adversarial de la corrección (cada una: objeción, evidencia, fallo judicial)

| # | Objeción alternativa sometida a examen | Por qué sería razonable | Dictamen y justificación final |
|---|---|---|---|
| **J01** | “Volver a ejecutar 75 host y backend para tranquilidad” | Aporta confianza si el código cambió. | **Rechazar por defecto.** Resultados existentes identificados; reejecutar solo consumidores del delta si realmente fueron tocados. Menos costo, seguridad intacta. |
| **J02** | “Agrandar la ventana del widget test a 1200px” | Puede hacer desaparecer el warning. | **Rechazar.** Oculta la necesidad real de desplazamiento en una pantalla normal; mantener viewport y un scroll humano. |
| **J03** | “Siempre usar `ensureVisible` antes del tap” | API estándar, cambio pequeño. | **Rechazar universalidad.** Sirve si el elemento existe; en listas perezosas usar búsqueda acotada con `scrollUntilVisible` sobre el scrollable real. |
| **J04** | “Modificar `personal_screen.dart` inmediatamente” | El folio podría no pintarse correctamente. | **Aplazar a evidencia.** Primer gate comprueba interacción y estado fake; editar producción solo si el defecto persiste **tras** gesto válido. |
| **J05** | “Borrar/sustituir `widget_test.dart` untracked y guardar uno limpio” | Acelera una prueba focal. | **Rechazar.** SHA y bytes del WIP deben preservarse. Reparar diff mínimo sobre archivo objetivo con PRE/POST, sin stage ni reset. |
| **J06** | “Descargar emulador/SDK o reutilizar teléfono ADB” | Podría cerrar SQLCipher hoy. | **Rechazar sin permisos.** F1 permite solo AVD existente, aislado y propio; el dispositivo físico no está autorizado, un subgate bloqueado no bloquea C1. |
| **J07** | “Dar PASS a SQLCipher solo por `cipher_version`” | Confirma librería en algunos drivers. | **Rechazar.** Faltan Keystore real, persistencia, clave incorrecta, reinicio y aislamiento. Evidencia múltiple proporcional al riesgo. |
| **J08** | “Abrir Pro con credencial provisional” | Prueba transporte/ACK perdido. | **Rechazar.** OD02/OD04 y autorización técnica no se inventan; host ya probado. `BLOCKED_CONTRACT` no es fracaso del lote. |
| **J09** | “Crear diez pruebas nuevas para evitar otro error” | Aumenta cobertura general. | **Rechazar.** Reutilizar test visual exacto; añadir prueba nueva únicamente ante un bug de producto demostrado sin regresión vigente. |
| **J10** | “Cerrar F1 como GO de H9 si widget pasa” | Quedaría resuelto el único FAIL visible. | **Rechazar.** Android nativo/Pro y decisiones humanas siguen pendientes. F1 es cierre focal y H9/release continúan NO_GO. |

**Conclusión juez:** la solución más simple suficiente es **corregir la interacción de un test, verificar su contrato original y realizar solamente QA nativa realmente autorizada**. El juez descartó las alternativas de mayor costo o menor evidencia. No se ha certificado la implementación local por revisar instrucciones.

## Decisiones, límites y continuidad

1. **UNICA ORDEN SIGUIENTE:** `docs/CODEX_LOTE_ACTUAL.md` en PR #2, con TASK F1 y versión V2. Esta auditoría permanece como documento histórico, **no nueva tarea de Codex**.
2. **No modificar** `main`, PR #1, PR #3, WIP local de Windows ni emplear Actions desde ChatGPT. Codex podrá modificar únicamente delta focal y traer ZIP de evidencias.
3. **No pedirle pruebas al propietario**. `NEXT_OWNER=CODEX_LUNA`; tras el próximo ZIP `CHATGPT_DIRECTOR`.
4. **Estado final del producto antes de Codex F1:** `H9=NO_GO`, `B22=NOT_AUTHORIZED`, `RELEASE=NO_GO`. La auditoría 20/20 es del prompt, no de los tests.

**Fin del control adversarial documental de F1. No repetirlo como un bloque autónomo.**
