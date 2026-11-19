import 'package:flutter_test/flutter_test.dart';
import 'package:jornato/src/domain/location_rule.dart';

void main() {
  final now = DateTime.utc(2026, 11, 18, 12);
  final rule = LocationRule.requiredSite(
    siteLatitude: 6.25,
    siteLongitude: -75.56,
  );

  LocationFix fix({
    double latitude = 6.25,
    double longitude = -75.56,
    double accuracyMeters = 5,
    DateTime? capturedAt,
  }) => LocationFix(
        latitude: latitude,
        longitude: longitude,
        accuracyMeters: accuracyMeters,
        capturedAt: capturedAt ?? now,
      );

  test('GPS no obligatorio no exige evidencia ni marca distancia', () {
    final result = const LocationRule.optional().evaluate(now: now);
    expect(result.outcome, LocationOutcome.notRequired);
    expect(result.reason, LocationReason.optionalPolicy);
    expect(result.distanceMeters, isNull);
  });

  test('GPS opcional no inspecciona una lectura ajena', () {
    final result = const LocationRule.optional().evaluate(
      now: now,
      fix: fix(latitude: 91, accuracyMeters: double.nan),
    );
    expect(result.outcome, LocationOutcome.notRequired);
    expect(result.distanceMeters, isNull);
  });

  test('GPS requerido sin lectura exige revisión, no aprobación', () {
    final result = rule.evaluate(now: now);
    expect(result.outcome, LocationOutcome.reviewRequired);
    expect(result.reason, LocationReason.missingFix);
  });

  test('coincidencia exacta con sede cumple sólo la regla geométrica', () {
    final result = rule.evaluate(now: now, fix: fix());
    expect(result.outcome, LocationOutcome.meetsLocalRule);
    expect(result.reason, LocationReason.withinRadius);
    expect(result.distanceMeters, closeTo(0, 0.001));
  });

  test('precisión exactamente 25 metros es elegible en el centro', () {
    final result = rule.evaluate(
      now: now,
      fix: fix(accuracyMeters: 25),
    );
    expect(result.outcome, LocationOutcome.meetsLocalRule);
  });

  test('precisión mayor de 25 metros obliga revisión', () {
    final result = rule.evaluate(
      now: now,
      fix: fix(accuracyMeters: 25.001),
    );
    expect(result.outcome, LocationOutcome.reviewRequired);
    expect(result.reason, LocationReason.insufficientAccuracy);
  });

  test('precisión cero no equivale a una medición válida', () {
    final result = rule.evaluate(
      now: now,
      fix: fix(accuracyMeters: 0),
    );
    expect(result.reason, LocationReason.invalidFix);
    expect(result.outcome, LocationOutcome.reviewRequired);
  });

  test('precisión negativa no se acepta', () {
    expect(
      rule.evaluate(now: now, fix: fix(accuracyMeters: -1)).reason,
      LocationReason.invalidFix,
    );
  });

  test('NaN o infinito en precisión no se acepta', () {
    for (final accuracy in <double>[double.nan, double.infinity]) {
      expect(
        rule.evaluate(
          now: now,
          fix: fix(accuracyMeters: accuracy),
        ).reason,
        LocationReason.invalidFix,
      );
    }
  });

  test('coordenadas imposibles nunca cumplen la regla', () {
    for (final observation in <LocationFix>[
      fix(latitude: 90.0001),
      fix(latitude: -90.0001),
      fix(longitude: 180.0001),
      fix(longitude: -180.0001),
      fix(latitude: double.nan),
      fix(longitude: double.infinity),
    ]) {
      final result = rule.evaluate(now: now, fix: observation);
      expect(result.outcome, LocationOutcome.reviewRequired);
      expect(result.reason, LocationReason.invalidFix);
    }
  });

  test('lectura exactamente de 30 segundos es elegible', () {
    final result = rule.evaluate(
      now: now,
      fix: fix(capturedAt: now.subtract(const Duration(seconds: 30))),
    );
    expect(result.outcome, LocationOutcome.meetsLocalRule);
  });

  test('lectura de 30 segundos y un microsegundo es vieja', () {
    final result = rule.evaluate(
      now: now,
      fix: fix(
        capturedAt: now.subtract(
          const Duration(seconds: 30, microseconds: 1),
        ),
      ),
    );
    expect(result.reason, LocationReason.staleFix);
  });

  test('lectura futura se revisa, aunque sea por un microsegundo', () {
    final result = rule.evaluate(
      now: now,
      fix: fix(capturedAt: now.add(const Duration(microseconds: 1))),
    );
    expect(result.reason, LocationReason.futureFix);
    expect(result.outcome, LocationOutcome.reviewRequired);
  });

  test('distintas representaciones horarias del mismo instante equivalen', () {
    final result = rule.evaluate(
      now: now.toLocal(),
      fix: fix(capturedAt: now),
    );
    expect(result.outcome, LocationOutcome.meetsLocalRule);
  });

  test('distancia más precisión dentro del radio permite continuar', () {
    // ~89 metros hacia el este en el Ecuador; margen adicional de 10 m.
    final atEquator = LocationRule.requiredSite(
      siteLatitude: 0,
      siteLongitude: 0,
    );
    final result = atEquator.evaluate(
      now: now,
      fix: fix(latitude: 0, longitude: 0.0008, accuracyMeters: 10),
    );
    expect(result.distanceMeters, closeTo(88.956, 1.0));
    expect(result.outcome, LocationOutcome.meetsLocalRule);
  });

  test('distancia más precisión superior a radio exige revisión', () {
    final atEquator = LocationRule.requiredSite(
      siteLatitude: 0,
      siteLongitude: 0,
    );
    final result = atEquator.evaluate(
      now: now,
      fix: fix(latitude: 0, longitude: 0.00083, accuracyMeters: 10),
    );
    expect(result.outcome, LocationOutcome.reviewRequired);
    expect(result.reason, LocationReason.beyondRadius);
    expect(result.distanceMeters, greaterThan(90));
  });

  test('ubicación geométrica muy lejana requiere revisión', () {
    final atEquator = LocationRule.requiredSite(
      siteLatitude: 0,
      siteLongitude: 0,
    );
    final result = atEquator.evaluate(
      now: now,
      fix: fix(latitude: 0, longitude: 0.001, accuracyMeters: 1),
    );
    expect(result.outcome, LocationOutcome.reviewRequired);
    expect(result.distanceMeters, greaterThan(110));
  });

  test('radio de sede más estricto no se relaja a 100 metros', () {
    final small = LocationRule.requiredSite(
      siteLatitude: 0,
      siteLongitude: 0,
      radiusMeters: 50,
    );
    expect(
      small.evaluate(
        now: now,
        fix: fix(latitude: 0, longitude: 0.0004, accuracyMeters: 10),
      ).reason,
      LocationReason.beyondRadius,
    );
    expect(
      small.evaluate(
        now: now,
        fix: fix(latitude: 0, longitude: 0.00025, accuracyMeters: 10),
      ).outcome,
      LocationOutcome.meetsLocalRule,
    );
  });

  test('la precisión no puede exceder un radio de sede muy pequeño', () {
    final small = LocationRule.requiredSite(
      siteLatitude: 0,
      siteLongitude: 0,
      radiusMeters: 20,
    );
    expect(
      small.evaluate(
        now: now,
        fix: fix(latitude: 0, longitude: 0, accuracyMeters: 25),
      ).reason,
      LocationReason.beyondRadius,
    );
  });

  test('cruzar el meridiano 180 no crea una distancia de medio planeta', () {
    final atDateLine = LocationRule.requiredSite(
      siteLatitude: 0,
      siteLongitude: 179.9999,
    );
    final result = atDateLine.evaluate(
      now: now,
      fix: fix(latitude: 0, longitude: -179.9999, accuracyMeters: 10),
    );
    expect(result.distanceMeters, closeTo(22.24, 1.0));
    expect(result.outcome, LocationOutcome.meetsLocalRule);
  });

  test('dos longitudes distintas sobre el polo norte coinciden', () {
    final atPole = LocationRule.requiredSite(
      siteLatitude: 90,
      siteLongitude: 10,
    );
    final result = atPole.evaluate(
      now: now,
      fix: fix(latitude: 90, longitude: -150, accuracyMeters: 2),
    );
    expect(result.distanceMeters, closeTo(0, 0.001));
    expect(result.outcome, LocationOutcome.meetsLocalRule);
  });

  test('sede fuera de coordenadas válidas se rechaza al configurar', () {
    expect(
      () => LocationRule.requiredSite(
        siteLatitude: 91,
        siteLongitude: 0,
      ),
      throwsArgumentError,
    );
    expect(
      () => LocationRule.requiredSite(
        siteLatitude: 0,
        siteLongitude: -181,
      ),
      throwsArgumentError,
    );
    expect(
      () => LocationRule.requiredSite(
        siteLatitude: double.nan,
        siteLongitude: 0,
      ),
      throwsArgumentError,
    );
  });

  test('radio inválido o superior a 100 metros se rechaza', () {
    for (final meters in <double>[
      -1, 0, 100.0001, double.nan, double.infinity,
    ]) {
      expect(
        () => LocationRule.requiredSite(
          siteLatitude: 0,
          siteLongitude: 0,
          radiusMeters: meters,
        ),
        throwsArgumentError,
      );
    }
    expect(
      LocationRule.requiredSite(
        siteLatitude: 0,
        siteLongitude: 0,
        radiusMeters: 100,
      ).radiusMeters,
      100,
    );
  });

  test('límites son los fijados por el contrato, no valores del sensor', () {
    expect(LocationRule.maxRadiusMeters, 100);
    expect(LocationRule.maxAccuracyMeters, 25);
    expect(LocationRule.maxFixAge, const Duration(seconds: 30));
  });

  test('evaluar no cambia ni consume la observación recibida', () {
    final observation = fix();
    final first = rule.evaluate(now: now, fix: observation);
    final second = rule.evaluate(now: now, fix: observation);
    expect(first.reason, second.reason);
    expect(first.distanceMeters, second.distanceMeters);
    expect(observation.latitude, 6.25);
    expect(observation.longitude, -75.56);
  });
}
