# JORNATO — DICTAMEN FORENSE B19-S1 V2 · 10 VERDUGO + 10 JUEZ · DIRECCIÓN B20

**Fecha:** 2026-11-14, America/Bogota. **Autoridad:** ChatGPT director técnico. **Estado B19:** `PARTIAL_HOST_OR_CONTRACT`. **Release:** `NO`.  
**Fuentes examinadas:** ZIP user `JOR-B19-S1-V2-PRIVATE-DOCUMENT-VERTICAL-20261114-UNICO.zip` (SHA256 `4C906785C63B500B76B7088D5B65261CEB062BF7DB0EF70F4ADEE3357243B44D`), SOURCES PHP/Migration/Tests, logs/matrices, SPEC V5 MOD-12/UX-21/B20 y continuidad GitHub PR #2; PingPongLaw L1–L6 canon commit `84e961cadf482d234f4c0ee2ca60e8c7e9b388e8`. **No se inspeccionó directamente D: ni MariaDB.**

## 1. Evidencia atribuida correctamente

- **Verificación ejecutada por director sobre ZIP recibido:** 136.437 bytes, SHA exacto, 70 entradas sin duplicados/traversal y CRC PASS; manifest CSV de 69 filas verifica SHA256+bytes 69/69; patch `--dry-run` y `apply` GNU desde baselines en copia aislada reconstruyen 17/17 SOURCES byte exactas; PHP 8.4 `php -l` independiente 17/17 PASS. No se reejecutó Laravel PHPUnit de Codex (ausencia de repo completo y entorno QA).
- **Evidencia aportada por Codex:** `phpunit --filter EmployeeDocumentVaultTest` 16 tests/96 assertions PASS, Laravel Storage::fake más repo en memoria. TEST_MATRIX tiene 42 filas: 35 `PASS_EXECUTED` (varias `STATIC_ONLY`), 3 `BLOCKED_CONTRACT`, 3 `NOT_APPLICABLE_EXPLAINED`, 1 `NOT_RUN_ENV`. Eso NO es 42 pruebas independientes y no certifica SQL ni IAM.
- **Modelo/servicio revisados:** 16 fuentes nuevas + AppServiceProvider modificado, autorizador productivo DENY-ALL, cero rutas B19, versión append-only por aplicación, request-fingerprint unique schema, private files de 2 MiB y checksum antes de download. Migración real y concurrencia sin probar.
- **Custodia WIP:** Codex reporta 199 rutas previas, 198 byte idénticas y AppServiceProvider cambiada, 16 nuevas, staged 0. Cache PHPUnit ignorado no tiene hash pre, sin afirmar preservación exacta. Main remoto no representa WIP.
- **Riesgos B19 abiertos sin P0/P1 demostrado:** `DB_ATOMICITY=IMPLEMENTED_DB_UNRUN`, `MALWARE_SCAN=NO_VERIFICADO`, `SIGNATURE_VERIFIED=NO`, `HR_PERMISSION=BLOCKED_CONTRACT`, `PRIVATE_STORAGE_PRODUCTION=NOT_VERIFIED`, `WEB_REAL=BLOCKED_CONTRACT`, `L5_INDEPENDENT_RUNTIME=NOT_RUN`. Ninguno se convierte en permiso automático para ATS.

## 2. 10 pasadas VERDUGO y 10 JUEZ con SEIS juicios distintos por pasada

**Método:** cada pasada declara hipótesis, evidencia, resolución y justificación adversarial. Los 120 juicios L1–L6 son **revisión documental**, NO tests runtime. La primera mitad busca falsar la decisión de avanzar; la segunda cuestiona las soluciones excesivas. Los hallazgos aplicables a B20 ya se convirtieron en la orden completa.

### V01 — Trazabilidad ZIP vs runtime
**Hipótesis adversarial:** PASS de integridad permite aceptar artefacto; no server real.
**Evidencia:** 70 entradas CRC, 69/69 manifest y 17/17 patch se reprodujeron; PHPUnit no se reejecutó.
**Fallo/directiva:** Delimitar éxito a paquete/host. **Motivo:** El ZIP fue recibido y verificado; no implica release.

- **L1 KISS+Ponytail:** 17 rutas de código, no rediseño.
- **L2 Antirruido:** No duplicar auditorías B18.
- **L3 Causa raíz:** Ningún parche al core B19 requerido.
- **L4 UX humana:** Reporte distingue estados reales.
- **L5 Evidencia independiente:** PHP lint independiente no es PHPUnit.
- **L6 Antipingpong:** Mover a B20 sin B19-S2 ritual.

### V02 — Versionado / WIP
**Hipótesis adversarial:** La custodia es atribuida a Codex; los archivos locales no son visibles.
**Evidencia:** 199 rutas previas, 198 intactas + AppServiceProvider + 16 nuevas, staging 0 según log.
**Fallo/directiva:** Hacer inventario nuevo solo antes de B20. **Motivo:** No inferir cambios locales a partir de GitHub.

- **L1 KISS+Ponytail:** Comparar hashes existentes.
- **L2 Antirruido:** Respetar archivos untracked.
- **L3 Causa raíz:** No usar main como baseline.
- **L4 UX humana:** Documentar ruptura visible.
- **L5 Evidencia independiente:** Git local no auditado aquí.
- **L6 Antipingpong:** Una captura pre/post.

### V03 — Authorization fail closed
**Hipótesis adversarial:** Un core privado sin rutas comerciales no está terminado, pero no fuga.
**Evidencia:** Binding AppServiceProvider a DenyAllDocumentAccessAuthorizer; rutas B19 sin cambios.
**Fallo/directiva:** Preservar DENY_ALL y construir B20 con su propia policy cerrada. **Motivo:** Sin contrato HR, crear public endpoint sería peor.

- **L1 KISS+Ponytail:** Una policy ATS.
- **L2 Antirruido:** No copiar permissions de owner.
- **L3 Causa raíz:** No crear rutas sin guard.
- **L4 UX humana:** UI restringida honesta.
- **L5 Evidencia independiente:** Lectura estática de binding sí.
- **L6 Antipingpong:** No abrir subfase B19.

### V04 — MariaDB/atomicidad
**Hipótesis adversarial:** UNIQUE y transacciones existen pero no han corrido en DB.
**Evidencia:** Migración InnoDB, FK, locks, unique y DB 127.0.0.1:1 placeholder.
**Fallo/directiva:** DB gate B21; core B20 con QA host. **Motivo:** Forzar Docker compartido no demuestra integridad del entorno esperado.

- **L1 KISS+Ponytail:** FK focal, 4 tablas máximo.
- **L2 Antirruido:** No tocar schema B19.
- **L3 Causa raíz:** Unique y locks B20.
- **L4 UX humana:** No mostrar DB PASS.
- **L5 Evidencia independiente:** DB B19 NOT_RUN confirmado.
- **L6 Antipingpong:** No volver a montar la suite B19.

### V05 — Reproducción patch
**Hipótesis adversarial:** Se reconstruyeron fuentes B19, no WIP completo.
**Evidencia:** 17/17 byte exact tras aplicar diff a baseline aislado.
**Fallo/directiva:** Exigir mismo patrón B20; no sobreafirmar. **Motivo:** El parche reproducible demuestra trazabilidad del lote, no integridad remota.

- **L1 KISS+Ponytail:** Patch aislado simple.
- **L2 Antirruido:** No copiar el repo entero.
- **L3 Causa raíz:** Conservar preimagen AppServiceProvider.
- **L4 UX humana:** Logs legibles.
- **L5 Evidencia independiente:** Patch local sí ejecutado.
- **L6 Antipingpong:** Una sola reproducción B20.

### V06 — CV y malware
**Hipótesis adversarial:** PDF sintético B19 no autoriza CV de candidatos reales.
**Evidencia:** Storage::fake y NO_VERIFICADO; antivirus productivo ausente.
**Fallo/directiva:** CV solo sintético QA, sin endpoint/descarga comercial. **Motivo:** Finfo/estructura PDF no reemplazan escáner.

- **L1 KISS+Ponytail:** Reusar private-files.
- **L2 Antirruido:** No forzar B19 DocumentVault.
- **L3 Causa raíz:** Adaptador B20 con prefijo propio.
- **L4 UX humana:** Mostrar NO_VERIFICADO.
- **L5 Evidencia independiente:** Storage fake separado de producción.
- **L6 Antipingpong:** Sin reparación B19.

### V07 — Consentimiento de candidatos
**Hipótesis adversarial:** El plan original B20 presupone público, aviso, retención y derechos.
**Evidencia:** SPEC V5 candidata MOD-12, sin política aprovada/canal público.
**Fallo/directiva:** Bloquear publicación pública hasta contrato/antibot; construir dominio QA. **Motivo:** Una URL revocable sin privacidad no equivale a consentimiento.

- **L1 KISS+Ponytail:** Token hash en vacancy.
- **L2 Antirruido:** No tabla adicional de tokens.
- **L3 Causa raíz:** Token random/expiry/revoke.
- **L4 UX humana:** Estados PUBLIC_BLOCKED explícitos.
- **L5 Evidencia independiente:** No hay pruebas rate limit público.
- **L6 Antipingpong:** Se testea token internamente.

### V08 — Identidad/tenancy
**Hipótesis adversarial:** No equiparar login de trabajador o owner con recruiter.
**Evidencia:** B19 HR permission bloqueado y B16 login web incompleto.
**Fallo/directiva:** Default deny ATS; actor/tenant derivado server/fixture. **Motivo:** Nombres de roles no son grants.

- **L1 KISS+Ponytail:** Una interfaz authorizer.
- **L2 Antirruido:** No crear login ATS.
- **L3 Causa raíz:** Company y actor validados.
- **L4 UX humana:** Vista restricted.
- **L5 Evidencia independiente:** No DB A/B real.
- **L6 Antipingpong:** No pedir permiso nuevo en este lote.

### V09 — Historial y entrevistas
**Hipótesis adversarial:** Una agenda sin control de solapes puede aceptar doble reserva.
**Evidencia:** No hay motor de entrevistas en B19; MOD-12 requiere entrevistas.
**Fallo/directiva:** Lock/intervalos UTC e historial en B20; DB concurrency gate pendiente. **Motivo:** Tests secuenciales no demuestran race real.

- **L1 KISS+Ponytail:** Una tabla interviews.
- **L2 Antirruido:** No integrar calendario pago.
- **L3 Causa raíz:** Lock para conflicto.
- **L4 UX humana:** Reprogramar con historial.
- **L5 Evidencia independiente:** Dos conexiones DB solo si disponibles.
- **L6 Antipingpong:** Un solo ATS vertical.

### V10 — Conversión a empleado
**Hipótesis adversarial:** Shortlisted puede simular empleado creado y producir datos sensibles.
**Evidencia:** B20 depende de B19 y contratos identidad/consentimiento no aprobados.
**Fallo/directiva:** Handoff explícito bloqueado, ninguna inserción en sync_employees/users. **Motivo:** No hay permiso para promover candidato por status.

- **L1 KISS+Ponytail:** Handoff sin tabla extra.
- **L2 Antirruido:** No modificar B14/B19.
- **L3 Causa raíz:** Núcleo segregado.
- **L4 UX humana:** Etiqueta bloqueo comprensible.
- **L5 Evidencia independiente:** Test negativo de conversión.
- **L6 Antipingpong:** B21 integrará con contratos.

### J01 — ¿Detener B20 por no haber login web?
**Hipótesis adversarial:** No: el core puede avanzar cerrado.
**Evidencia:** B19 ya demostró QA host sin rutas comerciales.
**Fallo/directiva:** Implementar servicio y Blade QA, mantener deny-all. **Motivo:** El freno total impediría progreso sin aumentar seguridad.

- **L1 KISS+Ponytail:** Una vertical sin público.
- **L2 Antirruido:** Reutilizar Laravel actual.
- **L3 Causa raíz:** No inventar Auth web.
- **L4 UX humana:** No CTA pública.
- **L5 Evidencia independiente:** Gates explícitos.
- **L6 Antipingpong:** Paso directo B20.

### J02 — ¿Reusar B19 documento de empleado para CV?
**Hipótesis adversarial:** No: los scopes y su key no son del candidato.
**Evidencia:** B19 permite solo `documents/UUID/UUID.pdf` y HR deny-all.
**Fallo/directiva:** Reusar storage config; pequeño adaptador específico ATS QA. **Motivo:** Cambiar B19 para pasar tests debilita su frontera.

- **L1 KISS+Ponytail:** No duplicar disco config.
- **L2 Antirruido:** No romper B19.
- **L3 Causa raíz:** Scope recruitment específico.
- **L4 UX humana:** CV con estado NO_VERIFICADO.
- **L5 Evidencia independiente:** QA storage fake.
- **L6 Antipingpong:** No B19 regression total.

### J03 — ¿Construir SPA y ATS externo?
**Hipótesis adversarial:** No; Laravel/Blade ya operan.
**Evidencia:** WIP contiene portal Blade B16.
**Fallo/directiva:** Servicio+modelos+vistas focales. **Motivo:** Framework/servicio nuevo no está justificado.

- **L1 KISS+Ponytail:** Monolito KISS.
- **L2 Antirruido:** Sin deps nuevas.
- **L3 Causa raíz:** No microservicio.
- **L4 UX humana:** Vistas mobile claras.
- **L5 Evidencia independiente:** PHP unit + render.
- **L6 Antipingpong:** Una entrega.

### J04 — ¿Crear enlace público como demo?
**Hipótesis adversarial:** No; falta privacidad, antiabuso y policy.
**Evidencia:** SPEC MOD-12 exige aviso/limit/rate/cv seguro.
**Fallo/directiva:** Token QA interno sin route pública. **Motivo:** Un endpoint demo público sería un vector de fuga.

- **L1 KISS+Ponytail:** Token en vacancy.
- **L2 Antirruido:** No route temporal.
- **L3 Causa raíz:** Validación revocación.
- **L4 UX humana:** Mensaje PUBLIC_BLOCKED.
- **L5 Evidencia independiente:** No HTTP real si no existe.
- **L6 Antipingpong:** B21 gate de publicación.

### J05 — ¿Eliminar CV del alcance para no tocar almacenamiento?
**Hipótesis adversarial:** No; se puede probar lectura de PDF sintético aislada.
**Evidencia:** B19 private-files con Storage::fake ya disponible.
**Fallo/directiva:** Adaptador mínimo B20, no carga comercial. **Motivo:** Permite progreso sin tratar datos reales.

- **L1 KISS+Ponytail:** 2 MiB límite.
- **L2 Antirruido:** Reusar disk.
- **L3 Causa raíz:** Cierre MIME+hash.
- **L4 UX humana:** Estados honestos.
- **L5 Evidencia independiente:** Storage fake verificable.
- **L6 Antipingpong:** Sin parser nuevo.

### J06 — ¿Una tabla por cada fase de selección?
**Hipótesis adversarial:** No; cuatro tablas máximas bastan.
**Evidencia:** Vacante/aplicación/entrevista/evento son granos distintos.
**Fallo/directiva:** No añadir tablas para tokens, email, scoring. **Motivo:** Reduce migraciones y riesgo.

- **L1 KISS+Ponytail:** Cuatro granos claros.
- **L2 Antirruido:** No tablas de catálogo.
- **L3 Causa raíz:** Evento append-only.
- **L4 UX humana:** UI simple por etapa.
- **L5 Evidencia independiente:** Schema solo lint sin DB.
- **L6 Antipingpong:** No refactor B13.

### J07 — ¿Tratar entrevista agendada como confirmada por correo?
**Hipótesis adversarial:** No; calendario/mail no instalado/permitido.
**Evidencia:** No hay conector email ATS aprobado.
**Fallo/directiva:** Guardar fecha/estado, NOT_CONFIGURED entrega. **Motivo:** Persistencia de agenda ≠ recepción del candidato.

- **L1 KISS+Ponytail:** Una sola agenda.
- **L2 Antirruido:** Sin proveedor externo.
- **L3 Causa raíz:** No emails sintéticos reales.
- **L4 UX humana:** Estado pendiente explícito.
- **L5 Evidencia independiente:** Test no envío.
- **L6 Antipingpong:** B21 prueba proveedor si aprobado.

### J08 — ¿Deducir consentimiento por solicitar empleo?
**Hipótesis adversarial:** No; hay que versionar aviso y decisión expresos.
**Evidencia:** No existe texto aprobado ni retención para ATS.
**Fallo/directiva:** QA sintético y flag BLOCKED_CONSENT. **Motivo:** Un checkbox falso no es base legal.

- **L1 KISS+Ponytail:** No PII en evidencia.
- **L2 Antirruido:** No retención inventada.
- **L3 Causa raíz:** Solicitud derechos sin borrar.
- **L4 UX humana:** Aviso de bloqueo.
- **L5 Evidencia independiente:** No consent real probado.
- **L6 Antipingpong:** Decisión propietario/legal futura.

### J09 — ¿Exigir MariaDB y browser real para etiquetar cada componente PASS?
**Hipótesis adversarial:** No; diferenciar host/DB/browser con precisión.
**Evidencia:** PHPUnit B19 usó memory + Storage::fake sin DB.
**Fallo/directiva:** PASS_HOST_SCOPED, DB_REAL_NOT_RUN; nunca comercial. **Motivo:** Permite avance sin confundir prueba y producto.

- **L1 KISS+Ponytail:** Tests focales.
- **L2 Antirruido:** No rerun B13–B19.
- **L3 Causa raíz:** No esconder env.
- **L4 UX humana:** Reportes claros.
- **L5 Evidencia independiente:** No L5 runtime.
- **L6 Antipingpong:** B21 integra.

### J10 — ¿Hacer diez auditorías adicionales antes de ejecutar Codex?
**Hipótesis adversarial:** No; esta ronda documental cierra la dirección.
**Evidencia:** L1–L6 se evaluaron 20 veces en director; falta B20 runtime.
**Fallo/directiva:** Un prompt, ZIP y NEXT=CHATGPT; no B20-S2 ritual. **Motivo:** Más rondas sin hechos nuevos sería pingpong.

- **L1 KISS+Ponytail:** Contrato preciso.
- **L2 Antirruido:** Sin duplicar doc.
- **L3 Causa raíz:** Causa raíz definida.
- **L4 UX humana:** Flujo observable.
- **L5 Evidencia independiente:** QA focal.
- **L6 Antipingpong:** Ir a implementación.

## 3. Decisión del juez y alcance exacto del siguiente lote

**B19 queda aceptado solo en alcance host sintético**, no como servicio comercial ni DB validada. No se abre B19-S2 por falta de entorno. El siguiente bloque productivo es B20-S1 V1; ninguna prueba B13–B19 será reejecutada por ceremonia. El flujo ATS QA tendrá vacante, invitación token interno, postulación sintética, decisión, agenda y expediente temporal sin conversión a empleado. Los contratos de publicación pública, privacidad, RRHH, malware, revisión legal y consentimiento permanecen bloqueados. No asociar B20 al empleado ni al kiosco.

**Riesgo conocido de B20:** un núcleo que funciona mediante `AllowSyntheticRecruitmentAccess` y `Storage::fake` es un avance técnico, no un ATS comercial operativo. Debe mostrar `PARTIAL_HOST_OR_CONTRACT`, no un falso PASS global. El portón B21 es una integración deliberada para completar B13–B20: auth web real, permisos, privacidad, MariaDB, pruebas navegador y seguridad pública, Android cuando aplique, asesoría jurídica y UX sin guía; B22 publicará solo después de GO escrito.

## 4. Handoff de continuidad / ZIP

**Siguiente actor:** CODEX LUNA. **Orden:** `CODEX_LUNA_JORNATO_B20_S1_V1_MACROBLOQUE_ATS_VACANTES_POSTULACIONES_ENTREVISTAS_SEGURAS_ZIP_UNICO_20261114.md` (texto íntegro en `docs/CODEX_LOTE_ACTUAL.md` del PR #2). **Salida exigida:** `JOR-B20-S1-V1-ATS-SECURE-QA-20261114-UNICO.zip` con fuentes, baselines, patch, logs, 40 oráculos, custody y manifest. **NEXT_OWNER al terminar:** CHATGPT. No stage, commit, push, merge o deploy del WIP; trabaja solo D:.

**Control antirruido:** recordar que el último código verificable es el ZIP B19 adjunto, no el commit de documentos de GitHub. Los docs siguientes sustituyen V1 B19 como orden vigente, pero conservan el resultado histórico y sus gates sin borrar evidencia. No crear PR de producto ni fusionar documentación sin autorización.