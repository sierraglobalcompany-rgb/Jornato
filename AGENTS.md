# Jornato — instrucciones para agentes

Producto independiente. Prioridades: KISS, evidencia, no inventar QA, preservar requisitos de la transferencia del 24/10/2026. No tocar ERP-BDM ni otros repositorios. No ejecutar programas en el PC del dueño ni intervenir su interfaz sin autorización explícita.

ANTES de cambios: leer README, docs/PRODUCTO.md, ADR y QA cuando existan en el ref de trabajo; inspeccionar cambios ajenos y preservar WIP. Trabajar en rama, no auto-merge. No escribir secretos ni datos personales en repo público. Tests con datos ficticios.

No confundir demo BDM-Menor, capturas o tests históricos con aplicación móvil verificada. Persistencia, cifrado, sensores, permisos, tenancy y billing sólo se declaran cuando existan pruebas reales. No usar mocks para marcar estos gates como PASS.

## PingPongLaw — seis leyes L1–L6 (canon de versión fija)

**Fuente autorizada para esta integración:** [PingPongLaw, commit `84e961cadf482d234f4c0ee2ca60e8c7e9b388e8`](https://github.com/sierraglobalcompany-rgb/PingPongLaw/tree/84e961cadf482d234f4c0ee2ca60e8c7e9b388e8). Leer realmente [`docs/engineering/LEYES_IMPLEMENTACION_1_A_6.md`](https://github.com/sierraglobalcompany-rgb/PingPongLaw/blob/84e961cadf482d234f4c0ee2ca60e8c7e9b388e8/docs/engineering/LEYES_IMPLEMENTACION_1_A_6.md) antes de afirmar cumplimiento; no consultar `main` móvil como sustituto. Si no hay acceso: `CANON_READ=BLOCKED`, no inferir contenidos ni declarar integración efectiva en la sesión. La lectura en GitHub no demuestra carga automática del agente/Codex.

- **L1 — KISS + Ponytail:** primero necesidad, reutilización, plataforma/estándar y dependencias existentes; mínima solución **completa**, sin recortar seguridad, contratos, datos, UX ni pruebas requeridas.
- **L2 — Antirruido:** detectar duplicación material con consumidores y evidencias; conservar incertidumbres, no borrar WIP o documentos por parecido ni multiplicar skills/canones.
- **L3 — Antiparches:** diagnosticar/reproducir, resolver causa raíz en el propietario de la lógica y comprobar regresión; no acumular paliativos.
- **L4 — Diseño humano:** especificación y mockup **aprobado** prevalecen; navegación por roles, estados reales, responsive y accesibilidad. Anti UI Slop / UI UX Pro Max son referencias focales, nunca autorizan rediseños ni funciones inventadas.
- **L5 — Verificación independiente:** requisitos y pruebas del SHA/build realmente evaluado; `NOT_RUN` no es `PASS`; CI verde no certifica producto; revisión del propio autor no es independiente.
- **L6 — Antiping-pong:** ChatGPT investiga, decide y ejecuta directamente lo posible; Codex solo por limitación local real, en un lote útil. Evitar microdelegaciones, auditorías sin decisión y cierres ficticios.

**Selección condicional de skills:** usar el router del canon [`.agents/skills/pingponglaw/SKILL.md`](https://github.com/sierraglobalcompany-rgb/PingPongLaw/blob/84e961cadf482d234f4c0ee2ca60e8c7e9b388e8/.agents/skills/pingponglaw/SKILL.md) y únicamente la subskill pertinente cuando sea accesible. Este enlace **no instala** skills, Ponytail ni hooks en el equipo y **no garantiza autoload**. No copiar las nueve skills ni el canon completo a Jornato por rutina.

Nunca instalar hooks, controlar Explorer, eliminar archivos, modificar configuración global o cambiar otros proyectos desde este repo sin autorización específica. Mantener matriz REAL / DEMO / BLOQUEADO y NEXT concreto. Preservar reglas de seguridad, QA, ramas, revisiones y prohibición de merge automático del proyecto; ante conflicto registrar la diferencia sin debilitar el requisito.

Al cerrar tareas: informar leyes aplicables y lectura efectiva del canon, archivos/ref/HEAD reales, pruebas `PASS/FAIL/BLOCKED/NOT_RUN/NO_APLICA` con evidencia, revisión independiente si existe y `NEXT` o `NINGUNO`. No afirmar activación de hooks o skills locales sin prueba en ese entorno.
