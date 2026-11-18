# Jornato

**Jornato** — control inteligente de jornadas, horarios y asistencia para uso personal y pequeños negocios.

**Estado:** Fase 0 PARCIAL. Este repositorio contiene un prototipo de código Flutter/Dart, **NO** una app de producción ni un APK probado.

## Estado de componentes

| Componente | Estado |
|---|---|
| Contrato de producto y roadmap | Documentado |
| Motor de entradas, pausas, continuaciones y salidas | Código inicial no ejecutado en SDK |
| UI personal | En memoria; ahora muestra turnos y acumulados, sin persistencia |
| Pruebas Dart | 39 casos escritos (8 originales + 31 nuevos), sin ejecutar |
| Android APK / QA físico | Pendiente |
| Archivo determinista JSON (sin cifrar) | Código para validar/restaurar eventos, sin almacenamiento; NO respaldo |\n| Persistencia cifrada / backups | Pendiente |
| Empresa, kiosco, QR, GPS, selfie | Pendiente |
| Cloud, entitlements, iOS | Fuera del lote inicial |

## Documentos

- [Producto y reglas](docs/PRODUCTO.md)
- [Decisión de arquitectura](docs/ADR-0001-ARQUITECTURA.md)
- [Estado de QA y bloqueos](docs/QA-ESTADO.md)
- [Cómo preparar Flutter](docs/COMO-EJECUTAR.md)
- [Siguiente encargo para Codex](docs/NEXT-CODEX.md)
- [Reglas de seguridad para agentes](AGENTS.md)

## Origen / marca

Es un producto nuevo y separado de ERP-BDM, basado en la **transferencia BDM-Menor v4 del 2026-10-24**. La imagen de Jornato suministrada por el propietario es la **referencia de identidad**; falta integrarla como asset verificable y crear iconos de tiendas.

**No subir** datos de empleados, claves, selfies, historias médicas ni otra información sensible a este repositorio público.

La rama de F0 está bajo PR borrador y requiere validación antes de fusionar.

**Delta remoto para trabajo sin Codex/Actions (17-nov-2026):** se añadieron
proyecciones de turnos, un archivo JSON determinista para reconstruir eventos
y pruebas fuente. **No es almacenamiento offline cifrado ni sincronización**;
el uso comercial y Android siguen bloqueados. El trabajo avanzado y no
publicado de `D:\\codex\\Jornato` debe compararse antes de integrar
este PR remoto. Estado de pruebas y límites en [QA](docs/QA-ESTADO.md).
