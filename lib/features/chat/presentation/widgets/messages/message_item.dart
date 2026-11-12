import 'dart:async';

import 'package:flutter/gestures.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/providers/app/local_day_provider.dart';
import 'package:fluxer_app/core/router/route_state_providers.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/channels/domain/channel.dart';
import 'package:fluxer_app/features/channels/providers/channel_providers.dart';
import 'package:fluxer_app/features/chat/domain/chat_fullscreen_video_launch_context.dart';
import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/features/chat/domain/message_translation.dart';
import 'package:fluxer_app/features/chat/presentation/sheets/crosspost_community_sheet.dart';
import 'package:fluxer_app/features/chat/presentation/sheets/message_reactions_sheet.dart';
import 'package:fluxer_app/features/chat/presentation/sheets/publish_message_sheets.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/attachments/attachment_list_renderer.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/embeds/embed_audio.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/embeds/embed_gift.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/embeds/embed_image.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/embeds/embed_invite.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/embeds/embed_link.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/embeds/embed_rich.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/embeds/embed_spoiler_wrap.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/embeds/embed_theme.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/embeds/embed_video.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/message_actions/message_bottom_sheet.dart';
import 'package:fluxer_app/features/chat/presentation/'
    'widgets/message_actions/message_context_menu.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/message_actions/quick_reaction_loader.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/message_actions/quick_reaction_row.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/message_actions/reply_preview.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/message_actions/swipe_to_open_channel_details.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/message_actions/swipe_to_reply.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/messages/crosspost_publish_nudge.dart';
import 'package:fluxer_app/features/chat/presentation/'
    'widgets/messages/forward_indicator.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/messages/forwarded_message_content.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/messages/message_action_bar.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/messages/message_double_tap_exemption.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/messages/message_long_press_highlight.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/messages/message_markdown.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/messages/message_reactions_bar.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/messages/message_row_layout.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/messages/message_sticker_image.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/messages/message_translation_indicator.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/pickers/expression_picker.dart';
import 'package:fluxer_app/features/chat/providers/channel/channel_details_drawer_provider.dart';
import 'package:fluxer_app/features/chat/providers/core/chat_view_model.dart';
import 'package:fluxer_app/features/chat/providers/messages/channel_spoiler_sync_provider.dart';
import 'package:fluxer_app/features/chat/providers/messages/message_translation_provider.dart';
import 'package:fluxer_app/features/chat/providers/messages/spoiler_reveal_provider.dart';
import 'package:fluxer_app/features/chat/providers/pickers/expression_usage_provider.dart';
import 'package:fluxer_app/features/chat/utils/attachments/uploading_attachment_utils.dart';
import 'package:fluxer_app/features/chat/utils/channel_details_handheld.dart';
import 'package:fluxer_app/features/chat/utils/embeds/embed_gallery_utils.dart';
import 'package:fluxer_app/features/chat/utils/embeds/embed_render_utils.dart';
import 'package:fluxer_app/features/chat/utils/messages/double_tap_reaction.dart';
import 'package:fluxer_app/features/chat/utils/messages/message_accessibility_summary.dart';
import 'package:fluxer_app/features/chat/utils/messages/message_action_permissions.dart';
import 'package:fluxer_app/features/chat/utils/messages/message_timestamp_format.dart';
import 'package:fluxer_app/features/chat/utils/messages/spoiler_utils.dart';
import 'package:fluxer_app/features/dm/domain/dm_channel_types.dart';
import 'package:fluxer_app/features/dm/providers/dm_view_model.dart';
import 'package:fluxer_app/features/forum/domain/forum_channel.dart';
import 'package:fluxer_app/features/input/providers/focused_message_provider.dart';
import 'package:fluxer_app/features/input/providers/keyboard_mode_provider.dart';
import 'package:fluxer_app/features/members/domain/member.dart';
import 'package:fluxer_app/features/members/presentation/widgets/role_icon.dart';
import 'package:fluxer_app/features/profile/presentation/user_profile_sheet.dart';
import 'package:fluxer_app/features/settings/providers/preferences/advanced_preferences_provider.dart';
import 'package:fluxer_app/features/settings/providers/preferences/appearance_preferences_provider.dart';
import 'package:fluxer_app/features/settings/providers/preferences/chat_preferences_provider.dart';
import 'package:fluxer_app/features/settings/providers/preferences/message_ui_preferences_providers.dart';
import 'package:fluxer_app/features/settings/providers/preferences/time_format_providers.dart';
import 'package:fluxer_app/features/settings/providers/view_models/user_settings_view_model.dart';
import 'package:fluxer_app/features/shell/presentation/responsive_layout.dart';
import 'package:fluxer_app/features/threads/presentation/create_thread_sheet.dart';
import 'package:fluxer_app/features/threads/presentation/thread_messages.dart';
import 'package:fluxer_app/features/ui/ui.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/icons/phosphor.dart';
import 'package:fluxer_app/shared/markdown/message_markdown_settings.dart';
import 'package:fluxer_app/shared/providers/guild_user_display_provider.dart';
import 'package:fluxer_app/shared/providers/input_modality_provider.dart';
import 'package:fluxer_app/shared/providers/member_icon_role_provider.dart';
import 'package:fluxer_app/shared/providers/member_role_color.dart';
import 'package:fluxer_app/shared/utils/chat_context_utils.dart';
import 'package:fluxer_app/shared/utils/fluxer_haptics.dart';
import 'package:fluxer_app/shared/utils/guild_user_display.dart';
import 'package:fluxer_app/shared/utils/user_date_formatting.dart';
import 'package:fluxer_dart/export.dart' hide ChannelType;
import 'package:fluxer_markdown/fluxer_markdown.dart';

const _kMentionColor = Color.from(
  alpha: 1,
  red: 234 / 255,
  green: 197 / 255,
  blue: 50 / 255,
);

const _kJumpHighlightBg = Color.fromRGBO(59, 130, 246, 0.1);

const double _kMentionHoverOverlayAlpha = (0.14 - 0.1) / (1 - 0.1);

const double _kMessageActionBarOffset = 48;

const _kJumpHighlightBarWidth = 2.0;
const _kJumpHighlightFadeCurve = Cubic(0.32, 0.72, 0, 1);

const _kReplyRowHeight = 20.0;

const _kReplyBottomGap = 4.0;

const _kReplyLineEndGap = 6.0;

const double _kMessageSendingOpacity = 0.5;

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
  final bool allowAuthorProfileInPreview;
  final bool hideMentionHighlight;
  final bool previewContentOnly;
  final TextStyle? previewTextStyle;
  final bool isJumpHighlighted;
  final bool isSendDisabled;

  final bool swipeToReplyEnabled;

  final String? previewRoleGuildId;

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
    this.allowAuthorProfileInPreview = false,
    this.hideMentionHighlight = false,
    this.previewContentOnly = false,
    this.previewTextStyle,
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
  final _pressHighlight = ValueNotifier<bool>(false);
  final _reactionPickerKey = GlobalKey<FluxerEmojiPickerPopoutState>();
  final _reactionPickerOpen = ValueNotifier<bool>(false);
  final _actionBarHovered = ValueNotifier<bool>(false);
  final _moreMenuOpen = ValueNotifier<bool>(false);
  final _shiftHeld = ValueNotifier<bool>(false);
  final _contextMenuOpen = ValueNotifier<bool>(false);
  final LayerLink _actionBarLink = LayerLink();
  final OverlayPortalController _actionBarPortal = OverlayPortalController();
  bool _listeningForShift = false;
  final MessageDoubleTapExemption _doubleTapExemption =
      MessageDoubleTapExemption();
  bool _animateJumpHighlight = false;

  Message? _semanticLabelMessage;
  String? _semanticLabelAuthor;
  FluxerLocalizations? _semanticLabelL10n;
  bool _semanticLabelSending = false;
  bool _semanticLabelFailed = false;
  String? _semanticLabel;

  FluxerSpoilerSyncController get _spoilerSyncController =>
      ref.watch(channelSpoilerSyncProvider(widget.message.channelId));

  late final Listenable _hoverState = Listenable.merge([
    _hovered,
    _reactionPickerOpen,
    _actionBarHovered,
    _moreMenuOpen,
    _contextMenuOpen,
  ]);

  late final Listenable _actionBarContentState = Listenable.merge([
    _shiftHeld,
    _reactionPickerOpen,
    _moreMenuOpen,
  ]);

  bool get _pointerEngaged =>
      _hovered.value || _actionBarHovered.value || _moreMenuOpen.value;

  bool get _actionBarActive => _pointerEngaged || _reactionPickerOpen.value;

  bool get _rowHoverActive => _pointerEngaged || _contextMenuOpen.value;

  @override
  void initState() {
    super.initState();
    _hoverState.addListener(_syncActionBarPortal);
  }

  void _syncActionBarPortal() {
    if (!mounted) {
      return;
    }
    final bool active = _actionBarActive;
    if (active && !_actionBarPortal.isShowing) {
      _actionBarPortal.show();
    } else if (!active && _actionBarPortal.isShowing) {
      _actionBarPortal.hide();
    }
    _setShiftListening(active);
  }

  void _setShiftListening(bool listen) {
    if (listen == _listeningForShift) {
      return;
    }
    _listeningForShift = listen;
    if (listen) {
      _shiftHeld.value = HardwareKeyboard.instance.isShiftPressed;
      HardwareKeyboard.instance.addHandler(_handleShiftKey);
    } else {
      HardwareKeyboard.instance.removeHandler(_handleShiftKey);
      _shiftHeld.value = false;
    }
  }

  bool _handleShiftKey(KeyEvent event) {
    _shiftHeld.value = HardwareKeyboard.instance.isShiftPressed;
    return false;
  }

  @override
  void didUpdateWidget(MessageItem oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.isJumpHighlighted != widget.isJumpHighlighted) {
      _animateJumpHighlight = true;
    }
  }

  @override
  void dispose() {
    _hoverState.removeListener(_syncActionBarPortal);
    if (_listeningForShift) {
      HardwareKeyboard.instance.removeHandler(_handleShiftKey);
    }
    _hovered.dispose();
    _pressHighlight.dispose();
    _reactionPickerOpen.dispose();
    _actionBarHovered.dispose();
    _moreMenuOpen.dispose();
    _shiftHeld.dispose();
    _contextMenuOpen.dispose();
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

  List<Widget> _authorTags(BuildContext context, Message msg) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final List<Widget> tags = <Widget>[];
    if (msg.isCrosspostCopy) {
      tags.add(FluxerUserTag(isSystem: false, label: l10n.userTagCommunity));
    } else if (messageAuthorShowsUserTag(
      authorIsBot: msg.authorIsBot,
      authorIsSystem: msg.authorIsSystem,
    )) {
      tags.add(
        FluxerUserTag(
          isSystem: messageAuthorUserTagIsSystem(
            authorIsSystem: msg.authorIsSystem,
          ),
        ),
      );
    }
    final Channel? channel = ref
        .watch(channelByIdProvider(msg.channelId))
        .value;
    if (channel != null && channel.isThread) {
      final String? parentId = channel.parentId;
      if (parentId != null) {
        final Channel? parent = ref.watch(channelByIdProvider(parentId)).value;
        if (isForumPostOriginalPoster(
          thread: channel,
          parentChannel: parent,
          authorId: msg.authorId,
        )) {
          tags.add(FluxerUserTag(isSystem: false, label: l10n.userTagOp));
        }
      }
    }
    return tags;
  }

  bool _canPublish(Message message) {
    final Channel? channel = ref
        .read(channelByIdProvider(message.channelId))
        .value;
    return canPublishMessage(
      message: message,
      channelType: channel?.type,
      isOwnMessage:
          widget.currentUserId != null &&
          message.authorId == widget.currentUserId,
      canSendMessages: widget.canSendMessages,
      canManageMessages: widget.canManageMessages,
      isDmChannel: widget.isDmChannel,
      isSendDisabled: widget.isSendDisabled,
    );
  }

  bool _canOpenAuthorProfile(Message msg) {
    if (widget.inboxPreviewMode && !widget.allowAuthorProfileInPreview) {
      return false;
    }
    if (msg.isCrosspostCopy) {
      return true;
    }
    if (msg.isSystemMessage) {
      return false;
    }
    return msg.authorId.isNotEmpty;
  }

  void _openAuthorProfile(BuildContext context, Message msg) {
    if (!_canOpenAuthorProfile(msg)) {
      return;
    }
    if (msg.isCrosspostCopy) {
      unawaited(
        CrosspostCommunitySheet.show(
          context,
          channelId: msg.channelId,
          messageId: msg.id,
        ),
      );
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

  MessageMediaActionScope get _videoActionScope =>
      _mediaActionScopeFor(widget.message);

  MessageMediaActionScope get _forwardedSnapshotActionScope {
    final MessageSnapshot snapshot = widget.message.messageSnapshots.first;
    return _mediaActionScopeFor(
      widget.message.copyWith(
        attachments: snapshot.attachments,
        embeds: snapshot.embeds,
      ),
    );
  }

  MessageMediaActionScope _mediaActionScopeFor(Message message) {
    return MessageMediaActionScope(
      message: message,
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
        canPublish: _canPublish(message),
      ),
    );
  }

  bool get _canReportThisMessage =>
      widget.message.isReportable &&
      widget.message.authorId != widget.currentUserId;

  String? _guildIdForMessageActions() {
    return widget.previewRoleGuildId ??
        widget.renderSettings?.activeGuildId ??
        resolveGuildIdForChannel(ref, widget.message.channelId);
  }

  void _dispatchQuickReaction(QuickReactionItem item) {
    final String? usageKey = quickReactionUsageKey(item);
    if (usageKey != null) {
      unawaited(
        ref
            .read(expressionUsageProvider(ExpressionUsageKind.emoji).notifier)
            .track(usageKey),
      );
    }
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

  Future<void> _showActions(BuildContext context, Offset globalPosition) async {
    try {
      final RenderObject? renderObject = context.findRenderObject();
      final String? linkUrl = renderObject is RenderBox
          ? fluxerMarkdownLinkHrefAt(renderObject, globalPosition)
          : null;
      FluxerHaptics.medium();
      final VoidCallback? onDelete = widget.onDelete;
      final String? guildId = _guildIdForMessageActions();
      final MessageAction? action = await showMessageBottomSheet(
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
        canPublish: _canPublish(widget.message),
        quickReactionChannelId: widget.message.channelId,
        quickReactionGuildId: guildId,
        onQuickReaction: _dispatchQuickReaction,
        attachmentCallbacks: _videoActionScope.callbacks,
        linkUrl: linkUrl,
      );
      _dispatchMenuAction(action, onDelete: onDelete, isMobile: true);
    } finally {
      if (mounted) {
        _pressHighlight.value = false;
      }
    }
  }

  Future<void> _showContextMenu(
    BuildContext context,
    Offset position, {
    Rect? anchorRect,
  }) async {
    final String? guildId = _guildIdForMessageActions();
    final VoidCallback? onDelete = widget.onDelete;
    final ValueNotifier<bool> openFlag =
        (anchorRect == null ? _contextMenuOpen : _moreMenuOpen)..value = true;
    MessageAction? action;
    try {
      action = await showMessageContextMenu(
        context,
        position: position,
        anchorRect: anchorRect,
        message: widget.message,
        permissions: _videoActionScope.permissions,
        callbacks: _videoActionScope.callbacks,
        onQuickReaction: _dispatchQuickReaction,
        quickReactionChannelId: widget.message.channelId,
        quickReactionGuildId: guildId,
      );
    } finally {
      if (mounted) {
        _hovered.value = false;
        openFlag.value = false;
      }
    }
    if (!mounted) {
      return;
    }
    _dispatchMenuAction(action, onDelete: onDelete, isMobile: false);
  }

  void _openMoreMenu(BuildContext buttonContext) {
    if (_moreMenuOpen.value) {
      return;
    }
    final RenderObject? box = buttonContext.findRenderObject();
    if (box is! RenderBox || !box.hasSize) {
      return;
    }
    final Rect anchor = box.localToGlobal(Offset.zero) & box.size;
    unawaited(_showContextMenu(context, anchor.topLeft, anchorRect: anchor));
  }

  void _dispatchMenuAction(
    MessageAction? action, {
    required VoidCallback? onDelete,
    required bool isMobile,
  }) {
    if (action == MessageAction.delete) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        onDelete?.call();
      });
      return;
    }
    if (!context.mounted) {
      return;
    }
    _handleAction(action, isMobile: isMobile);
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
    final bool contentOnly = widget.previewContentOnly;
    final isGrouped = widget.isGrouped || contentOnly;
    final isMobile = isMobileLayout(context);
    final bool desktop = usesDesktopPointerUi(context);
    final bool showDesktopActionBar =
        !isMobile && desktop && !widget.inboxPreviewMode;
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
    final BoxBorder? rowBorder = showJumpHighlight
        ? BorderDirectional(
            start: BorderSide(
              color: context.colors.brandPrimaryLight,
              width: _kJumpHighlightBarWidth,
            ),
          )
        : showMentionHighlight
        ? const BorderDirectional(
            start: BorderSide(color: _kMentionColor, width: 2),
          )
        : null;
    final Color? hoverTintColor = showJumpHighlight
        ? null
        : showMentionHighlight
        ? _kMentionColor.withValues(alpha: _kMentionHoverOverlayAlpha)
        : context.colors.backgroundModifierHover;
    final bool isFailed = msg.hasFailed;
    final bool isSending = msg.isSending;
    final bool hasUploadingPlaceholderAttachments =
        _hasUploadingPlaceholderAttachments(msg);
    final bool dimEntireMessage =
        isSending && !hasUploadingPlaceholderAttachments;
    final bool dimMessagePartsExceptAttachments =
        isSending && hasUploadingPlaceholderAttachments;

    final bool canEditOwnMessage =
        widget.onEdit != null &&
        msg.authorId == widget.currentUserId &&
        msg.isUserMessage &&
        msg.messageSnapshots.isEmpty;
    final doubleTapAction = ref
        .watch(doubleTapActionPreferencesProvider)
        .effectiveAction;
    final bool doubleTapEnabled =
        !widget.inboxPreviewMode &&
        !isFailed &&
        !isSending &&
        messageDoubleTapEnabled(
          action: doubleTapAction,
          canAddReactions: widget.canAddReactions,
          onReaction: widget.onReaction,
          canEditOwnMessage: canEditOwnMessage,
          onEdit: widget.onEdit,
        );
    final rowGestures = FluxerGestureDetector(
      onTapUp: isFailed && !desktop && !widget.inboxPreviewMode
          ? (details) =>
                unawaited(_showActions(context, details.globalPosition))
          : null,
      onLongPressStart: !desktop && !widget.inboxPreviewMode
          ? (details) {
              _pressHighlight.value = true;
              unawaited(_showActions(context, details.globalPosition));
            }
          : null,
      onSecondaryTapUp: desktop && !widget.inboxPreviewMode
          ? (details) => _showContextMenu(context, details.globalPosition)
          : null,
      child: MouseRegion(
        onEnter: (_) => _hovered.value = true,
        onExit: (_) {
          if (!_reactionPickerOpen.value &&
              !_moreMenuOpen.value &&
              !_contextMenuOpen.value) {
            _hovered.value = false;
          }
        },
        child: _messageRowChrome(
          decoration: BoxDecoration(
            color: rowBackgroundColor,
            border: rowBorder,
          ),
          hoverTintColor: hoverTintColor,
          padding: contentOnly
              ? EdgeInsets.zero
              : widget.inboxPreviewMode
              ? EdgeInsetsDirectional.only(
                  start: hasLeftAccentBar ? 7 : 8,
                  end: 8,
                  top: isGrouped ? 2 : 8,
                  bottom: isGrouped ? 2 : 8,
                )
              : EdgeInsetsDirectional.only(
                  start: hasLeftAccentBar ? 14 : kMessageRowPaddingHorizontal,
                  end: showDesktopActionBar
                      ? kMessageRowPaddingHorizontal + _kMessageActionBarOffset
                      : kMessageRowPaddingHorizontal,
                  top: 2,
                  bottom: 2,
                ),
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (!contentOnly &&
                      (!isGrouped || messageDisplayCompact) &&
                      msg.isReply)
                    _wrapMessageSendingDim(
                      dim: dimMessagePartsExceptAttachments,
                      child: _buildReplyRow(
                        msg,
                        guildId: guildId,
                        messageDisplayCompact: messageDisplayCompact,
                        showCompactTimestampColumn: messageDisplayCompact,
                      ),
                    ),
                  if (!contentOnly &&
                      (!isGrouped || messageDisplayCompact) &&
                      msg.isForwarded &&
                      !msg.hasForwardSnapshots &&
                      msg.forwardedFrom != null)
                    _wrapMessageSendingDim(
                      dim: dimMessagePartsExceptAttachments,
                      child: Padding(
                        padding: EdgeInsetsDirectional.only(
                          start: messageDisplayCompact
                              ? compactMessageBodyStart(
                                  timestampColumnWidth:
                                      _compactTimestampColumnWidth(context),
                                )
                              : kMessageAvatarColumnWidth,
                        ),
                        child: ForwardIndicator(source: msg.forwardedFrom!),
                      ),
                    ),
                  if (messageDisplayCompact && !contentOnly)
                    _MessageAuthorScope(
                      message: msg,
                      guildId: guildId,
                      currentUserId: widget.currentUserId,
                      prefersPersistedAuthor: prefersPersistedAuthor,
                      builder:
                          (
                            GuildUserDisplay authorDisplay,
                            Color? authorRoleColor,
                            MemberRole? iconRole,
                          ) => _buildCompactMessageRow(
                            context,
                            msg,
                            isMobile,
                            isGrouped: isGrouped,
                            authorDisplay: authorDisplay,
                            authorRoleColor: authorRoleColor,
                            iconRole: iconRole,
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
                            MemberRole? iconRole,
                          ) => _buildMainRow(
                            context,
                            msg,
                            authorDisplay,
                            authorRoleColor,
                            iconRole,
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
            ],
          ),
        ),
      ),
    );
    final Widget rowWithActionBar = showDesktopActionBar
        ? OverlayPortal(
            controller: _actionBarPortal,
            overlayChildBuilder: (BuildContext overlayContext) =>
                _buildActionBarOverlay(overlayContext, isFailed: isFailed),
            child: CompositedTransformTarget(
              link: _actionBarLink,
              child: rowGestures,
            ),
          )
        : rowGestures;
    final body = RawGestureDetector(
      gestures: <Type, GestureRecognizerFactory>{
        if (doubleTapEnabled)
          _MessageDoubleTapGestureRecognizer:
              GestureRecognizerFactoryWithHandlers<
                _MessageDoubleTapGestureRecognizer
              >(
                () => _MessageDoubleTapGestureRecognizer(
                  ignoresPointer: (int pointer) =>
                      pointer == _doubleTapExemption.pointer,
                  debugOwner: this,
                ),
                (_MessageDoubleTapGestureRecognizer recognizer) {
                  recognizer.onDoubleTap = () => dispatchDoubleTapMessageAction(
                    ref: ref,
                    action: doubleTapAction,
                    onReaction: widget.onReaction,
                    onEdit: canEditOwnMessage ? widget.onEdit : null,
                  );
                },
              ),
      },
      child: MessageDoubleTapExemptionScope(
        exemption: _doubleTapExemption,
        child: rowWithActionBar,
      ),
    );
    final onReply = widget.onReply;
    final Widget semanticBody = Semantics(
      container: true,
      label: _messageSemanticLabel(
        context,
        msg,
        author: watchMessageAuthorDisplay(
          ref: ref,
          message: msg,
          guildId: guildId,
          currentUserId: widget.currentUserId,
        ).displayName,
        isSending: isSending,
        isFailed: isFailed,
      ),
      child: body,
    );
    final bool hasChannelDetailsSession =
        ref.watch(channelDetailsDrawerProvider) != null;
    final double screenWidth = MediaQuery.sizeOf(context).width;
    final bool channelDetailsDrawerBlocksSwipe = ref.watch(
      channelDetailsDrawerRevealProvider.select(
        (double revealPixels) => channelDetailsDrawerBlocksMessageSwipe(
          hasDrawerSession: hasChannelDetailsSession,
          revealPixels: revealPixels,
          screenWidth: screenWidth,
        ),
      ),
    );
    final bool swipeToOpenChannelDetails =
        handheldChannelDetailsGesturesApply(context) &&
        ref.watch(swipeRightToLeftActionPreferencesProvider).effectiveAction ==
            SwipeRightToLeftActionPreference.channelDetails;
    if (!isTouch || widget.inboxPreviewMode) {
      return _wrapMessageSendingDim(
        dim: dimEntireMessage,
        child: _wrapKeyboardFocus(
          focused: isKeyboardFocused,
          child: semanticBody,
        ),
      );
    }
    if (swipeToOpenChannelDetails) {
      return _wrapMessageSendingDim(
        dim: dimEntireMessage,
        child: _wrapKeyboardFocus(
          focused: isKeyboardFocused,
          child: SwipeToOpenChannelDetails(
            enabled:
                !channelDetailsDrawerBlocksSwipe && widget.swipeToReplyEnabled,
            channel: ref.read(channelByIdProvider(msg.channelId)).value,
            dm: findDmById(
              ref.read(dmViewModelProvider.select((s) => s.conversations)),
              msg.channelId,
            ),
            child: semanticBody,
          ),
        ),
      );
    }
    if (onReply == null) {
      return _wrapMessageSendingDim(
        dim: dimEntireMessage,
        child: _wrapKeyboardFocus(
          focused: isKeyboardFocused,
          child: semanticBody,
        ),
      );
    }
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
    required String author,
    required bool isSending,
    required bool isFailed,
  }) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final String? cached = _semanticLabel;
    if (cached != null &&
        identical(msg, _semanticLabelMessage) &&
        author == _semanticLabelAuthor &&
        identical(l10n, _semanticLabelL10n) &&
        isSending == _semanticLabelSending &&
        isFailed == _semanticLabelFailed) {
      return cached;
    }
    final String summary = messageAccessibilitySummary(msg, l10n);
    final StringBuffer label = StringBuffer(
      l10n.messageAccessibilityLabel(author, summary),
    );
    if (isSending) {
      label.write(l10n.messageAccessibilitySendingSuffix);
    } else if (isFailed) {
      label.write(l10n.messageAccessibilityFailedSuffix);
    }
    _semanticLabelMessage = msg;
    _semanticLabelAuthor = author;
    _semanticLabelL10n = l10n;
    _semanticLabelSending = isSending;
    _semanticLabelFailed = isFailed;
    return _semanticLabel = label.toString();
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

  Widget _messageRowChrome({
    required Decoration decoration,
    required EdgeInsetsGeometry padding,
    required Color? hoverTintColor,
    required Widget child,
  }) {
    final Widget stacked = Stack(
      children: [
        Positioned.fill(
          child: ValueListenableBuilder<bool>(
            valueListenable: _pressHighlight,
            builder: (context, active, _) {
              return MessageLongPressHighlight(active: active);
            },
          ),
        ),
        Positioned.fill(
          child: ListenableBuilder(
            listenable: _hoverState,
            builder: (context, _) {
              if (!_rowHoverActive || hoverTintColor == null) {
                return const SizedBox.shrink();
              }
              return ColoredBox(color: hoverTintColor);
            },
          ),
        ),
        Padding(padding: padding, child: child),
      ],
    );
    final Duration duration = context.motion.slow;
    if (duration == Duration.zero ||
        (!_animateJumpHighlight && !widget.isJumpHighlighted) ||
        MediaQuery.disableAnimationsOf(context)) {
      return DecoratedBox(decoration: decoration, child: stacked);
    }
    return AnimatedContainer(
      duration: duration,
      curve: _kJumpHighlightFadeCurve,
      decoration: decoration,
      onEnd: () {
        if (!mounted || widget.isJumpHighlighted) {
          return;
        }
        setState(() => _animateJumpHighlight = false);
      },
      child: stacked,
    );
  }

  Widget _buildReplyRow(
    Message msg, {
    required String? guildId,
    bool messageDisplayCompact = false,
    bool showCompactTimestampColumn = false,
  }) {
    final double replyRowHeight = MediaQuery.textScalerOf(
      context,
    ).scale(_kReplyRowHeight);
    final double replyAreaHeight = replyRowHeight + _kReplyBottomGap;
    if (messageDisplayCompact) {
      final double contentStart = showCompactTimestampColumn
          ? compactMessageBodyStart(
              timestampColumnWidth: _compactTimestampColumnWidth(context),
            )
          : 0;
      return SizedBox(
        height: replyAreaHeight,
        child: CustomPaint(
          painter: CompactReplyConnectorPainter(
            spineCenterX: kCompactReplySpineInlineOffset,
            lineTop: replyRowHeight / 2,
            lineBottom: replyAreaHeight - 5,
            horizontalEnd: contentStart - _kReplyLineEndGap,
            color: context.colors.interactiveMuted,
            textDirection: Directionality.of(context),
          ),
          child: Padding(
            padding: EdgeInsetsDirectional.only(
              start: contentStart,
              bottom: _kReplyBottomGap,
            ),
            child: SizedBox(
              height: replyRowHeight,
              child: Align(
                alignment: AlignmentDirectional.centerStart,
                child: InlineReplyPreview(
                  message: msg,
                  guildId: guildId,
                  currentUserId: widget.currentUserId,
                  messageDisplayCompact: messageDisplayCompact,
                ),
              ),
            ),
          ),
        ),
      );
    }
    const avatarCenterX = 20.0;
    final double lineTop = replyRowHeight / 2;
    final double lineBottom = replyAreaHeight - 5;
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
          textDirection: Directionality.of(context),
        ),
        child: Padding(
          padding: const EdgeInsetsDirectional.only(
            start: replyContentLeft,
            bottom: _kReplyBottomGap,
          ),
          child: SizedBox(
            height: replyRowHeight,
            child: Align(
              alignment: AlignmentDirectional.centerStart,
              child: InlineReplyPreview(
                message: msg,
                guildId: guildId,
                currentUserId: widget.currentUserId,
                messageDisplayCompact: messageDisplayCompact,
              ),
            ),
          ),
        ),
      ),
    );
  }

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
    final attachmentSize = chatPreferences.attachmentMediaDimensionSize;

    return [
      if ((msg.content.isNotEmpty || msg.isCrosspostSourceDeleted) &&
          !msg.shouldHideContent(renderEmbeds: renderEmbeds))
        wrapPart(
          _buildMessageTextWithEditedTag(
            context,
            msg,
            isMobile: isMobile,
            revealSpoilers: revealSpoilers,
          ),
        ),
      if (!widget.inboxPreviewMode) CrosspostPublishNudge(message: msg),
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
            mediaActionScope: _forwardedSnapshotActionScope,
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
          spoilerSyncController: _spoilerSyncController,
          messageId: msg.id,
          messageNonce: msg.clientNonce,
          messageSendFailed: msg.hasFailed,
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
                final spoilerSyncKeys = spoilerSyncKeysForMessageEmbed(
                  messageContent: msg.content,
                  embed: embed,
                  messageEmbeds: msg.embeds,
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
              children: [
                for (final MessageSticker sticker in msg.stickers)
                  MessageStickerImage(sticker: sticker),
              ],
            ),
          ),
        ),
      if (renderReactions && msg.reactions.isNotEmpty)
        wrapPart(
          Padding(
            padding: const EdgeInsets.only(top: 4),
            child: Listener(
              onPointerDown: (PointerDownEvent event) =>
                  _doubleTapExemption.pointer = event.pointer,
              child: MessageReactionsBar(
                reactions: msg.reactions,
                channelId: msg.channelId,
                onReactionTap: (emoji, {emojiId, animated = false}) => widget
                    .onReaction
                    ?.call(emoji, emojiId: emojiId, animated: animated),
                onReactionLongPress: widget.inboxPreviewMode
                    ? null
                    : (reaction) {
                        unawaited(
                          showMessageReactionsSheet(
                            context,
                            message: msg,
                            initialReaction: reaction,
                          ),
                        );
                      },
                showAddReaction:
                    widget.canAddReactions &&
                    msg.supportsInteractiveActions &&
                    !widget.inboxPreviewMode,
                isMobile: isMobile,
              ),
            ),
          ),
        ),
      if (!widget.inboxPreviewMode && messageMayCarryThread(msg))
        wrapPart(
          MessageThreadChip(
            message: msg,
            guildId:
                widget.previewRoleGuildId ??
                widget.renderSettings?.activeGuildId,
          ),
        ),
      if (msg.flags & messageFlagFailedToMentionSomeRolesInThread != 0)
        wrapPart(ThreadFailedToMentionRolesNote(message: msg)),
      if (msg.hasFailed) wrapPart(_buildDeliveryStatus(context, msg)),
    ];
  }

  Widget _buildDeliveryStatus(BuildContext context, Message msg) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    return Padding(
      padding: const EdgeInsets.only(top: 4),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          PhosphorIcon(
            PhosphorIconsBold.warningCircle,
            size: 14,
            color: context.colors.textDanger,
          ),
          const SizedBox(width: 4),
          Flexible(
            child: Text(
              usesDesktopPointerUi(context)
                  ? l10n.chatMessageFailedToSend
                  : l10n.chatMessageFailedToSendTapForOptions,
              style: context.textStyles.smallText.copyWith(
                color: context.colors.textDanger,
              ),
            ),
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
      data: msg.isCrosspostSourceDeleted
          ? FluxerLocalizations.of(context).chatMessageOriginalDeleted
          : msg.displayedContent,
      messageId: msg.id,
      baseStyle: widget.previewTextStyle,
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

  TextStyle _compactTimestampStyle(
    BuildContext context, {
    FontWeight fontWeight = FontWeight.w400,
  }) => compactTimestampTextStyle(
    base: context.textStyles.timestamp,
    color: context.colors.textPrimaryMuted,
    fontWeight: fontWeight,
  );

  double _compactTimestampColumnWidth(BuildContext context) {
    final bool use12Hour = ref.watch(use12HourTimeFormatProvider);
    return measureCompactTimestampColumnWidth(
      _compactTimestampStyle(context),
      Localizations.localeOf(context).toString(),
      use12Hour: use12Hour,
    );
  }

  Widget _buildCompactTimestamp(
    BuildContext context, {
    required bool isGrouped,
    required String formattedTime,
    required TextStyle style,
  }) {
    final Widget timestamp = Text(
      formattedTime,
      style: style,
      softWrap: false,
      maxLines: 1,
    );
    if (!isGrouped) {
      return timestamp;
    }
    return ListenableBuilder(
      listenable: _hoverState,
      builder: (context, child) =>
          Opacity(opacity: _rowHoverActive ? 1.0 : 0.0, child: child),
      child: timestamp,
    );
  }

  Widget _buildCompactAuthorPrefix(
    BuildContext context,
    Message msg,
    GuildUserDisplay authorDisplay,
    Color? roleColor, {
    required bool showAvatar,
    MemberRole? iconRole,
  }) {
    final TextStyle nameStyle = context.textStyles.username.copyWith(
      color: roleColor ?? context.colors.textChat,
      fontWeight: FontWeight.w500,
    );
    return Wrap(
      spacing: kCompactAuthorGap,
      runSpacing: 2,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        ..._authorTags(context, msg),
        if (showAvatar)
          _AuthorProfileTapTarget(
            onPointerDown: (int pointer) =>
                _doubleTapExemption.pointer = pointer,
            onTap: _canOpenAuthorProfile(msg)
                ? () => _openAuthorProfile(context, msg)
                : null,
            child: Padding(
              padding: const EdgeInsetsDirectional.only(
                end: kCompactTimestampGap,
              ),
              child: FluxerAvatar.user(
                key: ValueKey<String>(
                  'compact-msg-avatar-${msg.authorId}-${authorDisplay.avatarUrl ?? ''}',
                ),
                fallbackText: authorDisplay.displayName,
                userId: msg.authorId,
                imageUrl: authorDisplay.avatarUrl,
                avatarColor: authorDisplay.avatarColor,
                showStatus: false,
                size: kCompactAvatarSize,
              ),
            ),
          ),
        _AuthorProfileTapTarget(
          onPointerDown: (int pointer) => _doubleTapExemption.pointer = pointer,
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
        if (iconRole != null && iconRole.hasIcon)
          RoleIcon(role: iconRole, size: 16),
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
    MemberRole? iconRole,
  }) {
    final bool showCompactMetadata = !isGrouped || !isMobile;
    final bool showsAuthor = authorDisplay != null && showCompactMetadata;
    final bool stackAuthorAboveContent = isMobile && showsAuthor;
    final bool use12Hour = ref.watch(use12HourTimeFormatProvider);
    final String locale = Localizations.localeOf(context).toString();
    final String formattedTime = formatUserTime(
      msg.timestamp.toLocal(),
      locale,
      use12Hour: use12Hour,
    );
    final TextStyle timestampStyle = _compactTimestampStyle(
      context,
      fontWeight: isGrouped && !isMobile ? FontWeight.w500 : FontWeight.w400,
    );
    final double timestampColumnWidth = _compactTimestampColumnWidth(context);
    final double blockContentPadding = showsAuthor && !stackAuthorAboveContent
        ? kCompactTextIndentFromUsername
        : 0;
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
    final bool hasInlineText =
        msg.content.isNotEmpty &&
        !msg.shouldHideContent(renderEmbeds: renderEmbeds);
    final Widget? inlineText = hasInlineText && content.isNotEmpty
        ? content.first
        : null;
    final List<Widget> blockContent = hasInlineText && content.isNotEmpty
        ? content.sublist(1)
        : content;
    final Widget? compactBody = (showsAuthor || inlineText != null)
        ? _wrapMessageSendingDim(
            dim: dimMessagePartsExceptAttachments,
            child: switch ((stackAuthorAboveContent, showsAuthor)) {
              (true, _) => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (showsAuthor)
                    _buildCompactAuthorPrefix(
                      context,
                      msg,
                      authorDisplay,
                      authorRoleColor,
                      iconRole: iconRole,
                      showAvatar: showUserAvatarsInCompactMode,
                    ),
                  ?inlineText,
                ],
              ),
              (false, true) => Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsetsDirectional.only(
                      end: kCompactUsernameGap,
                    ),
                    child: _buildCompactAuthorPrefix(
                      context,
                      msg,
                      authorDisplay!,
                      authorRoleColor,
                      iconRole: iconRole,
                      showAvatar: showUserAvatarsInCompactMode,
                    ),
                  ),
                  if (inlineText != null) Expanded(child: inlineText),
                ],
              ),
              (false, false) => inlineText ?? const SizedBox.shrink(),
            },
          )
        : null;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: timestampColumnWidth,
          child: showCompactMetadata
              ? Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: _buildCompactTimestamp(
                    context,
                    isGrouped: isGrouped,
                    formattedTime: formattedTime,
                    style: timestampStyle,
                  ),
                )
              : null,
        ),
        const SizedBox(width: kCompactTimestampGap),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ?compactBody,
              if (blockContent.isNotEmpty)
                Padding(
                  padding: EdgeInsetsDirectional.only(
                    start: blockContentPadding,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: blockContent,
                  ),
                ),
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
      if (!widget.previewContentOnly)
        _wrapMessageSendingDim(
          dim: dimMessagePartsExceptAttachments,
          child: _AuthorProfileTapTarget(
            onPointerDown: (int pointer) =>
                _doubleTapExemption.pointer = pointer,
            onTap: _canOpenAuthorProfile(msg)
                ? () => _openAuthorProfile(context, msg)
                : null,
            child: SizedBox(
              width: kMessageAvatarColumnWidth,
              child: Align(
                alignment: AlignmentDirectional.centerStart,
                child: ListenableBuilder(
                  listenable: _hoverState,
                  builder: (context, child) => Opacity(
                    opacity: _rowHoverActive ? 1.0 : 0.0,
                    child: child,
                  ),
                  child: _buildGroupedHoverTimestamp(context, msg),
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

  Widget _buildGroupedHoverTimestamp(BuildContext context, Message msg) {
    final bool rtl = Directionality.of(context) == TextDirection.rtl;
    return SizedBox(
      width: kMessageAvatarSize,
      height: kCompactMessageLineHeight,
      child: Transform.translate(
        offset: Offset(rtl ? -8 : 8, 0),
        child: OverflowBox(
          alignment: AlignmentDirectional.centerEnd,
          maxWidth: double.infinity,
          child: Text(
            formatUserTime(
              msg.timestamp.toLocal(),
              Localizations.localeOf(context).toString(),
              use12Hour: ref.watch(use12HourTimeFormatProvider),
            ),
            softWrap: false,
            maxLines: 1,
            style: context.textStyles.timestamp.copyWith(
              color: context.colors.textPrimaryMuted,
              fontSize: kCompactTimestampFontSize,
              fontWeight: FontWeight.w500,
              height: kCompactMessageLineHeight / kCompactTimestampFontSize,
            ),
          ),
        ),
      ),
    );
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

  Widget _buildMainRow(
    BuildContext context,
    Message msg,
    GuildUserDisplay authorDisplay,
    Color? roleColor,
    MemberRole? iconRole,
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
          child: _AuthorProfileTapTarget(
            onPointerDown: (int pointer) =>
                _doubleTapExemption.pointer = pointer,
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
                  showStatus: false,
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
              child: Row(
                children: [
                  Flexible(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Flexible(
                          child: _AuthorProfileTapTarget(
                            onPointerDown: (int pointer) =>
                                _doubleTapExemption.pointer = pointer,
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
                        ),
                        if (iconRole != null && iconRole.hasIcon)
                          Padding(
                            padding: const EdgeInsetsDirectional.only(start: 4),
                            child: RoleIcon(role: iconRole, size: 20),
                          ),
                        for (final Widget tag in _authorTags(context, msg)) ...[
                          const SizedBox(width: 6),
                          tag,
                        ],
                      ],
                    ),
                  ),
                  const SizedBox(width: 6),
                  Text(
                    formatMessageTimestamp(
                      msg.timestamp.toLocal(),
                      FluxerLocalizations.of(context),
                      Localizations.localeOf(context).toString(),
                      use12Hour: ref.watch(use12HourTimeFormatProvider),
                      now: ref.watch(localDayProvider),
                    ),
                    style: context.textStyles.timestamp,
                  ),
                  if ((msg.flags & messageFlagSuppressNotifications) != 0) ...[
                    const SizedBox(width: 6),
                    _buildSilentIndicator(context),
                  ],
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
        border: BorderDirectional(
          start: BorderSide(
            color: context.colors.brandPrimaryLight,
            width: _kJumpHighlightBarWidth,
          ),
        ),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.only(
          start: kMessageRowPaddingHorizontal + _kJumpHighlightBarWidth,
          end: kMessageRowPaddingHorizontal,
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
                  showStatus: false,
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
                        for (final Widget tag in _authorTags(context, msg)) ...[
                          const SizedBox(width: 6),
                          tag,
                        ],
                        const SizedBox(width: 8),
                        Text(
                          formatMessageTimestamp(
                            msg.timestamp.toLocal(),
                            l10n,
                            Localizations.localeOf(context).toString(),
                            use12Hour: use12Hour,
                            now: ref.watch(localDayProvider),
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
                              padding: const EdgeInsetsDirectional.only(end: 6),
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
                            child: MediaQuery.withNoTextScaling(
                              child: FluxerGestureDetector(
                                onTap: widget.onDismissClientSystem,
                                child: Text(
                                  l10n.chatClientSystemDismiss,
                                  style: dismissTextStyle,
                                ),
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
        channelId: channelId,
        embedIndex: embedIndex,
        videoActionScope: _videoActionScope,
      ),
      EmbedType.audio when embed.hasRichEmbedContent => EmbedRich(
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
      EmbedType.audio when shouldRenderMediaOnlyAudioEmbed(embed) => EmbedAudio(
        embed: embed,
        dimensionSize: dimensionSize,
        channelId: channelId,
        embedIndex: embedIndex,
      ),
      EmbedType.audio => const SizedBox.shrink(),
    };

    return Padding(
      padding: const EdgeInsets.only(top: 2),
      child: wrapEmbedSpoiler(
        type: embed.type,
        isSpoiler: isSpoiler,
        revealSpoilers: revealSpoilers,
        spoilerSyncController: _spoilerSyncController,
        spoilerSyncKeys: spoilerSyncKeys,
        child: child,
      ),
    );
  }

  Rect? _actionBarClipRect(BuildContext overlayContext) {
    final RenderObject? viewport = context
        .findAncestorStateOfType<ScrollableState>()
        ?.context
        .findRenderObject();
    final RenderObject? overlay = Overlay.maybeOf(
      overlayContext,
    )?.context.findRenderObject();
    if (viewport is! RenderBox ||
        overlay is! RenderBox ||
        !viewport.hasSize ||
        !viewport.attached) {
      return null;
    }
    return MatrixUtils.transformRect(
      viewport.getTransformTo(overlay),
      Offset.zero & viewport.size,
    );
  }

  Widget _buildActionBarOverlay(
    BuildContext overlayContext, {
    required bool isFailed,
  }) {
    final TextDirection direction = Directionality.of(overlayContext);
    final Alignment topEnd = AlignmentDirectional.topEnd.resolve(direction);
    final Widget follower = CompositedTransformFollower(
      link: _actionBarLink,
      showWhenUnlinked: false,
      targetAnchor: topEnd,
      followerAnchor: topEnd,
      offset: Offset(
        direction == TextDirection.rtl
            ? kMessageActionBarEndInset
            : -kMessageActionBarEndInset,
        kMessageActionBarTopOffset,
      ),
      child: Align(
        alignment: topEnd,
        child: MouseRegion(
          onEnter: (_) => _actionBarHovered.value = true,
          onExit: (_) {
            if (mounted) {
              _actionBarHovered.value = false;
            }
          },
          child: isFailed
              ? _buildFailedActions(overlayContext)
              : _buildActions(overlayContext),
        ),
      ),
    );
    final Rect? clip = _actionBarClipRect(overlayContext);
    if (clip == null) {
      return follower;
    }
    return ClipRect(clipper: _FixedRectClipper(clip), child: follower);
  }

  Widget _buildActions(BuildContext context) {
    return Consumer(
      builder: (BuildContext context, WidgetRef ref, _) {
        final (
          bool showMessageActionBar,
          bool showMessageActionBarShiftExpand,
          bool onlyMoreButton,
          bool showQuickReactions,
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
        if (!showMessageActionBar || widget.message.isSending) {
          return const SizedBox.shrink();
        }
        final bool developerMode = ref.watch(
          userSettingsViewModelProvider.select((s) => s.developerMode),
        );
        final bool canCreateThread = watchCanCreateThreadFromMessage(
          ref,
          widget.message,
        );
        return ListenableBuilder(
          listenable: _actionBarContentState,
          builder: (BuildContext context, _) => MessageActionBar(
            children: onlyMoreButton
                ? <Widget>[_moreActionButton(context)]
                : _actionBarButtons(
                    context,
                    showFullActions:
                        showMessageActionBarShiftExpand && _shiftHeld.value,
                    showQuickReactions: showQuickReactions,
                    developerMode: developerMode,
                    canCreateThread: canCreateThread,
                  ),
          ),
        );
      },
    );
  }

  Widget _moreActionButton(BuildContext context) {
    return Builder(
      builder: (BuildContext buttonContext) => MessageActionBarButton(
        label: FluxerLocalizations.of(context).chatMessageMore,
        active: _moreMenuOpen.value,
        onTap: () => _openMoreMenu(buttonContext),
        child: const PhosphorIcon(PhosphorIconsBold.dotsThree),
      ),
    );
  }

  List<Widget> _actionBarButtons(
    BuildContext context, {
    required bool showFullActions,
    required bool showQuickReactions,
    required bool developerMode,
    required bool canCreateThread,
  }) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final Message msg = widget.message;
    final bool interactive = msg.supportsInteractiveActions;
    final bool canAddReactions = widget.canAddReactions && interactive;
    final bool isOwnMessage =
        widget.currentUserId != null && msg.authorId == widget.currentUserId;
    final bool showsEditInTail =
        widget.onEdit != null &&
        isOwnMessage &&
        msg.isUserMessage &&
        msg.messageSnapshots.isEmpty;
    final bool canReply =
        widget.onReply != null &&
        msg.isUserMessage &&
        interactive &&
        widget.canSendMessages;
    final bool canDelete = widget.canDelete && widget.onDelete != null;
    final bool canPublish = interactive && _canPublish(msg);
    final Widget? replyButton = canReply
        ? MessageActionBarButton(
            label: l10n.chatMessageReply,
            onTap: widget.onReply,
            child: const PhosphorIcon(PhosphorIconsFill.arrowBendUpLeft),
          )
        : null;
    return <Widget>[
      if (canAddReactions && showQuickReactions && !showFullActions)
        MessageQuickReactionItems(
          channelId: msg.channelId,
          guildId: _guildIdForMessageActions(),
          reuseCached: true,
          builder: (BuildContext context, List<QuickReactionItem> items) => Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              for (final QuickReactionItem item in items.take(3))
                MessageActionBarButton(
                  label: quickReactionShortcode(item),
                  onTap: () => _dispatchQuickReaction(item),
                  child: QuickReactionGlyph(
                    item: item,
                    size: kMessageActionBarIconSize,
                  ),
                ),
            ],
          ),
        ),
      if (showFullActions) ...<Widget>[
        if (developerMode)
          MessageActionBarButton(
            label: l10n.chatMessageDebug,
            onTap: () =>
                _handleAction(MessageAction.debugMessage, isMobile: false),
            child: const PhosphorIcon(PhosphorIconsFill.bug),
          ),
        MessageActionBarButton(
          label: l10n.chatMessageCopyMessageId,
          onTap: () =>
              _handleAction(MessageAction.copyMessageId, isMobile: false),
          child: const PhosphorIcon(PhosphorIconsRegular.snowflake),
        ),
        if (interactive)
          MessageActionBarButton(
            label: l10n.chatMessageCopyMessageLink,
            onTap: () =>
                _handleAction(MessageAction.copyMessageLink, isMobile: false),
            child: const PhosphorIcon(PhosphorIconsBold.link),
          ),
        MessageActionBarButton(
          label: l10n.chatMessageMarkAsUnread,
          onTap: () =>
              _handleAction(MessageAction.markAsUnread, isMobile: false),
          child: const PhosphorIcon(PhosphorIconsFill.envelopeOpen),
        ),
        if (msg.isUserMessage && widget.canPinMessage)
          MessageActionBarButton(
            label: msg.isPinned ? l10n.chatMessageUnpin : l10n.chatMessagePin,
            onTap: () => _handleAction(MessageAction.pin, isMobile: false),
            child: const PhosphorIcon(PhosphorIconsFill.pushPin),
          ),
        if (showsEditInTail) ?replyButton,
      ],
      if (canAddReactions)
        FluxerEmojiPickerPopout(
          key: _reactionPickerKey,
          closeOnEmojiSelect: true,
          visibleTabs: const [ExpressionPickerTab.emojis],
          channelId: msg.channelId,
          placement: usesDesktopPointerUi(context)
              ? FluxerEmojiPickerPlacement.leftStart
              : FluxerEmojiPickerPlacement.verticalEnd,
          onClose: () {
            _reactionPickerOpen.value = false;
            _hovered.value = false;
          },
          onEmojiSelected: _addReactionFromPicker,
          child: MessageActionBarButton(
            label: l10n.chatMessageAddReaction,
            active: _reactionPickerOpen.value,
            onTap: () {
              _reactionPickerKey.currentState?.toggle();
              _reactionPickerOpen.value =
                  _reactionPickerKey.currentState?.isOpen ?? false;
            },
            child: const PhosphorIcon(PhosphorIconsFill.smiley),
          ),
        ),
      if (showsEditInTail)
        MessageActionBarButton(
          label: l10n.chatMessageEdit,
          onTap: widget.onEdit,
          child: const PhosphorIcon(PhosphorIconsFill.pencilSimple),
        )
      else
        ?replyButton,
      if (msg.isUserMessage && interactive && widget.onForward != null)
        MessageActionBarButton(
          label: l10n.chatMessageForward,
          onTap: widget.onForward,
          child: const PhosphorIcon(PhosphorIconsFill.arrowBendUpRight),
        ),
      if (canPublish)
        MessageActionBarButton(
          label: msg.isCrossposted
              ? l10n.chatMessagePublished
              : l10n.chatMessagePublish,
          disabled: msg.isCrossposted,
          onTap: () => unawaited(
            publishMessage(ref: ref, context: context, message: msg),
          ),
          child: const PhosphorIcon(PhosphorIconsFill.megaphone),
        ),
      if (canCreateThread)
        MessageActionBarButton(
          label: l10n.threadCreate,
          onTap: () =>
              _handleAction(MessageAction.createThread, isMobile: false),
          child: const PhosphorIcon(PhosphorIconsFill.chats),
        ),
      if (showFullActions && canDelete)
        MessageActionBarButton(
          label: l10n.chatMessageDelete,
          danger: true,
          onTap: widget.onDelete,
          child: const PhosphorIcon(PhosphorIconsFill.trash),
        )
      else
        _moreActionButton(context),
    ];
  }

  Widget _buildFailedActions(BuildContext context) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    return MessageActionBar(
      children: <Widget>[
        MessageActionBarButton(
          label: l10n.retry,
          onTap: widget.onRetry,
          child: const PhosphorIcon(PhosphorIconsFill.arrowsClockwise),
        ),
        MessageActionBarButton(
          label: l10n.chatMessageDeleteFailed,
          danger: true,
          onTap: widget.onDeleteFailed,
          child: const PhosphorIcon(PhosphorIconsFill.trash),
        ),
      ],
    );
  }
}

class _FixedRectClipper extends CustomClipper<Rect> {
  const _FixedRectClipper(this.rect);

  final Rect rect;

  @override
  Rect getClip(Size size) => rect;

  @override
  bool shouldReclip(_FixedRectClipper oldClipper) => rect != oldClipper.rect;
}

class _AuthorProfileTapTarget extends StatelessWidget {
  const _AuthorProfileTapTarget({
    required this.onPointerDown,
    required this.onTap,
    required this.child,
  });

  final ValueChanged<int> onPointerDown;
  final VoidCallback? onTap;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final VoidCallback? onTap = this.onTap;
    return Listener(
      onPointerDown: onTap == null
          ? null
          : (PointerDownEvent event) => onPointerDown(event.pointer),
      child: FluxerGestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: onTap,
        child: child,
      ),
    );
  }
}

class _MessageDoubleTapGestureRecognizer extends DoubleTapGestureRecognizer {
  _MessageDoubleTapGestureRecognizer({
    required this.ignoresPointer,
    super.debugOwner,
  });

  final bool Function(int pointer) ignoresPointer;

  @override
  bool isPointerAllowed(PointerDownEvent event) =>
      !ignoresPointer(event.pointer) &&
      !_hitsTappableTextSpan(event) &&
      super.isPointerAllowed(event);

  static bool _hitsTappableTextSpan(PointerDownEvent event) {
    final HitTestResult result = HitTestResult();
    GestureBinding.instance.hitTestInView(result, event.position, event.viewId);
    return result.path.any(
      (HitTestEntry entry) =>
          entry.target is TextSpan &&
          (entry.target as TextSpan).recognizer != null,
    );
  }
}

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
  final Widget Function(
    GuildUserDisplay display,
    Color? roleColor,
    MemberRole? iconRole,
  )
  builder;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Color? authorRoleColor;
    MemberRole? iconRole;
    if (guildId != null && !prefersPersistedAuthor) {
      authorRoleColor = ref.watch(
        memberRoleColorProvider((message.authorId, guildId!)),
      );
      iconRole = ref.watch(
        memberIconRoleProvider((message.authorId, guildId!)),
      );
    }
    final GuildUserDisplay authorDisplay = watchMessageAuthorDisplay(
      ref: ref,
      message: message,
      guildId: guildId,
      currentUserId: currentUserId,
    );
    return builder(authorDisplay, authorRoleColor, iconRole);
  }
}
