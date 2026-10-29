import 'package:fluxer_app/features/settings/services/plutonium_store_products.dart';
import 'package:fluxer_dart/export.dart';

enum PremiumManageSurface { store, billing }

enum PremiumManageKind { customerPortal, storeUrl }

class PremiumManageAction {
  const PremiumManageAction.portal()
    : kind = PremiumManageKind.customerPortal,
      url = null;

  const PremiumManageAction.store(this.url) : kind = PremiumManageKind.storeUrl;

  final PremiumManageKind kind;
  final String? url;
}

PremiumManageAction? premiumManageAction({
  required PremiumManageSurface surface,
  required PremiumSubscriptionProvider? provider,
  required String? manageUrl,
  PremiumBillingStore? currentStore,
}) {
  final String? url = _url(manageUrl);
  switch (surface) {
    case PremiumManageSurface.store:
      if (!_storeMatches(currentStore, provider) || url == null) {
        return null;
      }
      return PremiumManageAction.store(url);
    case PremiumManageSurface.billing:
      switch (provider) {
        case PremiumSubscriptionProvider.appStore:
        case PremiumSubscriptionProvider.googlePlay:
          if (url == null) {
            return null;
          }
          return PremiumManageAction.store(url);
        case PremiumSubscriptionProvider.stripe:
        case null:
          return const PremiumManageAction.portal();
        case PremiumSubscriptionProvider.$unknown:
          return null;
      }
  }
}

bool premiumStorePurchaseBlockedByOtherPlatform({
  required StorePurchaseBlockedReason? reason,
  required StoreBlockingProvider? blockingProvider,
  required PremiumBillingStore? currentStore,
}) {
  if (reason != StorePurchaseBlockedReason.existingSubscription) {
    return false;
  }
  return switch (blockingProvider) {
    StoreBlockingProvider.appStore =>
      currentStore != PremiumBillingStore.appStore,
    StoreBlockingProvider.googlePlay =>
      currentStore != PremiumBillingStore.googlePlay,
    StoreBlockingProvider.stripe ||
    StoreBlockingProvider.$unknown ||
    null => true,
  };
}

bool _storeMatches(
  PremiumBillingStore? currentStore,
  PremiumSubscriptionProvider? provider,
) {
  return switch (currentStore) {
    PremiumBillingStore.appStore =>
      provider == PremiumSubscriptionProvider.appStore,
    PremiumBillingStore.googlePlay =>
      provider == PremiumSubscriptionProvider.googlePlay,
    null => false,
  };
}

String? _url(String? value) {
  if (value == null || value.isEmpty) {
    return null;
  }
  return value;
}
