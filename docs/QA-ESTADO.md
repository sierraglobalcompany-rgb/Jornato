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
