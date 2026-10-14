import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/channels/domain/channel.dart';
import 'package:fluxer_app/features/channels/presentation/widgets/channel_icon.dart';
import 'package:fluxer_app/features/channels/providers/channel_notification_menu_provider.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/channel/header/channel_notification_settings_button.dart';
import 'package:fluxer_app/features/dm/presentation/widgets/group_dm_avatar.dart';
import 'package:fluxer_app/features/notifications/data/unread_inbox_card_meta.dart';
import 'package:fluxer_app/features/notifications/domain/unread_inbox_entry.dart';
import 'package:fluxer_app/features/notifications/presentation/widgets/notification_row.dart';
import 'package:fluxer_app/features/ui/avatar/fluxer_avatar.dart';
import 'package:fluxer_app/features/ui/avatar/fluxer_guild_icon_avatar.dart';
import 'package:fluxer_app/features/ui/badge/fluxer_badge.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

const double _kRowActionSize = 32;
const double _kRowActionIconSize = 18;
const double _kSubtitleFontSize = 12;
const double _kSubtitleLineHeight = 16;

class UnreadInboxCardLeading extends StatelessWidget {
  const UnreadInboxCardLeading({
    required this.entry,
    required this.meta,
    super.key,
  });

  final UnreadInboxEntry entry;
  final UnreadInboxCardMeta meta;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    if (!entry.isDm) {
      return FluxerGuildIconAvatar(
        name: meta.guildIconName,
        imageUrl: meta.guildIconDisplayUrl,
        isUnavailable: meta.guildUnavailableForIcon,
        size: kNotificationRowLeadingSize,
      );
    }
    if (meta.groupDm case final groupDm?) {
      return GroupDmAvatar.conversation(
        groupDm,
        size: kNotificationRowLeadingSize,
      );
    }
    if (meta.dmUser case final user?) {
      return FluxerAvatar.fromUserRow(
        user,
        size: kNotificationRowLeadingSize,
        showStatus: false,
      );
    }
    return FluxerAvatar.icon(
      icon: PhosphorIconsFill.chatCircle,
      size: kNotificationRowLeadingSize,
      iconColor: colors.textPrimaryMuted,
      iconBackgroundColor: colors.backgroundTertiary,
    );
  }
}

class UnreadInboxCardHeader extends StatelessWidget {
  const UnreadInboxCardHeader({
    required this.entry,
    required this.meta,
    required this.collapsed,
    required this.read,
    required this.onToggleCollapsed,
    required this.onMarkRead,
    required this.channel,
    super.key,
  });

  final UnreadInboxEntry entry;
  final UnreadInboxCardMeta meta;
  final bool collapsed;
  final bool read;
  final VoidCallback? onToggleCollapsed;
  final VoidCallback onMarkRead;
  final Channel? channel;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final VoidCallback? toggle = onToggleCollapsed;
    final TextStyle titleStyle = notificationTitleStyle(context).copyWith(
      fontWeight: FontWeight.w500,
      color: read ? colors.textPrimaryMuted : colors.textPrimary,
    );
    return ConstrainedBox(
      constraints: const BoxConstraints(minHeight: kNotificationRowLeadingSize),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    if (!entry.isDm) ...<Widget>[
                      ChannelIcon(
                        type: meta.guildChannelVisualType,
                        color: colors.textSecondary,
                        size: kNotificationTitleFontSize,
                      ),
                      const SizedBox(width: 4),
                    ],
                    Flexible(
                      child: Text(
                        meta.channelTitle,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: titleStyle,
                      ),
                    ),
                    if (!read && entry.mentionCount > 0) ...<Widget>[
                      const SizedBox(width: 8),
                      FluxerBadge.count(count: entry.mentionCount),
                    ],
                  ],
                ),
                if (meta.subtitleLine.isNotEmpty)
                  Text(
                    meta.subtitleLine,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: context.textStyles.bodySmall.copyWith(
                      fontSize: _kSubtitleFontSize,
                      height: _kSubtitleLineHeight / _kSubtitleFontSize,
                      color: colors.textPrimaryMuted,
                    ),
                  ),
              ],
            ),
          ),
          if (channel case final Channel channel)
            _NotificationSettingsAction(channel: channel),
          if (!read)
            _RowAction(
              icon: const Icon(PhosphorIconsBold.check),
              tooltip: l10n.notificationsMarkAsRead,
              onPressed: onMarkRead,
            ),
          if (toggle != null)
            _RowAction(
              icon: Icon(
                collapsed
                    ? PhosphorIconsBold.caretRight
                    : PhosphorIconsBold.caretDown,
              ),
              tooltip: collapsed
                  ? l10n.notificationsExpand
                  : l10n.notificationsCollapse,
              onPressed: toggle,
            ),
        ],
      ),
    );
  }
}

class _NotificationSettingsAction extends StatelessWidget {
  const _NotificationSettingsAction({required this.channel});

  final Channel channel;

  @override
  Widget build(BuildContext context) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    return ChannelNotificationSettingsButton(
      channel: channel,
      anchorBuilder:
          (
            BuildContext context, {
            required bool isOpen,
            required VoidCallback toggle,
          }) {
            return Consumer(
              builder: (BuildContext context, WidgetRef ref, _) {
                final bool isMuted =
                    ref
                        .watch(channelNotificationMenuStateProvider(channel))
                        .value
                        ?.isMuted ??
                    false;
                return _RowAction(
                  icon: Icon(
                    isMuted
                        ? PhosphorIconsBold.bellSimpleSlash
                        : PhosphorIconsBold.bellSimple,
                  ),
                  tooltip: isMuted
                      ? l10n.channelHeaderNotificationSettingsMuted
                      : l10n.notificationSettings,
                  onPressed: toggle,
                );
              },
            );
          },
    );
  }
}

class _RowAction extends StatelessWidget {
  const _RowAction({
    required this.icon,
    required this.onPressed,
    required this.tooltip,
  });

  final Widget icon;
  final VoidCallback onPressed;
  final String tooltip;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(start: 4),
      child: IconButton(
        padding: EdgeInsets.zero,
        style: IconButton.styleFrom(
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        ),
        constraints: const BoxConstraints(
          minWidth: _kRowActionSize,
          minHeight: _kRowActionSize,
        ),
        onPressed: onPressed,
        icon: IconTheme.merge(
          data: IconThemeData(
            size: _kRowActionIconSize,
            color: context.colors.textPrimaryMuted,
          ),
          child: icon,
        ),
        tooltip: tooltip,
      ),
    );
  }
}
