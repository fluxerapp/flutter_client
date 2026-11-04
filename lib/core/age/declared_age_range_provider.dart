import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';

enum DeclaredAgeFloor { none, minor, underMinimum }

const MethodChannel declaredAgeRangeChannel = MethodChannel(
  'fluxer_app/declared_age_range',
);

DeclaredAgeFloor declaredAgeFloorFromPayload(Map<Object?, Object?>? payload) {
  if (payload == null || payload['status'] != 'sharing') {
    return DeclaredAgeFloor.none;
  }
  final Object? upper = payload['upperBound'];
  final Object? lower = payload['lowerBound'];
  if (upper is int && upper < 13) {
    return DeclaredAgeFloor.underMinimum;
  }
  if (lower is int && lower >= 18) {
    return DeclaredAgeFloor.none;
  }
  return DeclaredAgeFloor.minor;
}

final declaredAgeFloorProvider = FutureProvider<DeclaredAgeFloor>((
  Ref ref,
) async {
  if (kIsWeb || defaultTargetPlatform != TargetPlatform.iOS) {
    return DeclaredAgeFloor.none;
  }
  if (ref.watch(currentUserIdProvider) == null) {
    return DeclaredAgeFloor.none;
  }
  try {
    return declaredAgeFloorFromPayload(
      await declaredAgeRangeChannel.invokeMapMethod<Object?, Object?>(
        'request',
      ),
    );
  } on Object {
    return DeclaredAgeFloor.none;
  }
});
