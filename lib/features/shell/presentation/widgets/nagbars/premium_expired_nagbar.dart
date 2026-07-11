import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/premium/premium_billing_service.dart';
import 'package:fluxer_app/features/shell/presentation/responsive_layout.dart';
import 'package:fluxer_app/features/shell/presentation/widgets/nagbars/nagbar_widget.dart';
import 'package:fluxer_app/features/shell/presentation/widgets/nagbars/premium_grace_period_nagbar.dart';
import 'package:fluxer_app/features/shell/providers/nagbar_dismissals_provider.dart';
import 'package:fluxer_app/features/ui/nagbar/fluxer_nagbar.dart';
import 'package:fluxer_app/features/ui/nagbar/fluxer_nagbar_button.dart';
import 'package:fluxer_app/features/ui/nagbar/fluxer_nagbar_content.dart';
import 'package:fluxer_app/features/ui/toast/fluxer_toast.dart';
import 'package:fluxer_app/features/ui/toast/toast_provider.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/shared/external_links/external_link_handler.dart';

class PremiumExpiredNagbar extends ConsumerStatefulWidget
    implements NagbarWidget {
  const PremiumExpiredNagbar({super.key});

  @override
  ConsumerState<PremiumExpiredNagbar> createState() =>
      _PremiumExpiredNagbarState();
}

class _PremiumExpiredNagbarState extends ConsumerState<PremiumExpiredNagbar> {
  bool _isLoading = false;

  Future<void> _openPortal() async {
    setState(() => _isLoading = true);
    final String? url = await createPremiumCustomerPortalSession(ref);
    if (!mounted) {
      return;
    }
    setState(() => _isLoading = false);
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
  }

  @override
  Widget build(BuildContext context) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final bool isMobile = isMobileLayout(context);
    return FluxerNagbar(
      isMobile: isMobile,
      backgroundColor: const Color(0xFFDC2626),
      textColor: Colors.white,
      dismissible: true,
      onDismiss: () =>
          ref.read(nagbarDismissalsProvider.notifier).dismissPremiumExpired(),
      child: FluxerNagbarContent(
        isMobile: isMobile,
        message: l10n.nagbarPremiumExpired(kPremiumProductName),
        onDismiss: () =>
            ref.read(nagbarDismissalsProvider.notifier).dismissPremiumExpired(),
        actions: FluxerNagbarButton(
          isMobile: isMobile,
          label: l10n.nagbarManageSubscription,
          isLoading: _isLoading,
          onPressed: _isLoading ? null : _openPortal,
        ),
      ),
    );
  }
}
