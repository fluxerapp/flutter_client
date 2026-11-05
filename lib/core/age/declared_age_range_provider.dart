import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';

enum DeclaredAgeFloor { none, minor, underMinimum }

const MethodChannel declaredAgeRangeChannel = MethodChannel(
  'fluxer_app/declared_age_range',
);

enum DeclaredAgeReport { adult, minor, underMinimum }

DeclaredAgeReport? declaredAgeReportFromPayload(
  Map<Object?, Object?>? payload,
) {
  if (payload == null || payload['status'] != 'sharing') {
    return null;
  }
  final Object? upper = payload['upperBound'];
  final Object? lower = payload['lowerBound'];
  if (upper is int && upper < 13) {
    return DeclaredAgeReport.underMinimum;
  }
  if (lower is int && lower >= 18) {
    return DeclaredAgeReport.adult;
  }
  return DeclaredAgeReport.minor;
}

DeclaredAgeFloor declaredAgeFloorFromReport(DeclaredAgeReport? report) {
  return switch (report) {
    DeclaredAgeReport.minor => DeclaredAgeFloor.minor,
    DeclaredAgeReport.underMinimum => DeclaredAgeFloor.underMinimum,
    DeclaredAgeReport.adult || null => DeclaredAgeFloor.none,
  };
}

DeclaredAgeFloor declaredAgeFloorFromPayload(Map<Object?, Object?>? payload) {
  return declaredAgeFloorFromReport(declaredAgeReportFromPayload(payload));
}

final declaredAgeReportProvider = FutureProvider<DeclaredAgeReport?>((
  Ref ref,
) async {
  if (kIsWeb || defaultTargetPlatform != TargetPlatform.iOS) {
    return null;
  }
  if (ref.watch(currentUserIdProvider) == null) {
    return null;
  }
  try {
    return declaredAgeReportFromPayload(
      await declaredAgeRangeChannel.invokeMapMethod<Object?, Object?>(
        'request',
      ),
    );
  } on Object {
    return null;
  }
});

final declaredAgeFloorProvider = FutureProvider<DeclaredAgeFloor>((
  Ref ref,
) async {
  return declaredAgeFloorFromReport(
    await ref.watch(declaredAgeReportProvider.future),
  );
});
