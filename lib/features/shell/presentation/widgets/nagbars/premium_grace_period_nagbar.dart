import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/premium/premium_billing_service.dart';
import 'package:fluxer_app/features/settings/providers/user_settings_view_model.dart';
import 'package:fluxer_app/features/shell/presentation/responsive_layout.dart';
import 'package:fluxer_app/features/shell/presentation/widgets/nagbars/nagbar_widget.dart';
import 'package:fluxer_app/features/shell/providers/nagbar_conditions_provider.dart';
import 'package:fluxer_app/features/shell/providers/nagbar_dismissals_provider.dart';
import 'package:fluxer_app/features/ui/nagbar/fluxer_nagbar.dart';
import 'package:fluxer_app/features/ui/nagbar/fluxer_nagbar_button.dart';
import 'package:fluxer_app/features/ui/nagbar/fluxer_nagbar_content.dart';
import 'package:fluxer_app/features/ui/toast/fluxer_toast.dart';
import 'package:fluxer_app/features/ui/toast/toast_provider.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/external_links/external_link_handler.dart';
import 'package:intl/intl.dart';

const String kPremiumProductName = 'Plutonium';

class PremiumGracePeriodNagbar extends ConsumerStatefulWidget
    implements NagbarWidget {
  const PremiumGracePeriodNagbar({super.key});

  @override
  ConsumerState<PremiumGracePeriodNagbar> createState() =>
      _PremiumGracePeriodNagbarState();
}

class _PremiumGracePeriodNagbarState
    extends ConsumerState<PremiumGracePeriodNagbar> {
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
    final UserSettingsViewState settings = ref.watch(
      userSettingsViewModelProvider,
    );
    final bool isMobile = isMobileLayout(context);
    final DateTime? expiryDate = DateTime.tryParse(settings.premiumUntil ?? '');
    final String graceDate = expiryDate == null
        ? ''
        : DateFormat.yMMMMd(
            Localizations.localeOf(context).toString(),
          ).format(expiryDate.add(kPremiumGracePeriod).toLocal());
    return FluxerNagbar(
      isMobile: isMobile,
      backgroundColor: const Color(0xFFF97316),
      textColor: Colors.white,
      dismissible: true,
      onDismiss: () => ref
          .read(nagbarDismissalsProvider.notifier)
          .dismissPremiumGracePeriod(),
      child: FluxerNagbarContent(
        isMobile: isMobile,
        message: l10n.nagbarPremiumGracePeriod(kPremiumProductName, graceDate),
        onDismiss: () => ref
            .read(nagbarDismissalsProvider.notifier)
            .dismissPremiumGracePeriod(),
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
