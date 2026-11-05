import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/build/app_build_config.dart';
import 'package:fluxer_app/core/build/app_build_environment.dart';
import 'package:fluxer_app/core/build/push_provider_kind.dart';
import 'package:fluxer_app/core/platform/fluxer_platform.dart';
import 'package:fluxer_app/core/premium/app_store_distribution.dart';
import 'package:fluxer_app/core/providers/instance/active_instance_provider.dart';

bool resolvePremiumStorePage({
  required bool webCheckout,
  required bool desktopOs,
  required PushProviderKind pushProvider,
}) {
  if (webCheckout || desktopOs) {
    return false;
  }
  return pushProvider == PushProviderKind.firebaseMessaging ||
      pushProvider == PushProviderKind.apple;
}

bool isPremiumStorePageActive() {
  return resolvePremiumStorePage(
    webCheckout: AppBuildConfig.isWebCheckout,
    desktopOs: isFluxerDesktopOs,
    pushProvider: AppBuildConfig.pushProvider,
  );
}

bool resolvePremiumStorePurchasesEnabled({
  required bool isAndroid,
  required bool isIOS,
  required PushProviderKind pushProvider,
  required bool webCheckout,
  required bool officialInstance,
  required AppStoreDistribution appStoreDistribution,
  required bool stableBuild,
  required bool developerPurchases,
}) {
  if (!officialInstance || webCheckout) {
    return false;
  }
  if (isAndroid) {
    return pushProvider == PushProviderKind.firebaseMessaging;
  }
  if (isIOS) {
    return pushProvider == PushProviderKind.apple &&
        resolveAppStorePurchaseDistribution(
          distribution: appStoreDistribution,
          stableBuild: stableBuild,
          developerPurchases: developerPurchases,
        );
  }
  return false;
}

bool resolveAppStorePurchaseDistribution({
  required AppStoreDistribution distribution,
  required bool stableBuild,
  required bool developerPurchases,
}) {
  return switch (distribution) {
    AppStoreDistribution.production ||
    AppStoreDistribution.testflight ||
    AppStoreDistribution.unknown => stableBuild || developerPurchases,
    AppStoreDistribution.development => developerPurchases,
  };
}

bool resolvePremiumCommerceVisible({
  required bool selfHosted,
  required bool webCheckout,
  required bool selfHostedCheckoutAvailable,
  required bool distributionBuild,
}) {
  if (!selfHosted) {
    return true;
  }
  return webCheckout && selfHostedCheckoutAvailable && !distributionBuild;
}

bool resolvePremiumBillingNavVisible({
  required bool commerceVisible,
  required bool webCheckout,
  required bool storePage,
  required bool officialInstance,
}) {
  if (!commerceVisible) {
    return false;
  }
  if (webCheckout) {
    return true;
  }
  return storePage && officialInstance;
}

final premiumStorePurchasesEnabledProvider = Provider<bool>((Ref ref) {
  final bool officialInstance = ref.watch(isActiveInstanceOfficialProvider);
  final bool appStore = Platform.isIOS && officialInstance;
  final bool iosStableBuild =
      AppBuildConfig.environment == AppBuildEnvironment.stable;
  final bool developerSandboxPurchases =
      ref.watch(sandboxStorePurchasesProvider).value ?? false;
  return resolvePremiumStorePurchasesEnabled(
    isAndroid: Platform.isAndroid,
    isIOS: Platform.isIOS,
    pushProvider: AppBuildConfig.pushProvider,
    webCheckout: AppBuildConfig.isWebCheckout,
    officialInstance: officialInstance,
    appStoreDistribution: appStore
        ? ref.watch(appStoreDistributionProvider).value ??
              AppStoreDistribution.unknown
        : AppStoreDistribution.unknown,
    stableBuild: iosStableBuild,
    developerPurchases:
        appStore && !iosStableBuild && developerSandboxPurchases,
  );
});
