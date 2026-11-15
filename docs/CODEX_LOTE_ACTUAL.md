# JORNATO — SIN ORDEN CODEX EJECUTABLE: B21-S1 V2 YA ENTREGADO, BLOQUEO DE QA

**Corte:** 2026-11-15 · America/Bogota
**Responsable actual:** PROPIETARIO (autorizar o rechazar entorno MariaDB QA local).
**Director:** ChatGPT. **Codex Luna:** NO debe ejecutar B21-S1 V2 otra vez ni crear otro ZIP sin cambiar las precondiciones.
**Estado:** B21-S1 V2 = PARTIAL; B21_GLOBAL=NOT_APPROVED; RELEASE_APPROVED=NO.

## Evidencia recibida y dictamen

- ZIP recibido: `JOR-B21-S1-V2-INTEGRATION-ROOT-20261115-UNICO.zip`.
- SHA-256 confirmado: `68CBA9DBBF91D0CE93B1618F15239A928EAA2AC8D66A6AD7F5EF83573C26F98B`.
- 28 miembros, 27/27 manifest, 24 oráculos **catalogados**: 6 PASS_STATIC + 1 PASS_ZIP; restantes no aprobados. 0 cambios al código, 0 pruebas MariaDB/HTTP/Flutter/Android.
- No existe MariaDB QA disponible; `server/phpunit.xml` usa puerto 1 fail-closed. No se iniciaron instancias ni migraciones.
- Identidad empleado↔cuenta y login web reales siguen BLOCKED_CONTRACT.
- Dictamen completo: [docs/JORNATO_B21_S1_DICTAMEN_INDEPENDIENTE_Y_DESBLOQUEO.md](JORNATO_B21_S1_DICTAMEN_INDEPENDIENTE_Y_DESBLOQUEO.md).
- El **prompt B21 V2 histórico**, ya ejecutado, se conserva en la historia de GitHub: [versión original](https://github.com/sierraglobalcompany-rgb/Jornato/blob/3dde1d59c436574efd9a8b3bab3953a3604b2aad/docs/CODEX_LOTE_ACTUAL.md). NO volver a ejecutarlo.

## Única aprobación técnica solicitada (pendiente)

¿El propietario **autoriza descargar y ejecutar MariaDB Community para Windows en ZIP oficial, en una carpeta nueva de D:\\codex\\_RUNTIME\\Jornato\\B21_DB_QA, con data-dir y proceso propios, solo loopback, sin servicio Windows, sin admin, sin otros proyectos ni producción, usando exclusivamente datos ficticios**, para correr migraciones y carreras de dos conexiones reales?

**Hasta recibir un SÍ explícito:** no crear nuevo prompt de Codex ni ejecutar descargas/instalaciones. Tampoco inferir aprobaciones de OD01–OD08. Si el propietario aprueba, ChatGPT preparará UNA orden completa de laboratorio B21/H9 con un ZIP único, evitando reauditorías de B13–B20.

## Continuidad

Leer [docs/JORNATO_CONTINUIDAD.md](JORNATO_CONTINUIDAD.md), sección ESTADO ACTUAL B21-S1 V2 EJECUTADO. El PR #2 es documental; `main` no contiene el WIP de `D:\\codex\\Jornato`.
