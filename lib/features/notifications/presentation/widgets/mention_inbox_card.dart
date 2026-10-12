import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/channels/domain/channel.dart' as domain;
import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/messages/message_item.dart';
import 'package:fluxer_app/features/notifications/domain/mention_header.dart';
import 'package:fluxer_app/features/notifications/presentation/widgets/notification_row_header.dart';
import 'package:fluxer_app/features/notifications/presentation/widgets/notifications_skeleton.dart';
import 'package:fluxer_app/features/ui/tappable/fluxer_tappable.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
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
    final MentionHeader? mentionHeader = header;
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                NotificationRowHeader(
                  isDm: mentionHeader?.isDm ?? false,
                  title: mentionHeader?.primary ?? '',
                  subtitle: _subtitle(mentionHeader, msg, l10n),
                  channelType:
                      mentionHeader?.guildChannelVisualType ??
                      domain.ChannelType.guildText,
                  guildIconName: mentionHeader?.guildIconName ?? '',
                  guildIconUrl: mentionHeader?.guildIconUrl,
                  isGuildUnavailable:
                      mentionHeader?.isGuildUnavailable ?? false,
                  actions: <Widget>[
                    NotificationRowAction(
                      icon: const Icon(PhosphorIconsBold.x),
                      tooltip:
                          removeTooltip ??
                          l10n.notificationsRemoveMentionTooltip,
                      onPressed: () => onRemove(messageId),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                _buildPreview(context, ref, l10n),
              ],
            ),
          ),
    );
  }

  String _subtitle(
    MentionHeader? mentionHeader,
    Message? msg,
    FluxerLocalizations l10n,
  ) {
    return <String>[
      if (mentionHeader != null && mentionHeader.secondaryLine.isNotEmpty)
        mentionHeader.secondaryLine,
      if (msg != null) relativeTimeShort(msg.timestamp, l10n),
    ].join(_kSubtitleSeparator);
  }

  Widget _buildPreview(
    BuildContext context,
    WidgetRef ref,
    FluxerLocalizations l10n,
  ) {
    final colors = context.colors;
    final Message? msg = message;
    final String? guildId = previewGuildId;
    return DecoratedBox(
      decoration: BoxDecoration(
        color: colors.backgroundSecondaryAlt,
        borderRadius: BorderRadius.circular(kNotificationPreviewRadius),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(kNotificationPreviewRadius),
        child: msg == null
            ? Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 10,
                ),
                child: Text(
                  l10n.notificationsMessageUnavailable,
                  style: context.textStyles.bodySmall.copyWith(
                    color: colors.textPrimaryMuted,
                  ),
                ),
              )
            : MessageItem(
                message: msg,
                currentUserId: ref.watch(currentUserIdProvider),
                inboxPreviewMode: true,
                hideMentionHighlight: true,
                previewRoleGuildId: guildId == null || guildId.isEmpty
                    ? null
                    : guildId,
              ),
      ),
    );
  }
}
