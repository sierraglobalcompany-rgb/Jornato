# ADR-0001 · Base nativa Flutter (provisional)

- Estado: **PROPUESTA PARA VALIDAR**, 2026-10-24.
- Contexto: transferencia requiere Android offline primero e iOS después, con reglas desacopladas.
- Decisión tentativa: Flutter/Dart, motor puro separado de UI, adaptadores para reloj, ubicación, sensores, credenciales, almacenamiento y sincronización.
- Este PR **no** decide librería de cifrado ni publica API. Hasta probar biblioteca SQLCipher equivalente, soporte Android, licencia, restauración, claves en Keystore y migraciones, el prototipo se mantiene **sólo en memoria**.
- Evento de producción futuro: UUID, workspace, subject, actor, source, occurredAt y recordedAt con indicador de reloj; estado de aprobación y sincronización; evidencia privada por separado, correcciones append-only y tenant aislado.
- Riesgos: reloj del teléfono manipulable; permisos y sensores inconsistentes; pérdida de datos por apagado; duplicaciones y filtraciones entre empresas; derechos de compra y login separados.
- Alternativas: Kotlin Android (más simple para sólo Android pero más trabajo iOS); web/PWA (insuficiente para certificar NFC/biometría/almacenamiento robusto). No se descarta sin spike.
- Gate: instalación SDK, bootstrap Android, test en emulador/teléfono, análisis estático, cifrado, reinicio, exportación/restauración y evaluación de dependencias. Hasta entonces **F0 PARCIAL**.
