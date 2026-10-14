import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/providers/instance_runtime_config_provider.dart';
import 'package:fluxer_app/features/settings/presentation/sheets/messaging_paused_help_sheet.dart';
import 'package:fluxer_app/features/shell/presentation/responsive_layout.dart';
import 'package:fluxer_app/features/shell/presentation/widgets/nagbars/nagbar_widget.dart';
import 'package:fluxer_app/features/ui/nagbar/fluxer_nagbar.dart';
import 'package:fluxer_app/features/ui/nagbar/fluxer_nagbar_button.dart';
import 'package:fluxer_app/features/ui/nagbar/fluxer_nagbar_content.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';

class AccountLimitedNagbar extends ConsumerWidget implements NagbarWidget {
  const AccountLimitedNagbar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final bool isMobile = isMobileLayout(context);
    final bool selfHosted = ref.watch(
      instanceRuntimeConfigProvider.select((config) => config.selfHosted),
    );
    return FluxerNagbar(
      isMobile: isMobile,
      backgroundColor: const Color(0xFF4E5058),
      textColor: Colors.white,
      child: FluxerNagbarContent(
        isMobile: isMobile,
        message: l10n.accountLimitedNotice,
        actions: selfHosted
            ? null
            : FluxerNagbarButton(
                isMobile: isMobile,
                label: l10n.messagingPausedTextDidNotGoThrough,
                onPressed: () => MessagingPausedHelpSheet.show(context),
              ),
      ),
    );
  }
}
