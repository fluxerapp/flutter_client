import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/messages/message_item.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/messages/system_message.dart';
import 'package:fluxer_app/features/chat/providers/core/chat_view_model.dart';
import 'package:fluxer_app/features/ui/bottom_sheet/fluxer_confirm_sheet.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';

/// Shows a confirmation bottom sheet for deleting a chat message.
///
/// Resolves to `true` when the user taps Delete; `null` when dismissed
/// without confirming.
Future<bool?> showDeleteMessageConfirmSheet(
  BuildContext context,
  WidgetRef ref, {
  required Message message,
  String? guildId,
}) {
  final l10n = FluxerLocalizations.of(context);
  return FluxerConfirmSheet.show(
    context,
    title: l10n.chatMessageDeleteConfirmTitle,
    description: l10n.chatMessageDeleteConfirmDescription,
    body: _DeleteMessagePreview(message: message, guildId: guildId),
    confirmLabel: l10n.chatMessageDelete,
    isDanger: true,
    onConfirm: () {
      unawaited(
        ref.read(chatViewModelProvider.notifier).deleteMessage(message.id),
      );
    },
  );
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
