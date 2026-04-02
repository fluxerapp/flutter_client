import 'dart:async';

import 'package:cached_network_image_ce/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/core/router/route_state_providers.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/attachment_image.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/embed_image.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/embed_invite.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/embed_link.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/embed_rich.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/embed_theme.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/embed_video.dart';
import 'package:fluxer_app/features/chat/presentation/'
    'widgets/forward_indicator.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/expression_picker.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/expression_picker_popout.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/expression_picker_sheet.dart';
import 'package:fluxer_app/features/chat/presentation/'
    'widgets/message_bottom_sheet.dart';
import 'package:fluxer_app/features/chat/presentation/'
    'widgets/message_context_menu.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/message_markdown.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/reply_preview.dart';
import 'package:fluxer_app/features/guilds/domain/guild.dart';
import 'package:fluxer_app/features/shell/presentation/responsive_layout.dart';
import 'package:fluxer_app/features/ui/ui.dart';
import 'package:fluxer_app/shared/providers/member_role_color.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

/// Mention highlight color matching web app's
/// `--message-mention-color: rgb(234 197 50)`.
const _kMentionColor = Color.from(
  alpha: 1,
  red: 234 / 255,
  green: 197 / 255,
  blue: 50 / 255,
);

/// Avatar column width: 40px avatar + 16px gap to the
/// right.
const _kAvatarColumnWidth = 56.0;

/// Height of the compact reply-preview row.
const _kReplyRowHeight = 20.0;

/// Gap between the reply-preview row and the main message
/// row (avatar).
const _kReplyBottomGap = 4.0;

/// Horizontal gap between the end of the connector line
/// and the reply content.
const _kReplyLineEndGap = 6.0;

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
  final void Function(String emoji, {String? emojiId, bool animated})?
  onReaction;

  const MessageItem({
    required this.message,
    this.isGrouped = false,
    this.currentUserId,
    this.onReply,
    this.onForward,
    this.onEdit,
    this.onDelete,
    this.onReaction,
    super.key,
  });

  @override
  ConsumerState<MessageItem> createState() => _MessageItemState();
}

class _MessageItemState extends ConsumerState<MessageItem> {
  var _isHovered = false;
  final _reactionPickerKey = GlobalKey<ExpressionPickerPopoutState>();
  var _isReactionPickerOpen = false;

  void _handleAction(MessageAction? action) {
    switch (action) {
      case MessageAction.reply:
        widget.onReply?.call();
      case MessageAction.forward:
        widget.onForward?.call();
      case MessageAction.edit:
        widget.onEdit?.call();
      case MessageAction.delete:
        widget.onDelete?.call();
      case MessageAction.copyText:
      case MessageAction.copyMessageId:
      case MessageAction.addReaction:
        unawaited(
          ExpressionPickerSheet.show(
            context,
            visibleTabs: const [ExpressionPickerTab.emojis],
          ),
        );
      case MessageAction.pin:
      case MessageAction.bookmark:
      case MessageAction.markAsUnread:
      case MessageAction.copyMessageLink:
      case null:
        break;
    }
  }

  Future<void> _showActions(BuildContext context) async {
    final action = await showMessageBottomSheet(
      context,
      message: widget.message,
      isOwnMessage: widget.message.authorId == widget.currentUserId,
    );
    if (!context.mounted) {
      return;
    }
    _handleAction(action);
  }

  Future<void> _showContextMenu(BuildContext context, Offset position) async {
    List<String>? frecent;
    try {
      final db = ProviderScope.containerOf(
        context,
      ).read(fluxerDatabaseProvider);
      frecent = await db.emojiUsageDao.getQuickReactionEmojis(4, const [
        '\u{1F44D}',
        '\u{1F44C}',
        '\u{1F389}',
        '\u{2764}\u{FE0F}',
      ]);
    } on Object {
      // Fall back to defaults.
    }

    if (!context.mounted) {
      return;
    }

    final action = await showMessageContextMenu(
      context,
      position: position,
      message: widget.message,
      isOwnMessage: widget.message.authorId == widget.currentUserId,
      onQuickReaction: (emoji) => widget.onReaction?.call(emoji),
      quickEmojis: frecent,
    );
    if (!context.mounted) {
      return;
    }
    _handleAction(action);
  }

  @override
  Widget build(BuildContext context) {
    final msg = widget.message;
    final isGrouped = widget.isGrouped;
    final isMobile = isMobileLayout(context);
    final guildId = ref.watch(activeGuildIdProvider);
    Color? authorRoleColor;
    if (guildId != null) {
      authorRoleColor = ref.watch(
        memberRoleColorProvider((msg.authorId, guildId)),
      ).value;
    }

    return GestureDetector(
      onLongPress: isMobile ? () => _showActions(context) : null,
      onSecondaryTapUp: !isMobile
          ? (details) => _showContextMenu(context, details.globalPosition)
          : null,
      child: MouseRegion(
        onEnter: (_) => setState(() => _isHovered = true),
        onExit: (_) {
          if (!_isReactionPickerOpen) {
            setState(() => _isHovered = false);
          }
        },
        child: Container(
          decoration: BoxDecoration(
            color: msg.isMentioned
                ? _kMentionColor.withValues(alpha: _isHovered ? 0.14 : 0.1)
                : _isHovered
                ? context.colors.backgroundModifierHover
                : Colors.transparent,
            border: msg.isMentioned
                ? const Border(
                    left: BorderSide(
                      color: _kMentionColor,
                      width: 2,
                    ),
                  )
                : null,
          ),
          padding: EdgeInsets.only(
            left: msg.isMentioned ? 14 : 16,
            right: 16,
            top: isGrouped ? 2 : 8,
            bottom: isGrouped ? 2 : 8,
          ),
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (!isGrouped && msg.isReply) _buildReplyRow(msg),
                  if (!isGrouped && msg.isForwarded)
                    Padding(
                      padding: const EdgeInsets.only(left: _kAvatarColumnWidth),
                      child: ForwardIndicator(source: msg.forwardedFrom!),
                    ),
                  if (isGrouped)
                    _buildGroupedRow(context, msg)
                  else
                    _buildMainRow(context, msg, authorRoleColor),
                ],
              ),
              if ((_isHovered || _isReactionPickerOpen) && !isMobile)
                Positioned(top: 0, right: 0, child: _buildActions(context)),
            ],
          ),
        ),
      ),
    );
  }

  /// Builds the reply preview row with space for the
  /// connector line.
  Widget _buildReplyRow(Message msg) {
    const replyAreaHeight = _kReplyRowHeight + _kReplyBottomGap;
    const avatarCenterX = 20.0;
    const lineTop = _kReplyRowHeight / 2;
    const lineBottom = replyAreaHeight - 5;
    const horizontalEnd = _kAvatarColumnWidth - 5;
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
              child: InlineReplyPreview(replyToId: msg.replyToId!),
            ),
          ),
        ),
      ),
    );
  }

  /// Returns the content, embeds, and reactions
  /// widgets for a message.
  List<Widget> _buildMessageContent(BuildContext context, Message msg) => [
    if (msg.content.isNotEmpty && !msg.shouldHideContent)
      MessageMarkdown(
        data: msg.content,
        selectable: true,
        channelId: msg.channelId,
      ),
    ...msg.invites.map(
      (code) => Padding(
        padding: const EdgeInsets.only(top: 4),
        child: EmbedInvite(code: code),
      ),
    ),
    ...msg.themes.map(
      (_) =>
          const Padding(padding: EdgeInsets.only(top: 4), child: EmbedTheme()),
    ),
    ...msg.embeds.map(_buildEmbed),
    ...msg.attachments.map(_buildAttachment),
    if (msg.reactions.isNotEmpty)
      Padding(
        padding: const EdgeInsets.only(top: 4),
        child: Wrap(
          spacing: 4,
          runSpacing: 4,
          children: msg.reactions
              .map((r) => _buildReaction(context, r))
              .toList(),
        ),
      ),
  ];

  /// Grouped message row: hover-reveal short timestamp
  /// in the left column, content on the right.
  Widget _buildGroupedRow(BuildContext context, Message msg) => Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      SizedBox(
        width: _kAvatarColumnWidth,
        child: Align(
          alignment: Alignment.centerLeft,
          child: AnimatedOpacity(
            opacity: _isHovered ? 1.0 : 0.0,
            duration: const Duration(milliseconds: 100),
            child: Text(
              _formatShortTimestamp(msg.timestamp),
              style: TextStyle(
                color: context.colors.textTertiaryMuted,
                fontSize: 10,
              ),
            ),
          ),
        ),
      ),
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: _buildMessageContent(context, msg),
        ),
      ),
    ],
  );

  String _formatShortTimestamp(DateTime dt) {
    final h = dt.hour.toString().padLeft(2, '0');
    final m = dt.minute.toString().padLeft(2, '0');
    return '$h:$m';
  }

  /// Main message row: avatar on the left, content on
  /// the right.
  Widget _buildMainRow(
    BuildContext context,
    Message msg,
    Color? roleColor,
  ) => Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.only(top: 2),
        child: FluxerAvatar.user(
          fallbackText: msg.authorName,
          userId: msg.authorId,
          imageUrl: msg.authorAvatarUrl,
          avatarColor: msg.authorAvatarColor,
        ),
      ),
      const SizedBox(width: 16),
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Flexible(
                  child: Text(
                    msg.authorName,
                    style: TextStyle(
                      color: roleColor ?? context.colors.textChat,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ),

                const SizedBox(width: 8),
                Text(
                  _formatTimestamp(msg.timestamp),
                  style: context.textStyles.timestamp,
                ),
                if (msg.isEdited) ...[
                  const SizedBox(width: 4),
                  Text(
                    '(edited)',
                    style: TextStyle(
                      color: context.colors.textTertiaryMuted,
                      fontSize: 10,
                    ),
                  ),
                ],
              ],
            ),
            const SizedBox(height: 2),
            ..._buildMessageContent(context, msg),
          ],
        ),
      ),
    ],
  );

  Widget _buildEmbed(Embed embed) => Padding(
    padding: const EdgeInsets.only(top: 2),
    child: switch (embed.type) {
      EmbedType.rich => EmbedRich(embed: embed),
      EmbedType.image || EmbedType.gifv => EmbedImage(embed: embed),
      EmbedType.link => EmbedLink(embed: embed),
      EmbedType.video => EmbedVideo(embed: embed),
    },
  );
  Widget _buildAttachment(Attachment attachment) => Padding(
    padding: const EdgeInsets.only(top: 2),
    // TODO: Add other attachment support
    child: attachment.isImage
        ? AttachmentImage(attachment: attachment)
        : const SizedBox.shrink(),
  );

  Widget _buildReaction(BuildContext context, Reaction reaction) =>
      GestureDetector(
        onTap: () => widget.onReaction?.call(
          reaction.emoji,
          emojiId: reaction.emojiId,
          animated: reaction.animated,
        ),
        child: MouseRegion(
          cursor: SystemMouseCursors.click,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
            decoration: BoxDecoration(
              color: reaction.hasReacted
                  ? context.colors.brandPrimary.withValues(alpha: 0.3)
                  : context.colors.backgroundSecondaryAlt.withValues(
                      alpha: 0.4,
                    ),
              border: Border.all(
                color: reaction.hasReacted
                    ? context.colors.brandPrimary
                    : Colors.transparent,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (reaction.isCustom)
                  CachedNetworkImage(
                    imageUrl:
                        '$fluxerMediaCdn/emojis/'
                        '${reaction.emojiId}.webp',
                    width: 16,
                    height: 16,
                  )
                else
                  Text(reaction.emoji, style: const TextStyle(fontSize: 16)),
                const SizedBox(width: 4),
                Text(
                  '${reaction.count}',
                  style: TextStyle(
                    color: reaction.hasReacted
                        ? context.colors.brandPrimary
                        : context.colors.textChat,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ),
      );

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
          ExpressionPickerPopout(
            key: _reactionPickerKey,
            visibleTabs: const [ExpressionPickerTab.emojis],
            onClose: () => setState(() {
              _isReactionPickerOpen = false;
              _isHovered = false;
            }),
            child: _actionButton(
              context,
              PhosphorIconsFill.smiley,
              'Add Reaction',
              () {
                _reactionPickerKey.currentState?.toggle();
                setState(() {
                  _isReactionPickerOpen =
                      _reactionPickerKey.currentState?.isOpen ?? false;
                });
              },
            ),
          ),
          _actionButton(
            context,
            PhosphorIconsFill.arrowBendUpLeft,
            'Reply',
            widget.onReply,
          ),
          _actionButton(
            context,
            PhosphorIconsFill.shareFat,
            'Forward',
            widget.onForward,
          ),
          _actionButton(context, PhosphorIconsFill.dotsThree, 'More', () {}),
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

  String _formatTimestamp(DateTime dt) {
    final now = DateTime.now();
    final isToday =
        dt.year == now.year && dt.month == now.month && dt.day == now.day;
    final h = dt.hour.toString().padLeft(2, '0');
    final m = dt.minute.toString().padLeft(2, '0');
    if (isToday) {
      return 'Today at $h:$m';
    }
    return '${dt.month}/${dt.day}/${dt.year}'
        ' $h:$m';
  }
}
