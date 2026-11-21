# JORNATO — DICTAMEN DIRECTOR SOBRE N1-R2 Y RUTA CORTA N2

**Corte:** 20 noviembre 2026, Colombia. **Fuente directa:** ZIP adjuntado `JOR-N1-R2-CUSTODIA-KIOSCO-OFFLINE-20261120-UNICO.zip`, SHA-256 `5EACC3643A00D0EC338E1EB62698A1B4AEA88C957FD3B113C0BF25B394E61540` (11.742 bytes). Inspección independiente de ZIP: 10 entradas, CRC PASS, 9/9 manifiesto en tamaño y SHA. ZIP contiene **informes**, no los seis archivos modificados ni sus pruebas fuente; por ello no certifica el comportamiento de los cambios.

## 1. Estado N1-R2 adjudicado

| Gate | Evidencia y conclusión |
|---|---|
| Cambios de kiosco | Codex informa corrección de acciones hasta cierre nocturno y acumulado local provisional/referencial. **CODE_WRITTEN_NOT_TESTED**, no host PASS ni Android PASS. |
| Host QA | Siete archivos de tests, 73 declaraciones seleccionadas, **0 ejecutadas**; Flutter/Dart ausentes en PATH y rutas inspeccionadas según `logs/host_preflight.txt`. |
| Custodia | Snapshot privado **216 archivos / 2.904.617 bytes**, integridad informada y muestra restaurada **5/5**. No hay copia fuera del disco. No es backup integral del proyecto ni restauración completa demostrada. |
| Git local | Según Codex, 234 rutas (223 untracked, 11 modificadas), 0 staged, índice estable; las seis rutas editadas ya eran untracked. No hay commit de cambios. |
| PR3 WIP | Matriz read-only al HEAD `104469b119752f395cf9881e732d582feab9db4e`. No merge; herramientas puente PR2 con referencia obsoleta. |
| VM Service | Análisis estático sin SDK; **causa indeterminada**. No ADB/AVD ni celular en N1-R2. |
| Seguridad/release | C2 físico SQLCipher/Keystore/idempotencia/corrupción NOT_RUN; H9 NO_GO; B22 NOT_AUTHORIZED; RELEASE NO_GO. |

## 2. Contraste adversarial nuevo (NO repetir 10+10 de órdenes anteriores)

- **Afirmación:** «Flutter/Dart no están disponibles». **Contraprueba:** el ZIP C2 V5 anterior, inspeccionado nuevamente, contiene `A2_sdk=PASS` (Flutter **3.47.8**, Dart **3.13.7**) y `A5_offline_compile=PASS` (kernel con package config). **Dictamen:** existe una discrepancia de entornos/rutas o disponibilidad. No basta para concluir que el SDK fue borrado ni que puede ejecutarse ahora. Recuperar la procedencia del SDK antes de instalar otro.
- **Afirmación:** «La custodia está cerrada». **Contraprueba:** se seleccionaron 216 fuentes, aunque Git muestra 234 rutas en status y se excluyeron muchos ignored; restauración muestral sólo 5 archivos y todo en D:. **Dictamen:** `SNAPSHOT_INTEGRITY=PASS_SCOPED` por informe, `OFF_DEVICE_BACKUP=NO`; no elevar a recuperabilidad total.
- **Afirmación:** «El kiosco está completo». **Contraprueba:** no hay en ZIP código, compilación, análisis ni ejecución de oráculos recién añadidos. **Dictamen:** implementado según Codex, **sin certificación host**; los fallos de negocio no están demostrados ni descartados.
- **Afirmación:** «Hay que regresar al teléfono». **Contraprueba:** son 7 pruebas host pendientes y el APK QA ya instalado no produjo VM URI desde logcat PID-only. **Dictamen:** teléfono intocable; primero recuperar el SDK host, probar la vertical offline y corregir fallos concretos.
- **Afirmación:** «Hace falta un nuevo marco de testing». **Contraprueba:** siete suites y 73 declaraciones ya escritas; C2 V5 pudo compilar un adaptador con el SDK existente en su entorno. **Dictamen:** usar las herramientas y pruebas actuales, un solo lote N2, sin descargar SDK, reemplazar APK ni crear infraestructura.

## 3. Decisión de ejecución y puertas restantes

**N2 único:** [CODEX_LOTE_ACTUAL.md](CODEX_LOTE_ACTUAL.md), `JOR-N2-SDK-RECOVERY-HOST-GATE-20261120`. Una búsqueda acotada de ruta y compatibilidad del SDK previamente registrado; si existe, formatter/analyze y los 7 tests host, corrección causal focal si FALLAN y reejecución de los casos afectados en el mismo bloque. Si no existe, ZIP único de bloqueo causal; no hay permiso implícito para instalar ni descargar. No repetir snapshots completos, PR3, auditorías 10+10 ni C2 físico.

**Después:** Director decide promoción privada de WIP con backup externo autorizado y análisis de secretos, gate Android físico bajo nueva autorización y oráculo válido, contrato Pro/tenant/portal/empleados/OD, L4/L5/UAT y sólo entonces merge/release por GO humano. No subir WIP a GitHub público sin permiso específico. Documentación de PR2 no equivale a código integrado.

`NEXT_OWNER=CODEX_LUNA_N2_IF_NOT_RUNNING; AFTER_SINGLE_ZIP=CHATGPT_DIRECTOR; H9_GLOBAL=NO_GO; B22=NOT_AUTHORIZED; RELEASE=NO_GO.`