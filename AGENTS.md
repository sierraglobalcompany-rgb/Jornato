# Jornato — instrucciones para agentes

Producto independiente. Prioridades: KISS, evidencia, no inventar QA, preservar requisitos de la transferencia del 24/10/2026. No tocar ERP-BDM ni otros repositorios. No ejecutar programas en el PC del dueño ni intervenir su interfaz sin autorización explícita.

ANTES de cambios: leer README, docs/PRODUCTO.md, ADR y QA; inspeccionar cambios ajenos y preservar WIP. Trabajar en rama, no auto-merge. No escribir secretos ni datos personales en repo público. Tests con datos ficticios.

No confundir demo BDM-Menor, capturas o tests históricos con aplicación móvil verificada. Persistencia, cifrado, sensores, permisos, tenancy y billing sólo se declaran cuando existan pruebas reales. No usar mocks para marcar estos gates como PASS.

Canon global PingPongLaw L1-L6: la transferencia menciona SHA256 be3caa63d29685c07ba657764c82d8ba47414391b2ec095b31e608c19e4f2c8d. Su texto no se incluye en esta base; obtener/verificar fuente íntegra antes de afirmar implementación de esas leyes. No inventar sus cláusulas.

Nunca instalar hooks, controlar Explorer, eliminar archivos, modificar configuración global o cambiar otros proyectos desde este repo sin autorización específica. Mantener matriz REAL / DEMO / BLOQUEADO y NEXT concreto.
