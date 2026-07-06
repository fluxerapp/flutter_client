import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/message_actions/quick_reaction_row.dart';
import 'package:fluxer_app/features/chat/providers/messages/saved_message_provider.dart';
import 'package:fluxer_app/features/chat/utils/message_action_permissions.dart';
import 'package:fluxer_app/features/ui/bottom_sheet/fluxer_bottom_sheet.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

enum MessageAction {
  addReaction,
  viewReactions,
  removeAllReactions,
  retry,
  edit,
  reply,
  forward,
  copyText,
  pin,
  bookmark,
  markAsUnread,
  copyMessageLink,
  suppressEmbeds,
  delete,
  deleteFailed,
  copyMessageId,
  report,
  debugMessage,
}

Future<MessageAction?> showMessageBottomSheet(
  BuildContext context, {
  required Message message,
  required bool isOwnMessage,
  required bool isDmChannel,
  required bool canDelete,
  required bool canReport,
  required bool canAddReactions,
  required bool canPinMessage,
  required bool canManageMessages,
  required bool canSendMessages,
  required bool developerMode,
  List<QuickReactionItem>? quickItems,
  ValueChanged<QuickReactionItem>? onQuickReaction,
}) {
  return FluxerBottomSheet.showScrollable<MessageAction>(
    context,
    initialChildSize: 0.6,
    minChildSize: 0.3,
    maxChildSize: 0.9,
    builder: (sheetContext, scrollController, _) => _MessageBottomSheetBody(
      message: message,
      isOwnMessage: isOwnMessage,
      isDmChannel: isDmChannel,
      canDelete: canDelete,
      canReport: canReport,
      canAddReactions: canAddReactions,
      canPinMessage: canPinMessage,
      canManageMessages: canManageMessages,
      canSendMessages: canSendMessages,
      developerMode: developerMode,
      quickItems: quickItems ?? kQuickReactionDefaults,
      onQuickReaction: onQuickReaction,
      scrollController: scrollController,
    ),
  );
}

class _MessageBottomSheetBody extends ConsumerWidget {
  final Message message;
  final bool isOwnMessage;
  final bool isDmChannel;
  final bool canDelete;
  final bool canReport;
  final bool canAddReactions;
  final bool canPinMessage;
  final bool canManageMessages;
  final bool canSendMessages;
  final bool developerMode;
  final List<QuickReactionItem> quickItems;
  final ValueChanged<QuickReactionItem>? onQuickReaction;
  final ScrollController scrollController;

  const _MessageBottomSheetBody({
    required this.message,
    required this.isOwnMessage,
    required this.isDmChannel,
    required this.canDelete,
    required this.canReport,
    required this.canAddReactions,
    required this.canPinMessage,
    required this.canManageMessages,
    required this.canSendMessages,
    required this.developerMode,
    required this.quickItems,
    required this.onQuickReaction,
    required this.scrollController,
  });

  void _pop(BuildContext context, MessageAction action) =>
      Navigator.of(context).pop(action);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = FluxerLocalizations.of(context);

    if (message.hasFailed) {
      return SingleChildScrollView(
        controller: scrollController,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: FluxerBottomSheetGroupColumn(
          children: [
            FluxerMenuGroup(
              children: [
                FluxerBottomSheetMenuItem(
                  icon: PhosphorIconsRegular.arrowClockwise,
                  label: l10n.retry,
                  onTap: () => _pop(context, MessageAction.retry),
                ),
              ],
            ),
            FluxerMenuGroup(
              children: [
                FluxerBottomSheetMenuItem(
                  icon: PhosphorIconsRegular.trash,
                  label: l10n.chatMessageDeleteFailed,
                  isDanger: true,
                  onTap: () => _pop(context, MessageAction.deleteFailed),
                ),
              ],
            ),
          ],
        ),
      );
    }

    final isSaved =
        ref.watch(isMessageSavedProvider(message.id)).value ?? false;

    final hasReactions = message.reactions.isNotEmpty;
    final isEmbedsSuppressed = message.suppressEmbeds;
    final isUserMessage = message.isUserMessage;
    final supportsInteractiveActions = message.supportsInteractiveActions;
    final canShowAddReaction = canAddReactions && supportsInteractiveActions;
    final canShowReply =
        isUserMessage && supportsInteractiveActions && canSendMessages;
    final canShowForward = isUserMessage && supportsInteractiveActions;
    final canShowEdit =
        isOwnMessage && isUserMessage && message.messageSnapshots.isEmpty;
    final canShowPin = isUserMessage && canPinMessage;
    final canShowBookmark = isUserMessage && supportsInteractiveActions;
    final canShowSuppressEmbeds = canSuppressEmbedsOnMessage(
      message: message,
      isOwnMessage: isOwnMessage,
      isDmChannel: isDmChannel,
      canDelete: canDelete,
    );
    final canShowRemoveAllReactions = canManageMessages && hasReactions;

    final reactionItems = <Widget>[
      if (canShowAddReaction)
        FluxerBottomSheetMenuItem(
          icon: PhosphorIconsRegular.smiley,
          label: l10n.chatMessageAddReaction,
          onTap: () => _pop(context, MessageAction.addReaction),
        ),
      if (hasReactions)
        FluxerBottomSheetMenuItem(
          icon: PhosphorIconsRegular.users,
          label: l10n.chatMessageViewReactions,
          onTap: () => _pop(context, MessageAction.viewReactions),
        ),
      if (canShowRemoveAllReactions)
        FluxerBottomSheetMenuItem(
          icon: PhosphorIconsRegular.smileyXEyes,
          label: l10n.chatMessageRemoveAllReactions,
          isDanger: true,
          onTap: () => _pop(context, MessageAction.removeAllReactions),
        ),
    ];

    final interactionItems = <Widget>[
      FluxerBottomSheetMenuItem(
        icon: PhosphorIconsFill.envelopeOpen,
        label: l10n.chatMessageMarkAsUnread,
        onTap: () => _pop(context, MessageAction.markAsUnread),
      ),
      if (canShowReply)
        FluxerBottomSheetMenuItem(
          icon: PhosphorIconsRegular.arrowBendUpLeft,
          label: l10n.chatMessageReply,
          onTap: () => _pop(context, MessageAction.reply),
        ),
      if (canShowForward)
        FluxerBottomSheetMenuItem(
          icon: PhosphorIconsRegular.shareFat,
          label: l10n.chatMessageForward,
          onTap: () => _pop(context, MessageAction.forward),
        ),
      if (canShowEdit)
        FluxerBottomSheetMenuItem(
          icon: PhosphorIconsRegular.pencilSimple,
          label: l10n.chatMessageEdit,
          onTap: () => _pop(context, MessageAction.edit),
        ),
    ];

    final managementItems = <Widget>[
      if (canShowPin)
        FluxerBottomSheetMenuItem(
          icon: PhosphorIconsRegular.pushPin,
          label: message.isPinned ? l10n.chatMessageUnpin : l10n.chatMessagePin,
          onTap: () => _pop(context, MessageAction.pin),
        ),
      if (canShowBookmark)
        FluxerBottomSheetMenuItem(
          icon: isSaved
              ? PhosphorIconsFill.bookmarkSimple
              : PhosphorIconsRegular.bookmarkSimple,
          label: isSaved
              ? l10n.chatMessageRemoveBookmark
              : l10n.chatMessageBookmark,
          onTap: () => _pop(context, MessageAction.bookmark),
        ),
      if (canShowSuppressEmbeds)
        FluxerBottomSheetMenuItem(
          icon: PhosphorIconsRegular.eyeSlash,
          label: isEmbedsSuppressed
              ? l10n.chatMessageUnsuppressEmbeds
              : l10n.chatMessageSuppressEmbeds,
          onTap: () => _pop(context, MessageAction.suppressEmbeds),
        ),
      if (canDelete)
        FluxerBottomSheetMenuItem(
          icon: PhosphorIconsRegular.trash,
          label: l10n.chatMessageDelete,
          isDanger: true,
          onTap: () => _pop(context, MessageAction.delete),
        ),
    ];

    final utilityItems = <Widget>[
      FluxerBottomSheetMenuItem(
        icon: PhosphorIconsRegular.link,
        label: l10n.chatMessageCopyMessageLink,
        onTap: () => _pop(context, MessageAction.copyMessageLink),
      ),
      if (message.content.isNotEmpty)
        FluxerBottomSheetMenuItem(
          icon: PhosphorIconsFill.copy,
          label: l10n.chatMessageCopyText,
          onTap: () => _pop(context, MessageAction.copyText),
        ),
      FluxerBottomSheetMenuItem(
        icon: PhosphorIconsRegular.snowflake,
        label: l10n.chatMessageCopyMessageId,
        onTap: () => _pop(context, MessageAction.copyMessageId),
      ),
      if (developerMode)
        FluxerBottomSheetMenuItem(
          icon: PhosphorIconsFill.bug,
          label: l10n.chatMessageDebug,
          onTap: () => _pop(context, MessageAction.debugMessage),
        ),
    ];

    final reportItems = <Widget>[
      if (canReport)
        FluxerBottomSheetMenuItem(
          icon: PhosphorIconsRegular.flag,
          label: l10n.chatMessageReport,
          isDanger: true,
          onTap: () => _pop(context, MessageAction.report),
        ),
    ];

    final groups = <Widget>[
      for (final items in <List<Widget>>[
        reactionItems,
        interactionItems,
        managementItems,
        utilityItems,
        reportItems,
      ])
        if (items.isNotEmpty) FluxerMenuGroup(children: items),
    ];

    final showQuickReactions = !message.isSending && canAddReactions;

    return SingleChildScrollView(
      controller: scrollController,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (showQuickReactions) ...[
            QuickReactionRow(
              items: quickItems,
              onReaction: (item) {
                onQuickReaction?.call(item);
                Navigator.of(context).pop();
              },
              onAddMore: () => _pop(context, MessageAction.addReaction),
            ),
            const SizedBox(height: 8),
          ],
          FluxerBottomSheetGroupColumn(children: groups),
        ],
      ),
    );
  }
}
