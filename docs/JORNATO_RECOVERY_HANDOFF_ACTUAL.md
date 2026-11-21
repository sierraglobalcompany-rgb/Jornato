# JORNATO — HANDOFF CANÓNICO · 20 NOV 2026 · N2-R1

> **RECUPERAR AQUÍ:** [continuidad vigente](JORNATO_CONTINUIDAD.md) → [orden única Codex N2-R1](CODEX_LOTE_ACTUAL.md) → [auditoría delta 10+10](JORNATO_N2_R1_AUDITORIA_10V_10J_20261120.md). La revisión **N2-R1 corrige N2, conserva su TASK y no es N3**. No iniciar si Codex ya ejecuta N2 o hay ZIP posterior. No repetir C2/N1/N1-R2, 10+10 de lotes previos o suites aprobadas.

## Identidad y metas
Jornato: asistencias/jornadas de empresas; kiosco Gratis Local offline; Pro Flutter/SQLCipher/outbox; backend Laravel/Sanctum/MariaDB, portal empleado/RR.HH. ChatGPT Director define gates y contratos; CODEX LUNA ejecuta sobre Windows; el dueño no realiza QA local. Meta es integrar y lanzar de manera segura, no obtener otro informe sin pruebas.

## Últimos resultados
- N1-R2 SHA256 ZIP `5EACC3643A00D0EC338E1EB62698A1B4AEA88C957FD3B113C0BF25B394E61540`, 10 miembros CRC PASS; implementado no probado: nocturnos y acumulado provisional/referencial; **siete tests host/73 declaraciones, 0 ejecutados**. Snapshot privado 216 archivos/2.904.617 bytes, restauración muestra 5/5 reportada. WIP D:\codex\Jornato, rama `codex/jor-b08-h4-domain-20261025`, HEAD `faf5fe283191f8b5a2724b397009512a2caec1b6`; 234 status y 0 staged reportados; no copiado aquí.
- C2 V5 ZIP SHA256 `711116067DDBF73E7CE4AD6A102D58E14AD5372D79A981F48978C54A76B35692`: Flutter 3.47.8/Dart 3.13.7 + kernel offline PASS reportados, pero host actual de N1-R2 no localizó los ejecutables. **No asumir mismo host ni SDK borrado**. C2 físico `BLOCKED_VM_SERVICE`; APK QA se dejó instalado; **no tocar celular/ADB**.
- Hallazgo oficial de N2-R1: `flutter --no-pub` puede ejecutar `cache.updateAll` antes de `pub.get`; hay que validar artefactos de la caché sin red antes de ejecutar Flutter CLI. No instalar/descargar SDK ni corregir arquitectura por falta de dependencia.
- Backend B21F-S3 158/2450 PASS_SCOPED, H9-M1 75 host PASS, F1 focal PASS históricos; Android 4 oráculos NOT_RUN, reinicio Android BLOCKED_HARNESS, tenant y Pro BLOCKED_CONTRACT. H9_GLOBAL NO_GO, B22 NOT_AUTHORIZED, RELEASE NO_GO.

## Github, custodia y leyes
Repo `sierraglobalcompany-rgb/Jornato`: main `1ee6aae...`, PR1 `faf5fe...` Draft, PR3 `104469...` Draft apilado sobre PR1; **PR2 solo documental**. No publicar WIP privado sin respaldo externo autorizado, revisión de secretos y conciliación; sin merge/deploy automático. L1–L6 PingPongLaw, `requestId` y `requetId` histórico, `SERVER_STORED != RECOGNIZED`, B19/B20 deny-all, OD01–OD08 pendientes.

## Única ejecución siguiente
CODEX LUNA: N2-R1 (mismo TASK `JOR-N2-SDK-RECOVERY-HOST-GATE-20261120`), baseline SHA de seis rutas, búsqueda acotada SDK, precache y package config sin mutación, fixtures host sintéticos, formato/analyze y exactamente 7 tests si es seguro; una corrección causal + regresión focal, **un ZIP de evidencia sanitizada** o bloqueo reproducible. Sin Git push/merge, sin teléfono, sin otro runner ni nueva instalación. Si N2 ya está en vuelo, tomar su ZIP y no reiniciar.

**DESPUÉS DEL ZIP: CHATGPT DIRECTOR** planifica respaldo externo/integración producto y cierre de QA, no otra auditoría ritual.
