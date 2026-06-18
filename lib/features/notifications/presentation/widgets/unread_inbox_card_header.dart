import 'package:flutter/material.dart';
import 'package:fluxer_app/core/theme/fluxer_color_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_text_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/channels/presentation/widgets/channel_icon.dart';
import 'package:fluxer_app/features/notifications/data/unread_inbox_card_meta.dart';
import 'package:fluxer_app/features/notifications/domain/unread_inbox_entry.dart';
import 'package:fluxer_app/features/ui/avatar/fluxer_guild_icon_avatar.dart';
import 'package:fluxer_app/features/ui/badge/fluxer_badge.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

const double _kActionButtonSize = 28;
const String _kFallbackTitle = '…';

/// Top row of an unread inbox card: collapse-toggle, channel/guild summary,
/// optional mention badge, and bell + mark-read action buttons.
class UnreadInboxCardHeader extends StatelessWidget {
  const UnreadInboxCardHeader({
    required this.entry,
    required this.meta,
    required this.collapsed,
    required this.onToggleCollapsed,
    required this.onJump,
    required this.onMarkRead,
    required this.onOpenGuildNotificationSettings,
    super.key,
  });

  final UnreadInboxEntry entry;
  final UnreadInboxCardMeta meta;
  final bool collapsed;
  final VoidCallback onToggleCollapsed;
  final VoidCallback onJump;
  final VoidCallback onMarkRead;
  final VoidCallback onOpenGuildNotificationSettings;

  @override
  Widget build(BuildContext context) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final FluxerColorTheme colors = context.colors;
    return Padding(
      padding: const EdgeInsets.only(top: 8, bottom: 6),
      child: Row(
        children: <Widget>[
          _buildCollapseToggle(colors, l10n),
          Expanded(child: _buildSummary(context)),
          if (!entry.isDm && entry.guildId != null) ...<Widget>[
            _buildBellButton(colors),
            const SizedBox(width: 6),
          ],
          _buildMarkReadButton(colors, l10n),
        ],
      ),
    );
  }

  Widget _buildCollapseToggle(
    FluxerColorTheme colors,
    FluxerLocalizations l10n,
  ) {
    return IconButton(
      padding: EdgeInsets.zero,
      constraints: const BoxConstraints(
        minWidth: _kActionButtonSize,
        minHeight: _kActionButtonSize,
      ),
      onPressed: onToggleCollapsed,
      icon: AnimatedRotation(
        turns: collapsed ? -0.25 : 0,
        duration: const Duration(milliseconds: 150),
        child: Icon(
          PhosphorIconsBold.caretDown,
          size: 14,
          color: colors.textPrimaryMuted,
        ),
      ),
      tooltip: collapsed
          ? l10n.notificationsExpand
          : l10n.notificationsCollapse,
    );
  }

  Widget _buildSummary(BuildContext context) {
    final FluxerColorTheme colors = context.colors;
    final FluxerTextTheme textStyles = context.textStyles;
    return InkWell(
      onTap: onJump,
      child: Row(
        children: <Widget>[
          if (!entry.isDm) ...<Widget>[
            FluxerGuildIconAvatar(
              name: meta.guildIconName,
              imageUrl: meta.guildIconDisplayUrl,
              isUnavailable: meta.guildUnavailableForIcon,
            ),
            const SizedBox(width: 8),
          ] else ...<Widget>[
            Icon(
              PhosphorIconsRegular.chatCircle,
              size: 20,
              color: colors.textPrimaryMuted,
            ),
            const SizedBox(width: 6),
          ],
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                if (entry.isDm)
                  Text(
                    meta.channelTitle.isEmpty
                        ? _kFallbackTitle
                        : meta.channelTitle,
                    overflow: TextOverflow.ellipsis,
                    style: textStyles.bodyMedium.copyWith(
                      fontWeight: FontWeight.w700,
                      color: colors.textPrimary,
                      fontSize: 15.2,
                    ),
                  )
                else
                  Row(
                    children: <Widget>[
                      ChannelIcon(
                        type: meta.guildChannelVisualType,
                        color: colors.textPrimaryMuted,
                        size: 16,
                      ),
                      const SizedBox(width: 5),
                      Expanded(
                        child: Text(
                          meta.channelTitle.isEmpty
                              ? _kFallbackTitle
                              : meta.channelTitle,
                          overflow: TextOverflow.ellipsis,
                          style: textStyles.bodyMedium.copyWith(
                            fontWeight: FontWeight.w700,
                            color: colors.textPrimary,
                            fontSize: 15.2,
                          ),
                        ),
                      ),
                    ],
                  ),
                if (meta.subtitleLine.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.only(top: 2),
                    child: Text(
                      meta.subtitleLine,
                      overflow: TextOverflow.ellipsis,
                      style: textStyles.bodySmall.copyWith(
                        color: colors.textPrimaryMuted,
                        fontSize: 12,
                      ),
                    ),
                  ),
              ],
            ),
          ),
          if (entry.mentionCount > 0)
            Padding(
              padding: const EdgeInsets.only(left: 8),
              child: FluxerBadge.count(count: entry.mentionCount),
            ),
        ],
      ),
    );
  }

  Widget _buildBellButton(FluxerColorTheme colors) {
    return IconButton(
      padding: EdgeInsets.zero,
      constraints: const BoxConstraints(
        minWidth: _kActionButtonSize,
        minHeight: _kActionButtonSize,
      ),
      style: IconButton.styleFrom(backgroundColor: colors.backgroundSecondary),
      onPressed: onOpenGuildNotificationSettings,
      icon: Icon(
        PhosphorIconsFill.bellSimple,
        size: 16,
        color: colors.textPrimaryMuted,
      ),
    );
  }

  Widget _buildMarkReadButton(
    FluxerColorTheme colors,
    FluxerLocalizations l10n,
  ) {
    return IconButton(
      padding: EdgeInsets.zero,
      constraints: const BoxConstraints(
        minWidth: _kActionButtonSize,
        minHeight: _kActionButtonSize,
      ),
      style: IconButton.styleFrom(backgroundColor: colors.backgroundSecondary),
      onPressed: onMarkRead,
      icon: Icon(
        PhosphorIconsBold.check,
        size: 16,
        color: colors.textPrimaryMuted,
      ),
      tooltip: l10n.notificationsMarkAsRead,
    );
  }
}
