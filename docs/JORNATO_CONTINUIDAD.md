# JORNATO — CONTINUIDAD CANÓNICA · 20-NOV-2026 · N1-R2 TERMINADO / N2 ACTIVO

**ÚNICA ORDEN VIGENTE:** [CODEX_LOTE_ACTUAL.md](CODEX_LOTE_ACTUAL.md), TASK `JOR-N2-SDK-RECOVERY-HOST-GATE-20261120`. N1-R2 ya devolvió ZIP y NO SE REPITE. Director de trabajo ChatGPT; ejecutor local CODEX LUNA, solo si no hay una ejecución N2 nueva en curso. [Dictamen del N1-R2](JORNATO_N1R2_DICTAMEN_Y_NEXT_N2_20261120.md).

## Evidencia verificada en la recuperación

- ZIP N1-R2 `JOR-N1-R2-CUSTODIA-KIOSCO-OFFLINE-20261120-UNICO.zip`, SHA-256 `5EACC3643A00D0EC338E1EB62698A1B4AEA88C957FD3B113C0BF25B394E61540`, 11.742 bytes: **10 entradas CRC y 9/9 miembros con hash+bytes correcto**. Comprobación directa del ZIP, NO del código Windows.
- Resultado `PARTIAL_WITH_GAPS`: Codex informa reparación de acciones hasta el fin programado de turnos nocturnos y tarjeta de acumulado local rotulada provisional/referencial, con oráculos host nuevos. **7 archivos de pruebas/73 declaraciones seleccionadas, 0 ejecutadas**. Se prohíbe presentar `CODE_WRITTEN_NOT_TESTED` como PASS.
- Custodia reportada: snapshot privado de 216 archivos, 2.904.617 bytes, muestra 5/5 restaurada, todo en **D:**; no es respaldo fuera del disco ni restauración total. WIP reportado 234 entradas (223 untracked/11 modificadas), 0 staged, índice estable; seis rutas N1-R2 modificadas ya eran `untracked`. No hay commit del producto.
- El ZIP C2 V5 previo fue reabierto y su `RESULTS.csv` contiene **Flutter 3.47.8 / Dart 3.13.7 `A2_sdk=PASS` y `A5_offline_compile=PASS`**. N1-R2 encontró los ejecutables ausentes en PATH/rutas estándar. **Discrepancia de procedencia/entorno por resolver**, no prueba de SDK borrado. No instalar ni descargar todavía.
- N1-R2 no tocó teléfono/ADB/AVD. C2 V5 dejó APK QA instalado según Codex y fue `BLOCKED_VM_SERVICE`; el host SQLCipher/FFI no certifica Keystore ni SQLCipher nativo. `VM_ROOT_CAUSE=UNDETERMINED`, Android C2 físico `NOT_RUN`, `RESTART_READBACK=BLOCKED_HARNESS`, Pro y tenant `BLOCKED_CONTRACT`.

## N2 — próximo único macrobloque

1. Proteger hashes de los seis archivos N1-R2 y no repetir snapshot ni comparación PR3 sin causa.
2. Recuperar **la ruta del SDK que V5 utilizó** mediante `android/local.properties`, `.dart_tool/package_config.json`, variables del proceso, registros C2 V5 y rutas derivadas verificables, sin búsqueda de disco completa ni descargas.
3. Si existe Flutter/Dart compatible + cachés offline: verificar formatter/analyze y ejecutar exactamente los siete tests host de `NEXT_GATE_MATRIX.md`, arreglar fallos de producto relacionados y reejecutar solo la regresión afectada en el mismo lote. Registrar conteos/sha reales, no 73 PASS imaginarios.
4. Si SDK sigue indisponible: un ZIP único con evidencia de las pistas y autorización mínima requerida; sin más vueltas, cambios no comprobados ni otras auditorías.
5. No móvil/AVD/ADB, no Git stage/merge/push WIP, no red Pro, no sustituciones de arquitectura, no herramientas de pago ni dependencias nuevas. Entregar un ZIP sin código/secretos y NEXT al Director.

## Estado remoto y ruta de lanzamiento

Repositorio `sierraglobalcompany-rgb/Jornato`: PR #2 es **documentación Draft** (esta rama); main `1ee6aae821f8cf177cc64149081ad8847f7fec2e`; PR1 F0 Draft `faf5fe283191f8b5a2724b397009512a2caec1b6`; PR3 F0 Draft `104469b119752f395cf9881e732d582feab9db4e` (observados en esta revisión). GitHub NO aloja el WIP avanzado; no publicar código privado antes de consentimiento, respaldo externo y análisis de secretos. El puente PR2 usa referencia PR3 antigua; reutilizar la matriz N1-R2, no ejecutar ese comparador como vigente.

Leyes PingPongLaw: L1 KISS/Ponytail, L2 antirruido, L3 causa raíz, L4 UX humana, L5 evidencia independiente, L6 antipingpong. OD01–OD08 siguen pendientes; B19/B20 deny-all; semántica `requestId`/`requetId` histórico y `SERVER_STORED` distinto de `RECOGNIZED` intacta.

Después de N2: si host PASS, custodiar fuente **fuera del equipo** bajo destino autorizado y preparar integración WIP/PR3 con revisión de secretos; luego diagnóstico físico Android bajo permiso, Pro/tenant/portal/empleados, L4/L5/UAT, B22 solo con GO explícito. `H9_GLOBAL=NO_GO`, `B22=NOT_AUTHORIZED`, `RELEASE=NO_GO`.

**NEXT_OWNER=CODEX_LUNA_N2_IF_NO_NEWER_RESULT; AFTER_SINGLE_ZIP=CHATGPT_DIRECTOR.**
