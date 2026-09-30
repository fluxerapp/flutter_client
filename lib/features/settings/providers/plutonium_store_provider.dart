import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/premium/current_user_entitlements_provider.dart';
import 'package:fluxer_app/core/premium/plutonium_store_gate.dart';
import 'package:fluxer_app/features/settings/providers/premium_settings_state_provider.dart';
import 'package:fluxer_app/features/settings/providers/store_billing_context_provider.dart';
import 'package:fluxer_app/features/settings/services/plutonium_store_products.dart';
import 'package:fluxer_app/features/settings/services/plutonium_store_purchase_client.dart';
import 'package:fluxer_app/features/shell/providers/current_user_private_provider.dart';
import 'package:fluxer_dart/export.dart';
import 'package:in_app_purchase/in_app_purchase.dart';

enum PlutoniumStorePlan { monthly, yearly }

class PlutoniumStoreState {
  const PlutoniumStoreState({
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

  final PlutoniumStoreProduct? monthly;
  final PlutoniumStoreProduct? yearly;
  final bool loading;
  final bool storeUnavailable;
  final bool purchasePending;
  final PlutoniumStorePlan? purchasingPlan;
  final int errorSerial;
  final StorePurchaseBlockedReason? purchaseBlockedReason;
  final StoreBlockingProvider? blockingProvider;
  final PlutoniumBillingStore? billingStore;
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

  PlutoniumStoreState copyWith({
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
    return PlutoniumStoreState(
      monthly: identical(monthly, _keep)
          ? this.monthly
          : monthly as PlutoniumStoreProduct?,
      yearly: identical(yearly, _keep)
          ? this.yearly
          : yearly as PlutoniumStoreProduct?,
      purchasingPlan: identical(purchasingPlan, _keep)
          ? this.purchasingPlan
          : purchasingPlan as PlutoniumStorePlan?,
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
          : billingStore as PlutoniumBillingStore?,
      productIds: productIds ?? this.productIds,
    );
  }
}

class _Keep {
  const _Keep();
}

const Object _keep = _Keep();

final plutoniumStorePurchaseClientProvider =
    Provider<PlutoniumStorePurchaseClient>((Ref ref) {
      return createPlutoniumStorePurchaseClient();
    });

final plutoniumStoreProvider =
    NotifierProvider<PlutoniumStoreNotifier, PlutoniumStoreState>(
      PlutoniumStoreNotifier.new,
    );

class PlutoniumStoreNotifier extends Notifier<PlutoniumStoreState> {
  int _loadGeneration = 0;
  final Set<String> _finishedPurchaseIds = <String>{};

  @override
  PlutoniumStoreState build() {
    final PlutoniumStorePurchaseClient client = ref.watch(
      plutoniumStorePurchaseClientProvider,
    );
    final AsyncValue<StoreBillingContextResponse?> billing = ref.watch(
      storeBillingContextProvider,
    );
    if (!isPlutoniumStorePageActive() || !client.supportsPurchases) {
      return const PlutoniumStoreState(storeUnavailable: true);
    }
    if (plutoniumStorePurchasesEnabled) {
      final StreamSubscription<List<PurchaseDetails>> purchases = client
          .purchaseUpdates
          .listen(
            _onPurchases,
            onError: (Object error, StackTrace stackTrace) {
              _bumpError();
            },
          );
      ref.onDispose(() {
        unawaited(purchases.cancel());
      });
    }
    if (billing.isLoading) {
      return const PlutoniumStoreState(loading: true);
    }
    final StoreBillingContextResponse? context = billing.value;
    if (context == null) {
      return const PlutoniumStoreState(storeUnavailable: true);
    }
    final PlutoniumBillingStore? platform = currentPlutoniumBillingStore();
    final PlutoniumStoreCatalog? catalog = plutoniumStoreCatalog(
      context: context,
      store: platform,
    );
    if (catalog == null || !catalog.hasSubscriptionProducts) {
      return PlutoniumStoreState(
        storeUnavailable: true,
        purchaseBlockedReason: context.purchaseBlockedReason,
        blockingProvider: context.blockingProvider,
        billingStore: platform,
      );
    }
    unawaited(_start(client, catalog));
    return PlutoniumStoreState(
      loading: true,
      purchaseBlockedReason: context.purchaseBlockedReason,
      blockingProvider: context.blockingProvider,
      billingStore: platform,
      productIds: catalog.productIds,
    );
  }

  Future<void> buy(PlutoniumStorePlan plan) async {
    if (!plutoniumStorePurchasesEnabled || state.subscriptionPurchaseBlocked) {
      return;
    }
    final PlutoniumStoreProduct? product = switch (plan) {
      PlutoniumStorePlan.monthly => state.monthly,
      PlutoniumStorePlan.yearly => state.yearly,
    };
    if (product == null || state.purchasingPlan != null) {
      return;
    }
    state = state.copyWith(purchasingPlan: plan);
    try {
      final bool started = await ref
          .read(plutoniumStorePurchaseClientProvider)
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

  Future<void> _start(
    PlutoniumStorePurchaseClient client,
    PlutoniumStoreCatalog catalog,
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
    if (plutoniumStorePurchasesEnabled) {
      try {
        await client.restore();
      } on Object {
        // Billing can still list products if restore fails.
      }
    }
    if (!ref.mounted || generation != _loadGeneration) {
      return;
    }
    try {
      final PlutoniumStoreProductSet products = await client.loadProducts(
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

  void _onPurchases(List<PurchaseDetails> purchases) {
    for (final PurchaseDetails purchase in purchases) {
      if (!state.productIds.contains(purchase.productID)) {
        continue;
      }
      switch (purchase.status) {
        case PurchaseStatus.pending:
          break;
        case PurchaseStatus.canceled:
          state = state.copyWith(purchasingPlan: null);
        case PurchaseStatus.error:
          state = state.copyWith(purchasingPlan: null);
          _bumpError();
        case PurchaseStatus.purchased:
        case PurchaseStatus.restored:
          unawaited(_finish(purchase));
      }
    }
  }

  Future<void> _finish(PurchaseDetails purchase) async {
    final String? purchaseId = purchase.purchaseID;
    if (purchaseId != null && !_finishedPurchaseIds.add(purchaseId)) {
      if (purchase.pendingCompletePurchase) {
        await _complete(purchase);
      }
      return;
    }
    state = state.copyWith(purchasingPlan: null, purchasePending: true);
    await _complete(purchase);
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

  Future<void> _complete(PurchaseDetails purchase) async {
    if (!purchase.pendingCompletePurchase) {
      return;
    }
    try {
      await ref.read(plutoniumStorePurchaseClientProvider).complete(purchase);
    } on Object {
      _bumpError();
    }
  }

  Future<void> _refreshEntitlements() async {
    try {
      await ref.read(premiumSettingsStateProvider.notifier).refresh();
      await ref.read(currentUserPrivateReadProvider.notifier).refresh();
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
