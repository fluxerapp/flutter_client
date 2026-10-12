import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/channels/domain/channel.dart' as domain;
import 'package:fluxer_app/features/channels/presentation/widgets/channel_icon.dart';
import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/messages/message_item.dart';
import 'package:fluxer_app/features/notifications/domain/mention_header.dart';
import 'package:fluxer_app/features/notifications/presentation/widgets/notification_row_header.dart';
import 'package:fluxer_app/features/notifications/presentation/widgets/notifications_skeleton.dart';
import 'package:fluxer_app/features/ui/avatar/fluxer_avatar.dart';
import 'package:fluxer_app/features/ui/tappable/fluxer_tappable.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/providers/guild_user_display_provider.dart';
import 'package:fluxer_app/shared/utils/guild_user_display.dart';
import 'package:fluxer_app/shared/utils/relative_time.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

const String _kSubtitleSeparator = ' · ';

class MentionInboxCard extends ConsumerWidget {
  const MentionInboxCard({
    required this.messageId,
    required this.message,
    required this.header,
    required this.previewGuildId,
    required this.onJump,
    required this.onRemove,
    this.removeTooltip,
    super.key,
  });

  final String messageId;
  final Message? message;
  final MentionHeader? header;
  final String? previewGuildId;
  final ValueChanged<Message> onJump;
  final ValueChanged<String> onRemove;
  final String? removeTooltip;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = context.colors;
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final Message? msg = message;
    return FluxerTappable(
      onTap: msg == null ? null : () => onJump(msg),
      semanticLabel: l10n.notificationsJump,
      builder: (BuildContext context, Set<WidgetState> states) =>
          AnimatedContainer(
            duration: context.motion.fast,
            color: states.contains(WidgetState.pressed)
                ? colors.listItemPressedBg
                : Colors.transparent,
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: msg == null
                ? _buildUnavailable(context, l10n)
                : _buildMention(context, ref, l10n, msg),
          ),
    );
  }

  Widget _removeAction(FluxerLocalizations l10n) {
    return NotificationRowAction(
      icon: const Icon(PhosphorIconsBold.x),
      tooltip: removeTooltip ?? l10n.notificationsRemoveMentionTooltip,
      onPressed: () => onRemove(messageId),
    );
  }

  Widget _buildUnavailable(BuildContext context, FluxerLocalizations l10n) {
    final colors = context.colors;
    final MentionHeader? mentionHeader = header;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        NotificationRowHeader(
          isDm: mentionHeader?.isDm ?? false,
          title: mentionHeader?.primary ?? '',
          subtitle: mentionHeader?.secondaryLine ?? '',
          channelType:
              mentionHeader?.guildChannelVisualType ??
              domain.ChannelType.guildText,
          guildIconName: mentionHeader?.guildIconName ?? '',
          guildIconUrl: mentionHeader?.guildIconUrl,
          isGuildUnavailable: mentionHeader?.isGuildUnavailable ?? false,
          actions: <Widget>[_removeAction(l10n)],
        ),
        const SizedBox(height: 8),
        Padding(
          padding: const EdgeInsets.only(left: kNotificationRowTextInset),
          child: _previewBox(
            context,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              child: Text(
                l10n.notificationsMessageUnavailable,
                style: context.textStyles.bodySmall.copyWith(
                  color: colors.textPrimaryMuted,
                ),
              ),
            ),
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
    final colors = context.colors;
    final textStyles = context.textStyles;
    final MentionHeader? mentionHeader = header;
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
    final bool showChannelIcon = mentionHeader != null && !mentionHeader.isDm;
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
          ),
        ),
        const SizedBox(width: kNotificationRowLeadingGap),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text(
                          author.displayName,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: textStyles.bodyMedium.copyWith(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: colors.textPrimary,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Row(
                          children: <Widget>[
                            if (showChannelIcon) ...<Widget>[
                              ChannelIcon(
                                type: mentionHeader.guildChannelVisualType,
                                color: colors.textPrimaryMuted,
                                size: 13,
                              ),
                              const SizedBox(width: 3),
                            ],
                            Flexible(
                              child: Text(
                                _subtitle(mentionHeader, msg, author, l10n),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: textStyles.bodySmall.copyWith(
                                  fontSize: 13,
                                  color: colors.textPrimaryMuted,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 4),
                  _removeAction(l10n),
                ],
              ),
              const SizedBox(height: 8),
              _previewBox(
                context,
                MessageItem(
                  message: msg,
                  currentUserId: currentUserId,
                  inboxPreviewMode: true,
                  hideMentionHighlight: true,
                  previewContentOnly: true,
                  previewRoleGuildId: roleGuildId,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  String _subtitle(
    MentionHeader? mentionHeader,
    Message msg,
    GuildUserDisplay author,
    FluxerLocalizations l10n,
  ) {
    return <String>[
      if (mentionHeader != null &&
          mentionHeader.primary.isNotEmpty &&
          mentionHeader.primary != author.displayName)
        mentionHeader.primary,
      if (mentionHeader != null && mentionHeader.secondaryLine.isNotEmpty)
        mentionHeader.secondaryLine,
      relativeTimeShort(msg.timestamp, l10n),
    ].join(_kSubtitleSeparator);
  }

  Widget _previewBox(BuildContext context, Widget child) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: context.colors.backgroundSecondaryAlt,
        borderRadius: BorderRadius.circular(kNotificationPreviewRadius),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(kNotificationPreviewRadius),
        child: child,
      ),
    );
  }
}
