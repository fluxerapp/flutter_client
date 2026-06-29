import 'dart:async';

import 'package:cached_network_image_ce/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/limits/instance_limit_provider.dart';
import 'package:fluxer_app/core/limits/limit_key.dart';
import 'package:fluxer_app/core/media/fluxer_media_url.dart';
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/core/router/route_state_providers.dart';
import 'package:fluxer_app/core/talker.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/features/chat/domain/message_avatar.dart';
import 'package:fluxer_app/features/chat/presentation/'
    'sheets/message_debug_sheet.dart';
import 'package:fluxer_app/features/chat/presentation/'
    'sheets/unpin_message_confirm_sheet.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/attachments/attachment_list_renderer.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/embeds/embed_image.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/embeds/embed_invite.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/embeds/embed_link.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/embeds/embed_rich.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/embeds/embed_theme.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/embeds/embed_video.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/media/embed_animated_image.dart';
import 'package:fluxer_app/features/chat/presentation/'
    'widgets/message_actions/message_bottom_sheet.dart';
import 'package:fluxer_app/features/chat/presentation/'
    'widgets/message_actions/message_context_menu.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/message_actions/quick_reaction_row.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/message_actions/reply_preview.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/message_actions/swipe_to_reply.dart';
import 'package:fluxer_app/features/chat/presentation/'
    'widgets/messages/forward_indicator.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/messages/forwarded_message_content.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/messages/message_markdown.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/messages/message_row_layout.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/messages/spoiler_overlay.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/pickers/expression_picker.dart';
import 'package:fluxer_app/features/chat/providers/channel/channel_details_providers.dart';
import 'package:fluxer_app/features/chat/providers/channel/channel_message_permissions_provider.dart';
import 'package:fluxer_app/features/chat/providers/core/chat_providers.dart';
import 'package:fluxer_app/features/chat/providers/messages/spoiler_reveal_provider.dart';
import 'package:fluxer_app/features/chat/providers/pickers/emoji_picker_provider.dart';
import 'package:fluxer_app/features/chat/utils/message_link.dart';
import 'package:fluxer_app/features/chat/utils/message_timestamp_format.dart';
import 'package:fluxer_app/features/chat/utils/spoiler_utils.dart';
import 'package:fluxer_app/features/chat/utils/uploading_attachment_utils.dart';
import 'package:fluxer_app/features/dm/domain/dm_channel_types.dart';
import 'package:fluxer_app/features/profile/presentation/user_profile_sheet.dart';
import 'package:fluxer_app/features/settings/providers/chat_preferences_provider.dart';
import 'package:fluxer_app/features/settings/providers/user_settings_view_model.dart';
import 'package:fluxer_app/features/shell/presentation/responsive_layout.dart';
import 'package:fluxer_app/features/ui/ui.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/shared/providers/guild_user_display_provider.dart';
import 'package:fluxer_app/shared/providers/member_role_color.dart';
import 'package:fluxer_app/shared/utils/emoji_registry.dart';
import 'package:fluxer_app/shared/utils/guild_user_display.dart';
import 'package:fluxer_app/shared/widgets/unicode_emoji_widget.dart';
import 'package:fluxer_dart/export.dart';
import 'package:fluxer_markdown/fluxer_markdown.dart';
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
const _kJumpHighlightFadeDuration = Duration(milliseconds: 320);
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
const _kReactionEmojiSize = 19.0;
const _kAddReactionIconSize = 19.0;
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
  });

  final String? activeGuildId;
  final bool renderEmbeds;
  final bool renderReactions;
  final bool inlineAttachmentMedia;
  final RenderSpoilers renderSpoilers;
  final bool revealSpoilers;
  final ChatPreferencesState chatPreferences;

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
          chatPreferences == other.chatPreferences;

  @override
  int get hashCode => Object.hash(
    activeGuildId,
    renderEmbeds,
    renderReactions,
    inlineAttachmentMedia,
    renderSpoilers,
    revealSpoilers,
    chatPreferences,
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
  final VoidCallback? onMarkAsUnread;
  final VoidCallback? onViewReactions;
  final VoidCallback? onReport;
  final void Function(String emoji, {String? emojiId, bool animated})?
  onReaction;
  final bool inboxPreviewMode;
  final bool hideMentionHighlight;
  final bool isJumpHighlighted;

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
    this.onRetry,
    this.onDeleteFailed,
    this.onMarkAsUnread,
    this.onViewReactions,
    this.onReport,
    this.onReaction,
    this.inboxPreviewMode = false,
    this.hideMentionHighlight = false,
    this.isJumpHighlighted = false,
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
  final _inlineReactionPickerKey = GlobalKey<FluxerEmojiPickerPopoutState>();
  final _spoilerSyncController = FluxerSpoilerSyncController();
  final _reactionPickerOpen = ValueNotifier<bool>(false);
  var _isInlineReactionPickerOpen = false;
  var _isInlineAddReactionHovered = false;

  late final Listenable _actionBarVisibility = Listenable.merge([
    _hovered,
    _reactionPickerOpen,
  ]);

  @override
  void dispose() {
    _hovered.dispose();
    _reactionPickerOpen.dispose();
    _spoilerSyncController.dispose();
    super.dispose();
  }

  void _addReactionFromPicker(FluxerSelectedEmoji emoji) {
    if (emoji.isCustom) {
      widget.onReaction?.call(
        emoji.name,
        emojiId: emoji.emojiId,
        animated: emoji.animated,
      );
      return;
    }

    widget.onReaction?.call(emoji.surrogates);
  }

  void _openReactionPickerSheet(BuildContext context, {String? channelId}) {
    unawaited(
      FluxerEmojiPickerSheet.show(
        context,
        maxHeight: 0.88,
        channelId: channelId,
        visibleTabs: const [ExpressionPickerTab.emojis],
        trackEmojiUsageOnSelect: false,
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
        widget.previewRoleGuildId ?? ref.read(activeGuildIdProvider);
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
    switch (action) {
      case MessageAction.reply:
        widget.onReply?.call();
      case MessageAction.forward:
        widget.onForward?.call();
      case MessageAction.edit:
        widget.onEdit?.call();
      case MessageAction.delete:
        widget.onDelete?.call();
      case MessageAction.retry:
        widget.onRetry?.call();
      case MessageAction.deleteFailed:
        widget.onDeleteFailed?.call();
      case MessageAction.copyText:
        unawaited(
          Clipboard.setData(ClipboardData(text: widget.message.content)),
        );
      case MessageAction.copyMessageId:
        unawaited(Clipboard.setData(ClipboardData(text: widget.message.id)));
      case MessageAction.copyMessageLink:
        final guildId =
            widget.previewRoleGuildId ?? ref.read(activeGuildIdProvider);
        unawaited(
          Clipboard.setData(
            ClipboardData(
              text: messageLink(
                channelId: widget.message.channelId,
                messageId: widget.message.id,
                guildId: guildId,
              ),
            ),
          ),
        );
      case MessageAction.bookmark:
        final dao = ref.read(fluxerDatabaseProvider).savedMessageDao;
        final messageId = widget.message.id;
        unawaited(() async {
          if (await dao.isSaved(messageId)) {
            await dao.removeSavedMessage(messageId);
          } else {
            await dao.addSavedMessage(messageId);
          }
        }());
      case MessageAction.pin:
        final channelId = widget.message.channelId;
        final messageId = widget.message.id;
        if (widget.message.isPinned) {
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
        if (isMobile) {
          _openReactionPickerSheet(
            context,
            channelId: widget.message.channelId,
          );
        } else {
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
        }
      case MessageAction.markAsUnread:
        widget.onMarkAsUnread?.call();
      case MessageAction.suppressEmbeds:
        final repo = ref.read(messageRepositoryProvider);
        final channelId = widget.message.channelId;
        final messageId = widget.message.id;
        final nextFlags = widget.message.suppressEmbeds
            ? widget.message.flags & ~messageFlagSuppressEmbeds
            : widget.message.flags | messageFlagSuppressEmbeds;
        unawaited(
          repo.setMessageFlags(
            channelId: channelId,
            messageId: messageId,
            flags: nextFlags,
          ),
        );
      case MessageAction.viewReactions:
        widget.onViewReactions?.call();
      case MessageAction.removeAllReactions:
        widget.onRemoveAllReactions?.call();
      case MessageAction.report:
        widget.onReport?.call();
      case MessageAction.debugMessage:
        unawaited(showMessageDebugSheet(context, message: widget.message));
      case null:
        break;
    }
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

  Future<List<QuickReactionItem>?> _loadQuickReactionItems() async {
    try {
      final db = ref.read(fluxerDatabaseProvider);
      final keys = await db.emojiUsageDao.getQuickReactionMixedKeys(12);
      final messageGuildId =
          widget.previewRoleGuildId ?? ref.read(activeGuildIdProvider);
      // Mirror the emoji picker's eligibility: a custom emoji shows if it's
      // from this guild, or the user has global access (premium + external
      // emojis), the only path in DMs, where there's no guild to match.
      final hasGlobalEmojiAccess =
          ref.read(
            instanceFeatureEnabledProvider(LimitKeys.featureGlobalExpressions),
          ) &&
          channelMessagePermissionsForComposer(
            ref.read(
              channelMessagePermissionsProvider(widget.message.channelId),
            ),
          ).canUseExternalEmojis;

      final resolved = <QuickReactionItem>[];
      final seenSurrogates = <String>{};
      final seenCustomIds = <String>{};

      for (final key in keys) {
        if (resolved.length >= 4) {
          break;
        }
        if (key.startsWith('unicode:')) {
          final suffix = key.substring('unicode:'.length);
          if (suffix.isEmpty) {
            continue;
          }
          final entry =
              EmojiRegistry.entryByName(suffix) ??
              EmojiRegistry.entryBySurrogates(suffix);
          final surrogates = entry?.surrogates ?? suffix;
          if (!seenSurrogates.add(surrogates)) {
            continue;
          }
          resolved.add(UnicodeQuickReaction(surrogates));
          continue;
        }
        if (key.startsWith('custom:')) {
          final lastColon = key.lastIndexOf(':');
          if (lastColon < 'custom:'.length - 1) {
            continue;
          }
          final emojiId = key.substring(lastColon + 1);
          if (emojiId.isEmpty || !seenCustomIds.add(emojiId)) {
            continue;
          }
          final row = await db.guildEmojiDao.getById(emojiId);
          if (row == null ||
              !(hasGlobalEmojiAccess || row.guildId == messageGuildId)) {
            continue;
          }
          resolved.add(CustomQuickReaction(GuildEmojiEntry.fromRow(row)));
        }
      }

      for (final fallback in kQuickReactionDefaults) {
        if (resolved.length >= 4) {
          break;
        }
        if (fallback is UnicodeQuickReaction &&
            !seenSurrogates.add(fallback.emoji)) {
          continue;
        }
        resolved.add(fallback);
      }

      return resolved.take(4).toList();
    } on Object catch (e, st) {
      talker.error('Failed to load quick reaction items', e, st);
      return null;
    }
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
      quickItems: frecent,
      onQuickReaction: _dispatchQuickReaction,
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
      isOwnMessage: widget.message.authorId == widget.currentUserId,
      canDelete: widget.canDelete,
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
    final isGrouped = widget.isGrouped;
    final isMobile = isMobileLayout(context);
    final isTouch =
        layoutModeOf(layoutReferenceExtentOf(MediaQuery.sizeOf(context))) !=
        LayoutMode.desktop;
    final MessageRenderSettings? settings = widget.renderSettings;
    final guildId =
        widget.previewRoleGuildId ??
        (settings != null
            ? settings.activeGuildId
            : ref.watch(activeGuildIdProvider));
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
    final bool prefersPersistedAuthor = messagePrefersPersistedAuthorDisplay(
      msg,
    );
    final bool shouldHighlightMention =
        msg.isMentioned && !widget.hideMentionHighlight;
    final bool showJumpHighlight =
        widget.isJumpHighlighted && !widget.inboxPreviewMode;
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

    final body = GestureDetector(
      onLongPress: isMobile && !widget.inboxPreviewMode
          ? () => _showActions(context)
          : null,
      onSecondaryTapUp: !isMobile && !widget.inboxPreviewMode
          ? (details) => _showContextMenu(context, details.globalPosition)
          : null,
      child: MouseRegion(
        onEnter: (_) => _hovered.value = true,
        onExit: (_) {
          if (!_reactionPickerOpen.value) {
            _hovered.value = false;
          }
        },
        child: AnimatedContainer(
          duration: _kJumpHighlightFadeDuration,
          curve: _kJumpHighlightFadeCurve,
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
                  top: isGrouped ? 2 : kMessageRowPaddingVertical,
                  bottom: isGrouped ? 2 : kMessageRowPaddingVertical,
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
                  if (!isGrouped && msg.isReply)
                    _wrapMessageSendingDim(
                      dim: dimMessagePartsExceptAttachments,
                      child: _buildReplyRow(msg, guildId: guildId),
                    ),
                  if (!isGrouped &&
                      msg.isForwarded &&
                      !msg.hasForwardSnapshots &&
                      msg.forwardedFrom != null)
                    _wrapMessageSendingDim(
                      dim: dimMessagePartsExceptAttachments,
                      child: Padding(
                        padding: const EdgeInsets.only(
                          left: kMessageAvatarColumnWidth,
                        ),
                        child: ForwardIndicator(source: msg.forwardedFrom!),
                      ),
                    ),
                  if (isGrouped)
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
                ListenableBuilder(
                  listenable: _actionBarVisibility,
                  builder: (context, _) =>
                      _hovered.value || _reactionPickerOpen.value
                      ? Positioned(
                          top: 0,
                          right: 0,
                          child: _buildActions(context),
                        )
                      : const SizedBox.shrink(),
                ),
            ],
          ),
        ),
      ),
    );
    final onReply = widget.onReply;
    if (!isTouch || onReply == null || widget.inboxPreviewMode) {
      return _wrapMessageSendingDim(dim: dimEntireMessage, child: body);
    }
    final bool canEditOwnMessage =
        widget.onEdit != null &&
        msg.authorId == widget.currentUserId &&
        msg.isUserMessage &&
        msg.messageSnapshots.isEmpty;
    return _wrapMessageSendingDim(
      dim: dimEntireMessage,
      child: SwipeToReply(
        enabled: widget.canSendMessages,
        onReply: onReply,
        onEdit: canEditOwnMessage ? widget.onEdit : null,
        child: body,
      ),
    );
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
      ...msg.themes.map(
        (_) => wrapPart(
          const Padding(padding: EdgeInsets.only(top: 4), child: EmbedTheme()),
        ),
      ),
      if (renderEmbeds && !msg.suppressEmbeds)
        ...msg.embeds.indexed.map((entry) {
          final int embedIndex = entry.$1;
          final embed = entry.$2;
          final spoilerSyncKeys = spoilerSyncKeysForEmbed(embed, spoileredUrls);
          return wrapPart(
            _buildEmbed(
              embed,
              isSpoiler: spoilerSyncKeys.isNotEmpty,
              spoilerSyncKeys: spoilerSyncKeys,
              revealSpoilers: revealSpoilers,
              dimensionSize: chatPreferences.embedMediaDimensionSize,
              channelId: msg.channelId,
              messageId: msg.id,
              embedIndex: embedIndex,
            ),
          );
        }),
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
        ),
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
            child: Wrap(
              spacing: 4,
              runSpacing: 4,
              children: [
                ...msg.reactions.map((r) => _buildReaction(context, r)),
                if (widget.canAddReactions &&
                    msg.supportsInteractiveActions &&
                    !widget.inboxPreviewMode)
                  _buildInlineAddReaction(context, msg, isMobile),
              ],
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
                style: TextStyle(
                  color: context.colors.textDanger,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
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
    final Widget markdown = MessageMarkdown(
      data: msg.content,
      messageId: msg.id,
      selectable: !isMobile,
      channelId: msg.channelId,
      revealSpoilers: revealSpoilers,
      spoilerSyncController: _spoilerSyncController,
    );
    if (!msg.isEdited) {
      return markdown;
    }
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.end,
      children: [markdown, _buildEditedLabel(context, msg)],
    );
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
        child: GestureDetector(
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
                  duration: const Duration(milliseconds: 100),
                  child: child,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      _formatShortTimestamp(msg.timestamp.toLocal()),
                      style: TextStyle(
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
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () =>
          ref.read(toastProvider.notifier).show(FluxerToast(message: message)),
      child: Tooltip(
        message: message,
        child: PhosphorIcon(
          PhosphorIconsFill.bellSlash,
          size: 14,
          color: context.textStyles.timestamp.color,
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
        child: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: _canOpenAuthorProfile(msg)
              ? () => _openAuthorProfile(context, msg)
              : null,
          child: Padding(
            padding: const EdgeInsets.only(top: kMessageAvatarTopPadding),
            child: FluxerAvatar.user(
              key: ValueKey<String>(
                messageAuthorAvatarKey(
                  authorId: msg.authorId,
                  avatarHash: msg.authorAvatar,
                ),
              ),
              fallbackText: authorDisplay.displayName,
              userId: msg.authorId,
              imageUrl: authorDisplay.avatarUrl,
              avatarColor: authorDisplay.avatarColor,
              size: kMessageAvatarSize,
              cacheKey: messageAuthorAvatarKey(
                authorId: msg.authorId,
                avatarHash: msg.authorAvatar,
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
                    child: GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: _canOpenAuthorProfile(msg)
                          ? () => _openAuthorProfile(context, msg)
                          : null,
                      child: Text(
                        authorDisplay.displayName,
                        style: TextStyle(
                          color: roleColor ?? context.colors.textChat,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
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
                      FluxerLocalizations.of(context),
                      Localizations.localeOf(context).toString(),
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

  Widget _buildEmbed(
    Embed embed, {
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
        dimensionSize: dimensionSize,
        revealSpoilers: revealSpoilers,
        spoilerSyncController: _spoilerSyncController,
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
      ),
      EmbedType.link => EmbedLink(
        embed: embed,
        dimensionSize: dimensionSize,
        revealSpoilers: revealSpoilers,
        spoilerSyncController: _spoilerSyncController,
      ),
      EmbedType.video => EmbedVideo(
        embed: embed,
        dimensionSize: dimensionSize,
        isSpoiler: isSpoiler,
        revealSpoiler: revealSpoilers,
        spoilerSyncController: _spoilerSyncController,
        spoilerSyncKeys: spoilerSyncKeys,
        channelId: channelId,
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

  Color _reactionChipBackground(
    BuildContext context, {
    required bool hasReacted,
  }) {
    final colors = context.colors;
    if (hasReacted) {
      return Color.lerp(colors.backgroundSecondary, colors.brandPrimary, 0.36)!;
    }
    final isLight = Theme.of(context).brightness == Brightness.light;
    if (isLight) {
      return Color.lerp(
        colors.backgroundSecondary,
        colors.brandPrimaryLight,
        0.06,
      )!;
    }
    if (colors.backgroundSecondary == colors.backgroundPrimary) {
      return colors.backgroundSecondaryAlt;
    }
    return colors.backgroundPrimary;
  }

  Color _reactionChipBorderColor(
    BuildContext context, {
    required bool hasReacted,
  }) {
    final colors = context.colors;
    if (hasReacted) {
      return colors.brandPrimary;
    }
    if (Theme.of(context).brightness == Brightness.light) {
      return Color.lerp(
        colors.backgroundSecondary,
        colors.brandPrimaryLight,
        0.10,
      )!;
    }
    return Colors.transparent;
  }

  Widget _buildReaction(BuildContext context, Reaction reaction) {
    final colors = context.colors;
    final hasReacted = reaction.hasReacted;
    return GestureDetector(
      onTap: () => widget.onReaction?.call(
        reaction.emoji,
        emojiId: reaction.emojiId,
        animated: reaction.animated,
      ),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
          decoration: BoxDecoration(
            color: _reactionChipBackground(context, hasReacted: hasReacted),
            border: Border.all(
              color: _reactionChipBorderColor(context, hasReacted: hasReacted),
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (reaction.isCustom)
                CachedNetworkImage(
                  imageUrl: FluxerMediaUrl.customEmoji(
                    id: reaction.emojiId!,
                    animated: reaction.animated,
                    size: _kReactionEmojiSize.toInt(),
                  ),
                  cacheKey:
                      'reaction_emoji_'
                      '${reaction.emojiId}_'
                      '${reaction.animated ? 'a' : 's'}_'
                      '${_kReactionEmojiSize.toInt()}',
                  width: _kReactionEmojiSize,
                  height: _kReactionEmojiSize,
                )
              else
                UnicodeEmojiWidget(
                  emoji: reaction.emoji,
                  size: _kReactionEmojiSize,
                ),
              const SizedBox(width: 6),
              Text(
                '${reaction.count}',
                style: TextStyle(
                  color: hasReacted ? colors.brandPrimary : colors.textTertiary,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInlineAddReaction(
    BuildContext context,
    Message msg,
    bool isMobile,
  ) {
    if (isMobile) {
      return _buildInlineAddReactionButton(
        context,
        onTap: () =>
            _openReactionPickerSheet(context, channelId: msg.channelId),
      );
    }
    return FluxerEmojiPickerPopout(
      key: _inlineReactionPickerKey,
      closeOnEmojiSelect: true,
      visibleTabs: const [ExpressionPickerTab.emojis],
      trackEmojiUsageOnSelect: false,
      channelId: msg.channelId,
      onClose: () => setState(() {
        _isInlineReactionPickerOpen = false;
      }),
      onEmojiSelected: _addReactionFromPicker,
      child: _buildInlineAddReactionButton(
        context,
        onTap: () {
          _inlineReactionPickerKey.currentState?.toggle();
          setState(() {
            _isInlineReactionPickerOpen =
                _inlineReactionPickerKey.currentState?.isOpen ?? false;
          });
        },
      ),
    );
  }

  Widget _buildInlineAddReactionButton(
    BuildContext context, {
    required VoidCallback? onTap,
  }) {
    final colors = context.colors;
    final isActive = _isInlineReactionPickerOpen || _isInlineAddReactionHovered;
    return Semantics(
      label: FluxerLocalizations.of(context).chatMessageAddReaction,
      button: true,
      child: MouseRegion(
        onEnter: (_) => setState(() => _isInlineAddReactionHovered = true),
        onExit: (_) => setState(() => _isInlineAddReactionHovered = false),
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: onTap,
          behavior: HitTestBehavior.opaque,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
            decoration: BoxDecoration(
              color: isActive
                  ? colors.backgroundModifierHover
                  : Colors.transparent,
              borderRadius: BorderRadius.circular(8),
            ),
            child: PhosphorIcon(
              PhosphorIconsFill.smiley,
              size: _kAddReactionIconSize,
              color: isActive ? colors.textPrimary : colors.textTertiary,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildActions(BuildContext context) => Material(
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
      authorRoleColor = ref
          .watch(memberRoleColorProvider((message.authorId, guildId!)))
          .value;
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
