# Jornato · NEXT autorizado de preparación (F0)

Repos: https://github.com/sierraglobalcompany-rgb/Jornato
PR borrador: https://github.com/sierraglobalcompany-rgb/Jornato/pull/1
Objetivo: verificar y completar F0 sin fusionar ni alterar otros proyectos.

## Preflight obligatorio
1. Leer README, docs/PRODUCTO.md, docs/ADR-0001-ARQUITECTURA.md, docs/QA-ESTADO.md y AGENTS.md.
2. Solicitar al owner el paquete BDM-Menor-Transferencia-2026-10-24.zip y la imagen original Jornato; no asumir que están en el repo.
3. Inspeccionar rama, HEAD, status, WIP, worktrees y conflictos antes de hacer cambios. No pisar WIP.
4. Revisar documentación oficial vigente de Flutter y opciones de almacenamiento cifrado; registrar licencias, mantenimiento, compatibilidad y decisiones.
5. NO controlar interfaz, Explorer, configuración global ni instalar hooks sin autorización expresa del owner.

## Implementación permitida dentro de rama separada (no main)
- Generar estructura Android con Flutter SDK en entorno autorizado; preservar archivos existentes.
- Ejecutar flutter doctor, flutter analyze, flutter test, flutter build apk con versiones y logs.
- Corregir fallos mínimos detectados, preservando contrato: entrada/pausa/continuación/salida, pausa real, sin duplicados, autor/sujeto/espacio.
- Realizar spike aislado de persistencia cifrada local y custodia de claves en Android Keystore, incluyendo pruebas reales reinicio, restauración, corrupción e idempotencia.
- Integrar la imagen Jornato suministrada sin redibujar identidad; producir assets mobile sólo con comparativa visual y respetar autoría.
- Evitar backend, cobros, reconocimiento facial, GPS real y permisos empresariales hasta gates definidos.

## QA y salida
- Informar PASS / FAIL / BLOCKED / NOT_EXECUTED por cada gate.
- Diferenciar prueba lógica, widget, build, dispositivo real y seguridad; no equipararlas.
- Evidenciar SHA exacto probado, dispositivo / SDK, resultados y limitaciones.
- Mantener PR como borrador; **no merge**, no deploy, no APK productiva, no tocar ERP-BDM.
- Actualizar docs/QA-ESTADO.md y dejar un NEXT único y verificable.

## Leyes globales
La transferencia menciona PingPongLaw L1-L6 con hash SHA256 be3caa63d29685c07ba657764c82d8ba47414391b2ec095b31e608c19e4f2c8d. Obtener texto y verificar hash antes de atribuir cláusulas o aplicarlas; no inventarlas.
