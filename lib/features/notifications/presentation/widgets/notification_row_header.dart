import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/channels/domain/channel.dart' as domain;
import 'package:fluxer_app/features/channels/presentation/widgets/channel_icon.dart';
import 'package:fluxer_app/features/notifications/presentation/widgets/notifications_skeleton.dart';
import 'package:fluxer_app/features/ui/avatar/fluxer_avatar.dart';
import 'package:fluxer_app/features/ui/avatar/fluxer_guild_icon_avatar.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

const double kNotificationRowActionSize = 32;

class NotificationRowHeader extends StatelessWidget {
  const NotificationRowHeader({
    required this.isDm,
    required this.title,
    required this.subtitle,
    required this.channelType,
    required this.guildIconName,
    required this.guildIconUrl,
    required this.isGuildUnavailable,
    this.badge,
    this.actions = const <Widget>[],
    super.key,
  });

  final bool isDm;
  final String title;
  final String subtitle;
  final domain.ChannelType channelType;
  final String guildIconName;
  final String? guildIconUrl;
  final bool isGuildUnavailable;
  final Widget? badge;
  final List<Widget> actions;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final textStyles = context.textStyles;
    return Row(
      children: <Widget>[
        if (isDm)
          FluxerAvatar.icon(
            icon: PhosphorIconsFill.chatCircle,
            size: kNotificationRowLeadingSize,
            iconColor: colors.textPrimaryMuted,
            iconBackgroundColor: colors.backgroundSecondaryAlt,
          )
        else
          FluxerGuildIconAvatar(
            name: guildIconName,
            imageUrl: guildIconUrl,
            isUnavailable: isGuildUnavailable,
            size: kNotificationRowLeadingSize,
          ),
        const SizedBox(width: kNotificationRowLeadingGap),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Row(
                children: <Widget>[
                  if (!isDm) ...<Widget>[
                    ChannelIcon(
                      type: channelType,
                      color: colors.textPrimaryMuted,
                      size: 16,
                    ),
                    const SizedBox(width: 4),
                  ],
                  Flexible(
                    child: Text(
                      title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: textStyles.bodyMedium.copyWith(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: colors.textPrimary,
                      ),
                    ),
                  ),
                  if (badge case final Widget badge) ...<Widget>[
                    const SizedBox(width: 8),
                    badge,
                  ],
                ],
              ),
              if (subtitle.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.only(top: 2),
                  child: Text(
                    subtitle,
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
        ),
        for (final Widget action in actions) ...<Widget>[
          const SizedBox(width: 4),
          action,
        ],
      ],
    );
  }
}

class NotificationRowAction extends StatelessWidget {
  const NotificationRowAction({
    required this.icon,
    required this.onPressed,
    this.tooltip,
    super.key,
  });

  final Widget icon;
  final VoidCallback? onPressed;
  final String? tooltip;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      padding: EdgeInsets.zero,
      constraints: const BoxConstraints(
        minWidth: kNotificationRowActionSize,
        minHeight: kNotificationRowActionSize,
      ),
      onPressed: onPressed,
      icon: IconTheme.merge(
        data: IconThemeData(size: 18, color: context.colors.textPrimaryMuted),
        child: icon,
      ),
      tooltip: tooltip,
    );
  }
}
