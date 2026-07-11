import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/features/settings/presentation/user_settings_modal.dart';
import 'package:fluxer_app/features/shell/data/nagbar_user_updates.dart';
import 'package:fluxer_app/features/shell/presentation/responsive_layout.dart';
import 'package:fluxer_app/features/shell/presentation/widgets/nagbars/nagbar_widget.dart';
import 'package:fluxer_app/features/shell/providers/current_user_private_provider.dart';
import 'package:fluxer_app/features/shell/providers/nagbar_dismissals_provider.dart';
import 'package:fluxer_app/features/ui/nagbar/fluxer_nagbar.dart';
import 'package:fluxer_app/features/ui/nagbar/fluxer_nagbar_button.dart';
import 'package:fluxer_app/features/ui/nagbar/fluxer_nagbar_content.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_dart/export.dart';

class GiftInventoryNagbar extends ConsumerWidget implements NagbarWidget {
  const GiftInventoryNagbar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final UserPrivateResponse? user = ref.watch(currentUserPrivateReadProvider);
    final int count = user?.unreadGiftInventoryCount ?? 1;
    final bool isMobile = isMobileLayout(context);
    final String message = count <= 1
        ? l10n.nagbarGiftInventoryOne
        : l10n.nagbarGiftInventoryMany(count);
    Future<void> dismiss() async {
      await ref.read(nagbarDismissalsProvider.notifier).dismissGiftInventory();
      await clearUnreadGiftInventoryFlag(ref);
    }

    return FluxerNagbar(
      isMobile: isMobile,
      backgroundColor: Theme.of(context).colorScheme.primary,
      textColor: Colors.white,
      dismissible: true,
      onDismiss: dismiss,
      child: FluxerNagbarContent(
        isMobile: isMobile,
        message: message,
        onDismiss: dismiss,
        actions: FluxerNagbarButton(
          isMobile: isMobile,
          label: l10n.nagbarViewGiftInventory,
          onPressed: () => UserSettingsModal.show(context),
        ),
      ),
    );
  }
}
