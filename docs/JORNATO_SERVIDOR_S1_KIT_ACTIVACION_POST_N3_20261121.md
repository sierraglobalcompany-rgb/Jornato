# JORNATO — S1: kit de activación del servidor real después de N3

**Fecha:** 21 de noviembre de 2026 (Colombia). **Estado:** preparado, sin ejecutar. **No es una orden activa de Codex.** N3-R1 sigue ejecutándose; Codex no debe recibir S1 ni interrumpirse hasta entregar su ZIP.

**Declaración de límites:** ninguna prueba del backend real ha sido ejecutada en este lote de preparación; no hay acceso al Laravel avanzado en GitHub. SERVER_S1=PREPARED_ONLY; SERVER_RUNTIME=NOT_VERIFIED; SERVER_DEPLOY=NOT_RUN; RELEASE=NO_GO.

Este documento complementa [S0 Ready Room](JORNATO_SERVIDOR_S0_READY_ROOM_20261121.md) y su [CSV canónico de 24 puertas](JORNATO_SERVIDOR_GATES_S0_20261121.csv). No crea otro tablero ni otra matriz que haya que mantener.

## Qué adelantamos realmente

1. Herramienta de solo lectura: [JORNATO_SERVER_SOURCE_INTAKE_S1.py](../tools/JORNATO_SERVER_SOURCE_INTAKE_S1.py). SHA-256 `5d87865d3a4cd0d746380f6a1b1adbdb2148219070935a2f1904b21db493ce85`. Git blob `0a5c236d7f8e8a5c155ea5d0760d097793f3d01e`. Sin dependencias, sin subprocess, sin PHP, sin credenciales, sin DB, sin red. Ejecutada con un servidor ficticio: 11 comprobaciones sintéticas PASS. **NO** prueba Jornato.
2. Una ruta de ejecución S1 agrupada: identidad de código, QA MariaDB aislada, contratos API extraídos del backend real, pruebas adversariales tenant/outbox y plan de staging.
3. Ocho casos E2E precisos, condicionados a las rutas reales y a autorización de fixtures, para que Codex no invente interfaces o roles.
4. Separación de dos posibles candidatos de entrega (Gratis Local y Pro), propuesta que requiere decisión del propietario.

## Precondiciones para activar S1 después de recibir N3

- N3-R1 terminó, se revisó su ZIP y no hay otro proceso modificando D:\codex\Jornato.
- Acceso autorizado de solo lectura al árbol Laravel real, fuente HEAD y estado WIP; conservación privada; no hacer merge/push.
- Destino de salida privado separado. No leer .env, llaves, credenciales, fotos ni datos laborales reales. No adjuntar fuentes/diffs al ZIP público.
- No declarar respaldo off-device mientras las copias estén solo en D:.
- MariaDB QA nueva/exclusiva verificada antes de cualquier migración. Sin esa prueba, **prohibido migrate:fresh** y no simular PASS de DB.
- OD02 vínculo cuenta-empleado, OD03 permisos y OD04 login web siguen pendientes; B19/B20 deny-all. No habilitar endpoints provisionales.

## Paso S1-A — intake técnico sin arrancar Laravel

El futuro ejecutor primero confirma que el código sí existe y la raíz real del servidor. Únicamente entonces puede usar el verificador, no ahora:

    py -3 tools\JORNATO_SERVER_SOURCE_INTAKE_S1.py --self-test
    py -3 tools\JORNATO_SERVER_SOURCE_INTAKE_S1.py --source D:\codex\Jornato\server --out D:\codex\_REPORTES\Jornato\SERVER-S1\private\source-intake.json

La ruta es ilustrativa; resolver paths reales y confirmar salida libre fuera del WIP. Resultado JSON con estructura, versions declaradas PHP/Laravel/Sanctum, estado de composer.json y composer.lock, conteos/hash agregado de rutas, migraciones, app y tests. Omitir secretos y rutas relativas del informe. **SOURCE_STRUCTURE_PRESENT no significa servidor funcional.** No ejecutar comandos Artisan, Composer, PHP ni tocar DB hasta preflight de aislamiento. La herramienta no hace auditoría de seguridad ni cubre todos los archivos.

## Paso S1-B — QA aislada y código real

- Identificar versión efectiva y dependencias desde composer.lock; el manual Laravel 13 es solo referencia hasta confirmarlo.
- Identificar host/puerto/usuario/nombre de base QA y comprobar **no producción / no otro proyecto**; datos sintéticos A/B; copia/restore del entorno QA si habrá operaciones destructivas.
- Reutilizar 158 tests/2450 assertions B21F-S3 PASS_SCOPED según evidencia histórica y fuente SHA compatible, sin repetirlos por rutina. Ejecutar solo nuevas pruebas causales o de contratos no probados E2E.
- Si no hay MariaDB QA, clasificar BLOCKED_QA_DB, avanzar únicamente en inventario estático y cerrar la campaña sin otro runner.

## Paso S1-C — contrato verdadero app-servidor

Solo sobre Laravel y dependencias YA aislados: obtener ruta+verbo+middleware+controlador+policy+DTO/payload+nombre test+SHA. La posibilidad de usar route:list -vv o --json depende de versión y del boot seguro; Artisan puede ejecutar providers/servicios, por tanto no invocarlo sobre un entorno no confiable o con datos ajenos. **No fabricar URLs o códigos de respuesta.**

Mantener requestId e histórico requetId como existan; SERVER_STORED distinto de RECOGNIZED. Reintentos idénticos deben ser idempotentes; misma identidad con payload diferente no puede mutar silenciosamente. occurredAt y recordedAt preservan funciones diferentes.

**Precaución Sanctum:** la documentación oficial indica que tokenCan puede devolver true en solicitudes de SPA first-party; no basta para autorizar recursos cross-tenant. Exigir policy y restricción tenant por recurso, en vez de confiar solo en ability. Fuente: https://laravel.com/docs/13.x/sanctum.

## Paso S1-D — ocho oráculos E2E que faltan

| ID | Caso con fixtures A/B | Resultado requerido |
|---|---|---|
| E01 | Anónimo consulta recurso protegido | Denegación sin filtrar datos |
| E02 | Token/sesión A consulta su propio recurso | Acceso legítimo solo a A |
| E03 | A intenta leer recurso B | Denegación cross-tenant |
| E04 | A intenta modificar recurso B | Denegación sin mutación |
| E05 | Token vencido o revocado | Falla cerrada |
| E06 | requestId y payload idénticos reintentados | Un efecto único persistido |
| E07 | requestId repetido con payload diferente | Conflicto/denegación según contrato existente |
| E08 | Outbox recibe SERVER_STORED | No convertirse en RECOGNIZED automáticamente |

No se pueden ejecutar si la ruta/fixture o contrato no están aprobados. Estados permitidos: PASS_E2E_SCOPED, PARTIAL_WITH_GAPS, BLOCKED_SOURCE, BLOCKED_QA_DB, BLOCKED_CONTRACT, NOT_RUN. Nunca llamar PASS a un mock o a una ruta que no existe.

## Paso S1-E — staging y operación (preparar, NO desplegar)

Destino de hosting y dominio no decidido. Comparar opciones solo después de conocer PHP/extensiones/colas/cron del backend real. No asumir Hostinger ni un servidor de otro proyecto. Checklist: raíz web public, HTTPS/TLS, APP_DEBUG=false, secreto APP_KEY estable, DB y respaldos fuera de document root, permisos mínimos, colas/scheduler solo si el código los usa, mecanismos de errores sanitizados. Health /up, cuando exista, evidencia boot y no sustituye DB/tenant. Plan versionado de despliegue/rollback de código y restauración DB ensayada; las migraciones no se revierten de modo seguro por simple rollback del código.

Fuentes oficiales consultadas, sujetas a versión real: https://laravel.com/docs/13.x/deployment; https://laravel.com/docs/13.x/routing; https://laravel.com/docs/13.x/sanctum.

## Ruta de publicación más rápida — propuesta, NO autorización

- **RC Gratis Local:** candidato funcional aislado, solo si pasa pruebas Android nativas relevantes, persistencia/reinicio y UAT, sin depender del backend Pro. El propietario decide si acepta entregar este subconjunto antes del producto integral.
- **RC Pro:** necesita contratos de identidad/tenant aprobados, API+Android E2E, staging, seguridad, respaldos y firma. No degradar seguridad para igualar una fecha.

## Coordinación sin pisar N3

**AHORA:** ChatGPT solo actualiza documentos/ayudas del PR #2; Codex ejecuta N3-R1. No cambiar CODEX_LOTE_ACTUAL.md. No abrir un segundo Codex sobre WIP ni empezar servidor.

**AL RECIBIR ZIP N3:** Director adjudica SHA, pruebas UI, candidato y estado de custodia; identifica si servidor real es accesible, luego autoriza un único macrobloque S1-A a S1-D con preflight fuerte y un ZIP. Si no hay fuente/DB, reporta bloqueo causal sin nuevas auditorías rituales.

**DESPUÉS:** staging, Android físico, Pro, UAT y GO explícito. H9_GLOBAL=NO_GO; B22=NOT_AUTHORIZED; RELEASE=NO_GO.

**NEXT_OWNER_NOW=CODEX_LUNA_FINISH_N3_R1. AFTER_ZIP=CHATGPT_DIRECTOR.**