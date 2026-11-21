# JORNATO — RECOVERY HANDOFF ACTUAL · 21 NOV 2026 · N3-R1

> **DELTA 21-NOV-2026, POST S0:** El propietario confirmó que CODEX LUNA SIGUE EJECUTANDO N3-R1. ChatGPT preparó [kit S1 servidor post-N3](JORNATO_SERVIDOR_S1_KIT_ACTIVACION_POST_N3_20261121.md), [intake Python de solo lectura](../tools/JORNATO_SERVER_SOURCE_INTAKE_S1.py) y 8 oráculos E2E dependientes del Laravel real, sin tocar WIP ni cambiar la orden N3. S1 NO ejecutado, deploy NO_GO, PR2 solo documental y utilidades. Después del ZIP N3 sigue ChatGPT Director.

> **PARALELO S0, 21-NOV-2026:** ChatGPT creó [ready room servidor](JORNATO_SERVIDOR_S0_READY_ROOM_20261121.md) y [matriz 24 puertas](JORNATO_SERVIDOR_GATES_S0_20261121.csv) solo en PR2. **Codex Luna sigue ejecutando N3-R1**; no modificar su prompt ni darle otra tarea mientras trabaja. Ningún backend remoto se instaló, QA servidor no corrió, staging no está autorizado; release NO_GO.

**PRIMERA INSTRUCCIÓN AL REANUDAR:** consultar [JORNATO_CONTINUIDAD.md](JORNATO_CONTINUIDAD.md) y [CODEX_LOTE_ACTUAL.md](CODEX_LOTE_ACTUAL.md). Única ejecución N3 `JOR-N3-UI-OFFLINE-INTEGRATION-CANDIDATE-20261121`, revisión correctiva **N3-R1**. No ejecutar N3-R1 si N3 original ya empezó ni si hay ZIP posterior. No reiniciar C2/N1/N2 ni reabrir auditorías 10+10. [Dictamen N3-R1](JORNATO_N3_R1_AUDITORIA_10V_10J_20261121.md).

## Producto y leyes

Jornato: kiosco Gratis Local offline en Flutter con asistencia/jornadas; Pro con SQLCipher/outbox y backend Laravel/Sanctum/MariaDB; web y módulos empleado/RR. HH. Director de producto **ChatGPT**; ejecutor local **Codex Luna**; propietario no hace QA local. Arquitectura L1 KISS/pony-tail, L2 antirruido, L3 causa raíz, L4 UX humana, L5 evidencia independiente, L6 antipingpong. NO segundo motor ni nueva DB/sync/harness, sin distorsionar `requestId`, histórico `requetId`, `SERVER_STORED` vs `RECOGNIZED`; B19/B20 deny-all; OD01–OD08 no aprobadas.

## Evidencia cerrada (no volver a comprobar por rutina)

1. N2-R1 ZIP SHA256 `CC4846C6D901564E246D17B8A28C2B28A772F5A76E00442E0A3BFD19D19B04DB`, 7 entradas CRC PASS, 6 hashes PASS. Registros 7 archivos / **86 PASS, 0 FAIL, 0 SKIP** y formato/análisis PASS sobre Flutter 3.47.8 y Dart 3.13.7; `PASS_HOST_SCOPED` solo para SHAs cubiertos, no Android/release.
2. `KioskScreen` acciones reales y dependencia offline: `ESCRITO_NO_PROBADO`. Siguiente N3 widget test real + reloj fijo + tap + repositorio local + barrera de red verificable, no solo helper/spies ficticios.
3. Windows WIP `D:\codex\Jornato` reportado 234 rutas (223 untracked), HEAD `faf5fe...`, staged 0; no hay acceso directo en ChatGPT ni publicación GitHub del código avanzado. Snapshot N1-R2 216 archivos en D:, restore 5/5 reportado; **OFF_DEVICE_BACKUP=NO**.
4. C2 V5 dejó APK QA instalado, pero 4 oráculos Android NOT_RUN, restart BLOCKED_HARNESS, Pro/tenant BLOCKED_CONTRACT, H9_GLOBAL NO_GO, B22 NOT_AUTHORIZED, RELEASE NO_GO. No tocar teléfono/ADB ni hacer deploy.

## GitHub y permiso de publicación

Repo público `sierraglobalcompany-rgb/Jornato`: `main=1ee6aae...`, PR1 F0 Draft `faf5fe...`, PR3 F0 Draft `104469...` basado en PR1; PR2 Draft documental con esta orden. **Nunca** subir WIP avanzado al repo público sin autorizar divulgación y revisión completa de secretos/PII. Los cambios de documentación en PR2 no sustituyen integración de producto. Próxima decisión de Director: backup off-device privado autorizado y PR de código en destino apropiado.

## Instrucción N3-R1

Codex: preflight y custodia focal; test verdadero de UI `KioskScreen` en noche, cruce de fecha y fin planificado con reloj fijo; demostrar camino offline sin HTTP de la app; corregir fallos propios, repetir únicamente tests afectados; base candidata privada `git archive HEAD` + overlay controlado de tracked/untracked, sin `.git` y sin symlinks/secretos; exigir paridad y smoke antes de `READY_LOCAL_SCOPED`. Un único ZIP con informe, matrices, hashes sanitizados, manifest y CRC; código/patch/snapshot en `OUTPUT_ROOT/private` **sin salir de D:**. No ejecutar N3 dos veces; si ya está ejecutándose, revisar ZIP original.

**NEXT=CODEX_LUNA_N3_R1_IF_NOT_ALREADY_STARTED; AFTER_ZIP=CHATGPT_DIRECTOR.**