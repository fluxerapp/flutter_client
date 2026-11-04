import 'dart:async';

import 'package:dio/dio.dart';
import 'package:fake_async/fake_async.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/api/fluxer_client_provider.dart';
import 'package:fluxer_app/core/premium/plutonium_store_gate.dart';
import 'package:fluxer_app/features/settings/providers/commerce/plutonium_store_provider.dart';
import 'package:fluxer_app/features/settings/providers/commerce/store_billing_context_provider.dart';
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
  List<PremiumStorePurchaseUpdate> restoreBatch =
      <PremiumStorePurchaseUpdate>[];
  Completer<void>? loadGate;

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
    await loadGate?.future;
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
  Future<void> restore({required bool userInitiated}) async {
    calls.add(userInitiated ? 'restore:user' : 'restore');
    updates.add(restoreBatch);
  }

  @override
  Future<String?> storefrontCountryCode() async => null;
}

class _FakePremiumApi extends Fake implements PremiumApi {
  _FakePremiumApi(this.calls, {this.claimStatus, this.claimCode});

  final List<String> calls;
  int? claimStatus;
  String? claimCode;

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
        response: Response<Object?>(
          requestOptions: options,
          statusCode: status,
          data: claimCode == null
              ? null
              : <String, Object?>{'code': claimCode, 'message': claimCode},
        ),
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
  Future<StoreBillingContextResponse> build() async => _context();
}

class _FlakyBillingContext extends StoreBillingContextNotifier {
  static int builds = 0;
  static bool offline = false;

  @override
  Future<StoreBillingContextResponse> build() async {
    builds += 1;
    if (builds == 1 && offline) {
      throw DioException(
        requestOptions: RequestOptions(path: '/premium/store/billing'),
        type: DioExceptionType.connectionError,
      );
    }
    if (builds == 1) {
      throw StateError('offline');
    }
    return _context();
  }
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
  String? claimCode,
  bool flakyBilling = false,
}) {
  final ProviderContainer container = ProviderContainer(
    overrides: [
      premiumStorePurchaseClientProvider.overrideWithValue(client),
      storeBillingContextProvider.overrideWith(
        flakyBilling ? _FlakyBillingContext.new : _FixedBillingContext.new,
      ),
      fluxerClientProvider.overrideWithValue(
        _FakeFluxerClient(
          _FakePremiumApi(
            calls,
            claimStatus: claimStatus,
            claimCode: claimCode,
          ),
        ),
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

PremiumStorePurchaseUpdate _purchased(
  String id, {
  String jws = 'jws',
  PremiumStorePurchaseStatus status = PremiumStorePurchaseStatus.purchased,
}) {
  return PremiumStorePurchaseUpdate(
    productId: 'plutonium_monthly',
    status: status,
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

      expect(client.calls, <String>['load', 'buy:plutonium', 'complete:gpa.1']);
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
      expect(state.lastError, PremiumStoreError.claimFailed);
    });

    test('a restored purchase owned by another account blocks buying '
        'without an error', () async {
      final List<String> calls = <String>[];
      final _FakeStoreClient client = _FakeStoreClient(
        PremiumBillingStore.appStore,
      );
      final ProviderContainer container = _container(
        client: client,
        calls: calls,
        purchasesEnabled: true,
        claimStatus: 403,
        claimCode: 'STORE_PURCHASE_OWNED_BY_OTHER_ACCOUNT',
      );
      await _settle();

      final int errorsBefore = container.read(premiumStoreProvider).errorSerial;
      client.updates.add(<PremiumStorePurchaseUpdate>[
        _purchased('1003', status: PremiumStorePurchaseStatus.restored),
      ]);
      await _settle();

      final PremiumStoreState state = container.read(premiumStoreProvider);
      expect(client.calls, contains('complete:1003'));
      expect(state.ownedByOtherAccount, isTrue);
      expect(state.subscriptionPurchaseBlocked, isTrue);
      expect(state.errorSerial, errorsBefore);
      await container
          .read(premiumStoreProvider.notifier)
          .buy(PremiumStorePlan.monthly);
      expect(client.calls, isNot(contains('buy:plutonium_monthly')));
    });

    test('a pending purchase stops the spinner until it is approved', () async {
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
      client.updates.add(<PremiumStorePurchaseUpdate>[
        _purchased('1004', status: PremiumStorePurchaseStatus.pending),
      ]);
      await _settle();

      PremiumStoreState state = container.read(premiumStoreProvider);
      expect(state.purchasingPlan, isNull);
      expect(state.approvalPending, isTrue);

      client.updates.add(<PremiumStorePurchaseUpdate>[_purchased('1004')]);
      await _settle();

      state = container.read(premiumStoreProvider);
      expect(state.approvalPending, isFalse);
      expect(calls, <String>['claim:jws']);
    });

    test('a purchase delivered before the products load is claimed', () async {
      final List<String> calls = <String>[];
      final _FakeStoreClient client = _FakeStoreClient(
        PremiumBillingStore.appStore,
      )..loadGate = Completer<void>();
      _container(client: client, calls: calls, purchasesEnabled: true);
      await _settle();

      client.updates.add(<PremiumStorePurchaseUpdate>[_purchased('1005')]);
      await _settle();

      expect(calls, <String>['claim:jws']);
      client.loadGate!.complete();
    });

    test('a failed plan load can be retried', () async {
      _FlakyBillingContext.builds = 0;
      _FlakyBillingContext.offline = false;
      final List<String> calls = <String>[];
      final _FakeStoreClient client = _FakeStoreClient(
        PremiumBillingStore.appStore,
      );
      final ProviderContainer container = _container(
        client: client,
        calls: calls,
        purchasesEnabled: true,
        flakyBilling: true,
      );
      await _settle();

      expect(container.read(premiumStoreProvider).loadFailed, isTrue);
      expect(client.calls, isNot(contains('load')));

      container.read(premiumStoreProvider.notifier).retry();
      await _settle();

      final PremiumStoreState state = container.read(premiumStoreProvider);
      expect(state.loadFailed, isFalse);
      expect(state.monthly?.id, 'plutonium_monthly');
    });

    test('restore reports when there is nothing to restore', () async {
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

      final PremiumRestoreOutcome outcome = await container
          .read(premiumStoreProvider.notifier)
          .restore();

      expect(outcome, PremiumRestoreOutcome.nothingToRestore);
      expect(client.calls, contains('restore:user'));
      expect(calls, isEmpty);
    });

    test('restore claims a restored subscription', () async {
      final List<String> calls = <String>[];
      final _FakeStoreClient client =
          _FakeStoreClient(PremiumBillingStore.appStore)
            ..restoreBatch = <PremiumStorePurchaseUpdate>[
              _purchased('1006', status: PremiumStorePurchaseStatus.restored),
            ];
      final ProviderContainer container = _container(
        client: client,
        calls: calls,
        purchasesEnabled: true,
      );
      await _settle();

      final PremiumRestoreOutcome outcome = await container
          .read(premiumStoreProvider.notifier)
          .restore();

      expect(outcome, PremiumRestoreOutcome.restored);
      expect(calls, <String>['claim:jws']);
      expect(client.calls, contains('complete:1006'));
    });

    test('restore claims again after a quiet check found another '
        'account', () async {
      final List<String> calls = <String>[];
      final _FakeStoreClient client =
          _FakeStoreClient(PremiumBillingStore.appStore)
            ..restoreBatch = <PremiumStorePurchaseUpdate>[
              _purchased('1007', status: PremiumStorePurchaseStatus.restored),
            ];
      final ProviderContainer container = _container(
        client: client,
        calls: calls,
        purchasesEnabled: true,
        claimStatus: 403,
        claimCode: 'STORE_PURCHASE_OWNED_BY_OTHER_ACCOUNT',
      );
      await _settle();
      final PremiumStoreNotifier notifier = container.read(
        premiumStoreProvider.notifier,
      );

      await notifier.checkOwnership();
      expect(container.read(premiumStoreProvider).ownedByOtherAccount, isTrue);
      await notifier.checkOwnership();
      expect(calls, <String>['claim:jws']);
      expect(container.read(premiumStoreProvider).ownedByOtherAccount, isTrue);

      expect(
        await notifier.restore(),
        PremiumRestoreOutcome.ownedByOtherAccount,
      );
      expect(calls, <String>['claim:jws', 'claim:jws']);

      (container.read(fluxerClientProvider).premium as _FakePremiumApi)
        ..claimStatus = null
        ..claimCode = null;
      expect(await notifier.restore(), PremiumRestoreOutcome.restored);
      final PremiumStoreState state = container.read(premiumStoreProvider);
      expect(state.ownedByOtherAccount, isFalse);
      expect(state.subscriptionPurchaseBlocked, isFalse);
    });

    test('a plan load that fails offline at launch retries on its own', () {
      fakeAsync((FakeAsync async) {
        _FlakyBillingContext.builds = 0;
        _FlakyBillingContext.offline = true;
        final List<String> calls = <String>[];
        final _FakeStoreClient client = _FakeStoreClient(
          PremiumBillingStore.appStore,
        );
        final ProviderContainer container = _container(
          client: client,
          calls: calls,
          purchasesEnabled: true,
          flakyBilling: true,
        );
        async.flushMicrotasks();
        expect(container.read(premiumStoreProvider).loadFailed, isTrue);
        expect(client.updates.hasListener, isFalse);

        async
          ..elapse(const Duration(seconds: 3))
          ..flushMicrotasks();

        expect(client.updates.hasListener, isTrue);
        expect(
          container.read(premiumStoreProvider).monthly?.id,
          'plutonium_monthly',
        );
      });
    });
  });
}
