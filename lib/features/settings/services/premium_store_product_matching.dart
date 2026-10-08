import 'package:fluxer_app/features/settings/services/plutonium_store_products.dart';

class PremiumStoreProduct {
  const PremiumStoreProduct({
    required this.id,
    required this.priceLabel,
    required this.rawPrice,
    required this.appAccountToken,
    this.basePlanId,
  });

  final String id;
  final String priceLabel;
  final double rawPrice;
  final String appAccountToken;
  final String? basePlanId;
}

class PremiumStoreProductSet {
  const PremiumStoreProductSet({this.monthly, this.yearly});

  final PremiumStoreProduct? monthly;
  final PremiumStoreProduct? yearly;
}

abstract class PremiumStorePricedProduct {
  String get id;
  String get priceLabel;
  double get rawPrice;
}

PremiumStoreProductSet matchPremiumStoreProducts({
  required List<PremiumStorePricedProduct> products,
  required PremiumStoreCatalog catalog,
  required String? Function(PremiumStorePricedProduct product) basePlanIdOf,
}) {
  return PremiumStoreProductSet(
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

PremiumStoreProduct? _pick({
  required List<PremiumStorePricedProduct> products,
  required PremiumStoreCatalogEntry? entry,
  required String appAccountToken,
  required String? Function(PremiumStorePricedProduct product) basePlanIdOf,
}) {
  if (entry == null) {
    return null;
  }
  PremiumStorePricedProduct? best;
  String? bestBasePlanId;
  for (final PremiumStorePricedProduct product in products) {
    if (product.id != entry.productId) {
      continue;
    }
    final String? basePlanId = basePlanIdOf(product);
    final String? wanted = entry.basePlanId;
    if (wanted != null && wanted.isNotEmpty && basePlanId != wanted) {
      continue;
    }
    if (best == null || product.rawPrice > best.rawPrice) {
      best = product;
      bestBasePlanId = basePlanId;
    }
  }
  if (best == null) {
    return null;
  }
  return PremiumStoreProduct(
    id: best.id,
    priceLabel: best.priceLabel,
    rawPrice: best.rawPrice,
    appAccountToken: appAccountToken,
    basePlanId: bestBasePlanId ?? entry.basePlanId,
  );
}
