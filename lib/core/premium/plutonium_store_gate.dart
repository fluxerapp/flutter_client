import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/build/app_build_config.dart';
import 'package:fluxer_app/core/build/push_provider_kind.dart';
import 'package:fluxer_app/core/platform/fluxer_platform.dart';
import 'package:fluxer_app/core/providers/active_instance_provider.dart';

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
  required bool isIOS,
  required PushProviderKind pushProvider,
  required bool officialInstance,
}) {
  if (!officialInstance) {
    return false;
  }
  if (isAndroid) {
    return pushProvider == PushProviderKind.firebaseMessaging;
  }
  if (isIOS) {
    return pushProvider == PushProviderKind.apple;
  }
  return false;
}

bool resolvePremiumCommerceVisible({
  required bool selfHosted,
  required bool ossWebCheckout,
  required bool selfHostedCheckoutAvailable,
}) {
  if (!selfHosted) {
    return true;
  }
  return ossWebCheckout && selfHostedCheckoutAvailable;
}

bool resolvePremiumBillingNavVisible({
  required bool commerceVisible,
  required bool ossWebCheckout,
  required bool storePage,
  required bool officialInstance,
}) {
  if (!commerceVisible) {
    return false;
  }
  if (ossWebCheckout) {
    return true;
  }
  return storePage && officialInstance;
}

final premiumStorePurchasesEnabledProvider = Provider<bool>((Ref ref) {
  return resolvePremiumStorePurchasesEnabled(
    isAndroid: Platform.isAndroid,
    isIOS: Platform.isIOS,
    pushProvider: AppBuildConfig.pushProvider,
    officialInstance: ref.watch(isActiveInstanceOfficialProvider),
  );
});
