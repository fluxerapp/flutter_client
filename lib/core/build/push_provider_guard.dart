import 'package:fluxer_app/core/build/app_build_config.dart';
import 'package:fluxer_app/core/build/push_provider_kind.dart';

// Static helpers keep call sites concise around compile-time push provider
// selection.
// ignore: avoid_classes_with_only_static_members
abstract final class PushProviderGuard {
  static bool get isApple =>
      AppBuildConfig.pushProvider == PushProviderKind.apple;

  static bool get isUnifiedPush =>
      AppBuildConfig.pushProvider == PushProviderKind.unifiedPush;

  static bool get isFirebaseMessaging =>
      AppBuildConfig.pushProvider == PushProviderKind.firebaseMessaging;
}
