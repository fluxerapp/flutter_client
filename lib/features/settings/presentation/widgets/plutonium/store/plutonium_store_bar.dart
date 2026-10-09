import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/providers/instance_runtime_config_provider.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/plutonium/store/plutonium_store_style.dart';
import 'package:fluxer_app/features/settings/providers/plutonium_store_provider.dart';
import 'package:fluxer_app/features/settings/services/plutonium_store_products.dart';
import 'package:fluxer_app/features/settings/utils/plutonium_store_bar_mode.dart';
import 'package:fluxer_app/features/settings/utils/premium_formatting.dart';
import 'package:fluxer_app/features/settings/utils/premium_purchases_disabled_l10n.dart';
import 'package:fluxer_app/features/settings/utils/premium_subscription_status.dart';
import 'package:fluxer_app/features/shell/presentation/responsive_layout.dart';
import 'package:fluxer_app/features/ui/button/fluxer_button.dart';
import 'package:fluxer_app/features/ui/spinner/fluxer_loading_spinner.dart';
import 'package:fluxer_app/features/ui/text_link/fluxer_text_link.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';

class PremiumStoreBar extends StatelessWidget {
  const PremiumStoreBar({
    required this.mode,
    required this.status,
    required this.store,
    required this.purchaseDisabled,
    required this.purchaseDisabledMessage,
    required this.onBuy,
    required this.onManage,
    this.otherStoreNotice,
    super.key,
  });

  final PremiumStoreBarMode mode;
  final PremiumSubscriptionStatus status;
  final PremiumStoreState store;
  final bool purchaseDisabled;
  final String? purchaseDisabledMessage;
  final void Function(PremiumStorePlan plan) onBuy;
  final VoidCallback? onManage;
  final String? otherStoreNotice;

  @override
  Widget build(BuildContext context) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final layout = context.layout;
    final double bottom = MediaQuery.paddingOf(context).bottom;

    return DecoratedBox(
      decoration: const BoxDecoration(
        border: Border(top: BorderSide(color: PremiumStoreStyle.line)),
      ),
      child: Padding(
        padding: EdgeInsets.fromLTRB(
          layout.s4,
          layout.s3,
          layout.s4,
          layout.s3 + bottom,
        ),
        child: switch (mode) {
          PremiumStoreBarMode.visionary => _StatusText(
            l10n.storePlutoniumVisionaryStatus,
          ),
          PremiumStoreBarMode.gift => _SubscribeActions(
            l10n: l10n,
            store: store,
            purchaseDisabled: purchaseDisabled,
            purchaseDisabledMessage: purchaseDisabledMessage,
            otherStoreNotice: otherStoreNotice,
            onBuy: onBuy,
            statusLines: [
              _giftText(l10n),
              l10n.premiumGiftTimeAddedAfterSubscription,
            ],
          ),
          PremiumStoreBarMode.waiting => const _WaitingStatus(),
          PremiumStoreBarMode.manage => _ManageStatus(
            detail: _manageDetail(l10n),
            cycle: _cycleLabel(l10n),
            onManage: onManage,
            otherStoreNotice: otherStoreNotice,
          ),
          PremiumStoreBarMode.subscribe => _SubscribeActions(
            l10n: l10n,
            store: store,
            purchaseDisabled: purchaseDisabled,
            purchaseDisabledMessage: purchaseDisabledMessage,
            otherStoreNotice: otherStoreNotice,
            onBuy: onBuy,
          ),
        },
      ),
    );
  }

  String _giftText(FluxerLocalizations l10n) {
    final DateTime? until = status.actualPremiumUntil;
    if (until == null) {
      return l10n.premiumGiftBadge;
    }
    return l10n.premiumGiftedUntil(
      formatPremiumShortDate(until, l10n.localeName),
    );
  }

  String? _manageDetail(FluxerLocalizations l10n) {
    final DateTime? until = status.actualPremiumUntil;
    if (until == null) {
      return null;
    }
    final String date = formatPremiumShortDate(until, l10n.localeName);
    if (status.premiumWillCancel) {
      return l10n.premiumCancelsOn(date);
    }
    return l10n.premiumActiveUntil(date);
  }

  String? _cycleLabel(FluxerLocalizations l10n) {
    return switch (status.billingCycle) {
      'monthly' => l10n.premiumMonthly,
      'yearly' => l10n.premiumYearly,
      _ => null,
    };
  }
}

class _StatusText extends StatelessWidget {
  const _StatusText(this.text);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: context.textStyles.bodySmall.copyWith(
        color: PremiumStoreStyle.ink,
      ),
    );
  }
}

class _WaitingStatus extends StatelessWidget {
  const _WaitingStatus();

  @override
  Widget build(BuildContext context) {
    final layout = context.layout;
    return Row(
      children: [
        const FluxerLoadingSpinner(),
        SizedBox(width: layout.s3),
        Expanded(
          child: Text(
            FluxerLocalizations.of(context).storePlutoniumWaiting,
            style: context.textStyles.bodySmall.copyWith(
              color: PremiumStoreStyle.ink,
            ),
          ),
        ),
      ],
    );
  }
}

class _ManageStatus extends StatelessWidget {
  const _ManageStatus({
    required this.detail,
    required this.cycle,
    required this.onManage,
    required this.otherStoreNotice,
  });

  final String? detail;
  final String? cycle;
  final VoidCallback? onManage;
  final String? otherStoreNotice;

  @override
  Widget build(BuildContext context) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final layout = context.layout;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (cycle != null)
          Text(
            cycle!,
            textAlign: TextAlign.center,
            style: context.textStyles.bodySmall.copyWith(
              color: PremiumStoreStyle.ink,
            ),
          ),
        if (detail != null) ...[
          SizedBox(height: layout.s1),
          Text(
            detail!,
            textAlign: TextAlign.center,
            style: context.textStyles.bodySmall.copyWith(
              color: PremiumStoreStyle.inkMuted,
            ),
          ),
        ],
        if (onManage != null) ...[
          SizedBox(height: layout.s3),
          FluxerButton.secondary(
            label: l10n.premiumManageSubscription,
            onPressed: onManage,
          ),
        ] else if (otherStoreNotice != null) ...[
          SizedBox(height: layout.s3),
          Text(
            otherStoreNotice!,
            textAlign: TextAlign.center,
            style: context.textStyles.bodySmall.copyWith(
              color: PremiumStoreStyle.inkMuted,
            ),
          ),
        ],
      ],
    );
  }
}

class _SubscribeActions extends ConsumerWidget {
  const _SubscribeActions({
    required this.l10n,
    required this.store,
    required this.purchaseDisabled,
    required this.purchaseDisabledMessage,
    required this.otherStoreNotice,
    required this.onBuy,
    this.statusLines = const [],
  });

  final FluxerLocalizations l10n;
  final PremiumStoreState store;
  final bool purchaseDisabled;
  final String? purchaseDisabledMessage;
  final String? otherStoreNotice;
  final void Function(PremiumStorePlan plan) onBuy;
  final List<String> statusLines;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final layout = context.layout;
    final bool sideBySide = !isMobileLayout(context);
    final int? savings = plutoniumYearlySavingsPercent(
      monthlyRawPrice: store.monthly?.rawPrice ?? 0,
      yearlyRawPrice: store.yearly?.rawPrice ?? 0,
    );
    final bool missingProducts =
        !store.loading && store.monthly == null && store.yearly == null;
    final bool selfHosted = ref.watch(
      instanceRuntimeConfigProvider.select((config) => config.selfHosted),
    );
    final String? blockMessage = purchaseDisabled
        ? purchaseDisabledMessage
        : store.storeUnavailable
        ? l10n.storePlutoniumUnavailable
        : store.accountPurchasesDisabled
        ? premiumPurchasesDisabledMessage(l10n, selfHosted: selfHosted)
        : otherStoreNotice ??
              (store.subscriptionPurchaseBlocked
                  ? l10n.storePlutoniumAlreadySubscribed
                  : missingProducts
                  ? premiumPlanUnavailableMessage(l10n, selfHosted: selfHosted)
                  : null);
    final String? renewsThrough = switch (store.billingStore) {
      PremiumBillingStore.appStore => l10n.storePlutoniumRenewsThroughAppStore,
      PremiumBillingStore.googlePlay => l10n.storePlutoniumRenewsThroughPlay,
      null => null,
    };

    final Widget yearly = _PlanButton(
      title: l10n.premiumYearly,
      price: _priced(store.yearly?.priceLabel, l10n.storePlutoniumYearSuffix),
      savings: savings == null ? null : l10n.storePlutoniumSavePercent(savings),
      primary: true,
      isLoading: store.purchasingPlan == PremiumStorePlan.yearly,
      disabled:
          purchaseDisabled ||
          store.storeUnavailable ||
          store.subscriptionPurchaseBlocked ||
          store.yearly == null ||
          store.purchasingPlan != null,
      onPressed: () => onBuy(PremiumStorePlan.yearly),
    );
    final Widget monthly = _PlanButton(
      title: l10n.premiumMonthly,
      price: _priced(store.monthly?.priceLabel, l10n.storePlutoniumMonthSuffix),
      primary: false,
      isLoading: store.purchasingPlan == PremiumStorePlan.monthly,
      disabled:
          purchaseDisabled ||
          store.storeUnavailable ||
          store.subscriptionPurchaseBlocked ||
          store.monthly == null ||
          store.purchasingPlan != null,
      onPressed: () => onBuy(PremiumStorePlan.monthly),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        for (final String line in statusLines) ...[
          _StatusText(line),
          SizedBox(height: layout.s2),
        ],
        if (renewsThrough != null &&
            !store.storeUnavailable &&
            !missingProducts &&
            !store.subscriptionPurchaseBlocked)
          Text(
            renewsThrough,
            textAlign: TextAlign.center,
            style: context.textStyles.timestamp.copyWith(
              color: PremiumStoreStyle.inkMuted,
            ),
          ),
        if (blockMessage != null) ...[
          SizedBox(height: layout.s2),
          Text(
            blockMessage,
            textAlign: TextAlign.center,
            style: context.textStyles.bodySmall.copyWith(
              color: PremiumStoreStyle.inkMuted,
            ),
          ),
        ],
        if (!store.subscriptionPurchaseBlocked) ...[
          SizedBox(height: layout.s3),
          if (sideBySide)
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(child: yearly),
                SizedBox(width: layout.s3),
                Expanded(child: monthly),
              ],
            )
          else ...[
            yearly,
            SizedBox(height: layout.s2),
            monthly,
          ],
          SizedBox(height: layout.s3),
          const _PurchaseTerms(),
        ],
      ],
    );
  }

  String? _priced(String? price, String suffix) {
    if (price == null) {
      return null;
    }
    return '$price$suffix';
  }
}

class _PurchaseTerms extends StatelessWidget {
  const _PurchaseTerms();

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
          TextSpan(text: l10n.premiumDisclaimerAgreementPrefix),
          WidgetSpan(
            alignment: PlaceholderAlignment.baseline,
            baseline: TextBaseline.alphabetic,
            child: FluxerTextLink(
              text: l10n.premiumTermsOfService,
              url: 'https://fluxer.app/terms',
              style: muted.copyWith(color: PremiumStoreStyle.accent),
            ),
          ),
          TextSpan(text: l10n.premiumDisclaimerAgreementMiddle),
          WidgetSpan(
            alignment: PlaceholderAlignment.baseline,
            baseline: TextBaseline.alphabetic,
            child: FluxerTextLink(
              text: l10n.premiumPrivacyPolicy,
              url: 'https://fluxer.app/privacy',
              style: muted.copyWith(color: PremiumStoreStyle.accent),
            ),
          ),
          const TextSpan(text: '.'),
        ],
      ),
      textAlign: TextAlign.center,
    );
  }
}

class _PlanButton extends StatelessWidget {
  const _PlanButton({
    required this.title,
    required this.price,
    required this.primary,
    required this.isLoading,
    required this.disabled,
    required this.onPressed,
    this.savings,
  });

  final String title;
  final String? price;
  final String? savings;
  final bool primary;
  final bool isLoading;
  final bool disabled;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final textStyles = context.textStyles;
    final Color foreground = primary
        ? colors.textOnBrandPrimary
        : colors.textPrimary;
    final String semantics = [title, ?price, ?savings].join(', ');
    final Widget body = Row(
      children: [
        Expanded(
          child: Text(
            title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: textStyles.categoryName.copyWith(color: foreground),
          ),
        ),
        if (price != null) ...[
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                price!,
                style: textStyles.categoryName.copyWith(color: foreground),
              ),
              if (savings != null)
                Text(
                  savings!,
                  style: textStyles.timestamp.copyWith(
                    color: foreground.withValues(alpha: 0.82),
                  ),
                ),
            ],
          ),
        ],
      ],
    );
    if (primary) {
      return FluxerButton.primary(
        semanticLabel: semantics,
        isLoading: isLoading,
        onPressed: disabled ? null : onPressed,
        child: body,
      );
    }
    return FluxerButton.secondary(
      semanticLabel: semantics,
      isLoading: isLoading,
      onPressed: disabled ? null : onPressed,
      child: body,
    );
  }
}
