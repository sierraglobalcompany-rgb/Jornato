# JORNATO — AUDITORÍA INDEPENDIENTE N1 → N1-R2 · 10 VERDUGO + 10 JUEZ · PLAN DE CIERRE

**Corte documental:** 20-11-2026 (Colombia). **Responsable de dirección:** ChatGPT; **ejecutor siguiente:** Codex Luna. **Alcance:** analizar **únicamente la calidad ejecutable de N1** y su encadenamiento al cierre de producto. Esto **no** es una nueva auditoría de C2, B17, B21, H9-M1 ni del runner Flutter, y **no** constituye acceso al WIP Windows o al dispositivo físico.

## I. Fuentes y hechos: etiquetas de evidencia

- **LEÍDO DIRECTAMENTE:** `CODEX_JORNATO_N1_WIP_CUSTODIA_KIOSCO_OFFLINE_20261120.md` (18 tareas operativas, un defecto seleccionado, custodia focal, PR3, análisis estático); `JORNATO_DICTAMEN_C2_V5_BLOQUEO_Y_NEXT_N1_20261120.md`; PR #2 de `sierraglobalcompany-rgb/Jornato`, rama `docs/pingponglaw-l1-l6-canon-84e961c`, HEAD **`1108bc762e53f8963d6305034b57cc2de2475a48`** en la consulta inicial; archivo remoto `docs/CODEX_LOTE_ACTUAL.md` idéntico al N1 recibido; `docs/JORNATO_CONTINUIDAD.md`, `docs/JORNATO_RECOVERY_HANDOFF_ACTUAL.md`. PR #1 HEAD `faf5fe283191f8b5a2724b397009512a2caec1b6`, PR #3 HEAD `104469b119752f395cf9881e732d582feab9db4e`, ambos abiertos Draft. `main=1ee6aae821f8cf177cc64149081ad8847f7fec2e` (referencia remota histórica, no WIP local).
- **CÓDIGO REMOTO CONTRASTADO DIRECTAMENTE:** PR #3 F0: `lib/src/domain/attendance.dart` blob `c8086e2cb2727c9e6992f01be64525eecab4f38f` (`AttendanceLedger`, `shifts`, `snapshot`); `attendance_archive.dart` blob `714d50e1a2b7dd61b68b2abf10b71a9823533e80` (`encode`, `decode`, `reconcile`); `location_rule.dart` blob `ce99acddf44cc01fe43c60914ebe19e411e98104`; `lib/main.dart` blob `87fc88b734fa717ff7516b513c414b6f04dd4558` (UI `PersonalDayScreen`, reloj condicional). **Ninguno de estos blobs demuestra existencia/identidad en el WIP avanzado.** `docs/QA-ESTADO.md` en PR3 declara **119 tests escritos Flutter y 31 checks Dart escritos, NOT_RUN**, no prueba aprobada.
- **ANTECEDENTE REPORTADO + ZIP validado en revisión previa:** C2 V5 `BLOCKED_VM_SERVICE`, ZIP SHA-256 `711116067DDBF73E7CE4AD6A102D58E14AD5372D79A981F48978C54A76B35692`, 8 entradas CRC PASS/7 manifiesto. Un solo APK QA nuevo fue instalado, VM URI ausente desde PID-only, driver NOT_RUN, 4 oráculos Android NOT_RUN. APK `com.sierraglobalcompany.jornato.b14qa` **permanece instalado según Codex**. No hay acceso directo al móvil aquí.
- **SOLO REPORTADO HISTÓRICAMENTE:** WIP `D:\codex\Jornato`, rama `codex/jor-b08-h4-domain-20261025`, HEAD `faf5fe...`, 234 status (223 untracked, 11 modificados), 0 staged. Backend B21F-S3 158/2450 PASS_SCOPED, H9-M1 75 host PASS, F1 widget PASS_FOCAL, por evidencias anteriores. No extrapolar a producto integrado.

## II. VERDUGO — diez pasadas diferenciadas sobre N1

| ID | Qué verifiqué / ataqué | Defecto o riesgo concreto | Corrección ejecutable N1-R2 |
|---|---|---|---|
| **V01 — macro insuficiente** | N1 Fase C 9–13 ordena escoger **solo el primer defecto**, aunque existen criterios de transición, duplicados, pausas, UI, persistencia. | Deja un segundo/tercer defecto de **la misma vertical** para otro prompt, creando ping-pong. | Permitir reparar **todos los faltantes demostrados de la misma cadena kiosco offline** en una sola edición coherente y tests focales; prohibir nuevos módulos fuera de la vertical. |
| **V02 — custodia confundible** | N1 Fase A crea copia en `OUT\private` del **mismo volumen D:** y valida cinco archivos. | `RESTORE_SAMPLE=PASS` no prueba recuperación integral ni supervivencia del fallo del disco. | Tres indicadores distintos: integridad de snapshot, capacidad de reconstrucción mediante base HEAD y archivos alterados, restauración **muestral**. `OFF_DEVICE_BACKUP=NO`; no declarar `BACKUP_COMPLETE=YES`. |
| **V03 — universo de archivos** | N1 copia `tracked` relevantes y `??`, excluye ignored sensibles/build. | Una fuente esencial ignored, un asset faltante, migración o submódulo puede faltar en la restauración. | Inventario por estado (tracked modificado, tracked limpio dependiente de base, untracked, ignored crítico), lista de exclusiones explícitas, `RESTORABILITY=PARTIAL` si falta contenido necesario. Sin imprimir nombres sensibles. |
| **V04 — secretos y ZIP** | N1 permite `CHANGES.patch` sanitizable y `git status --porcelain` bruto en informes privados. | La sanitización de un diff de código privado no es demostrable automáticamente; rutas/fixtures pueden revelar datos. | **Por defecto, NO adjuntar patch ni fuente.** Mantener diffs en carpeta privada; solo metadatos de archivo/síntesis y hashes sin contenido en ZIP; revisión final por lista positiva y negativa. |
| **V05 — dos flujos Git** | N1 da opción de comprobar PR3 por red pero prohíbe `fetch` en WIP. | Se puede alterar sin querer `origin`, branch o mezclar el PR3 con fuente avanzada sin comparación causal. | Lectura de remoto **solo fuera del WIP**, por conector/HTTPS público si disponible; registrar HEAD y blob por módulo; sin conectividad `REMOTE_NOT_VERIFIED`, **NO cherry-pick ni importación masiva**. |
| **V06 — falso PASS por tests escritos** | En PR3 `docs/QA-ESTADO.md` 119 tests/31 checks están explícitamente `NOT_RUN`. | Comparar el WIP con ese PR puede tratar cobertura escrita como resultado validado. | Separar `TEST_WRITTEN`, `TEST_EXECUTED_PASS_AT_SHA` y `TEST_REUSED_SCOPED` por identidad de archivo y commit. Nunca reutilizar NOT_RUN como PASS. |
| **V07 — «sin cambios» engañoso** | N1 permite `NO_CHANGE_ALREADY_PRESENT_SCOPED` leyendo métodos con tests históricos. | Código puede estar presente pero desconectado en UI, sin offline real o persistencia. | Exigir evidencia por **flujo vertical desde UI → motor → almacén → lectura**, con tests o indicar `PRESENT_NOT_CERTIFIED`; `NO_CHANGE` solo tras cubrir funcionalidad en el alcance. |
| **V08 — comportamiento de tiempo** | PR3 motor maneja `shifts`, `snapshot`, UI recálculo; N1 cubre futuro y medianoche. | Mezclar reloj de UI, orden temporal del libro y eventos futuros puede crear fallo sin romper transiciones individuales. | Una tabla de oráculos fechados: pausa, fin, medianoche, marca futura, reloj en segundo plano, duplicado exacto vs conflictivo; misma instantánea de `now` por acción/cómputo. |
| **V09 — instrumento de host vs Android** | N1 permite `flutter test --no-pub` host y análisis VM estático. | Cualquier PASS host podría declararse aprobación del APK físico ya instalado. | Evidencia etiquetada `HOST_ONLY`; no tocar teléfono, ni emulador, ni `flutter test integration_test` con dispositivo; C2 físico se mantiene NOT_RUN. Diagnóstico VM solo lectura como anexo, no nueva investigación infinita. |
| **V10 — finalización y agente** | N1 solicita ZIP final pero no fija una matriz compacta de puertas posteriores y si existe una ejecución N1 ya terminada. | Otro chat puede reenviar N1 o empezar otra auditoría ritual, y olvidar integración/Pro/UX/legal. | `PRECHECK_NEWER_RESULT`, un único `TASK`, ZIP + `NEXT_GATE_MATRIX`, dueño explícito Director; preservar gates de release NO_GO y lista de dependencias. |

**Dictamen VERDUGO:** N1 tiene dirección correcta, pero su restricción de *un solo primer defecto* y su prueba muestral de respaldo podrían perpetuar trabajo incompleto. Se justifica **una sola revisión de instrucción N1-R2** antes de ejecutar; no repetir C2 ni pruebas aprobadas.

## III. JUEZ — diez contrapruebas adversariales sobre las soluciones

| ID | Hipótesis alternativa que intenté defender | Contraste y razón | Fallo del juez |
|---|---|---|---|
| **J01** | «Dejar un único bug es más KISS». | KISS evita nuevas capas, no impide arreglar varios defectos en un **mismo camino de producto** comprobado. | **RECHAZO** el máximo de 1 bug; acepto vertical acotada, sin módulos nuevos. |
| **J02** | «Exigir respaldo externo ahora». | El usuario no ha dado destino autorizado ni permiso para mover código privado; D: sigue siendo el único lugar probado. | **RECHAZO** prometer backup externo; custodia local verificable y riesgo residual declarado. |
| **J03** | «Copiar incluso secretos para snapshot completo». | Duplicar tokens/PII o adjuntarlos empeora exposición; no prueba restauración segura. | **RECHAZO** copia automática de secretos; registrar dependencia excluida sin revelar contenido. |
| **J04** | «Incluir patch en ZIP para revisar mejor». | El ZIP es conversacional y PR2 público; un parche puede difundir código/secretos privados. | **RECHAZO** patch por defecto; inspección privada y resumen de cambios público. |
| **J05** | «Merge PR3 directamente para no reimplementar». | PR3 Draft sobre PR1 y WIP avanzado no visible remotamente; probabilidad real de duplicar motor. | **RECHAZO** merge; comparar capacidades y reutilizar propietario local. |
| **J06** | «Repetir todos los 119 tests PR3 y las suites Laravel». | PR3 tests nunca ejecutados, pero WIP tiene su propia suite; una repetición indiscriminada no mide cambios pertinentes. | **RECHAZO** suites completas por rutina; ejecutar únicamente tests propios afectados y señal mínima E2E host si existe. |
| **J07** | «Dar GO si existe el código del kiosco». | Presencia de código no demuestra UI→persistencia→readback ni offline. | **RECHAZO** GO; estados `CODE_PRESENT`, `HOST_PASS`, `PHYSICAL_NOT_RUN` separados. |
| **J08** | «Volver al celular para leer VM Service ahora». | APK ya instalado y política prohíbe más efectos/logcat ajeno; no existe permiso adicional. | **RECHAZO** Android; permitir solo análisis estático puntual. |
| **J09** | «Hacer N1 cubrir Pro, pagos, RR. HH. y launcher completo». | Dependen de contratos OD, identidades QA, pruebas aisladas y autorizaciones aún pendientes. | **RECHAZO** expansión indiscriminada; completar vertical kiosco y fijar gates de siguientes macrobloques sin ejecutarlos. |
| **J10** | «Crear nueva auditoría del nuevo prompt para certificarlo». | Las 20 pasadas presentes son un control de **delta** sobre N1; otra auditoría previa a ejecución no agrega evidencia de runtime. | **RECHAZO** nuevo 10+10; publicar N1-R2, ejecutar una vez y juzgar ZIP. |

**Dictamen JUEZ:** `N1_R2_APPROVED_AS_EXECUTION_INSTRUCTION`, no como prueba de producto; `NEXT=CODEX_LUNA_IF_NO_NEWER_N1_RESULT`, `ANDROID_C2=BLOCKED_VM_SERVICE`, `RELEASE=NO_GO`.

## IV. Plan corto de cierre, dependencias reales (sin fechas inventadas)

| Puerta | Condición de salida | Estado previo |
|---|---|---|
| **G0 N1-R2** custodia + vertical kiosco | Fuente recuperable en alcance declarado, matriz PR3 vigente, UI→motor→almacén→lectura y tests locales atribuibles; ZIP seguro | `PENDING`, asignado a Codex |
| **G1 custodia e integración** | Reconciliar WIP y PR3; resguardar fuente fuera del equipo bajo autorización y control de secretos; integrar rama producto con permisos expresos | `NOT_APPROVED` |
| **G2 Android real** | Reabordar VM Service solo con causa y permiso; verificar SQLCipher, Keystore, idempotencia, corrupción y reinicio real | `C2_NATIVE_NOT_RUN` |
| **G3 Pro/tenant/web/empleado** | Contratos, cuentas y roles QA aprobados; sync outbox, PAT, tenant A/B, portal y roles; pruebas E2E focales | `BLOCKED_CONTRACT` parcial |
| **G4 producto/UX/legal** | OD01–OD08 donde apliquen, accesibilidad, usabilidad, trazabilidad y QA independiente L4/L5 | `PENDING` |
| **G5 integración/release** | Backend web/Android coherentes, PRs integrados, UAT, backups, distribución y consentimiento GO expreso | `B22_NOT_AUTHORIZED`, `RELEASE_NO_GO` |

**Regla antipingpong:** no crear un prompt nuevo por cada fila. Codex hace G0 completo; ChatGPT decide el siguiente **gran bloque coherente** según ZIP. No reabrir sucesos históricos sin cambio causal. Seis leyes PingPongLaw L1–L6 se mantienen intactas; sin nuevos hooks, motores o herramientas pagas.

## V. Continuidad y frontera de lo que no se verificó

- **Autoridad documental**: rama PR2 `docs/pingponglaw-l1-l6-canon-84e961c`, archivo `docs/CODEX_LOTE_ACTUAL.md` tras la publicación N1-R2; `docs/JORNATO_CONTINUIDAD.md` y `docs/JORNATO_RECOVERY_HANDOFF_ACTUAL.md` deben reflejarlo.
- **No verificado:** `D:\codex\Jornato` vivo, privacidad local del backup, SDK Windows, APK bytes, teléfono/VM, ejecución N1-R2. GitHub remoto **no** es copia del WIP.
- **No repetir:** Runner V2/V3/V4/V5, B17, B21F-S3 158/2450, H9-M1 75, F1 widget, PR3 119 NOT_RUN. **Nunca presentar el código escrito como prueba aprobada**.
- **Salida actual del Director:** publicar **una** orden descargable de Codex; no fusionar `main` ni PR1/PR3, y no publicar fuente privada sin autorización.

# 🔴🚨 SIGUE CODEX LUNA — N1-R2 ÚNICO; DESPUÉS DEL ZIP SIGUE CHATGPT DIRECTOR. 🚨🔴