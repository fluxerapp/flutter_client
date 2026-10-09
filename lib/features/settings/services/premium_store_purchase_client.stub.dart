import 'dart:io';

import 'package:fluxer_app/features/settings/services/plutonium_store_products.dart';
import 'package:fluxer_app/features/settings/services/premium_store_product_matching.dart';
import 'package:fluxer_app/features/settings/services/premium_store_purchase_update.dart';

export 'package:fluxer_app/features/settings/services/premium_store_product_matching.dart'
    show PremiumStoreProduct, PremiumStoreProductSet, matchPremiumStoreProducts;

abstract class PremiumStorePurchaseClient {
  bool get supportsPurchases;

  Future<bool> isStoreAvailable();

  Future<PremiumStoreProductSet> loadProducts(PremiumStoreCatalog catalog);

  Future<bool> buy(PremiumStoreProduct product);

  Stream<List<PremiumStorePurchaseUpdate>> get purchaseUpdates;

  Future<void> complete(PremiumStorePurchaseUpdate purchase);

  Future<void> restore();
}

class UnavailablePremiumStorePurchaseClient
    implements PremiumStorePurchaseClient {
  const UnavailablePremiumStorePurchaseClient();

  @override
  bool get supportsPurchases => false;

  @override
  Future<bool> isStoreAvailable() async => false;

  @override
  Future<PremiumStoreProductSet> loadProducts(
    PremiumStoreCatalog catalog,
  ) async {
    return const PremiumStoreProductSet();
  }

  @override
  Future<bool> buy(PremiumStoreProduct product) async => false;

  @override
  Stream<List<PremiumStorePurchaseUpdate>> get purchaseUpdates =>
      const Stream.empty();

  @override
  Future<void> complete(PremiumStorePurchaseUpdate purchase) async {}

  @override
  Future<void> restore() async {}
}

PremiumBillingStore? currentPremiumBillingStore() {
  if (Platform.isIOS) {
    return PremiumBillingStore.appStore;
  }
  if (Platform.isAndroid) {
    return PremiumBillingStore.googlePlay;
  }
  return null;
}

PremiumStorePurchaseClient createPremiumStorePurchaseClient() {
  return const UnavailablePremiumStorePurchaseClient();
}
