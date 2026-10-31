import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/premium/current_user_entitlements_provider.dart';
import 'package:fluxer_app/core/providers/instance/instance_runtime_config_provider.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/premium/store/premium_store_backdrop.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/premium/store/premium_store_bar.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/premium/store/premium_store_hero_art.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/premium/store/premium_store_hero_band.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/premium/store/premium_store_hero_highlights.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/premium/store/premium_store_hero_prices.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/premium/store/premium_store_marketing.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/premium/store/premium_store_style.dart';
import 'package:fluxer_app/features/settings/providers/commerce/plutonium_store_provider.dart';
import 'package:fluxer_app/features/settings/providers/commerce/premium_settings_state_provider.dart';
import 'package:fluxer_app/features/settings/providers/view_models/user_settings_view_model.dart';
import 'package:fluxer_app/features/settings/services/plutonium_store_products.dart';
import 'package:fluxer_app/features/settings/services/premium_checkout_service.dart';
import 'package:fluxer_app/features/settings/utils/commerce/plutonium_store_bar_mode.dart';
import 'package:fluxer_app/features/settings/utils/commerce/premium_subscription_manage.dart';
import 'package:fluxer_app/features/settings/utils/commerce/premium_subscription_status.dart';
import 'package:fluxer_app/features/shell/providers/user/current_user_private_provider.dart';
import 'package:fluxer_app/features/ui/modal/fluxer_modal.dart';
import 'package:fluxer_app/features/ui/text_link/fluxer_text_link.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_dart/export.dart';

const String _kDonateUrl = 'https://fluxer.app/donate';

class PremiumStorePage extends ConsumerStatefulWidget {
  const PremiumStorePage({this.scrollController, super.key});

  final ScrollController? scrollController;

  @override
  ConsumerState<PremiumStorePage> createState() => _PremiumStorePageState();
}

class _PremiumStorePageState extends ConsumerState<PremiumStorePage> {
  ScrollController? _ownedScrollController;

  ScrollController get _scrollController =>
      widget.scrollController ?? _ownedScrollController!;

  @override
  void initState() {
    super.initState();
    if (widget.scrollController == null) {
      _ownedScrollController = ScrollController();
    }
  }

  @override
  void dispose() {
    _ownedScrollController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final PremiumStoreState store = ref.watch(premiumStoreProvider);
    ref.listen(premiumStoreProvider, (
      PremiumStoreState? previous,
      PremiumStoreState next,
    ) {
      if (previous != null && next.errorSerial != previous.errorSerial) {
        unawaited(_showPurchaseError(l10n));
      }
    });

    final UserSettingsViewState settings = ref.watch(
      userSettingsViewModelProvider,
    );
    final UserPrivateResponse? user = ref.watch(currentUserPrivateReadProvider);
    final bool purchaseDisabled =
        settings.isKnownUnclaimed || !(user?.verified ?? false);
    final String? purchaseDisabledMessage = settings.isKnownUnclaimed
        ? l10n.premiumClaimAccountToPurchase
        : !(user?.verified ?? false)
        ? l10n.premiumVerifyEmailToPurchase
        : null;
    final PremiumSubscriptionStatus status = computePremiumSubscriptionStatus(
      premiumState: ref.watch(premiumSettingsStateProvider).value,
      effectiveIsPremium: ref
          .watch(currentUserEntitlementsProvider)
          .isEffectivelyPremium,
      userPrivate: user,
    );
    final PremiumManageAction? manage = premiumManageAction(
      surface: PremiumManageSurface.store,
      provider: status.subscriptionProvider,
      manageUrl: status.manageUrl,
      currentStore: store.billingStore,
    );
    final PremiumStoreBarMode mode = premiumStoreBarMode(
      status: status,
      purchasePending: store.purchasePending,
      manageOnDevice: manage != null,
    );
    VoidCallback? onManage;
    if (manage != null) {
      final PremiumManageAction action = manage;
      onManage = () => unawaited(openPremiumManageAction(context, ref, action));
    }
    final String? otherStoreNotice =
        premiumStorePurchaseBlockedByOtherPlatform(
          reason: store.purchaseBlockedReason,
          blockingProvider: store.blockingProvider,
          currentStore: store.billingStore,
        )
        ? l10n.storePlutoniumAlreadySubscribed
        : null;

    final String? monthlyPrice = _periodPrice(
      store.monthly?.priceLabel,
      l10n.storePlutoniumMonthSuffix,
    );
    final String? yearlyPrice = _periodPrice(
      store.yearly?.priceLabel,
      l10n.storePlutoniumYearSuffix,
    );
    final bool selfHosted = ref.watch(
      instanceRuntimeConfigProvider.select((config) => config.selfHosted),
    );
    final String heroAsset = premiumStoreHeroArtAsset(selfHosted: selfHosted);

    return PremiumStoreBackdrop(
      bar: PremiumStoreBar(
        mode: mode,
        status: status,
        store: store,
        purchaseDisabled: purchaseDisabled,
        purchaseDisabledMessage: purchaseDisabledMessage,
        onBuy: (PremiumStorePlan plan) {
          unawaited(ref.read(premiumStoreProvider.notifier).buy(plan));
        },
        onManage: onManage,
        onRestore:
            store.billingStore == PremiumBillingStore.appStore &&
                !store.storeUnavailable
            ? ref.read(premiumStoreProvider.notifier).restore
            : null,
        otherStoreNotice: otherStoreNotice,
      ),
      child: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            PremiumStoreHeroBand(
              heroArtAsset: heroAsset,
              title: l10n.userSettingsNavFluxerPlutonium,
              scrollController: _scrollController,
              priceRow: PremiumStoreHeroPricesFromStore(
                monthlyPrice: monthlyPrice,
                yearlyPrice: yearlyPrice,
                priceLoading:
                    store.loading &&
                    (monthlyPrice == null || yearlyPrice == null),
                monthlyRawPrice: store.monthly?.rawPrice ?? 0,
                yearlyRawPrice: store.yearly?.rawPrice ?? 0,
              ),
              footer: selfHosted ? null : const _DonateLine(),
              highlights: const PremiumStoreHeroHighlights(),
            ),
            const PremiumStoreMarketingSections(),
          ],
        ),
      ),
    );
  }

  String? _periodPrice(String? price, String suffix) {
    if (price == null) {
      return null;
    }
    return '$price$suffix';
  }

  Future<void> _showPurchaseError(FluxerLocalizations l10n) async {
    if (!mounted) {
      return;
    }
    await FluxerModal.show<void>(
      context,
      title: l10n.premiumCheckoutStartFailedTitle,
      description: l10n.premiumCheckoutStartFailedBody,
      centered: true,
      actionsBuilder: (pop) => [
        TextButton(onPressed: () => pop(), child: Text(l10n.okay)),
      ],
      builder: (_, _) => const SizedBox.shrink(),
    );
  }
}

class _DonateLine extends StatelessWidget {
  const _DonateLine();

  @override
  Widget build(BuildContext context) {
    final PremiumStoreStyle style = PremiumStoreStyle.of(context);
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final TextStyle muted = context.textStyles.bodySmall.copyWith(
      color: style.inkSoft,
    );
    return Text.rich(
      TextSpan(
        style: muted,
        children: [
          TextSpan(text: l10n.storePlutoniumDonatePrompt),
          WidgetSpan(
            alignment: PlaceholderAlignment.baseline,
            baseline: TextBaseline.alphabetic,
            child: MediaQuery.withNoTextScaling(
              child: FluxerTextLink(
                text: l10n.storePlutoniumDonateLink,
                url: _kDonateUrl,
                style: muted.copyWith(
                  color: style.ink,
                  decoration: TextDecoration.underline,
                  decorationColor: style.inkFaint,
                ),
              ),
            ),
          ),
        ],
      ),
      textAlign: TextAlign.center,
    );
  }
}
