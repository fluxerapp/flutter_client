import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/core/router/route_state_providers.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/messages/message_item.dart'
    show MessageItem;
import 'package:fluxer_app/features/chat/presentation/widgets/messages/message_markdown.dart';
import 'package:fluxer_app/features/chat/providers/core/chat_view_model.dart';
import 'package:fluxer_app/features/chat/providers/messages/channel_message_stream_provider.dart';
import 'package:fluxer_app/features/chat/providers/messages/message_references_provider.dart';
import 'package:fluxer_app/features/chat/utils/channel_message_stream.dart';
import 'package:fluxer_app/features/chat/utils/mention_reply_preference_utils.dart';
import 'package:fluxer_app/features/ui/ui.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/shared/providers/guild_user_display_provider.dart';
import 'package:fluxer_app/shared/providers/member_role_color.dart';
import 'package:fluxer_app/shared/utils/guild_user_display.dart'
    show GuildUserDisplay, messagePrefersPersistedAuthorDisplay;
import 'package:fluxer_dart/models/mention_reply_preferences.dart';
import 'package:fluxer_markdown/fluxer_markdown.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

const double _kReplyPreviewFontSize = 14;
const double _kReplyPreviewLineHeight = 18 / _kReplyPreviewFontSize;
const double _kReplyPreviewAuthorMaxWidthRatio = 0.3;

/// The inline reply indicator shown above a message that
/// is a reply. Displays the replied-to message's avatar,
/// author name, and a single-line content preview.
///
/// The curved connector line is handled by
/// [ReplyConnectorPainter] in [MessageItem].
class InlineReplyPreview extends ConsumerWidget {
  final Message message;
  final String? guildId;
  final String? currentUserId;

  const InlineReplyPreview({
    required this.message,
    this.guildId,
    this.currentUserId,
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = FluxerLocalizations.of(context);
    final parentMessageId = message.replyParentMessageId;
    if (parentMessageId == null) {
      return const SizedBox.shrink();
    }
    final parentChannelId = message.replyParentChannelId;
    ref.watch(messageReferencesProvider);
    final List<Message> channelMessages = ref.watch(
      chatViewModelProvider.select(
        (state) => state.channelId == parentChannelId
            ? state.messages
            : const <Message>[],
      ),
    );
    final resolution = ref
        .read(messageReferencesProvider.notifier)
        .resolveSync(
          channelId: parentChannelId,
          messageId: parentMessageId,
          channelMessages: channelMessages,
        );
    final replyMsg = resolution.message;
    final String? resolvedGuildId =
        guildId ?? ref.watch(contextualGuildIdProvider);
    final String? resolvedCurrentUserId =
        currentUserId ?? ref.watch(currentUserIdProvider);
    final String? revealedCollapsedGroupKey = ref.watch(
      chatViewModelProvider.select((state) => state.revealedCollapsedGroupKey),
    );
    final ChannelCollapseContext collapseContext = ref.watch(
      channelCollapseContextProvider,
    );
    final bool isReplyVisible =
        replyMsg == null ||
        isMessageInRevealedCollapsedGroup(
          messages: channelMessages,
          messageId: replyMsg.id,
          revealedCollapsedGroupKey: revealedCollapsedGroupKey,
          context: collapseContext,
        );
    final ChannelStreamType? hiddenReplyType = !isReplyVisible
        ? collapseContext.collapsedTypeFor(replyMsg)
        : null;
    final String? hiddenReplyLabel = switch (hiddenReplyType) {
      ChannelStreamType.messageGroupBlocked =>
        l10n.chatReplyHiddenBlockedAuthor,
      ChannelStreamType.messageGroupSpammer =>
        l10n.chatReplyHiddenSpammerAuthor,
      _ => null,
    };
    final bool mentionsReplyAuthor =
        replyMsg != null &&
        message.mentionedUserIds.contains(replyMsg.authorId);
    final GuildUserDisplay? replyAuthorDisplay = replyMsg == null
        ? null
        : watchMessageAuthorDisplay(
            ref: ref,
            message: replyMsg,
            guildId: resolvedGuildId,
            currentUserId: resolvedCurrentUserId,
          );
    final bool prefersPersistedAuthor =
        replyMsg != null && messagePrefersPersistedAuthorDisplay(replyMsg);
    Color? roleColor;
    if (replyMsg != null &&
        resolvedGuildId != null &&
        !prefersPersistedAuthor) {
      roleColor = ref.watch(
        memberRoleColorProvider((replyMsg.authorId, resolvedGuildId)),
      );
    }
    final nameColor = (roleColor ?? context.colors.textChat).withValues(
      alpha: 0.64,
    );

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: resolution.state == MessageReferenceState.deleted
          ? null
          : () => unawaited(
              ref
                  .read(chatViewModelProvider.notifier)
                  .goToRepliedMessage(
                    channelId: parentChannelId,
                    messageId: parentMessageId,
                  ),
            ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final maxAuthorWidth =
              constraints.maxWidth * _kReplyPreviewAuthorMaxWidthRatio;
          return Row(
            children: [
              if (hiddenReplyLabel != null) ...[
                PhosphorIcon(
                  PhosphorIconsFill.arrowBendUpLeft,
                  size: 12,
                  color: context.colors.textPrimaryMuted,
                ),
                const SizedBox(width: 4),
                Flexible(
                  child: Text(
                    hiddenReplyLabel,
                    style: TextStyle(
                      color: context.colors.textPrimaryMuted,
                      fontSize: _kReplyPreviewFontSize,
                      height: _kReplyPreviewLineHeight,
                      fontStyle: FontStyle.italic,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ),
              ] else if (resolution.state == MessageReferenceState.loaded &&
                  replyMsg != null &&
                  replyAuthorDisplay != null) ...[
                FluxerAvatar.user(
                  fallbackText: replyAuthorDisplay.displayName,
                  userId: replyMsg.authorId,
                  imageUrl: replyAuthorDisplay.avatarUrl,
                  avatarColor: replyAuthorDisplay.avatarColor,
                  size: 16,
                  showStatus: false,
                ),
                const SizedBox(width: 4),
                ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: maxAuthorWidth),
                  child: Text(
                    '${mentionsReplyAuthor ? '@' : ''}'
                    '${replyAuthorDisplay.displayName}',
                    style: TextStyle(
                      color: nameColor,
                      fontSize: _kReplyPreviewFontSize,
                      height: _kReplyPreviewLineHeight,
                      fontWeight: FontWeight.w500,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ),
                const SizedBox(width: 4),
                Expanded(
                  child: _ReplyPreviewContent(
                    message: replyMsg,
                    emptyLabel: l10n.chatReplyAttachedMedia,
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
                    resolution.state == MessageReferenceState.deleted
                        ? l10n.chatReplyOriginalDeleted
                        : l10n.chatReplyOriginalFailedToLoad,
                    style: TextStyle(
                      color: context.colors.textPrimaryMuted,
                      fontSize: _kReplyPreviewFontSize,
                      height: _kReplyPreviewLineHeight,
                      fontStyle: FontStyle.italic,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ),
              ],
            ],
          );
        },
      ),
    );
  }
}

class _ReplyPreviewContent extends StatelessWidget {
  const _ReplyPreviewContent({required this.message, required this.emptyLabel});

  final Message message;
  final String emptyLabel;

  @override
  Widget build(BuildContext context) {
    final style = TextStyle(
      color: context.colors.textPrimaryMuted,
      fontSize: _kReplyPreviewFontSize,
      height: _kReplyPreviewLineHeight,
    );
    final content = message.content.trim();
    if (content.isEmpty) {
      return Text(
        emptyLabel,
        style: style.copyWith(fontStyle: FontStyle.italic),
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
      );
    }
    return IgnorePointer(
      child: SizedBox(
        width: double.infinity,
        child: MessageMarkdown(
          data: content,
          channelId: message.channelId,
          messageId: message.id,
          mentionChannels: message.mentionChannels,
          markdownContext: FluxerMarkdownContext.restrictedInlineReply,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          baseStyle: style,
        ),
      ),
    );
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
class ReplyInputBar extends ConsumerWidget {
  final Message replyTo;
  final String guildId;
  final bool shouldReplyMention;
  final ValueChanged<bool> onToggleMention;
  final VoidCallback onCancel;

  const ReplyInputBar({
    required this.replyTo,
    required this.guildId,
    required this.shouldReplyMention,
    required this.onToggleMention,
    required this.onCancel,
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final String? currentUserId = ref.watch(currentUserIdProvider);
    final GuildUserDisplay replyAuthorDisplay = watchMessageAuthorDisplay(
      ref: ref,
      message: replyTo,
      guildId: guildId.isEmpty ? null : guildId,
      currentUserId: currentUserId,
    );
    final bool isOwnMessage =
        currentUserId != null && replyTo.authorId == currentUserId;
    final bool isWebhook =
        replyTo.webhookId != null && replyTo.webhookId!.isNotEmpty;
    final bool canMention = guildId.isNotEmpty && !isOwnMessage && !isWebhook;
    final bool shouldMention = shouldReplyMention && canMention;
    final Color activeMentionColor = context.colors.markupMentionText;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: context.colors.chatInputBackground,
        border: Border(
          top: BorderSide(color: context.colors.userAreaDividerColor),
        ),
      ),
      child: Row(
        children: [
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
                    text: replyAuthorDisplay.displayName,
                    style: TextStyle(
                      color: context.colors.textChat,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ),
          if (canMention)
            Tooltip(
              message: shouldMention
                  ? l10n.chatReplyMentionDisableTooltip
                  : l10n.chatReplyMentionEnableTooltip,
              child: Semantics(
                button: true,
                checked: shouldMention,
                label: l10n.chatReplyMentionAccessibilityLabel,
                child: InkWell(
                  onTap: () => unawaited(
                    _toggleMention(
                      context: context,
                      ref: ref,
                      shouldMention: shouldMention,
                      authorNickname: replyAuthorDisplay.displayName,
                      onToggleMention: onToggleMention,
                    ),
                  ),
                  borderRadius: BorderRadius.circular(4),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 8,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        PhosphorIcon(
                          PhosphorIconsBold.at,
                          size: 20,
                          color: shouldMention
                              ? activeMentionColor
                              : context.colors.textPrimaryMuted,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          shouldMention
                              ? l10n.chatReplyMentionOn
                              : l10n.chatReplyMentionOff,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: shouldMention
                                ? activeMentionColor
                                : context.colors.textPrimaryMuted,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          Semantics(
            label: l10n.chatReplyCancel,
            child: IconButton(
              icon: const PhosphorIcon(PhosphorIconsFill.xCircle, size: 16),
              color: context.colors.textPrimaryMuted,
              onPressed: onCancel,
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(minWidth: 24, minHeight: 24),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _toggleMention({
    required BuildContext context,
    required WidgetRef ref,
    required bool shouldMention,
    required String authorNickname,
    required ValueChanged<bool> onToggleMention,
  }) async {
    final bool next = !shouldMention;
    final MentionReplyPreferences preference =
        await resolveMentionReplyPreferenceFromDb(
          database: ref.read(fluxerDatabaseProvider),
          authorId: replyTo.authorId,
          guildId: guildId.isEmpty ? null : guildId,
        );
    final ReplyMentionPreferenceConflict? conflict =
        getReplyMentionPreferenceConflict(
          mentioning: next,
          preference: preference,
        );
    if (conflict != null && context.mounted) {
      final FluxerLocalizations l10n = FluxerLocalizations.of(context);
      final String description = switch (conflict) {
        ReplyMentionPreferenceConflict.prefersMention =>
          l10n.chatReplyMentionPrefersMentionBody(authorNickname),
        ReplyMentionPreferenceConflict.prefersNoMention =>
          l10n.chatReplyMentionPrefersNoMentionBody(authorNickname),
      };
      await FluxerConfirmModal.show(
        context,
        title: l10n.chatReplyMentionOverrideTitle,
        description: description,
        confirmLabel: l10n.chatReplyMentionIgnorePreference,
        onConfirm: () => onToggleMention(next),
      );
      return;
    }
    onToggleMention(next);
  }
}

/// The edit bar shown above the input while message editing is active.
class EditingInputBar extends StatelessWidget {
  final VoidCallback onCancel;

  const EditingInputBar({required this.onCancel, super.key});

  @override
  Widget build(BuildContext context) => Container(
    padding: const EdgeInsets.symmetric(horizontal: 16),
    decoration: BoxDecoration(
      color: context.colors.chatInputBackground,
      border: Border(
        top: BorderSide(color: context.colors.userAreaDividerColor),
      ),
    ),
    child: Row(
      children: [
        PhosphorIcon(
          PhosphorIconsFill.pencilSimple,
          size: 16,
          color: context.colors.textPrimaryMuted,
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            FluxerLocalizations.of(context).chatEditingMessage,
            style: TextStyle(
              color: context.colors.textPrimaryMuted,
              fontSize: 14,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ),
        IconButton(
          icon: const PhosphorIcon(PhosphorIconsFill.xCircle, size: 16),
          color: context.colors.textPrimaryMuted,
          onPressed: onCancel,
          padding: EdgeInsets.zero,
          constraints: const BoxConstraints(minWidth: 24, minHeight: 24),
        ),
      ],
    ),
  );
}
