import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/api/dio_error_message.dart';
import 'package:fluxer_app/core/api/fluxer_client_provider.dart';
import 'package:fluxer_app/core/constants/contact_emails.dart';
import 'package:fluxer_app/core/premium/premium_billing_service.dart';
import 'package:fluxer_app/core/providers/instance_runtime_config_provider.dart';
import 'package:fluxer_app/features/settings/providers/premium_settings_state_provider.dart';
import 'package:fluxer_app/features/settings/utils/premium_purchases_disabled_l10n.dart';
import 'package:fluxer_app/features/settings/utils/premium_subscription_manage.dart';
import 'package:fluxer_app/features/shell/presentation/responsive_layout.dart';
import 'package:fluxer_app/features/shell/providers/current_user_private_provider.dart';
import 'package:fluxer_app/features/ui/modal/fluxer_modal.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/external_links/external_link_handler.dart';
import 'package:fluxer_app/shared/utils/api_error_presentation.dart';
import 'package:fluxer_dart/export.dart';

enum PremiumCheckoutPlan { monthly, yearly, gift1Month, gift1Year }

Future<void> startPremiumCheckout({
  required BuildContext context,
  required WidgetRef ref,
  required PremiumCheckoutPlan plan,
  required PriceIdsResponse priceIds,
  String? countryCode,
}) async {
  final FluxerLocalizations l10n = FluxerLocalizations.of(context);

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
      message: premiumPlanUnavailableMessage(
        l10n,
        selfHosted: ref.read(instanceRuntimeConfigProvider).selfHosted,
      ),
    );
    return;
  }

  CheckoutPaymentMethodEnum? paymentMethod;
  final String currency = priceIds.currency;
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
  final String url;
  try {
    url = await createPremiumCustomerPortalSession(ref);
  } on Object catch (error) {
    if (context.mounted) {
      await showApiError(context, ApiErrorAction.openBillingPortal, error);
    }
    return;
  }
  if (!context.mounted) {
    return;
  }
  await handleExternalLinkTap(context, url, skipWarning: true);
}

Future<void> openPremiumManageAction(
  BuildContext context,
  WidgetRef ref,
  PremiumManageAction action,
) async {
  switch (action.kind) {
    case PremiumManageKind.customerPortal:
      await openPremiumCustomerPortal(context, ref);
    case PremiumManageKind.storeUrl:
      final String? url = action.url;
      if (url == null || !context.mounted) {
        return;
      }
      await handleExternalLinkTap(context, url, skipWarning: true);
  }
}

Future<void> _refreshPremiumBillingState(WidgetRef ref) async {
  await ref.read(currentUserPrivateReadProvider.notifier).refresh();
  await ref.read(premiumSettingsStateProvider.notifier).refresh();
}

Future<void> cancelPremiumSubscription(WidgetRef ref) async {
  try {
    await ref.read(fluxerClientProvider).premium.cancelSubscription();
  } on Object catch (error) {
    await showApiErrorFromRoot(ApiErrorAction.cancelSubscription, error);
    return;
  }
  await _refreshPremiumBillingState(ref);
}

Future<void> reactivatePremiumSubscription(WidgetRef ref) async {
  try {
    await ref.read(fluxerClientProvider).premium.reactivateSubscription();
  } on Object catch (error) {
    await showApiErrorFromRoot(ApiErrorAction.reactivateSubscription, error);
    return;
  }
  await _refreshPremiumBillingState(ref);
}

Future<bool> selfServeRefundLatest(WidgetRef ref) async {
  try {
    await ref
        .read(fluxerClientProvider)
        .billing
        .selfServeRefundLatestPurchase();
  } on Object catch (error) {
    await showApiErrorFromRoot(ApiErrorAction.refundPurchase, error);
    return false;
  }
  await ref.read(premiumSettingsStateProvider.notifier).refresh();
  return true;
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
  final String? code = apiErrorCodeFromDioException(error);
  if (code == 'EMAIL_VERIFICATION_REQUIRED' ||
      code == 'PURCHASE_EMAIL_VERIFICATION_REQUIRED') {
    await _showCheckoutError(
      context,
      title: l10n.premiumVerifyEmailTitle,
      message: l10n.premiumVerifyEmailBody(
        ref.read(instanceRuntimeConfigProvider).premiumProductName,
      ),
    );
    return;
  }
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
        await _showExistingSubscription(context, ref, l10n);
        return;
      case 'purchase_disabled':
        await _showCheckoutError(
          context,
          title: l10n.premiumPurchasesDisabledTitle,
          message: premiumPurchasesDisabledMessage(
            l10n,
            selfHosted: ref.read(instanceRuntimeConfigProvider).selfHosted,
          ),
        );
        return;
    }
  }
  if (!context.mounted) {
    return;
  }
  if (code == 'PREMIUM_PURCHASE_BLOCKED') {
    await _showCheckoutError(
      context,
      title: l10n.premiumCheckoutBlockedTitle,
      message: ref.read(instanceRuntimeConfigProvider).selfHosted
          ? l10n.premiumCheckoutBlockedBodySelfHosted
          : l10n.premiumCheckoutBlockedBody(ContactEmails.support),
    );
    return;
  }
  if (!context.mounted) {
    return;
  }
  await _showCheckoutError(
    context,
    title: l10n.premiumCheckoutStartFailedTitle,
    message: l10n.premiumCheckoutStartFailedBody,
  );
}

Future<void> _showExistingSubscription(
  BuildContext context,
  WidgetRef ref,
  FluxerLocalizations l10n,
) async {
  final PremiumStateResponse? premium = ref
      .read(premiumSettingsStateProvider)
      .value;
  final PremiumManageAction? action = premiumManageAction(
    surface: PremiumManageSurface.billing,
    provider: premium?.subscriptionProvider,
    manageUrl: premium?.store?.manageUrl,
  );
  final bool portal = action?.kind == PremiumManageKind.customerPortal;
  await FluxerModal.show<void>(
    context,
    title: l10n.premiumExistingSubscriptionTitle,
    description: portal
        ? l10n.premiumExistingSubscriptionBody
        : l10n.storePlutoniumAlreadySubscribed,
    centered: true,
    actionsBuilder: (pop) => [
      if (action != null)
        TextButton(
          onPressed: () async {
            pop();
            if (context.mounted) {
              await openPremiumManageAction(context, ref, action);
            }
          },
          child: Text(l10n.premiumManageSubscription),
        )
      else
        TextButton(onPressed: () => pop(), child: Text(l10n.okay)),
    ],
    builder: (_, _) => const SizedBox.shrink(),
  );
}

Future<void> _showCheckoutError(
  BuildContext context, {
  required String title,
  required String message,
}) {
  return showErrorDialog(context, title: title, body: message);
}
