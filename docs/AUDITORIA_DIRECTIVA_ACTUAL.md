# JORNATO — B20-S1 V2: dictamen independiente, 10 Verdugo + 10 Juez y dirección B21

**Corte:** 2026-11-15 (America/Bogota). **Último paquete:** `JOR-B20-S1-V2-ATS-ROOT-20261115-UNICO.zip`; 113.945 bytes; SHA256 `D4D5E1E1F3DFF63859990704AD90BACB0C498340C047751FDC45F001A8DFDF4F`. **Director:** ChatGPT. **Estado:** `B20_GLOBAL=PARTIAL_HOST_OR_CONTRACT`; `RELEASE_APPROVED=NO`.

## Alcance real de evidencia (no reutilizar como pruebas inexistentes)

**Comprobé personalmente contra el ZIP adjunto:** 74 miembros, sin duplicados ni traversal, CRC íntegro; `MANIFEST_SHA256.csv` 73/73 hashes+bytes iguales; patch aplicado en una carpeta aislada con `git apply --check` y `git apply`, reconstrucción **21/21 SOURCES byte exactas**; `php -l` ejecutado independiente en PHP **8.4.24: 21/21 PASS**. Revisé los archivos reales `RecruitmentService.php`, repositorio Eloquent, migración, object store, authorizer y el informe/matriz. B20 no está registrado como API en el parche; Codex reportó `route:list` con **0 rutas ATS**, no reejecuté la aplicación Laravel íntegra.

**Resultados solo de Codex:** 11 PHPUnit/84 aserciones PASS en PHP 8.5.8 contra in-memory repo y `Storage::fake`; Pint focal PASS; custodia de 216/217 hashes previos intactos y un único proveedor editado, 20 nuevos y staging 0. No observé directamente `D:\codex\Jornato` ni reejecuté PHPUnit de Laravel. El ZIP documenta 40 oráculos: **22 PASS_HOST_FAKE, 11 PASS_STATIC, 1 PASS_HOST_PREVIEW, 1 PASS_PATCH_REPLAY, 1 PASS_ZIP, 3 BLOCKED_CONTRACT, 1 NOT_RUN_ENV**. Son estados de criterios, no 40 suites.

**Código observado:** `DenyAllRecruitmentAccessAuthorizer` siempre deniega; tabla de eventos UNIQUE por `company_id+actor_ref_hash+request_id`; `EloquentRecruitmentRepository::transaction()` bloquea `companies` y realiza operación corta, pero **no** se probó sobre MariaDB. El servicio busca solape de entrevista por candidato o entrevistador inter-vacante; `RecruitmentService` mantiene `RIGHTS_REQUESTED` como evento separado, no borrado. CV solo sintético hasta 2 MiB, object store local privado y hash; esto NO garantiza AV ni IAM de producción. B19 conserva deny-all según reporte y test host Codex. No se habilitó ATS público, CV real, consentimiento, autorización HR ni handoff.

**Límites:** DB_REAL=NOT_RUN_ENV, DB_MIGRATION=STATIC_ONLY, DB_CONCURRENCY=IMPLEMENTED_DB_UNRUN, PUBLIC_ATS=BLOCKED_CONTRACT, HR_PERMISSION=BLOCKED_CONTRACT, CV_MALWARE=NOT_VERIFIED, PRIVATE_STORAGE_PROD=NOT_VERIFIED, L5_INDEPENDENT_RUNTIME=NOT_RUN, ANDROID=N/A_B20, RELEASE=NO. Los juicios siguientes son **120 revisiones documentales** de seis leyes L1–L6, NO 120 tests ni certificación legal.

## 10 PASADAS — VERDUGO (adversarial contra la evidencia nueva B20)

| Pasada y objetivo | L1 KISS/Ponytail | L2 Antirruido | L3 Raíz/antiparches | L4 UX humana | L5 Evidencia honesta | L6 Antipingpong | Fallo |
|---|---|---|---|---|---|---|---|
| **V01 ZIP** | Paquete único suficiente | Sin evidencias sueltas | ZIP no cambia producto | Reporte localizable | SHA, CRC y 74 miembros verificados | No volver a validar B19 | **PASS integridad** |
| **V02 Manifest** | Un manifiesto SHA/bytes | 73 filas, no duplicados | No confiar solo en CRC | Errores identificables | 73/73 contrastados directamente | No rehacer ZIP sin defecto | **PASS exactitud** |
| **V03 Patch** | Un diff, no instalador nuevo | 20 add + 1 provider | Baseline real y 20 absent | Reconstrucción entendible | Git apply + 21/21 iguales | No reejecutar B20 parche por rutina | **PASS replay** |
| **V04 PHP** | Sintaxis aislada | Sin entorno completo innecesario | Detectar fallo lexical antes de DB | Mensajes PHP legibles | php -l independiente 21/21 | No convertir lint en otra fase | **PASS sintaxis** |
| **V05 Tenant** | Company en cada entidad | Reusar companies/sites | FK compuesta pretendida | No revelar candidatos ajenos | SQL no ejecutado | Integrar en B21 DB | **PARCIAL** |
| **V06 Idempotencia** | Un evento por request | Sin segundo event ledger | UNIQUE + transacción, no host ficticio | Retry no duplica CV | Fakes secuenciales; DB NO | Dos conexiones B21 | **PARCIAL** |
| **V07 Agenda** | Lock fila empresa | Sin tabla lock propia | Solapes inter-vacante | Adyacencia permitida | Carrera DB no probada | Una prueba B21 con 2 conexiones | **PARCIAL** |
| **V08 Seguridad ATS** | Productivo DENY-ALL | Sin ruta pública | No permiso owner implícito | No prometer link público | 0 rutas según Codex, código sin nuevos routes | No crear B20-S2 para abrir ATS | **PASS cierre scoped** |
| **V09 CV/privacidad** | 2 MiB y almacenamiento privado QA | Reusar private-files | MIME no es antimalware | NO_VERIFICADO visible | Storage fake ≠ IAM prod | Gate seguridad B21 | **PARCIAL** |
| **V10 QA/custodia** | 11 tests host focales | 40 oráculos ≠ 40 suites | Evitar regresión global sin delta | Estados honestos | Custodia solo logs Codex | Siguiente producto B21 | **PASS host acotado** |

## 10 PASADAS — JUEZ (contrastes de decisión del director)

| Pasada y contradicción | L1 KISS/Ponytail | L2 Antirruido | L3 Raíz/antiparches | L4 UX humana | L5 Evidencia honesta | L6 Antipingpong | Fallo |
|---|---|---|---|---|---|---|---|
| **J01 ¿Rehacer B20?** | Conservar vertical | No duplicar ATS | No defecto fatal demostrado | Usar avance ya realizado | Host PASS acotado | Rechazar B20-S2 automático | **RECHAZADO** |
| **J02 ¿Publicar ATS ahora?** | No segunda auth | No endpoint temporal | Falta policy/consentimiento | Candidato no expuesto | 0 rutas reportadas, no E2E real | Seguir bloqueado hasta GO | **RECHAZADO** |
| **J03 ¿Probar DB con fake?** | Una DB QA real | No transacciones simuladas | DB es dependencia raíz | Conflictos reales | Fake no prueba locking | Integrar B21 | **RECHAZADO** |
| **J04 ¿Forzar DB compartida?** | Solo D: aislado | No tocar otros productos | Infra no debe causar daño | No perder otros datos | NOT_RUN_ENV es honesto | Seguir con otros gates | **RECHAZADO** |
| **J05 ¿Permiso HR a owner?** | Una policy real | No rol mágico | Vinculación servidor necesaria | Privacidad del empleado | Sin autorización propietaria | Decisión OWNER pendiente | **RECHAZADO** |
| **J06 ¿QA masiva de 110 casos?** | Solo delta y críticos | No repetir host antiguo | QA integrada por contratos | Flujos reales relevantes | 110 inventario, no 110 PASS | Matriz de cobertura B21 | **RECHAZADO** |
| **J07 ¿Mover B19 al ATS?** | Dos dominios claros | No fusionar storage | Mantener authorizers distintos | Acceso solo correspondiente | Binding B19 reportado intacto | Probar regresión mínima B21 | **RECHAZADO** |
| **J08 ¿Remuneración real ya?** | Motor QA B18 existente | Sin CountryRulePack ficticio | Requiere revisión legal | No mostrar sueldo engañoso | Sin homologación | Gate externo B21/B22 | **RECHAZADO** |
| **J09 ¿Abrir B22 tras B20?** | No recortar producto | Conservar gates B13–B20 | Identidad/DB/privacidad raíz | UAT humano falta | L5 real/Android/DB no aprobados | Ejecutar B21 | **RECHAZADO** |
| **J10 ¿B21 solo otra auditoría?** | Hacer integración productiva | Evitar nuevo informe sin código | Empezar DB/identidad real | Cerrar camino a UX útil | Guardar pruebas reales y fallos | Un macrobloque, un ZIP | **RECHAZADO** |

**Suma:** V01–V10 60 juicios + J01–J10 60 juicios = **120 juicios L1–L6 documentales**. No se inventan nuevos resultados de ejecución. Aceptación B20: **`PASS_HOST_SYNTHETIC_SCOPED`, `B20_GLOBAL=PARTIAL_HOST_OR_CONTRACT`**. El director no aprueba `RELEASE` ni atribuye L5 runtime completo a esta revisión estática/focal.

## Plan único hacia el producto real

**B21-S1** integra y prueba los gates cruzados: MariaDB aislada con migración y dos conexiones cuando existe, identidad servidor y sesión reales con contratos aprobados, recorridos B14–B20 de frontera, permisos y privacidad con deny-by-default; lista **máximo ocho decisiones de propietario** sin rellenar respuestas, y matriz 110+ con cobertura/pendientes, no 110 falsos PASS. Codex ejecuta **un lote grande**, no nuevas auditorías B13–B20, y entrega un ZIP. `B21-S1` puede ser parcial de forma honesta si la infraestructura o el dueño son bloqueantes.

**B22** autorización de lanzamiento: requiere pruebas integrales sobre mismo árbol/build, revisión independiente L5, P0/P1 resueltos, UAT dueño, Android/portal/DB reales según superficie, textos/consentimiento/contratos y reglas jurídicas homologadas cuando corresponda, precio/cobro aprobado y plan de rollback. Nunca convertir un `PARTIAL` en GO por haber pasado host synthetic.

**Única orden siguiente:** `CODEX_LUNA_JORNATO_B21_S1_V1_MACROBLOQUE_INTEGRACION_REAL_GATES_UN_ZIP_20261115.md`, SHA256 `74dc8dc43b87557f4792e3c069c57e60dcdcf2967b3cf8a4584fca94dc4204c9`, entrega `JOR-B21-S1-V1-REAL-INTEGRATION-GATES-20261115-UNICO.zip` y `NEXT_OWNER=CODEX_LUNA` hasta recibirla. `main` GitHub no incluye WIP local. Conservar continuidad documental en PR #2 Draft; sin stage/commit/push/merge/deploy de producto.