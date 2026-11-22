# JORNATO — DICTAMEN DEL DIRECTOR: N7-R1 CERRADO / PUERTA DE ENTORNO

**Corte:** 21 de noviembre de 2026, Colombia. **Procedencia:** ZIP real N7-R1 recibido, leído y comprobado; no se accedió al PC del propietario. **Estado:** N7 terminado `PARTIAL_WITH_GAPS`; no hay tarea de Codex activa ni permiso implícito de reparación.

## Integridad y evidencia exacta

- ZIP: `JOR-N7-PHP-IMAGE-BYTES-ROOT-CAUSE-20261121-UNICO.zip` (5.851 bytes), SHA-256 `BFB06C090009B7EA7FDB886D52FDE86C09FA3F0E828755BCBF06D1435B14D1EB`, 7 archivos; CRC PASS; 6/6 miembros comprobados por SHA-256 y bytes. El manifiesto se excluye a sí mismo.
- Imagen PHP 8.3 original `php:8.3-cli-bookworm`: `docker cp -L` de `/bin/sh` rc=1, sin archivo; copia de `/usr/local/bin/php` rc=0, archivo local de **0 bytes**. No se inspeccionó ELF original.
- Imagen PHP 8.4 alternativa `php:8.4-cli-bookworm`: copia de `/bin/sh` rc=1; PHP copiado rc=0, **21.784.600 bytes**, SHA-256 `94DE6F810C20A708D5660F384CB6092BD7DB3442D7557FCA8E003B340AE779D1`; estructura ELF64 x86-64 plausible, **no ejecutada**, **no certifica PHP runtime**.
- Las dos imágenes declaran `linux/amd64` y el daemon `desktop-linux` corresponde a `linux/amd64`. Los campos ImageID y RepoDigest tienen distinta semántica, incluso cuando se reportan cadenas hexadecimales iguales; no concluye procedencia ni corrupción.
- N7 no inició contenedores; creó y eliminó únicamente dos contenedores **detenidos y propios**. Inventario PRE/POST reportado 109 contenedores, 42 redes, 97 volúmenes; identidades y estados normalizados de recursos ajenos sin cambios. Sin WIP modificado: rama `codex/jor-b08-h4-domain-20261025`, HEAD `faf5fe283191f8b5a2724b397009512a2caec1b6`, 235 rutas (11 modificadas/224 no trackeadas), índice SHA-256 `25CC609803D7E68D5F3ECF428198B2432CF1EA37030546735DD3F03299D905E1`, 0 staged.
- Flutter N5 `PASS_CANDIDATE_SCOPED_REUSED`; N6 PHP `BLOCKED_PHP_IMAGE_EXEC_REUSED`; servidor PHP/SQL y E01–E08 NO ejecutados; Android físico NOT_RUN; backup externo NO; `RELEASE=NO_GO`.

## Afirmaciones soportadas y límites

**Demostrado:** N6 no ejecutó PHP correctamente; N7 sufrió fallos de lectura/copia de rutas de imágenes y un archivo de cero bytes, sin dejar recursos propios activos.

**No demostrado:** que la causa sea la arquitectura CPU, corrupción de imagen, capa Docker/WSL dañada, defecto en Laravel, disco físico, permisos o error de ruta local. El ZIP no contiene el stderr detallado ni los comandos completos de `docker cp`; sus retornos no descartan un problema de ruta de destino, resolución de enlace simbólico o captura del cliente. No atribuir más de lo observado.

**Por qué no seguir haciendo N6/N7:** repetir probes del mismo binario sin corregir una causa no aporta evidencia nueva; la aplicación y los otros proyectos no pueden asumir riesgos por un fallo del runtime compartido.

## Única puerta siguiente, que necesita autorización del propietario

**Propuesta:** una sola investigación administrada y de **solo lectura** de los registros del incidente y metadatos de Docker Desktop/WSL, empezando por los archivos privados de N7. No reiniciar o reconfigurar Docker Desktop, no abrir ni montar VHDX, no iniciar/copiar contenedores, no descargar imágenes, no modificar caches/volúmenes/redes y no consultar credenciales de otros proyectos. No ejecutar `docker desktop diagnose` ni subir paquetes diagnósticos automáticamente: pueden contener información privada.

Documento preparado: [CODEX_JORNATO_DOCKER_DESKTOP_DIAGNOSTICO_RO_CONDICIONAL_20261121.md](CODEX_JORNATO_DOCKER_DESKTOP_DIAGNOSTICO_RO_CONDICIONAL_20261121.md), **STATUS=AWAITING_OWNER_APPROVAL; ACTIVATED_BY_DIRECTOR=NO**. NO es una orden ejecutable hasta autorización textual específica. El resultado debe clasificar causa/evidencia y decidir una reparación posterior solo con respaldo y permiso propio; nunca ejecutar reparación automáticamente.

### Alternativas adversariales rechazadas

- `docker system prune`, `docker network prune`, `docker image rm`/re-pull, reset de Docker, WSL shutdown, editar daemon/IPAM o rutas de imágenes: alto riesgo para otras instancias Codex, sin causa raíz confirmada.
- Cambiar el código de Laravel o usar PHP host Windows: no guarda relación con errores de ejecución/copia dentro de las imágenes y contradice Docker aislado obligatorio.
- Repetir Flutter 9/9, N5 o N7: alcances cerrados; sin cambio causal.
- Dar GO de release por ELF estructuralmente plausible: error de interpretación; no se probó runtime ni UAT.

### Referencias técnicas verificadas el 21-nov-2026

- Docker `cp -L` sigue enlaces simbólicos en origen: https://docs.docker.com/reference/cli/docker/container/cp/
- Docker Desktop ofrece `docker desktop logs` con filtros `--since`, `--until`, `--priority`: https://docs.docker.com/reference/cli/docker/desktop/logs/
- El menú de Docker Desktop incluye reset/cleanup destructivos y su comando de diagnose puede recopilar y cargar diagnósticos: https://docs.docker.com/desktop/troubleshoot-and-support/troubleshoot/
- Logs del daemon Windows/WSL2: https://docs.docker.com/engine/daemon/logs/

**NEXT_OWNER=CHATGPT_DIRECTOR_WAIT_OWNER_APPROVAL. CODEX_NO_ACTIVE_TASK. RELEASE=NO_GO.**
