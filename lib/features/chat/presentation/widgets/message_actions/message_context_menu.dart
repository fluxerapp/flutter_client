import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/chat/domain/chat_fullscreen_video_launch_context.dart';
import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/features/chat/presentation/'
    'widgets/message_actions/message_bottom_sheet.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/message_actions/quick_reaction_loader.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/message_actions/quick_reaction_row.dart';
import 'package:fluxer_app/features/chat/providers/messages/message_translation_provider.dart';
import 'package:fluxer_app/features/chat/providers/messages/saved_message_provider.dart';
import 'package:fluxer_app/features/chat/utils/messages/message_action_permissions.dart';
import 'package:fluxer_app/features/settings/providers/preferences/appearance_preferences_provider.dart';
import 'package:fluxer_app/features/settings/providers/view_models/user_settings_view_model.dart';
import 'package:fluxer_app/features/threads/presentation/create_thread_sheet.dart';
import 'package:fluxer_app/features/ui/action_menu/context_menu_widgets.dart';
import 'package:fluxer_app/features/ui/action_menu/fluxer_action_menu.dart';
import 'package:fluxer_app/features/ui/desktop_surface/fluxer_desktop_surface.dart';
import 'package:fluxer_app/features/voice/tts/fluxer_tts_provider.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/icons/phosphor.dart';
import 'package:fluxer_app/shared/providers/input_modality_provider.dart';

Future<MessageAction?> showMessageContextMenu(
  BuildContext context, {
  required Offset position,
  required Message message,
  required MessageActionPermissions permissions,
  required MessageActionCallbacks callbacks,
  Rect? anchorRect,
  ValueChanged<QuickReactionItem>? onQuickReaction,
  List<QuickReactionItem>? quickItems,
  String? quickReactionChannelId,
  String? quickReactionGuildId,
}) {
  return pushFluxerDesktopMenu<MessageAction>(
    context,
    position: position,
    anchorRect: anchorRect,
    builder: (BuildContext menuContext, VoidCallback close) =>
        FluxerDesktopMenuPanel.fitContent(
          child: SingleChildScrollView(
            child: _MessageContextMenuItems(
              message: message,
              permissions: permissions,
              callbacks: callbacks,
              onQuickReaction: onQuickReaction,
              quickItems: quickItems,
              quickReactionChannelId: quickReactionChannelId,
              quickReactionGuildId: quickReactionGuildId,
            ),
          ),
        ),
  );
}

class _MessageContextMenuItems extends ConsumerWidget {
  const _MessageContextMenuItems({
    required this.message,
    required this.permissions,
    required this.callbacks,
    this.onQuickReaction,
    this.quickItems,
    this.quickReactionChannelId,
    this.quickReactionGuildId,
  });

  final Message message;
  final MessageActionPermissions permissions;
  final MessageActionCallbacks callbacks;
  final ValueChanged<QuickReactionItem>? onQuickReaction;
  final List<QuickReactionItem>? quickItems;
  final String? quickReactionChannelId;
  final String? quickReactionGuildId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<List<Widget>> groups = _buildGroups(
      context,
      ref,
    ).where((List<Widget> group) => group.isNotEmpty).toList();
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        for (int i = 0; i < groups.length; i++) ...<Widget>[
          if (i > 0) const FluxerDesktopMenuSeparator(),
          ...groups[i],
        ],
      ],
    );
  }

  List<List<Widget>> _buildGroups(BuildContext context, WidgetRef ref) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    void pop(MessageAction action) => Navigator.of(context).pop(action);
    if (message.hasFailed) {
      return <List<Widget>>[
        <Widget>[
          ContextMenuItem(
            label: l10n.retry,
            icon: PhosphorIconsFill.arrowsClockwise,
            onTap: () => pop(MessageAction.retry),
          ),
          if (message.content.isNotEmpty)
            ContextMenuItem(
              label: l10n.chatMessageCopyText,
              icon: PhosphorIconsFill.copy,
              onTap: () => pop(MessageAction.copyText),
            ),
        ],
        <Widget>[
          ContextMenuItem(
            label: l10n.chatMessageDeleteFailed,
            icon: PhosphorIconsFill.trash,
            isDanger: true,
            onTap: () => pop(MessageAction.deleteFailed),
          ),
        ],
      ];
    }
    final bool showShortcuts =
        !isTouchPrimaryInput(ref) &&
        ref.watch(
          appearancePreferencesProvider.select(
            (s) => s.showContextMenuShortcuts,
          ),
        );
    final bool isUserMessage = message.isUserMessage;
    final bool interactive = message.supportsInteractiveActions;
    final bool isSaved =
        ref.watch(isMessageSavedProvider(message.id)).value ?? false;
    final bool canShowSuppressEmbeds = canSuppressEmbedsOnMessage(
      message: message,
      isOwnMessage: permissions.isOwnMessage,
      isDmChannel: permissions.isDmChannel,
      canDelete: permissions.canDelete,
    );
    final bool showMediaDeleteButton = ref.watch(
      appearancePreferencesProvider.select((s) => s.showMediaDeleteButton),
    );
    final bool showSuppressEmbedsButton = ref.watch(
      appearancePreferencesProvider.select((s) => s.showSuppressEmbedsButton),
    );
    final bool developerMode = ref.watch(
      userSettingsViewModelProvider.select((s) => s.developerMode),
    );
    final bool isSpeakingMessage = ref.watch(
      fluxerTtsServiceProvider.select(
        (FluxerTtsSpeakingState state) => state.isSpeakingMessage(message.id),
      ),
    );
    final bool hasReactions = message.reactions.isNotEmpty;
    final bool canReact =
        !message.isSending && permissions.canAddReactions && interactive;

    Widget item({
      required String label,
      required IconData icon,
      required MessageAction action,
      String? shortcut,
      bool isDanger = false,
    }) {
      if (showShortcuts && shortcut != null) {
        return _ShortcutMenuItem(
          label: label,
          shortcut: shortcut,
          isDanger: isDanger,
          onTap: () => pop(action),
        );
      }
      return ContextMenuItem(
        label: label,
        icon: icon,
        isDanger: isDanger,
        onTap: () => pop(action),
      );
    }

    return <List<Widget>>[
      <Widget>[
        if (canReact)
          if (quickReactionChannelId != null)
            MessageQuickReactionRow(
              channelId: quickReactionChannelId!,
              guildId: quickReactionGuildId,
              onReaction: (item) {
                onQuickReaction?.call(item);
                Navigator.of(context).pop();
              },
            )
          else
            QuickReactionRow(
              items: quickItems ?? kQuickReactionDefaults,
              onReaction: (item) {
                onQuickReaction?.call(item);
                Navigator.of(context).pop();
              },
            ),
        if (canReact)
          FluxerMenuSubmenuItem(
            label: l10n.chatMessageAddReaction,
            onPressed: () => pop(MessageAction.addReaction),
          ),
        if (hasReactions)
          item(
            label: l10n.chatMessageViewReactions,
            icon: PhosphorIconsFill.users,
            action: MessageAction.viewReactions,
          ),
      ],
      <Widget>[
        if (watchCanOfferMessageTranslate(ref, message))
          item(
            label: l10n.chatMessageTranslate,
            icon: PhosphorIconsBold.translate,
            action: MessageAction.translate,
          ),
      ],
      <Widget>[
        if (permissions.isOwnMessage &&
            isUserMessage &&
            message.messageSnapshots.isEmpty)
          item(
            label: l10n.chatMessageEdit,
            icon: PhosphorIconsFill.pencilSimple,
            action: MessageAction.edit,
            shortcut: 'E',
          ),
        if (isUserMessage && interactive && permissions.canSendMessages)
          item(
            label: l10n.chatMessageReply,
            icon: PhosphorIconsFill.arrowBendUpLeft,
            action: MessageAction.reply,
            shortcut: 'R',
          ),
        if (isUserMessage && interactive)
          item(
            label: l10n.chatMessageForward,
            icon: PhosphorIconsFill.arrowBendUpRight,
            action: MessageAction.forward,
          ),
        if (interactive && watchCanCreateThreadFromMessage(ref, message))
          item(
            label: l10n.threadCreate,
            icon: PhosphorIconsFill.chats,
            action: MessageAction.createThread,
          ),
        if (permissions.canPublish)
          item(
            label: message.isCrossposted
                ? l10n.chatMessagePublished
                : l10n.chatMessagePublish,
            icon: PhosphorIconsFill.megaphone,
            action: MessageAction.publish,
          ),
      ],
      _buildAttachmentItems(context, showMediaDeleteButton),
      <Widget>[
        if (message.content.isNotEmpty)
          item(
            label: l10n.chatMessageCopyText,
            icon: PhosphorIconsFill.copy,
            action: MessageAction.copyText,
          ),
        if (message.embedsCopyableText.isNotEmpty)
          item(
            label: l10n.chatMessageCopyEmbedText,
            icon: PhosphorIconsFill.textAlignLeft,
            action: MessageAction.copyEmbedText,
          ),
        if (isUserMessage && permissions.canPinMessage)
          item(
            label: message.isPinned
                ? l10n.chatMessageUnpin
                : l10n.chatMessagePin,
            icon: PhosphorIconsFill.pushPin,
            action: MessageAction.pin,
            shortcut: 'P',
          ),
        if (isUserMessage && interactive)
          item(
            label: isSaved
                ? l10n.chatMessageRemoveBookmark
                : l10n.chatMessageBookmark,
            icon: isSaved
                ? PhosphorIconsFill.bookmarkSimple
                : PhosphorIconsRegular.bookmarkSimple,
            action: MessageAction.bookmark,
          ),
        item(
          label: l10n.chatMessageMarkAsUnread,
          icon: PhosphorIconsFill.envelopeOpen,
          action: MessageAction.markAsUnread,
        ),
        if (interactive)
          item(
            label: l10n.chatMessageCopyMessageLink,
            icon: PhosphorIconsBold.link,
            action: MessageAction.copyMessageLink,
          ),
        if (message.speakableContent.trim().isNotEmpty)
          item(
            label: isSpeakingMessage
                ? l10n.chatMessageStopSpeaking
                : l10n.chatMessageSpeak,
            icon: isSpeakingMessage
                ? PhosphorIconsFill.stopCircle
                : PhosphorIconsFill.speakerHigh,
            action: MessageAction.speak,
          ),
        if (canShowSuppressEmbeds && showSuppressEmbedsButton)
          item(
            label: message.suppressEmbeds
                ? l10n.chatMessageUnsuppressEmbeds
                : l10n.chatMessageSuppressEmbeds,
            icon: PhosphorIconsBold.linkBreak,
            action: MessageAction.suppressEmbeds,
          ),
      ],
      <Widget>[
        if (permissions.canManageMessages && hasReactions)
          item(
            label: l10n.chatMessageRemoveAllReactions,
            icon: PhosphorIconsBold.x,
            action: MessageAction.removeAllReactions,
            isDanger: true,
          ),
        if (permissions.canDelete)
          item(
            label: l10n.chatMessageDelete,
            icon: PhosphorIconsFill.trash,
            action: MessageAction.delete,
            isDanger: true,
          ),
        if (permissions.canReport)
          item(
            label: l10n.chatMessageReport,
            icon: PhosphorIconsFill.flag,
            action: MessageAction.report,
            isDanger: true,
          ),
      ],
      <Widget>[
        item(
          label: l10n.chatMessageCopyMessageId,
          icon: PhosphorIconsRegular.snowflake,
          action: MessageAction.copyMessageId,
        ),
        if (developerMode)
          item(
            label: l10n.chatMessageDebug,
            icon: PhosphorIconsFill.bug,
            action: MessageAction.debugMessage,
          ),
      ],
    ];
  }

  List<Widget> _buildAttachmentItems(
    BuildContext context,
    bool showMediaDeleteButton,
  ) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final List<Widget> items = <Widget>[];
    for (final Attachment attachment in message.attachments) {
      if (showMediaDeleteButton &&
          canDeleteAttachmentOnMessage(
            message: message,
            isOwnMessage: permissions.isOwnMessage,
            isSendDisabled: permissions.isSendDisabled,
          )) {
        items.add(
          ContextMenuItem(
            label: l10n.chatMessageDeleteAttachment,
            icon: PhosphorIconsFill.trash,
            isDanger: true,
            onTap: () {
              callbacks.onDeleteAttachment?.call(attachment);
              Navigator.of(context).pop();
            },
          ),
        );
      }
      if (canEditAttachmentAltText(
        message: message,
        isOwnMessage: permissions.isOwnMessage,
        attachment: attachment,
        canManageMessages: permissions.canManageMessages,
        isDmChannel: permissions.isDmChannel,
      )) {
        items.add(
          ContextMenuItem(
            label: l10n.chatMessageEditAttachmentAltText,
            icon: PhosphorIconsFill.pencilSimple,
            onTap: () {
              Navigator.of(context).pop();
              callbacks.onEditAttachmentAltText?.call(attachment);
            },
          ),
        );
      }
    }
    return items;
  }
}

class _ShortcutMenuItem extends StatelessWidget {
  const _ShortcutMenuItem({
    required this.label,
    required this.shortcut,
    required this.onTap,
    this.isDanger = false,
  });

  final String label;
  final String shortcut;
  final VoidCallback onTap;
  final bool isDanger;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return FluxerDesktopMenuRow(
      label: label,
      onTap: onTap,
      isDanger: isDanger,
      trailing: Padding(
        padding: const EdgeInsetsDirectional.only(start: 8),
        child: Text(
          shortcut,
          softWrap: false,
          style: context.textStyles.label.copyWith(
            fontSize: 12,
            color: isDanger
                ? fluxerDesktopMenuDangerText(colors)
                : colors.textPrimaryMuted,
          ),
        ),
      ),
    );
  }
}
