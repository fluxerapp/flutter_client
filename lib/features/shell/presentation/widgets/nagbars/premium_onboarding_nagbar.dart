import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/features/settings/presentation/user_settings_modal.dart';
import 'package:fluxer_app/features/shell/data/nagbar_user_updates.dart';
import 'package:fluxer_app/features/shell/presentation/responsive_layout.dart';
import 'package:fluxer_app/features/shell/presentation/widgets/nagbars/nagbar_widget.dart';
import 'package:fluxer_app/features/shell/presentation/widgets/nagbars/premium_grace_period_nagbar.dart';
import 'package:fluxer_app/features/shell/providers/nagbar_dismissals_provider.dart';
import 'package:fluxer_app/features/ui/nagbar/fluxer_nagbar.dart';
import 'package:fluxer_app/features/ui/nagbar/fluxer_nagbar_button.dart';
import 'package:fluxer_app/features/ui/nagbar/fluxer_nagbar_content.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';

const String kPremiumProductFullName = 'Fluxer Plutonium';

class PremiumOnboardingNagbar extends ConsumerWidget implements NagbarWidget {
  const PremiumOnboardingNagbar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final bool isMobile = isMobileLayout(context);
    Future<void> dismiss() async {
      await ref
          .read(nagbarDismissalsProvider.notifier)
          .dismissPremiumOnboarding();
      await dismissPremiumOnboardingFlag(ref);
    }

    return FluxerNagbar(
      isMobile: isMobile,
      backgroundColor: const Color(0xFF7C3AED),
      textColor: Colors.white,
      dismissible: true,
      onDismiss: dismiss,
      child: FluxerNagbarContent(
        isMobile: isMobile,
        message: l10n.nagbarPremiumOnboardingDefault(
          kPremiumProductFullName,
          kPremiumProductName,
        ),
        onDismiss: dismiss,
        actions: FluxerNagbarButton(
          isMobile: isMobile,
          label: l10n.nagbarViewPremiumFeatures(kPremiumProductName),
          onPressed: () => UserSettingsModal.show(context),
        ),
      ),
    );
  }
}
