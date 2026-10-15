import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/premium/premium_billing_service.dart';
import 'package:fluxer_app/features/settings/services/plutonium_store_products.dart';
import 'package:fluxer_app/features/settings/services/premium_store_purchase_client.dart';
import 'package:fluxer_app/features/settings/utils/premium_subscription_manage.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/external_links/external_link_handler.dart';
import 'package:fluxer_app/shared/utils/api_error_presentation.dart';
import 'package:fluxer_dart/export.dart';

PremiumManageAction? premiumNagbarManageAction({
  required PremiumSubscriptionProvider? provider,
  required String? manageUrl,
}) {
  final PremiumBillingStore? billingStore = currentPremiumBillingStore();
  return premiumManageAction(
    surface: billingStore == null
        ? PremiumManageSurface.billing
        : PremiumManageSurface.store,
    provider: provider,
    manageUrl: manageUrl,
    currentStore: billingStore,
  );
}

Future<void> openPremiumNagbarManage({
  required BuildContext context,
  required WidgetRef ref,
  required PremiumManageAction action,
  required void Function({required bool loading}) setLoading,
}) async {
  switch (action.kind) {
    case PremiumManageKind.customerPortal:
      setLoading(loading: true);
      final String url;
      try {
        url = await createPremiumCustomerPortalSession(ref);
      } on Object catch (error) {
        if (!context.mounted) {
          return;
        }
        setLoading(loading: false);
        await showApiError(context, ApiErrorAction.openBillingPortal, error);
        return;
      }
      if (!context.mounted) {
        return;
      }
      setLoading(loading: false);
      await handleExternalLinkTap(context, url);
    case PremiumManageKind.storeUrl:
      final String? url = action.url;
      if (url == null || !context.mounted) {
        return;
      }
      await handleExternalLinkTap(context, url);
  }
}
