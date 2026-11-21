# JORNATO — POLÍTICA TRANSVERSAL DE AISLAMIENTO PHP + BD EN DOCKER · 21-NOV-2026

**Origen y autoridad:** regla explícita del propietario, aplicable a Jornato y a los demás proyectos Windows ejecutados por distintas instancias de Codex en carpetas separadas. **La disponibilidad de Docker en el equipo fue informada por el propietario**, no comprobada desde ChatGPT. Se registra en el PR #2 únicamente como política de continuidad y criterio de futuros prompts. No ordena ninguna acción concurrente en la ejecución N4 existente.

## Regla principal

**Toda ejecución de PHP (Laravel/Artisan/PHPUnit/Composer si ejecuta PHP) y de motores de bases de datos se hace dentro de contenedores Docker AISLADOS de cada proyecto.** En el host Windows pueden inspeccionarse archivos de forma estática y orquestarse comandos Docker; **no arrancar servicios PHP/MySQL/MariaDB en Windows** ni reutilizar el runtime, contenedor, red, volumen, credencial o base de otro proyecto. Si una tarea requiere PostgreSQL, Redis, etc., aplicar aislamiento equivalente. Proyectos separados **no** equivalen a contenedores y recursos aislados.

### Contrato concreto para el siguiente macrobloque que use PHP o BD

1. **Preflight sin mutación:** comprobar Docker Desktop/Engine/Compose y disponibilidad del daemon; `docker info`, `docker compose version`, `docker ps`, `docker network ls`, `docker volume ls` de solo lectura, sin volcar secretos de proyectos ajenos. Si el engine no está disponible, `BLOCKED_DOCKER`, sin instalar herramientas, cambiar servicios Windows ni forzar inicio si perjudica a otros agentes.
2. **Identidad única del proyecto:** usar directorio de trabajo y `docker compose -p jornato-<identificador_corto>` (proyecto Compose inequívoco, distinto de todos los demás). Etiquetar recursos propios; verificar por labels/nombres que pertenecen solo a esta campaña antes de alterarlos.
3. **PHP y DB en contenedores propios:** PHP Laravel/CLI/Composer/PHPUnit dentro del servicio PHP Jornato; DB MariaDB QA en su propio servicio y **volumen de datos nuevo de Jornato** (sin mounts de datadirs de otros proyectos). Fijar versiones compatibles con código/lockfiles existentes y disponibilidad de imágenes; sin pulls no autorizados. No usar DB/tenant o credenciales reales de producción.
4. **Red y puertos:** red(es) dedicadas al Compose Jornato; comunicación PHP↔DB por nombre de servicio interno. Preferir **DB sin puerto publicado al host**. Si el navegador o tests necesitan HTTP host, publicar únicamente en `127.0.0.1:<puerto_verificado_libre>`, nunca en `0.0.0.0`; registrar el puerto y comprobar que no se usó en otros proyectos. No modificar firewall/rutas globales, DNS ni puertos de otros proyectos.
5. **Colisiones Docker / IPAM:** existe antecedente de agotamiento de rangos IPAM. Si no se puede crear una red aislada por limitación de IPAM, **STOP `BLOCKED_DOCKER_IPAM`**; no `docker network prune`, cambiar rangos daemon globales, reasignar/compartir redes ajenas ni borrar redes para “hacer espacio”. No improvisar nuevos contenedores hasta decidir plan seguro.
6. **No destrucción cruzada:** prohibido `docker system prune`, `docker volume prune`, `docker network prune`, `docker stop/rm` de recursos sin propiedad comprobada y `docker compose down --volumes` en nombres ajenos. `down`/borrado solo del Compose Jornato identificado y solo cuando proceda, preservando evidencia/volúmenes QA si se requiere reproducción.
7. **Aislamiento de datos de prueba:** schema/base QA nuevos, fixtures A/B sintéticos, usuario de mínimo privilegio, identidades explícitas de volumen/servicio/red. Antes de migración destructiva verificar `database_name`, host interno, propietario y volumen de datos de prueba. No heredar .env real ni conexiones a endpoints exteriores. Si hay duda: `BLOCKED_DB_IDENTITY`.
8. **Recursos compartidos y concurrencia:** respetar CPU/RAM/disco disponibles para varios Codex; detener el arranque si agota recursos necesarios para otra aplicación. No reiniciar Docker Desktop ni modificar daemon configuration sin aprobación explícita. No utilizar nombres genéricos `php`, `db`, `mariadb` fuera del namespace Compose.
9. **Evidencia mínima en ZIP sanitario:** nombre del proyecto Compose, imagen/digest o versión PHP y DB, nombres/labels de servicios propios, IDs de volumen/red sin credenciales, modo de publicación de puertos, identidad de QA, comandos y exit codes, resultados y limpieza limitada a recursos propios. En ZIP NO incluir .env, passwords, tokens, backups DB, datos laborales ni `docker inspect` completo con secretos.
10. **Reutilización:** mantener una sola definición Compose por proyecto/entorno QA, no crear varios stacks paralelos para probar la misma causa. Si falla un preflight, marcar bloqueo real y continuar trabajo estático independiente; no más auditorías ni instalaciones por defecto.

## Vigencia y reconciliación de N4 en ejecución

**N4 ya estaba en ejecución cuando el propietario dictó esta política.** Su sección C3 permite MariaDB QA efímera directamente en Windows, incompatible con la regla nueva; se deja la orden N4 intacta para no provocar una ejecución concurrente distinta. El Director debe leer el ZIP N4 y clasificar de forma explícita `N4_RUNTIME_DOCKER_ISOLATED=PASS|NOT_RUN|NOT_VERIFIED|NONCOMPLIANT`.

- Si N4 hizo pruebas SQL/PHP **fuera de Docker**, **no** se aprobarán como QA aislada conforme a esta política aunque hayan sido exitosas. No borrar evidencias ni datos; no intentar repararlo a ciegas en el host.
- Si N4 no alcanzó la sección de DB/servidor o quedó bloqueada por entorno, el siguiente macrobloque deberá usar esta norma y aprovechar el código ya desarrollado.
- **No** iniciar una segunda instancia de Codex ni emitir en paralelo un prompt distinto para N4. Tampoco autoriza tocar/migrar/parar contenedores existentes.

**Se integra a las leyes KISS/PingPongLaw L1–L6** como restricción de ejecución/infrastructura. No modifica reglas de negocio, `requestId`, `requetId`, estados `SERVER_STORED`/`RECOGNIZED`, ni autoriza B22 o despliegue. `RELEASE=NO_GO` hasta puertas originales de QA y UAT.

**NEXT_OWNER_NOW=CODEX_LUNA_FINISH_N4_IN_FLIGHT; AFTER_N4_ZIP=CHATGPT_DIRECTOR_RECONCILE_DOCKER_POLICY.**
