import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/core/router/route_state_providers.dart';
import 'package:fluxer_app/features/chat/domain/chat_fullscreen_video_launch_context.dart';
import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/features/chat/presentation/sheets/message_debug_sheet.dart';
import 'package:fluxer_app/features/chat/presentation/sheets/message_reactions_sheet.dart';
import 'package:fluxer_app/features/chat/presentation/sheets/unpin_message_confirm_sheet.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/message_actions/quick_reaction_row.dart';
import 'package:fluxer_app/features/chat/providers/channel/channel_details_providers.dart';
import 'package:fluxer_app/features/chat/providers/core/chat_providers.dart';
import 'package:fluxer_app/features/chat/providers/messages/saved_message_provider.dart';
import 'package:fluxer_app/features/chat/utils/message_action_permissions.dart';
import 'package:fluxer_app/features/chat/utils/message_link.dart';
import 'package:fluxer_app/features/messaging/data/saved_messages_repository.dart';
import 'package:fluxer_app/features/messaging/providers/saved_messages_sync_provider.dart';
import 'package:fluxer_app/features/settings/providers/advanced_preferences_provider.dart';
import 'package:fluxer_app/features/settings/providers/appearance_preferences_provider.dart';
import 'package:fluxer_app/features/ui/bottom_sheet/fluxer_bottom_sheet.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/shared/utils/clipboard_utils.dart';
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
  MessageActionCallbacks? attachmentCallbacks,
  bool isSendDisabled = false,
}) {
  final MessageActionPermissions permissions = MessageActionPermissions(
    isOwnMessage: isOwnMessage,
    isDmChannel: isDmChannel,
    canDelete: canDelete,
    canReport: canReport,
    canAddReactions: canAddReactions,
    canPinMessage: canPinMessage,
    canManageMessages: canManageMessages,
    canSendMessages: canSendMessages,
    developerMode: developerMode,
    isSendDisabled: isSendDisabled,
  );
  return FluxerBottomSheet.showScrollable<MessageAction>(
    context,
    initialChildSize: 0.6,
    minChildSize: 0.3,
    maxChildSize: 0.9,
    builder: (sheetContext, scrollController, _) => _MessageBottomSheetBody(
      message: message,
      permissions: permissions,
      quickItems: quickItems ?? kQuickReactionDefaults,
      onQuickReaction: onQuickReaction,
      attachmentCallbacks: attachmentCallbacks,
      scrollController: scrollController,
    ),
  );
}

Future<void> dispatchMessageAction({
  required WidgetRef ref,
  required BuildContext context,
  required Message message,
  required MessageAction action,
  required MessageActionCallbacks callbacks,
  String? previewRoleGuildId,
}) async {
  switch (action) {
    case MessageAction.reply:
      callbacks.onReply?.call();
    case MessageAction.forward:
      callbacks.onForward?.call();
    case MessageAction.edit:
      callbacks.onEdit?.call();
    case MessageAction.delete:
      callbacks.onDelete?.call();
    case MessageAction.retry:
      callbacks.onRetry?.call();
    case MessageAction.deleteFailed:
      callbacks.onDeleteFailed?.call();
    case MessageAction.copyText:
      unawaited(copyToClipboard(context: context, value: message.content));
    case MessageAction.copyMessageId:
      unawaited(copyToClipboard(context: context, value: message.id));
    case MessageAction.copyMessageLink:
      final String? guildId =
          previewRoleGuildId ?? ref.read(contextualGuildIdProvider);
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
    case MessageAction.bookmark:
      final SavedMessagesRepository repository = ref.read(
        savedMessagesRepositoryProvider,
      );
      final String messageId = message.id;
      final String channelId = message.channelId;
      unawaited(() async {
        if (await ref
            .read(fluxerDatabaseProvider)
            .savedMessageDao
            .isSaved(messageId)) {
          await repository.unsaveMessage(messageId);
        } else {
          await repository.saveMessage(
            channelId: channelId,
            messageId: messageId,
          );
        }
      }());
    case MessageAction.pin:
      final String channelId = message.channelId;
      final String messageId = message.id;
      if (message.isPinned) {
        unawaited(
          showUnpinMessageConfirmSheet(
            context,
            ref,
            channelId: channelId,
            messageId: messageId,
          ),
        );
      } else {
        unawaited(
          ref
              .read(channelPinsRepositoryProvider)
              .pinMessage(channelId: channelId, messageId: messageId),
        );
      }
    case MessageAction.addReaction:
      callbacks.onAddReaction?.call();
    case MessageAction.markAsUnread:
      callbacks.onMarkAsUnread?.call();
    case MessageAction.suppressEmbeds:
      final repo = ref.read(messageRepositoryProvider);
      final String channelId = message.channelId;
      final String messageId = message.id;
      final int nextFlags = message.suppressEmbeds
          ? message.flags & ~messageFlagSuppressEmbeds
          : message.flags | messageFlagSuppressEmbeds;
      unawaited(
        repo.setMessageFlags(
          channelId: channelId,
          messageId: messageId,
          flags: nextFlags,
        ),
      );
    case MessageAction.viewReactions:
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!context.mounted) {
          return;
        }
        unawaited(showMessageReactionsSheet(context, message: message));
      });
    case MessageAction.removeAllReactions:
      callbacks.onRemoveAllReactions?.call();
    case MessageAction.report:
      callbacks.onReport?.call();
    case MessageAction.debugMessage:
      unawaited(showMessageDebugSheet(context, message: message));
  }
}

List<Widget> buildMessageActionMenuGroups({
  required BuildContext context,
  required WidgetRef ref,
  required Message message,
  required MessageActionPermissions permissions,
  required ValueChanged<MessageAction> onAction,
  MessageActionCallbacks? attachmentCallbacks,
  String? attachmentIdFilter,
  VoidCallback? onCloseMenu,
}) {
  final FluxerLocalizations l10n = FluxerLocalizations.of(context);

  if (message.hasFailed) {
    return <Widget>[
      FluxerMenuGroup(
        children: <Widget>[
          FluxerBottomSheetMenuItem(
            icon: PhosphorIconsBold.arrowClockwise,
            label: l10n.retry,
            onTap: () => onAction(MessageAction.retry),
          ),
        ],
      ),
      FluxerMenuGroup(
        children: <Widget>[
          FluxerBottomSheetMenuItem(
            icon: PhosphorIconsFill.trash,
            label: l10n.chatMessageDeleteFailed,
            isDanger: true,
            onTap: () => onAction(MessageAction.deleteFailed),
          ),
        ],
      ),
    ];
  }

  final bool isSaved =
      ref.watch(isMessageSavedProvider(message.id)).value ?? false;
  final bool hasReactions = message.reactions.isNotEmpty;
  final bool isEmbedsSuppressed = message.suppressEmbeds;
  final bool isUserMessage = message.isUserMessage;
  final bool supportsInteractiveActions = message.supportsInteractiveActions;
  final bool canShowAddReaction =
      permissions.canAddReactions && supportsInteractiveActions;
  final bool showMediaDeleteButton = ref.watch(
    appearancePreferencesProvider.select((s) => s.showMediaDeleteButton),
  );
  final bool showSuppressEmbedsButton = ref.watch(
    appearancePreferencesProvider.select((s) => s.showSuppressEmbedsButton),
  );
  final bool canShowReply =
      isUserMessage &&
      supportsInteractiveActions &&
      permissions.canSendMessages;
  final bool canShowForward = isUserMessage && supportsInteractiveActions;
  final bool canShowEdit =
      permissions.isOwnMessage &&
      isUserMessage &&
      message.messageSnapshots.isEmpty;
  final bool canShowPin = isUserMessage && permissions.canPinMessage;
  final bool canShowBookmark = isUserMessage && supportsInteractiveActions;
  final bool canShowSuppressEmbeds = canSuppressEmbedsOnMessage(
    message: message,
    isOwnMessage: permissions.isOwnMessage,
    isDmChannel: permissions.isDmChannel,
    canDelete: permissions.canDelete,
  );
  final bool canShowRemoveAllReactions =
      permissions.canManageMessages && hasReactions;

  final List<Widget> reactionItems = <Widget>[
    if (canShowAddReaction)
      FluxerBottomSheetMenuItem(
        icon: PhosphorIconsFill.smiley,
        label: l10n.chatMessageAddReaction,
        onTap: () => onAction(MessageAction.addReaction),
      ),
    if (hasReactions)
      FluxerBottomSheetMenuItem(
        icon: PhosphorIconsFill.users,
        label: l10n.chatMessageViewReactions,
        onTap: () => onAction(MessageAction.viewReactions),
      ),
    if (canShowRemoveAllReactions)
      FluxerBottomSheetMenuItem(
        icon: PhosphorIconsBold.x,
        label: l10n.chatMessageRemoveAllReactions,
        isDanger: true,
        onTap: () => onAction(MessageAction.removeAllReactions),
      ),
  ];

  final List<Widget> interactionItems = <Widget>[
    FluxerBottomSheetMenuItem(
      icon: PhosphorIconsFill.envelopeOpen,
      label: l10n.chatMessageMarkAsUnread,
      onTap: () => onAction(MessageAction.markAsUnread),
    ),
    if (canShowReply)
      FluxerBottomSheetMenuItem(
        icon: PhosphorIconsFill.arrowBendUpLeft,
        label: l10n.chatMessageReply,
        onTap: () => onAction(MessageAction.reply),
      ),
    if (canShowForward)
      FluxerBottomSheetMenuItem(
        icon: PhosphorIconsFill.shareFat,
        label: l10n.chatMessageForward,
        onTap: () => onAction(MessageAction.forward),
      ),
    if (canShowEdit)
      FluxerBottomSheetMenuItem(
        icon: PhosphorIconsFill.pencilSimple,
        label: l10n.chatMessageEdit,
        onTap: () => onAction(MessageAction.edit),
      ),
  ];

  final List<Widget> managementItems = <Widget>[
    if (canShowPin)
      FluxerBottomSheetMenuItem(
        icon: PhosphorIconsFill.pushPin,
        label: message.isPinned ? l10n.chatMessageUnpin : l10n.chatMessagePin,
        onTap: () => onAction(MessageAction.pin),
      ),
    if (canShowBookmark)
      FluxerBottomSheetMenuItem(
        icon: PhosphorIconsFill.bookmarkSimple,
        label: isSaved
            ? l10n.chatMessageRemoveBookmark
            : l10n.chatMessageBookmark,
        onTap: () => onAction(MessageAction.bookmark),
      ),
    if (canShowSuppressEmbeds && showSuppressEmbedsButton)
      FluxerBottomSheetMenuItem(
        icon: PhosphorIconsBold.eyeSlash,
        label: isEmbedsSuppressed
            ? l10n.chatMessageUnsuppressEmbeds
            : l10n.chatMessageSuppressEmbeds,
        onTap: () => onAction(MessageAction.suppressEmbeds),
      ),
    if (permissions.canDelete)
      FluxerBottomSheetMenuItem(
        icon: PhosphorIconsFill.trash,
        label: l10n.chatMessageDelete,
        isDanger: true,
        onTap: () => onAction(MessageAction.delete),
      ),
  ];

  final void Function() closeMenu =
      onCloseMenu ?? () => Navigator.of(context).pop();

  final List<Widget> attachmentItems = <Widget>[
    for (final Attachment attachment in message.attachments)
      if (attachmentIdFilter == null ||
          attachment.id == attachmentIdFilter) ...<Widget>[
        if (showMediaDeleteButton &&
            canDeleteAttachmentOnMessage(
              message: message,
              isOwnMessage: permissions.isOwnMessage,
              isSendDisabled: permissions.isSendDisabled,
            ))
          FluxerBottomSheetMenuItem(
            icon: PhosphorIconsFill.trash,
            label: l10n.chatMessageDeleteAttachment,
            hint: attachment.filename,
            isDanger: true,
            onTap: () {
              attachmentCallbacks?.onDeleteAttachment?.call(attachment);
              closeMenu();
            },
          ),
        if (canEditAttachmentAltText(
          message: message,
          isOwnMessage: permissions.isOwnMessage,
          attachment: attachment,
          canManageMessages: permissions.canManageMessages,
          isDmChannel: permissions.isDmChannel,
        ))
          FluxerBottomSheetMenuItem(
            icon: PhosphorIconsFill.pencilSimple,
            label: l10n.chatMessageEditAttachmentAltText,
            hint: attachment.filename,
            onTap: () {
              attachmentCallbacks?.onEditAttachmentAltText?.call(attachment);
              closeMenu();
            },
          ),
      ],
  ];

  final List<Widget> utilityItems = <Widget>[
    FluxerBottomSheetMenuItem(
      icon: PhosphorIconsBold.link,
      label: l10n.chatMessageCopyMessageLink,
      onTap: () => onAction(MessageAction.copyMessageLink),
    ),
    if (message.content.isNotEmpty)
      FluxerBottomSheetMenuItem(
        icon: PhosphorIconsFill.copy,
        label: l10n.chatMessageCopyText,
        onTap: () => onAction(MessageAction.copyText),
      ),
    FluxerBottomSheetMenuItem(
      icon: PhosphorIconsBold.snowflake,
      label: l10n.chatMessageCopyMessageId,
      onTap: () => onAction(MessageAction.copyMessageId),
    ),
    if (permissions.developerMode)
      FluxerBottomSheetMenuItem(
        icon: PhosphorIconsFill.bug,
        label: l10n.chatMessageDebug,
        onTap: () => onAction(MessageAction.debugMessage),
      ),
  ];

  final List<Widget> reportItems = <Widget>[
    if (permissions.canReport)
      FluxerBottomSheetMenuItem(
        icon: PhosphorIconsFill.flag,
        label: l10n.chatMessageReport,
        isDanger: true,
        onTap: () => onAction(MessageAction.report),
      ),
  ];

  return <Widget>[
    for (final List<Widget> items in <List<Widget>>[
      reactionItems,
      interactionItems,
      managementItems,
      attachmentItems,
      utilityItems,
      reportItems,
    ])
      if (items.isNotEmpty) FluxerMenuGroup(children: items),
  ];
}

class _MessageBottomSheetBody extends ConsumerWidget {
  const _MessageBottomSheetBody({
    required this.message,
    required this.permissions,
    required this.quickItems,
    required this.scrollController,
    this.onQuickReaction,
    this.attachmentCallbacks,
  });

  final Message message;
  final MessageActionPermissions permissions;
  final List<QuickReactionItem> quickItems;
  final ValueChanged<QuickReactionItem>? onQuickReaction;
  final MessageActionCallbacks? attachmentCallbacks;
  final ScrollController scrollController;

  void _pop(BuildContext context, MessageAction action) =>
      Navigator.of(context).pop(action);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<Widget> groups = buildMessageActionMenuGroups(
      context: context,
      ref: ref,
      message: message,
      permissions: permissions,
      onAction: (MessageAction action) => _pop(context, action),
      attachmentCallbacks: attachmentCallbacks,
    );
    final bool showQuickReactions =
        !message.hasFailed &&
        !message.isSending &&
        permissions.canAddReactions &&
        ref.watch(
          advancedPreferencesProvider.select(
            (state) => state.showMessageActionBarQuickReactions,
          ),
        );

    return SingleChildScrollView(
      controller: scrollController,
      padding: FluxerBottomSheet.scrollViewPadding(
        context,
        padding: const EdgeInsets.symmetric(horizontal: 16),
      ),
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

bool shouldCloseMediaViewerForMessageAction(MessageAction action) {
  return switch (action) {
    MessageAction.reply ||
    MessageAction.forward ||
    MessageAction.edit ||
    MessageAction.delete ||
    MessageAction.report ||
    MessageAction.viewReactions ||
    MessageAction.addReaction => true,
    _ => false,
  };
}
