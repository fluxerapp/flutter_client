import 'package:fluxer_dart/export.dart';

// TEMP: Remove once the stores are fully set up.
bool get plutoniumStorePurchasesEnabled => false;

enum PlutoniumBillingStore { appStore, googlePlay }

class PlutoniumStoreCatalogEntry {
  const PlutoniumStoreCatalogEntry({required this.productId, this.basePlanId});

  final String productId;
  final String? basePlanId;
}

class PlutoniumStoreCatalog {
  const PlutoniumStoreCatalog({
    required this.appAccountToken,
    this.monthly,
    this.yearly,
  });

  final String appAccountToken;
  final PlutoniumStoreCatalogEntry? monthly;
  final PlutoniumStoreCatalogEntry? yearly;

  bool get hasSubscriptionProducts => monthly != null || yearly != null;

  Set<String> get productIds => <String>{
    if (monthly != null) monthly!.productId,
    if (yearly != null) yearly!.productId,
  };
}

PlutoniumStoreCatalog? plutoniumStoreCatalog({
  required StoreBillingContextResponse context,
  required PlutoniumBillingStore? store,
}) {
  return switch (store) {
    PlutoniumBillingStore.appStore =>
      context.appStore.enabled
          ? PlutoniumStoreCatalog(
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
    PlutoniumBillingStore.googlePlay =>
      context.googlePlay.enabled
          ? PlutoniumStoreCatalog(
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

PlutoniumStoreCatalogEntry? _appStoreEntry(
  List<StoreBillingAppStoreProductResponse> products,
  StoreSlot slot,
) {
  for (final StoreBillingAppStoreProductResponse product in products) {
    if (product.slot != slot || product.productId.isEmpty) {
      continue;
    }
    return PlutoniumStoreCatalogEntry(productId: product.productId);
  }
  return null;
}

PlutoniumStoreCatalogEntry? _playEntry(
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
    return PlutoniumStoreCatalogEntry(
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
