import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/premium/premium_billing_service.dart';
import 'package:fluxer_app/features/settings/services/plutonium_store_products.dart';
import 'package:fluxer_app/features/settings/services/plutonium_store_purchase_client.dart';
import 'package:fluxer_app/features/settings/utils/premium_subscription_manage.dart';
import 'package:fluxer_app/features/ui/toast/fluxer_toast.dart';
import 'package:fluxer_app/features/ui/toast/toast_provider.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/external_links/external_link_handler.dart';
import 'package:fluxer_dart/export.dart';

PremiumManageAction? premiumNagbarManageAction({
  required PremiumSubscriptionProvider? provider,
  required String? manageUrl,
}) {
  final PlutoniumBillingStore? billingStore = currentPlutoniumBillingStore();
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
      final String? url = await createPremiumCustomerPortalSession(ref);
      if (!context.mounted) {
        return;
      }
      setLoading(loading: false);
      if (url == null) {
        ref
            .read(toastProvider.notifier)
            .show(
              FluxerToast(
                message: FluxerLocalizations.of(
                  context,
                ).nagbarBillingPortalFailed,
                variant: FluxerToastVariant.danger,
              ),
            );
        return;
      }
      await handleExternalLinkTap(context, url);
    case PremiumManageKind.storeUrl:
      final String? url = action.url;
      if (url == null || !context.mounted) {
        return;
      }
      await handleExternalLinkTap(context, url);
  }
}
