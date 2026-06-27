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
  static const String _signozOtlpTracesEndpointValue = String.fromEnvironment(
    'SIGNOZ_OTLP_TRACES_ENDPOINT',
    defaultValue: 'https://sgnz-otlp.fluxer.tools/v1/traces',
  );
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
  static bool get isStable => environment == AppBuildEnvironment.stable;

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

  static bool get isFirebaseMessagingEnabled =>
      pushProvider == PushProviderKind.firebaseMessaging;
  static bool get isBlueskyEnabled => _blueskyEnabled;
  static String get buildTimestamp => _buildTimestampValue;

  static int? get betaNumber {
    final String trimmed = _betaNumberValue.trim();
    if (trimmed.isEmpty) {
      return null;
    }
    return int.tryParse(trimmed);
  }

  static String get signozOtlpTracesEndpoint =>
      _signozOtlpTracesEndpointValue.trim();
  static bool get hasObservabilityConfig => signozOtlpTracesEndpoint.isNotEmpty;
}
