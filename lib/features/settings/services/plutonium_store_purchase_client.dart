import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:fluxer_app/features/settings/services/plutonium_store_products.dart';
import 'package:in_app_purchase/in_app_purchase.dart';
import 'package:in_app_purchase_android/billing_client_wrappers.dart';
import 'package:in_app_purchase_android/in_app_purchase_android.dart';

class PlutoniumStoreProduct {
  const PlutoniumStoreProduct({
    required this.id,
    required this.priceLabel,
    required this.rawPrice,
    required this.details,
    required this.appAccountToken,
    this.basePlanId,
  });

  final String id;
  final String priceLabel;
  final double rawPrice;
  final ProductDetails details;
  final String appAccountToken;
  final String? basePlanId;
}

class PlutoniumStoreProductSet {
  const PlutoniumStoreProductSet({this.monthly, this.yearly});

  final PlutoniumStoreProduct? monthly;
  final PlutoniumStoreProduct? yearly;
}

abstract class PlutoniumStorePurchaseClient {
  bool get supportsPurchases;

  Future<bool> isStoreAvailable();

  Future<PlutoniumStoreProductSet> loadProducts(PlutoniumStoreCatalog catalog);

  Future<bool> buy(PlutoniumStoreProduct product);

  Stream<List<PurchaseDetails>> get purchaseUpdates;

  Future<void> complete(PurchaseDetails purchase);

  Future<void> restore();
}

class UnavailablePlutoniumStorePurchaseClient
    implements PlutoniumStorePurchaseClient {
  const UnavailablePlutoniumStorePurchaseClient();

  @override
  bool get supportsPurchases => false;

  @override
  Future<bool> isStoreAvailable() async => false;

  @override
  Future<PlutoniumStoreProductSet> loadProducts(
    PlutoniumStoreCatalog catalog,
  ) async {
    return const PlutoniumStoreProductSet();
  }

  @override
  Future<bool> buy(PlutoniumStoreProduct product) async => false;

  @override
  Stream<List<PurchaseDetails>> get purchaseUpdates => const Stream.empty();

  @override
  Future<void> complete(PurchaseDetails purchase) async {}

  @override
  Future<void> restore() async {}
}

class AndroidPlutoniumStorePurchaseClient
    implements PlutoniumStorePurchaseClient {
  AndroidPlutoniumStorePurchaseClient(this._billing);

  final InAppPurchase _billing;

  @override
  bool get supportsPurchases => true;

  @override
  Future<bool> isStoreAvailable() => _billing.isAvailable();

  @override
  Future<PlutoniumStoreProductSet> loadProducts(
    PlutoniumStoreCatalog catalog,
  ) async {
    final ProductDetailsResponse response = await _billing.queryProductDetails(
      catalog.productIds,
    );
    return matchPlutoniumStoreProducts(
      products: response.productDetails,
      catalog: catalog,
      basePlanIdOf: _basePlanId,
    );
  }

  @override
  Future<bool> buy(PlutoniumStoreProduct product) {
    final ProductDetails details = product.details;
    final String? offerToken = details is GooglePlayProductDetails
        ? details.offerToken
        : null;
    if (offerToken == null || offerToken.isEmpty) {
      return Future<bool>.value(false);
    }
    return _billing.buyNonConsumable(
      purchaseParam: GooglePlayPurchaseParam(
        productDetails: details,
        offerToken: offerToken,
        applicationUserName: _accountToken(product),
      ),
    );
  }

  @override
  Stream<List<PurchaseDetails>> get purchaseUpdates => _billing.purchaseStream;

  @override
  Future<void> complete(PurchaseDetails purchase) {
    return _billing.completePurchase(purchase);
  }

  @override
  Future<void> restore() => _billing.restorePurchases();

  String? _basePlanId(ProductDetails details) {
    if (details is! GooglePlayProductDetails) {
      return null;
    }
    final int? index = details.subscriptionIndex;
    final List<SubscriptionOfferDetailsWrapper>? offers =
        details.productDetails.subscriptionOfferDetails;
    if (index == null ||
        offers == null ||
        index < 0 ||
        index >= offers.length) {
      return null;
    }
    return offers[index].basePlanId;
  }
}

class IosPlutoniumStorePurchaseClient implements PlutoniumStorePurchaseClient {
  IosPlutoniumStorePurchaseClient(this._billing);

  final InAppPurchase _billing;

  @override
  bool get supportsPurchases => true;

  @override
  Future<bool> isStoreAvailable() => _billing.isAvailable();

  @override
  Future<PlutoniumStoreProductSet> loadProducts(
    PlutoniumStoreCatalog catalog,
  ) async {
    final ProductDetailsResponse response = await _billing.queryProductDetails(
      catalog.productIds,
    );
    return matchPlutoniumStoreProducts(
      products: response.productDetails,
      catalog: catalog,
      basePlanIdOf: (_) => null,
    );
  }

  @override
  Future<bool> buy(PlutoniumStoreProduct product) {
    return _billing.buyNonConsumable(
      purchaseParam: PurchaseParam(
        productDetails: product.details,
        applicationUserName: _accountToken(product),
      ),
    );
  }

  @override
  Stream<List<PurchaseDetails>> get purchaseUpdates => _billing.purchaseStream;

  @override
  Future<void> complete(PurchaseDetails purchase) {
    return _billing.completePurchase(purchase);
  }

  @override
  Future<void> restore() => _billing.restorePurchases();
}

PlutoniumBillingStore? currentPlutoniumBillingStore() {
  if (kIsWeb) {
    return null;
  }
  if (Platform.isIOS) {
    return PlutoniumBillingStore.appStore;
  }
  if (Platform.isAndroid) {
    return PlutoniumBillingStore.googlePlay;
  }
  return null;
}

PlutoniumStorePurchaseClient createPlutoniumStorePurchaseClient() {
  if (kIsWeb) {
    return const UnavailablePlutoniumStorePurchaseClient();
  }
  if (Platform.isAndroid) {
    return AndroidPlutoniumStorePurchaseClient(InAppPurchase.instance);
  }
  if (Platform.isIOS) {
    return IosPlutoniumStorePurchaseClient(InAppPurchase.instance);
  }
  return const UnavailablePlutoniumStorePurchaseClient();
}

String? _accountToken(PlutoniumStoreProduct product) {
  if (product.appAccountToken.isEmpty) {
    return null;
  }
  return product.appAccountToken;
}

PlutoniumStoreProductSet matchPlutoniumStoreProducts({
  required List<ProductDetails> products,
  required PlutoniumStoreCatalog catalog,
  required String? Function(ProductDetails details) basePlanIdOf,
}) {
  return PlutoniumStoreProductSet(
    monthly: _pick(
      products: products,
      entry: catalog.monthly,
      appAccountToken: catalog.appAccountToken,
      basePlanIdOf: basePlanIdOf,
    ),
    yearly: _pick(
      products: products,
      entry: catalog.yearly,
      appAccountToken: catalog.appAccountToken,
      basePlanIdOf: basePlanIdOf,
    ),
  );
}

PlutoniumStoreProduct? _pick({
  required List<ProductDetails> products,
  required PlutoniumStoreCatalogEntry? entry,
  required String appAccountToken,
  required String? Function(ProductDetails details) basePlanIdOf,
}) {
  if (entry == null) {
    return null;
  }
  ProductDetails? best;
  String? bestBasePlanId;
  for (final ProductDetails details in products) {
    if (details.id != entry.productId) {
      continue;
    }
    final String? basePlanId = basePlanIdOf(details);
    final String? wanted = entry.basePlanId;
    if (wanted != null && wanted.isNotEmpty && basePlanId != wanted) {
      continue;
    }
    if (best == null || details.rawPrice > best.rawPrice) {
      best = details;
      bestBasePlanId = basePlanId;
    }
  }
  if (best == null) {
    return null;
  }
  return PlutoniumStoreProduct(
    id: best.id,
    priceLabel: best.price,
    rawPrice: best.rawPrice,
    details: best,
    appAccountToken: appAccountToken,
    basePlanId: bestBasePlanId ?? entry.basePlanId,
  );
}
