# JORNATO — S2 · PREFLIGHT DE PAQUETE DEL SERVIDOR Y DOS CARRILES DE ENTREGA

**Corte: 21 de noviembre de 2026.** Preparación independiente del Director mientras Codex Luna ejecuta **N3-R1**. **NO ES UNA ORDEN A CODEX, NI UN DEPLOY, NI UNA VALIDACIÓN DEL SERVIDOR REAL.** No se tocó `D:\codex\Jornato`, Android, bases de datos ni PR de producto.

## Resultado nuevo — comprobable

Se implementó `tools/JORNATO_SERVER_BUNDLE_PREFLIGHT_S2.py` (solo Python estándar), complementario y NO sustitutivo de `tools/JORNATO_SERVER_SOURCE_INTAKE_S1.py`. S1 inspecciona metadatos de **fuentes Laravel** en repositorio local, sin ejecutar PHP. **S2 inspecciona un futuro ZIP candidato de entrega** sin extraerlo, para prevenir empaquetados inseguros: travesía de directorios, nombres Windows ambiguos o duplicados, enlaces simbólicos, entradas cifradas, riesgos de tamaño/descompresión, `.env*`, claves, dumps/logs/DB y estructura Laravel incompleta.

**Pruebas de desarrollo ejecutadas en entorno aislado:** 12 escenarios **sintéticos** PASS (`good`, archivo obligatorio ausente, `.env.production`, respaldo/dump, `../`, ruta absoluta, ruta con unidad Windows, clave privada, SQL, enlace simbólico, colisión de mayúsculas/minúsculas, ZIP ilegible). No se inspeccionó código, datos ni ZIP de producción de Jornato. El programa nunca emite contenido de fuentes ni rutas internas del ZIP; devuelve contadores genéricos, SHA256 del archivo, tamaños y estado `BUNDLE_LAYOUT_PASS_SCOPED` o bloqueo.

**Límite decisivo:** `BUNDLE_LAYOUT_PASS_SCOPED` **NO** certifica ausencia de secretos dentro de archivos aparentemente inocuos, vendor íntegro, autenticidad de dependencias, compilación, HTTP, DB, seguridad multi-tenant ni backup. La función `release_go` siempre devuelve **false**. S2 no permite promocionar un servidor sin S1, QA y las puertas existentes de [S0 (24 controles)](JORNATO_SERVIDOR_GATES_S0_20261121.csv).

## Cómo usarlo, solo cuando exista un candidato autorizado DESPUÉS de N3

```powershell
py -3 tools\JORNATO_SERVER_BUNDLE_PREFLIGHT_S2.py --self-test
py -3 tools\JORNATO_SERVER_BUNDLE_PREFLIGHT_S2.py `
  --bundle D:\codex\_REPORTES\Jornato\SERVER-S1\private\servidor-candidato.zip `
  --out D:\codex\_REPORTES\Jornato\SERVER-S1\private\s2-bundle-result.json
```

Las rutas son ejemplos **no existentes ni verificadas en Windows**. El destino debe ser local, privado y fuera de la fuente; salida exclusiva, no sobrescribir. No entregar ZIP del backend ni su contenido a GitHub público. Si no hay candidato, `S2=NOT_RUN_REAL`, no crearlo desde fuentes durante N3. Si el candidato incluye un archivo sensible, corregir el empaquetador propietario **cuando el WIP esté libre**, no eliminar a ciegas material de las fuentes. Los archivos indispensables son `composer.json`, `composer.lock`, `artisan`, `bootstrap/app.php` y `public/index.php` bajo la misma raíz de paquete, posiblemente prefijada.

## Optimización real del calendario: dos carriles paralelos (propuesta, no GO)

| Carril | Objetivo más cercano | Evidencia decisiva todavía pendiente | Relación con el otro |
|---|---|---|---|
| **A — Gratis Local** | Candidato interno funcional de marcaciones **offline**, como piloto controlado; no implica liberación comercial | ZIP N3-R1; test UI real, persistencia tras reinicio, oráculos Android SQLCipher/Keystore/idempotencia/corrupción y UAT/privacidad | **No bloquear** pruebas offline por la elección de hosting Pro, salvo dependencia demostrada de código compartido |
| **B — Pro + servidor** | Fuente Laravel identificada, QA aislada real, contratos tenant/sync, staging seguro y piloto integrado | Liberación del WIP por Codex, respaldo fuera del equipo autorizado, S1 real, E2E A/B/PAT/outbox, OD02/OD03/OD04 y destino staging | No llamar GO al backend por 158 tests históricos ni por escaneo S2 de ZIP |

**Recomendación de dirección:** mantener ambos carriles sincronizados por contrato de eventos y persistencia, pero **no imponer al Gratis Local la dependencia administrativa del hosting Pro** para ejecutar QA nativa. Decisión de liberar un piloto solo la toma el propietario con gates efectivamente aprobados. Este desdoblamiento es de **entrega**, no de arquitectura: un motor de jornadas, una semántica de eventos y un repositorio autorizado de fuentes.

## Qué puede hacerse sin pedirle nada a Codex mientras N3 está en curso

- Mantener [S0 ready room](JORNATO_SERVIDOR_S0_READY_ROOM_20261121.md), [S1 intake](JORNATO_SERVIDOR_S1_KIT_ACTIVACION_POST_N3_20261121.md) y esta herramienta como preparación **inactiva** en PR #2.
- No activar workers, hosting, esquema MariaDB, migraciones, un segundo checkout de WIP ni un segundo Codex. No usar CI GitHub Actions si no está autorizado/disponible.
- No repetir las 86 pruebas host aprobadas N2-R1; adjudicar primero el ZIP real N3-R1.

## Primera ejecución útil tras el ZIP N3-R1 (prioridad de desbloqueo)

1. **Director** inspecciona N3: éxito UI real, límites offline, paridad del candidato y cambios; decide fuente estable para integrar, sin otra revisión 10+10 por rito.
2. **Custodia autorizada:** llevar a destino privado fuera del equipo un paquete de fuentes no secretas con manifest y una restauración comprobada; asegurar que el usuario apruebe destino y publicación.
3. **S1 sobre servidor real** cuando WIP libre: `composer.lock`, rutas, middleware, migraciones, QA MariaDB *nueva y aislada* y escenarios 8 E2E ya definidos. Solo reparar defectos observados.
4. **S2 sobre paquete real** cuando exista un bundle de release: bloquear filtraciones por nombre/ruta antes de subir a staging. Después exige verificación de secretos de contenido independiente, integridad de dependencias, backup DB/rollback y configuración del destino.
5. **GO por carril** con criterios objetivos: piloto Gratis Local solo cuando Android y UAT pasen; Pro solo con integración y seguridad end-to-end. `RELEASE=NO_GO` hoy.

## Control de no interferencia y estado

- `N3_R1=IN_FLIGHT_REPORTED_BY_USER`; este archivo no modifica `docs/CODEX_LOTE_ACTUAL.md`.
- `SERVER_SOURCE_REAL=NOT_INSPECTED`; `SERVER_S1=PREPARED_ONLY`; `SERVER_S2_BUNDLE=TESTED_SYNTHETIC_ONLY`; `SERVER_DEPLOY=NOT_RUN`.
- `H9_GLOBAL=NO_GO`; `B22=NOT_AUTHORIZED`; `RELEASE=NO_GO`.
- **Ahora sigue CODEX LUNA con N3-R1.** Después del ZIP sigue CHATGPT DIRECTOR. No abrir un nuevo lote mientras Codex está ocupado.