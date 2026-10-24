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

Este prototipo pierde eventos al terminar el proceso, **no apto para operación real**. No se declara F0 finalizada.
