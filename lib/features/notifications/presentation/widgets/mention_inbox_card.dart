import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/messages/message_item.dart';
import 'package:fluxer_app/features/notifications/domain/mention_header.dart';
import 'package:fluxer_app/features/notifications/presentation/widgets/notification_row.dart';
import 'package:fluxer_app/features/ui/avatar/fluxer_avatar.dart';
import 'package:fluxer_app/features/ui/bottom_sheet/fluxer_bottom_sheet.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/providers/guild_user_display_provider.dart';
import 'package:fluxer_app/shared/utils/guild_user_display.dart';
import 'package:fluxer_app/shared/utils/relative_time.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

const String _kAuthorToken = '';
const String _kPlaceToken = '';
const String _kPlainTitleSeparator = '  ';

enum MentionInboxCardTitle { mention, plain }

class MentionInboxCard extends ConsumerWidget {
  const MentionInboxCard({
    required this.messageId,
    required this.message,
    required this.header,
    required this.previewGuildId,
    required this.onJump,
    required this.onRemove,
    this.onReply,
    this.isUnread = false,
    this.title = MentionInboxCardTitle.mention,
    this.removeLabel,
    super.key,
  });

  final String messageId;
  final Message? message;
  final MentionHeader? header;
  final String? previewGuildId;
  final ValueChanged<Message> onJump;
  final ValueChanged<String> onRemove;
  final ValueChanged<Message>? onReply;
  final bool isUnread;
  final MentionInboxCardTitle title;
  final String? removeLabel;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final Message? msg = message;
    return NotificationRowSurface(
      onTap: msg == null ? null : () => onJump(msg),
      onLongPress: () => _showActions(context, l10n),
      semanticLabel: l10n.notificationsJump,
      child: msg == null
          ? _buildUnavailable(context, l10n)
          : _buildMention(context, ref, l10n, msg),
    );
  }

  void _showActions(BuildContext context, FluxerLocalizations l10n) {
    unawaited(
      FluxerBottomSheet.show<void>(
        context,
        variant: FluxerBottomSheetVariant.menu,
        useRootNavigator: true,
        builder: (BuildContext sheetContext, VoidCallback close) => Padding(
          padding: EdgeInsets.fromLTRB(
            16,
            0,
            16,
            FluxerBottomSheet.bottomGapOf(sheetContext),
          ),
          child: FluxerMenuGroup(
            children: <Widget>[
              FluxerBottomSheetMenuItem(
                icon: PhosphorIconsBold.trash,
                label: removeLabel ?? l10n.notificationsRemoveNotification,
                isDanger: true,
                onTap: () {
                  onRemove(messageId);
                  close();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  String? _place(FluxerLocalizations l10n) {
    final MentionHeader? mentionHeader = header;
    if (mentionHeader == null || mentionHeader.primary.isEmpty) {
      return null;
    }
    if (!mentionHeader.isDm) {
      return mentionHeader.secondaryLine.isEmpty
          ? mentionHeader.primary
          : l10n.notificationsMentionPlace(
              mentionHeader.secondaryLine,
              mentionHeader.primary,
            );
    }
    return mentionHeader.isGroupDm ? mentionHeader.primary : null;
  }

  Widget _buildUnavailable(BuildContext context, FluxerLocalizations l10n) {
    final colors = context.colors;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        FluxerAvatar.icon(
          icon: PhosphorIconsFill.chatCircle,
          size: kNotificationRowLeadingSize,
          iconColor: colors.textPrimaryMuted,
          iconBackgroundColor: colors.backgroundTertiary,
        ),
        const SizedBox(width: kNotificationRowLeadingGap),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              if (_place(l10n) case final String place)
                Text(
                  place,
                  style: notificationTitleStyle(
                    context,
                  ).copyWith(color: colors.textPrimaryMuted),
                ),
              NotificationQuote(
                child: Text(
                  l10n.notificationsMessageUnavailable,
                  style: notificationQuoteStyle(context, unread: false),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildMention(
    BuildContext context,
    WidgetRef ref,
    FluxerLocalizations l10n,
    Message msg,
  ) {
    final String? guildId = previewGuildId;
    final String? roleGuildId = guildId == null || guildId.isEmpty
        ? null
        : guildId;
    final String? currentUserId = ref.watch(currentUserIdProvider);
    final GuildUserDisplay author = watchMessageAuthorDisplay(
      ref: ref,
      message: msg,
      guildId: roleGuildId,
      currentUserId: currentUserId,
    );
    final ValueChanged<Message>? reply = onReply;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        ExcludeSemantics(
          child: FluxerAvatar.user(
            key: ValueKey<String>(
              'mention-avatar-${msg.authorId}-${author.avatarUrl ?? ''}',
            ),
            fallbackText: author.displayName,
            userId: msg.authorId,
            imageUrl: author.avatarUrl,
            avatarColor: author.avatarColor,
            size: kNotificationRowLeadingSize,
            showStatus: false,
            fadeInDuration: kNotificationAvatarFadeIn,
          ),
        ),
        const SizedBox(width: kNotificationRowLeadingGap),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    child: Text.rich(
                      TextSpan(
                        children: _titleSpans(
                          context,
                          l10n,
                          msg,
                          author.displayName,
                          currentUserId,
                        ),
                      ),
                      style: notificationTitleStyle(context),
                    ),
                  ),
                  const SizedBox(width: kNotificationTimestampGap),
                  Text(
                    relativeTimeShort(
                      msg.timestamp,
                      l10n,
                      minimumOneMinute: true,
                    ),
                    maxLines: 1,
                    style: notificationTimestampStyle(
                      context,
                      unread: isUnread,
                    ),
                  ),
                ],
              ),
              NotificationQuote(
                child: MessageItem(
                  message: msg,
                  currentUserId: currentUserId,
                  inboxPreviewMode: true,
                  hideMentionHighlight: true,
                  previewContentOnly: true,
                  previewTextStyle: notificationQuoteStyle(
                    context,
                    unread: isUnread,
                  ),
                  previewRoleGuildId: roleGuildId,
                ),
              ),
              if (reply != null)
                NotificationRowButton(
                  label: l10n.notificationsSendReply,
                  onPressed: () => reply(msg),
                ),
            ],
          ),
        ),
      ],
    );
  }

  List<InlineSpan> _titleSpans(
    BuildContext context,
    FluxerLocalizations l10n,
    Message msg,
    String authorName,
    String? currentUserId,
  ) {
    final colors = context.colors;
    final TextStyle nameStyle = isUnread
        ? TextStyle(fontWeight: FontWeight.w500, color: colors.textPrimary)
        : TextStyle(
            fontWeight: FontWeight.w400,
            color: colors.textTertiaryMuted,
          );
    final TextStyle verbStyle = isUnread
        ? TextStyle(fontWeight: FontWeight.w700, color: colors.textSecondary)
        : nameStyle;
    final String? place = _place(l10n);
    if (title == MentionInboxCardTitle.plain) {
      return <InlineSpan>[
        TextSpan(text: authorName, style: nameStyle),
        if (place != null)
          TextSpan(
            text: '$_kPlainTitleSeparator$place',
            style: TextStyle(color: colors.textPrimaryMuted),
          ),
      ];
    }
    final bool isReplyPing =
        msg.isReply &&
        (currentUserId == null || !msg.content.contains('<@$currentUserId>'));
    final String template = switch ((isReplyPing, place != null)) {
      (true, true) => l10n.notificationsRepliedToYouIn(
        _kAuthorToken,
        _kPlaceToken,
      ),
      (true, false) => l10n.notificationsRepliedToYou(_kAuthorToken),
      (false, true) => l10n.notificationsMentionedYouIn(
        _kAuthorToken,
        _kPlaceToken,
      ),
      (false, false) => l10n.notificationsMentionedYou(_kAuthorToken),
    };
    final List<InlineSpan> spans = <InlineSpan>[];
    final StringBuffer literal = StringBuffer();
    void flushLiteral() {
      if (literal.isEmpty) {
        return;
      }
      spans.add(TextSpan(text: literal.toString(), style: verbStyle));
      literal.clear();
    }

    for (final int rune in template.runes) {
      final String char = String.fromCharCode(rune);
      if (char == _kAuthorToken || char == _kPlaceToken) {
        flushLiteral();
        spans.add(
          TextSpan(
            text: char == _kAuthorToken ? authorName : place,
            style: nameStyle,
          ),
        );
      } else {
        literal.write(char);
      }
    }
    flushLiteral();
    return spans;
  }
}
