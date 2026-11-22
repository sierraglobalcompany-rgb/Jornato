# JORNATO — DICTAMEN DEL DIRECTOR N6-R2 Y DECISIÓN N7 · 21-NOV-2026

## Evidencia leída y verificada directamente

ZIP adjuntado `JOR-N6-PHP-RUNTIME-CAUSE-ISOLATED-QA-20261121-UNICO.zip` de **7.742 bytes**, SHA-256 `664724B357008753353065F804817A990CEDE6FE5E6B41BEE2A5AF6A327B5AF4`, 9 miembros ZIP, CRC PASS, 8/8 filas del manifiesto correctas por SHA256 y longitud. Estos resultados son **verificación directa de los informes adjuntos**, no acceso directo al Windows/Docker del propietario. Las sondas, inventarios y custodia del WIP se acreditan según registros sanitizados suministrados por Codex.

### Resultado real, sin doble conteo

| Puerta | Estado recibido | Conclusión aceptada |
|---|---|---|
| N6_IMAGE_PREFLIGHT | PASS | Daemon e imágenes declaran linux/amd64; no demuestra integridad ELF ni ejecución |
| Imagen original php:8.3-cli-bookworm | /bin/sh error 255; php error 255 | Runtime inejecutable, no defecto Laravel probado |
| Alternativa php:8.4-cli-bookworm | /bin/sh error 255; php input/output error 255 | Segunda imagen tampoco ejecutable; extensión PHP sin verificar |
| N6_DOCKER_ISOLATION | NOT_RUN | No se creó Compose N6; sondas temporales N6 no dejaron recursos según PRE/POST |
| N6_DB | NOT_RUN | Ninguna autenticación SQL ni migración N6 |
| N6_E2E | 0/8 NOT_RUN | No inventar PASS de autenticación/tenants/outbox |
| N5 Flutter | PASS_CANDIDATE_SCOPED_REUSED | No reejecutar Pub ni 9/9 pruebas widget en mismo candidato |
| WIP | PASS_UNCHANGED (según Codex) | 235 rutas; 0 staged; mismo HEAD/índice PRE/POST |
| RELEASE | NO_GO | Android nativo, respaldo fuera D: y UAT siguen pendientes |

**Identidad técnica N6 reportada:** original imagen `sha256:232331112d3a7c5b98edeeddc3b85f610172f99352c0635fe6b3e166e47062cb`; alternativa imagen `sha256:b3e907a1108629c562c4bb313ce3449e34d49991f6bb2487913f6146f47200fe`. Estos son identificadores de *Image ID* reportados, no digests de manifiesto certificados de distribución. N6 pone el mismo valor en `RepoDigest`, hecho que N7 debe contrastar **sin presumir identidad**.

## Decisión independiente: NO volver a ejecutar PHP a ciegas

Se probaron cuatro ejecuciones N6, todas fallidas, incluyendo shell que no depende de Laravel. Esto demuestra **el fallo de ejecución de las imágenes seleccionadas**, no si la raíz es su archivo binario, la capa, el backend WSL/almacenamiento u otra condición del runtime. Corregir Laravel, editar vendor, instalar módulos, cambiar red/daemon o probar más tags no está justificado.

**Siguiente paso único N7:** usar `docker create` de un contenedor **detenido y exclusivo de N7** y `docker cp -L` para copiar solo `/bin/sh` y `/usr/local/bin/php` de la imagen original, comprobar ELF x86_64 sin ejecutarlos; alternativa cacheada solo si primer resultado no discrimina. Documentación Docker: https://docs.docker.com/reference/cli/docker/container/create/ y https://docs.docker.com/reference/cli/docker/container/cp/. Este método necesita una capa temporal en Docker y copia privada de bytes, pero no inicia servicios ni CPU de contenedor. **El resultado define permiso concreto: refresh oficial de imagen PHP (si bytes inválidos) o mantenimiento Docker Desktop/almacenamiento coordinado (si siguen válidos/no legibles).** No ejecutar ninguno automáticamente.

### Límites de seguridad del host compartido

- Mantener regla: PHP/BD solo Docker aislado por proyecto, jamás servicios Windows. No tocar contenedores N5 ni recursos de otras apps Codex.
- Cero `docker pull/build/prune`, reset/clean, restart del daemon, `wsl --shutdown`, cambios IPAM/volúmenes/redes, ni despliegue.
- N7 excluye Flutter, MariaDB, E2E, migraciones y QA Android. Solo examen causal para detener el ping-pong.
- No consolidar WIP a GitHub público sin respaldo fuera del disco, análisis de secretos y autorización propietario.

## Puertas después de diagnóstico

- Si se demuestra binario ilegible, decidir con dueño **una única** recuperación de imagen, conservando datos Docker y verificando procedencia; no borrar recursos ajenos.
- Si ELF x86_64 es válido y falla ejecución, el error queda **en runtime/storage no resuelto**; cualquier mantenimiento global Docker requiere ventana y coordinación con proyectos simultáneos.
- Si no hay acceso seguro para inspección, documentar la condición exacta y parar, sin usar un stack alternativo externo ni montar MariaDB en Windows.
- App Gratis Local no depende técnicamente del backend Pro para su candidato host, pero **Android nativo** y UAT siguen faltando; no declarar producto distribuible.

**NEXT_OWNER=CODEX_LUNA_N7. AFTER_ZIP=CHATGPT_DIRECTOR. H9_GLOBAL=NO_GO. B22=NOT_AUTHORIZED. RELEASE=NO_GO.**
