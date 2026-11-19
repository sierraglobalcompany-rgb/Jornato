# Jornato — conciliación local de WIP avanzado vs. GitHub PR #3

**Objetivo:** detectar qué módulos Dart de la rama F0 de GitHub ya existen literalmente en el proyecto avanzado de Windows, sin sobrescribir, fusionar ni publicar código. Esta herramienta reduce duplicaciones; **NO integra automáticamente los dos árboles**.

## Alcance fijado

- Referencia remota: `sierraglobalcompany-rgb/Jornato`, PR #3, commit **`78b32284c207f2d04a4c5b6cb3c21ebb470eb46d`**.
- Compara únicamente los nombres de **cinco módulos Dart** de dominio: `attendance.dart`, `attendance_archive.dart`, `attendance_csv_report.dart`, `attendance_report.dart` y `location_rule.dart`.
- Usa la identidad `Git blob SHA-1` (cálculo del formato blob de Git) para identificar archivos *exactamente* iguales; **no** implica auditoría de seguridad, equivalencia semántica ni soporte de compilación.
- Inventario agregado por extensión: Dart, PHP, Kotlin, Java, SQL, JavaScript y TypeScript; no incorpora el contenido de esos archivos al informe.
- Omite carpetas de secretos, datos, dependencias, archivos voluminosos y enlaces simbólicos. **No detecta todos los secretos** ni garantiza la seguridad de los metadatos reportados.

## Ejecutar gratis en Windows, sin Codex ni GitHub Actions

Se requiere **Python 3** si ya está disponible. En PowerShell, dentro de una carpeta de informes o desde donde hayas guardado el script:

```powershell
py -3 --version
py -3 .\JORNATO_CONCILIAR_WIP_GITHUB_SIN_CODEX.py --wip 'D:\codex\Jornato' --out 'D:\codex\_REPORTES\Jornato\COMPARACIONES'
```

Si clonas el PR documental #2 y quieres comprobar el propio puente sin tocar el WIP, ejecuta `py -3 -m unittest discover -s tests -p test_jornato_wip_bridge.py -v` desde la raíz del clon.

El script nunca escribe dentro de `--wip`; crea **solo** `RESUMEN.md` y `MATRIZ.json` en una subcarpeta nueva de `--out`.
**Puerta fail-closed:** si algún directorio es inaccesible o hay archivos fuente ilegibles, el reporte se conserva, marca `inventory_complete=false`, y el proceso sale con **código 3** (`REPORT_PARTIAL_SCAN_INCOMPLETE`). Nunca interpretar una búsqueda incompleta como ausencia o como autorización para copiar módulos. Requiere Python 3.10+ y no sigue junctions ni symlinks.
 No ejecuta Git, no instala dependencias, no consulta internet, no ejecuta pruebas Dart ni modifica el índice/stage.

**No usar el reporte como orden de merge.** `SAME_BYTES` confirma mismos bytes; `REVIEW_DIFFERENT` exige estudiar código, `REVIEW_AMBIGUOUS` exige seleccionar ubicación, `READ_BLOCKED` indica un candidato inaccesible y `SCAN_INCOMPLETE` significa que no se pudo revisar todo el árbol. `NOT_FOUND_BY_BASENAME` **no significa** que falte la funcionalidad (puede tener otro nombre). Revisar manualmente rutas, metadatos y secretos antes de compartir informes. Nunca compartir `.env`, llaves, datos de empleados, bases de datos ni fotos.

Si Python 3 no está disponible, conservar el WIP intacto y utilizar el flujo PowerShell ya existente para crear un ZIP de fuentes **previa revisión manual**. No es necesario instalar software de pago ni gastar tokens Codex.

## Evidencia ejecutada en ChatGPT

- Archivo: `tools/JORNATO_CONCILIAR_WIP_GITHUB_SIN_CODEX.py`.
- QA sintética independiente: `tests/test_jornato_wip_bridge.py` ejecutada con **Python 3.13.5**.
- **14 tests PASS** (versión focal nueva, ejecutados en Python 3.13): los 10 originales más archivo inaccesible, directorio no legible, salida parcial con código 3 y enlace simbólico de un candidato. Una ejecución local de fuente real aún es `NOT_RUN`.
- **NO_RUN**: script en el WIP Windows real, Dart/Flutter, Android, SQLCipher, integración con Laravel, H9 y lanzamiento.
- **NEXT_OWNER:** CHATGPT DIRECTOR, tras disponer de los reportes y un snapshot de fuentes sanitizado y autorizado para estudiar diferencias reales. Nada de merge automático.

## Corrección focal posterior: decisiones globales de inventario (18-nov-2026)

La clasificación de **ausente** se revisa al finalizar la lectura de todos los candidatos: si algún archivo del árbol resultó inaccesible, una ausencia previamente calculada cambia a `SCAN_INCOMPLETE`. Esto evita un resultado dependiente del orden de los módulos. La herramienta mantiene código de salida **3** para cualquier inventario parcial; se conserva el reporte sin modificar el WIP.

**QA ejecutada en Python 3.13.5:** **15/15 unittest PASS**, `py_compile` PASS y ejecución CLI PASS en árbol sintético con salida externa; **WIP de Windows NO INSPECCIONADO**. No atribuir esos PASS a Android/Flutter, Laravel o release.
