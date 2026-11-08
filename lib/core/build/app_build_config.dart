import 'package:flutter/foundation.dart';
import 'package:fluxer_app/core/build/app_build_environment.dart';
import 'package:fluxer_app/core/build/push_provider_kind.dart';

class AppBuildConfig {
  const AppBuildConfig._();
  // ignore: do_not_use_environment -- compile-time build flavor config
  static const String _environmentValue = String.fromEnvironment(
    'APP_ENVIRONMENT',
    defaultValue: 'stable',
  );
  // ignore: do_not_use_environment -- compile-time build flavor config
  static const String _pushProviderValue = String.fromEnvironment(
    'PUSH_PROVIDER',
    defaultValue: 'apns',
  );
  // ignore: do_not_use_environment -- compile-time build flavor config
  static const bool _blueskyEnabled = bool.fromEnvironment(
    'BLUESKY_ENABLED',
    defaultValue: true,
  );
  // ignore: do_not_use_environment -- compile-time build flavor config
  static const String _buildTimestampValue = String.fromEnvironment(
    'BUILD_TIMESTAMP',
  );
  // ignore: do_not_use_environment -- compile-time build flavor config
  static const String _betaNumberValue = String.fromEnvironment('BETA_NUMBER');
  // ignore: do_not_use_environment -- compile-time build flavor config
  static const String _canaryNumberValue = String.fromEnvironment(
    'CANARY_NUMBER',
  );
  // ignore: do_not_use_environment -- compile-time build flavor config
  static const String _observabilityReportingValue = String.fromEnvironment(
    'OBSERVABILITY_REPORTING',
    defaultValue: 'true',
  );
  // ignore: do_not_use_environment -- compile-time build flavor config
  static const String _distributionValue = String.fromEnvironment(
    'FLUXER_DISTRIBUTION',
  );
  static const String _playIntegrityCloudProjectNumberValue =
      // ignore: do_not_use_environment -- compile-time build flavor config
      String.fromEnvironment('PLAY_INTEGRITY_CLOUD_PROJECT_NUMBER');
  static String get playIntegrityCloudProjectNumber =>
      _playIntegrityCloudProjectNumberValue.trim();
  static AppBuildEnvironment get environment {
    switch (_environmentValue) {
      case 'canary':
        return AppBuildEnvironment.canary;
      case 'beta':
        return AppBuildEnvironment.beta;
      case 'stable':
      case 'production':
        return AppBuildEnvironment.stable;
      default:
        return AppBuildEnvironment.stable;
    }
  }

  static PushProviderKind get pushProvider {
    switch (_pushProviderValue) {
      case 'fcm':
      case 'firebase':
        return PushProviderKind.firebaseMessaging;
      case 'unifiedpush':
        return PushProviderKind.unifiedPush;
      case 'apns':
      case 'apple':
        return PushProviderKind.apple;
      default:
        return PushProviderKind.apple;
    }
  }

  static bool get isCanary => environment == AppBuildEnvironment.canary;
  static bool get isBeta => environment == AppBuildEnvironment.beta;

  /// Value for `RegisterMobileDeviceRequest.appId` / mobile-devices API.
  static String get mobilePushAppId {
    switch (environment) {
      case AppBuildEnvironment.canary:
        return 'canary';
      case AppBuildEnvironment.beta:
        return 'beta';
      case AppBuildEnvironment.stable:
        return 'stable';
    }
  }

  static String? get distribution => parseDistribution(_distributionValue);

  static final RegExp _distributionPattern = RegExp(r'^[a-z0-9_]{1,32}$');

  static String? parseDistribution(String raw) {
    if (raw.isEmpty) {
      return null;
    }
    if (!_distributionPattern.hasMatch(raw)) {
      throw StateError(
        'FLUXER_DISTRIBUTION "$raw" is not a valid distribution id',
      );
    }
    return raw;
  }

  static bool get isWebCheckout => resolveWebCheckout(
    pushProvider: pushProvider,
    distribution: distribution,
  );

  static bool resolveWebCheckout({
    required PushProviderKind pushProvider,
    required String? distribution,
  }) {
    return pushProvider == PushProviderKind.unifiedPush || distribution != null;
  }

  static bool get isBlueskyEnabled => _blueskyEnabled;
  static String get buildTimestamp => _buildTimestampValue;

  static int? get betaNumber {
    final String trimmed = _betaNumberValue.trim();
    if (trimmed.isEmpty) {
      return null;
    }
    return int.tryParse(trimmed);
  }

  static int? get canaryNumber {
    final String trimmed = _canaryNumberValue.trim();
    if (trimmed.isEmpty) {
      return null;
    }
    return int.tryParse(trimmed);
  }

  static bool parseObservabilityReportingEnabled(String raw) {
    final String normalized = raw.trim().toLowerCase();
    if (normalized.isEmpty) {
      return true;
    }
    return normalized != 'false' && normalized != '0';
  }

  static bool get _observabilityReportingEnabled =>
      parseObservabilityReportingEnabled(_observabilityReportingValue);

  static bool get hasObservabilityConfig {
    if (!_observabilityReportingEnabled) {
      return false;
    }
    if (kIsWeb) {
      return false;
    }
    return switch (defaultTargetPlatform) {
      TargetPlatform.iOS || TargetPlatform.android => true,
      TargetPlatform.fuchsia ||
      TargetPlatform.linux ||
      TargetPlatform.macOS ||
      TargetPlatform.windows => false,
    };
  }
}
