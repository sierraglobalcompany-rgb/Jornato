# JORNATO — DICTAMEN DIRECTIVO DELTA V4→V5, 10 VERDUGO + 10 JUEZ, RUTA DE FINALIZACIÓN

**Corte:** 20-11-2026, Colombia, mañana. **Alcance:** auditoría adversarial **del prompt V4 y de la decisión de ejecutar C2**, no nueva auditoría de producto, runner antiguo ni B21. **Fuentes:** V4 entregada SHA256 `6456927e3f5925300eba5443e659a453d9849487bb4f56c1df27b7a0c5f68730`, auditoría previa SHA256 `6944d0e694e876df6b57d014a103ea53358eddd0b82b6979ad201bbc94986056`, Handoff/Complemento aportados, PR #2 remoto, PR #3 y **fuente oficial Flutter `3.47.8` consultada directamente en GitHub**. **No** se ha accedido al WIP Windows, al APK, al teléfono ni al último ZIP; no se han ejecutado pruebas Android/Pro. Los estados reportados por Codex no equivalen a observación independiente.

## Dictamen en 30 segundos

**DECISIÓN:** V4 tiene buena dirección KISS, pero un microadaptador más cerrado y una ejecución con custodia y privacidad explícitas reducen riesgo y repeticiones. **Orden final propuesta V5**: `CODEX_JORNATO_C2_V5_MACROBLOQUE_EJECUCION_UNICA_20261120.md`; reemplaza V3/V4, un solo Codex, un solo ZIP, C2 físico condicionado y reporte de WIP metadata sin más auditorías. **No se autoriza** merge, publicación de WIP privado al repo público, B22 ni release. Tras evidencia física: Dirección evalúa, no otra ronda 10+10 por inercia.

**Estado histórico reutilizable:** Runner Safe `BLOCKED_RUNNER_POLICY` por logcat global de Flutter Tool; APK debug de 112.605.171 bytes SHA256 reportado `BEEA46F75B08CFA440A980BCEE4CC12E2A6B4C7B37A9457B16240C5427157593`, sin bytes aquí. Android SQLCipher/Keystore/idempotencia/corrupción `NOT_RUN` físico; reinicio `BLOCKED_HARNESS`; Android tenant/Pro `BLOCKED_CONTRACT`. Backend B21F-S3 `158/2450 PASS_SCOPED`, H9-M1 `75 PASS`, F1 widget `PASS_FOCAL` según informes anteriores: **NO** repetir sin cambio causal. `H9_GLOBAL=NO_GO`, `B22=NOT_AUTHORIZED`, `RELEASE=NO_GO`.

## 1. GitHub: frontera de evidencia

- Repositorio público: https://github.com/sierraglobalcompany-rgb/Jornato . `main=1ee6aae821f8cf177cc64149081ad8847f7fec2e` al consultar; PR [#1](https://github.com/sierraglobalcompany-rgb/Jornato/pull/1) `OPEN/DRAFT` HEAD `faf5fe283191f8b5a2724b397009512a2caec1b6`; PR [#2](https://github.com/sierraglobalcompany-rgb/Jornato/pull/2) `OPEN/DRAFT` HEAD anterior a esta actualización `d1443c358afd4d2fefdc5419e04fdf3d96c6e883`; PR [#3](https://github.com/sierraglobalcompany-rgb/Jornato/pull/3) `OPEN/DRAFT`, HEAD `104469b119752f395cf9881e732d582feab9db4e`, base apilada en PR1. **No se ha probado que el WIP Windows avanzado esté en GitHub.**
- Antes de esta corrección, `docs/CODEX_LOTE_ACTUAL.md` del PR2 seguía en **V3**, blob `3c6576ea5cbe2d49e283a2c59b96c81e2b1fd3bf`. V4 entregada no se había subido: riesgo real de órdenes divergentes. El PR2 incluye además herramientas/scripts, no únicamente documentación Markdown.
- **Hallazgo nuevo de economía de trabajo:** `tools/JORNATO_CONCILIAR_WIP_GITHUB_SIN_CODEX.py` y su guía del PR2 tienen referencia fija de PR3 `78b32284c207f2d04a4c5b6cb3c21ebb470eb46d`, no HEAD PR3 `104469b...`; usarla ahora como comparación actual sería erróneo. No reescribir el puente en C2 ni inferir ausencia de módulos por nombre.
- El GitHub público NO prueba 234 entradas de status, APK, paquete en dispositivo, pruebas nativas ni backups reales. Codex verifica localmente una sola vez, con reporte sanitizado.

## 2. Evidencia técnica exacta, Flutter tag `3.47.8`

Se inspeccionaron por GitHub los archivos oficiales del tag `3.47.8` (código, no suposiciones de versiones nuevas):

1. `packages/integration_test/lib/integration_test_driver.dart` blob `1ffa46a7db1068d3bbfda5a7bc82787046576f11`: `integrationDriver({timeout, responseDataCallback=writeResponseData})`; llama `FlutterDriver.connect()`, luego `driver.requestData(null)`, imprime éxito o detalles de fallo, `exit(0/1)`. `responseDataCallback: null` **desactiva deliberadamente** el guardado de `integration_response_data.json` sin alterar requestData/oráculos. La V4 deja el callback por defecto, aunque `fs` de memoria reduce su escritura a disco.
2. `packages/flutter_driver/lib/src/driver/common.dart` blob `7ad0f4b0f0efca038b61fe473a9064fb67731a86`: `useMemoryFileSystemForTesting()` asigna `fs = MemoryFileSystem()`. Es la barrera contra archivos de comandos si comparten el mismo `fs`; verificar el SDK local, no asumir versión idéntica.
3. `packages/flutter_driver/lib/src/driver/vmservice_driver.dart` blob `e8890f0d87d19c29d06202432579ea04bbf523cb`: `logCommunicationToFile=true` predeterminado y `_log('Connecting to Flutter application at ...')`; riesgo de logger/URI si no se neutraliza antes de conectar.
4. `packages/flutter_driver/lib/flutter_driver.dart` exporta `src/driver/common.dart` (blob `dc6e1288a40a14b186a01275f2ca2ed51d878f59`). La ruta del microadaptador V5 es plausible; no se ha compilado en el Windows real.

**Distinción importante:** V4 no se declara «exfiltración comprobada». Su hook `MemoryFileSystem` podría impedir el archivo predeterminado en esa versión; **V5 elimina también el callback, controla salida de error y obliga a verificar equivalencia del driver host**, reduciendo estados sin prueba. No es una justificación para sustituir Flutter o volver al runner global.

## 3. VERDUGO — DIEZ PASADAS NO REPETIDAS SOBRE V4

| Pasada | Qué inspeccioné/contrasté | Ataque adversarial y evidencia | Reparación V5 / calificación |
|---|---|---|---|
| **V01** | V4 entregada contra `docs/CODEX_LOTE_ACTUAL.md` remoto. | Remote aún dice V3: Codex podría recibir dos órdenes distintas. No es defecto de runner viejo, es **inconsistencia de autoridad documental**. | Una sola orden canónica V5, marcar V3/V4 superadas, conservar history; **ALTA**. |
| **V02** | Fuente del tag Flutter 3.47.8 `integration_test_driver.dart`. | `writeResponseData` activo por defecto; V4 depende de hook global para que no quede disco. | Pasar `responseDataCallback: null`, mantener memoria; no modificar `requestData`, **MEDIA**. |
| **V03** | Código de conexión y `common.dart` Flutter 3.47.8. | La URI privada y los comandos pueden salir por logger/archivo si setup llega después; V4 lo evita conceptualmente pero no verifica equivalencia local. | Confirmar firmas y ejecutar **tres barreras ANTES** de connect, **ALTA**. |
| **V04** | Ruta de error en `integrationDriver()`. | `Failure Details` se imprime a stdout; en fallo puede haber datos de test. V4 pide redacción, pero no especifica supervisor que no cree un raw transitorio. | Buffer en memoria, redacción PRE-persistencia, timeout, sin transcript, **ALTA**. |
| **V05** | Driver original vs archivo temporal V4. | Ejecutar otro `main()` cambia el host; si el original tiene callbacks propios, se pierde paridad aunque use `integrationDriver`. | Comprobar que el host original sea `main=>integrationDriver()` sin extras; si no, STOP `BLOCKED_DRIVER_PARITY`, **ALTA**. |
| **V06** | CLI Dart offline vs `--packages` propuesto. | Bandera/CLI podrían diferir en SDK local; una ejecución con pub implícito toca cache/WIP/red. | Preflight help y package config, correr Dart VM directamente o BLOCKED_OFFLINE_HOST; no rutas alternativas en bucle, **MEDIA**. |
| **V07** | SHA del APK en docs vs artefacto disponible. | Hash reportado por Codex no ha sido recalculado aquí; no demuestra que binario siga en Windows, package ni target correcto. | Verificación local SHA/bytes/firma/manifest/entrypoint antes de ADB, **ALTA**. |
| **V08** | `logcat --pid`, serial, fecha/instalación. | Paquete que antes no existía puede haber aparecido; el filtro host no equivale al filtro del dispositivo; UID puede tener otros procesos. | Ausencia en perfiles justo antes, `adb shell logcat --pid`, PID estable, un install, cero fallback, **ALTA**. |
| **V09** | Riesgo de trabajo estancado por bloqueo C2. | V4 solo devuelve BLOCKED+ZIP, sin preparar la integración independiente; puede provocar otra vuelta directiva sin avance. | Añadir una matriz metadata WIP/Git de una página reutilizando preflight, SIN escaneo masivo ni push, **MEDIA**. |
| **V10** | Herramienta de puente en PR2 contra PR3 actual. | La comparación publicada usa SHA PR3 antiguo. Ejecutarla «para cerrar Git» crea falsa conciliación y decisiones equivocadas. | Registrar obsolescencia del puntero y reservar reparación focal para integración futura; **ALTA**. |

**Fallo verdugo:** 10/10 perspectivas nuevas; bloqueos causales que sí mueven la decisión: V01, V02, V04, V05 y V10. Los otros refuerzan condiciones, **no reabren pruebas ya aprobadas**. Sin 10 pruebas físicas nuevas ni reauditoría de B21.

## 4. JUEZ — DIEZ CONTRAPRUEBAS DE ECONOMÍA/SEGURIDAD

| Pasada | Hipótesis opuesta enfrentada | Justificación adversarial | Decisión |
|---|---|---|---|
| **J01** | Dejar V4 vigente y solo explicarlo en el chat. | GitHub seguiría con V3; recuperación futura ejecutaría lo incorrecto. | **RECHAZAR**. Publicar UNA autoridad. |
| **J02** | Eliminar `useMemoryFileSystemForTesting()` porque ahora hay `responseDataCallback:null`. | El callback solo apaga response JSON, NO el log de comandos por defecto en `FlutterDriver.connect`. | **RECHAZAR**. Mantener ambas barreras. |
| **J03** | Guardar primero stdout/stderr y borrar el archivo tras sanear. | Borrado posterior no revierte divulgación ya escrita a disco. | **RECHAZAR**. Sanear RAM antes de persistencia. |
| **J04** | Reescribir FlutterDriver para inyectar `logCommunicationToFile=false`. | Cambiar SDK o vendor es complejidad y riesgo; hooks existentes bastan en SDK documentado. | **RECHAZAR**. Microadaptador host de 8 líneas. |
| **J05** | Suprimir todos los datos de retorno y aprobar 4 PASS por `exit=0`. | El callback nulo no quita los asserts de test, pero `exit0` sin identidad de suite/oráculos no identifica 4 gates. | **RECHAZAR PASS automático**. Cruzar hashes, test fuente, ejecución y oráculos. |
| **J06** | Ejecutar puente de WIP PR3 ya publicado. | HEAD de referencia incrustado es antiguo. Un falso `NOT_FOUND` o `DIFFERENT` puede inducir merge destructivo. | **RECHAZAR** ejecución como fuente actual; solo anotación. |
| **J07** | Publicar el WIP privado directamente en GitHub público para preservar avance. | 234 cambios reportados, untracked/ignored, posible información privada; riesgo irreversible. | **RECHAZAR**. Custodia recuperable y revisión antes de push. |
| **J08** | Pedir al propietario que haga QA por su cuenta. | Hay autorización acotada para Codex usar un celular; propietario ya indicó no poder hacer QA local. | **RECHAZAR**. Codex ejecuta si gates seguros. |
| **J09** | Un macrobloque debe también realizar merge, Pro, web, RR. HH. y publicar. | Rompe el perímetro de C2, necesita decisiones OD y fixtures; mezcla cambios de muchos dominios. | **RECHAZAR**. Macrobloque grande pero coherente: C2 + continuidad metadata. |
| **J10** | Esperar otra auditoría 10+10 antes de Codex. | Ya existe verificación de fuente exacta y una orden focal; nueva ronda no aporta prueba nativa. | **RECHAZAR**. Ir a Codex una vez, luego evaluar ZIP. |

**Fallo juez:** la decisión menos riesgosa que realmente avanza es `C2 V5` — adaptador host con **tres barreras**, preflight offline local, un teléfono, prueba atribuible, un ZIP y breve matriz de continuidad WIP. Se conserva STOP determinista. **No** pruebas reiteradas, nuevas dependencias, SDK modificado, framework nuevo ni patch sobre app.

## 5. Leyes PingPongLaw — certificación de diseño, NO de release

1. **L1 KISS/Ponytail:** mismo APK, driver oficial, mínimo adaptador host y una autoridad para cada documento. `CUMPLE_EN_PLAN`, dispositivo pendiente.
2. **L2 Antirruido:** backend 158/2450, host 75, F1 y anteriores 10+10 se reutilizan. `CUMPLE_EN_PLAN`.
3. **L3 Causa raíz:** impedir logs privados **antes** de conectar; sin cambiar Flutter Tool ni ocultar fallos. `CUMPLE_EN_PLAN`, runtime pendiente.
4. **L4 Diseño humano:** no modificar UX en C2; kiosco, empleado, portal y accesibilidad siguen gate de aceptación. `PENDIENTE_RELEASE`.
5. **L5 Verificación independiente:** GitHub fuente oficial inspeccionada; Android nuevo no probado. `PARCIAL/NO_GO`.
6. **L6 Antiping-pong:** una V5 canónica + un ZIP + vuelta a Director, sin nueva ronda de prompts por bloqueos hipotéticos. `CUMPLE_SI_EJECUTADO`.

Canon de referencia: https://github.com/sierraglobalcompany-rgb/PingPongLaw/blob/84e961cadf482d234f4c0ee2ca60e8c7e9b388e8/docs/engineering/LEYES_IMPLEMENTACION_1_A_6.md . **Seis leyes, no nueve**.

## 6. Ruta mínima hacia el producto terminable

| Orden | Puerta y dueño | Evidencia para cerrar, sin repetir | STOP |
|---|---|---|---|
| **P0 AHORA** | Codex — C2 físico V5, privacidad + 4 oráculos | ZIP único con PASS atribuibles o causa concreta, APK SHA, WIP PRE/POST y sanitización. | Sin instalar si riesgo host/paquete; NO usar Flutter Tool. |
| **P1** | Director decide tras P0 — persistencia, kiosco offline | Reinicio de proceso **real** y readback del mismo marcador; UX/kiosco y fallos en equipo, por build exacto. | No confundir `close/open` con restart; no reabrir H9-M1 sin cambio. |
| **P2** | Codex en lote autorizado — custodia e integración local | Respaldo recuperable con untracked; revisión de secretos; comparación con PR3 **HEAD actual**, integración sin dos motores y test diferencial. | No publicar WIP ni fusionar a ciegas; GitHub público. |
| **P3** | Director/propietario + Codex — Pro, web, RR. HH. | Resolver únicamente OD dependientes, roles/cuentas QA autorizados, outbox e idempotencia E2E, tenant A/B, PAT y portal. | No inventar contratos ni repetir backend 158/2450 si idéntico. |
| **P4** | QA independiente + propietario — candidato y lanzamiento | APK firmado/candidato, HTTP/DB/web/Android E2E, UAT/seguridad/migraciones y GO por escrito. | `H9_GLOBAL=NO_GO`, `B22=NOT_AUTHORIZED` hasta GO. |

**Criterio anti-ping-pong:** cada puerta se cierra con evidencia por SHA y dueño, sin porcentaje ficticio ni reevaluación ritual de gates previos. No prometer fecha de lanzamiento sin observar WIP real y contratos OD. Se mantiene un solo producto, sin descargas externas obligatorias para el usuario final como criterio de diseño del release; la QA host no es el packaging final.

## 7. Continuidad canónica

- **Orden Codex:** [docs/CODEX_LOTE_ACTUAL.md](CODEX_LOTE_ACTUAL.md), que debe contener V5 tras actualización de PR2; las V3/V4 quedan históricas, no ejecutables.
- **Estado:** [docs/JORNATO_CONTINUIDAD.md](JORNATO_CONTINUIDAD.md), [docs/JORNATO_RECOVERY_HANDOFF_ACTUAL.md](JORNATO_RECOVERY_HANDOFF_ACTUAL.md). Estas fuentes NO reemplazan inspección del WIP Windows.
- **GitHub:** las referencias anteriores fueron observadas antes de las nuevas publicaciones de esta auditoría; actualizar el HEAD PR2 en la respuesta final tras verificar. Ningún push de código producto, merge ni deploy.
- **Señal de turno:** `NEXT_OWNER=CODEX_LUNA_IF_NO_NEWER_RUN`; después del ZIP `CHATGPT_DIRECTOR`. Si Codex ya ejecutó C2 V3/V4, primero evaluar ese ZIP, **no** instalar otra vez.

# 🔴🚨 SIGUE CODEX LUNA — ORDEN V5, UN SOLO ZIP. DESPUÉS CHATGPT DIRECTOR. 🚨🔴