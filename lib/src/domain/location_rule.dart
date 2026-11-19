import 'dart:math' as math;

/// Política geométrica de marcación para F2. NO autoriza por sí sola una marca.
///
/// Todo dato aquí es sintético o suministrado por un adaptador de plataforma.
/// La identidad, el dispositivo, el consentimiento, la política empresarial
/// congelada al iniciar el turno y la integridad del reloj deben comprobarse
/// fuera de este módulo. No almacena ni transmite coordenadas.
enum LocationOutcome { notRequired, meetsLocalRule, reviewRequired }

enum LocationReason {
  optionalPolicy,
  missingFix,
  invalidFix,
  futureFix,
  staleFix,
  insufficientAccuracy,
  beyondRadius,
  withinRadius,
}

class LocationFix {
  const LocationFix({
    required this.latitude,
    required this.longitude,
    required this.accuracyMeters,
    required this.capturedAt,
  });

  final double latitude;
  final double longitude;
  final double accuracyMeters;
  final DateTime capturedAt;
}

class LocationAssessment {
  const LocationAssessment({
    required this.outcome,
    required this.reason,
    this.distanceMeters,
  });

  final LocationOutcome outcome;
  final LocationReason reason;

  /// Distancia geométrica calculada, NO prueba de presencia o identidad.
  /// No incluye la coordenada original ni debe registrarse sin política.
  final double? distanceMeters;
}

class LocationRule {
  const LocationRule.optional()
      : isRequired = false,
        siteLatitude = null,
        siteLongitude = null,
        radiusMeters = 0;

  LocationRule.requiredSite({
    required double siteLatitude,
    required double siteLongitude,
    double radiusMeters = 100,
  })  : isRequired = true,
        siteLatitude = siteLatitude,
        siteLongitude = siteLongitude,
        radiusMeters = radiusMeters {
    if (!_validCoordinates(siteLatitude, siteLongitude)) {
      throw ArgumentError('Coordenadas de sede inválidas');
    }
    if (!radiusMeters.isFinite ||
        radiusMeters <= 0 ||
        radiusMeters > maxRadiusMeters) {
      throw ArgumentError('Radio permitido: mayor que 0 y máximo 100 m');
    }
  }

  static const double maxRadiusMeters = 100;
  static const double maxAccuracyMeters = 25;
  static const Duration maxFixAge = Duration(seconds: 30);
  static const double _earthRadiusMeters = 6371008.8;

  final bool isRequired;
  final double? siteLatitude;
  final double? siteLongitude;
  final double radiusMeters;

  /// Solo evalúa la regla geométrica/local:
  /// - Sin GPS obligatorio => notRequired (no solicita evidencia).
  /// - Evidencia ausente, imposible, vieja, futura o imprecisa => revisión.
  /// - Distancia desde sede + margen de precisión <= radio => cumple la
  ///   geometría, pero NUNCA implica aprobación automática de asistencia.
  LocationAssessment evaluate({required DateTime now, LocationFix? fix}) {
    if (!isRequired) {
      return const LocationAssessment(
        outcome: LocationOutcome.notRequired,
        reason: LocationReason.optionalPolicy,
      );
    }
    if (fix == null) {
      return const LocationAssessment(
        outcome: LocationOutcome.reviewRequired,
        reason: LocationReason.missingFix,
      );
    }
    if (!_validCoordinates(fix.latitude, fix.longitude) ||
        !fix.accuracyMeters.isFinite ||
        fix.accuracyMeters <= 0) {
      return const LocationAssessment(
        outcome: LocationOutcome.reviewRequired,
        reason: LocationReason.invalidFix,
      );
    }

    final ageMicroseconds =
        now.toUtc().difference(fix.capturedAt.toUtc()).inMicroseconds;
    if (ageMicroseconds < 0) {
      return const LocationAssessment(
        outcome: LocationOutcome.reviewRequired,
        reason: LocationReason.futureFix,
      );
    }
    if (ageMicroseconds > maxFixAge.inMicroseconds) {
      return const LocationAssessment(
        outcome: LocationOutcome.reviewRequired,
        reason: LocationReason.staleFix,
      );
    }
    if (fix.accuracyMeters > maxAccuracyMeters) {
      return const LocationAssessment(
        outcome: LocationOutcome.reviewRequired,
        reason: LocationReason.insufficientAccuracy,
      );
    }

    final distance = _distanceMeters(
      siteLatitude!,
      siteLongitude!,
      fix.latitude,
      fix.longitude,
    );
    if (distance + fix.accuracyMeters > radiusMeters) {
      return LocationAssessment(
        outcome: LocationOutcome.reviewRequired,
        reason: LocationReason.beyondRadius,
        distanceMeters: distance,
      );
    }
    return LocationAssessment(
      outcome: LocationOutcome.meetsLocalRule,
      reason: LocationReason.withinRadius,
      distanceMeters: distance,
    );
  }

  static bool _validCoordinates(double latitude, double longitude) =>
      latitude.isFinite &&
      longitude.isFinite &&
      latitude >= -90 &&
      latitude <= 90 &&
      longitude >= -180 &&
      longitude <= 180;

  /// Haversine esférico para distancia aproximada entre dos puntos GPS.
  /// El clamp evita NaN numérico cerca de puntos opuestos.
  static double _distanceMeters(
    double latitudeA,
    double longitudeA,
    double latitudeB,
    double longitudeB,
  ) {
    const radians = math.pi / 180;
    final latitudeDelta = (latitudeB - latitudeA) * radians;
    final longitudeDelta = (longitudeB - longitudeA) * radians;
    final start = latitudeA * radians;
    final end = latitudeB * radians;
    final sineLatitude = math.sin(latitudeDelta / 2);
    final sineLongitude = math.sin(longitudeDelta / 2);
    final haversine = sineLatitude * sineLatitude +
        math.cos(start) * math.cos(end) *
            sineLongitude * sineLongitude;
    final bounded = math.max(0.0, math.min(1.0, haversine));
    return 2 * _earthRadiusMeters * math.asin(math.sqrt(bounded));
  }
}
