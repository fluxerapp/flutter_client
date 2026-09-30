import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/features/settings/providers/premium_settings_state_provider.dart';
import 'package:fluxer_app/features/settings/providers/user_settings_view_model.dart';
import 'package:fluxer_app/features/settings/utils/premium_subscription_manage.dart';
import 'package:fluxer_app/features/shell/presentation/responsive_layout.dart';
import 'package:fluxer_app/features/shell/presentation/widgets/nagbars/nagbar_widget.dart';
import 'package:fluxer_app/features/shell/presentation/widgets/nagbars/premium_nagbar_manage.dart';
import 'package:fluxer_app/features/shell/providers/nagbar_conditions_provider.dart';
import 'package:fluxer_app/features/shell/providers/nagbar_dismissals_provider.dart';
import 'package:fluxer_app/features/ui/nagbar/fluxer_nagbar.dart';
import 'package:fluxer_app/features/ui/nagbar/fluxer_nagbar_button.dart';
import 'package:fluxer_app/features/ui/nagbar/fluxer_nagbar_content.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_dart/export.dart';
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
    final UserSettingsViewState settings = ref.watch(
      userSettingsViewModelProvider,
    );
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
        actions: manage == null
            ? null
            : FluxerNagbarButton(
                isMobile: isMobile,
                label: l10n.nagbarManageSubscription,
                isLoading: _isLoading,
                onPressed: onManage,
              ),
      ),
    );
  }
}
