import 'dart:io';

import 'package:fluxer_app/core/build/app_build_config.dart';
import 'package:fluxer_app/core/build/push_provider_kind.dart';
import 'package:fluxer_app/core/platform/fluxer_platform.dart';

bool resolvePremiumStorePage({
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

bool isPremiumStorePageActive() {
  return resolvePremiumStorePage(
    ossWebCheckout: AppBuildConfig.isOssWebCheckout,
    desktopOs: isFluxerDesktopOs,
    pushProvider: AppBuildConfig.pushProvider,
  );
}

bool resolvePremiumStorePurchasesEnabled({
  required bool isAndroid,
  required PushProviderKind pushProvider,
}) {
  return isAndroid && pushProvider == PushProviderKind.firebaseMessaging;
}

bool isPremiumStorePurchasesEnabled() {
  if (!Platform.isAndroid) {
    return false;
  }
  return resolvePremiumStorePurchasesEnabled(
    isAndroid: true,
    pushProvider: AppBuildConfig.pushProvider,
  );
}
