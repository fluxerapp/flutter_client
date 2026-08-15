import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/features/settings/presentation/user_settings_modal.dart';
import 'package:fluxer_app/features/settings/providers/user_settings_view_model.dart';
import 'package:fluxer_app/features/shell/presentation/responsive_layout.dart';
import 'package:fluxer_app/features/shell/presentation/widgets/nagbars/nagbar_widget.dart';
import 'package:fluxer_app/features/ui/nagbar/fluxer_nagbar.dart';
import 'package:fluxer_app/features/ui/nagbar/fluxer_nagbar_button.dart';
import 'package:fluxer_app/features/ui/nagbar/fluxer_nagbar_content.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:material_ui/material_ui.dart';

class EmailVerificationNagbar extends ConsumerWidget implements NagbarWidget {
  const EmailVerificationNagbar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final UserSettingsViewState settings = ref.watch(
      userSettingsViewModelProvider,
    );
    final bool isMobile = isMobileLayout(context);
    final String displayName = settings.displayName.trim().isNotEmpty
        ? settings.displayName
        : settings.username;
    return FluxerNagbar(
      isMobile: isMobile,
      backgroundColor: const Color(0xFFEA580C),
      textColor: Colors.white,
      child: FluxerNagbarContent(
        isMobile: isMobile,
        message: l10n.nagbarEmailVerificationMessage(displayName),
        actions: FluxerNagbarButton(
          isMobile: isMobile,
          label: l10n.nagbarOpenSettings,
          onPressed: () =>
              UserSettingsModal.show(context, openSecuritySection: true),
        ),
      ),
    );
  }
}
