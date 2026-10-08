import 'package:fluxer_app/core/premium/plutonium_store_gate.dart';
import 'package:fluxer_dart/export.dart';

bool get premiumStorePurchasesEnabled => isPremiumStorePurchasesEnabled();

enum PremiumBillingStore { appStore, googlePlay }

class PremiumStoreCatalogEntry {
  const PremiumStoreCatalogEntry({required this.productId, this.basePlanId});

  final String productId;
  final String? basePlanId;
}

class PremiumStoreCatalog {
  const PremiumStoreCatalog({
    required this.appAccountToken,
    this.monthly,
    this.yearly,
  });

  final String appAccountToken;
  final PremiumStoreCatalogEntry? monthly;
  final PremiumStoreCatalogEntry? yearly;

  bool get hasSubscriptionProducts => monthly != null || yearly != null;

  Set<String> get productIds => <String>{
    if (monthly != null) monthly!.productId,
    if (yearly != null) yearly!.productId,
  };
}

PremiumStoreCatalog? premiumStoreCatalog({
  required StoreBillingContextResponse context,
  required PremiumBillingStore? store,
}) {
  return switch (store) {
    PremiumBillingStore.appStore =>
      context.appStore.enabled
          ? PremiumStoreCatalog(
              appAccountToken: context.appAccountToken,
              monthly: _appStoreEntry(
                context.appStore.products,
                StoreSlot.monthly,
              ),
              yearly: _appStoreEntry(
                context.appStore.products,
                StoreSlot.yearly,
              ),
            )
          : null,
    PremiumBillingStore.googlePlay =>
      context.googlePlay.enabled
          ? PremiumStoreCatalog(
              appAccountToken: context.appAccountToken,
              monthly: _playEntry(
                context.googlePlay.products,
                StoreSlot.monthly,
              ),
              yearly: _playEntry(context.googlePlay.products, StoreSlot.yearly),
            )
          : null,
    null => null,
  };
}

PremiumStoreCatalogEntry? _appStoreEntry(
  List<StoreBillingAppStoreProductResponse> products,
  StoreSlot slot,
) {
  for (final StoreBillingAppStoreProductResponse product in products) {
    if (product.slot != slot || product.productId.isEmpty) {
      continue;
    }
    return PremiumStoreCatalogEntry(productId: product.productId);
  }
  return null;
}

PremiumStoreCatalogEntry? _playEntry(
  List<StoreBillingGooglePlayProductResponse> products,
  StoreSlot slot,
) {
  for (final StoreBillingGooglePlayProductResponse product in products) {
    final String? basePlanId = product.basePlanId;
    if (product.slot != slot ||
        product.productId.isEmpty ||
        basePlanId == null ||
        basePlanId.isEmpty) {
      continue;
    }
    return PremiumStoreCatalogEntry(
      productId: product.productId,
      basePlanId: basePlanId,
    );
  }
  return null;
}

int? plutoniumYearlySavingsPercent({
  required double monthlyRawPrice,
  required double yearlyRawPrice,
}) {
  if (monthlyRawPrice <= 0 || yearlyRawPrice <= 0) {
    return null;
  }
  final double fullYear = monthlyRawPrice * 12;
  if (yearlyRawPrice >= fullYear) {
    return null;
  }
  final int percent = ((fullYear - yearlyRawPrice) / fullYear * 100).round();
  if (percent <= 0) {
    return null;
  }
  return percent;
}
