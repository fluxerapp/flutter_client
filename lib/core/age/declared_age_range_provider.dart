import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/build/push_provider_guard.dart';
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
  if ((upper is int && upper < 13) || (lower is int && lower < 13)) {
    return DeclaredAgeReport.underMinimum;
  }
  if (lower is int && lower >= 18) {
    return DeclaredAgeReport.adult;
  }
  return DeclaredAgeReport.minor;
}

bool declaredAgeVerificationRequired(Map<Object?, Object?>? payload) {
  return payload?['status'] == 'verification_required';
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

bool declaredAgeReportingSupported({
  required bool isWeb,
  required TargetPlatform platform,
  required bool isFirebaseMessaging,
}) {
  if (isWeb) {
    return false;
  }
  return switch (platform) {
    TargetPlatform.iOS => true,
    TargetPlatform.android => isFirebaseMessaging,
    _ => false,
  };
}

final declaredAgeReportingSupportedProvider = Provider<bool>((Ref ref) {
  return declaredAgeReportingSupported(
    isWeb: kIsWeb,
    platform: defaultTargetPlatform,
    isFirebaseMessaging: PushProviderGuard.isFirebaseMessaging,
  );
});

final declaredAgePayloadProvider = FutureProvider<Map<Object?, Object?>?>((
  Ref ref,
) async {
  if (!ref.watch(declaredAgeReportingSupportedProvider)) {
    return null;
  }
  if (ref.watch(currentUserIdProvider) == null) {
    return null;
  }
  try {
    return await declaredAgeRangeChannel.invokeMapMethod<Object?, Object?>(
      'request',
    );
  } on Object {
    return null;
  }
});

final declaredAgeReportProvider = FutureProvider<DeclaredAgeReport?>((
  Ref ref,
) async {
  return declaredAgeReportFromPayload(
    await ref.watch(declaredAgePayloadProvider.future),
  );
});

final declaredAgeFloorProvider = FutureProvider<DeclaredAgeFloor>((
  Ref ref,
) async {
  return declaredAgeFloorFromReport(
    await ref.watch(declaredAgeReportProvider.future),
  );
});
