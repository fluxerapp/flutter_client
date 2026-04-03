import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/router/route_state_providers.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/core/utils/channel_jump_link.dart';
import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/message_item.dart'
    show MessageItem;
import 'package:fluxer_app/features/chat/presentation/widgets/message_mention.dart';
import 'package:fluxer_app/features/chat/providers/chat_view_model.dart';
import 'package:fluxer_app/features/ui/ui.dart';
import 'package:fluxer_app/shared/providers/member_role_color.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

/// The inline reply indicator shown above a message that
/// is a reply. Displays the replied-to message's avatar,
/// author name, and a single-line content preview.
///
/// The curved connector line is handled by
/// [ReplyConnectorPainter] in [MessageItem].
class InlineReplyPreview extends ConsumerWidget {
  final String replyToId;

  const InlineReplyPreview({required this.replyToId, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final messages = ref.watch(
      chatViewModelProvider.select((s) => s.messages),
    );
    final replyMsg = _findMessage(messages, replyToId);
    final guildId = ref.watch(activeGuildIdProvider);
    Color? roleColor;
    if (replyMsg != null && guildId != null) {
      roleColor = ref.watch(
        memberRoleColorProvider((replyMsg.authorId, guildId)),
      ).value;
    }
    final nameColor = (roleColor ?? context.colors.textChat).withValues(
      alpha: 0.64,
    );

    return GestureDetector(
      onTap: () => ref
          .read(chatViewModelProvider.notifier)
          .scrollToMessage(replyToId),
      child: Row(
        children: [
          if (replyMsg != null) ...[
            FluxerAvatar.user(
              fallbackText: replyMsg.authorName,
              userId: replyMsg.authorId,
              imageUrl: replyMsg.authorAvatarUrl,
              avatarColor: replyMsg.authorAvatarColor,
              size: 16,
              showStatus: false,
            ),
            const SizedBox(width: 4),
            Flexible(
              child: Text(
                replyMsg.authorName,
                style: TextStyle(
                  color: nameColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
            ),
            const SizedBox(width: 4),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 1),
                child: _ReplyPreviewContent(
                  message: replyMsg,
                  emptyLabel: 'Click to see attachment',
                ),
              ),
            ),
          ] else ...[
            PhosphorIcon(
              PhosphorIconsFill.arrowBendUpLeft,
              size: 12,
              color: context.colors.textPrimaryMuted,
            ),
            const SizedBox(width: 4),
            Flexible(
              child: Text(
                'Original message was deleted',
                style: TextStyle(
                  color: context.colors.textPrimaryMuted,
                  fontSize: 14,
                  fontStyle: FontStyle.italic,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
            ),
          ],
        ],
      ),
    );
  }

  Message? _findMessage(List<Message> messages, String id) {
    for (final msg in messages) {
      if (msg.id == id) {
        return msg;
      }
    }
    return null;
  }
}

class _ReplyPreviewContent extends StatelessWidget {
  const _ReplyPreviewContent({
    required this.message,
    required this.emptyLabel,
  });

  final Message message;
  final String emptyLabel;

  static final RegExp _tokenRe = RegExp(
    r'https?://fluxer\.app/channels/(?:@me|\d{15,21})/\d{15,21}(?:/\d{15,21})?' // .com (soo)
    r'|<@!?\d+>'
    r'|<#\d+>'
    r'|<@&\d+>'
    r'|@(everyone|here)\b',
  );

  @override
  Widget build(BuildContext context) {
    final style = TextStyle(
      color: context.colors.textPrimaryMuted,
      fontSize: 14,
    );
    final content = message.content.replaceAll('\n', ' ').trim();
    if (content.isEmpty) {
      return Text(
        emptyLabel,
        style: style,
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
      );
    }

    return SizedBox(
      height: 20,
      child: RichText(
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        text: TextSpan(
          style: style,
          children: _buildSpans(content, style),
        ),
        strutStyle: const StrutStyle(
          fontSize: 14,
          height: 1.2,
          forceStrutHeight: true,
        ),
      ),
    );
  }

  List<InlineSpan> _buildSpans(String content, TextStyle baseStyle) {
    final spans = <InlineSpan>[];
    var lastEnd = 0;

    for (final match in _tokenRe.allMatches(content)) {
      if (match.start > lastEnd) {
        spans.add(TextSpan(text: content.substring(lastEnd, match.start)));
      }

      final token = match.group(0)!;
      spans.add(_buildTokenSpan(token, baseStyle));
      lastEnd = match.end;
    }

    if (lastEnd < content.length) {
      spans.add(TextSpan(text: content.substring(lastEnd)));
    }

    return spans;
  }

  InlineSpan _buildTokenSpan(String token, TextStyle baseStyle) {
    if (token.startsWith('<@&')) {
      final roleId = token.substring(3, token.length - 1);
      return WidgetSpan(
        alignment: PlaceholderAlignment.middle,
        child: IgnorePointer(
          child: RoleMention(roleId: roleId, baseStyle: baseStyle),
        ),
      );
    }

    if (token.startsWith('<#')) {
      final channelId = token.substring(2, token.length - 1);
      return WidgetSpan(
        alignment: PlaceholderAlignment.middle,
        child: IgnorePointer(
          child: ChannelMention(
            channelId: channelId,
            baseStyle: baseStyle,
          ),
        ),
      );
    }

    if (token.startsWith('<@')) {
      final userId = token
          .replaceFirst('<@!', '')
          .replaceFirst('<@', '')
          .replaceFirst('>', '');
      return WidgetSpan(
        alignment: PlaceholderAlignment.middle,
        child: IgnorePointer(
          child: UserMention(
            userId: userId,
            channelId: message.channelId,
            baseStyle: baseStyle,
          ),
        ),
      );
    }

    if (token == '@everyone' || token == '@here') {
      return WidgetSpan(
        alignment: PlaceholderAlignment.middle,
        child: IgnorePointer(
          child: TextMention(label: token, baseStyle: baseStyle),
        ),
      );
    }

    final jump = parseChannelJumpLink(token);
    if (jump != null) {
      return WidgetSpan(
        alignment: PlaceholderAlignment.middle,
        child: IgnorePointer(
          child: ChannelJumpLinkMention(
            link: jump,
            url: token,
            baseStyle: baseStyle,
          ),
        ),
      );
    }

    return TextSpan(text: token);
  }
}

/// Paints the curved "L" connector line from the
/// replier's avatar area upward and across to the
/// reply preview row.
///
/// The line goes:
///   1. Up from just above the replier's avatar center
///   2. Curves right with a rounded corner
///   3. Extends horizontally to meet the reply
///      preview row
///
/// [avatarCenterX] -- x offset of the replier avatar
///   center (from left of widget)
/// [lineTop]       -- y offset where the horizontal arm
///   meets the reply row
/// [lineBottom]    -- y offset where the vertical arm
///   starts (just above avatar)
/// [horizontalEnd] -- x offset where the horizontal arm
///   ends (start of reply content)
class ReplyConnectorPainter extends CustomPainter {
  final double avatarCenterX;
  final double lineTop;
  final double lineBottom;
  final double horizontalEnd;
  final Color color;

  ReplyConnectorPainter({
    required this.avatarCenterX,
    required this.lineTop,
    required this.lineBottom,
    required this.horizontalEnd,
    required this.color,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    const radius = 6.0;

    final path = Path()
      ..moveTo(avatarCenterX, lineBottom)
      ..lineTo(avatarCenterX, lineTop + radius)
      ..arcToPoint(
        Offset(avatarCenterX + radius, lineTop),
        radius: const Radius.circular(radius),
      )
      ..lineTo(horizontalEnd, lineTop);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant ReplyConnectorPainter oldDelegate) =>
      avatarCenterX != oldDelegate.avatarCenterX ||
      lineTop != oldDelegate.lineTop ||
      lineBottom != oldDelegate.lineBottom ||
      horizontalEnd != oldDelegate.horizontalEnd ||
      color != oldDelegate.color;
}

/// The reply bar shown above the input when the user
/// is composing a reply.
class ReplyInputBar extends StatelessWidget {
  final Message replyTo;
  final VoidCallback onCancel;

  const ReplyInputBar({
    required this.replyTo,
    required this.onCancel,
    super.key,
  });

  @override
  Widget build(BuildContext context) => Container(
    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    decoration: BoxDecoration(
      color: context.colors.chatInputBackground,
      border: Border(
        top: BorderSide(color: context.colors.userAreaDividerColor),
      ),
    ),
    child: Row(
      children: [
        PhosphorIcon(
          PhosphorIconsFill.arrowBendUpLeft,
          size: 16,
          color: context.colors.textPrimaryMuted,
        ),
        const SizedBox(width: 8),
        Expanded(
          child: RichText(
            overflow: TextOverflow.ellipsis,
            text: TextSpan(
              style: const TextStyle(fontSize: 14),
              children: [
                TextSpan(
                  text: 'Replying to ',
                  style: TextStyle(color: context.colors.textPrimaryMuted),
                ),
                TextSpan(
                  text: replyTo.authorName,
                  style: TextStyle(
                    color: context.colors.textChat,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ),
        IconButton(
          icon: const PhosphorIcon(PhosphorIconsFill.x, size: 16),
          color: context.colors.textPrimaryMuted,
          onPressed: onCancel,
          padding: EdgeInsets.zero,
          constraints: const BoxConstraints(minWidth: 24, minHeight: 24),
        ),
      ],
    ),
  );
}
