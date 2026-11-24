import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/features/settings/providers/preferences/streamer_mode_provider.dart';
import 'package:fluxer_app/features/shell/presentation/responsive_layout.dart';
import 'package:fluxer_app/features/shell/presentation/widgets/nagbars/nagbar_widget.dart';
import 'package:fluxer_app/features/ui/nagbar/fluxer_nagbar.dart';
import 'package:fluxer_app/features/ui/nagbar/fluxer_nagbar_button.dart';
import 'package:fluxer_app/features/ui/nagbar/fluxer_nagbar_content.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';

class StreamerModeNagbar extends ConsumerWidget implements NagbarWidget {
  const StreamerModeNagbar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final bool isMobile = isMobileLayout(context);
    final StreamerMode notifier = ref.read(streamerModeProvider.notifier);
    return FluxerNagbar(
      isMobile: isMobile,
      backgroundColor: const Color(0xFF7C3AED),
      textColor: Colors.white,
      dismissible: true,
      onDismiss: notifier.dismissNagbar,
      child: FluxerNagbarContent(
        isMobile: isMobile,
        message: l10n.streamerModeNagbarMessage,
        onDismiss: notifier.dismissNagbar,
        actions: FluxerNagbarButton(
          isMobile: isMobile,
          label: l10n.streamerModeNagbarDisable,
          onPressed: () => unawaited(notifier.disable()),
        ),
      ),
    );
  }
}
