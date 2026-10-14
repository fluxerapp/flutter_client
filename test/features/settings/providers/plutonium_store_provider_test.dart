import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/api/fluxer_client_provider.dart';
import 'package:fluxer_app/core/premium/plutonium_store_gate.dart';
import 'package:fluxer_app/features/settings/providers/plutonium_store_provider.dart';
import 'package:fluxer_app/features/settings/providers/store_billing_context_provider.dart';
import 'package:fluxer_app/features/settings/services/plutonium_store_products.dart';
import 'package:fluxer_app/features/settings/services/premium_store_purchase_client.dart';
import 'package:fluxer_app/features/settings/services/premium_store_purchase_update.dart';
import 'package:fluxer_dart/export.dart';

class _FakeStoreClient implements PremiumStorePurchaseClient {
  _FakeStoreClient(this.billingStore);

  @override
  final PremiumBillingStore billingStore;

  final StreamController<List<PremiumStorePurchaseUpdate>> updates =
      StreamController<List<PremiumStorePurchaseUpdate>>.broadcast();
  final List<String> calls = <String>[];

  Future<void> close() => updates.close();

  @override
  bool get supportsPurchases => true;

  @override
  Future<bool> isStoreAvailable() async => true;

  @override
  Future<PremiumStoreProductSet> loadProducts(
    PremiumStoreCatalog catalog,
  ) async {
    calls.add('load');
    return PremiumStoreProductSet(
      monthly: PremiumStoreProduct(
        id: catalog.monthly!.productId,
        priceLabel: r'$4.99',
        rawPrice: 4.99,
        appAccountToken: catalog.appAccountToken,
        basePlanId: catalog.monthly!.basePlanId,
      ),
    );
  }

  @override
  Future<bool> buy(PremiumStoreProduct product) async {
    calls.add('buy:${product.id}');
    return true;
  }

  @override
  Stream<List<PremiumStorePurchaseUpdate>> get purchaseUpdates =>
      updates.stream;

  @override
  Future<void> complete(PremiumStorePurchaseUpdate purchase) async {
    calls.add('complete:${purchase.purchaseId}');
  }

  @override
  Future<void> restore() async {
    calls.add('restore');
  }
}

class _FakePremiumApi extends Fake implements PremiumApi {
  _FakePremiumApi(this.calls, {this.claimStatus});

  final List<String> calls;
  final int? claimStatus;

  @override
  Future<StorePurchaseClaimResponse> claimAppStoreTransaction({
    required ClaimAppStoreTransactionRequest body,
  }) async {
    calls.add('claim:${body.signedTransaction}');
    final int? status = claimStatus;
    if (status != null) {
      final RequestOptions options = RequestOptions(
        path: '/premium/store/app-store/transactions',
      );
      throw DioException(
        requestOptions: options,
        response: Response<void>(requestOptions: options, statusCode: status),
      );
    }
    return StorePurchaseClaimResponse.fromJson(<String, Object?>{
      'purchase': <String, Object?>{
        'id': '1',
        'provider': 'app_store',
        'kind': 'subscription',
        'slot': 'monthly',
        'product_id': 'plutonium_monthly',
        'environment': 'production',
        'state': 'active',
        'entitled': true,
        'expires_at': null,
        'entitled_until': null,
        'will_renew': true,
        'gift_code': null,
        'created_at': '2026-10-14T00:00:00Z',
      },
      'gift_code': null,
    });
  }
}

class _FakeFluxerClient extends FluxerClient {
  _FakeFluxerClient(this._premium) : super(Dio());

  final PremiumApi _premium;

  @override
  PremiumApi get premium => _premium;
}

class _FixedBillingContext extends StoreBillingContextNotifier {
  @override
  Future<StoreBillingContextResponse?> build() async => _context();
}

StoreBillingContextResponse _context() {
  return const StoreBillingContextResponse(
    appAccountToken: 'token',
    appStore: StoreBillingContextResponseAppStore(
      enabled: true,
      bundleIds: <String>['com.fluxer'],
      products: <StoreBillingAppStoreProductResponse>[
        StoreBillingAppStoreProductResponse(
          productId: 'plutonium_monthly',
          slot: StoreSlot.monthly,
        ),
      ],
    ),
    googlePlay: StoreBillingContextResponseGooglePlay(
      enabled: true,
      packageNames: <String>['com.fluxer'],
      products: <StoreBillingGooglePlayProductResponse>[
        StoreBillingGooglePlayProductResponse(
          productId: 'plutonium',
          basePlanId: 'plutonium-monthly',
          slot: StoreSlot.monthly,
        ),
      ],
    ),
    purchaseBlockedReason: null,
    blockingProvider: null,
  );
}

ProviderContainer _container({
  required _FakeStoreClient client,
  required List<String> calls,
  bool? officialInstance,
  bool? purchasesEnabled,
  int? claimStatus,
}) {
  final ProviderContainer container = ProviderContainer(
    overrides: [
      premiumStorePurchaseClientProvider.overrideWithValue(client),
      storeBillingContextProvider.overrideWith(_FixedBillingContext.new),
      fluxerClientProvider.overrideWithValue(
        _FakeFluxerClient(_FakePremiumApi(calls, claimStatus: claimStatus)),
      ),
      if (officialInstance != null)
        isActiveInstanceOfficialProvider.overrideWithValue(officialInstance),
      if (purchasesEnabled != null)
        premiumStorePurchasesEnabledProvider.overrideWithValue(
          purchasesEnabled,
        ),
    ],
  )..listen(premiumStoreProvider, (_, _) {});
  addTearDown(container.dispose);
  addTearDown(client.close);
  return container;
}

Future<void> _settle() async {
  for (int i = 0; i < 10; i++) {
    await Future<void>.delayed(Duration.zero);
  }
}

PremiumStorePurchaseUpdate _purchased(String id, {String jws = 'jws'}) {
  return PremiumStorePurchaseUpdate(
    productId: 'plutonium_monthly',
    status: PremiumStorePurchaseStatus.purchased,
    purchaseId: id,
    pendingCompletePurchase: true,
    serverVerificationData: jws,
  );
}

void main() {
  group('self-hosted instance', () {
    for (final PremiumBillingStore store in PremiumBillingStore.values) {
      test('turns off in-app purchases for ${store.name}', () async {
        final List<String> calls = <String>[];
        final _FakeStoreClient client = _FakeStoreClient(store);
        final ProviderContainer container = _container(
          client: client,
          calls: calls,
          officialInstance: false,
        );

        expect(container.read(premiumStorePurchasesEnabledProvider), isFalse);
        final PremiumStoreState state = container.read(premiumStoreProvider);
        expect(state.storeUnavailable, isTrue);
        expect(state.monthly, isNull);

        await container
            .read(premiumStoreProvider.notifier)
            .buy(PremiumStorePlan.monthly);
        await container.read(premiumStoreProvider.notifier).restore();
        await _settle();

        expect(client.calls, isEmpty);
        expect(calls, isEmpty);
        expect(client.updates.hasListener, isFalse);
      });
    }
  });

  group('official instance', () {
    test('Play purchase completes without an App Store claim', () async {
      final List<String> calls = <String>[];
      final _FakeStoreClient client = _FakeStoreClient(
        PremiumBillingStore.googlePlay,
      );
      final ProviderContainer container = _container(
        client: client,
        calls: calls,
        purchasesEnabled: true,
      );
      await _settle();

      final PremiumStoreState loaded = container.read(premiumStoreProvider);
      expect(loaded.monthly?.id, 'plutonium');
      await container
          .read(premiumStoreProvider.notifier)
          .buy(PremiumStorePlan.monthly);
      client.updates.add(<PremiumStorePurchaseUpdate>[
        const PremiumStorePurchaseUpdate(
          productId: 'plutonium',
          status: PremiumStorePurchaseStatus.purchased,
          purchaseId: 'gpa.1',
          pendingCompletePurchase: true,
          serverVerificationData: 'play-token',
        ),
      ]);
      await _settle();

      expect(client.calls, <String>[
        'restore',
        'load',
        'buy:plutonium',
        'complete:gpa.1',
      ]);
      expect(calls, isEmpty);
    });

    test('App Store purchase is claimed before it is finished', () async {
      final List<String> calls = <String>[];
      final _FakeStoreClient client = _FakeStoreClient(
        PremiumBillingStore.appStore,
      );
      final ProviderContainer container = _container(
        client: client,
        calls: calls,
        purchasesEnabled: true,
      );
      await _settle();

      await container
          .read(premiumStoreProvider.notifier)
          .buy(PremiumStorePlan.monthly);
      client.updates.add(<PremiumStorePurchaseUpdate>[_purchased('1000')]);
      await _settle();

      expect(calls, <String>['claim:jws']);
      expect(client.calls, <String>[
        'restore',
        'load',
        'buy:plutonium_monthly',
        'complete:1000',
      ]);
    });

    test('App Store purchase stays unfinished when the claim fails '
        'transiently', () async {
      final List<String> calls = <String>[];
      final _FakeStoreClient client = _FakeStoreClient(
        PremiumBillingStore.appStore,
      );
      final ProviderContainer container = _container(
        client: client,
        calls: calls,
        purchasesEnabled: true,
        claimStatus: 503,
      );
      await _settle();

      client.updates.add(<PremiumStorePurchaseUpdate>[_purchased('1001')]);
      await _settle();

      expect(calls, <String>['claim:jws']);
      expect(client.calls, isNot(contains('complete:1001')));
      expect(container.read(premiumStoreProvider).purchasePending, isTrue);
    });

    test('App Store purchase is finished when the claim is rejected', () async {
      final List<String> calls = <String>[];
      final _FakeStoreClient client = _FakeStoreClient(
        PremiumBillingStore.appStore,
      );
      final ProviderContainer container = _container(
        client: client,
        calls: calls,
        purchasesEnabled: true,
        claimStatus: 403,
      );
      await _settle();

      final int errorsBefore = container.read(premiumStoreProvider).errorSerial;
      client.updates.add(<PremiumStorePurchaseUpdate>[_purchased('1002')]);
      await _settle();

      expect(client.calls, contains('complete:1002'));
      final PremiumStoreState state = container.read(premiumStoreProvider);
      expect(state.purchasePending, isFalse);
      expect(state.errorSerial, errorsBefore + 1);
    });

    test('restore asks the store again', () async {
      final List<String> calls = <String>[];
      final _FakeStoreClient client = _FakeStoreClient(
        PremiumBillingStore.appStore,
      );
      final ProviderContainer container = _container(
        client: client,
        calls: calls,
        purchasesEnabled: true,
      );
      await _settle();

      await container.read(premiumStoreProvider.notifier).restore();

      expect(client.calls.where((String call) => call == 'restore').length, 2);
    });
  });
}
