# JORNATO · AUDITORÍA ADVERSARIAL DEL PROMPT H9-M1 · 10 VERDUGO + 10 JUEZ

**Fecha:** 19 de noviembre de 2026 (Colombia). **Objeto auditado:** `CODEX_JORNATO_H9_M1_REACTIVACION_WIP_REAL_20261119.md` (109 líneas, Git blob `ffe747bc78f0b8df7de232122ac5c203c0f6f170`). **Resultado:** una **versión corregida del mismo macrobloque H9-M1**, sin reabrir B13–B21 ni crear otra fase. **Responsable de las pruebas del producto:** Codex Luna. **Responsable de dirección/aceptación:** ChatGPT.

**Método y límite:** veinte pasadas de revisión documental adversarial del **encargo**, hechas por ChatGPT en dos roles, contrastando el texto original con los HEAD de GitHub y el canon `sierraglobalcompany-rgb/PingPongLaw@84e961cadf482d234f4c0ee2ca60e8c7e9b388e8`. Esto **no es un segundo agente de QA independiente**, ni veinte ejecuciones de pruebas de Jornato. No existe acceso al WIP físico de `D:\codex\Jornato` ni a su APK en esta sesión. La auditoría anterior de diez pasadas de **B14/C04 del 5-nov-2026** es antecedente **reutilizado, no repetido**; el histórico de **B21F-S3 158 tests / 2450 assertions** sigue `PASS_SCOPED`, no se recertificó.

## A. Diez pasadas como VERDUGO (buscar fallos y refutaciones)

| # | Qué inspeccioné en la orden original | Hallazgo adversarial | Corrección/decisión verificable |
|---|---|---|---|
| **V01** | Archivo exacto, tarea, ramas y procedencia | El SHA de PR #2 quedó obsoleto después de publicar la primera orden; riesgo de guiar a Codex al ref viejo | **CORREGIDO:** PR #2 como documento canónico cuyo HEAD cambia; PR #3 y `main` identificados y sujetos a comprobación real. Misma TASK, no fase nueva. |
| **V02** | Prohibiciones Git versus WIP con cientos de archivos sucios | `WIP intocable` podía interpretarse como prohibición de desarrollar, o `git diff HEAD` como prueba de autoría propia | **CORREGIDO:** permitir edits focales propios con PRE/POST por archivo, proteger staged/untracked ajenos, bloquear colisión de líneas y separar el delta nuevo del antiguo. |
| **V03** | Alcance de P1/P2/P3 y prioridad | Un macrobloque sin puerta de avance puede gastar el lote en diagnóstico de Laravel o intentar sync antes de guardar offline | **CORREGIDO:** P1 smoke corto, **P2 prioridad de código**, P3 condicionado a outbox duradera; si falta base, solo contrato/serialización. |
| **V04** | Inicio Laravel normal versus S3 de QA | Peligro de repetir 158 tests, crear `config/view.php` decorativo o arrancar DB ajena | **CORREGIDO:** una sola comprobación de bootstrap normal sin overlay, DB ni Docker; `NOT_APPLICABLE`/`BLOCKED` si corresponde, sin falsear `PASS`. |
| **V05** | Jornada offline y doble tap | `Sin duplicados` carecía de oráculo operacional; UI podría confirmar antes de persistir | **CORREGIDO:** mismo `eventId`/payload una fila, mismo ID distinto payload conflicto; confirmación solo tras persistencia atómica, recuperación después de reinicio. |
| **V06** | SQLCipher/Keystore y niveles de evidencia | Una prueba host o un JSON sin cifrar podrían etiquetarse como persistencia segura | **CORREGIDO:** `SQLCIPHER=PASS_VERIFIED` exige adaptador nativo, datos realmente cifrados y lectura/rehidratación probada, sin exponer claves; de otro modo `NOT_VERIFIED/BLOCKED`. |
| **V07** | C04 histórico: `requetId` contra `requestId` | Riesgo de repetir el parche de normalizar en memoria y dar por aceptado un payload distinto | **CORREGIDO:** revisar campo en artefacto persistido y serialización HTTP; rechazar `requetId`; conservar la historia de B14 intacta. |
| **V08** | Reintentos sync, receipt/ACK, tenant y permisos | Probar duplicados sencillos no demuestra el caso de ACK perdido; inventar usuario de prueba podría abrir OD02/OD04 | **CORREGIDO:** caso explícito ACK perdido+retry sin duplicación; credenciales sintéticas solo si ya autorizadas; HTTP bloqueado si no. |
| **V09** | Evidencia Git/QA físico versus fuente F0 | 119 Flutter tests escritos y 31 checks Dart pueden confundirse con PASS; emulador ≠ teléfono real | **CORREGIDO:** pruebas Codex solo del delta real, SHA del código/build, `PASS_HOST_ONLY` separado de emulador y teléfono; no ejecución por parte del propietario. |
| **V10** | ZIP único, parches sobre árbol sucio y riesgos de filtración | `CHANGES.patch` indiscriminado incluye WIP ajeno o secretos; SHA del ZIP/manifiesto podría ser autorreferente | **CORREGIDO:** delta atribuible o bloqueo, revisión manual de secretos/PII, manifiesto de miembros excluyendo el propio manifiesto, SHA del ZIP externo, única entrega. |

## B. Diez pasadas como JUEZ (contraste: ¿conservar o rechazar la solución?)

| # | Decisión sometida a juicio | Contraste adversarial / por qué no elegir la alternativa | Fallo motivado |
|---|---|---|---|
| **J01** | Mantener la misma tarea H9-M1 | Crear H9-M2 reiniciaría secuencia, contradice L6 y no hay evidencia de nuevo alcance aprobado | **CONFIRMADA:** una TASK activa, versión V2 que sustituye a V1; un único responsable Codex. |
| **J02** | Partir del WIP avanzado, no del F0 de GitHub | El F0 en PR #3 es memoria volátil y sin Android/scaffolding; importarlo a ciegas destruye complejidad ya resuelta | **CONFIRMADA:** código/contrato local prevalecen; PR #3 solo referencia semántica; no merge/pull. |
| **J03** | Permitir cambios focales a un WIP sucio | Prohibir cualquier cambio impediría terminar producto; permitir `git reset/checkout/add` expondría trabajo ajeno | **CONFIRMADA CON GATE:** PRE/POST, estado staged sin mutar, bloqueo en rutas compartidas; no acción Git destructiva. |
| **J04** | Mantener P1→P2→P3 como vertical integral | Eliminar P1 escondería el riesgo del overlay de vistas S3; expandirlo a una suite total sería ruido | **CONFIRMADA:** smoke quirúrgico P1 y luego trabajo principalmente Android offline, sync condicionada. |
| **J05** | Persistencia cifrada como requisito real, no «mejora posterior» | SQLite/JSON claro facilita falsa demo y puede perder protección de datos; instalar paquete por ansiedad rompe KISS | **CONFIRMADA:** reutilizar SQLCipher/Keystore existentes; no degradar ni declarar PASS sin evidencia. |
| **J06** | Contrato exacto `requestId` + ACK persistido | Aceptar alias `requetId` por compatibilidad oculta un error de contrato; rehacer B14 no aporta | **CONFIRMADA:** comprobación focal de bytes y ACK perdido, sin modificar resultados históricos. |
| **J07** | OD01–OD08 como bloqueos selectivos | Abrir permisos/login para conseguir Pro PASS violaría decisiones humanas; bloquear todo el lote tampoco desarrolla | **CONFIRMADA:** bloquear solo tramo dependiente y continuar piezas técnicas aprobadas/offline. |
| **J08** | UX mínima y temporizador F0 como referencia, no trasplante | Una pantalla nueva duplicaría UI avanzada; no comprobar estados reales deja el flujo ambiguo | **CONFIRMADA:** estados offline/pendiente/sync, mensajes de error y accesibilidad; ninguna reinvención visual. |
| **J09** | QA por SHA y por superficie realmente ejecutada | Exigir 119 tests F0 sobre árbol distinto malgasta capacidad; tests host no prueban dispositivo/cifrado | **CONFIRMADA:** Codex ejecuta QA focal una vez por delta y marca `NOT_RUN` lo demás; B21F-S3 solo histórico. |
| **J10** | ZIP único con límites explícitos y aceptación posterior | Pedir otro prompt/otra auditoría antes de actuar viola L6; declarar lanzamiento por un macrobloque viola L5 | **CONFIRMADA:** entrega única de cambios y logs atribuibles, `H9_GLOBAL=NO_GO`, `B22=NOT_AUTHORIZED`, `RELEASE=NO_GO`; ChatGPT decide después. |

## Decisiones definitivas (sin repetir las veinte pasadas en Codex)

**Arquitectura aprobada para este lote:** reutilizar módulos efectivos del WIP (Flutter/Android + Laravel y persistencia/sync existentes), no introducir segunda fuente de eventos, segunda outbox, tablas o permisos nuevos. **No se ha certificado una arquitectura local por inspección remota:** Codex debe reconocer la que realmente existe y sus contratos antes de editar.

**Orden única:** `JOR-H9-M1-REACTIVADO-ANDROID-OFFLINE-PRO-BOOT-20261119`. **Prompts ejecutables:** solo `docs/CODEX_LOTE_ACTUAL.md` del PR #2, con copia descargable idéntica. **QA:** Codex; propietario no ejecuta pruebas. **GitHub Actions:** no disponibles; no tratar de reactivarlas. **WIP:** protección estricta, código de producto solo bajo gate PRE/POST. **Entrega:** un ZIP con delta propio, evidencias y manifest; no subir el WIP ni secretos.

**Dictamen adversarial:** `PROMPT_CORREGIDO_PARA_EJECUCION=SI`, `PRODUCTO_CERTIFICADO=NO`, `PR3_FLUTTER_119=NOT_RUN`, `PR3_SMOKE_31=NOT_RUN`, `B21F_S3=PASS_SCOPED_HISTORICO`, `H9_GLOBAL=NO_GO`, `RELEASE=NO_GO`, `NEXT_OWNER=CODEX_LUNA`. Las veinte pasadas son revisión interna de texto, no certificación independiente de software.

## Fuentes auditadas y autoridad

- Markdown H9-M1 original de este turno; Git blob `ffe747bc78f0b8df7de232122ac5c203c0f6f170` publicado en PR #2 antes de esta corrección.
- GitHub `sierraglobalcompany-rgb/Jornato`: main `1ee6aae821f8cf177cc64149081ad8847f7fec2e`, PR #1 `faf5fe283191f8b5a2724b397009512a2caec1b6`, PR #3 `104469b119752f395cf9881e732d582feab9db4e`, PR #2 Draft documental. Todo es **código remoto/estado**, no acceso al WIP Windows.
- Canon [PingPongLaw L1–L6, commit fijo](https://github.com/sierraglobalcompany-rgb/PingPongLaw/blob/84e961cadf482d234f4c0ee2ca60e8c7e9b388e8/docs/engineering/LEYES_IMPLEMENTACION_1_A_6.md), leído mediante GitHub; evitar instalación indiscriminada de skills.
- Auditoría B14/C04 anterior del **5-nov-2026**, reutilizada como antecedente; B21F-S3 158/2450 de evidencia histórica; sin suites repetidas.

**CIERRE DEL DIRECTOR:** Codex Luna debe EJECUTAR el macrobloque ya corregido; no volver a auditar el prompt ni pedir una revalidación del usuario.
