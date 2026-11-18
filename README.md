# Jornato

**Jornato** — control inteligente de jornadas, horarios y asistencia para uso personal y pequeños negocios.

**Estado:** Fase 0 PARCIAL. Este repositorio contiene un prototipo de código Flutter/Dart, **NO** una app de producción ni un APK probado.

## Estado de componentes

| Componente | Estado |
|---|---|
| Contrato de producto y roadmap | Documentado |
| Motor de entradas, pausas, continuaciones y salidas | Código inicial no ejecutado en SDK |
| UI personal | En memoria; muestra turnos, acumulados y resúmenes diarios |
| Pruebas Dart | 97 casos escritos (8 originales + 89 nuevos), sin ejecutar |
| GPS: validación geométrica local | Código puro con 25 pruebas fuente; sin sensor, permisos ni evidencias reales | 
| Android APK / QA físico | Pendiente |
| Archivo determinista JSON (sin cifrar) | Restaurar y conciliar por prefijo append-only; NO respaldo ni sincronización |\n| Persistencia cifrada / backups | Pendiente |
| Empresa, kiosco, QR, GPS, selfie | Pendiente |
| Cloud, entitlements, iOS | Fuera del lote inicial |

## Regla de ubicación opcional para marcaciones — 18 nov 2026

El PR #3 también incorpora `lib/src/domain/location_rule.dart`: una
evaluación **puramente local** de la política GPS ya documentada (precisión
positiva y hasta 25 m; antigüedad de 0 a 30 segundos; distancia esférica
hasta la sede MÁS incertidumbre del sensor dentro de un radio máximo de
100 m). Las lecturas ausentes, futuras, vencidas, imposibles, imprecisas
o fuera del radio **exigen revisión**. La política opcional no solicita GPS.

No se añadió ningún paquete. El cálculo **NO es una prueba de identidad,
presencia física, fuente GPS auténtica, consentimiento, asistencia aprobada
ni registro de producción**. No solicita permisos, capta fotos, almacena
coordenadas ni envía datos. La integración Android y las autorizaciones
están pendientes del WIP avanzado y de las decisiones del propietario.

Este delta añade 25 tests de fuente, para un total de **97 tests Flutter
escritos, 0 ejecutados aquí**. El smoke Dart puro se amplía a 27 checks
escritos, también NO ejecutados. No usar estos números como H9 PASS.

## Bloque de desarrollo y QA sin Codex ni Actions (18-nov-2026)

El PR #3 también incluye un índice privado por ID de evento que evita recorrer
cada marca al detectar reintentos, y seis pruebas nuevas de integridad/escala.
**Total actual: 72 tests de Flutter escritos, no ejecutados**. Se agregó un
smoke Dart puro con 20 verificaciones (igualmente **NO ejecutadas aquí**) y
un script PowerShell de QA para un **clon separado y limpio de este PR**.
No probar el script directamente sobre `D:\\codex\\Jornato`, cuyo WIP
avanzado todavía no se ha reconciliado.

Los tests escritos y el smoke no prueban cifrado, persistencia, Android,
servicios Pro ni lanzamiento. No hacer merge del PR #3 a ciegas.

## Documentos

- [Producto y reglas](docs/PRODUCTO.md)
- [Decisión de arquitectura](docs/ADR-0001-ARQUITECTURA.md)
- [Estado de QA y bloqueos](docs/QA-ESTADO.md)
- [Cómo preparar Flutter](docs/COMO-EJECUTAR.md)
- [QA manual local sin Codex/CI](scripts/qa_local_f0.ps1) · [smoke Dart sin Flutter](tool/smoke_attendance.dart)
- [Siguiente encargo para Codex](docs/NEXT-CODEX.md)
- [Reglas de seguridad para agentes](AGENTS.md)

## Origen / marca

Es un producto nuevo y separado de ERP-BDM, basado en la **transferencia BDM-Menor v4 del 2026-10-24**. La imagen de Jornato suministrada por el propietario es la **referencia de identidad**; falta integrarla como asset verificable y crear iconos de tiendas.

**No subir** datos de empleados, claves, selfies, historias médicas ni otra información sensible a este repositorio público.

La rama de F0 está bajo PR borrador y requiere validación antes de fusionar.

**Delta remoto para trabajo sin Codex/Actions (17–18 nov 2026):** se añadieron
proyecciones de turnos, un archivo JSON determinista para reconstruir eventos,
conciliación append-only, resúmenes diarios y pruebas fuente. **No es almacenamiento offline cifrado ni sincronización**;
el uso comercial y Android siguen bloqueados. El trabajo avanzado y no
publicado de `D:\\codex\\Jornato` debe compararse antes de integrar
este PR remoto. Estado de pruebas y límites en [QA](docs/QA-ESTADO.md).
