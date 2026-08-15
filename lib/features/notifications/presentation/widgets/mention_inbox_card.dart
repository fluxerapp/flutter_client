import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/channels/domain/channel.dart' as domain;
import 'package:fluxer_app/features/channels/presentation/widgets/channel_icon.dart';
import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/messages/message_item.dart';
import 'package:fluxer_app/features/notifications/domain/mention_header.dart';
import 'package:fluxer_app/features/ui/avatar/fluxer_guild_icon_avatar.dart';
import 'package:fluxer_app/features/ui/spinner/fluxer_loading_spinner.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:material_ui/material_ui.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

const double _kMentionActionButtonSize = 28;
const double _kMessageLoaderHeight = 48;
const String _kFallbackTitle = '…';

/// Single row in the mentions feed: header (server avatar + channel/guild
/// labels + jump/remove actions) and the inline message preview underneath.
class MentionInboxCard extends ConsumerWidget {
  const MentionInboxCard({
    required this.messageId,
    required this.message,
    required this.header,
    required this.previewGuildId,
    required this.onJump,
    required this.onRemove,
    this.isMessageLoading = false,
    this.removeTooltip,
    super.key,
  });

  final String messageId;
  final Message? message;
  final bool isMessageLoading;
  final MentionHeader? header;
  final String? previewGuildId;
  final ValueChanged<Message> onJump;
  final ValueChanged<String> onRemove;
  final String? removeTooltip;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = context.colors;
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: colors.backgroundSecondary,
          borderRadius: BorderRadius.circular(6),
          border: Border.all(color: colors.backgroundHeaderSecondary),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 10, 10, 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              _buildHeaderRow(context, l10n),
              const SizedBox(height: 8),
              _buildBody(context, ref, l10n),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeaderRow(BuildContext context, FluxerLocalizations l10n) {
    final colors = context.colors;
    final textStyles = context.textStyles;
    final MentionHeader? mentionHeader = header;
    final bool isDm = mentionHeader?.isDm ?? true;
    final String title = mentionHeader?.primary ?? _kFallbackTitle;
    final String guildLine = mentionHeader?.secondaryLine ?? '';
    final domain.ChannelType visualType =
        mentionHeader?.guildChannelVisualType ?? domain.ChannelType.guildText;
    final Message? msg = message;
    return Row(
      children: <Widget>[
        if (isDm)
          Icon(
            PhosphorIconsBold.chatCircle,
            size: 20,
            color: colors.textPrimaryMuted,
          )
        else
          FluxerGuildIconAvatar(
            name: mentionHeader?.guildIconName ?? '',
            imageUrl: mentionHeader?.guildIconUrl,
            isUnavailable: mentionHeader?.isGuildUnavailable ?? false,
          ),
        const SizedBox(width: 6),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                spacing: 3,
                children: <Widget>[
                  if (!isDm)
                    ChannelIcon(
                      type: visualType,
                      color: colors.textPrimaryMuted,
                      size: 18,
                    ),
                  Flexible(
                    child: Text(
                      title,
                      overflow: TextOverflow.ellipsis,
                      style: textStyles.bodyMedium.copyWith(
                        fontWeight: FontWeight.w700,
                        fontSize: 15.2,
                        color: colors.textPrimary,
                      ),
                    ),
                  ),
                ],
              ),
              if (guildLine.isNotEmpty)
                Text(
                  guildLine,
                  overflow: TextOverflow.ellipsis,
                  style: textStyles.bodySmall.copyWith(
                    fontSize: 12,
                    color: colors.textPrimaryMuted,
                  ),
                ),
            ],
          ),
        ),
        _ActionIconButton(
          icon: PhosphorIconsBold.arrowUpRight,
          tooltip: l10n.notificationsJump,
          onPressed: msg == null ? null : () => onJump(msg),
        ),
        _ActionIconButton(
          icon: PhosphorIconsBold.x,
          tooltip: removeTooltip ?? l10n.notificationsRemoveMentionTooltip,
          onPressed: () => onRemove(messageId),
        ),
      ],
    );
  }

  Widget _buildBody(
    BuildContext context,
    WidgetRef ref,
    FluxerLocalizations l10n,
  ) {
    final colors = context.colors;
    final textStyles = context.textStyles;
    final Message? msg = message;
    if (isMessageLoading) {
      return SizedBox(
        height: _kMessageLoaderHeight,
        child: Center(child: FluxerLoadingSpinner(color: colors.brandPrimary)),
      );
    }
    if (msg == null) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Text(
          l10n.notificationsMessageUnavailable,
          style: textStyles.bodySmall.copyWith(color: colors.textPrimaryMuted),
        ),
      );
    }
    final String? guildId = previewGuildId;
    return MessageItem(
      message: msg,
      currentUserId: ref.watch(currentUserIdProvider),
      inboxPreviewMode: true,
      hideMentionHighlight: true,
      previewRoleGuildId: guildId == null || guildId.isEmpty ? null : guildId,
    );
  }
}

class _ActionIconButton extends StatelessWidget {
  const _ActionIconButton({
    required this.icon,
    required this.tooltip,
    required this.onPressed,
  });

  final IconData icon;
  final String tooltip;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return IconButton(
      padding: EdgeInsets.zero,
      constraints: const BoxConstraints(
        minWidth: _kMentionActionButtonSize,
        minHeight: _kMentionActionButtonSize,
      ),
      style: IconButton.styleFrom(backgroundColor: colors.backgroundTertiary),
      onPressed: onPressed,
      icon: Icon(icon, size: 16, color: colors.textPrimaryMuted),
      tooltip: tooltip,
    );
  }
}
