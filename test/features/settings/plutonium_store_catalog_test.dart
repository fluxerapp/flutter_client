import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/settings/services/plutonium_store_products.dart';
import 'package:fluxer_app/features/settings/services/plutonium_store_purchase_client.dart';
import 'package:fluxer_dart/export.dart';
import 'package:in_app_purchase/in_app_purchase.dart';

void main() {
  group('plutoniumStoreCatalog', () {
    test('maps app store subscription product ids and skips gifts', () {
      final PlutoniumStoreCatalog? catalog = plutoniumStoreCatalog(
        context: _context(),
        store: PlutoniumBillingStore.appStore,
      );

      expect(catalog?.appAccountToken, 'token');
      expect(catalog?.monthly?.productId, 'com.fluxer.plutonium.monthly');
      expect(catalog?.monthly?.basePlanId, isNull);
      expect(catalog?.yearly?.productId, 'com.fluxer.plutonium.yearly');
      expect(catalog?.productIds, <String>{
        'com.fluxer.plutonium.monthly',
        'com.fluxer.plutonium.yearly',
      });
    });

    test('maps play product ids with base plans', () {
      final PlutoniumStoreCatalog? catalog = plutoniumStoreCatalog(
        context: _context(),
        store: PlutoniumBillingStore.googlePlay,
      );

      expect(catalog?.monthly?.productId, 'plutonium');
      expect(catalog?.monthly?.basePlanId, 'monthly');
      expect(catalog?.yearly?.productId, 'plutonium');
      expect(catalog?.yearly?.basePlanId, 'yearly');
      expect(catalog?.productIds, <String>{'plutonium'});
    });

    test('skips a play subscription that has no base plan', () {
      final PlutoniumStoreCatalog? catalog = plutoniumStoreCatalog(
        context: _context(playBasePlanId: null),
        store: PlutoniumBillingStore.googlePlay,
      );

      expect(catalog?.monthly, isNull);
      expect(catalog?.yearly?.basePlanId, 'yearly');
    });

    test('returns null when the current store is disabled', () {
      expect(
        plutoniumStoreCatalog(
          context: _context(appStoreEnabled: false),
          store: PlutoniumBillingStore.appStore,
        ),
        isNull,
      );
    });
  });

  test('store prices follow the matching base plan', () {
    final PlutoniumStoreCatalog catalog = plutoniumStoreCatalog(
      context: _context(),
      store: PlutoniumBillingStore.googlePlay,
    )!;
    final PlutoniumStoreProductSet products = matchPlutoniumStoreProducts(
      products: <ProductDetails>[
        _details(rawPrice: 4.99, price: r'$4.99'),
        _details(rawPrice: 49.99, price: r'$49.99'),
      ],
      catalog: catalog,
      basePlanIdOf: (ProductDetails details) {
        return details.rawPrice < 10 ? 'monthly' : 'yearly';
      },
    );

    expect(products.monthly?.rawPrice, 4.99);
    expect(products.yearly?.rawPrice, 49.99);
    expect(products.monthly?.appAccountToken, 'token');
    expect(products.yearly?.basePlanId, 'yearly');
  });
}

ProductDetails _details({required double rawPrice, required String price}) {
  return ProductDetails(
    id: 'plutonium',
    title: 'Plutonium',
    description: '',
    price: price,
    rawPrice: rawPrice,
    currencyCode: 'USD',
  );
}

StoreBillingContextResponse _context({
  bool appStoreEnabled = true,
  String? playBasePlanId = 'monthly',
}) {
  return StoreBillingContextResponse(
    appAccountToken: 'token',
    appStore: StoreBillingContextResponseAppStore(
      enabled: appStoreEnabled,
      bundleIds: const <String>['com.fluxer'],
      products: const <StoreBillingAppStoreProductResponse>[
        StoreBillingAppStoreProductResponse(
          productId: 'com.fluxer.plutonium.monthly',
          slot: StoreSlot.monthly,
        ),
        StoreBillingAppStoreProductResponse(
          productId: 'com.fluxer.plutonium.yearly',
          slot: StoreSlot.yearly,
        ),
        StoreBillingAppStoreProductResponse(
          productId: 'com.fluxer.gift.1month',
          slot: StoreSlot.gift1Month,
        ),
      ],
    ),
    googlePlay: StoreBillingContextResponseGooglePlay(
      enabled: true,
      packageNames: const <String>['com.fluxer'],
      products: <StoreBillingGooglePlayProductResponse>[
        StoreBillingGooglePlayProductResponse(
          productId: 'plutonium',
          basePlanId: playBasePlanId,
          slot: StoreSlot.monthly,
        ),
        const StoreBillingGooglePlayProductResponse(
          productId: 'plutonium',
          basePlanId: 'yearly',
          slot: StoreSlot.yearly,
        ),
        const StoreBillingGooglePlayProductResponse(
          productId: 'gift_1_month',
          basePlanId: null,
          slot: StoreSlot.gift1Month,
        ),
      ],
    ),
    purchaseBlockedReason: null,
    blockingProvider: null,
  );
}
