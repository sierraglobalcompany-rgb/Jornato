# JORNATO — B21-S1 V2 | Dictamen independiente, causa raíz y decisión de desbloqueo

**Corte:** 2026-11-15 · America/Bogota  
**Director:** ChatGPT · **Ejecutor previo:** Codex Luna  
**Entrega recibida:** `JOR-B21-S1-V2-INTEGRATION-ROOT-20261115-UNICO.zip`  
**SHA-256 ZIP verificado:** `68CBA9DBBF91D0CE93B1618F15239A928EAA2AC8D66A6AD7F5EF83573C26F98B`  
**Resultado:** `B21_S1=PARTIAL`, `B21_GLOBAL=NOT_APPROVED`, `RELEASE_APPROVED=NO`.

## 1. Verificación propia y límites

- ZIP de 28 miembros, CRC correcto, nombres sin rutas inseguras ni duplicados.
- Manifiesto de 27 entradas: 27/27 archivos, bytes y SHA-256 coinciden.
- `ORACLES_I01_I24.csv`: 24 IDs diferentes, secuencia I01–I24 íntegra. **Clasificación:** 6 `PASS_STATIC`, 1 `PASS_ZIP`, 9 `NOT_RUN_ENV`, 4 `BLOCKED_CONTRACT`, 2 `NOT_RUN`, 1 `NOT_VERIFIED`, 1 `PARTIAL`. **24/24 documentados ≠ 24/24 ejecutados o PASS.**
- `CROSS_FLOW_RESULTS.csv`: ocho recorridos (4 `PARTIAL`, 2 `BLOCKED_CONTRACT`, 2 `NOT_RUN`), todos en capa `STATIC`; ningún E2E real acreditado.
- `RELEASE_GATES.csv`: 15 puertas, 6 `NOT_RUN_ENV`, 3 `BLOCKED_CONTRACT`, 3 `PASS_STATIC`, 1 `NOT_VERIFIED`, 1 `NOT_RUN`, 1 `NO_GO`.
- `SOURCE_HASHES_PRE_POST.csv`: 237 rutas distintas; los 237 registros reportan SHA y bytes antes/después iguales; `GIT_STATUS`, `GIT_BRANCH_HEAD` y `GIT_STAGED` PRE/POST son idénticos entre sí. Esto es **consistencia interna de evidencia de Codex**, no una segunda visita independiente a `D:\codex\Jornato`. La diferencia entre 235 entradas en `git status` y 237 rutas inventariadas se debe a que son contadores de universos distintos.
- No hubo cambios de producto. `PATCH_CANDIDATE.diff` de 0 bytes es legítimo; no existe parche nuevo que reproducir ni debe fabricarse uno. `BASELINES/` y `SOURCES/` contienen solo marcadores de no-cambio.
- No se ejecutaron durante B21-S1 migraciones, DB real, PHP/PHPUnit, kernel HTTP, navegador, Flutter, Android ni concurrencia de dos sesiones. La verificación externa se limita al paquete/consistencia documental. `L5_INDEPENDENT_RUNTIME=NOT_RUN`.

## 2. Causa raíz y decisión, sin repetir auditorías

**Bloqueador operativo P0:** `server/phpunit.xml` apunta deliberadamente a MariaDB en puerto `1`, no existe `server/.env.testing`, y el inventario de Codex no localizó ejecutable, servicio o listener MariaDB/MySQL de QA. La orden B21-S1 V2 prohibía instalar/inicializar instancias no existentes, por lo que nunca fue posible alcanzar pruebas reales de migraciones, locks, aislamiento ni revocación de PAT. **Reenviar el mismo prompt produciría otro ZIP documental.**

**Bloqueadores de contrato:** OD02 (vínculo cuenta↔empleado y revocación), OD04 (login web real) y OD03 (permisos específicos RR. HH.) siguen sin aprobar. No son fallos comprobados del código ni justifican abrir endpoints provisionales. B19/B20 deben conservar `DENY-ALL`.

**Decisión técnica:** `B21-S1 V2=PARTIAL_ACCEPTED_EVIDENCE_ONLY`; **NO iniciar B22, NO otra auditoría y NO enviar a Codex de nuevo sin cambiar una precondición real**. Resolver primero una instancia MariaDB de QA exclusiva y local, después correr un macrobloque que ejecute migraciones y pruebas de dos sesiones. El resto de los gates B21/H9 se cerrarán con sus propios datos reales; la SPEC V5 exige QA integral y no está reemplazada por I01–I24.

## 3. Propuesta de desbloqueo — requiere autorización explícita del propietario

**Autorización pendiente** (no concedida por este documento): permitir a Codex **descargar y ejecutar MariaDB Community estable para Windows en formato ZIP**, desde sitio oficial, con verificación de integridad/autenticidad, **solo en D:**, por ejemplo `D:\codex\_RUNTIME\Jornato\B21_DB_QA\`. No usar instalador MSI, ni registrar servicio Windows, ni UAC/admin, ni modificar firewall, ni tocar bases/discos/puertos de otras apps ni producción. Usar `mariadb-install-db.exe` con `--datadir` aislado (sin `--service`) y proceso `mariadbd.exe --console` local con bind `127.0.0.1`, puerto libre no compartido y usuario QA de mínimo privilegio. Registrar PID, basedir, datadir y puerto antes de migraciones. Nunca usar datos laborales reales ni subir credenciales al ZIP. Si el antivirus/política de Windows o la procedencia del ZIP impiden ejecutar con seguridad, detenerse: **no eludir controles**.

**Referencias oficiales verificadas:**
- Instalación Windows ZIP: https://mariadb.com/docs/server/server-management/install-and-upgrade-mariadb/installing-mariadb/binary-packages/installing-mariadb-windows-zip-packages
- Inicialización Windows: https://mariadb.com/docs/server/server-management/install-and-upgrade-mariadb/installing-mariadb/installing-system-tables-mariadb-install-db/mariadb-install-db-exe
- Descarga oficial: https://mariadb.com/downloads/

**No confundir aprobación del entorno QA con aprobación de flujos legales, permisos RR. HH. o lanzamiento.**

## 4. Macrobloque siguiente si el propietario autoriza

1. **Infraestructura reproducible:** SHA del ZIP binario MariaDB, versión, procedencia, firma si disponible, basedir/datadir `D:`, bind loopback, puerto y PID propios. Si la instancia no inicia en condiciones permitidas, no hacer otra auditoría; informar el error exacto una sola vez.
2. **Migraciones limpias:** correr exclusivamente sobre esquema nuevo de QA, probar DDL InnoDB/FKs/unique reales B13–B20 sin tocar bases anteriores. Revisar DDL antes de modificar código; corregir solo defectos reproducidos.
3. **Concurrencia verdadera:** dos sesiones DB simultáneas coordinadas por barrera, `CONNECTION_ID` distintos, con las carreras B17 (una solicitud), B19 (versión/idempotencia/rollback) y B20 (agenda por entrevistador/candidato/empresa, una decisión activa). No contar solicitudes secuenciales.
4. **Autenticación y tenant:** pruebas de kernel/DB con datos ficticios A/B: token válido, vencido/revocado, bloqueo cross-tenant y denegación de identidad de empleado sin vínculo aprobado. Los contratos OD02/OD04 pendientes siguen cerrados; no fabricar login/permissions.
5. **Finalizar con un solo ZIP** con hashes, logs reales, matriz de lo ejecutado y pendiente, código solo si corrige una causa raíz, `B21_GLOBAL=NOT_APPROVED` hasta H9 integral/L5/propietario.

## 5. Ocho decisiones que no se pueden suponer

| ID | Dominio | Responsable y prioridad |
|---|---|---|
| OD01 | Privacidad, consentimiento y retención | Propietario + jurídico; antes de captura real |
| OD02 | Quién vincula/revoca cuenta↔empleado | Propietario + RR. HH./jurídico; bloquea app personal |
| OD03 | Matriz de acciones/roles RR. HH. por empresa/sede | Propietario + RR. HH.; bloquea B17/B19/B20 comerciales |
| OD04 | Login web, invitación, sesión y recuperación | Propietario + seguridad; bloquea B16 web real |
| OD05 | Publicación ATS, CV, antimalware y derechos | Propietario + jurídico/seguridad; bloquea ATS público |
| OD06 | Contratos, plantillas, firmas y entrega | Propietario + jurídico; bloquea B19 comercial |
| OD07 | Homologación legal de remuneración | Propietario + contador/jurídico; bloquea B18 comercial |
| OD08 | Precios, pagos, cancelación y facturación | Propietario + contable/jurídico; bloquea monetización |

**Orden recomendado para no frenar las pruebas técnicas:** aprobar infraestructura MariaDB QA primero; luego resolver OD02/OD04/OD03 en una sesión de decisiones de producto, sin autorizar aquí las restantes.

## 6. Quién continúa

**SIGUE EL PROPIETARIO PARA AUTORIZAR O RECHAZAR LA INSTANCIA LOCAL QA.** No generar una nueva orden ejecutable a Codex hasta resolver esta precondición. Una vez aprobada, **SIGUE CHATGPT DIRECTOR** para emitir el único prompt de ejecución DB real y **CODEX LUNA** para implementarlo. `main` y el WIP no se deben alterar por este trámite documental.