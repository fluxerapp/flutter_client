import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/features/settings/presentation/user_settings_modal.dart';
import 'package:fluxer_app/features/shell/presentation/responsive_layout.dart';
import 'package:fluxer_app/features/shell/presentation/widgets/nagbars/nagbar_widget.dart';
import 'package:fluxer_app/features/shell/providers/nagbar_dismissals_provider.dart';
import 'package:fluxer_app/features/ui/nagbar/fluxer_nagbar.dart';
import 'package:fluxer_app/features/ui/nagbar/fluxer_nagbar_button.dart';
import 'package:fluxer_app/features/ui/nagbar/fluxer_nagbar_content.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';

class VisionaryMfaNagbar extends ConsumerWidget implements NagbarWidget {
  const VisionaryMfaNagbar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final bool isMobile = isMobileLayout(context);
    return FluxerNagbar(
      isMobile: isMobile,
      backgroundColor: const Color(0xFFEA580C),
      textColor: Colors.white,
      dismissible: true,
      onDismiss: () =>
          ref.read(nagbarDismissalsProvider.notifier).dismissVisionaryMfa(),
      child: FluxerNagbarContent(
        isMobile: isMobile,
        message: l10n.nagbarVisionaryMfa,
        onDismiss: () =>
            ref.read(nagbarDismissalsProvider.notifier).dismissVisionaryMfa(),
        actions: FluxerNagbarButton(
          isMobile: isMobile,
          label: l10n.nagbarEnableMfa,
          onPressed: () =>
              UserSettingsModal.show(context, openSecuritySection: true),
        ),
      ),
    );
  }
}
