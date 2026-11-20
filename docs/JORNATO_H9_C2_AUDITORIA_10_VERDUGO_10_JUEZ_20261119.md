# JORNATO — AUDITORÍA ADVERSARIAL DE LA DECISIÓN C2 · 10 VERDUGO + 10 JUEZ

**Fecha:** 19 de noviembre de 2026 (Colombia). **Objeto nuevo y único:** la **decisión posterior a la entrega F1** de pasar a SQLCipher/Android Keystore nativo; incluye la alternativa de crear/emular un AVD, el límite de autorización y la utilidad de una orden operativa sin dispositivo. **NO** reabre la auditoría H9-M1 de 20 pasadas, la auditoría F1 de 20 pasadas, el test visual, la suite host 75 ni B21F-S3.

**Método:** 20 contrastes documentales de ChatGPT en dos roles, primero ataque como verdugo (V01–V10) y después objeción a cada decisión como juez (J01–J10). Fuentes: ZIP real F1 con CRC y `FINAL_REPORT.md`, `BLOCKERS.md`, `RESULTS.csv`, `WIP_PRE_POST.csv`, `LOGS/native-environment.txt` y `LOGS/native-adapter-evidence.txt`; prompt F1 V2 **ya ejecutado**, checkpoint y PR GitHub actuales; canon L1–L6 en commit fijo; documentación pública de Flutter, Android y SQLCipher. **No hubo acceso a los archivos fuente WIP completos ni ejecución propia de Flutter/Android en esta sesión; estas pasadas no son auditoría independiente certificada del producto.**

## Resultado de contraste de fuentes (sin reejecutar tests)

- F1 `JOR-H9-M1-F1-VISUAL-NATIVE-20261119-UNICO.zip`, SHA-256 `563ADC7CA9B4625B3B10CC16E0D83760F7996905A604BD49E93574EABEC71CBF`, 25.558 bytes; ZIP 24 miembros, CRC válido. Consta `WIDGET_FLOW=PASS_FOCAL` y `flutter analyze` PASS con logs; cambia `test/widget_test.dart` untracked, PRE `B3A1990B...E2671` y POST `B9E92967...5AE39`. **No repetir C1.**
- H9-M1: 75/75 host tests PASS y Laravel normal bootstrap PASS, reutilizados por F1; backend B21F-S3 158/2450 PASS_SCOPED histórico; no constituyen nativo Android. APK debug built, no instalado y bytes ausentes en ZIP.
- Instrumentación observada nominalmente: `lib/src/persistence/local_encrypted_store.dart` y `integration_test/kiosk_flow_test.dart`. El archivo `native-adapter-evidence.txt` reconoce `FlutterSecureStorage`, `PRAGMA cipher_version`, pero `EXECUTION=NOT_RUN`. De ello **no** se infiere ni defecto ni PASS de cifrado.
- ADB: `AVD_COUNT=8` **ajenos**, `JORNATO_AVD_COUNT=0`, un endpoint físico no emulador reportado autorizado técnicamente y no utilizado; **sin permiso expreso** de crear/emular AVD nuevo ni usar móvil. Pro HTTP/DB `BLOCKED_CONTRACT`; decisiones OD sin nueva aprobación.
- GitHub al revisar: `main=1ee6aae821f8cf177cc64149081ad8847f7fec2e`, PR1 `faf5fe283191f8b5a2724b397009512a2caec1b6`, PR2 `f47f89c2b95d4e1beefe0d72d0c1fcde47aedcdf` (antes de esta documentación), PR3 `104469b119752f395cf9881e732d582feab9db4e`. Es **prototipo remoto**, no código de WIP Android local. No subir código local sin revisión de secretos.

## I. Diez pasadas como VERDUGO — intento de invalidar el siguiente paso

| # | Comprobación realizada y evidencia concreta | Error potencial detectado | Corrección obligatoria en orden C2 |
|---|---|---|---|
| **V01** | Cotejé el `TASK=...F1` y el ZIP F1 con checkpoint actual | El siguiente prompt podría ordenar de nuevo el test del folio ya PASS. | Retirar F1 de tareas activas; C2 es la única puerta nueva. |
| **V02** | Revisé el contenido real F1 (24 miembros) | Nombres de adaptadores en un log no son código disponible ni prueba de implementación nativa. | Codex lee el WIP actual y sus contratos antes de decidir cambios; no reescribe por hipótesis. |
| **V03** | Contrasté 235 entradas Git y archivo untracked cambiado | `status` y el HEAD idéntico no demuestran que los bytes untracked no cambiaron. | Custodia PRE/POST SHA256 y delta sobre copia PRE real de cada archivo objetivo. |
| **V04** | Cotejé `AVD_COUNT=8`, `JORNATO_AVD_COUNT=0`, ADB físico | Crear/unir AVD o instalar en móvil sin permiso violaría la custodia. | AVD por defecto **NO AUTORIZADO**; solo inventario read-only y trabajo seguro. |
| **V05** | Contrasté Flutter integration_test oficial contra host 75 | Flutter host y APK compilado no ejecutan plugin Android Keystore/SQLCipher real. | QA nativa separada por target, build/hash, device y seis gates; nunca promover host a nativo. |
| **V06** | Confronté `cipher_version` del log con API oficial SQLCipher | Detección de motor no demuestra clave efectiva ni datos cifrados en disco. | Oráculos de apertura legítima, rechazo de clave incorrecta y ausencia de SQLite legible en claro, sin exponer claves. |
| **V07** | Separé reinicio de widget, proceso, reinstalación y `pm clear` | Un rebuild de widget puede simular persistencia sin salir del proceso; uninstall destruye estado. | Prueba de proceso relanzado sin borrar datos, distinguida de reinstalación y corrupción. |
| **V08** | Revisé aislamiento tenant/actor e idempotencia reportados | Un host PASS no demuestra aislamiento del almacén cifrado Android; test de corrupción puede borrar datos ajenos. | Datos sintéticos y subgates nativos separados, sin tocar otras DB/perfiles. |
| **V09** | Revisé `PRO_HTTP_DB=BLOCKED_CONTRACT` y OD pendientes | Aprovechar C2 para inventar autenticación/tenant/proxy/HTTP distorsiona prioridad y seguridad. | Pro permanece bloqueado salvo autorizaciones técnicas independientes; ninguna nueva API. |
| **V10** | Cotejé GitHub remoto público vs WIP privado y ZIP anterior | Copiar 235 archivos a GitHub o ZIP sin revisión expondría secretos, y otra auditoría repetida gastaría tokens. | GitHub solo docs/continuidad, ZIP focal y un solo prompt; no push WIP ni duplicar 75/158/tests visuales. |

**Conclusión verdugo:** la barrera **real** es permiso/entorno para el test nativo, pero **sí** puede prepararse código e instrumentación de C2 sin consumir Android ni duplicar módulos.

## II. Diez pasadas como JUEZ — atacar también las soluciones del verdugo

| # | Objeción sometida a contraste | Alternativa aparentemente razonable | Fallo motivado |
|---|---|---|---|
| **J01** | ¿Deberíamos repetir F1 tras cualquier cambio nuevo? | Ejecutar todo «para estar seguros». | **Rechazado** salvo cambio en consumidor de F1; repetir C1 con misma fuente no mejora evidencia (L5/L6). |
| **J02** | ¿El próximo Codex debe limitarse a pedir un AVD? | Pausar toda implementación hasta permiso. | **Rechazado**: se pueden identificar brechas y preparar instrumentación focal de forma segura; no se atribuye PASS nativo. |
| **J03** | ¿Es más seguro congelar 100% el WIP? | Ningún archivo tocado mientras esté sucio. | **Rechazado con gate**: cambios focales con PRE/POST y sin stage son viables; el WIP ajeno permanece intacto. |
| **J04** | ¿Se puede usar uno de los ocho AVD para ahorrar tiempo? | Ya están instalados y funcionan. | **Rechazado**: pertenencia/estado ajenos, no son AVD Jornato exclusivo/descartable; permiso técnico no equivale a autorización. |
| **J05** | ¿Sería mejor crear un AVD de inmediato? | Lo haría posible probar SQLCipher hoy. | **Rechazado por ahora**: usuario pidió auditoría, no autorizó creación/arranque; emitir bifurcación condicionada sin reinterpretar silencio como sí. |
| **J06** | ¿Basta `PRAGMA cipher_version` para aprobar cifrado? | Confirma que la librería responde. | **Rechazado**: además se necesitan ruta de clave real, comportamiento de clave incorrecta y readback/at-rest; sin claves en logs. |
| **J07** | ¿Conviene sumar nuevo provider o repositorio para test? | Aislaría dependencias y simplificaría mocking. | **Rechazado salvo defecto probado**: reutilizar adaptador y `integration_test` existente; cero paralelos (L1–L3). |
| **J08** | ¿Usar `flutter analyze`/host como PASS nativo provisional? | Permite avance sin device. | **Rechazado**: es QA de fuente/host; el veredicto nativo será NOT_RUN hasta ejecutar plugin nativo en Android real/emulado. |
| **J09** | ¿Reabrir Pro/HTTP dentro del macrobloque grande? | Sería un avance completo de producto. | **Rechazado por contratos**, que siguen sin credenciales sintéticas autorizadas; C2 útil e independiente, sin nueva autenticación. |
| **J10** | ¿Debemos marcar `PASS_SCOPED` solo por preparar tests? | Prueba fuente lista y documentación limpia parecen entregables. | **Rechazado**: `READY_FOR_NATIVE_RUN`/`BLOCKED_AUTH`, con código atribuible si lo hubo; `H9_GLOBAL=NO_GO`, `RELEASE=NO_GO`. |

**Conclusión juez:** se conserva **un único macrobloque C2** con desarrollo focal que no requiere permiso de emulador. La ejecución de dispositivo es una puerta **condicional y explícita**. Si no hay defectos ni instrumentación faltante, no inventar cambios por completar el lote.

## III. Decisión operativa definitiva y fuentes

1. **ORDEN NUEVA ÚNICA:** `CODEX_JORNATO_H9_C2_MACROBLOQUE_NATIVE_READINESS_20261119.md` y `docs/CODEX_LOTE_ACTUAL.md` de PR #2, mismo texto. No abrir F2 ni H9-M2. Codex **no recibe** las veinte pasadas como tarea: ya están hechas.
2. **Autoridad:** ningún documento GitHub reemplaza el WIP local ni su contrato real; jamás copiar F0 al Android avanzado por reflejo. Para código ejecutable, la fuente real debe ser inspeccionada por Codex localmente; ChatGPT no tuvo acceso a su contenido.
3. **Permiso:** AVD creación/arranque actualmente `NOT_GRANTED`; solo si llega una instrucción afirmativa nueva y específica usarlo con SDK existente y carpeta separada. Sin permiso: implementar lo seguro, marcar native NOT_RUN y retornar ZIP único sin fabricar progreso.
4. **QA:** F1 visual PASS_FOCAL, 75 host y Laravel PASS históricos y B21F-S3 158/2450 PASS_SCOPED conservados; no reejecutar. Solo focal nuevo si el código cambió. Pro HTTP sigue bloqueado.
5. **GitHub:** actualizar únicamente PR #2 (orden, esta auditoría, checkpoint), no `main`, PR #1, PR #3 ni código WIP. Sin GitHub Actions ni pagos. No publicar código WIP sin revisión de privacidad/seguridad.
6. **Leyes:** L1 KISS/Ponytail — reutilizar; L2 antirruido — no duplicar tests/servicios; L3 antiparches — causa raíz; L4 UX aprobado — sin rediseño; L5 evidencia real por artefacto; L6 una sola transferencia/ZIP. Enfocado, sin dieciocho skills ni extensiones.

**Fuentes públicas auxiliares:** [Flutter integration tests](https://docs.flutter.dev/testing/integration-tests); [Android AVD Manager](https://developer.android.com/tools/avdmanager); [Android environment variables](https://developer.android.com/tools/variables); [SQLCipher API](https://www.zetetic.net/sqlcipher/sqlcipher-api/). Esas referencias prueban mecanismos de la plataforma, **no** que Jornato los haya implementado correctamente.

**LÍMITE DOCUMENTAL:** revisión adversarial interna, no certificación de producto ni test en emulador. **H9=NO_GO; RELEASE=NO_GO; NEXT_OWNER=CODEX_LUNA, POST_ZIP=CHATGPT_DIRECTOR.**
