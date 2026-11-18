# QA / límites verificables

Fecha: 2026-10-24. Fuente de referencia v4: 196 pruebas reportadas por la transferencia; **no son pruebas de Jornato**.

## Entrega de este lote
- [x] Repositorio Jornato aislado de ERP-BDM.
- [x] Nombre de paquete Dart y app: jornato/Jornato.
- [x] Motor puro con cuatro eventos, transiciones, idempotencia local y cálculo de pausas reales.
- [x] Tests fuente de casos felices y negativos.
- [ ] Ejecutar flutter analyze y flutter test: **NO EJECUTADO**, SDK ausente en el entorno de preparación.
- [ ] Generar scaffolding Android con Flutter SDK y verificar flutter build apk.
- [ ] Ejecutar smoke real en emulador y teléfono.
- [ ] Evaluar base local cifrada y Keystore, recuperación tras reinicio y pérdida de conexión.
- [ ] Test de timestamp manipulado, múltiples zonas, DST, controles de rol, tenant isolation, restauración corrupta.
- [ ] Aplicar canon PingPongLaw L1–L6 desde fuente completa validada; sólo se conoce su hash de referencia.
- [ ] Validación legal de privacidad y tiendas/monetización antes de publicación.

## Gate estructural enfocado — sin Codex ni Actions (2026-11-18)

**Análisis realizado sobre el árbol GitHub del PR #3 antes de este
cambio, HEAD `e80413bc5a8a30f25254292b5f212cea1bea337a`:**
26 archivos fuente/configuración, 15 archivos Dart, 37 imports
inspeccionados y **0 imports locales sin resolver**. Coinciden **111
declaraciones de test** en los archivos de `test/`. Se encontraron
**2 llamadas a `print()`** en el smoke que contradicen
`analysis_options.yaml` (`avoid_print`); se reemplazaron por
`stdout.writeln` (Dart puro, sin dependencias) sin modificar los
**31 checks** del smoke. El runner PowerShell fue reforzado para
declarar FAIL si QA modifica HEAD, stage o código tracked; reporta
archivos untracked generados sin confundirlos con el WIP real.

**ALCANCE DEL GATE: revisión estructural de fuentes, NO compilación.**
Ni el runner Windows ni `flutter test`, `flutter analyze`,
`dart tool/smoke_attendance.dart`, Android, SQLCipher o H9 fueron
ejecutados en este entorno, pues Dart/Flutter/pwsh no están instalados
y no hay salida a repositorios externos para descargarlos.
La revisión de imports no detecta todos los errores de sintaxis, tipos
o contratos. No convertir la ausencia de imports rotos en PASS de
aplicación. Acumulado conserva **111 tests escritos, NOT_RUN** y
smoke **31 checks escritos, NOT_RUN**.

---

## Quinto bloque remoto: exportación diaria CSV en memoria (2026-11-18)

- **Código real:** `lib/src/domain/attendance_csv_report.dart` agrega
  a partir de `AttendanceReport.days` una salida CSV determinista
  con CRLF: `fecha,turnos,finalizados,abiertos,trabajo_microsegundos,
  pausa_microsegundos`. Mantiene fracciones de segundo, fecha civil
  de entrada y turnos abiertos, sin dividir jornadas nocturnas.
- **Privacidad mínima de formato:** únicamente fechas y enteros
  calculados; no incorpora workspace/sujeto/actor/IDs/GPS, ni permite
  columnas arbitrarias procedentes del usuario. Una fecha civil no
  canónica se rechaza para no inyectar texto interpretado como fórmula.
  Aun así, HORAS DE TRABAJO pueden ser datos personales: el código
  **no almacena, transmite, descarga ni habilita exportación por UI**.
  Autorización, controles de retención, cifrado y consentimiento se
  verifican en la integración real, no en esta función.
- **QA declarada, no ejecutada:** 14 tests fuente nuevos sobre rangos,
  cortes, turnos nocturnos, segundos fraccionarios, privacidad y
  no-mutación. `tool/smoke_attendance.dart` agrega 4 comprobaciones:
  de 27 a 31. Acumulado del PR #3: **111 tests Flutter escritos**
  (8 originales +31+27+6+25+14), **0 tests ejecutados aquí**;
  smoke con **31 checks escritos, NOT_RUN**.
- Sin nuevos paquetes, bases, APIs, permisos ni cambios de backend.
  El SDK Dart/Flutter sigue ausente; `flutter analyze/test/build`,
  APK física, H9 integral, SQLCipher y release: **NOT_RUN/NO_GO**.
  No mergear PR #3 al WIP Windows avanzado sin comparación.
- Es un avance F0/F3 de código reutilizable, **no certifica**
  módulo de informes productivo ni derechos laborales.

---

## Cuarto bloque remoto: regla GPS geométrica F2 (2026-11-18)

**Alcance:** Dart puro de negocio, reutilizable en el futuro Android
avanzado; no integra sensores, identidad, almacenamiento ni backend.

- `lib/src/domain/location_rule.dart`: `LocationRule.optional()` y
  `LocationRule.requiredSite(siteLatitude, siteLongitude, radiusMeters)`
  con radio permitido >0 y <=100 m, GPS horizontal con precisión >0 y
  <=25 m, edad de lectura [0,30] segundos, rechazo de fecha futura,
  coordenadas inválidas, NaN/infinito y de `distancia+precisión>radio`.
  La distancia es Haversine aprox. con control numérico de polos y
  antimeridiano. Ausencia/anomalía genera **reviewRequired**, nunca
  permiso automático; GPS opcional => **notRequired** sin evaluar fix.
- `test/location_rule_test.dart`: **25 escenarios fuente nuevos**,
  no ejecutados; incluyen límites, meridiano 180, polos y políticas de
  sede más estrictas. Cero paquetes añadidos.
- `tool/smoke_attendance.dart`: siete aserciones sintéticas de GPS
  añadidas; **27 checks escritos acumulados**, todos NOT_RUN.
- **Acumulado PR #3** = 8 originales +31 primer bloque +27 segundo
  +6 tercero +25 actuales = **97 tests Flutter escritos, cero tests
  Flutter ejecutados por esta sesión**. El smoke Dart es otro artefacto;
  no se suma a los 97. `flutter analyze`, `flutter test`, `dart`
  y `flutter build apk` **NOT_RUN**: no hay SDK disponible en este
  runtime y no hubo GitHub Actions ni Codex.
- **Límites de seguridad:** `meetsLocalRule` significa exclusivamente
  resultado numérico sobre una lectura que entrega un adaptador confiable.
  NO certifica GPS físico, protección antifraude, origen/timestamp
  auténtico, empleado/empresa, consentimiento, privacidad, aprobación
  de marcación, ni uso conforme a OD01–OD08. El resultado no almacena
  coordenadas; NO conectar todavía al botón de marcación F0.
- **Siguiente integración real** exige inspección del código avanzado
  `D:\\codex\\Jornato`, identificar las políticas ya existentes,
  respetar las aprobaciones de geolocalización y probar GPS físico,
  permisos, precisión/edad, revocación, offline y casos negativos.
  **Ningún merge/push al WIP, cambio de permiso ni publicación
  comercial está autorizado**. H9 / B22 / release: NO_GO.

---

## Tercer bloque remoto: motor indexado + smoke local sin CI (2026-11-18)

**Alcance:** sobre el PR #3 F0 remoto, no el WIP de Windows.

- `AttendanceLedger.record` conserva exactamente las reglas de
  idempotencia, autor/espacio/sujeto, secuencia y cronología, pero reemplaza
  la búsqueda lineal de `eventId` por un índice privado `Map` para
  búsqueda en tiempo promedio O(1). Se actualiza sólo tras una validación
  exitosa; ningún evento rechazado reserva un ID. La lista sigue siendo la
  fuente cronológica; ninguna nueva capa de persistencia.
- **6 tests nuevos de código fuente, NOT_RUN**, incluidos 2.000 eventos,
  reintento de ID antiguo, conflicto antiguo, intento inválido sin
  contaminar índice y recuperación desde archivo.
- **Smoke Dart puro** `tool/smoke_attendance.dart` con 20 comprobaciones
  (jornadas, pausas, días civiles de Bogotá, archivo, idempotencia,
  reconciliación y un historial de 1.000 eventos). **ESCRITO, NOT_RUN**:
  no se dispone de Dart en este entorno.
- **QA local sin Codex/Actions:** `scripts/qa_local_f0.ps1` exige un
  clon **separado y limpio** del PR #3, ejecuta smoke, `flutter pub get
  --offline`, `flutter analyze`, `flutter test`; opcional `-ApkDebug`
  sólo con andamiaje Android preexistente. Si el SDK o caché local faltan,
  conserva estado FAIL/BLOCKED en logs fuera del repositorio. **Nunca**
  ejecuta `flutter create`, CI, Docker, servidor, merge, push, reset ni
  cambios en el WIP del producto.
- **Conteo acumulado en PR #3:** 8 casos base + 31 bloque 1 + 27 bloque 2
  + **6 bloque 3 = 72 tests Flutter escritos; 0 ejecutados aquí**.
  El smoke suma **20 chequeos escritos, NO ejecutados**: no contarlos
  como tests `flutter_test`.
- Este bloque mejora escala y verificabilidad del motor F0, **no**
  resuelve SQLCipher, Android real, arranque Laravel, contratos OD ni
  sincronización Pro. No hay PASS nuevo de producto ni aprobación H9.
  `RELEASE=NO_GO`.
- La validación local, si se consigue, sólo certifica el SHA del PR #3
  y su clon limpio, **no** los tests PHP del árbol WIP ni la aplicación
  comercial. Reconciliación manual previa a toda integración.

---

## Delta incremental directo sin Codex ni Actions (2026-11-18)

**Alcance añadido al MISMO PR #3 Draft**, aún apilado sobre el PR #1.
Trabajo sobre el prototipo remoto, NO sobre el WIP local avanzado.

- **Conciliación append-only** `AttendanceArchive.reconcile(current, source)`:
  valida y reconstruye primero la captura, comprueba misma empresa/espacio
  y sujeto, exige prefijo de eventos idénticos en ambas direcciones, elige
  la secuencia válida más extensa y **nunca modifica el libro original**.
  Un evento antiguo cambiado, un orden divergente o un archivo inválido
  se rechazan. **No es sincronización de red ni verifica autenticidad
  de origen**; requiere capa de almacenamiento cifrado y autorización.
- **Resumen diario sin reglas legales implícitas** `AttendanceReport.days`:
  agrupa turnos por FECHA CIVIL DE ENTRADA (incluidos nocturnos), totaliza
  trabajo/pausas reales y marca turnos abiertos. La conversión de UTC a
  civil se inyecta explícitamente por instante para no asumir el huso
  horario del servidor ni un offset fijo. No calcula extras, nómina,
  tardanzas, ausencias ni derechos laborales.
- **Interfaz personal F0:** visualiza resumen por día, turnos y eventos
  de la sesión, manteniendo el aviso de memoria volátil.
- **Pruebas añadidas en este delta:** 13 del reporte + 14 de conciliación,
  **27 pruebas ESCRITAS, NOT_RUN**. Acumulado del PR #3:
  8 base + 31 primer delta + 27 actual = **66 casos escritos, 0 ejecutados
  en esta sesión**. Sin Flutter/Dart SDK, no atribuir PASS de compilación,
  tests, emulador, APK, SQLCipher, Keystore ni web.
- **Seguridad:** cero paquetes nuevos, cero infraestructura extra,
  cero tratamientos de datos reales, cero secretos. JSON de archivo sigue
  siendo texto sin cifrar y no se expone como respaldo.
- **Riesgo residual:** antes de usar reportes multi-país, el consumidor
  debe fijar la zona horaria civil según política y manejar DST/cambio
  de zona en dispositivo. El cálculo simple no reemplaza una política
  laboral/contractual aprobada.
- **Reconciliación local obligatoria para producto:** comparar módulo a
  módulo con el WIP no publicado de `D:\\codex\\Jornato`, preservar
  todas sus rutas staged/untracked; no cherry-pick ni merge automático.
- **GATE:** `PR3_F0_SOURCE_ONLY=READY_FOR_REVIEW`,
  `FLUTTER_TEST=NOT_RUN`, `H9=NO_GO`, `RELEASE=NO_GO`.
  El PASS previo de 158 tests PHPUnit pertenece a otro árbol/entorno.

---

## Delta remoto de desarrollo: proyecciones y archivo F0 (2026-11-17)

**Origen:** rama nueva basada exclusivamente en el prototipo remoto del PR #1.
**No es copia, sustituto, migración ni fusión del WIP avanzado en
`D:\\codex\\Jornato`.** Integrar sólo después de comparar ambos árboles
y conservar los archivos locales, especialmente los que estén untracked.

- Motor: una sola implementación de intervalos proyecta turnos, incluido
  turno nocturno, pausas reales, varios turnos y cortes temporales.
  El snapshot anterior usa esos intervalos, evitando lógica duplicada.
- UI temporal: muestra trabajo/pausas acumulados y cada turno de la sesión.
  **Sigue perdiendo los datos al cerrar la aplicación.**
- Archivo: `AttendanceArchive.encode/decode` serializa eventos de forma
  determinista y los restaura mediante `AttendanceLedger.record`.
  Rechaza formato desconocido, duplicados, cronología inválida,
  eventos de otro espacio/sujeto y transiciones ilegales.
- Seguridad: el JSON es **texto plano**, NO SQLCipher, no se guarda en disco,
  no es copia de respaldo, no incluye tokens ni constituye sincronización Pro.
  No publicarlo ni exponerlo a usuarios como respaldo seguro.
- Pruebas de fuente: 8 existentes + 18 nuevas del archivo + 13 nuevas
  de turnos = **39 casos declarados, NOT_RUN**.
  El conteo no implica ejecución ni aprobación independiente.
- **Sin Flutter SDK ni Android SDK en este entorno:** `flutter analyze`,
  `flutter test`, `flutter build apk`, Android físico, SQLCipher, arranque
  normal de Laravel, H9 y PR listo para merge siguen NOT_RUN/NO_GO.
  GitHub Actions no se invocan ni son requisito de este bloque.
- Dependencias: cero paquetes nuevos; no se crea otro backend, almacenamiento,
  servicio ni lógica de permisos. El código es Dart/Flutter F0 solamente.
- Reconciliación posterior: comparar diferencias con el worktree local
  **antes** de aplicar, sin `reset/clean/stash/merge` automático; conservar
  `AGENTS.md` local, permisos y contratos. No publicar secretos ni WIP.
- **NEXT:** ChatGPT Director. Sin Codex ni GitHub Actions, mantener la
  rama remota como PR Draft para revisión. Para completar el producto real
  hará falta acceder al código avanzado de D: por transferencia segura y
  ejecutar sus pruebas locales/dispositivo. B22/release NO_GO.

---

Este prototipo pierde eventos al terminar el proceso, **no apto para operación real**. No se declara F0 finalizada.
