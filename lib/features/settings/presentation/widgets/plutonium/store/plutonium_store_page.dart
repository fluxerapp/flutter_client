import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/premium/current_user_entitlements_provider.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/plutonium/store/plutonium_store_backdrop.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/plutonium/store/plutonium_store_bar.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/plutonium/store/plutonium_store_comparison.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/plutonium/store/plutonium_store_hero.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/plutonium/store/plutonium_store_highlights.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/plutonium/store/plutonium_store_perk.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/plutonium/store/plutonium_store_style.dart';
import 'package:fluxer_app/features/settings/providers/plutonium_store_provider.dart';
import 'package:fluxer_app/features/settings/providers/premium_settings_state_provider.dart';
import 'package:fluxer_app/features/settings/providers/user_settings_view_model.dart';
import 'package:fluxer_app/features/settings/services/premium_checkout_service.dart';
import 'package:fluxer_app/features/settings/utils/plutonium_store_bar_mode.dart';
import 'package:fluxer_app/features/settings/utils/premium_subscription_manage.dart';
import 'package:fluxer_app/features/settings/utils/premium_subscription_status.dart';
import 'package:fluxer_app/features/shell/providers/current_user_private_provider.dart';
import 'package:fluxer_app/features/ui/modal/fluxer_modal.dart';
import 'package:fluxer_app/features/ui/text_link/fluxer_text_link.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_dart/export.dart';

const String _kDonateUrl = 'https://fluxer.app/donate';
const String _kVisionaryUrl = 'https://fluxer.app/help/visionary';

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

    return ColoredBox(
      color: PremiumStoreStyle.spaceTop,
      child: PremiumStoreBackdrop(
        controller: _scrollController,
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
          otherStoreNotice: otherStoreNotice,
        ),
        child: SingleChildScrollView(
          controller: _scrollController,
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              PremiumStoreHero(
                monthlyPrice: monthlyPrice,
                yearlyPrice: yearlyPrice,
                priceLoading:
                    store.loading &&
                    (monthlyPrice == null || yearlyPrice == null),
              ),
              const SizedBox(height: 16),
              const _DonateLine(),
              const SizedBox(height: 16),
              const PremiumStoreHighlights(),
              const SizedBox(height: 16),
              PremiumStorePerk(
                asset: 'assets/images/plutonium/perk-expressions.webp',
                title: l10n.storePlutoniumEmojiTitle,
                body: l10n.storePlutoniumEmojiBody,
                imageFirst: true,
              ),
              const SizedBox(height: 16),
              PremiumStorePerk(
                asset: 'assets/images/plutonium/perk-profile.webp',
                title: l10n.storePlutoniumProfileTitle,
                body: l10n.storePlutoniumProfileBody,
                imageFirst: false,
              ),
              const SizedBox(height: 16),
              PremiumStorePerk(
                asset: 'assets/images/plutonium/perk-upload.webp',
                title: l10n.storePlutoniumFilesTitle,
                body: l10n.storePlutoniumFilesBody,
                imageFirst: true,
              ),
              const SizedBox(height: 16),
              const PremiumStoreComparison(),
              const SizedBox(height: 16),
              const _TagFootnote(),
            ],
          ),
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
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final TextStyle muted = context.textStyles.bodySmall.copyWith(
      color: PremiumStoreStyle.inkMuted,
    );
    return Text.rich(
      TextSpan(
        style: muted,
        children: [
          TextSpan(text: l10n.storePlutoniumDonatePrompt),
          WidgetSpan(
            alignment: PlaceholderAlignment.baseline,
            baseline: TextBaseline.alphabetic,
            child: FluxerTextLink(
              text: l10n.storePlutoniumDonateLink,
              url: _kDonateUrl,
              style: muted.copyWith(
                color: PremiumStoreStyle.ink,
                decoration: TextDecoration.underline,
                decorationColor: PremiumStoreStyle.inkFaint,
              ),
            ),
          ),
        ],
      ),
      textAlign: TextAlign.center,
    );
  }
}

class _TagFootnote extends StatelessWidget {
  const _TagFootnote();

  @override
  Widget build(BuildContext context) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final TextStyle muted = context.textStyles.timestamp.copyWith(
      color: PremiumStoreStyle.inkMuted,
    );
    return Text.rich(
      TextSpan(
        style: muted,
        children: [
          TextSpan(text: '${l10n.storePlutoniumTagFootnote} '),
          WidgetSpan(
            alignment: PlaceholderAlignment.baseline,
            baseline: TextBaseline.alphabetic,
            child: FluxerTextLink(
              text: l10n.storePlutoniumLearnVisionary,
              url: _kVisionaryUrl,
              style: muted.copyWith(color: PremiumStoreStyle.accent),
            ),
          ),
        ],
      ),
    );
  }
}
