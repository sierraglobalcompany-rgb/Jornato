# JORNATO — DICTAMEN INDEPENDIENTE DEL DELTA N4 × POLÍTICA DOCKER · 10 VERDUGO + 10 JUEZ

**Corte:** 21 de noviembre de 2026, Colombia. **Objeto exclusivo:** impacto de la **nueva norma obligatoria PHP+BD aislados con Docker** sobre el macrobloque N4 ya en ejecución. Esto **NO** reabre las auditorías C2/N1/N2/N3 ni revalida sus tests; tampoco constituye 20 ejecuciones en Windows. Son 20 comprobaciones analíticas, 10 adversariales seguidas de 10 decisiones contrastadas.

**DECISIÓN PRINCIPAL:** `N4_IN_FLIGHT=YES_REPORTED_BY_OWNER`; mantener `docs/CODEX_LOTE_ACTUAL.md` **INMUTABLE** hasta recibir ZIP. No enviar prompt distinto a Codex ni abrir otra instancia. La sección **C3** de N4 autoriza MariaDB nativa Windows, incompatible con la nueva política de aislamiento. La sección **C4** tampoco obliga a que PHP corra en contenedor. Esto exige **clasificación posterior, no otra ejecución concurrente**.

## Fuentes exactas que se usaron

- Markdown local subido y abierto: `CODEX_JORNATO_N4_MACROBLOQUE_APP_SERVIDOR_INTEGRACION_20261121.md`, con secciones 0, A, B, C3–C5 y D; documento en GitHub `docs/CODEX_LOTE_ACTUAL.md`, blob `694b7c4c7520ee137327d1f2a38081979aaa82d5` al inicio de esta revisión.
- GitHub: `docs/JORNATO_DOCKER_AISLAMIENTO_PROYECTOS_20261121.md`, blob `7c157918daea3087ebf8be4ac79a597f58f69994`; PR #2 documental Draft y PR #1/#3 F0 Draft. No hay acceso directo a `D:\codex\Jornato`.
- ZIP N3-R1 `JOR-N3-UI-OFFLINE-INTEGRATION-CANDIDATE-20261121-UNICO.zip`: SHA256 `C960FA83ABAE677E4DDF1E59432C0915B75A85017FD02D65F4FBD9731ACA57DA`, 11 miembros CRC PASS, UI 9/9 y vecino 4/4 reportado; candidato `PARITY_ONLY_NOT_COMPILED`. No confundir con N4.
- Docker oficial: https://docs.docker.com/compose/how-tos/project-name/ , https://docs.docker.com/compose/how-tos/networking/ , https://docs.docker.com/engine/network/ , https://docs.docker.com/reference/cli/docker/compose/down . Los manuales explican mecanismos Docker, **no verifican el estado del host del usuario**.

## I. VERDUGO — 10 pasadas reales de revisión documental del delta

| Pasada | Verificación que hice | Ataque / problema | Sentencia y corrección |
|---|---|---|---|
| **V01** | Releí N4 sección C3 contra la norma Docker nueva | C3 permite MariaDB en Windows y host loopback; no exige Docker Compose. | **Incompatibilidad MATERIAL CONFIRMADA. No calificar QA servidor como aislamiento conforme si se ejecutó en host; corregir exclusivamente la puerta de runtime después del ZIP.** |
| **V02** | Contrasté C4 y C5 con el requisito PHP en contenedor | La orden verifica PHP/vendor existentes, pero no obliga a ejecutar php, Artisan, PHPUnit y Composer bajo Docker. | **GAP MATERIAL: fuente y tests PHP deben ejecutarse dentro del servicio PHP del Compose exclusivo, nunca sobre runtime global Windows.** |
| **V03** | Contrasté afirmación «Docker disponible» con observabilidad | Docker fue reportado por el propietario, no inspeccionado desde esta sesión ni desde el ZIP N4 aún inexistente. | **Registrar DOCKER_ENGINE=NOT_VERIFIED; un preflight de solo lectura es condición antes de cualquier up.** |
| **V04** | Examiné propiedad de recursos en host concurrente | Proyecto Compose con -p único no valida automáticamente networks external, volúmenes externos, bind mounts y puertos compartidos. | **Exigir labels/propiedad, manifiesto de recursos y verificación de que no hay external ni rutas de otro proyecto. Bloquear antes de crear recursos si es ambiguo.** |
| **V05** | Atacé el escenario de IPAM agotado | N4 deja posibilidad de infraestructura manual y no prescribe reacción a agotamiento de pools Docker. Hay antecedente de bloqueo IPAM en Jornato. | **BLOCKED_DOCKER_IPAM; prohibir prune, cambio global de daemon, redes compartidas o creación repetida de variantes.** |
| **V06** | Ataqué puertos y acceso cruzado | Loopback no basta si otro servicio ya usa el puerto; una DB publicada puede abrir superficie innecesaria. | **DB sin puerto publicado; PHP⇄DB en red propia por DNS de Compose; HTTP host solo 127.0.0.1:puerto libre, si es imprescindible.** |
| **V07** | Inspeccioné destrucción/limpieza tras QA | Borrado genérico de contenedores, redes o volúmenes puede afectar a otros Codex o perder evidencias. | **Prohibir system/network/volume prune; down --volumes solo con autorización específica y propiedad acreditada, preferiblemente NO durante la certificación.** |
| **V08** | Ataqué la fiabilidad de identidad de DB en migraciones | Un .env host, credenciales heredadas o nombre «qa» no prueban que el destino sea desechable; migrate sobre otra DB sería grave. | **Verificar nombre/usuario/host/volumen desde configuración sintética inyectada y propiedad Compose. Nunca portar .env real, ni datos laborales.** |
| **V09** | Contrasté cifras históricas con identidad de fuente | Los 158/2450 backend históricos y 86+9+4 host no se heredan automáticamente al árbol candidato si difieren SHAs o dependencias. | **Reusar PASS únicamente con cadena exacta de SHA/alcance; nueva QA solo focal para rutas alteradas y contratos E01–E08 no acreditados.** |
| **V10** | Inspeccioné salida/semáforo N4 | N4 no exige SERVER_RUNTIME_DOCKER_ISOLATED, COMPOSE_OWNERSHIP ni IPAM status en su contrato de retorno. | **Fijar evaluación ex post por Director y nueva evidencia en futuros ZIP; jamás convertir PASS de ejecución host en PASS_DOCKER por inferencia.** |

## II. JUEZ — 10 decisiones contrapuestas contra alternativas de menor seguridad o más ruido

| Pasada | Alternativa evaluada | Contraste adversarial | Decisión motivada |
|---|---|---|---|
| **J01** | ¿Cambiar N4 en GitHub y reenviarlo ahora? | Mayor riesgo: Codex en vuelo aplica orden vieja mientras otra rama corrige infraestructura. | **RECHAZAR. N4 permanece inmutable y único; publicar solo auditoría y plan POS-N4 sin activación.** |
| **J02** | ¿Cancelar por completo el N4 actual? | Se perdería trabajo potencialmente útil en fuente Flutter/Laravel, paridad y pruebas estáticas. | **RECHAZAR cancelación automática. Aceptar por separado evidencias host/candidato; QA PHP/DB se clasifica contra nueva política.** |
| **J03** | ¿Tratar pruebas host PHP correctas como inválidas en todos los sentidos? | Exit PASS puede ser evidencia funcional pero no prueba de no interferencia con otros proyectos. | **CONSERVAR evidencia técnica como observación, pero calificar NO_CONFORME_DOCKER si se hizo fuera de contenedor; no usar para autorizar release.** |
| **J04** | ¿Es suficiente docker compose -p? | Docker crea nombres con namespace, pero puertos host y external volumes/networks siguen potencialmente compartidos. | **APROBAR -p solo junto con inspección de labels, sin external, volúmenes exclusivos y ausencia de puertos DB publicados.** |
| **J05** | ¿Añadir Dockerfile y cinco microservicios? | Sería complejidad nueva y desviación KISS si la app solo requiere PHP y DB. | **RECHAZAR. Reutilizar Compose existente si íntegro; si no, especificación QA mínima de PHP y MariaDB con imagen precargada y sólo red/volumen exclusivos.** |
| **J06** | ¿Forzar Docker a funcionar con IPAM agotado? | Borrar redes o cambiar address-pools es global y puede afectar muchos proyectos en curso. | **RECHAZAR. BLOCKED_DOCKER_IPAM sin mutación ajena. Continuar contrato Laravel estático y reconstrucción de fuente en privado.** |
| **J07** | ¿Repetir todas las suites una vez en Docker? | La mera ejecución en contenedor puede requerir prueba de equivalencia de entorno, pero repetir 158/2450 sin causa añade mucho costo. | **APROBAR solo verificaciones mínimas de boot, migración y E01–E08 faltantes; ampliar únicamente si cambió código base, motor PHP o DB de forma causal.** |
| **J08** | ¿Integrar y publicar código WIP antes de QA para acelerar? | WIP tiene numerosos untracked; falta backup fuera del PC y autorización del repositorio destino. | **RECHAZAR. Candidato privado y fuente con hashes son preparación; no merge, push, release, ni secretos al PR documental.** |
| **J09** | ¿Convertir fallos de entorno en cambios de producto? | Composer/vendor/cachés, port o IPAM ausentes no prueban defecto Laravel ni Flutter. | **RECHAZAR. Clasificar BLOCKED_ENV/BLOCKED_IPAM y conservar defectos de código solo con oráculo reproducible y SHA.** |
| **J10** | ¿Publicar ahora un nuevo prompt ejecutable N4-R1/N5? | El ZIP N4 no está disponible y su ejecución continúa; el bloque definitivo depende de lo que haya hecho en Docker o Windows. | **RECHAZAR activación. Preparar macrocondicional NO EJECUTAR, y decidir una única orden nueva solo después de verificar ZIP N4.** |

## III. Dictamen técnico tras 20 pasadas

1. **N4 no debe interrumpirse, reiniciarse ni ejecutar un N4-R1 paralelo.** El `TASK=JOR-N4-FULL-SOURCE-AND-SERVER-QA-20261121` y el ZIP de retorno siguen siendo la autoridad de esa ejecución. El dueño reporta N4 en curso; no he inspeccionado el proceso de Windows.
2. **La regla del propietario prevalece para cualquier ejecución siguiente:** PHP, Artisan, PHPUnit y MariaDB deben residir en stack Docker separado por Compose project, con red y datos propios. La existencia de Docker en PC es **reportada**, no verificada.
3. **Aceptación graduada cuando llegue N4:** `APP_SOURCE_PARITY` / `FLUTTER_HOST` / `SERVER_SOURCE_STATIC` pueden ser útiles si sus SHA, tests y logs lo avalan; `SERVER_QA_ISOLATION` debe clasificar `PASS_DOCKER_VERIFIED`, `NOT_RUN`, `BLOCKED_DOCKER`, `BLOCKED_DOCKER_IPAM`, `NOT_VERIFIED`, o `NONCOMPLIANT_HOST_RUNTIME`. **Nunca** `PASS_DOCKER` por un PASS MariaDB Windows.
4. **No destruir recursos ajenos:** nunca `prune` global ni Docker daemon restart para liberar IPAM. No usar `docker compose down --volumes` salvo propiedad comprobada, motivo y aprobación específica. La documentación oficial dice que `down --volumes` elimina volúmenes declarados en Compose; se protege evidencia y datos.
5. **Una próxima orden únicamente tras el ZIP N4.** Podrá reutilizar la parte completa y corregir SOLO la brecha demostrada de Docker/servidor, no volver a hacer las 86 pruebas N2, 9+4 N3 ni otro paquete de auditoría 10+10. El bosquejo condicionado se encuentra en `CODEX_JORNATO_POST_N4_DOCKER_MACROBLOQUE_CONDICIONAL_NO_EJECUTAR_20261121.md` y **NO** es la orden activa.

## IV. Decisión de rama post ZIP N4 (directrices, no ejecución)

| Resultado real del ZIP N4 | Decisión de Director | Trabajo siguiente permitido |
|---|---|---|
| App candidato y Laravel fuente PASS; PHP/DB Windows | Aceptar fuente y funcionalidad reportada **solo acotadas**, marcar `NONCOMPLIANT_HOST_RUNTIME` para QA de aislamiento | Un único gate correctivo Docker PHP+MariaDB sobre **copia privada** y E2E faltantes, sin repetir Flutter. |
| Docker PHP/DB verdaderamente exclusivo con evidencias | Convalidar alcance, evitar un segundo smoke innecesario | Cerrar gaps auténticos: backup off-device autorizado, Android físico, integración Pro, staging/UAT según gates. |
| Docker sin arranque por IPAM / imágenes ausentes | `BLOCKED_DOCKER_IPAM` / `BLOCKED_IMAGE_CACHE` | Documentar causa/propiedad; **NO** prune/daemon changes; continuar componentes estáticos, esperar autorización técnica. |
| Laravel fuente incompleta o candidata sin parity | `BLOCKED_SOURCE` / `PARTIAL_SOURCE` | Corregir selección de rutas/source, sin QA ni servidor ficticio. |
| N4 aún no entregó ZIP | `IN_FLIGHT` | **No activar otra orden**. |

## V. Estado y autoridad GitHub

`main` y PR #1/#3 de código siguen sin el WIP avanzado. El PR #2 documental es el único destino autorizado aquí para **esta revisión y continuidad**, no para subir PHP, backups, `.env`, fuentes privadas ni datos reales. `CODEX_LOTE_ACTUAL.md` N4 **NO SE MODIFICA**. Un cambio de documentación NO constituye ejecución del servidor.

**RESULTADO_AUDITORÍA_DELTA=CORRECCIÓN_OBLIGATORIA_POST_N4_SI_HAY_QA_PHP_DB_NO_CONFORME**
**N4=IN_FLIGHT_REPORTED; SERVER_DOCKER_COMPLIANCE=UNDETERMINED; H9_GLOBAL=NO_GO; B22=NOT_AUTHORIZED; RELEASE=NO_GO.**
**NEXT_NOW=CODEX_LUNA_FINALIZAR_N4; AFTER_ZIP=CHATGPT_DIRECTOR.**