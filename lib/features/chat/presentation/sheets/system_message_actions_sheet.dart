import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/features/chat/domain/chat_fullscreen_video_launch_context.dart';
import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/features/chat/presentation/sheets/delete_message_confirm_sheet.dart';
import 'package:fluxer_app/features/chat/presentation/sheets/message_debug_sheet.dart';
import 'package:fluxer_app/features/chat/presentation/sheets/message_reactions_sheet.dart';
import 'package:fluxer_app/features/chat/presentation/sheets/remove_all_reactions_confirm_sheet.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/message_actions/message_bottom_sheet.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/message_actions/quick_reaction_loader.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/message_actions/quick_reaction_row.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/pickers/expression_picker.dart';
import 'package:fluxer_app/features/chat/providers/core/chat_view_model.dart';
import 'package:fluxer_app/features/chat/utils/message_link.dart';
import 'package:fluxer_app/features/chat/utils/system_message_text.dart';
import 'package:fluxer_app/features/settings/providers/user_settings_view_model.dart';
import 'package:fluxer_app/features/ui/emoji_picker/fluxer_emoji_picker_sheet.dart';
import 'package:fluxer_app/features/ui/emoji_picker/fluxer_selected_emoji.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/shared/providers/guild_user_display_provider.dart';
import 'package:fluxer_app/shared/utils/clipboard_utils.dart';

Future<void> showSystemMessageActionsSheet(
  BuildContext context,
  WidgetRef ref, {
  required Message message,
  required String? guildId,
  required bool isDmChannel,
  required bool canDelete,
  required bool canAddReactions,
  required bool canManageMessages,
  required String? currentUserId,
}) async {
  final quickItems = await loadQuickReactionItems(
    ref,
    channelId: message.channelId,
    guildId: guildId,
  );
  if (!context.mounted) {
    return;
  }
  final developerMode = ref.read(
    userSettingsViewModelProvider.select((s) => s.developerMode),
  );
  final action = await showMessageBottomSheet(
    context,
    message: message,
    isOwnMessage: currentUserId != null && message.authorId == currentUserId,
    isDmChannel: isDmChannel,
    canDelete: canDelete,
    canReport: false,
    canAddReactions: canAddReactions,
    canPinMessage: false,
    canManageMessages: canManageMessages,
    canSendMessages: false,
    developerMode: developerMode,
    quickItems: quickItems,
    onQuickReaction: (item) => _toggleQuickReaction(ref, message, item),
  );
  if (action == null || !context.mounted) {
    return;
  }
  switch (action) {
    case MessageAction.addReaction:
      unawaited(
        FluxerEmojiPickerSheet.show(
          context,
          maxHeight: 0.88,
          channelId: message.channelId,
          visibleTabs: const [ExpressionPickerTab.emojis],
          trackEmojiUsageOnSelect: false,
          onEmojiSelected: (emoji) =>
              _toggleReactionFromEmoji(ref, message, emoji),
        ),
      );
    case MessageAction.viewReactions:
      unawaited(showMessageReactionsSheet(context, message: message));
    case MessageAction.removeAllReactions:
      unawaited(
        showRemoveAllReactionsConfirmSheet(context, ref, messageId: message.id),
      );
    case MessageAction.markAsUnread:
      unawaited(
        ref.read(chatViewModelProvider.notifier).markMessageUnread(message.id),
      );
    case MessageAction.copyMessageLink:
      unawaited(
        copyToClipboard(
          context: context,
          value: messageLink(
            channelId: message.channelId,
            messageId: message.id,
            guildId: guildId,
          ),
        ),
      );
    case MessageAction.copyText:
      final String? mentionedUserName = message.mentionedUserIds.isEmpty
          ? null
          : watchMentionUserDisplayName(
              ref: ref,
              userId: message.mentionedUserIds.first,
              channelId: message.channelId,
            );
      final String authorName = watchMessageAuthorDisplay(
        ref: ref,
        message: message,
        guildId: guildId,
        currentUserId: currentUserId,
      ).displayName;
      final String? systemText = stringifySystemMessage(
        l10n: FluxerLocalizations.of(context),
        message: message,
        authorName: authorName,
        mentionedUserName: mentionedUserName,
        currentUserId: currentUserId,
      );
      unawaited(
        copyToClipboard(context: context, value: systemText ?? message.content),
      );
    case MessageAction.copyMessageId:
      unawaited(copyToClipboard(context: context, value: message.id));
    case MessageAction.debugMessage:
      unawaited(showMessageDebugSheet(context, message: message));
    case MessageAction.speak:
      unawaited(
        dispatchMessageAction(
          ref: ref,
          context: context,
          message: message,
          action: action,
          callbacks: const MessageActionCallbacks(),
        ),
      );
    case MessageAction.delete:
      unawaited(
        showDeleteMessageConfirmSheet(
          context,
          ref,
          message: message,
          guildId: guildId,
        ),
      );
    case MessageAction.reply:
    case MessageAction.forward:
    case MessageAction.edit:
    case MessageAction.pin:
    case MessageAction.bookmark:
    case MessageAction.suppressEmbeds:
    case MessageAction.report:
    case MessageAction.retry:
    case MessageAction.deleteFailed:
      break;
  }
}

void _toggleQuickReaction(
  WidgetRef ref,
  Message message,
  QuickReactionItem item,
) {
  final notifier = ref.read(chatViewModelProvider.notifier);
  switch (item) {
    case UnicodeQuickReaction(:final emoji):
      unawaited(notifier.toggleReaction(message.id, emoji));
    case CustomQuickReaction(:final emoji):
      unawaited(
        notifier.toggleReaction(
          message.id,
          emoji.name,
          emojiId: emoji.id,
          animated: emoji.animated,
        ),
      );
  }
}

void _toggleReactionFromEmoji(
  WidgetRef ref,
  Message message,
  FluxerSelectedEmoji emoji,
) {
  final notifier = ref.read(chatViewModelProvider.notifier);
  if (emoji.isCustom) {
    unawaited(
      notifier.toggleReaction(
        message.id,
        emoji.name,
        emojiId: emoji.emojiId,
        animated: emoji.animated,
      ),
    );
    return;
  }
  unawaited(notifier.toggleReaction(message.id, emoji.surrogates));
}
