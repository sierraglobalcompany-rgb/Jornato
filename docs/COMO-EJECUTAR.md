# QA F0 reservada para Codex — sin GitHub Actions ni servicios pagos

**EJECUCIÓN SUSPENDIDA. El propietario NO puede hacer pruebas locales y
NO debe recibir tareas de instalación/terminal.** Esta guía queda lista
exclusivamente para Codex cuando vuelva a estar autorizado; no se ha
ejecutado Flutter/PowerShell para este commit. La validación focal de la
pantalla debe cubrir actualización automática del reloj, pausa, regreso
a primer plano, cancelación al finalizar jornada y bloqueo de marcas
futuras. No se crean nuevos tests hasta ejecutar la suite existente.

**Documento vigente: 19 de noviembre de 2026.** Esta guía valida únicamente el código Flutter F0 del [PR #3](https://github.com/sierraglobalcompany-rgb/Jornato/pull/3). **NO** valida el producto avanzado que está en **D:\codex\Jornato**. Nunca ejecutar estas instrucciones en ese WIP.

## Requisitos

Git, Windows PowerShell 5.1 o PowerShell 7 y **Flutter SDK instalado manualmente**. La ejecución puede ser offline si las dependencias ya existen en la caché local. No se instala nada, no se ejecuta CI y no se modifica configuración del PC.

## Una sola ejecución en clon limpio

~~~powershell
git clone --branch feat/jornato-f0-archive-shifts-no-ci-20261117 https://github.com/sierraglobalcompany-rgb/Jornato.git D:\codex\Jornato-F0-QA-CLON
Set-Location D:\codex\Jornato-F0-QA-CLON
powershell.exe -NoProfile -File .\scripts\qa_local_f0.ps1
~~~

La herramienta rechaza otra rama y un árbol Git sucio **antes** de hacer QA. Guarda log/transcript e informe TXT fuera del repo, en la carpeta temporal del usuario; puede usarse **-ReportDir** para indicar otra carpeta externa. Valida que HEAD, archivos staged y archivos tracked no cambien durante el proceso. No hace push, reset, clean, merge ni despliegue.

Ejecuta, en orden: versiones Flutter/Dart, smoke Dart puro, **flutter pub get --offline**, análisis Flutter y pruebas Flutter. Si Flutter o Dart faltan, el informe queda con **STATUS=BLOCKED** y motivo explícito, sin falso PASS. Si hay otro error, queda **FAIL**; solo muestra **PASS** cuando todos los comandos solicitados terminan correctamente.

**Conteo a fecha de este documento:** **119 tests Flutter escritos y NO_RUN** por el autor de estos cambios; **31 checks smoke Dart escritos y NO_RUN**. El script no puede afirmar su PASS hasta que se ejecute contra un SHA identificado y genere log real. Las 15 pruebas Python PASS del puente WIP del PR #2 son **distintas** y no certifican esta app.

## APK opcional — bloqueado en el árbol actual

Solo cuando el clon limpio **ya contenga** una carpeta Android válida, se podrá invocar:

~~~powershell
powershell.exe -NoProfile -File .\scripts\qa_local_f0.ps1 -ApkDebug
~~~

El PR #3 aún no trae carpeta Android. Por eso la opción informa un bloqueo si se usa ahora; no llama a **flutter create**. Para iniciar un proyecto Android en el futuro, estudiar el [contrato de producto](PRODUCTO.md), preservar el WIP y las decisiones de cifrado antes de introducir plantillas de plataforma.

Un APK debug compilado no equivale a un PASS de teléfono real ni a autorización de publicación. Faltan prueba offline/reinicio, SQLCipher/Keystore, permisos, identidad, sincronización Pro y privacidad.

## Continuidad

El código real avanzado debe compararse primero con el repositorio, mediante la [herramienta WIP del PR #2](https://github.com/sierraglobalcompany-rgb/Jornato/blob/docs/pingponglaw-l1-l6-canon-84e961c/tools/JORNATO_CONCILIAR_WIP_GITHUB_SIN_CODEX.py). El resultado del puente sigue **NOT_RUN en Windows real**. Revisar manualmente reportes y archivos para excluir datos personales y secretos antes de compartir.

**H9=NO_GO · B22=NOT_AUTHORIZED · RELEASE=NO_GO.**
