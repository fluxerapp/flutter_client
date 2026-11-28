import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/chat/data/message_repository.dart';
import 'package:fluxer_app/features/chat/domain/chat_fullscreen_video_launch_context.dart';
import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/features/chat/domain/message_media_menu_target.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/message_actions/add_reaction_submenu.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/message_actions/context_menu/message_media_menu_groups.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/message_actions/context_menu/remove_reactions_submenu.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/message_actions/context_menu/search_provider_menu_items.dart';
import 'package:fluxer_app/features/chat/presentation/'
    'widgets/message_actions/message_bottom_sheet.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/message_actions/quick_reaction_loader.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/message_actions/quick_reaction_row.dart';
import 'package:fluxer_app/features/chat/providers/core/chat_providers.dart';
import 'package:fluxer_app/features/chat/providers/messages/message_translation_provider.dart';
import 'package:fluxer_app/features/chat/providers/messages/saved_message_provider.dart';
import 'package:fluxer_app/features/chat/utils/messages/message_action_permissions.dart';
import 'package:fluxer_app/features/input/domain/keybind_action.dart';
import 'package:fluxer_app/features/input/domain/keybind_combo.dart';
import 'package:fluxer_app/features/input/utils/keybind_menu_shortcut.dart';
import 'package:fluxer_app/features/settings/domain/search_provider_engine.dart';
import 'package:fluxer_app/features/settings/providers/preferences/advanced_preferences_provider.dart';
import 'package:fluxer_app/features/settings/providers/preferences/appearance_preferences_provider.dart';
import 'package:fluxer_app/features/settings/providers/view_models/user_settings_view_model.dart';
import 'package:fluxer_app/features/threads/presentation/create_thread_sheet.dart';
import 'package:fluxer_app/features/ui/action_menu/context_menu_widgets.dart';
import 'package:fluxer_app/features/ui/action_menu/fluxer_action_menu.dart';
import 'package:fluxer_app/features/ui/desktop_surface/fluxer_desktop_surface.dart';
import 'package:fluxer_app/features/voice/tts/fluxer_tts_provider.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/external_links/external_link_handler.dart';
import 'package:fluxer_app/shared/icons/phosphor.dart';
import 'package:fluxer_app/shared/providers/input_modality_provider.dart';
import 'package:fluxer_app/shared/utils/clipboard_utils.dart';

typedef MessageMenuSelection = ({
  MessageAction action,
  FluxerKeyModifiers modifiers,
});

const KeybindCombo _kCopySelectionCombo = KeybindCombo(
  key: 'c',
  ctrlOrMeta: true,
);

Future<MessageMenuSelection?> showMessageContextMenu(
  BuildContext context, {
  required Offset position,
  required Message message,
  required MessageActionPermissions permissions,
  required MessageActionCallbacks callbacks,
  Rect? anchorRect,
  WidgetRef? hostRef,
  ValueChanged<QuickReactionItem>? onQuickReaction,
  List<QuickReactionItem>? quickItems,
  String? quickReactionChannelId,
  String? quickReactionGuildId,
  String? linkUrl,
  String? selectedText,
  MessageMediaMenuTarget? mediaTarget,
}) {
  return pushFluxerDesktopMenu<MessageMenuSelection>(
    context,
    position: position,
    anchorRect: anchorRect,
    builder: (BuildContext menuContext, VoidCallback close) =>
        FluxerDesktopMenuPanel.fitContent(
          child: SingleChildScrollView(
            child: _MessageContextMenuItems(
              hostContext: context,
              hostRef: hostRef,
              message: message,
              permissions: permissions,
              callbacks: callbacks,
              onQuickReaction: onQuickReaction,
              quickItems: quickItems,
              quickReactionChannelId: quickReactionChannelId,
              quickReactionGuildId: quickReactionGuildId,
              linkUrl: linkUrl,
              selectedText: selectedText?.trim() ?? '',
              mediaTarget: mediaTarget,
            ),
          ),
        ),
  );
}

class _MessageContextMenuItems extends ConsumerWidget {
  const _MessageContextMenuItems({
    required this.hostContext,
    required this.message,
    required this.permissions,
    required this.callbacks,
    required this.selectedText,
    this.hostRef,
    this.onQuickReaction,
    this.quickItems,
    this.quickReactionChannelId,
    this.quickReactionGuildId,
    this.linkUrl,
    this.mediaTarget,
  });

  final BuildContext hostContext;
  final WidgetRef? hostRef;
  final Message message;
  final MessageActionPermissions permissions;
  final MessageActionCallbacks callbacks;
  final ValueChanged<QuickReactionItem>? onQuickReaction;
  final List<QuickReactionItem>? quickItems;
  final String? quickReactionChannelId;
  final String? quickReactionGuildId;
  final String? linkUrl;
  final String selectedText;
  final MessageMediaMenuTarget? mediaTarget;

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

  void _runWithHostContext(
    BuildContext menuContext,
    Future<void> Function(BuildContext hostContext) action,
  ) {
    Navigator.of(menuContext).pop();
    if (hostContext.mounted) {
      unawaited(action(hostContext));
    }
  }

  void _runOnHost(
    BuildContext menuContext,
    Future<void> Function(BuildContext hostContext, WidgetRef hostRef) action,
  ) {
    Navigator.of(menuContext).pop();
    final WidgetRef? host = hostRef;
    if (host != null && hostContext.mounted) {
      unawaited(action(hostContext, host));
    }
  }

  void _removeReactionEmoji(
    BuildContext menuContext,
    WidgetRef ref,
    Reaction reaction,
  ) {
    final MessageRepository repository = ref.read(messageRepositoryProvider);
    Navigator.of(menuContext).pop();
    unawaited(
      removeAllReactionsForEmoji(
        repository: repository,
        message: message,
        reaction: reaction,
      ),
    );
  }

  List<List<Widget>> _buildGroups(BuildContext context, WidgetRef ref) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    void select(MessageAction action, FluxerKeyModifiers modifiers) =>
        Navigator.of(
          context,
        ).pop<MessageMenuSelection>((action: action, modifiers: modifiers));
    void pop(MessageAction action) =>
        select(action, FluxerKeyModifiers.current());
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
    final Map<KeybindAction, KeybindMenuShortcut> shortcuts =
        watchKeybindMenuShortcuts(ref);
    final SearchEnginesState searchEngines = ref.watch(
      advancedPreferencesProvider.select((s) => s.searchEngines),
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
    final bool hasSelection = selectedText.isNotEmpty;
    final MessageMediaMenuTarget? media = hostRef == null ? null : mediaTarget;
    final String? link = media == null ? linkUrl?.trim() : null;

    Widget shortcutRow({
      required String label,
      required IconData icon,
      required KeybindMenuShortcut? shortcut,
      required FluxerSelectCallback onSelect,
      bool isDanger = false,
    }) {
      if (showShortcuts && shortcut != null) {
        return _ShortcutMenuItem(
          label: label,
          shortcutLabel: shortcut.label,
          activationKey: shortcut.activationKey,
          isDanger: isDanger,
          onSelect: onSelect,
        );
      }
      return ContextMenuItem(
        label: label,
        icon: icon,
        isDanger: isDanger,
        shortcut: shortcut?.activationKey,
        onTap: () => onSelect(FluxerKeyModifiers.current()),
        onSelect: onSelect,
      );
    }

    Widget item({
      required String label,
      required IconData icon,
      required MessageAction action,
      KeybindAction? keybind,
      bool isDanger = false,
    }) {
      return shortcutRow(
        label: label,
        icon: icon,
        shortcut: keybind == null ? null : shortcuts[keybind],
        isDanger: isDanger,
        onSelect: (FluxerKeyModifiers modifiers) => select(action, modifiers),
      );
    }

    void openExternal(String url) => _runWithHostContext(
      context,
      (BuildContext host) => handleExternalLinkTap(host, url),
    );

    return <List<Widget>>[
      if (!hasSelection)
        <Widget>[
          if (canReact)
            if (quickReactionChannelId != null)
              MessageQuickReactionRow(
                channelId: quickReactionChannelId!,
                guildId: quickReactionGuildId,
                menuShortcuts: true,
                onReaction: (item) {
                  onQuickReaction?.call(item);
                  Navigator.of(context).pop();
                },
              )
            else
              QuickReactionRow(
                items: quickItems ?? kQuickReactionDefaults,
                menuShortcuts: true,
                onReaction: (item) {
                  onQuickReaction?.call(item);
                  Navigator.of(context).pop();
                },
              ),
          if (canReact)
            FluxerMenuSubmenuItem(
              label: l10n.chatMessageAddReaction,
              onPressed: () => pop(MessageAction.addReaction),
              onTriggerSelect: (_) => pop(MessageAction.addReaction),
              submenuBuilder: switch (quickReactionChannelId) {
                final String channelId => (BuildContext _) => <Widget>[
                  AddReactionSubmenuItems(
                    channelId: channelId,
                    guildId: quickReactionGuildId,
                    onReaction: (QuickReactionItem item) {
                      onQuickReaction?.call(item);
                      Navigator.of(context).pop();
                    },
                    onOpenPicker: () => pop(MessageAction.addReaction),
                  ),
                ],
                null => null,
              },
            ),
          if (hasReactions && !permissions.isPreviewing)
            item(
              label: l10n.chatMessageViewReactions,
              icon: PhosphorIconsFill.users,
              action: MessageAction.viewReactions,
            ),
        ],
      if (hasSelection)
        <Widget>[
          shortcutRow(
            label: l10n.chatMessageCopySelection,
            icon: PhosphorIconsFill.copy,
            shortcut: KeybindMenuShortcut(
              label: formatKeybindComboLabel(_kCopySelectionCombo),
            ),
            onSelect: (_) => _runWithHostContext(
              context,
              (BuildContext host) =>
                  copyToClipboard(context: host, value: selectedText),
            ),
          ),
        ],
      if (hasSelection)
        buildSearchProviderMenuItems(
          l10n: l10n,
          category: searchEngines.textSearch,
          defaultLabel: l10n.chatMessageSearchWeb,
          icon: PhosphorIconsBold.magnifyingGlass,
          query: selectedText,
          onOpenUrl: openExternal,
        ),
      if (hasSelection)
        buildSearchProviderMenuItems(
          l10n: l10n,
          category: searchEngines.translators,
          defaultLabel: l10n.chatMessageTranslate,
          icon: PhosphorIconsBold.translate,
          query: selectedText,
          onOpenUrl: openExternal,
        )
      else
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
            keybind: KeybindAction.messageEdit,
          ),
        if (isUserMessage && interactive && permissions.canSendMessages)
          item(
            label: l10n.chatMessageReply,
            icon: PhosphorIconsFill.arrowBendUpLeft,
            action: MessageAction.reply,
            keybind: KeybindAction.messageReply,
          ),
        if (isUserMessage && interactive)
          item(
            label: l10n.chatMessageForward,
            icon: PhosphorIconsFill.arrowBendUpRight,
            action: MessageAction.forward,
            keybind: KeybindAction.messageForward,
          ),
        if (interactive && watchCanCreateThreadFromMessage(ref, message))
          item(
            label: l10n.threadCreate,
            icon: PhosphorIconsFill.chats,
            action: MessageAction.createThread,
          ),
        if (permissions.canPublish && !message.isCrossposted)
          item(
            label: l10n.chatMessagePublish,
            icon: PhosphorIconsFill.megaphone,
            action: MessageAction.publish,
          ),
      ],
      if (media != null)
        ...buildMessageMediaMenuGroups(
          context: context,
          ref: ref,
          target: media,
          message: message,
          permissions: permissions,
          callbacks: callbacks,
          runOnHost: (action) => _runOnHost(context, action),
        )
      else
        _buildAttachmentItems(context, showMediaDeleteButton),
      if (link != null && link.isNotEmpty)
        <Widget>[
          ContextMenuItem(
            label: l10n.chatMessageOpenLink,
            icon: PhosphorIconsFill.arrowSquareOut,
            onTap: () => openExternal(link),
          ),
          ContextMenuItem(
            label: l10n.chatMessageCopyLink,
            icon: PhosphorIconsBold.link,
            onTap: () => _runWithHostContext(
              context,
              (BuildContext host) =>
                  copyToClipboard(context: host, value: link),
            ),
          ),
        ],
      <Widget>[
        if (media == null &&
            (message.content.isNotEmpty || message.isSystemMessage))
          item(
            label: l10n.chatMessageCopyText,
            icon: PhosphorIconsFill.copy,
            action: MessageAction.copyText,
            keybind: KeybindAction.messageCopyText,
          ),
        if (media == null && message.embedsCopyableText.isNotEmpty)
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
            keybind: KeybindAction.messagePin,
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
            keybind: KeybindAction.messageBookmark,
          ),
        if (!permissions.isPreviewing)
          item(
            label: l10n.chatMessageMarkAsUnread,
            icon: PhosphorIconsFill.envelopeOpen,
            action: MessageAction.markAsUnread,
            keybind: KeybindAction.messageMarkUnread,
          ),
        if (interactive)
          item(
            label: l10n.chatMessageCopyMessageLink,
            icon: PhosphorIconsBold.link,
            action: MessageAction.copyMessageLink,
            keybind: KeybindAction.messageCopyLink,
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
            keybind: KeybindAction.messageSpeak,
          ),
        if (canShowSuppressEmbeds && showSuppressEmbedsButton)
          item(
            label: message.suppressEmbeds
                ? l10n.chatMessageUnsuppressEmbeds
                : l10n.chatMessageSuppressEmbeds,
            icon: PhosphorIconsBold.linkBreak,
            action: MessageAction.suppressEmbeds,
            keybind: KeybindAction.messageToggleEmbeds,
          ),
      ],
      <Widget>[
        if (permissions.canManageMessages && hasReactions)
          RemoveReactionsSubmenuItem(
            reactions: message.reactions,
            onRemove: (Reaction reaction) =>
                _removeReactionEmoji(context, ref, reaction),
          ),
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
            keybind: KeybindAction.messageDelete,
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
          keybind: KeybindAction.messageCopyId,
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
    required this.shortcutLabel,
    required this.onSelect,
    this.activationKey,
    this.isDanger = false,
  });

  final String label;
  final String shortcutLabel;
  final String? activationKey;
  final FluxerSelectCallback onSelect;
  final bool isDanger;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return FluxerDesktopMenuRow(
      label: label,
      onSelect: onSelect,
      shortcut: activationKey,
      isDanger: isDanger,
      trailing: Padding(
        padding: const EdgeInsetsDirectional.only(start: 8),
        child: Text(
          shortcutLabel,
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
