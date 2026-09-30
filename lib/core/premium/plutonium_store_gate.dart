import 'package:fluxer_app/core/build/app_build_config.dart';
import 'package:fluxer_app/core/build/push_provider_kind.dart';
import 'package:fluxer_app/core/platform/fluxer_platform.dart';

bool resolvePlutoniumStorePage({
  required bool ossWebCheckout,
  required bool desktopOs,
  required PushProviderKind pushProvider,
}) {
  if (ossWebCheckout || desktopOs) {
    return false;
  }
  return pushProvider == PushProviderKind.firebaseMessaging ||
      pushProvider == PushProviderKind.apple;
}

bool isPlutoniumStorePageActive() {
  return resolvePlutoniumStorePage(
    ossWebCheckout: AppBuildConfig.isOssWebCheckout,
    desktopOs: isFluxerDesktopOs,
    pushProvider: AppBuildConfig.pushProvider,
  );
}
