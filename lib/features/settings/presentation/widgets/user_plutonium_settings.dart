import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/premium/current_user_entitlements_provider.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/settings/domain/user_settings_section.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/plutonium/premium_feature_comparison_table.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/plutonium/premium_pricing_card.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/plutonium/premium_purchase_disclaimer.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/wide_settings_content_layout.dart';
import 'package:fluxer_app/features/settings/providers/premium_settings_state_provider.dart';
import 'package:fluxer_app/features/settings/providers/user_settings_view_model.dart';
import 'package:fluxer_app/features/settings/services/premium_checkout_service.dart';
import 'package:fluxer_app/features/settings/utils/open_user_billing_settings.dart';
import 'package:fluxer_app/features/settings/utils/premium_formatting.dart';
import 'package:fluxer_app/features/settings/utils/premium_subscription_status.dart';
import 'package:fluxer_app/features/shell/providers/current_user_private_provider.dart';
import 'package:fluxer_app/features/ui/ui.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_dart/export.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class UserPlutoniumSettings extends ConsumerStatefulWidget {
  const UserPlutoniumSettings({
    this.scrollController,
    this.onOpenGifts,
    super.key,
  });

  final ScrollController? scrollController;
  final VoidCallback? onOpenGifts;

  @override
  ConsumerState<UserPlutoniumSettings> createState() =>
      _UserPlutoniumSettingsState();
}

class _UserPlutoniumSettingsState extends ConsumerState<UserPlutoniumSettings> {
  bool _isGiftMode = false;
  PremiumCheckoutPlan? _loadingPlan;
  bool _portalLoading = false;
  bool _cancelLoading = false;
  bool _reactivateLoading = false;

  @override
  Widget build(BuildContext context) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final AsyncValue<PremiumStateResponse?> premiumAsync = ref.watch(
      premiumSettingsStateProvider,
    );
    return premiumAsync.when(
      loading: () => const Center(child: FluxerLoadingSpinner()),
      error: (_, _) => _buildContent(context, l10n, null),
      data: (PremiumStateResponse? state) =>
          _buildContent(context, l10n, state),
    );
  }

  Widget _buildContent(
    BuildContext context,
    FluxerLocalizations l10n,
    PremiumStateResponse? premiumState,
  ) {
    final layout = context.layout;
    final colors = context.colors;
    final textStyles = context.textStyles;
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
      premiumState: premiumState,
      effectiveIsPremium: ref
          .watch(currentUserEntitlementsProvider)
          .isEffectivelyPremium,
      userPrivate: user,
    );

    final PriceIdsResponse? localizedIds = premiumState?.pricing.localized;
    if (localizedIds == null) {
      return const Center(child: FluxerLoadingSpinner());
    }
    final PriceIdsResponse priceIds = localizedIds;
    final String locale = l10n.localeName;
    final String subscriptionCurrency =
        priceIdsCurrencyCode(priceIds.currency) ?? 'USD';
    final String giftCurrency =
        giftCurrencyCode(priceIds.giftCurrency) ?? subscriptionCurrency;

    final String monthlyPrice = formatPremiumPriceLabel(
      amountMinor: priceIds.monthlyAmountMinor,
      currency: subscriptionCurrency,
      locale: locale,
    );
    final String yearlyPrice = formatPremiumPriceLabel(
      amountMinor: priceIds.yearlyAmountMinor,
      currency: subscriptionCurrency,
      locale: locale,
    );
    final String giftMonthlyPrice = formatPremiumPriceLabel(
      amountMinor: priceIds.gift1MonthAmountMinor,
      currency: giftCurrency,
      locale: locale,
    );
    final String giftYearlyPrice = formatPremiumPriceLabel(
      amountMinor: priceIds.gift1YearAmountMinor,
      currency: giftCurrency,
      locale: locale,
    );

    return SingleChildScrollView(
      controller: widget.scrollController,
      padding: settingsScrollPadding(context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (user?.hasUnreadGiftInventory ?? false) ...[
            _GiftInventoryBanner(
              count: user?.unreadGiftInventoryCount ?? 1,
              onViewGifts:
                  widget.onOpenGifts ??
                  () => openUserBillingSettings(
                    context,
                    UserSettingsSection.giftsAndCodes,
                  ),
            ),
            SizedBox(height: layout.s6),
          ],
          Text(
            l10n.userSettingsNavFluxerPlutonium,
            textAlign: TextAlign.center,
            style: textStyles.heading.copyWith(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: colors.textPrimary,
            ),
          ),
          SizedBox(height: layout.s2),
          Text(
            l10n.premiumPlutoniumTagline,
            textAlign: TextAlign.center,
            style: textStyles.bodySmall.copyWith(
              fontSize: 14,
              height: 1.375,
              color: colors.textPrimaryMuted,
            ),
          ),
          SizedBox(height: layout.s6),
          if (status.shouldShowPremiumCard)
            _SubscriptionSummary(
              status: status,
              l10n: l10n,
              portalLoading: _portalLoading,
              cancelLoading: _cancelLoading,
              reactivateLoading: _reactivateLoading,
              onManage: () => unawaited(_openPortal(context)),
              onCancel: () => unawaited(_confirmCancel(context, l10n)),
              onReactivate: () => unawaited(_reactivate(context)),
              onRedeemGift: widget.onOpenGifts,
            ),
          if (status.hasEverPurchased && premiumState != null) ...[
            SizedBox(height: layout.s6),
            _PurchaseHistorySection(
              onManagePayment: () => unawaited(_openPortal(context)),
              portalLoading: _portalLoading,
            ),
            if (premiumState.billing.refundEligibility.eligible) ...[
              SizedBox(height: layout.s4),
              FluxerButton.secondary(
                label: l10n.premiumSelfServeRefundButton,
                onPressedAsync: () async {
                  await selfServeRefundLatest(ref);
                  if (context.mounted) {
                    await ref
                        .read(premiumSettingsStateProvider.notifier)
                        .refresh();
                  }
                },
              ),
            ],
          ],
          if (!status.shouldShowPremiumCard) ...[
            _PurchaseModeToggle(
              isGiftMode: _isGiftMode,
              onChanged: (bool value) => setState(() => _isGiftMode = value),
            ),
            SizedBox(height: layout.s6),
            _PremiumPricingGrid(
              children: _isGiftMode
                  ? _giftPricingCards(
                      l10n: l10n,
                      priceIds: priceIds,
                      giftMonthlyPrice: giftMonthlyPrice,
                      giftYearlyPrice: giftYearlyPrice,
                      purchaseDisabled: purchaseDisabled,
                      isGiftSubscription: status.isGiftSubscription,
                    )
                  : _subscriptionPricingCards(
                      l10n: l10n,
                      priceIds: priceIds,
                      monthlyPrice: monthlyPrice,
                      yearlyPrice: yearlyPrice,
                      purchaseDisabled: purchaseDisabled,
                      isGiftSubscription: status.isGiftSubscription,
                    ),
            ),
            if (purchaseDisabled && purchaseDisabledMessage != null) ...[
              SizedBox(height: layout.s2),
              Text(
                purchaseDisabledMessage,
                textAlign: TextAlign.center,
                style: textStyles.bodySmall.copyWith(
                  color: colors.textPrimaryMuted,
                ),
              ),
            ],
            SizedBox(height: layout.s4),
            PremiumPurchaseDisclaimer(isPremium: status.isPremium),
            SizedBox(height: layout.s4),
            Text(
              l10n.premiumScrollPrompt,
              textAlign: TextAlign.center,
              style: textStyles.bodySmall.copyWith(
                color: colors.textPrimaryMuted,
              ),
            ),
            Center(
              child: PhosphorIcon(
                PhosphorIconsBold.arrowDown,
                size: 20,
                color: colors.textPrimaryMuted,
              ),
            ),
          ],
          if (status.shouldShowPremiumCard && !_isGiftMode) ...[
            SizedBox(height: layout.s6),
            Text(
              l10n.premiumGiftSectionTitle,
              style: textStyles.heading.copyWith(fontWeight: FontWeight.w600),
            ),
            SizedBox(height: layout.s2),
            Text(
              l10n.premiumGiftSectionDescription,
              style: textStyles.bodySmall.copyWith(
                color: colors.textPrimaryMuted,
              ),
            ),
            SizedBox(height: layout.s4),
            _PremiumPricingGrid(
              children: _giftPricingCards(
                l10n: l10n,
                priceIds: priceIds,
                giftMonthlyPrice: giftMonthlyPrice,
                giftYearlyPrice: giftYearlyPrice,
                purchaseDisabled: purchaseDisabled,
                isGiftSubscription: status.isGiftSubscription,
              ),
            ),
          ],
          SizedBox(height: layout.s6),
          Text(
            l10n.premiumFreeVsPlutonium,
            style: textStyles.heading.copyWith(fontWeight: FontWeight.w600),
          ),
          SizedBox(height: layout.s4),
          const PremiumFeatureComparisonTable(),
          if (!status.shouldShowPremiumCard) ...[
            SizedBox(height: layout.s8),
            Text(
              _isGiftMode
                  ? l10n.premiumReadyToBuyGift
                  : l10n.premiumReadyToUpgrade,
              textAlign: TextAlign.center,
              style: textStyles.heading.copyWith(fontWeight: FontWeight.w600),
            ),
            SizedBox(height: layout.s4),
            const PremiumPurchaseDisclaimer(),
          ],
        ],
      ),
    );
  }

  Future<void> _checkout(
    BuildContext context,
    PremiumCheckoutPlan plan,
    PriceIdsResponse priceIds,
    bool isGiftSubscription,
  ) async {
    setState(() => _loadingPlan = plan);
    await startPremiumCheckout(
      context: context,
      ref: ref,
      plan: plan,
      priceIds: priceIds,
      pricingMode: PricingModeEnum.localized,
      countryCode: ref
          .read(premiumSettingsStateProvider)
          .value
          ?.pricing
          .countryCode,
      isGiftSubscription: isGiftSubscription,
    );
    if (mounted) {
      setState(() => _loadingPlan = null);
    }
  }

  Future<void> _openPortal(BuildContext context) async {
    setState(() => _portalLoading = true);
    await openPremiumCustomerPortal(context, ref);
    if (mounted) {
      setState(() => _portalLoading = false);
    }
  }

  Future<void> _reactivate(BuildContext context) async {
    setState(() => _reactivateLoading = true);
    await reactivatePremiumSubscription(ref);
    if (mounted) {
      setState(() => _reactivateLoading = false);
    }
  }

  Future<void> _confirmCancel(
    BuildContext context,
    FluxerLocalizations l10n,
  ) async {
    final bool? confirmed = await FluxerModal.show<bool>(
      context,
      title: l10n.premiumCancelSubscriptionTitle,
      description: l10n.premiumCancelSubscriptionBody,
      centered: true,
      actionsBuilder: (pop) => [
        TextButton(onPressed: () => pop(false), child: Text(l10n.cancel)),
        TextButton(
          onPressed: () => pop(true),
          child: Text(l10n.premiumCancelSubscriptionConfirm),
        ),
      ],
      builder: (_, _) => const SizedBox.shrink(),
    );
    if (confirmed != true) {
      return;
    }
    setState(() => _cancelLoading = true);
    await cancelPremiumSubscription(ref);
    if (mounted) {
      setState(() => _cancelLoading = false);
    }
  }

  List<Widget> _subscriptionPricingCards({
    required FluxerLocalizations l10n,
    required PriceIdsResponse priceIds,
    required String monthlyPrice,
    required String yearlyPrice,
    required bool purchaseDisabled,
    required bool isGiftSubscription,
  }) {
    return [
      PremiumPricingCard(
        title: l10n.premiumMonthly,
        price: monthlyPrice,
        period: l10n.premiumPerMonth,
        buttonLabel: l10n.premiumUpgradeNow,
        isLoading: _loadingPlan == PremiumCheckoutPlan.monthly,
        disabled: purchaseDisabled,
        onSelect: () => unawaited(
          _checkout(
            context,
            PremiumCheckoutPlan.monthly,
            priceIds,
            isGiftSubscription,
          ),
        ),
      ),
      PremiumPricingCard(
        title: l10n.premiumYearly,
        price: yearlyPrice,
        period: l10n.premiumPerYear,
        badge: l10n.premiumSave17,
        isPopular: true,
        buttonLabel: l10n.premiumUpgradeNow,
        isLoading: _loadingPlan == PremiumCheckoutPlan.yearly,
        disabled: purchaseDisabled,
        onSelect: () => unawaited(
          _checkout(
            context,
            PremiumCheckoutPlan.yearly,
            priceIds,
            isGiftSubscription,
          ),
        ),
      ),
    ];
  }

  List<Widget> _giftPricingCards({
    required FluxerLocalizations l10n,
    required PriceIdsResponse priceIds,
    required String giftMonthlyPrice,
    required String giftYearlyPrice,
    required bool purchaseDisabled,
    required bool isGiftSubscription,
  }) {
    return [
      PremiumPricingCard(
        title: l10n.premiumOneYearGift,
        price: giftYearlyPrice,
        period: l10n.premiumOneTimePurchase,
        badge: l10n.premiumSave17,
        isPopular: true,
        buttonLabel: l10n.premiumBuyGift,
        isLoading: _loadingPlan == PremiumCheckoutPlan.gift1Year,
        disabled: purchaseDisabled,
        onSelect: () => unawaited(
          _checkout(
            context,
            PremiumCheckoutPlan.gift1Year,
            priceIds,
            isGiftSubscription,
          ),
        ),
      ),
      PremiumPricingCard(
        title: l10n.premiumOneMonthGift,
        price: giftMonthlyPrice,
        period: l10n.premiumOneTimePurchase,
        buttonLabel: l10n.premiumBuyGift,
        isLoading: _loadingPlan == PremiumCheckoutPlan.gift1Month,
        disabled: purchaseDisabled,
        onSelect: () => unawaited(
          _checkout(
            context,
            PremiumCheckoutPlan.gift1Month,
            priceIds,
            isGiftSubscription,
          ),
        ),
      ),
    ];
  }
}

class _PremiumPricingGrid extends StatelessWidget {
  const _PremiumPricingGrid({required this.children});

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    final layout = context.layout;
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 768) {
          return Column(
            children: [
              for (int i = 0; i < children.length; i++) ...[
                children[i],
                if (i < children.length - 1) SizedBox(height: layout.s6),
              ],
            ],
          );
        }
        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(child: children[0]),
            SizedBox(width: layout.s6),
            Expanded(child: children[1]),
          ],
        );
      },
    );
  }
}

class _GiftInventoryBanner extends StatelessWidget {
  const _GiftInventoryBanner({required this.count, required this.onViewGifts});

  final int count;
  final VoidCallback onViewGifts;

  @override
  Widget build(BuildContext context) {
    final l10n = FluxerLocalizations.of(context);
    final colors = context.colors;
    final layout = context.layout;
    final String message = count <= 1
        ? l10n.premiumGiftBannerOne
        : l10n.premiumGiftBannerMany(count);
    return DecoratedBox(
      decoration: BoxDecoration(
        color: colors.backgroundSecondary,
        borderRadius: layout.radiusLg,
        border: Border.all(color: colors.backgroundHeaderSecondary),
      ),
      child: Padding(
        padding: EdgeInsets.all(layout.s4),
        child: Row(
          children: [
            PhosphorIcon(PhosphorIconsFill.gift, color: colors.brandPrimary),
            SizedBox(width: layout.s3),
            Expanded(
              child: Text(
                message,
                style: context.textStyles.bodySmall.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            FluxerButton.secondary(
              label: l10n.premiumViewGifts,
              fitContent: true,
              onPressed: onViewGifts,
            ),
          ],
        ),
      ),
    );
  }
}

class _PurchaseModeToggle extends StatelessWidget {
  const _PurchaseModeToggle({
    required this.isGiftMode,
    required this.onChanged,
  });

  final bool isGiftMode;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    final l10n = FluxerLocalizations.of(context);
    final layout = context.layout;
    return Column(
      children: [
        Text(
          l10n.premiumPurchaseMode,
          style: context.textStyles.bodySmall.copyWith(
            color: context.colors.textPrimaryMuted,
          ),
        ),
        SizedBox(height: layout.s3),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _ModeChip(
              label: l10n.premiumForMe,
              selected: !isGiftMode,
              onTap: () => onChanged(false),
            ),
            SizedBox(width: layout.s3),
            _ModeChip(
              label: l10n.premiumAsAGift,
              selected: isGiftMode,
              onTap: () => onChanged(true),
            ),
          ],
        ),
      ],
    );
  }
}

class _ModeChip extends StatelessWidget {
  const _ModeChip({
    required this.label,
    required this.selected,
    required this.onTap,
  });

  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final layout = context.layout;
    return Material(
      color: selected ? colors.brandPrimary : colors.backgroundSecondary,
      borderRadius: layout.radiusFull,
      child: InkWell(
        onTap: onTap,
        borderRadius: layout.radiusFull,
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: layout.s4,
            vertical: layout.s2,
          ),
          child: Text(
            label,
            style: context.textStyles.bodySmall.copyWith(
              fontWeight: FontWeight.w600,
              color: selected ? colors.textOnBrandPrimary : colors.textPrimary,
            ),
          ),
        ),
      ),
    );
  }
}

class _SubscriptionSummary extends StatelessWidget {
  const _SubscriptionSummary({
    required this.status,
    required this.l10n,
    required this.portalLoading,
    required this.cancelLoading,
    required this.reactivateLoading,
    required this.onManage,
    required this.onCancel,
    required this.onReactivate,
    required this.onRedeemGift,
  });

  final PremiumSubscriptionStatus status;
  final FluxerLocalizations l10n;
  final bool portalLoading;
  final bool cancelLoading;
  final bool reactivateLoading;
  final VoidCallback onManage;
  final VoidCallback onCancel;
  final VoidCallback onReactivate;
  final VoidCallback? onRedeemGift;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final layout = context.layout;
    final String? until = status.actualPremiumUntil != null
        ? formatPremiumShortDate(status.actualPremiumUntil!, l10n.localeName)
        : null;
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: layout.radiusXl,
        border: Border.all(color: colors.backgroundModifierAccent),
      ),
      child: Padding(
        padding: EdgeInsets.all(layout.s4),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (status.isGiftSubscription)
              Text(
                l10n.premiumGiftBadge,
                style: context.textStyles.bodySmall.copyWith(
                  fontWeight: FontWeight.w700,
                  color: colors.brandPrimary,
                ),
              ),
            Row(
              children: [
                Expanded(
                  child: Text(
                    l10n.userSettingsNavFluxerPlutonium,
                    style: context.textStyles.heading.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                if (status.premiumWillCancel)
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 2,
                    ),
                    decoration: BoxDecoration(
                      color: colors.statusWarning.withValues(alpha: 0.14),
                      borderRadius: layout.radiusFull,
                    ),
                    child: Text(
                      l10n.premiumSubscriptionCanceling,
                      style: context.textStyles.bodySmall.copyWith(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        height: 1.33,
                        color: colors.statusWarning,
                      ),
                    ),
                  ),
              ],
            ),
            if (until != null) ...[
              SizedBox(height: layout.s2),
              Text(
                status.isGiftSubscription
                    ? l10n.premiumGiftedUntil(until)
                    : status.premiumWillCancel
                    ? l10n.premiumCancelsOn(until)
                    : l10n.premiumActiveUntil(until),
                style: context.textStyles.bodySmall.copyWith(
                  color: colors.textPrimaryMuted,
                ),
              ),
            ],
            SizedBox(height: layout.s4),
            Wrap(
              spacing: layout.s2,
              runSpacing: layout.s2,
              children: [
                if (!status.shouldUseReactivateQuickAction)
                  FluxerButton.secondary(
                    label: l10n.premiumManageSubscription,
                    isLoading: portalLoading,
                    fitContent: true,
                    onPressed: onManage,
                  ),
                if (status.shouldUseCancelQuickAction)
                  FluxerButton.secondary(
                    label: l10n.premiumCancelSubscriptionConfirm,
                    isLoading: cancelLoading,
                    fitContent: true,
                    onPressed: onCancel,
                  ),
                if (status.shouldUseReactivateQuickAction)
                  FluxerButton.primary(
                    label: l10n.premiumReactivateSubscription,
                    isLoading: reactivateLoading,
                    fitContent: true,
                    onPressed: onReactivate,
                  ),
                if (onRedeemGift != null)
                  FluxerButton.secondary(
                    label: l10n.premiumRedeemGiftCode,
                    fitContent: true,
                    onPressed: onRedeemGift,
                  ),
              ],
            ),
            SizedBox(height: layout.s4),
            const PremiumPurchaseDisclaimer(
              isPremium: true,
              alignCenter: false,
            ),
          ],
        ),
      ),
    );
  }
}

class _PurchaseHistorySection extends StatelessWidget {
  const _PurchaseHistorySection({
    required this.onManagePayment,
    required this.portalLoading,
  });

  final VoidCallback onManagePayment;
  final bool portalLoading;

  @override
  Widget build(BuildContext context) {
    final l10n = FluxerLocalizations.of(context);
    final layout = context.layout;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          l10n.premiumPurchaseHistoryTitle,
          style: context.textStyles.heading.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: layout.s2),
        Text(
          l10n.premiumPurchaseHistoryDescription,
          style: context.textStyles.bodySmall.copyWith(
            color: context.colors.textPrimaryMuted,
          ),
        ),
        SizedBox(height: layout.s4),
        FluxerButton.secondary(
          label: l10n.premiumManagePaymentMethods,
          isLoading: portalLoading,
          onPressed: onManagePayment,
        ),
      ],
    );
  }
}
