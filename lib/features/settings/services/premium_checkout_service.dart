import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/api/fluxer_client_provider.dart';
import 'package:fluxer_app/core/premium/premium_billing_service.dart';
import 'package:fluxer_app/features/settings/providers/premium_settings_state_provider.dart';
import 'package:fluxer_app/features/shell/presentation/responsive_layout.dart';
import 'package:fluxer_app/features/shell/providers/current_user_private_provider.dart';
import 'package:fluxer_app/features/ui/modal/fluxer_modal.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/shared/external_links/external_link_handler.dart';
import 'package:fluxer_dart/export.dart';
import 'package:material_ui/material_ui.dart';

enum PremiumCheckoutPlan { monthly, yearly, gift1Month, gift1Year }

Future<void> startPremiumCheckout({
  required BuildContext context,
  required WidgetRef ref,
  required PremiumCheckoutPlan plan,
  required PriceIdsResponse priceIds,
  required PricingModeEnum pricingMode,
  required bool isGiftSubscription,
  String? countryCode,
}) async {
  final FluxerLocalizations l10n = FluxerLocalizations.of(context);

  if (isGiftSubscription &&
      (plan == PremiumCheckoutPlan.monthly ||
          plan == PremiumCheckoutPlan.yearly)) {
    await _showCheckoutError(
      context,
      title: l10n.premiumCheckoutStartFailedTitle,
      message: l10n.premiumGiftSubscriptionBlocksRecurring,
    );
    return;
  }

  final ({String? priceId, bool isGift}) selected = switch (plan) {
    PremiumCheckoutPlan.monthly => (priceId: priceIds.monthly, isGift: false),
    PremiumCheckoutPlan.yearly => (priceId: priceIds.yearly, isGift: false),
    PremiumCheckoutPlan.gift1Month => (
      priceId: priceIds.gift1Month,
      isGift: true,
    ),
    PremiumCheckoutPlan.gift1Year => (
      priceId: priceIds.gift1Year,
      isGift: true,
    ),
  };

  final String? priceId = selected.priceId;
  if (priceId == null || priceId.isEmpty) {
    await _showCheckoutError(
      context,
      title: l10n.premiumCheckoutStartFailedTitle,
      message: l10n.premiumPlanUnavailable,
    );
    return;
  }

  CheckoutPaymentMethodEnum? paymentMethod;
  final String? currency = priceIds.currency.json;
  if (!selected.isGift &&
      (plan == PremiumCheckoutPlan.monthly ||
          plan == PremiumCheckoutPlan.yearly)) {
    if (currency == 'BRL') {
      final bool? usePix = await _pickAlternativePayment(
        context,
        title: l10n.premiumChoosePaymentMethodTitle,
        description: l10n.premiumPixPaymentPromptDescription,
        primaryLabel: l10n.premiumUsePix,
        secondaryLabel: l10n.premiumUseCard,
      );
      if (usePix == null) {
        return;
      }
      if (usePix) {
        paymentMethod = CheckoutPaymentMethodEnum.pix;
      }
    } else if (currency == 'INR') {
      final bool? useUpi = await _pickAlternativePayment(
        context,
        title: l10n.premiumChoosePaymentMethodTitle,
        description: l10n.premiumUpiPaymentPromptDescription,
        primaryLabel: l10n.premiumUseUpi,
        secondaryLabel: l10n.premiumUseCard,
      );
      if (useUpi == null) {
        return;
      }
      if (useUpi) {
        paymentMethod = CheckoutPaymentMethodEnum.upi;
      }
    }
  }

  try {
    final FluxerClient client = ref.read(fluxerClientProvider);
    final CreateCheckoutSessionRequest body = CreateCheckoutSessionRequest(
      priceId: priceId,
      countryCode: countryCode,
      pricingMode: pricingMode,
      paymentMethod: paymentMethod,
    );
    final UrlResponse response = selected.isGift
        ? await client.billing.createGiftCheckoutSession(body: body)
        : await client.billing.createCheckoutSession(body: body);
    final String url = response.url;
    if (url.isEmpty) {
      throw StateError('empty checkout url');
    }
    if (!context.mounted) {
      return;
    }
    if (isMobileLayout(context)) {
      final bool? confirmed = await FluxerModal.show<bool>(
        context,
        title: l10n.premiumCompletePaymentTitle,
        description: l10n.premiumCompletePaymentBody,
        centered: true,
        actionsBuilder: (pop) => [
          TextButton(onPressed: () => pop(false), child: Text(l10n.cancel)),
          TextButton(onPressed: () => pop(true), child: Text(l10n.okay)),
        ],
        builder: (_, _) => const SizedBox.shrink(),
      );
      if (confirmed != true || !context.mounted) {
        return;
      }
    }
    await handleExternalLinkTap(context, url, skipWarning: true);
  } on DioException catch (error) {
    if (!context.mounted) {
      return;
    }
    await _handleCheckoutDioError(context, ref, error, l10n);
  } on Object {
    if (!context.mounted) {
      return;
    }
    await _showCheckoutError(
      context,
      title: l10n.premiumCheckoutStartFailedTitle,
      message: l10n.premiumCheckoutStartFailedBody,
    );
  }
}

Future<void> openPremiumCustomerPortal(
  BuildContext context,
  WidgetRef ref,
) async {
  final FluxerLocalizations l10n = FluxerLocalizations.of(context);
  final String? url = await createPremiumCustomerPortalSession(ref);
  if (url == null || !context.mounted) {
    await _showCheckoutError(
      context,
      title: l10n.premiumCustomerPortalOpenFailedTitle,
      message: l10n.premiumCustomerPortalOpenFailedBody,
    );
    return;
  }
  await handleExternalLinkTap(context, url, skipWarning: true);
}

Future<void> _refreshPremiumBillingState(WidgetRef ref) async {
  await ref.read(premiumSettingsStateProvider.notifier).refresh();
  await ref.read(currentUserPrivateReadProvider.notifier).refresh();
}

Future<void> cancelPremiumSubscription(WidgetRef ref) async {
  await ref.read(fluxerClientProvider).premium.cancelSubscription();
  await _refreshPremiumBillingState(ref);
}

Future<void> reactivatePremiumSubscription(WidgetRef ref) async {
  await ref.read(fluxerClientProvider).premium.reactivateSubscription();
  await _refreshPremiumBillingState(ref);
}

Future<void> changePremiumBillingCycle(
  WidgetRef ref, {
  required ChangeSubscriptionRequestBillingCycleBillingCycle billingCycle,
}) async {
  await ref
      .read(fluxerClientProvider)
      .premium
      .changeSubscriptionBillingCycle(
        body: ChangeSubscriptionRequest(billingCycle: billingCycle),
      );
  await ref.read(premiumSettingsStateProvider.notifier).refresh();
}

Future<void> cancelPendingPremiumChange(WidgetRef ref) async {
  await ref
      .read(fluxerClientProvider)
      .premium
      .cancelPendingSubscriptionChange();
  await ref.read(premiumSettingsStateProvider.notifier).refresh();
}

Future<void> endPremiumGracePeriod(WidgetRef ref) async {
  await ref.read(fluxerClientProvider).premium.endPremiumGracePeriod();
  await ref.read(premiumSettingsStateProvider.notifier).refresh();
}

Future<void> selfServeRefundLatest(WidgetRef ref) async {
  await ref.read(fluxerClientProvider).billing.selfServeRefundLatestPurchase();
  await ref.read(premiumSettingsStateProvider.notifier).refresh();
}

Future<bool?> _pickAlternativePayment(
  BuildContext context, {
  required String title,
  required String description,
  required String primaryLabel,
  required String secondaryLabel,
}) {
  return FluxerModal.show<bool>(
    context,
    title: title,
    description: description,
    centered: true,
    actionsBuilder: (pop) => [
      TextButton(onPressed: () => pop(false), child: Text(secondaryLabel)),
      TextButton(onPressed: () => pop(true), child: Text(primaryLabel)),
    ],
    builder: (_, _) => const SizedBox.shrink(),
  );
}

Future<void> _handleCheckoutDioError(
  BuildContext context,
  WidgetRef ref,
  DioException error,
  FluxerLocalizations l10n,
) async {
  final Object? body = error.response?.data;
  if (body is Map<String, dynamic>) {
    final String? reason = body['reason'] as String?;
    switch (reason) {
      case 'lifetime':
        await _showCheckoutError(
          context,
          title: l10n.premiumAlreadyVisionaryTitle,
          message: l10n.premiumAlreadyVisionaryBody,
        );
        return;
      case 'existing_subscription':
        await FluxerModal.show<void>(
          context,
          title: l10n.premiumExistingSubscriptionTitle,
          description: l10n.premiumExistingSubscriptionBody,
          centered: true,
          actionsBuilder: (pop) => [
            TextButton(
              onPressed: () async {
                pop();
                if (context.mounted) {
                  await openPremiumCustomerPortal(context, ref);
                }
              },
              child: Text(l10n.premiumManageSubscription),
            ),
          ],
          builder: (_, _) => const SizedBox.shrink(),
        );
        return;
      case 'purchase_disabled':
        await _showCheckoutError(
          context,
          title: l10n.premiumPurchasesDisabledTitle,
          message: l10n.premiumPurchasesDisabledBody,
        );
        return;
    }
  }
  await _showCheckoutError(
    context,
    title: l10n.premiumCheckoutStartFailedTitle,
    message: l10n.premiumCheckoutStartFailedBody,
  );
}

Future<void> _showCheckoutError(
  BuildContext context, {
  required String title,
  required String message,
}) {
  return FluxerModal.show<void>(
    context,
    title: title,
    description: message,
    centered: true,
    builder: (_, _) => const SizedBox.shrink(),
  );
}
