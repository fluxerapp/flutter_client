import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/messaging/presentation/widgets/message_list_page_shell.dart';
import 'package:fluxer_app/features/messaging/presentation/widgets/saved_messages_body.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class SavedMessagesPage extends ConsumerWidget {
  const SavedMessagesPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    return MessageListPageShell(
      icon: PhosphorIcon(
        PhosphorIconsFill.bookmarkSimple,
        size: 24,
        color: context.colors.textPrimaryMuted,
      ),
      title: l10n.quickSwitcherBookmarksLabel,
      body: const SavedMessagesBody(),
    );
  }
}
