# Jornato

Control de jornadas y asistencia para uso personal y pequeñas empresas, **Android primero**. Proyecto independiente de ERP-BDM.

**Estado al 19 de noviembre de 2026: prototipo remoto F0, NO apto para empleados ni producción.** El desarrollo avanzado de Laravel/Android/SQLCipher que permanece en **D:\codex\Jornato** no está en este árbol GitHub. No fusionar ni aplicar cambios sobre ese WIP sin comparar fuentes.

## Situación real

| Componente | Estado verificable |
|---|---|
| Motor Dart (entrada, pausa, continuación, salida) | Código escrito; aún no ejecutado con SDK |
| Turnos, archivo JSON, reconciliación y CSV | Código puro en memoria; JSON sin cifrar ni persistencia |
| Regla GPS por precisión/edad/radio | Solo geometría local; no obtiene datos del teléfono ni certifica identidad |
| Pantalla personal | Demo volátil; bloquea nuevas marcas ante un evento con hora futura |
| **Pruebas Flutter** | **119 casos fuente escritos, NOT_RUN** |
| **Smoke Dart** | **31 comprobaciones escritas, NOT_RUN** |
| Puente Python WIP, en PR #2 | **15/15 pruebas PASS con datos sintéticos**; Windows real NOT_RUN |
| APK/Android, SQLCipher/Keystore, backend integrado, Pro | **NO_GO / no verificadas aquí** |
| Lanzamiento o merge | **NO AUTORIZADO** |

Los tests Python del puente no son pruebas del producto móvil. El backend local ha tenido un resultado histórico PASS_SCOPED de 158 tests en B21F-S3, **no en este repositorio remoto**.

## Ramas y responsabilidades

- [PR #1](https://github.com/sierraglobalcompany-rgb/Jornato/pull/1): base Flutter F0, Draft.
- [PR #2](https://github.com/sierraglobalcompany-rgb/Jornato/pull/2): continuidad y herramientas de recuperación del WIP, Draft.
- [PR #3](https://github.com/sierraglobalcompany-rgb/Jornato/pull/3): módulos Dart y QA F0, **Draft y basado en PR #1**.
- **main**: sin código avanzado integrado. No alterar sin autorización.

## QA sin Codex ni GitHub Actions

**Solo para un clon separado y limpio del PR #3. Nunca ejecutar en D:\codex\Jornato.** Con Git y Flutter instalados en Windows:

~~~powershell
git clone --branch feat/jornato-f0-archive-shifts-no-ci-20261117 https://github.com/sierraglobalcompany-rgb/Jornato.git D:\codex\Jornato-F0-QA-CLON
Set-Location D:\codex\Jornato-F0-QA-CLON
powershell.exe -NoProfile -File .\scripts\qa_local_f0.ps1
~~~

El runner usa solo caché de dependencias (flutter pub get --offline), ejecuta smoke Dart, análisis y tests Flutter; genera informe fuera del repositorio. Si el SDK no existe, informa **BLOCKED**, no PASS. No crea Android ni ejecuta Actions. [Instrucciones completas](docs/COMO-EJECUTAR.md).

## Para continuar el producto real

Comparar primero el WIP de Windows con el F0 remoto usando la [herramienta de conciliación en PR #2](https://github.com/sierraglobalcompany-rgb/Jornato/blob/docs/pingponglaw-l1-l6-canon-84e961c/tools/JORNATO_CONCILIAR_WIP_GITHUB_SIN_CODEX.py). La herramienta **no modifica** el WIP y todavía no se ha probado contra él. Compartir solo informes y fuentes revisadas para excluir secretos, bases de datos y datos personales. Después cerrar los pendientes reales de Android offline, cifrado, sincronización y QA físico.

**Gates vigentes:** H9 = NO_GO; B22 = NOT_AUTHORIZED; release = NO_GO. **Sigue ChatGPT Director**, no Codex hasta que el propietario disponga de tokens y lo autorice.

## Fuentes de verdad

[Contrato de producto](docs/PRODUCTO.md) · [ADR provisional](docs/ADR-0001-ARQUITECTURA.md) · [QA e historial detallado](docs/QA-ESTADO.md) · [Guía local](docs/COMO-EJECUTAR.md) · [Continuidad canónica del PR #2](https://github.com/sierraglobalcompany-rgb/Jornato/blob/docs/pingponglaw-l1-l6-canon-84e961c/docs/JORNATO_CONTINUIDAD.md).

No publicar identidades de empleados, fotografías, credenciales, bases de datos ni otros datos sensibles.
