import 'dart:async';

import 'package:cached_network_image_ce/cached_network_image.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/media/fluxer_media_url.dart';
import 'package:fluxer_app/core/router/route_state_providers.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/chat/domain/chat_fullscreen_video_launch_context.dart';
import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/features/chat/domain/message_translation.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/attachments/attachment_list_renderer.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/embeds/embed_gift.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/embeds/embed_image.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/embeds/embed_invite.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/embeds/embed_link.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/embeds/embed_rich.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/embeds/embed_theme.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/embeds/embed_video.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/media/embed_animated_image.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/message_actions/message_bottom_sheet.dart';
import 'package:fluxer_app/features/chat/presentation/'
    'widgets/message_actions/message_context_menu.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/message_actions/quick_reaction_loader.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/message_actions/quick_reaction_row.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/message_actions/reply_preview.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/message_actions/swipe_to_reply.dart';
import 'package:fluxer_app/features/chat/presentation/'
    'widgets/messages/forward_indicator.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/messages/forwarded_message_content.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/messages/message_markdown.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/messages/message_reactions_bar.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/messages/message_row_layout.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/messages/message_translation_indicator.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/messages/spoiler_overlay.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/pickers/expression_picker.dart';
import 'package:fluxer_app/features/chat/providers/core/chat_view_model.dart';
import 'package:fluxer_app/features/chat/providers/messages/message_translation_provider.dart';
import 'package:fluxer_app/features/chat/providers/messages/spoiler_reveal_provider.dart';
import 'package:fluxer_app/features/chat/utils/embed_gallery_utils.dart';
import 'package:fluxer_app/features/chat/utils/message_accessibility_summary.dart';
import 'package:fluxer_app/features/chat/utils/message_timestamp_format.dart';
import 'package:fluxer_app/features/chat/utils/spoiler_utils.dart';
import 'package:fluxer_app/features/chat/utils/uploading_attachment_utils.dart';
import 'package:fluxer_app/features/dm/domain/dm_channel_types.dart';
import 'package:fluxer_app/features/input/providers/focused_message_provider.dart';
import 'package:fluxer_app/features/input/providers/keyboard_mode_provider.dart';
import 'package:fluxer_app/features/profile/presentation/user_profile_sheet.dart';
import 'package:fluxer_app/features/settings/providers/advanced_preferences_provider.dart';
import 'package:fluxer_app/features/settings/providers/appearance_preferences_provider.dart';
import 'package:fluxer_app/features/settings/providers/chat_preferences_provider.dart';
import 'package:fluxer_app/features/settings/providers/use_12_hour_time_format_provider.dart';
import 'package:fluxer_app/features/settings/providers/user_settings_view_model.dart';
import 'package:fluxer_app/features/shell/presentation/responsive_layout.dart';
import 'package:fluxer_app/features/ui/ui.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/shared/markdown/message_markdown_settings.dart';
import 'package:fluxer_app/shared/providers/guild_user_display_provider.dart';
import 'package:fluxer_app/shared/providers/input_modality_provider.dart';
import 'package:fluxer_app/shared/providers/member_role_color.dart';
import 'package:fluxer_app/shared/utils/fluxer_haptics.dart';
import 'package:fluxer_app/shared/utils/guild_user_display.dart';
import 'package:fluxer_dart/export.dart';
import 'package:fluxer_markdown/fluxer_markdown.dart';
import 'package:material_ui/material_ui.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

/// Mention highlight color matching web app's
/// `--message-mention-color: rgb(234 197 50)`.
const _kMentionColor = Color.from(
  alpha: 1,
  red: 234 / 255,
  green: 197 / 255,
  blue: 50 / 255,
);

/// Jump highlight background matching web `--message-reply-bg`.
const _kJumpHighlightBg = Color.fromRGBO(59, 130, 246, 0.1);

const _kJumpHighlightBarWidth = 2.0;
const _kJumpHighlightFadeCurve = Cubic(0.32, 0.72, 0, 1);

/// Height of the compact reply-preview row.
const _kReplyRowHeight = 20.0;

/// Gap between the reply-preview row and the main message
/// row (avatar).
const _kReplyBottomGap = 4.0;

/// Horizontal gap between the end of the connector line
/// and the reply content.
const _kReplyLineEndGap = 6.0;

const _kMessageStickerSize = 160.0;
const _kMessageStickerRequestSize = 320;
const double _kMessageSendingOpacity = 0.5;

/// Immutable bundle of per-list render settings hoisted out of [MessageItem].
///
/// The chat message list watches the underlying settings providers once and
/// threads this bundle to every row, so rows neither subscribe to those
/// providers individually nor rebuild when an unrelated row hovers. Inbox and
/// preview sites that build a [MessageItem] without a bundle fall back to
/// per-row `ref.watch` reads.
@immutable
class MessageRenderSettings {
  const MessageRenderSettings({
    required this.activeGuildId,
    required this.renderEmbeds,
    required this.renderReactions,
    required this.inlineAttachmentMedia,
    required this.renderSpoilers,
    required this.revealSpoilers,
    required this.chatPreferences,
    required this.messageGroupSpacing,
    this.messageDisplayCompact = false,
    this.showUserAvatarsInCompactMode = false,
    this.markdown = MessageMarkdownSettings.defaults,
  });

  final String? activeGuildId;
  final bool renderEmbeds;
  final bool renderReactions;
  final bool inlineAttachmentMedia;
  final RenderSpoilers renderSpoilers;
  final bool revealSpoilers;
  final ChatPreferencesState chatPreferences;
  final double messageGroupSpacing;
  final bool messageDisplayCompact;
  final bool showUserAvatarsInCompactMode;
  final MessageMarkdownSettings markdown;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MessageRenderSettings &&
          runtimeType == other.runtimeType &&
          activeGuildId == other.activeGuildId &&
          renderEmbeds == other.renderEmbeds &&
          renderReactions == other.renderReactions &&
          inlineAttachmentMedia == other.inlineAttachmentMedia &&
          renderSpoilers == other.renderSpoilers &&
          revealSpoilers == other.revealSpoilers &&
          chatPreferences == other.chatPreferences &&
          messageGroupSpacing == other.messageGroupSpacing &&
          messageDisplayCompact == other.messageDisplayCompact &&
          showUserAvatarsInCompactMode == other.showUserAvatarsInCompactMode &&
          markdown == other.markdown;

  @override
  int get hashCode => Object.hash(
    activeGuildId,
    renderEmbeds,
    renderReactions,
    inlineAttachmentMedia,
    renderSpoilers,
    revealSpoilers,
    chatPreferences,
    messageGroupSpacing,
    messageDisplayCompact,
    showUserAvatarsInCompactMode,
    markdown,
  );
}

/// A single message row -- avatar, username, timestamp,
/// content, embeds, reactions, and action buttons on hover.
///
/// When the message is a reply, a compact preview of the
/// replied-to message is rendered above, with a curved
/// connector line from the replier's avatar to the reply
/// preview (matching Discord's layout).
class MessageItem extends ConsumerStatefulWidget {
  final Message message;
  final bool isGrouped;
  final String? currentUserId;
  final VoidCallback? onReply;
  final VoidCallback? onForward;
  final VoidCallback? onEdit;
  final VoidCallback? onDelete;
  final VoidCallback? onRemoveAllReactions;
  final bool canDelete;
  final bool canAddReactions;
  final bool canPinMessage;
  final bool canManageMessages;
  final bool canSendMessages;
  final bool isDmChannel;
  final VoidCallback? onRetry;
  final VoidCallback? onDeleteFailed;
  final VoidCallback? onDismissClientSystem;
  final VoidCallback? onMarkAsUnread;
  final VoidCallback? onReport;
  final ReactionToggleCallback? onReaction;
  final ValueChanged<Attachment>? onDeleteAttachment;
  final ValueChanged<Attachment>? onEditAttachmentAltText;
  final bool inboxPreviewMode;
  final bool hideMentionHighlight;
  final bool isJumpHighlighted;
  final bool isSendDisabled;

  /// False in compact drawer peek; set by the message list.
  final bool swipeToReplyEnabled;

  /// When set, resolves author guild role highlight for inbox previews
  /// (active guild sheet may differ from the channel's guild).
  final String? previewRoleGuildId;

  /// Per-list render settings hoisted by the chat message list. When null
  /// (inbox and preview sites), the row reads each setting via its own
  /// `ref.watch`.
  final MessageRenderSettings? renderSettings;

  const MessageItem({
    required this.message,
    this.isGrouped = false,
    this.currentUserId,
    this.onReply,
    this.onForward,
    this.onEdit,
    this.onDelete,
    this.onRemoveAllReactions,
    this.canDelete = false,
    this.canAddReactions = true,
    this.canPinMessage = false,
    this.canManageMessages = false,
    this.canSendMessages = true,
    this.isDmChannel = false,
    this.isSendDisabled = false,
    this.onRetry,
    this.onDeleteFailed,
    this.onDismissClientSystem,
    this.onMarkAsUnread,
    this.onReport,
    this.onReaction,
    this.onDeleteAttachment,
    this.onEditAttachmentAltText,
    this.inboxPreviewMode = false,
    this.hideMentionHighlight = false,
    this.isJumpHighlighted = false,
    this.swipeToReplyEnabled = true,
    this.previewRoleGuildId,
    this.renderSettings,
    super.key,
  });

  @override
  ConsumerState<MessageItem> createState() => _MessageItemState();
}

class _MessageItemState extends ConsumerState<MessageItem> {
  final _hovered = ValueNotifier<bool>(false);
  final _reactionPickerKey = GlobalKey<FluxerEmojiPickerPopoutState>();
  final _spoilerSyncController = FluxerSpoilerSyncController();
  final _reactionPickerOpen = ValueNotifier<bool>(false);
  bool _animateJumpHighlight = false;

  late final Listenable _actionBarVisibility = Listenable.merge([
    _hovered,
    _reactionPickerOpen,
  ]);

  @override
  void didUpdateWidget(MessageItem oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.isJumpHighlighted != widget.isJumpHighlighted) {
      _animateJumpHighlight = true;
    }
  }

  @override
  void dispose() {
    _hovered.dispose();
    _reactionPickerOpen.dispose();
    _spoilerSyncController.dispose();
    super.dispose();
  }

  void _addReactionFromPicker(FluxerSelectedEmoji emoji) {
    final onReaction = widget.onReaction;
    if (onReaction != null) {
      dispatchSelectedEmojiReaction(emoji, onReaction);
    }
  }

  void _openReactionPickerSheet(BuildContext context, {String? channelId}) {
    unawaited(
      openReactionPickerSheet(
        context,
        channelId: channelId,
        onEmojiSelected: _addReactionFromPicker,
      ),
    );
  }

  bool _canOpenAuthorProfile(Message msg) {
    if (widget.inboxPreviewMode || msg.isSystemMessage) {
      return false;
    }
    return msg.authorId.isNotEmpty;
  }

  void _openAuthorProfile(BuildContext context, Message msg) {
    if (!_canOpenAuthorProfile(msg)) {
      return;
    }
    final String? guildId =
        widget.previewRoleGuildId ?? ref.read(contextualGuildIdProvider);
    unawaited(
      FluxerUserProfileSheet.show(
        context,
        userId: msg.authorId,
        guildId: guildId,
        isWebhook: msg.isWebhookMessage,
        message: msg.isWebhookMessage ? msg : null,
      ),
    );
  }

  void _handleAction(MessageAction? action, {required bool isMobile}) {
    if (action == null) {
      return;
    }
    if (action == MessageAction.addReaction && !isMobile) {
      _hovered.value = true;
      _reactionPickerOpen.value = true;
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!mounted) {
          return;
        }
        if (!(_reactionPickerKey.currentState?.isOpen ?? false)) {
          _reactionPickerKey.currentState?.toggle();
        }
      });
      return;
    }
    unawaited(
      dispatchMessageAction(
        ref: ref,
        context: context,
        message: widget.message,
        action: action,
        callbacks: _videoActionScope.callbacks,
        previewRoleGuildId: widget.previewRoleGuildId,
      ),
    );
  }

  MessageMediaActionScope get _videoActionScope {
    return MessageMediaActionScope(
      message: widget.message,
      previewRoleGuildId: widget.previewRoleGuildId,
      callbacks: MessageActionCallbacks(
        onReply: widget.onReply,
        onForward: widget.onForward,
        onEdit: widget.onEdit,
        onDelete: widget.onDelete,
        onRetry: widget.onRetry,
        onDeleteFailed: widget.onDeleteFailed,
        onMarkAsUnread: widget.onMarkAsUnread,
        onRemoveAllReactions: widget.onRemoveAllReactions,
        onReport: widget.onReport,
        onAddReaction: () => _openReactionPickerSheet(
          context,
          channelId: widget.message.channelId,
        ),
        onDeleteAttachment: widget.onDeleteAttachment,
        onEditAttachmentAltText: widget.onEditAttachmentAltText,
      ),
      permissions: MessageActionPermissions(
        isOwnMessage:
            widget.currentUserId != null &&
            widget.message.authorId == widget.currentUserId,
        isDmChannel: widget.isDmChannel,
        canDelete: widget.canDelete,
        canReport: _canReportThisMessage,
        canAddReactions: widget.canAddReactions,
        canPinMessage: widget.canPinMessage,
        canManageMessages: widget.canManageMessages,
        canSendMessages: widget.canSendMessages,
        developerMode: ref.read(
          userSettingsViewModelProvider.select((s) => s.developerMode),
        ),
        isSendDisabled: widget.isSendDisabled,
      ),
    );
  }

  bool get _canReportThisMessage {
    if (widget.message.hasFailed) {
      return false;
    }
    if (widget.message.authorId == widget.currentUserId) {
      return false;
    }
    return widget.message.type == messageTypeDefault ||
        widget.message.type == messageTypeReply;
  }

  Future<List<QuickReactionItem>?> _loadQuickReactionItems() {
    final guildId =
        widget.previewRoleGuildId ?? ref.read(contextualGuildIdProvider);
    return loadQuickReactionItems(
      ref,
      channelId: widget.message.channelId,
      guildId: guildId,
    );
  }

  void _dispatchQuickReaction(QuickReactionItem item) {
    // Frecency is tracked centrally in ChatViewModel.toggleReaction, so the
    // quick-row tap only needs to fire the reaction.
    switch (item) {
      case UnicodeQuickReaction(:final emoji):
        widget.onReaction?.call(emoji);
      case CustomQuickReaction(:final emoji):
        widget.onReaction?.call(
          emoji.name,
          emojiId: emoji.id,
          animated: emoji.animated,
        );
    }
  }

  Future<void> _showActions(BuildContext context) async {
    final frecent = await _loadQuickReactionItems();
    if (!context.mounted) {
      return;
    }
    FluxerHaptics.medium();
    final action = await showMessageBottomSheet(
      context,
      message: widget.message,
      isOwnMessage: widget.message.authorId == widget.currentUserId,
      isDmChannel: widget.isDmChannel,
      canDelete: widget.canDelete,
      canReport: _canReportThisMessage,
      canAddReactions: widget.canAddReactions,
      canPinMessage: widget.canPinMessage,
      canManageMessages: widget.canManageMessages,
      canSendMessages: widget.canSendMessages,
      developerMode: ref.read(
        userSettingsViewModelProvider.select((s) => s.developerMode),
      ),
      isSendDisabled: widget.isSendDisabled,
      quickItems: frecent,
      onQuickReaction: _dispatchQuickReaction,
      attachmentCallbacks: _videoActionScope.callbacks,
    );
    if (!context.mounted) {
      return;
    }
    _handleAction(action, isMobile: true);
  }

  Future<void> _showContextMenu(BuildContext context, Offset position) async {
    final frecent = await _loadQuickReactionItems();
    if (!context.mounted) {
      return;
    }

    final action = await showMessageContextMenu(
      context,
      position: position,
      message: widget.message,
      permissions: _videoActionScope.permissions,
      callbacks: _videoActionScope.callbacks,
      onQuickReaction: _dispatchQuickReaction,
      quickItems: frecent,
    );
    if (!context.mounted) {
      return;
    }
    _handleAction(action, isMobile: false);
  }

  @override
  Widget build(BuildContext context) {
    final msg = widget.message;
    if (msg.isClientSystemMessage && msg.authorId == fluxerBotUserId) {
      return _buildClientSystemMessageRow(
        context,
        msg,
        isGrouped: widget.isGrouped,
      );
    }
    final isGrouped = widget.isGrouped;
    final isMobile = isMobileLayout(context);
    final bool touchPrimary = isTouchPrimaryInput(ref);
    final bool useTouchMessageActions = isMobile || touchPrimary;
    final isTouch =
        layoutModeOfSize(MediaQuery.sizeOf(context)) != LayoutMode.desktop;
    final MessageRenderSettings? settings = widget.renderSettings;
    final guildId =
        widget.previewRoleGuildId ??
        (settings != null
            ? settings.activeGuildId
            : ref.watch(contextualGuildIdProvider));
    final bool renderEmbeds =
        settings?.renderEmbeds ??
        ref.watch(userSettingsViewModelProvider.select((s) => s.renderEmbeds));
    final bool renderReactions =
        settings?.renderReactions ??
        ref.watch(
          userSettingsViewModelProvider.select((s) => s.renderReactions),
        );
    final bool inlineAttachmentMedia =
        settings?.inlineAttachmentMedia ??
        ref.watch(
          userSettingsViewModelProvider.select((s) => s.inlineAttachmentMedia),
        );
    final RenderSpoilers renderSpoilers =
        settings?.renderSpoilers ??
        ref.watch(
          userSettingsViewModelProvider.select((s) => s.renderSpoilers),
        );
    final bool revealSpoilers =
        settings?.revealSpoilers ??
        switch (renderSpoilers) {
          RenderSpoilers.always => true,
          RenderSpoilers.ifModerator =>
            ref.watch(spoilerAutoRevealProvider(msg.channelId)).value ?? false,
          RenderSpoilers.onClick || RenderSpoilers.$unknown => false,
        };
    final ChatPreferencesState chatPreferences =
        settings?.chatPreferences ?? ref.watch(chatPreferencesProvider);
    final bool messageDisplayCompact =
        settings?.messageDisplayCompact ??
        ref.watch(
          userSettingsViewModelProvider.select((s) => s.messageDisplayCompact),
        );
    final bool showUserAvatarsInCompactMode =
        settings?.showUserAvatarsInCompactMode ??
        ref.watch(
          appearancePreferencesProvider.select(
            (s) => s.showUserAvatarsInCompactMode,
          ),
        );
    final bool prefersPersistedAuthor = messagePrefersPersistedAuthorDisplay(
      msg,
    );
    final bool shouldHighlightMention =
        msg.isMentioned && !widget.hideMentionHighlight;
    final bool showJumpHighlight =
        widget.isJumpHighlighted && !widget.inboxPreviewMode;
    final bool isKeyboardFocused =
        !widget.inboxPreviewMode &&
        ref.watch(keyboardModeProvider) &&
        ref.watch(
          focusedMessageProvider.select(
            (FocusedMessageState state) => state.messageId == msg.id,
          ),
        );
    final bool showMentionHighlight =
        shouldHighlightMention && !showJumpHighlight;
    final bool hasLeftAccentBar = showJumpHighlight || showMentionHighlight;
    final Color rowBackgroundColor = showJumpHighlight
        ? _kJumpHighlightBg
        : showMentionHighlight
        ? _kMentionColor.withValues(alpha: 0.1)
        : Colors.transparent;
    final Border? rowBorder = showJumpHighlight
        ? Border(
            left: BorderSide(
              color: context.colors.brandPrimaryLight,
              width: _kJumpHighlightBarWidth,
            ),
          )
        : showMentionHighlight
        ? const Border(left: BorderSide(color: _kMentionColor, width: 2))
        : null;
    // Hover tint is painted as a sibling overlay in the Stack below so that
    // hovering a row never rebuilds its body. Jump-highlighted rows keep their
    // fixed background (no hover tint); mention rows get an incremental tint
    // that bumps the base 0.1 mention alpha toward web's hovered 0.14.
    final Color? hoverTintColor = showJumpHighlight
        ? null
        : showMentionHighlight
        ? _kMentionColor.withValues(alpha: 0.04)
        : context.colors.backgroundModifierHover;
    final bool isFailed = msg.hasFailed;
    final bool isSending = msg.isSending;
    final bool hasUploadingPlaceholderAttachments =
        _hasUploadingPlaceholderAttachments(msg);
    final bool dimEntireMessage =
        isSending && !hasUploadingPlaceholderAttachments;
    final bool dimMessagePartsExceptAttachments =
        isSending && hasUploadingPlaceholderAttachments;

    final body = FluxerGestureDetector(
      onLongPress: useTouchMessageActions && !widget.inboxPreviewMode
          ? () => _showActions(context)
          : null,
      onSecondaryTapUp: !useTouchMessageActions && !widget.inboxPreviewMode
          ? (details) => _showContextMenu(context, details.globalPosition)
          : null,
      child: MouseRegion(
        onEnter: (_) => _hovered.value = true,
        onExit: (_) {
          if (!_reactionPickerOpen.value) {
            _hovered.value = false;
          }
        },
        child: _messageRowChrome(
          decoration: BoxDecoration(
            color: rowBackgroundColor,
            border: rowBorder,
          ),
          padding: widget.inboxPreviewMode
              ? EdgeInsets.only(
                  left: hasLeftAccentBar ? 7 : 8,
                  right: 8,
                  top: isGrouped ? 2 : 8,
                  bottom: isGrouped ? 2 : 8,
                )
              : EdgeInsets.only(
                  left: hasLeftAccentBar ? 14 : kMessageRowPaddingHorizontal,
                  right: kMessageRowPaddingHorizontal,
                  top: 2,
                  bottom: 2,
                ),
          child: Stack(
            children: [
              ValueListenableBuilder<bool>(
                valueListenable: _hovered,
                builder: (context, hovered, _) =>
                    hovered && hoverTintColor != null
                    ? Positioned.fill(child: ColoredBox(color: hoverTintColor))
                    : const SizedBox.shrink(),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if ((!isGrouped || messageDisplayCompact) && msg.isReply)
                    _wrapMessageSendingDim(
                      dim: dimMessagePartsExceptAttachments,
                      child: _buildReplyRow(msg, guildId: guildId),
                    ),
                  if ((!isGrouped || messageDisplayCompact) &&
                      msg.isForwarded &&
                      !msg.hasForwardSnapshots &&
                      msg.forwardedFrom != null)
                    _wrapMessageSendingDim(
                      dim: dimMessagePartsExceptAttachments,
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: messageDisplayCompact
                              ? 0
                              : kMessageAvatarColumnWidth,
                        ),
                        child: ForwardIndicator(source: msg.forwardedFrom!),
                      ),
                    ),
                  if (messageDisplayCompact)
                    if (isGrouped && isMobile)
                      _buildCompactMessageRow(
                        context,
                        msg,
                        isMobile,
                        isGrouped: isGrouped,
                        showUserAvatarsInCompactMode:
                            showUserAvatarsInCompactMode,
                        dimMessagePartsExceptAttachments:
                            dimMessagePartsExceptAttachments,
                        renderEmbeds: renderEmbeds,
                        renderReactions: renderReactions,
                        inlineAttachmentMedia: inlineAttachmentMedia,
                        revealSpoilers: revealSpoilers,
                        chatPreferences: chatPreferences,
                      )
                    else
                      _MessageAuthorScope(
                        message: msg,
                        guildId: guildId,
                        currentUserId: widget.currentUserId,
                        prefersPersistedAuthor: prefersPersistedAuthor,
                        builder:
                            (
                              GuildUserDisplay authorDisplay,
                              Color? authorRoleColor,
                            ) => _buildCompactMessageRow(
                              context,
                              msg,
                              isMobile,
                              isGrouped: isGrouped,
                              authorDisplay: authorDisplay,
                              authorRoleColor: authorRoleColor,
                              showUserAvatarsInCompactMode:
                                  showUserAvatarsInCompactMode,
                              dimMessagePartsExceptAttachments:
                                  dimMessagePartsExceptAttachments,
                              renderEmbeds: renderEmbeds,
                              renderReactions: renderReactions,
                              inlineAttachmentMedia: inlineAttachmentMedia,
                              revealSpoilers: revealSpoilers,
                              chatPreferences: chatPreferences,
                            ),
                      )
                  else if (isGrouped)
                    _buildGroupedRow(
                      context,
                      msg,
                      isMobile,
                      dimMessagePartsExceptAttachments:
                          dimMessagePartsExceptAttachments,
                      renderEmbeds: renderEmbeds,
                      renderReactions: renderReactions,
                      inlineAttachmentMedia: inlineAttachmentMedia,
                      revealSpoilers: revealSpoilers,
                      chatPreferences: chatPreferences,
                    )
                  else
                    _MessageAuthorScope(
                      message: msg,
                      guildId: guildId,
                      currentUserId: widget.currentUserId,
                      prefersPersistedAuthor: prefersPersistedAuthor,
                      builder:
                          (
                            GuildUserDisplay authorDisplay,
                            Color? authorRoleColor,
                          ) => _buildMainRow(
                            context,
                            msg,
                            authorDisplay,
                            authorRoleColor,
                            isMobile,
                            dimMessagePartsExceptAttachments:
                                dimMessagePartsExceptAttachments,
                            renderEmbeds: renderEmbeds,
                            renderReactions: renderReactions,
                            inlineAttachmentMedia: inlineAttachmentMedia,
                            revealSpoilers: revealSpoilers,
                            chatPreferences: chatPreferences,
                          ),
                    ),
                ],
              ),
              if (!isMobile && !isFailed && !widget.inboxPreviewMode)
                Consumer(
                  builder: (context, ref, _) {
                    final (
                      bool showMessageActionBar,
                      bool showMessageActionBarShiftExpand,
                      bool showMessageActionBarOnlyMoreButton,
                      bool showMessageActionBarQuickReactions,
                    ) = ref.watch(
                      advancedPreferencesProvider.select(
                        (AdvancedPreferencesState s) => (
                          s.showMessageActionBar,
                          s.showMessageActionBarShiftExpand,
                          s.showMessageActionBarOnlyMoreButton,
                          s.showMessageActionBarQuickReactions,
                        ),
                      ),
                    );
                    if (!showMessageActionBar) {
                      return const SizedBox.shrink();
                    }
                    return ListenableBuilder(
                      listenable: _actionBarVisibility,
                      builder: (context, _) {
                        final bool shiftExpand =
                            showMessageActionBarShiftExpand &&
                            HardwareKeyboard.instance.isShiftPressed;
                        final bool showBar =
                            _hovered.value ||
                            _reactionPickerOpen.value ||
                            shiftExpand;
                        if (!showBar) {
                          return const SizedBox.shrink();
                        }
                        return Positioned(
                          top: 0,
                          right: 0,
                          child: _buildActions(
                            context,
                            onlyMoreButton: showMessageActionBarOnlyMoreButton,
                            showQuickReactions:
                                showMessageActionBarQuickReactions,
                          ),
                        );
                      },
                    );
                  },
                ),
            ],
          ),
        ),
      ),
    );
    final onReply = widget.onReply;
    final Widget semanticBody = Semantics(
      container: true,
      label: _messageSemanticLabel(
        context,
        msg,
        isSending: isSending,
        isFailed: isFailed,
      ),
      child: body,
    );
    if (!isTouch || onReply == null || widget.inboxPreviewMode) {
      return _wrapMessageSendingDim(
        dim: dimEntireMessage,
        child: _wrapKeyboardFocus(
          focused: isKeyboardFocused,
          child: semanticBody,
        ),
      );
    }
    final bool canEditOwnMessage =
        widget.onEdit != null &&
        msg.authorId == widget.currentUserId &&
        msg.isUserMessage &&
        msg.messageSnapshots.isEmpty;
    return _wrapMessageSendingDim(
      dim: dimEntireMessage,
      child: _wrapKeyboardFocus(
        focused: isKeyboardFocused,
        child: SwipeToReply(
          enabled: widget.canSendMessages && widget.swipeToReplyEnabled,
          onReply: onReply,
          onEdit: canEditOwnMessage ? widget.onEdit : null,
          child: semanticBody,
        ),
      ),
    );
  }

  Widget _wrapKeyboardFocus({required bool focused, required Widget child}) {
    if (!focused) {
      return child;
    }
    return FluxerFocusRing(focused: true, child: child);
  }

  String _messageSemanticLabel(
    BuildContext context,
    Message msg, {
    required bool isSending,
    required bool isFailed,
  }) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final String author = msg.authorName.isNotEmpty
        ? msg.authorName
        : msg.authorId;
    final String summary = messageAccessibilitySummary(msg, l10n);
    final StringBuffer label = StringBuffer(
      l10n.messageAccessibilityLabel(author, summary),
    );
    if (isSending) {
      label.write(l10n.messageAccessibilitySendingSuffix);
    } else if (isFailed) {
      label.write(l10n.messageAccessibilityFailedSuffix);
    }
    return label.toString();
  }

  bool _hasUploadingPlaceholderAttachments(Message msg) {
    return msg.attachments.any(isUploadingPlaceholderAttachment);
  }

  Widget _wrapMessageSendingDim({required bool dim, required Widget child}) {
    if (!dim) {
      return child;
    }
    return Opacity(opacity: _kMessageSendingOpacity, child: child);
  }

  /// Animates only while jump highlight is entering or leaving.
  Widget _messageRowChrome({
    required Decoration decoration,
    required EdgeInsets padding,
    required Widget child,
  }) {
    if (!_animateJumpHighlight && !widget.isJumpHighlighted) {
      return DecoratedBox(
        decoration: decoration,
        child: Padding(padding: padding, child: child),
      );
    }
    return AnimatedContainer(
      duration: context.motion.slow,
      curve: _kJumpHighlightFadeCurve,
      decoration: decoration,
      padding: padding,
      onEnd: () {
        if (!mounted || widget.isJumpHighlighted) {
          return;
        }
        setState(() => _animateJumpHighlight = false);
      },
      child: child,
    );
  }

  /// Builds the reply preview row with space for the
  /// connector line.
  Widget _buildReplyRow(Message msg, {required String? guildId}) {
    const replyAreaHeight = _kReplyRowHeight + _kReplyBottomGap;
    const avatarCenterX = 20.0;
    const lineTop = _kReplyRowHeight / 2;
    const lineBottom = replyAreaHeight - 5;
    const horizontalEnd = kMessageAvatarColumnWidth - 5;
    const replyContentLeft = horizontalEnd + _kReplyLineEndGap;

    return SizedBox(
      height: replyAreaHeight,
      child: CustomPaint(
        painter: ReplyConnectorPainter(
          avatarCenterX: avatarCenterX,
          lineTop: lineTop,
          lineBottom: lineBottom,
          horizontalEnd: horizontalEnd,
          color: context.colors.interactiveMuted,
        ),
        child: Padding(
          padding: const EdgeInsets.only(
            left: replyContentLeft,
            bottom: _kReplyBottomGap,
          ),
          child: SizedBox(
            height: _kReplyRowHeight,
            child: Align(
              alignment: Alignment.centerLeft,
              child: InlineReplyPreview(
                message: msg,
                guildId: guildId,
                currentUserId: widget.currentUserId,
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// Returns the content, embeds, and reactions
  /// widgets for a message.
  List<Widget> _buildMessageContent(
    BuildContext context,
    Message msg,
    bool isMobile, {
    required bool dimMessagePartsExceptAttachments,
    required bool renderEmbeds,
    required bool renderReactions,
    required bool inlineAttachmentMedia,
    required bool revealSpoilers,
    required ChatPreferencesState chatPreferences,
  }) {
    Widget wrapPart(Widget child) => _wrapMessageSendingDim(
      dim: dimMessagePartsExceptAttachments,
      child: child,
    );
    final spoileredUrls = extractSpoileredUrls(msg.content);
    final attachmentSize = msg.hasCompactAttachments
        ? MediaDimensionSize.small
        : chatPreferences.attachmentMediaDimensionSize;

    return [
      if (msg.content.isNotEmpty &&
          !msg.shouldHideContent(renderEmbeds: renderEmbeds))
        wrapPart(
          _buildMessageTextWithEditedTag(
            context,
            msg,
            isMobile: isMobile,
            revealSpoilers: revealSpoilers,
          ),
        ),
      if (msg.hasForwardSnapshots)
        wrapPart(
          ForwardedMessageContent(
            message: msg,
            snapshot: msg.messageSnapshots.first,
            renderEmbeds: renderEmbeds,
            inlineAttachmentMedia: inlineAttachmentMedia,
            revealSpoilers: revealSpoilers,
            chatPreferences: chatPreferences,
            spoilerSyncController: _spoilerSyncController,
          ),
        ),
      ...msg.invites.map(
        (code) => wrapPart(
          Padding(
            padding: const EdgeInsets.only(top: 4),
            child: EmbedInvite(code: code),
          ),
        ),
      ),
      ...msg.gifts.map(
        (code) => wrapPart(
          Padding(
            padding: const EdgeInsets.only(top: 4),
            child: EmbedGift(code: code),
          ),
        ),
      ),
      ...msg.themes.map(
        (_) => wrapPart(
          const Padding(padding: EdgeInsets.only(top: 4), child: EmbedTheme()),
        ),
      ),
      if (msg.attachments.isNotEmpty)
        AttachmentListRenderer(
          attachments: msg.attachments,
          inlineAttachmentMedia: inlineAttachmentMedia,
          dimensionSize: attachmentSize,
          revealSpoilers: revealSpoilers,
          messageId: msg.id,
          messageNonce: msg.clientNonce,
          channelId: msg.channelId,
          messageFlags: msg.flags,
          mediaActionScope: _videoActionScope,
        ),
      if (renderEmbeds && !msg.suppressEmbeds)
        ...() {
          final EmbedGalleryIndex galleryIndex = EmbedGalleryIndex(msg.embeds);
          return msg.embeds.indexed
              .where((entry) => !galleryIndex.isDuplicateAt(entry.$1))
              .map((entry) {
                final int embedIndex = entry.$1;
                final embed = entry.$2;
                final spoilerSyncKeys = spoilerSyncKeysForEmbed(
                  embed,
                  spoileredUrls,
                );
                return wrapPart(
                  _buildEmbed(
                    embed,
                    galleryIndex: galleryIndex,
                    isSpoiler: spoilerSyncKeys.isNotEmpty,
                    spoilerSyncKeys: spoilerSyncKeys,
                    revealSpoilers: revealSpoilers,
                    dimensionSize: chatPreferences.embedMediaDimensionSize,
                    channelId: msg.channelId,
                    messageId: msg.id,
                    embedIndex: embedIndex,
                  ),
                );
              });
        }(),
      if (msg.hasStickers)
        wrapPart(
          Padding(
            padding: const EdgeInsets.only(top: 4),
            child: Wrap(
              spacing: 8,
              runSpacing: 8,
              children: msg.stickers.map(_buildSticker).toList(),
            ),
          ),
        ),
      if (renderReactions && msg.reactions.isNotEmpty)
        wrapPart(
          Padding(
            padding: const EdgeInsets.only(top: 4),
            child: MessageReactionsBar(
              reactions: msg.reactions,
              channelId: msg.channelId,
              onReactionTap: (emoji, {emojiId, animated = false}) => widget
                  .onReaction
                  ?.call(emoji, emojiId: emojiId, animated: animated),
              showAddReaction:
                  widget.canAddReactions &&
                  msg.supportsInteractiveActions &&
                  !widget.inboxPreviewMode,
              isMobile: isMobile,
            ),
          ),
        ),
      if (msg.hasFailed) wrapPart(_buildDeliveryStatus(context, msg)),
    ];
  }

  Widget _buildDeliveryStatus(BuildContext context, Message msg) {
    return Padding(
      padding: const EdgeInsets.only(top: 4),
      child: Wrap(
        spacing: 8,
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              PhosphorIcon(
                PhosphorIconsBold.warningCircle,
                size: 14,
                color: context.colors.textDanger,
              ),
              const SizedBox(width: 4),
              Text(
                FluxerLocalizations.of(context).chatMessageFailedToSend,
                style: context.textStyles.smallText.copyWith(
                  color: context.colors.textDanger,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildMessageTextWithEditedTag(
    BuildContext context,
    Message msg, {
    required bool isMobile,
    required bool revealSpoilers,
  }) {
    Widget markdown = MessageMarkdown(
      data: msg.displayedContent,
      messageId: msg.id,
      selectable:
          (widget.renderSettings?.markdown.enableTextSelection ??
              ref.watch(
                advancedPreferencesProvider.select(
                  (AdvancedPreferencesState s) => s.enableTextSelection,
                ),
              )) &&
          !isMobile,
      channelId: msg.channelId,
      mentionChannels: msg.mentionChannels,
      revealSpoilers: revealSpoilers,
      spoilerSyncController: _spoilerSyncController,
      trailingInlineWidget: msg.isEdited
          ? _buildEditedLabel(context, msg)
          : null,
    );
    if (msg.hasFailed && msg.content.trim().isNotEmpty) {
      markdown = DefaultTextStyle(
        style: context.textStyles.messageText.copyWith(
          color: context.colors.textDanger,
        ),
        child: markdown,
      );
    }
    final bool isTranslating = ref.watch(
      translatingMessageIdsProvider.select(
        (Set<String> ids) => ids.contains(msg.id),
      ),
    );
    final MessageTranslation? translation = msg.translation;
    if (!msg.hasValidTranslation && !isTranslating) {
      return markdown;
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        markdown,
        if (isTranslating)
          const MessageTranslatingIndicator()
        else if (translation != null)
          MessageTranslationIndicator(
            translation: translation,
            onToggleOriginal: () => _toggleTranslationOriginal(msg),
          ),
      ],
    );
  }

  void _toggleTranslationOriginal(Message msg) {
    unawaited(() async {
      final Message updated = await ref
          .read(messageTranslationServiceProvider)
          .setShowOriginal(
            message: msg,
            showOriginal: !(msg.translation?.showOriginal ?? false),
          );
      ref
          .read(chatViewModelProvider.notifier)
          .applyMessageTranslation(
            messageId: updated.id,
            translation: updated.translation,
          );
    }());
  }

  Widget _buildEditedLabel(BuildContext context, Message msg) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    const Widget label = Padding(
      padding: EdgeInsets.only(bottom: 2),
      child: Text(' '),
    );
    final Widget editedText = Text(l10n.chatMessageEdited);
    final TextStyle editedTextStyle = context.textStyles.smallText.copyWith(
      color: context.colors.textTertiaryMuted,
      fontSize: 10,
    );
    final DateTime? editedTimestamp = msg.editedTimestamp;
    if (editedTimestamp == null) {
      return DefaultTextStyle(
        style: editedTextStyle,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [label, editedText],
        ),
      );
    }
    final DateTime localEditedTimestamp = editedTimestamp.toLocal();
    final MaterialLocalizations materialLocalizations =
        MaterialLocalizations.of(context);
    final TimeOfDay localEditedTime = TimeOfDay.fromDateTime(
      localEditedTimestamp,
    );
    final String editedTooltip =
        '${materialLocalizations.formatFullDate(localEditedTimestamp)} '
        '${materialLocalizations.formatTimeOfDay(localEditedTime)}';
    return Tooltip(
      message: editedTooltip,
      child: DefaultTextStyle(
        style: editedTextStyle,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [label, editedText],
        ),
      ),
    );
  }

  /// Grouped message row: hover-reveal short timestamp
  /// in the left column, content on the right.
  bool _shouldShowCompactMetadata({
    required bool isGrouped,
    required bool isMobile,
  }) => !(isGrouped && isMobile);

  Widget _buildCompactTimestamp(
    BuildContext context,
    Message msg, {
    required bool isGrouped,
  }) {
    final String time = _formatShortTimestamp(msg.timestamp.toLocal());
    final TextStyle style = context.textStyles.timestamp.copyWith(
      color: context.colors.textTertiaryMuted,
      fontSize: 10,
    );
    final Widget timestamp = Text('[$time]', style: style);
    if (!isGrouped) {
      return timestamp;
    }
    return ValueListenableBuilder<bool>(
      valueListenable: _hovered,
      builder: (context, hovered, child) => AnimatedOpacity(
        opacity: hovered ? 1.0 : 0.0,
        duration: context.motion.fast,
        child: child,
      ),
      child: timestamp,
    );
  }

  Widget _buildCompactAuthorPrefix(
    BuildContext context,
    Message msg,
    GuildUserDisplay authorDisplay,
    Color? roleColor, {
    required bool showAvatar,
  }) {
    final TextStyle nameStyle = context.textStyles.username.copyWith(
      color: roleColor ?? context.colors.textChat,
      fontWeight: FontWeight.w600,
    );
    return Wrap(
      spacing: kCompactAuthorGap,
      runSpacing: 2,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        if (messageAuthorShowsUserTag(
          authorIsBot: msg.authorIsBot,
          authorIsSystem: msg.authorIsSystem,
        ))
          FluxerUserTag(
            isSystem: messageAuthorUserTagIsSystem(
              authorIsSystem: msg.authorIsSystem,
            ),
          ),
        if (showAvatar)
          FluxerGestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: _canOpenAuthorProfile(msg)
                ? () => _openAuthorProfile(context, msg)
                : null,
            child: FluxerAvatar.user(
              key: ValueKey<String>(
                'compact-msg-avatar-${msg.authorId}-${authorDisplay.avatarUrl ?? ''}',
              ),
              fallbackText: authorDisplay.displayName,
              userId: msg.authorId,
              imageUrl: authorDisplay.avatarUrl,
              avatarColor: authorDisplay.avatarColor,
              size: kCompactAvatarSize,
            ),
          ),
        FluxerGestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: _canOpenAuthorProfile(msg)
              ? () => _openAuthorProfile(context, msg)
              : null,
          child: Text(
            authorDisplay.displayName,
            style: nameStyle,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
        ),
        Text(':', style: nameStyle),
      ],
    );
  }

  Widget _buildCompactMessageRow(
    BuildContext context,
    Message msg,
    bool isMobile, {
    required bool isGrouped,
    required bool showUserAvatarsInCompactMode,
    required bool dimMessagePartsExceptAttachments,
    required bool renderEmbeds,
    required bool renderReactions,
    required bool inlineAttachmentMedia,
    required bool revealSpoilers,
    required ChatPreferencesState chatPreferences,
    GuildUserDisplay? authorDisplay,
    Color? authorRoleColor,
  }) {
    final bool showMetadata = _shouldShowCompactMetadata(
      isGrouped: isGrouped,
      isMobile: isMobile,
    );
    final List<Widget> content = _buildMessageContent(
      context,
      msg,
      isMobile,
      dimMessagePartsExceptAttachments: dimMessagePartsExceptAttachments,
      renderEmbeds: renderEmbeds,
      renderReactions: renderReactions,
      inlineAttachmentMedia: inlineAttachmentMedia,
      revealSpoilers: revealSpoilers,
      chatPreferences: chatPreferences,
    );
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (showMetadata)
          SizedBox(
            width: isGrouped ? kMessageAvatarColumnWidth : null,
            child: _buildCompactTimestamp(context, msg, isGrouped: isGrouped),
          ),
        if (showMetadata) const SizedBox(width: kCompactTimestampGap),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (showMetadata && authorDisplay != null)
                _wrapMessageSendingDim(
                  dim: dimMessagePartsExceptAttachments,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 2),
                    child: _buildCompactAuthorPrefix(
                      context,
                      msg,
                      authorDisplay,
                      authorRoleColor,
                      showAvatar: showUserAvatarsInCompactMode,
                    ),
                  ),
                ),
              ...content,
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildGroupedRow(
    BuildContext context,
    Message msg,
    bool isMobile, {
    required bool dimMessagePartsExceptAttachments,
    required bool renderEmbeds,
    required bool renderReactions,
    required bool inlineAttachmentMedia,
    required bool revealSpoilers,
    required ChatPreferencesState chatPreferences,
  }) => Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      _wrapMessageSendingDim(
        dim: dimMessagePartsExceptAttachments,
        child: FluxerGestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: _canOpenAuthorProfile(msg)
              ? () => _openAuthorProfile(context, msg)
              : null,
          child: SizedBox(
            width: kMessageAvatarColumnWidth,
            child: Align(
              alignment: Alignment.centerLeft,
              child: ValueListenableBuilder<bool>(
                valueListenable: _hovered,
                builder: (context, hovered, child) => AnimatedOpacity(
                  opacity: hovered ? 1.0 : 0.0,
                  duration: context.motion.fast,
                  child: child,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      _formatShortTimestamp(msg.timestamp.toLocal()),
                      style: context.textStyles.timestamp.copyWith(
                        color: context.colors.textTertiaryMuted,
                        fontSize: 10,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: _buildMessageContent(
            context,
            msg,
            isMobile,
            dimMessagePartsExceptAttachments: dimMessagePartsExceptAttachments,
            renderEmbeds: renderEmbeds,
            renderReactions: renderReactions,
            inlineAttachmentMedia: inlineAttachmentMedia,
            revealSpoilers: revealSpoilers,
            chatPreferences: chatPreferences,
          ),
        ),
      ),
    ],
  );

  String _formatShortTimestamp(DateTime dt) {
    final h = dt.hour.toString().padLeft(2, '0');
    final m = dt.minute.toString().padLeft(2, '0');
    return '$h:$m';
  }

  Widget _buildSilentIndicator(BuildContext context) {
    final String message = FluxerLocalizations.of(context).chatMessageSilent;
    return Semantics(
      button: true,
      label: message,
      child: FluxerGestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () => ref
            .read(toastProvider.notifier)
            .show(FluxerToast(message: message)),
        child: Tooltip(
          message: message,
          child: ExcludeSemantics(
            child: PhosphorIcon(
              PhosphorIconsFill.bellSlash,
              size: 14,
              color: context.textStyles.timestamp.color,
            ),
          ),
        ),
      ),
    );
  }

  /// Main message row: avatar on the left, content on
  /// the right.
  Widget _buildMainRow(
    BuildContext context,
    Message msg,
    GuildUserDisplay authorDisplay,
    Color? roleColor,
    bool isMobile, {
    required bool dimMessagePartsExceptAttachments,
    required bool renderEmbeds,
    required bool renderReactions,
    required bool inlineAttachmentMedia,
    required bool revealSpoilers,
    required ChatPreferencesState chatPreferences,
  }) => Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      _wrapMessageSendingDim(
        dim: dimMessagePartsExceptAttachments,
        child: Semantics(
          button: _canOpenAuthorProfile(msg),
          label: _canOpenAuthorProfile(msg)
              ? FluxerLocalizations.of(context).voiceParticipantMenuViewProfile
              : null,
          image: true,
          child: FluxerGestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: _canOpenAuthorProfile(msg)
                ? () => _openAuthorProfile(context, msg)
                : null,
            child: Padding(
              padding: const EdgeInsets.only(top: kMessageAvatarTopPadding),
              child: ExcludeSemantics(
                child: FluxerAvatar.user(
                  key: ValueKey<String>(
                    'msg-avatar-${msg.authorId}-${authorDisplay.avatarUrl ?? ''}',
                  ),
                  fallbackText: authorDisplay.displayName,
                  userId: msg.authorId,
                  imageUrl: authorDisplay.avatarUrl,
                  avatarColor: authorDisplay.avatarColor,
                ),
              ),
            ),
          ),
        ),
      ),
      const SizedBox(width: kMessageAvatarTextGap),
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _wrapMessageSendingDim(
              dim: dimMessagePartsExceptAttachments,
              child: Wrap(
                spacing: 6,
                runSpacing: 2,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  FluxerGestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: _canOpenAuthorProfile(msg)
                        ? () => _openAuthorProfile(context, msg)
                        : null,
                    child: Text(
                      authorDisplay.displayName,
                      style: context.textStyles.username.copyWith(
                        color: roleColor ?? context.colors.textChat,
                        fontWeight: FontWeight.w600,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ),
                  if (messageAuthorShowsUserTag(
                    authorIsBot: msg.authorIsBot,
                    authorIsSystem: msg.authorIsSystem,
                  ))
                    FluxerUserTag(
                      isSystem: messageAuthorUserTagIsSystem(
                        authorIsSystem: msg.authorIsSystem,
                      ),
                    ),
                  Text(
                    formatMessageTimestamp(
                      msg.timestamp.toLocal(),
                      FluxerLocalizations.of(context),
                      Localizations.localeOf(context).toString(),
                      use12Hour: ref.watch(use12HourTimeFormatProvider),
                    ),
                    style: context.textStyles.timestamp,
                  ),
                  if ((msg.flags & messageFlagSuppressNotifications) != 0)
                    _buildSilentIndicator(context),
                ],
              ),
            ),
            const SizedBox(height: 2),
            ..._buildMessageContent(
              context,
              msg,
              isMobile,
              dimMessagePartsExceptAttachments:
                  dimMessagePartsExceptAttachments,
              renderEmbeds: renderEmbeds,
              renderReactions: renderReactions,
              inlineAttachmentMedia: inlineAttachmentMedia,
              revealSpoilers: revealSpoilers,
              chatPreferences: chatPreferences,
            ),
          ],
        ),
      ),
    ],
  );

  Widget _buildClientSystemMessageRow(
    BuildContext context,
    Message msg, {
    required bool isGrouped,
  }) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final bool use12Hour = ref.watch(use12HourTimeFormatProvider);
    final TextStyle footerTextStyle = context.textStyles.timestamp.copyWith(
      color: context.colors.textTertiary,
    );
    final TextStyle dismissTextStyle = context.textStyles.timestamp.copyWith(
      color: context.colors.textLink,
    );
    return DecoratedBox(
      decoration: BoxDecoration(
        color: _kJumpHighlightBg,
        border: Border(
          left: BorderSide(
            color: context.colors.brandPrimaryLight,
            width: _kJumpHighlightBarWidth,
          ),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.only(
          left: kMessageRowPaddingHorizontal + _kJumpHighlightBarWidth,
          right: kMessageRowPaddingHorizontal,
          top: isGrouped ? 2 : 8,
          bottom: isGrouped ? 2 : 8,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (!isGrouped)
              Padding(
                padding: const EdgeInsets.only(top: kMessageAvatarTopPadding),
                child: FluxerAvatar.user(
                  fallbackText: msg.authorName,
                  userId: msg.authorId,
                ),
              ),
            if (!isGrouped) const SizedBox(width: kMessageAvatarTextGap),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (!isGrouped)
                    Row(
                      children: [
                        Flexible(
                          child: Text(
                            msg.authorName,
                            style: context.textStyles.username.copyWith(
                              color: context.colors.textChat,
                              fontWeight: FontWeight.w600,
                            ),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                        ),
                        if (messageAuthorShowsUserTag(
                          authorIsBot: msg.authorIsBot,
                          authorIsSystem: msg.authorIsSystem,
                        )) ...[
                          const SizedBox(width: 6),
                          FluxerUserTag(
                            isSystem: messageAuthorUserTagIsSystem(
                              authorIsSystem: msg.authorIsSystem,
                            ),
                          ),
                        ],
                        const SizedBox(width: 8),
                        Text(
                          formatMessageTimestamp(
                            msg.timestamp.toLocal(),
                            l10n,
                            Localizations.localeOf(context).toString(),
                            use12Hour: use12Hour,
                          ),
                          style: context.textStyles.timestamp,
                        ),
                      ],
                    ),
                  if (!isGrouped) const SizedBox(height: 2),
                  MessageMarkdown(
                    data: msg.displayedContent,
                    messageId: msg.id,
                    selectable: !isMobileLayout(context),
                    channelId: msg.channelId,
                    mentionChannels: msg.mentionChannels,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Text.rich(
                      TextSpan(
                        style: footerTextStyle,
                        children: [
                          WidgetSpan(
                            alignment: PlaceholderAlignment.middle,
                            child: Padding(
                              padding: const EdgeInsets.only(right: 6),
                              child: PhosphorIcon(
                                PhosphorIconsBold.eye,
                                size: 14,
                                color: footerTextStyle.color,
                              ),
                            ),
                          ),
                          TextSpan(text: l10n.chatClientSystemOnlyYouCanSee),
                          const TextSpan(text: ' '),
                          WidgetSpan(
                            alignment: PlaceholderAlignment.middle,
                            child: FluxerGestureDetector(
                              onTap: widget.onDismissClientSystem,
                              child: Text(
                                l10n.chatClientSystemDismiss,
                                style: dismissTextStyle,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEmbed(
    Embed embed, {
    required EmbedGalleryIndex galleryIndex,
    required bool isSpoiler,
    required List<String> spoilerSyncKeys,
    required bool revealSpoilers,
    required MediaDimensionSize dimensionSize,
    String? channelId,
    String? messageId,
    int? embedIndex,
  }) {
    final child = switch (embed.type) {
      EmbedType.rich => EmbedRich(
        embed: embed,
        galleryIndex: galleryIndex,
        embedIndex: embedIndex ?? 0,
        dimensionSize: dimensionSize,
        revealSpoilers: revealSpoilers,
        spoilerSyncController: _spoilerSyncController,
        channelId: channelId,
        messageId: messageId,
        videoActionScope: _videoActionScope,
      ),
      EmbedType.image || EmbedType.gifv => EmbedImage(
        embed: embed,
        dimensionSize: dimensionSize,
        isSpoiler: isSpoiler,
        revealSpoiler: revealSpoilers,
        spoilerSyncController: _spoilerSyncController,
        spoilerSyncKeys: spoilerSyncKeys,
        channelId: channelId,
        messageId: messageId,
        embedIndex: embedIndex,
        mediaActionScope: _videoActionScope,
      ),
      EmbedType.link => EmbedLink(
        embed: embed,
        galleryIndex: galleryIndex,
        embedIndex: embedIndex ?? 0,
        dimensionSize: dimensionSize,
        revealSpoilers: revealSpoilers,
        spoilerSyncController: _spoilerSyncController,
        channelId: channelId,
        messageId: messageId,
      ),
      EmbedType.video => EmbedVideo(
        embed: embed,
        dimensionSize: dimensionSize,
        isSpoiler: isSpoiler,
        revealSpoiler: revealSpoilers,
        spoilerSyncController: _spoilerSyncController,
        spoilerSyncKeys: spoilerSyncKeys,
        channelId: channelId,
        messageId: messageId,
        embedIndex: embedIndex,
        videoActionScope: _videoActionScope,
      ),
    };

    return Padding(
      padding: const EdgeInsets.only(top: 2),
      child:
          embed.type == EmbedType.image ||
              embed.type == EmbedType.gifv ||
              embed.type == EmbedType.video
          ? child
          : SpoilerOverlay(
              isSpoiler: isSpoiler,
              initiallyRevealed: revealSpoilers,
              spoilerSyncController: _spoilerSyncController,
              syncKeys: spoilerSyncKeys,
              child: child,
            ),
    );
  }

  Widget _buildSticker(MessageSticker sticker) {
    final Widget stickerImage;
    if (sticker.animated) {
      stickerImage = SizedBox(
        width: _kMessageStickerSize,
        height: _kMessageStickerSize,
        child: EmbedAnimatedImage(
          animatedUrl: sticker.urlForSize(_kMessageStickerRequestSize),
          staticUrl: FluxerMediaUrl.sticker(id: sticker.id),
          visibilityKey:
              '${widget.message.channelId}_${widget.message.id}_${sticker.id}',
          useStickerAnimationPreference: true,
          fit: BoxFit.contain,
          placeholder: const SizedBox(
            width: _kMessageStickerSize,
            height: _kMessageStickerSize,
          ),
        ),
      );
    } else {
      stickerImage = CachedNetworkImage(
        imageUrl: sticker.urlForSize(_kMessageStickerRequestSize),
        cacheKey: sticker.cacheKeyForSize(_kMessageStickerRequestSize),
        width: _kMessageStickerSize,
        height: _kMessageStickerSize,
        memCacheWidth: _kMessageStickerSize.toInt(),
        fadeInDuration: Duration.zero,
        fadeOutDuration: Duration.zero,
        fit: BoxFit.contain,
        placeholder: (_, _) => const SizedBox(
          width: _kMessageStickerSize,
          height: _kMessageStickerSize,
        ),
        errorBuilder: (_, _, _) => SizedBox(
          width: _kMessageStickerSize,
          height: _kMessageStickerSize,
          child: Center(
            child: PhosphorIcon(
              PhosphorIconsDuotone.sticker,
              size: 48,
              color: context.colors.textTertiaryMuted,
            ),
          ),
        ),
      );
    }
    return Semantics(label: sticker.name, image: true, child: stickerImage);
  }

  Widget _buildActions(
    BuildContext context, {
    required bool onlyMoreButton,
    required bool showQuickReactions,
  }) {
    if (onlyMoreButton) {
      return Material(
        color: context.colors.backgroundPrimary,
        borderRadius: BorderRadius.circular(4),
        child: DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            border: Border.all(color: context.colors.borderColor),
          ),
          child: _actionButton(
            context,
            PhosphorIconsFill.dotsThree,
            FluxerLocalizations.of(context).chatMessageMore,
            () {},
          ),
        ),
      );
    }
    return Material(
      color: context.colors.backgroundPrimary,
      borderRadius: BorderRadius.circular(4),
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          border: Border.all(color: context.colors.borderColor),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (showQuickReactions)
              FluxerEmojiPickerPopout(
                key: _reactionPickerKey,
                closeOnEmojiSelect: true,
                visibleTabs: const [ExpressionPickerTab.emojis],
                trackEmojiUsageOnSelect: false,
                onClose: () {
                  _reactionPickerOpen.value = false;
                  _hovered.value = false;
                },
                onEmojiSelected: _addReactionFromPicker,
                child: _actionButton(
                  context,
                  PhosphorIconsFill.smiley,
                  FluxerLocalizations.of(context).chatMessageAddReaction,
                  () {
                    _reactionPickerKey.currentState?.toggle();
                    _reactionPickerOpen.value =
                        _reactionPickerKey.currentState?.isOpen ?? false;
                  },
                ),
              ),
            _actionButton(
              context,
              PhosphorIconsFill.arrowBendUpLeft,
              FluxerLocalizations.of(context).chatMessageReply,
              widget.onReply,
            ),
            _actionButton(
              context,
              PhosphorIconsFill.shareFat,
              FluxerLocalizations.of(context).chatMessageForward,
              widget.onForward,
            ),
            _actionButton(
              context,
              PhosphorIconsFill.dotsThree,
              FluxerLocalizations.of(context).chatMessageMore,
              () {},
            ),
          ],
        ),
      ),
    );
  }

  Widget _actionButton(
    BuildContext context,
    IconData icon,
    String tooltip,
    VoidCallback? onTap,
  ) => Tooltip(
    message: tooltip,
    child: InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(6),
        child: PhosphorIcon(
          icon,
          size: 18,
          color: context.colors.interactiveNormal,
        ),
      ),
    ),
  );
}

/// Resolves author display and role color in an isolated consumer so presence
/// and member updates rebuild only the author header, not the full row body.
class _MessageAuthorScope extends ConsumerWidget {
  const _MessageAuthorScope({
    required this.message,
    required this.guildId,
    required this.currentUserId,
    required this.prefersPersistedAuthor,
    required this.builder,
  });

  final Message message;
  final String? guildId;
  final String? currentUserId;
  final bool prefersPersistedAuthor;
  final Widget Function(GuildUserDisplay display, Color? roleColor) builder;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Color? authorRoleColor;
    if (guildId != null && !prefersPersistedAuthor) {
      authorRoleColor = ref.watch(
        memberRoleColorProvider((message.authorId, guildId!)),
      );
    }
    final GuildUserDisplay authorDisplay = watchMessageAuthorDisplay(
      ref: ref,
      message: message,
      guildId: guildId,
      currentUserId: currentUserId,
    );
    return builder(authorDisplay, authorRoleColor);
  }
}
