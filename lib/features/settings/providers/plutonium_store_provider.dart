import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/api/fluxer_client_provider.dart';
import 'package:fluxer_app/core/premium/current_user_entitlements_provider.dart';
import 'package:fluxer_app/core/premium/plutonium_store_gate.dart';
import 'package:fluxer_app/features/settings/providers/premium_settings_state_provider.dart';
import 'package:fluxer_app/features/settings/providers/store_billing_context_provider.dart';
import 'package:fluxer_app/features/settings/services/plutonium_store_products.dart';
import 'package:fluxer_app/features/settings/services/premium_store_purchase_client.dart';
import 'package:fluxer_app/features/settings/services/premium_store_purchase_update.dart';
import 'package:fluxer_app/features/shell/providers/current_user_private_provider.dart';
import 'package:fluxer_dart/export.dart';

enum PremiumStorePlan { monthly, yearly }

class PremiumStoreState {
  const PremiumStoreState({
    this.monthly,
    this.yearly,
    this.loading = false,
    this.storeUnavailable = false,
    this.purchasePending = false,
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
  final bool purchasePending;
  final PremiumStorePlan? purchasingPlan;
  final int errorSerial;
  final StorePurchaseBlockedReason? purchaseBlockedReason;
  final StoreBlockingProvider? blockingProvider;
  final PremiumBillingStore? billingStore;
  final Set<String> productIds;

  bool get subscriptionPurchaseBlocked {
    return switch (purchaseBlockedReason) {
      StorePurchaseBlockedReason.lifetime ||
      StorePurchaseBlockedReason.existingSubscription ||
      StorePurchaseBlockedReason.purchaseDisabled => true,
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
    bool? purchasePending,
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
      purchasePending: purchasePending ?? this.purchasePending,
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

enum _AppStoreClaim { claimed, rejected, retryLater }

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
  final Set<String> _finishedPurchaseIds = <String>{};

  @override
  PremiumStoreState build() {
    final PremiumStorePurchaseClient client = ref.watch(
      premiumStorePurchaseClientProvider,
    );
    final AsyncValue<StoreBillingContextResponse?> billing = ref.watch(
      storeBillingContextProvider,
    );
    if (!ref.watch(premiumStorePurchasesEnabledProvider) ||
        !client.supportsPurchases) {
      return const PremiumStoreState(storeUnavailable: true);
    }
    final StreamSubscription<List<PremiumStorePurchaseUpdate>> purchases =
        client.purchaseUpdates.listen(
          _onPurchases,
          onError: (Object error, StackTrace stackTrace) {
            _bumpError();
          },
        );
    ref.onDispose(() {
      unawaited(purchases.cancel());
    });
    if (billing.isLoading) {
      return const PremiumStoreState(loading: true);
    }
    final StoreBillingContextResponse? context = billing.value;
    if (context == null) {
      return const PremiumStoreState(storeUnavailable: true);
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
    unawaited(_start(client, catalog));
    return PremiumStoreState(
      loading: true,
      purchaseBlockedReason: context.purchaseBlockedReason,
      blockingProvider: context.blockingProvider,
      billingStore: platform,
      productIds: catalog.productIds,
    );
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
        state = state.copyWith(
          purchasingPlan: null,
          errorSerial: state.errorSerial + 1,
        );
      }
    } on Object {
      if (!ref.mounted) {
        return;
      }
      state = state.copyWith(
        purchasingPlan: null,
        errorSerial: state.errorSerial + 1,
      );
    }
  }

  Future<void> restore() async {
    if (!ref.read(premiumStorePurchasesEnabledProvider) ||
        state.storeUnavailable) {
      return;
    }
    try {
      await ref.read(premiumStorePurchaseClientProvider).restore();
    } on Object {
      _bumpError();
    }
  }

  Future<void> _start(
    PremiumStorePurchaseClient client,
    PremiumStoreCatalog catalog,
  ) async {
    final int generation = ++_loadGeneration;
    final bool available = await client.isStoreAvailable();
    if (!ref.mounted || generation != _loadGeneration) {
      return;
    }
    if (!available) {
      state = state.copyWith(loading: false, storeUnavailable: true);
      return;
    }
    try {
      await client.restore();
    } on Object {
      // Billing can still list products if restore fails.
    }
    if (!ref.mounted || generation != _loadGeneration) {
      return;
    }
    try {
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
      state = state.copyWith(loading: false);
    }
  }

  void _onPurchases(List<PremiumStorePurchaseUpdate> purchases) {
    for (final PremiumStorePurchaseUpdate purchase in purchases) {
      if (!state.productIds.contains(purchase.productId)) {
        continue;
      }
      switch (purchase.status) {
        case PremiumStorePurchaseStatus.pending:
          break;
        case PremiumStorePurchaseStatus.canceled:
          state = state.copyWith(purchasingPlan: null);
        case PremiumStorePurchaseStatus.error:
          state = state.copyWith(purchasingPlan: null);
          _bumpError();
        case PremiumStorePurchaseStatus.purchased:
        case PremiumStorePurchaseStatus.restored:
          unawaited(_finish(purchase));
      }
    }
  }

  Future<void> _finish(PremiumStorePurchaseUpdate purchase) async {
    final String? purchaseId = purchase.purchaseId;
    if (purchaseId != null && !_finishedPurchaseIds.add(purchaseId)) {
      if (purchase.pendingCompletePurchase &&
          state.billingStore != PremiumBillingStore.appStore) {
        await _complete(purchase);
      }
      return;
    }
    state = state.copyWith(purchasingPlan: null, purchasePending: true);
    final _AppStoreClaim claim = await _claimAppStore(purchase);
    if (!ref.mounted) {
      return;
    }
    switch (claim) {
      case _AppStoreClaim.claimed:
        await _complete(purchase);
      case _AppStoreClaim.rejected:
        await _complete(purchase);
        if (!ref.mounted) {
          return;
        }
        state = state.copyWith(purchasePending: false);
        if (purchase.status == PremiumStorePurchaseStatus.purchased) {
          _bumpError();
        }
        return;
      case _AppStoreClaim.retryLater:
        if (purchaseId != null) {
          _finishedPurchaseIds.remove(purchaseId);
        }
    }
    await _refreshEntitlements();
    if (!ref.mounted) {
      return;
    }
    if (ref.read(currentUserEntitlementsProvider).isEffectivelyPremium) {
      state = state.copyWith(purchasePending: false);
      return;
    }
    await Future<void>.delayed(const Duration(seconds: 2));
    if (!ref.mounted) {
      return;
    }
    await _refreshEntitlements();
    if (!ref.mounted) {
      return;
    }
    if (ref.read(currentUserEntitlementsProvider).isEffectivelyPremium) {
      state = state.copyWith(purchasePending: false);
    }
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
      _bumpError();
    }
  }

  Future<void> _refreshEntitlements() async {
    try {
      await ref.read(currentUserPrivateReadProvider.notifier).refresh();
      await ref.read(premiumSettingsStateProvider.notifier).refresh();
    } on Object {
      return;
    }
  }

  void _bumpError() {
    if (!ref.mounted) {
      return;
    }
    state = state.copyWith(errorSerial: state.errorSerial + 1);
  }
}
