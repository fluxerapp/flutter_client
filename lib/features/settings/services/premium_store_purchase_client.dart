import 'dart:io';

import 'package:fluxer_app/features/settings/services/plutonium_store_products.dart';
import 'package:fluxer_app/features/settings/services/premium_store_product_matching.dart';
import 'package:fluxer_app/features/settings/services/premium_store_purchase_client.stub.dart';
import 'package:fluxer_app/features/settings/services/premium_store_purchase_update.dart';
import 'package:in_app_purchase/in_app_purchase.dart';
import 'package:in_app_purchase_android/billing_client_wrappers.dart';
import 'package:in_app_purchase_android/in_app_purchase_android.dart';

export 'package:fluxer_app/features/settings/services/premium_store_purchase_client.stub.dart'
    show
        PremiumStoreProduct,
        PremiumStoreProductSet,
        PremiumStorePurchaseClient,
        UnavailablePremiumStorePurchaseClient,
        currentPremiumBillingStore,
        matchPremiumStoreProducts;

class _ProductDetailsAdapter implements PremiumStorePricedProduct {
  _ProductDetailsAdapter(this._details);

  final ProductDetails _details;

  @override
  String get id => _details.id;

  @override
  String get priceLabel => _details.price;

  @override
  double get rawPrice => _details.rawPrice;

  ProductDetails get details => _details;
}

class AndroidPremiumStorePurchaseClient implements PremiumStorePurchaseClient {
  AndroidPremiumStorePurchaseClient(this._billing);

  final InAppPurchase _billing;
  final Map<String, ProductDetails> _detailsByKey = <String, ProductDetails>{};

  @override
  bool get supportsPurchases => true;

  @override
  Future<bool> isStoreAvailable() => _billing.isAvailable();

  @override
  Future<PremiumStoreProductSet> loadProducts(
    PremiumStoreCatalog catalog,
  ) async {
    final ProductDetailsResponse response = await _billing.queryProductDetails(
      catalog.productIds,
    );
    _detailsByKey.clear();
    final List<_ProductDetailsAdapter> adapters = response.productDetails
        .map(_ProductDetailsAdapter.new)
        .toList();
    for (final _ProductDetailsAdapter adapter in adapters) {
      final String? basePlanId = _basePlanId(adapter.details);
      _detailsByKey[_productKey(adapter.id, basePlanId)] = adapter.details;
    }
    return matchPremiumStoreProducts(
      products: adapters,
      catalog: catalog,
      basePlanIdOf: (PremiumStorePricedProduct product) {
        return _basePlanId((product as _ProductDetailsAdapter).details);
      },
    );
  }

  @override
  Future<bool> buy(PremiumStoreProduct product) {
    final ProductDetails? details =
        _detailsByKey[_productKey(product.id, product.basePlanId)];
    if (details == null) {
      return Future<bool>.value(false);
    }
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
  Stream<List<PremiumStorePurchaseUpdate>> get purchaseUpdates {
    return _billing.purchaseStream.map(_mapPurchaseBatch);
  }

  @override
  Future<void> complete(PremiumStorePurchaseUpdate purchase) {
    return _billing.completePurchase(_requirePurchaseDetails(purchase));
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

class IosPremiumStorePurchaseClient implements PremiumStorePurchaseClient {
  IosPremiumStorePurchaseClient(this._billing);

  final InAppPurchase _billing;
  final Map<String, ProductDetails> _detailsById = <String, ProductDetails>{};

  @override
  bool get supportsPurchases => true;

  @override
  Future<bool> isStoreAvailable() => _billing.isAvailable();

  @override
  Future<PremiumStoreProductSet> loadProducts(
    PremiumStoreCatalog catalog,
  ) async {
    final ProductDetailsResponse response = await _billing.queryProductDetails(
      catalog.productIds,
    );
    _detailsById.clear();
    final List<_ProductDetailsAdapter> adapters = response.productDetails
        .map(_ProductDetailsAdapter.new)
        .toList();
    for (final _ProductDetailsAdapter adapter in adapters) {
      _detailsById[adapter.id] = adapter.details;
    }
    return matchPremiumStoreProducts(
      products: adapters,
      catalog: catalog,
      basePlanIdOf: (_) => null,
    );
  }

  @override
  Future<bool> buy(PremiumStoreProduct product) {
    final ProductDetails? details = _detailsById[product.id];
    if (details == null) {
      return Future<bool>.value(false);
    }
    return _billing.buyNonConsumable(
      purchaseParam: PurchaseParam(
        productDetails: details,
        applicationUserName: _accountToken(product),
      ),
    );
  }

  @override
  Stream<List<PremiumStorePurchaseUpdate>> get purchaseUpdates {
    return _billing.purchaseStream.map(_mapPurchaseBatch);
  }

  @override
  Future<void> complete(PremiumStorePurchaseUpdate purchase) {
    return _billing.completePurchase(_requirePurchaseDetails(purchase));
  }

  @override
  Future<void> restore() => _billing.restorePurchases();
}

PremiumStorePurchaseClient createPremiumStorePurchaseClient() {
  if (Platform.isAndroid) {
    return AndroidPremiumStorePurchaseClient(InAppPurchase.instance);
  }
  if (Platform.isIOS) {
    return IosPremiumStorePurchaseClient(InAppPurchase.instance);
  }
  return const UnavailablePremiumStorePurchaseClient();
}

String? _accountToken(PremiumStoreProduct product) {
  if (product.appAccountToken.isEmpty) {
    return null;
  }
  return product.appAccountToken;
}

String _productKey(String id, String? basePlanId) {
  return '$id:${basePlanId ?? ''}';
}

final Map<String, PurchaseDetails> _pendingPurchaseDetails =
    <String, PurchaseDetails>{};

List<PremiumStorePurchaseUpdate> _mapPurchaseBatch(
  List<PurchaseDetails> purchases,
) {
  return purchases.map(_mapPurchase).toList();
}

PremiumStorePurchaseUpdate _mapPurchase(PurchaseDetails purchase) {
  final String key = purchase.purchaseID ?? purchase.productID;
  _pendingPurchaseDetails[key] = purchase;
  return PremiumStorePurchaseUpdate(
    productId: purchase.productID,
    purchaseId: purchase.purchaseID,
    pendingCompletePurchase: purchase.pendingCompletePurchase,
    status: switch (purchase.status) {
      PurchaseStatus.pending => PremiumStorePurchaseStatus.pending,
      PurchaseStatus.purchased => PremiumStorePurchaseStatus.purchased,
      PurchaseStatus.restored => PremiumStorePurchaseStatus.restored,
      PurchaseStatus.error => PremiumStorePurchaseStatus.error,
      PurchaseStatus.canceled => PremiumStorePurchaseStatus.canceled,
    },
  );
}

PurchaseDetails _requirePurchaseDetails(PremiumStorePurchaseUpdate update) {
  final String? purchaseId = update.purchaseId;
  if (purchaseId != null) {
    final PurchaseDetails? byId = _pendingPurchaseDetails[purchaseId];
    if (byId != null) {
      return byId;
    }
  }
  for (final PurchaseDetails details in _pendingPurchaseDetails.values) {
    if (details.productID == update.productId) {
      return details;
    }
  }
  throw StateError('Missing purchase details for ${update.productId}');
}
