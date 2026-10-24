# Jornato · contrato inicial del producto

Origen: paquete BDM-Menor del 2026-10-24. La marca de producto desde ahora es **Jornato**. BDM-Menor v4 es sólo una referencia de lógica, navegación y 196 pruebas históricas documentadas; no es el producto nuevo.

## Audiencia y alcance

Una app para uso individual y empresas pequeñas (aprox. 5 a 100 trabajadores). Piloto Colombia, Android primero, español, después iOS. La app permite espacios **personal**, **equipo sencillo**, **empleado en su teléfono**, **terminal/kiosco**, **dueño**, **operador** y **administrador delegado**. Se conserva separación por espacio, actor y sujeto. No hay nómina.

## Contratos invariantes

1. Eventos de entrada, pausa, continuación y salida. Prohibir secuencias inválidas y duplicaciones por reintento.
2. Calcular trabajo desde intervalos reales. Pausa prevista no crea evento ni descuenta tiempo. Turnos nocturnos pertenecen a la fecha de entrada.
3. Horarios y metas configurables e independientes, excepciones explícitas por trabajador; política congelada al inicio de cada jornada.
4. GPS sólo al marcar si la política lo exige, radio máximo 100 m. En la demo exige precisión > 0 y <= 25 m, lectura <= 30 s y distancia + precisión <= 100 m. Fallo -> revisión, no validación inventada.
5. Selfie es evidencia; facial 1:1 pendiente de estudio de seguridad, alternativas, licencias y privacidad. QR/NFC de sede no identifican por sí solos a una persona.
6. Kiosco debe borrar la identidad temporal tras cada comprobante. Operador no aprueba permisos; dueño sólo su empresa; delegado limitado por ámbito.
7. Permisos y vacaciones con aprobación, saldos y reversión auditada; nunca borrar eventos. Sin cálculo automático de derechos laborales o nómina.
8. Local sin nube y sin publicidad que bloquee marcaciones; login y derecho a Pro son independientes; sincronización futura idempotente.
9. No compartir credenciales, sesiones, bases, infraestructura ni despliegue con ERP-BDM. No comprometer datos reales en repositorio público.

## Fases

- **F0:** contrato, ADR, skeleton móvil, pruebas básicas y spike de cifrado local.
- **F1:** Android offline usable, personal y equipo sencillo, respaldo/restauración.
- **F2:** equipo, roles, kiosco, QR/NFC, GPS/selfie verificables en teléfonos reales.
- **F3:** solicitudes, vacaciones, calendario, auditoría e informes.
- **F4:** backend multiempresa, sincronización, entitlements y monetización.
- **F5:** iOS y expansión por país.

## Estado exacto de este PR

Incluye motor Dart puro de marcas y pantalla personal **en memoria** con pruebas fuente. No incluye plataforma Android generada, cifrado, persistencia, autenticación ni integraciones reales. No es un piloto ni una versión para empleados. No habilitar funciones pendientes mediante botones ficticios. Cada fase requiere pruebas y evidencias en dispositivo.
