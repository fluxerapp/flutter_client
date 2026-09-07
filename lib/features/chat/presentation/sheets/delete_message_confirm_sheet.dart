import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/messages/message_item.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/messages/system_message.dart';
import 'package:fluxer_app/features/chat/providers/core/chat_view_model.dart';
import 'package:fluxer_app/features/ui/bottom_sheet/fluxer_confirm_sheet.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';

BuildContext? _deleteConfirmSheetContext(BuildContext? fallback) {
  final BuildContext? root = rootNavigatorKey.currentContext;
  if (root != null && root.mounted) {
    return root;
  }
  if (fallback != null && fallback.mounted) {
    return fallback;
  }
  return null;
}

/// Shows a confirmation bottom sheet for deleting a chat message.
///
/// [context] may be null or unmounted; the sheet is presented from the root
/// navigator. The message is removed only after the sheet closes.
Future<bool?> showDeleteMessageConfirmSheet(
  BuildContext? context,
  WidgetRef ref, {
  required Message message,
  String? guildId,
}) async {
  final BuildContext? sheetContext = _deleteConfirmSheetContext(context);
  if (sheetContext == null) {
    return null;
  }
  final l10n = FluxerLocalizations.of(sheetContext);
  final String messageId = message.id;
  final bool? confirmed = await FluxerConfirmSheet.show(
    sheetContext,
    title: l10n.chatMessageDeleteConfirmTitle,
    description: l10n.chatMessageDeleteConfirmDescription,
    body: _DeleteMessagePreview(message: message, guildId: guildId),
    confirmLabel: l10n.chatMessageDelete,
    isDanger: true,
  );
  if (confirmed ?? false) {
    unawaited(
      ref.read(chatViewModelProvider.notifier).deleteMessage(messageId),
    );
  }
  return confirmed;
}

class _DeleteMessagePreview extends ConsumerWidget {
  const _DeleteMessagePreview({required this.message, this.guildId});

  final Message message;
  final String? guildId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = context.colors;
    final layout = context.layout;
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(
        textScaler: TextScaler.linear(
          MediaQuery.textScalerOf(context).scale(1) * 0.875,
        ),
      ),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: colors.backgroundSecondary,
          borderRadius: layout.radiusMd,
          border: Border.all(color: colors.backgroundHeaderSecondary),
        ),
        child: ClipRRect(
          borderRadius: layout.radiusMd,
          child: IgnorePointer(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: message.isSystemMessage
                  ? SystemMessage(message: message, guildId: guildId)
                  : MessageItem(
                      message: message,
                      inboxPreviewMode: true,
                      hideMentionHighlight: true,
                      previewRoleGuildId: guildId,
                      currentUserId: ref.watch(currentUserIdProvider),
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
