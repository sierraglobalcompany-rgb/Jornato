# JORNATO — DICTAMEN DEL DIRECTOR N3-R1 Y ORDEN N4 · 21 NOV 2026

## 1. Evidencia material inspeccionada

ZIP entregado `JOR-N3-UI-OFFLINE-INTEGRATION-CANDIDATE-20261121-UNICO.zip`, SHA-256 **C960FA83ABAE677E4DDF1E59432C0915B75A85017FD02D65F4FBD9731ACA57DA**, tamaño **13.164 bytes**, **11 entradas**: CRC PASS y 10/10 SHA/tamaño del manifiesto correctos. Archivos inspeccionados de manera directa: `FINAL_REPORT.md`, `HOST_UI_RESULTS.csv`, `UI_ACTION_MATRIX.csv`, `OFFLINE_DEPENDENCY_EVIDENCE.md`, `CANDIDATE_REBUILD_SUMMARY.md`, `CANDIDATE_COVERAGE.csv`, `WIP_GUARDS.csv`, `BLOCKERS.md`, `NEXT_GATE_MATRIX.md`, `PRIVATE_PUBLISH_PLAN.md`. El ZIP **no incluye código**, ni logs completos, ni binarios; ChatGPT no puede compilar WIP Windows de forma independiente.

**Veredicto:** `RESULT=PARTIAL_WITH_GAPS` aceptado. `HOST_UI=PASS_SCOPED`, 9/9 en pantalla `KioskScreen` con SQLite FFI y sesión sintética preautenticada; prueba vecina `test/widget_test.dart` 4/4 y análisis de dos archivos `PASS` según los registros. Test UI final SHA `A1317B664570CDA738DD017C50C02E079A34B332137E026978B190B95CEA7BF3`. Componente de UI anterior `A17451E4A4AF8C52EAA5E146315B7CB05B68FAE74C389078E0F6D22D24C1DBF0`; posterior `7925AC0074A74081E8DFE4D0B8CEB9DB4E20C3137D9756C615EED861D9B9A6A5`. La corrección de doble toque adelanta el estado ocupado antes del acceso a identidad local; escenario registra un solo evento. Éxito UI y offline acotado a ruta de marcación, **no** prueba autenticación UI, modo avión Android ni toda la aplicación.

**Reutilizado, no repetido en N3:** N2-R1 7 ficheros/86 PASS con SHA de test reportados iguales, formato/análisis PASS_SCOPED. B21F-S3 backend 158/2450 PASS_SCOPED según evidencia histórica. Ninguno equivale a producción.

## 2. Bloqueo del candidato y oportunidad real

Candidato N3 en carpeta local privada: 13 archivos de base `git archive HEAD` + overlay de **56** rutas, **65** archivos finales; su comparación de 56 hashes y bytes pasa. Sin embargo, `CANDIDATE_COVERAGE.csv` indica **155 archivos de backend sin incluir**; 6 tests de dispositivo/integración, 9 documentos y 9 tests adicionales quedan fuera. De **235 rutas cambiadas**, 56 se incluyeron y **179 se omitieron**, de manera deliberada por alcance. No es un proyecto completo ni puede desplegarse.

El smoke host fue `BLOCKED_ENV` por ausencia en el candidato de `.dart_tool/package_config.json` y `android/local.properties`, sin intento de generar configuración. **No está demostrada una dependencia de Internet o un defecto de la app.** En un árbol nuevo, esos archivos son normalmente derivados/locales; si SDK y cachés preexistentes lo permiten, podría prepararse un entorno host aislado mediante resolución estrictamente offline. Esta posibilidad todavía **no se ejecutó ni se valida aquí**. No copiar los archivos derivados del WIP ni descargar dependencias por inercia.

WIP al cierre según `WIP_GUARDS.csv`: rama `codex/jor-b08-h4-domain-20261025`, HEAD `faf5fe283191f8b5a2724b397009512a2caec1b6`, 235 rutas de estado (224 untracked, 11 tracked modified), cero staged, índice SHA inalterado `25CC609803D7E68D5F3ECF428198B2432CF1EA37030546735DD3F03299D905E1`. Snapshot en D: desde N1, **no** backup fuera del equipo. El nuevo `test/kiosk_screen_actions_test.dart` sumó una ruta; `KioskScreen` previamente untracked recibió un cambio focal.

## 3. GitHub y estrategia de cierre sin reauditar

Repositorio público `sierraglobalcompany-rgb/Jornato`: base main `1ee6aae821f8cf177cc64149081ad8847f7fec2e`; PR1 F0 Draft HEAD `faf5fe283191f8b5a2724b397009512a2caec1b6`; PR3 F0 Draft, apilado sobre PR1 HEAD `104469b119752f395cf9881e732d582feab9db4e`; PR2 Draft solo documental. SHA observados previo a esta publicación. El backend Laravel avanzado no está en GitHub público; no copiarlo a PR2.

La preparación del Director anterior a N3 ya dejó kits **S0/S1/S2** de servidor en el PR2. No crear otro backend, otro inventario paralelo ni otro verificador. N4 reutiliza esos materiales como **referencias**, pero no asume que existen en el Windows WIP. El kit S1 fue probado sobre servidor ficticio, **no sobre Jornato**; el S2 inspecciona ZIP, no sustituye una revisión de secretos dentro del código.

**Orden técnica:** un macrobloque N4, primero fuente app+Laravel **completa y privada** + smoke host en candidato si realmente cabe sin red; luego QA MariaDB temporal y contratos E2E existentes con fixtures sintéticos. No ejecutar Android, no staging/producción, no merge/push, ni repetir 86/9+4 PASS como auditoría. Conservar `requestId`/`requetId`, `SERVER_STORED != RECOGNIZED`, B19/B20 deny-all, OD pendientes. Reparar solo causas nuevas. Entrega Codex: **un ZIP único sanitizado**.

## 4. Puertas para lanzamiento, sin falsear el GO

- **Gratis Local:** depende de candidato integral compilable, pruebas Android reales SQLCipher, Keystore, integridad/corrupción, readback tras reinicio, flujo autenticación kiosco y UAT; 9/9 host no certifican móvil.
- **Pro y servidor:** depende de código Laravel real, tenant A/B, PAT, migraciones en DB aislada, idempotencia outbox, decisiones OD y staging/backup/dominio autorizados. 158/2450 scoped no equivale E2E.
- **Custodia y publicación:** falta destino off-device **privado autorizado**, verificación de secretos y decisión explícita de dónde publicar el WIP avanzado. Ninguna copia adicional solo en D: llena este requisito.

**Estado:** `N3_R1=ACCEPTED_PARTIAL`, `N4=NEXT`, `H9_GLOBAL=NO_GO`, `B22=NOT_AUTHORIZED`, `RELEASE=NO_GO`; después del ZIP N4 vuelve a **CHATGPT DIRECTOR**.