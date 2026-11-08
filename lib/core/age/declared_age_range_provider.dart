import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/age/app_attest_age_service.dart';
import 'package:fluxer_app/core/age/play_integrity_age_service.dart';
import 'package:fluxer_app/core/api/dio_error_message.dart';
import 'package:fluxer_app/core/build/push_provider_guard.dart';
import 'package:fluxer_app/core/instance/instance_config_snapshot.dart';
import 'package:fluxer_app/core/providers/instance/active_instance_provider.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/core/talker.dart';
import 'package:fluxer_app/features/mature_content/providers/mature_geo_provider.dart';
import 'package:fluxer_app/features/mature_content/utils/mature_access_utils.dart';
import 'package:fluxer_app/features/shell/providers/user/current_user_private_provider.dart';

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

DeclaredAgeFloor declaredAgeFloorFromReport(DeclaredAgeReport? report) {
  return switch (report) {
    DeclaredAgeReport.minor => DeclaredAgeFloor.minor,
    DeclaredAgeReport.underMinimum => DeclaredAgeFloor.underMinimum,
    DeclaredAgeReport.adult || null => DeclaredAgeFloor.none,
  };
}

bool declaredAgeReportingSupported({
  required bool isWeb,
  required TargetPlatform platform,
  required bool isFirebaseMessaging,
  required bool officialInstance,
  required bool selfHosted,
}) {
  if (isWeb || !officialInstance || selfHosted) {
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
    officialInstance: ref.watch(isActiveInstanceOfficialProvider),
    selfHosted: ref.watch(
      activeInstanceProvider.select(
        (InstanceConfigSnapshot snapshot) =>
            snapshot.wellKnown?.features.selfHosted ?? false,
      ),
    ),
  );
});

typedef DeclaredAgeRequirement = ({bool available, bool required});

DeclaredAgeRequirement declaredAgeRequirementFromPayload(
  Map<Object?, Object?>? payload,
) {
  return (
    available: payload?['available'] == true,
    required: payload?['required'] == true,
  );
}

final declaredAgeRequirementProvider = FutureProvider<DeclaredAgeRequirement>((
  Ref ref,
) async {
  if (!ref.watch(declaredAgeReportingSupportedProvider)) {
    return (available: false, required: false);
  }
  if (defaultTargetPlatform != TargetPlatform.iOS) {
    return (available: true, required: false);
  }
  try {
    return declaredAgeRequirementFromPayload(
      await declaredAgeRangeChannel.invokeMapMethod<Object?, Object?>(
        'requirement',
      ),
    );
  } on Object {
    return (available: false, required: false);
  }
});

Future<Map<Object?, Object?>?> _requestDeclaredAgeRange() async {
  try {
    return await declaredAgeRangeChannel.invokeMapMethod<Object?, Object?>(
      'request',
    );
  } on Object {
    return null;
  }
}

final declaredAgeRequiredPayloadProvider =
    FutureProvider<Map<Object?, Object?>?>((Ref ref) async {
      if (!ref.watch(declaredAgeReportingSupportedProvider)) {
        return null;
      }
      if (ref.watch(currentUserIdProvider) == null) {
        return null;
      }
      if (!(await ref.watch(declaredAgeRequirementProvider.future)).required) {
        return null;
      }
      if (!ref.mounted || !ref.read(declaredAgeReportingSupportedProvider)) {
        return null;
      }
      return _requestDeclaredAgeRange();
    });

enum DeclaredAgeUnlockOutcome {
  sent,
  underAdult,
  declined,
  notInstalledFromPlay,
  playStoreActionRequired,
  dateOfBirthRequired,
  refused,
  failed,
}

typedef DeclaredAgeUnlockResult = ({
  DeclaredAgeReport? report,
  DeclaredAgeUnlockOutcome outcome,
});

class DeclaredAgeUnlock extends Notifier<DeclaredAgeUnlockResult?> {
  @override
  DeclaredAgeUnlockResult? build() {
    ref
      ..watch(currentUserIdProvider)
      ..watch(fluxerBaseUrlProvider)
      ..watch(declaredAgeReportingSupportedProvider);
    return null;
  }

  bool _allowed() {
    return ref.read(declaredAgeReportingSupportedProvider) &&
        ref.read(matureGeoStatusProvider).value == MatureGeoStatus.restricted;
  }

  Future<bool> unlock() async {
    final String? userId = ref.read(currentUserIdProvider);
    if (userId == null || userId.isEmpty || !_allowed()) {
      return false;
    }
    final String apiBaseUrl = ref.read(fluxerBaseUrlProvider);
    bool stillCurrent() {
      return ref.mounted &&
          ref.read(currentUserIdProvider) == userId &&
          ref.read(fluxerBaseUrlProvider) == apiBaseUrl &&
          _allowed();
    }

    final Map<Object?, Object?>? payload = await _requestDeclaredAgeRange();
    if (!stillCurrent()) {
      return false;
    }
    final DeclaredAgeReport? report = declaredAgeReportFromPayload(payload);
    final DeclaredAgeUnlockOutcome outcome = switch (report) {
      DeclaredAgeReport.adult => await _send(payload, userId, stillCurrent),
      DeclaredAgeReport.minor ||
      DeclaredAgeReport.underMinimum => DeclaredAgeUnlockOutcome.underAdult,
      null => switch (payload?['status']) {
        'play_store_action_required' =>
          DeclaredAgeUnlockOutcome.playStoreActionRequired,
        'not_installed_from_play' =>
          DeclaredAgeUnlockOutcome.notInstalledFromPlay,
        _ => DeclaredAgeUnlockOutcome.declined,
      },
    };
    if (!stillCurrent()) {
      return false;
    }
    state = (report: report, outcome: outcome);
    if (outcome == DeclaredAgeUnlockOutcome.sent) {
      await ref.read(currentUserPrivateReadProvider(userId).notifier).refresh();
    }
    return outcome == DeclaredAgeUnlockOutcome.sent;
  }

  Future<DeclaredAgeUnlockOutcome> _send(
    Map<Object?, Object?>? payload,
    String userId,
    bool Function() stillCurrent,
  ) async {
    try {
      if (defaultTargetPlatform == TargetPlatform.iOS) {
        await sendAppAttestAdultAge(ref, stillCurrent: stillCurrent);
      } else {
        final PlayAgeRange? range = PlayAgeRange.fromPayload(payload);
        if (range == null) {
          return DeclaredAgeUnlockOutcome.failed;
        }
        await sendPlayIntegrityAdultAge(
          ref,
          range: range,
          stillCurrent: stillCurrent,
        );
      }
      talker.info('[DeclaredAge] adult age range sent');
      return DeclaredAgeUnlockOutcome.sent;
    } on PlayAppNotRecognized {
      return DeclaredAgeUnlockOutcome.notInstalledFromPlay;
    } on DioException catch (e) {
      final String? code = apiErrorCodeFromDioException(e);
      talker.warning('[DeclaredAge] the age range was not accepted: $code');
      return switch (code) {
        'DATE_OF_BIRTH_REQUIRED' =>
          DeclaredAgeUnlockOutcome.dateOfBirthRequired,
        'FEATURE_NOT_AVAILABLE_SELF_HOSTED' ||
        'AGE_RANGE_NOT_NEEDED' ||
        'AGE_RANGE_NOT_ADULT' => DeclaredAgeUnlockOutcome.refused,
        _ => DeclaredAgeUnlockOutcome.failed,
      };
    } on Object catch (e) {
      talker.warning('[DeclaredAge] sending the age range failed: $e');
      return DeclaredAgeUnlockOutcome.failed;
    }
  }
}

final declaredAgeUnlockProvider =
    NotifierProvider<DeclaredAgeUnlock, DeclaredAgeUnlockResult?>(
      DeclaredAgeUnlock.new,
    );

final declaredAgeReportProvider = Provider<DeclaredAgeReport?>((Ref ref) {
  if (!ref.watch(declaredAgeReportingSupportedProvider)) {
    return null;
  }
  return ref.watch(declaredAgeUnlockProvider)?.report ??
      declaredAgeReportFromPayload(
        ref.watch(declaredAgeRequiredPayloadProvider).unwrapPrevious().value,
      );
});

final declaredAgeFloorProvider = Provider<DeclaredAgeFloor>((Ref ref) {
  return declaredAgeFloorFromReport(ref.watch(declaredAgeReportProvider));
});
