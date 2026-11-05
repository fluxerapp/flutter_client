import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/api/fluxer_client_provider.dart';
import 'package:fluxer_app/core/premium/current_user_entitlements_provider.dart';
import 'package:fluxer_app/core/premium/plutonium_store_gate.dart';
import 'package:fluxer_app/core/providers/app/account_user_id.dart';
import 'package:fluxer_app/features/settings/providers/commerce/premium_settings_state_provider.dart';
import 'package:fluxer_app/features/settings/providers/commerce/store_billing_context_provider.dart';
import 'package:fluxer_app/features/settings/services/plutonium_store_products.dart';
import 'package:fluxer_app/features/settings/services/premium_store_purchase_client.dart';
import 'package:fluxer_app/features/settings/services/premium_store_purchase_update.dart';
import 'package:fluxer_app/features/shell/providers/user/current_user_private_provider.dart';
import 'package:fluxer_dart/export.dart';

enum PremiumStorePlan { monthly, yearly }

enum PremiumStoreError { checkout, claimFailed }

enum PremiumRestoreOutcome {
  restored,
  nothingToRestore,
  ownedByOtherAccount,
  failed,
}

class PremiumStoreState {
  const PremiumStoreState({
    this.monthly,
    this.yearly,
    this.loading = false,
    this.storeUnavailable = false,
    this.loadFailed = false,
    this.purchasePending = false,
    this.approvalPending = false,
    this.ownedByOtherAccount = false,
    this.lastError,
    this.purchasingPlan,
    this.errorSerial = 0,
    this.purchaseBlockedReason,
    this.blockingProvider,
    this.billingStore,
    this.productIds = const <String>{},
  });

  final PremiumStoreProduct? monthly;
  final PremiumStoreProduct? yearly;
  final bool loading;
  final bool storeUnavailable;
  final bool loadFailed;
  final bool purchasePending;
  final bool approvalPending;
  final bool ownedByOtherAccount;
  final PremiumStoreError? lastError;
  final PremiumStorePlan? purchasingPlan;
  final int errorSerial;
  final StorePurchaseBlockedReason? purchaseBlockedReason;
  final StoreBlockingProvider? blockingProvider;
  final PremiumBillingStore? billingStore;
  final Set<String> productIds;

  bool get subscriptionPurchaseBlocked {
    if (ownedByOtherAccount) {
      return true;
    }
    return switch (purchaseBlockedReason) {
      StorePurchaseBlockedReason.lifetime ||
      StorePurchaseBlockedReason.existingSubscription ||
      StorePurchaseBlockedReason.purchaseDisabled ||
      StorePurchaseBlockedReason.paymentDisputeOpen => true,
      StorePurchaseBlockedReason.$unknown || null => false,
    };
  }

  bool get accountPurchasesDisabled =>
      purchaseBlockedReason == StorePurchaseBlockedReason.purchaseDisabled;

  PremiumStoreState copyWith({
    Object? monthly = _keep,
    Object? yearly = _keep,
    Object? purchasingPlan = _keep,
    bool? loading,
    bool? storeUnavailable,
    bool? loadFailed,
    bool? purchasePending,
    bool? approvalPending,
    bool? ownedByOtherAccount,
    Object? lastError = _keep,
    int? errorSerial,
    Object? purchaseBlockedReason = _keep,
    Object? blockingProvider = _keep,
    Object? billingStore = _keep,
    Set<String>? productIds,
  }) {
    return PremiumStoreState(
      monthly: identical(monthly, _keep)
          ? this.monthly
          : monthly as PremiumStoreProduct?,
      yearly: identical(yearly, _keep)
          ? this.yearly
          : yearly as PremiumStoreProduct?,
      purchasingPlan: identical(purchasingPlan, _keep)
          ? this.purchasingPlan
          : purchasingPlan as PremiumStorePlan?,
      loading: loading ?? this.loading,
      storeUnavailable: storeUnavailable ?? this.storeUnavailable,
      loadFailed: loadFailed ?? this.loadFailed,
      purchasePending: purchasePending ?? this.purchasePending,
      approvalPending: approvalPending ?? this.approvalPending,
      ownedByOtherAccount: ownedByOtherAccount ?? this.ownedByOtherAccount,
      lastError: identical(lastError, _keep)
          ? this.lastError
          : lastError as PremiumStoreError?,
      errorSerial: errorSerial ?? this.errorSerial,
      purchaseBlockedReason: identical(purchaseBlockedReason, _keep)
          ? this.purchaseBlockedReason
          : purchaseBlockedReason as StorePurchaseBlockedReason?,
      blockingProvider: identical(blockingProvider, _keep)
          ? this.blockingProvider
          : blockingProvider as StoreBlockingProvider?,
      billingStore: identical(billingStore, _keep)
          ? this.billingStore
          : billingStore as PremiumBillingStore?,
      productIds: productIds ?? this.productIds,
    );
  }
}

class _Keep {
  const _Keep();
}

const Object _keep = _Keep();

enum _AppStoreClaim { claimed, ownedByOtherAccount, rejected, retryLater }

final premiumStorePurchaseClientProvider = Provider<PremiumStorePurchaseClient>(
  (Ref ref) {
    return createPremiumStorePurchaseClient();
  },
);

final premiumStoreProvider =
    NotifierProvider<PremiumStoreNotifier, PremiumStoreState>(
      PremiumStoreNotifier.new,
    );

class PremiumStoreNotifier extends Notifier<PremiumStoreState> {
  int _loadGeneration = 0;
  final Map<String, Future<_AppStoreClaim>> _claims =
      <String, Future<_AppStoreClaim>>{};
  Completer<List<PremiumStorePurchaseUpdate>>? _restoreBatch;

  @override
  PremiumStoreState build() {
    final PremiumStorePurchaseClient client = ref.watch(
      premiumStorePurchaseClientProvider,
    );
    final AsyncValue<StoreBillingContextResponse> billing = ref.watch(
      storeBillingContextProvider,
    );
    if (!ref.watch(premiumStorePurchasesEnabledProvider) ||
        !client.supportsPurchases) {
      return const PremiumStoreState(storeUnavailable: true);
    }
    if (billing.hasError) {
      return const PremiumStoreState(loadFailed: true);
    }
    if (billing.isLoading) {
      return const PremiumStoreState(loading: true);
    }
    final StoreBillingContextResponse? context = billing.value;
    if (context == null) {
      return const PremiumStoreState(loadFailed: true);
    }
    final PremiumBillingStore? platform = client.billingStore;
    final PremiumStoreCatalog? catalog = premiumStoreCatalog(
      context: context,
      store: platform,
    );
    if (catalog == null || !catalog.hasSubscriptionProducts) {
      return PremiumStoreState(
        storeUnavailable: true,
        purchaseBlockedReason: context.purchaseBlockedReason,
        blockingProvider: context.blockingProvider,
        billingStore: platform,
      );
    }
    final StreamSubscription<List<PremiumStorePurchaseUpdate>> purchases =
        client.purchaseUpdates.listen(
          _onPurchases,
          onError: (Object error, StackTrace stackTrace) {
            _bumpError(PremiumStoreError.checkout);
          },
        );
    ref.onDispose(() {
      unawaited(purchases.cancel());
    });
    unawaited(_start(client, catalog));
    return PremiumStoreState(
      loading: true,
      purchaseBlockedReason: context.purchaseBlockedReason,
      blockingProvider: context.blockingProvider,
      billingStore: platform,
      productIds: catalog.productIds,
    );
  }

  void retry() {
    ref
      ..invalidate(storeBillingContextProvider)
      ..invalidateSelf();
  }

  Future<void> buy(PremiumStorePlan plan) async {
    if (!ref.read(premiumStorePurchasesEnabledProvider) ||
        state.storeUnavailable ||
        state.subscriptionPurchaseBlocked) {
      return;
    }
    final PremiumStoreProduct? product = switch (plan) {
      PremiumStorePlan.monthly => state.monthly,
      PremiumStorePlan.yearly => state.yearly,
    };
    if (product == null || state.purchasingPlan != null) {
      return;
    }
    state = state.copyWith(purchasingPlan: plan);
    try {
      final bool started = await ref
          .read(premiumStorePurchaseClientProvider)
          .buy(product);
      if (!ref.mounted) {
        return;
      }
      if (!started) {
        state = state.copyWith(purchasingPlan: null);
        _bumpError(PremiumStoreError.checkout);
      }
    } on Object {
      if (!ref.mounted) {
        return;
      }
      state = state.copyWith(purchasingPlan: null);
      _bumpError(PremiumStoreError.checkout);
    }
  }

  Future<PremiumRestoreOutcome> restore() async {
    if (!ref.read(premiumStorePurchasesEnabledProvider) ||
        state.storeUnavailable) {
      return PremiumRestoreOutcome.failed;
    }
    return _restorePass(
      ref.read(premiumStorePurchaseClientProvider),
      userInitiated: true,
    );
  }

  Future<void> checkOwnership() async {
    if (!ref.read(premiumStorePurchasesEnabledProvider) ||
        state.storeUnavailable ||
        state.loadFailed ||
        state.loading ||
        _restoreBatch != null) {
      return;
    }
    await _restorePass(
      ref.read(premiumStorePurchaseClientProvider),
      userInitiated: false,
    );
  }

  Future<PremiumRestoreOutcome> _restorePass(
    PremiumStorePurchaseClient client, {
    required bool userInitiated,
  }) async {
    final Completer<List<PremiumStorePurchaseUpdate>> batch =
        Completer<List<PremiumStorePurchaseUpdate>>();
    _restoreBatch = batch;
    try {
      await client.restore(userInitiated: userInitiated);
      final List<PremiumStorePurchaseUpdate> restored =
          (await batch.future.timeout(const Duration(seconds: 10)))
              .where(
                (PremiumStorePurchaseUpdate update) =>
                    update.status == PremiumStorePurchaseStatus.restored &&
                    state.productIds.contains(update.productId),
              )
              .toList();
      final List<_AppStoreClaim> claims = await Future.wait(
        restored.map(
          (PremiumStorePurchaseUpdate purchase) =>
              _finish(purchase, claimAgain: userInitiated),
        ),
      );
      if (!ref.mounted) {
        return PremiumRestoreOutcome.failed;
      }
      final bool claimed = claims.contains(_AppStoreClaim.claimed);
      final bool ownedByOtherAccount = claims.contains(
        _AppStoreClaim.ownedByOtherAccount,
      );
      state = state.copyWith(
        ownedByOtherAccount: ownedByOtherAccount && !claimed,
      );
      if (restored.isEmpty) {
        return PremiumRestoreOutcome.nothingToRestore;
      }
      if (claimed) {
        return PremiumRestoreOutcome.restored;
      }
      if (ownedByOtherAccount) {
        return PremiumRestoreOutcome.ownedByOtherAccount;
      }
      return PremiumRestoreOutcome.failed;
    } on Object {
      return PremiumRestoreOutcome.failed;
    } finally {
      if (identical(_restoreBatch, batch)) {
        _restoreBatch = null;
      }
    }
  }

  Future<void> _start(
    PremiumStorePurchaseClient client,
    PremiumStoreCatalog catalog,
  ) async {
    final int generation = ++_loadGeneration;
    try {
      final bool available = await client.isStoreAvailable();
      if (!ref.mounted || generation != _loadGeneration) {
        return;
      }
      if (!available) {
        state = state.copyWith(loading: false, storeUnavailable: true);
        return;
      }
      final PremiumStoreProductSet products = await client.loadProducts(
        catalog,
      );
      if (!ref.mounted || generation != _loadGeneration) {
        return;
      }
      state = state.copyWith(
        monthly: products.monthly,
        yearly: products.yearly,
        loading: false,
        productIds: catalog.productIds,
      );
    } on Object {
      if (!ref.mounted || generation != _loadGeneration) {
        return;
      }
      state = state.copyWith(loading: false, loadFailed: true);
    }
  }

  void _onPurchases(List<PremiumStorePurchaseUpdate> purchases) {
    final Completer<List<PremiumStorePurchaseUpdate>>? batch = _restoreBatch;
    if (batch != null &&
        !batch.isCompleted &&
        purchases.every(
          (PremiumStorePurchaseUpdate purchase) =>
              purchase.status == PremiumStorePurchaseStatus.restored,
        )) {
      batch.complete(purchases);
      return;
    }
    for (final PremiumStorePurchaseUpdate purchase in purchases) {
      if (!state.productIds.contains(purchase.productId)) {
        continue;
      }
      switch (purchase.status) {
        case PremiumStorePurchaseStatus.pending:
          state = state.copyWith(purchasingPlan: null, approvalPending: true);
        case PremiumStorePurchaseStatus.canceled:
          state = state.copyWith(purchasingPlan: null);
        case PremiumStorePurchaseStatus.error:
          state = state.copyWith(purchasingPlan: null);
          _bumpError(PremiumStoreError.checkout);
        case PremiumStorePurchaseStatus.purchased:
        case PremiumStorePurchaseStatus.restored:
          unawaited(_finish(purchase));
      }
    }
  }

  Future<_AppStoreClaim> _finish(
    PremiumStorePurchaseUpdate purchase, {
    bool claimAgain = false,
  }) async {
    final String? purchaseId = purchase.purchaseId;
    final Future<_AppStoreClaim>? previous = purchaseId == null
        ? null
        : _claims[purchaseId];
    if (previous != null && !claimAgain) {
      return _replay(purchase, await previous);
    }
    final Future<_AppStoreClaim> settled = _settle(purchase);
    if (purchaseId != null) {
      _claims[purchaseId] = settled;
    }
    final _AppStoreClaim claim = await settled;
    if (claim == _AppStoreClaim.retryLater &&
        purchaseId != null &&
        identical(_claims[purchaseId], settled)) {
      unawaited(_claims.remove(purchaseId));
    }
    return claim;
  }

  Future<_AppStoreClaim> _replay(
    PremiumStorePurchaseUpdate purchase,
    _AppStoreClaim claim,
  ) async {
    if (purchase.pendingCompletePurchase &&
        state.billingStore != PremiumBillingStore.appStore) {
      await _complete(purchase);
    }
    return claim;
  }

  Future<_AppStoreClaim> _settle(PremiumStorePurchaseUpdate purchase) async {
    state = state.copyWith(
      purchasingPlan: null,
      purchasePending: true,
      approvalPending: false,
    );
    final _AppStoreClaim claim = await _claimAppStore(purchase);
    if (!ref.mounted) {
      return claim;
    }
    switch (claim) {
      case _AppStoreClaim.claimed:
        state = state.copyWith(ownedByOtherAccount: false);
        await _complete(purchase);
      case _AppStoreClaim.ownedByOtherAccount:
        await _complete(purchase);
        if (ref.mounted) {
          state = state.copyWith(
            purchasePending: false,
            ownedByOtherAccount: true,
          );
        }
        return claim;
      case _AppStoreClaim.rejected:
        await _complete(purchase);
        if (!ref.mounted) {
          return claim;
        }
        state = state.copyWith(purchasePending: false);
        if (purchase.status == PremiumStorePurchaseStatus.purchased) {
          _bumpError(PremiumStoreError.claimFailed);
        }
        return claim;
      case _AppStoreClaim.retryLater:
        break;
    }
    await _refreshEntitlements();
    if (!ref.mounted) {
      return claim;
    }
    if (ref
        .read(currentUserEntitlementsProvider(readAccountUserId(ref)))
        .isEffectivelyPremium) {
      state = state.copyWith(purchasePending: false);
      return claim;
    }
    await Future<void>.delayed(const Duration(seconds: 2));
    if (!ref.mounted) {
      return claim;
    }
    await _refreshEntitlements();
    if (!ref.mounted) {
      return claim;
    }
    if (ref
        .read(currentUserEntitlementsProvider(readAccountUserId(ref)))
        .isEffectivelyPremium) {
      state = state.copyWith(purchasePending: false);
    }
    return claim;
  }

  Future<_AppStoreClaim> _claimAppStore(
    PremiumStorePurchaseUpdate purchase,
  ) async {
    if (state.billingStore != PremiumBillingStore.appStore) {
      return _AppStoreClaim.claimed;
    }
    final String signedTransaction = purchase.serverVerificationData;
    if (signedTransaction.isEmpty) {
      return _AppStoreClaim.retryLater;
    }
    try {
      await ref
          .read(fluxerClientProvider)
          .premium
          .claimAppStoreTransaction(
            body: ClaimAppStoreTransactionRequest(
              signedTransaction: signedTransaction,
            ),
          );
      return _AppStoreClaim.claimed;
    } on DioException catch (error) {
      final int? status = error.response?.statusCode;
      if (status == 400 || status == 403) {
        final Object? data = error.response?.data;
        if (data is Map &&
            data['code'] == 'STORE_PURCHASE_OWNED_BY_OTHER_ACCOUNT') {
          return _AppStoreClaim.ownedByOtherAccount;
        }
        return _AppStoreClaim.rejected;
      }
      return _AppStoreClaim.retryLater;
    } on Object {
      return _AppStoreClaim.retryLater;
    }
  }

  Future<void> _complete(PremiumStorePurchaseUpdate purchase) async {
    if (!purchase.pendingCompletePurchase) {
      return;
    }
    try {
      await ref.read(premiumStorePurchaseClientProvider).complete(purchase);
    } on Object {
      _bumpError(PremiumStoreError.checkout);
    }
  }

  Future<void> _refreshEntitlements() async {
    try {
      await ref
          .read(currentUserPrivateReadProvider(readAccountUserId(ref)).notifier)
          .refresh();
      await ref.read(premiumSettingsStateProvider.notifier).refresh();
    } on Object {
      return;
    }
  }

  void _bumpError(PremiumStoreError error) {
    if (!ref.mounted) {
      return;
    }
    state = state.copyWith(
      lastError: error,
      errorSerial: state.errorSerial + 1,
    );
  }
}
