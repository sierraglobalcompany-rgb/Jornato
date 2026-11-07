# JORNATO — CONTINUIDAD CANÓNICA DE DIRECCIÓN (DOCUMENTAL)

**Corte:** 2026-11-07, Colombia. **Tipo:** checkpoint vivo de dirección y trazabilidad, NO código probado ni aprobación comercial.  
**Director / aceptación:** ChatGPT. **Ejecutor local:** Codex Luna, solo con un lote previamente dirigido. **Propietario:** decide autorizaciones de publicación, contratos y UX aprobados.  
**Siguiente tarea:** `B15-S1 — app empleado / Mi jornada`, prompt director revisado V2; **no ejecutado** a este corte.  
**Política de transferencia:** 1 prompt descargable .md para Codex; 1 ZIP final con código, informe y evidencias. Evitar nuevas vueltas de diagnóstico.

## 1. Jerarquía y fuentes vigentes

1. Decisiones y autorizaciones expresas del propietario, seguridad, leyes obligatorias, contratos aprobados.
2. UX/mockups aprobados y código local comprobado con SHA + QA atribuible.
3. Leyes L1–L6 de [PingPongLaw en commit fijo `84e961cadf482d234f4c0ee2ca60e8c7e9b388e8`](https://github.com/sierraglobalcompany-rgb/PingPongLaw/blob/84e961cadf482d234f4c0ee2ca60e8c7e9b388e8/docs/engineering/LEYES_IMPLEMENTACION_1_A_6.md); leer realmente, no inferir autoload.
4. [`AGENTS.md` de esta rama](../AGENTS.md), contratos y ADR locales; **no sobrescribir reglas existentes al sincronizar**.
5. SPEC V5 histórica = **candidata**, no autorización de nuevos módulos/criterios por sí sola.

L1=KISS/Ponytail, L2=antirruido/no eliminación ciega, L3=causa raíz/no parches, L4=UX humana y aprobada, L5=verificación independiente sin falsos PASS, L6=antiping-pong con dirección de ChatGPT. Cada auditoría de diez pasadas verifica las seis leyes con un juicio sustentado por pasada. No equivale a 60 ejecuciones de QA.

## 2. Identidad del proyecto, alcance y restricción operativa

- **Producto:** Jornato, control de asistencia y gestión laboral de Colombia, con **primer lanzamiento comercial integral**, no MVP recortado por defecto.
- **Arquitectura aprobada:** Flutter Android offline + SQLCipher/outbox; un Laravel/Sanctum + MariaDB/InnoDB. No bifurcar motores de sincronía, login ni backend. `LOGIN != FICHAJE`; consentimiento no se presume; `SERVER_STORED != RECOGNIZED`.
- **Checkout real:** `D:\codex\Jornato`; rama histórica `codex/jor-b08-h4-domain-20261025`; HEAD de referencia `faf5fe283191f8b5a2724b397009512a2caec1b6`. **Ambos son referencias**, Codex debe leer valores actuales. El trabajo B08–B14 y S1–S4 avanzado es WIP LOCAL, gran parte untracked.
- **Discos:** desarrollo, QA y reportes solo D:. Sin teléfono físico, cuentas reales ni SMTP real por defecto. No `git clean/reset/checkout/restore`, no forzar eliminación de temporales bloqueados, no alterar configuración global.
- **Backup:** `PUERTA_A_BACKUP=WAIVED_BY_OWNER_FOR_DEVELOPMENT`, `OFF_DEVICE_BACKUP=NOT_DONE`, `RESTORE_SAMPLE=NOT_RUN`. No reabrir como puerta de desarrollo; reconocer riesgo sin pretender haber respaldado.
- **Publicación:** Sin stage/commit/push/merge/deploy de código local por Codex sin autorización. Esta rama documental sí fue actualizada por el director con instrucción expresa de mantener GitHub al día.
- **Remoto:** `main=1ee6aae821f8cf177cc64149081ad8847f7fec2e` al corte; PR #1 `faf5fe283191f8b5a2724b397009512a2caec1b6` OPEN/DRAFT, tiene instrucciones antiguas; PR #2 OPEN/DRAFT alberga el `AGENTS.md` ampliado y este checkpoint. **NO está en main**. No afirmar recuperabilidad del WIP desde GitHub. Verificar GitHub actual al retomar.

## 3. Estado verificable, hecho por hecho

| Bloque | Estado al corte | Qué se acreditó / qué NO |
|---|---|---|
| B13-S1 | `PASS_QA_FOCAL_REPORTADO`, no comercial | Registro sintético, verificación firmada, empresa/owner transaccional; tests 20/169 + 15/194 reportados; rutas cerradas para registro público. |
| B13-S2 | `PASS_QA_FOCAL_REPORTADO` | Rechaza campos ajenos `actor_id/member_id` con 422. El 201 previo ignoraba los campos; **no hay prueba de suplantación de empleado**. Consentimientos GET/POST/DELETE existentes; semántica legal de DELETE sin extrapolar. |
| B13-S3 | `PASS_QA_FOCAL_REPORTADO` | Reenvío de verificación por URL firmada nativa; recuperación tras fallo de entrega; 9/107 y regresiones reportadas; SMTP no probado. |
| B13-S4 | `S4_PARTIAL` | ZIP `JOR-B13-S4-V2-ONBOARDING-QA-CAUSAL-20261107-UNICO.zip`, SHA256 `6F4BB90ECEAECAF58454EB2298FA3DDB6791691C1661641B92B322D3C2CA340D`. Catch de `TransportExceptionInterface` solo en notificación después de persistir usuario; 500 RED, 202 GREEN, 14 pruebas y 194 aserciones reportadas. SHA/CRC/parche y lint verificados separadamente por ChatGPT; no reejecución DB independiente. `S4-07=NOT_RUN` carrera real; `S4-10=FAIL_LITERAL` por 4 rutas visibles en `APP_ENV=testing` con flag off aunque endpoint 404; local/production sin rutas. No calificar esto como explotación de seguridad demostrada. |
| B13 global | `PARTIAL` | Textos legales no aprobados, SMTP real no probado, registro público NO, S4-07 y S4-10 sin cerrar, L5 runtime pendiente. |
| B14 C04 nuevo | `PASS_TECNICO_REPORTADO_CON_RESERVAS` | 1000 identidades y recibos reconciliados en paquete V7; hashes local/remote representan objetos distintos. JSON persistido raw de 1000 eventos no verificado independientemente. C04 original con tres `requetId` sigue fallo histórico. C10 visual completado. C07 portable NOT_RUN y no consta puerta obligatoria aprobada de B14. Advertencia de fallback de FlutterSecureStorage requiere atención dirigida si se reproduce. |
| B14 global | `FINAL_NOT_APPROVED` | QA técnico útil, pero aceptación integral y L5 independiente no ejecutadas. **No repetir 1000 eventos** sin hipótesis nueva. |
| B15-S1 | `NOT_STARTED` | Próximo vertical: empleado ve su jornada propia; marcación solo si contrato de identidad/política/outbox lo permite; no fingir sensores/hardware. |
| B16–B20 | Pendientes de implementación/aceptación | Portal Pro, novedades, reglas laborales informativas, expedientes, reclutamiento. |
| B21 / B22 | `NOT_STARTED` / `RELEASE_NO` | QA independiente, seguridad, UX, privacidad, revisión jurídica, hardware y GO propietario antes de publicación. |

**No deducir PASS global** de un ZIP intacto, el número de tests, un mensaje de Codex, una matriz de leyes o revisiones del propio implementador. Cambiar el estado solo con prueba nueva y adjudicación del director.

## 4. Próxima operación — B15-S1, sin diagnósticos circulares

Objetivo de valor: empleado autenticado y asociado **legítimamente** a su ficha de trabajador, lectura de `Hoy` / hechos propios en la empresa activa, sin exposición de compañeros; acción de marcación **solo si** el contrato y pipeline ya permiten hacerlo sin inventar autorización.

1. Leer el **AGENTS local** y la versión de esta rama, contrastar sin copiar automáticamente. Confirmar WIP y hashes de los archivos afectados.
2. Examinar una vez relación `User ↔ Employee ↔ Company/Site`, identidad Sanctum, client Flutter y ledger/outbox. Diferenciar membresía empresarial de sujeto empleado: no equivalen por defecto.
3. Implementar corte vertical completo máximo **seguro**: sesión personal, contexto empresa válido, `Mi jornada` propia, UX de estados y aislamiento A/B; marcar si reutilización del pipeline de eventos es realmente válida. No abrir endpoint paralelo solo para una demo.
4. Seguridad: login nunca crea evento; no derivar dueño de datos solo de `employee_id` cliente; aislamiento entre empresas, tokens revocados, logout/cambio de identidad sin fuga de caché, no elevar owner/admin, no mostrar PII de compañeros.
5. Si no hay vínculo usuario-empleado aprobado, documentar contrato faltante con prueba específica y entregar las piezas independientes sin dar PASS falso. No inventar asociaciones o conceder acceso. Sensores reales, push/email y modo físico mantienen `NOT_RUN` hasta QA compatible.
6. QA focal sobre MariaDB aislada, Flutter host/widget, y Android AVD oficial solo si está permitido y disponible en D:. Logs de comandos verdaderos y códigos de salida. Un solo ZIP, no reabrir B13/B14.
7. **NEXT_OWNER=CHATGPT** después del ZIP; ChatGPT hace L5 documental/estática posible y decide el siguiente lote. Evitar sucesivas órdenes de preflight.

## 5. Plan de primera publicación integral

| Etapa | Entrega | Evidencia/gate de salida |
|---|---|---|
| B15-S1 | Mi jornada de empleado seguro | Identidad+tenancy+UI propia+negativos, evento solo si autorizable, QA focal |
| B15 resto | Historial, solicitudes, GPS/QR/Wi-Fi/IP/NFC y notificaciones según contratos | No sensor PASS sin dispositivo/hardware y política validada |
| B16 | Portal web Pro multiempresa/sede, turnos/reportes, roles/plan | Autorización por tenant, reportes reales, no cobros inventados |
| B17 | Novedades/ausencias/vacaciones, ledger | No falsificar horas observadas, revisión legal |
| B18 | Cálculos informativos, recargos, exportaciones | Reglas Colombia versionadas, fixtures y validación profesional |
| B19 | Expedientes/documentos/contratos/firma | Privacidad, acceso, versiones/firma efectiva |
| B20 | Selección/CV/agenda | Seguridad de archivos, aislamiento, privacidad |
| B21 | Integración y auditoría independiente | Resolver S4-07/S4-10, B13 legal/SMTP, reservas B14, dispositivos, QA E2E |
| B22 | Preparación distribución/despliegue | `GO` escrito del propietario + evidencia B21, nunca autopublicar |

## 6. Cómo retomar en un chat nuevo

Leer primero este documento, el `AGENTS.md` de la misma rama y el canon PingPongLaw fijo; contrastar luego la última entrega ZIP que el usuario adjunte. **No confundir el último checkpoint publicado con el estado actual local**. Si hay un ZIP más reciente, adjudicarlo antes de actualizar esta hoja. No preguntar de nuevo por D:, el backup-waiver, KISS, seis leyes, un ZIP o rol de Codex. Actualizar **este mismo archivo** en la misma rama documental, no crear `CONTINUIDAD_V2/V3`.

**Ramas/PR:** documentos publicados en rama `docs/pingponglaw-l1-l6-canon-84e961c`, PR #2 OPEN/DRAFT. `main` no tiene aquí el WIP; fusionar o publicar únicamente con autorización expresa.
