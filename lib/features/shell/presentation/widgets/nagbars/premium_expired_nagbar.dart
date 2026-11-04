import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/features/settings/domain/user_settings_section.dart';
import 'package:fluxer_app/features/settings/providers/commerce/premium_settings_state_provider.dart';
import 'package:fluxer_app/features/settings/utils/commerce/open_user_billing_settings.dart';
import 'package:fluxer_app/features/settings/utils/commerce/premium_subscription_manage.dart';
import 'package:fluxer_app/features/settings/utils/commerce/user_settings_billing_nav.dart';
import 'package:fluxer_app/features/shell/presentation/responsive_layout.dart';
import 'package:fluxer_app/features/shell/presentation/widgets/nagbars/nagbar_widget.dart';
import 'package:fluxer_app/features/shell/presentation/widgets/nagbars/premium_grace_period_nagbar.dart';
import 'package:fluxer_app/features/shell/presentation/widgets/nagbars/premium_nagbar_manage.dart';
import 'package:fluxer_app/features/shell/providers/nagbar/nagbar_providers.dart';
import 'package:fluxer_app/features/ui/nagbar/fluxer_nagbar.dart';
import 'package:fluxer_app/features/ui/nagbar/fluxer_nagbar_button.dart';
import 'package:fluxer_app/features/ui/nagbar/fluxer_nagbar_content.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_dart/export.dart';

class PremiumExpiredNagbar extends ConsumerStatefulWidget
    implements NagbarWidget {
  const PremiumExpiredNagbar({super.key});

  @override
  ConsumerState<PremiumExpiredNagbar> createState() =>
      _PremiumExpiredNagbarState();
}

class _PremiumExpiredNagbarState extends ConsumerState<PremiumExpiredNagbar> {
  bool _isLoading = false;

  Future<void> _openManage(PremiumManageAction action) {
    return openPremiumNagbarManage(
      context: context,
      ref: ref,
      action: action,
      setLoading: ({required bool loading}) =>
          setState(() => _isLoading = loading),
    );
  }

  @override
  Widget build(BuildContext context) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final bool isMobile = isMobileLayout(context);
    final PremiumStateResponse? premium = ref
        .watch(premiumSettingsStateProvider)
        .value;
    final PremiumManageAction? manage = premiumNagbarManageAction(
      provider: premium?.subscriptionProvider,
      manageUrl: premium?.store?.manageUrl,
    );
    VoidCallback? onManage;
    if (!_isLoading && manage != null) {
      final PremiumManageAction action = manage;
      onManage = () => unawaited(_openManage(action));
    }
    final bool showFeatures =
        manage == null && ref.watch(premiumBillingNavVisibleProvider);
    final Widget? action = manage != null
        ? FluxerNagbarButton(
            isMobile: isMobile,
            label: l10n.nagbarManageSubscription,
            isLoading: _isLoading,
            onPressed: onManage,
          )
        : showFeatures
        ? FluxerNagbarButton(
            isMobile: isMobile,
            label: l10n.nagbarViewPremiumFeatures(kPremiumProductName),
            onPressed: () => unawaited(
              openUserBillingSettings(
                context,
                UserSettingsSection.fluxerPlutonium,
              ),
            ),
          )
        : null;
    return FluxerNagbar(
      isMobile: isMobile,
      backgroundColor: const Color(0xFFDC2626),
      textColor: Colors.white,
      dismissible: true,
      onDismiss: () =>
          ref.read(nagbarDismissalsProvider.notifier).dismissPremiumExpired(),
      child: FluxerNagbarContent(
        isMobile: isMobile,
        message: action == null
            ? l10n.nagbarPremiumExpiredNoAction(kPremiumProductName)
            : l10n.nagbarPremiumExpired(kPremiumProductName),
        onDismiss: () =>
            ref.read(nagbarDismissalsProvider.notifier).dismissPremiumExpired(),
        actions: action,
      ),
    );
  }
}
