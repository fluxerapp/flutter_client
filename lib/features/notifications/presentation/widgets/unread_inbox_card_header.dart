import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/notifications/data/unread_inbox_card_meta.dart';
import 'package:fluxer_app/features/notifications/domain/unread_inbox_entry.dart';
import 'package:fluxer_app/features/notifications/presentation/widgets/notification_row_header.dart';
import 'package:fluxer_app/features/ui/badge/fluxer_badge.dart';
import 'package:fluxer_app/features/ui/tappable/fluxer_tappable.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

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
  final VoidCallback? onToggleCollapsed;
  final VoidCallback onJump;
  final VoidCallback onMarkRead;
  final VoidCallback onOpenGuildNotificationSettings;

  @override
  Widget build(BuildContext context) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final VoidCallback? toggle = onToggleCollapsed;
    return FluxerTappable(
      onTap: onJump,
      semanticLabel: meta.channelTitle,
      builder: (BuildContext context, Set<WidgetState> states) =>
          NotificationRowHeader(
            isDm: entry.isDm,
            title: meta.channelTitle,
            subtitle: meta.subtitleLine,
            channelType: meta.guildChannelVisualType,
            guildIconName: meta.guildIconName,
            guildIconUrl: meta.guildIconDisplayUrl,
            isGuildUnavailable: meta.guildUnavailableForIcon,
            badge: entry.mentionCount > 0
                ? FluxerBadge.count(count: entry.mentionCount)
                : null,
            actions: <Widget>[
              if (!entry.isDm && entry.guildId != null)
                NotificationRowAction(
                  icon: const Icon(PhosphorIconsBold.bellSimple),
                  tooltip: l10n.notificationSettings,
                  onPressed: onOpenGuildNotificationSettings,
                ),
              NotificationRowAction(
                icon: const Icon(PhosphorIconsBold.check),
                tooltip: l10n.notificationsMarkAsRead,
                onPressed: onMarkRead,
              ),
              if (toggle != null)
                NotificationRowAction(
                  icon: AnimatedRotation(
                    turns: collapsed ? -0.25 : 0,
                    duration: context.motion.normal,
                    child: const Icon(PhosphorIconsBold.caretDown),
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
