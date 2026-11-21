# JORNATO — DICTAMEN INDEPENDIENTE N3-R1: DIEZ PASADAS VERDUGO + DIEZ JUEZ Y RUTA DE LANZAMIENTO

**Fecha:** 21 de noviembre de 2026. **Alcance de esta auditoría:** el macrobloque N3 descargable y publicado en `docs/CODEX_LOTE_ACTUAL.md` del PR documental #2, el dictamen N2-R1 y el ZIP N2-R1. **No** se repitieron pruebas Flutter, no se inspeccionó directamente `D:\codex\Jornato`, no se ejecutó Android ni se auditó de nuevo el backend. La auditoría es de instrucciones y fronteras de evidencia, NO de calidad de código no visible.

## 1. Evidencia de entrada y límites

- Orden N3 original: `CODEX_JORNATO_N3_UI_OFFLINE_CANDIDATO_INTEGRACION_20261121.md`, mismo texto vigente en GitHub al empezar; TASK `JOR-N3-UI-OFFLINE-INTEGRATION-CANDIDATE-20261121`. N3 **no tenía un ZIP posterior presentado a este chat**; ello NO prueba que Codex no lo haya iniciado en Windows.
- GitHub consultado: repo público `sierraglobalcompany-rgb/Jornato`, main base `1ee6aae821f8cf177cc64149081ad8847f7fec2e`, PR1 `faf5fe283191f8b5a2724b397009512a2caec1b6` Draft, PR2 documental `437feab9d433bf9e8ab82112b32634a23cc37930` **antes de la actualización**, PR3 `104469b119752f395cf9881e732d582feab9db4e` Draft apilado sobre PR1. Estas refs son observaciones, no promesa de inmutabilidad.
- N2-R1 ZIP original `JOR-N2-SDK-RECOVERY-HOST-GATE-20261120-UNICO.zip`, SHA256 `CC4846C6D901564E246D17B8A28C2B28A772F5A76E00442E0A3BFD19D19B04DB`, 7 entradas. Sus registros: Flutter 3.47.8/Dart 3.13.7, formato/análisis PASS, 7 archivos de prueba / 86 PASS / 0 FAIL / 0 SKIP; atribuibles a hashes consignados y **reportados por Codex**, no reejecutados aquí. `KIOSK_GATE_MATRIX.csv` marca `Pantalla de jornada` y `Límite offline` como `ESCRITO_NO_PROBADO`.
- N1-R2 snapshot de 216 archivos en D: y muestra 5/5 reportada; Windows WIP con 234 entradas (223 untracked), index 0 staged reportados. **No es copia off-device** ni prueba de integridad de todos los archivos.

## 2. VERDUGO — 10 pasadas adversariales (solo defectos de N3 aún abiertos)

| Pasada | Ataque a la orden N3 | Evidencia/por qué es real | Corrección exigida |
|---|---|---|---|
| **V01** | ¿Se ejecutará N3 dos veces? | GitHub muestra N3 como activa, pero no podemos saber si Codex ya trabaja en Windows | N3-R1 reemplaza únicamente si la anterior no empezó; STOP ante ZIP/tarea en curso |
| **V02** | ¿Un `git clone` local es una copia completa del WIP? | N3 §18 proponía clon; Git clona commits, no 223 untracked ni cambios dirty y conserva metadatos Git | Base `git archive HEAD` sin `.git` + overlay selectivo por SHA y sin enlaces |
| **V03** | ¿Se dirá que el candidato está listo por copiar archivos? | N3 §§19–20 no imponía equivalencia del grafo de imports/assets ni smoke del candidato como condición dura | Paridad de fuentes con manifiesto de dependencias; estados `PARITY_ONLY_NOT_COMPILED` vs `READY_LOCAL_SCOPED` |
| **V04** | ¿Heredarán falsamente 86 PASS desde otro árbol? | `HOST_RESULTS.csv` liga pruebas y propietarios a SHA concretos | Reutilizar 86 solo si identidades SHA de rutas relevantes se mantienen; test UI nuevo es independiente |
| **V05** | ¿Un spy de red desconectado del código da falso PASS offline? | N3 §13 permitía instrumentación sin garantizar el punto de enlace; un contador 0 no prueba invocación de ruta real | Trazar camino de imports/cliente real y barrera que sí sea alcanzada; matriz con cero llamadas significativas |
| **V06** | ¿Un widget helper sustituye a `KioskScreen`? | N2 `KIOSK_GATE_MATRIX.csv`: tarjeta sí probada, acciones de pantalla NO | `WidgetTester` de clase/ruta real, `tap`, persistencia y re-render con oráculo visible |
| **V07** | ¿Un test con reloj real falsea bordes nocturnos? | N3 §11 pedía tres instantes pero podía reusar reloj no controlado | Reloj fijo, fecha de servicio y aserciones antes/en/después de fin; no `pumpAndSettle` infinito |
| **V08** | ¿Una seam de test introduce segunda lógica? | N3 §12 la autorizaba ambiguamente | Solo parámetro opcional en propietario existente; prohibir motor/servicio/schema/DI nuevo |
| **V09** | ¿Se acreditará respaldo off-device por candidato local? | Snapshot y candidato están en D: | `OFF_DEVICE_BACKUP=NO`; plan de destino privado autorizado separado de ejecución |
| **V10** | ¿Se filtrará código sensible en GitHub/ZIP? | PR2 público; WIP avanzado privado y muchas rutas untracked | No push; ZIP whitelist de metadata sanitizada, fuentes/diffs/snapshot solo en private; revisión previa de PII/secretos |

**Dictamen del verdugo:** N3 tiene una finalidad productiva válida, pero un candidato reconstruido sin prueba de paridad y un test offline con spy decorativo serían dos falsos avances. **No es correcto repetir C2/N2 para ocultar esas brechas.**

## 3. JUEZ — 10 pasadas contrafactuales, decisión y justificación

| Pasada | Contrapropuesta contrastada | Decisión argumentada |
|---|---|---|
| **J01** | Seguir N3 sin corregir instrucciones | **Rechazar** porque puede etiquetar un clon incompleto como candidato READY; sustituir solo si N3 no arrancó |
| **J02** | Exportar el WIP entero como ZIP o hacer clon a ciegas | **Rechazar** por untracked/secretos y riesgo de metadatos Git; preferir `git archive HEAD` + overlay acotado |
| **J03** | Exigir integración completa PR3 de inmediato | **Rechazar**: PR3 F0 no representa WIP avanzado y puede romper contratos; comparar por matriz existente, sin merge |
| **J04** | Volver a ejecutar las 86 pruebas por precaución | **Rechazar** si las rutas SHA no cambiaron; correr solo widget nuevo y regresiones causales si cambian propietarios |
| **J05** | Afirmar offline por fixture local y sin HTTP visible | **Rechazar**: demostrar la ruta real y el punto de bloqueo de posibles clientes, sin afirmar modo avión |
| **J06** | Agregar arquitectura de test separada | **Rechazar**: un widget real con seam mínima opcional y fake local existente preserva KISS |
| **J07** | Probar solo botón habilitado | **Rechazar**: exigir tap y efecto en repo/SQLite más render; diferencia entre presencia y comportamiento |
| **J08** | Dar `READY_LOCAL` sin smoke compilado | **Rechazar**: si falta SDK/config hay paridad verificable, no ejecutabilidad; separar estados |
| **J09** | Subir todo a repo público para mantener GitHub al día | **Rechazar** antes de evaluación de secretos, permiso explícito y backup off-device; actualizar la *documentación* ahora |
| **J10** | Crear N4, auditoría completa o pedir QA al propietario | **Rechazar**: mismo TASK N3-R1, un macrobloque, una ejecución Codex, un ZIP y puerta siguiente al Director |

**Dictamen del juez:** N3-R1 es una corrección documental de la campaña aún pendiente, no un nuevo ciclo de implementación. El orden correcto es test de `KioskScreen` real → límite offline verificable → candidato HEAD+overlay privado con paridad → ZIP. Un fallo de candidato no debe borrar un PASS UI, ni un PASS UI autoriza integración/release.

## 4. Decisiones de ingeniería cerradas y riesgos que permanecen

- **Un motor:** conservar propietarios existentes `KioskScreen`, cálculo `kiosk_time`, repositorio SQLite/attendance y tarjeta. Cambiar solo dueño real de fallos; no insertar nueva DB, wrapper, módulo legal ni backend paralelo.
- **Host es host:** `PASS_HOST_SCOPED` de N2 sigue vigente solo a hashes cubiertos. N3 debe producir prueba de pantalla real y prueba de la ruta offline host; Android SQLCipher/Keystore/corrupción/reinicio físico siguen `NOT_RUN`/`BLOCKED_HARNESS`.
- **Candidato privado, no publicación:** la integridad del candidato depende de tracked BASE + tracked modificados + untracked necesarios + assets + configuración, y prueba de compilación. Una copia reconstruida en D: sigue sin respaldo off-device.
- **GitHub:** PR2 continúa siendo autoridad documental; PR1/PR3 Draft de código F0 no deben mezclarse automáticamente. No se puede actualizar el WIP privado en GitHub desde este chat porque el árbol avanzado no está aquí ni hay aprobación de publicarlo.
- **Privacidad y legal:** no incorporar usuarios, horarios laborales reales, imágenes, claves ni contratos OD. `requestId`/legado `requetId`, `SERVER_STORED != RECOGNIZED`, B19/B20 deny-all y PingPongLaw L1–L6 intactos.

## 5. Ruta mínima después de N3-R1 hacia el lanzamiento

| Puerta | Requisito para pasar | Responsable siguiente |
|---|---|---|
| G-N3 | `KioskScreen` tap real/estado nocturno + offline host scoped; candidato privado con paridad/smoke o bloqueo específico, ZIP sanitizado | Codex → ChatGPT certifica |
| G-custodia | Copia íntegra de WIP necesaria para reconstrucción **fuera del equipo** en destino privado autorizado, manifest SHA y restauración de muestra; revisión de secretos en todo el candidato | Director define autorización; Codex ejecuta |
| G-integración | Commit/PR del código avanzado en rama/repositorio privado elegido, sin sobrescribir F0/PR3; build/test focal del candidato; revisión independiente | Codex + Director + aprobación del propietario |
| G-Android | Resolver causa del runner/VM Service sin logcat ajeno, 4 oráculos SQLCipher/Keystore/idempotencia/corrupción, restart readback real | Codex cuando se autorice |
| G-Pro | Tenant/identidad/outbox/PAT/HTTP/portal/empleados, contratos OD confirmados, pruebas E2E con datos sintéticos | Codex + Director |
| G-lanzamiento | UX L4, QA independiente L5, UAT, seguridad, firma y despliegue solo con GO explícito | Director y propietario |

**No son hitos aprobados automáticamente:** `H9_GLOBAL=NO_GO`; `B22=NOT_AUTHORIZED`; `RELEASE=NO_GO` hasta evidencia integral. No requiere otra ronda 10+10 antes de ejecutar N3-R1. Cuando regrese el ZIP, adjudicarlo por evidencia y avanzar al bloqueo siguiente sin perseguirse la cola.

## 6. Orden única

**NEXT_OWNER=CODEX_LUNA_N3_R1_IF_N3_NOT_ALREADY_STARTED.** Si N3 ya está en ejecución, **no reiniciar** ni sustituir en caliente; solicitar el ZIP que produzca. Después de un ZIP N3: **NEXT_OWNER=CHATGPT_DIRECTOR**.