import 'package:fluxer_app/features/guilds/domain/guild.dart';
import 'package:fluxer_app/features/guilds/providers/guild_drag_provider.dart';
import 'package:fluxer_app/features/shell/presentation/responsive_layout.dart';
import 'package:fluxer_app/features/ui/action_menu/context_menu_widgets.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:material_ui/material_ui.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

const Duration kGuildPeekHoldDelay = Duration(milliseconds: 400);
const double kGuildPeekHoldCancelThreshold = 4;

enum GuildIconPeekAction { markAsRead, notifications, moreOptions }

typedef GuildIconPeekActionHandler =
    Future<void> Function(BuildContext context, GuildIconPeekAction action);

class GuildIconPeekMenuConfig {
  const GuildIconPeekMenuConfig({
    required this.guildName,
    required this.hasUnread,
    required this.onAction,
  });

  final String guildName;
  final bool hasUnread;
  final GuildIconPeekActionHandler onAction;
}

GuildIconPeekMenuConfig? buildGuildPeekMenuConfig(
  BuildContext context, {
  required Guild guild,
  required bool hasUnread,
  required GuildIconPeekActionHandler onAction,
}) {
  if (!isMobileLayout(context)) {
    return null;
  }
  return GuildIconPeekMenuConfig(
    guildName: guild.name,
    hasUnread: hasUnread,
    onAction: onAction,
  );
}

List<GuildIconPeekAction> visibleGuildIconPeekActions({
  required bool hasUnread,
}) {
  return <GuildIconPeekAction>[
    if (hasUnread) GuildIconPeekAction.markAsRead,
    GuildIconPeekAction.notifications,
    GuildIconPeekAction.moreOptions,
  ];
}

bool shouldCancelGuildPeekHold({
  required Offset? pointerDownPosition,
  required Offset currentPosition,
  double threshold = kGuildPeekHoldCancelThreshold,
}) {
  if (pointerDownPosition == null) {
    return false;
  }
  return (currentPosition.dy - pointerDownPosition.dy).abs() >= threshold;
}

bool shouldSuppressPeekForDrag({
  required Offset? pointerDownPosition,
  required Offset currentPosition,
  double threshold = kGuildDragCollapseThreshold,
}) {
  return shouldCancelGuildPeekHold(
    pointerDownPosition: pointerDownPosition,
    currentPosition: currentPosition,
    threshold: threshold,
  );
}

/// Anchor for a sidebar peek/context menu beside a guild or folder icon.
Offset sidebarPeekMenuAnchorPosition(RenderBox box) {
  final Offset topLeft = box.localToGlobal(Offset.zero);
  final Size size = box.size;
  return Offset(topLeft.dx + size.width + 8, topLeft.dy + size.height / 2);
}

GuildIconPeekAction? hitTestPeekAction({
  required Offset globalPosition,
  required Map<GuildIconPeekAction, GlobalKey> itemKeys,
  required List<GuildIconPeekAction> visibleActions,
}) {
  for (final GuildIconPeekAction action in visibleActions) {
    final BuildContext? itemContext = itemKeys[action]?.currentContext;
    if (itemContext == null) {
      continue;
    }
    final RenderBox? box = itemContext.findRenderObject() as RenderBox?;
    if (box == null || !box.hasSize) {
      continue;
    }
    final Offset topLeft = box.localToGlobal(Offset.zero);
    final Rect rect = topLeft & box.size;
    if (rect.contains(globalPosition)) {
      return action;
    }
  }
  return null;
}

String peekActionLabel(FluxerLocalizations l10n, GuildIconPeekAction action) {
  switch (action) {
    case GuildIconPeekAction.markAsRead:
      return l10n.guildMenuMarkAsRead;
    case GuildIconPeekAction.notifications:
      return l10n.notificationSettings;
    case GuildIconPeekAction.moreOptions:
      return l10n.guildPeekMoreOptions;
  }
}

IconData peekActionIcon(GuildIconPeekAction action) {
  switch (action) {
    case GuildIconPeekAction.markAsRead:
      return PhosphorIconsFill.eye;
    case GuildIconPeekAction.notifications:
      return PhosphorIconsFill.bell;
    case GuildIconPeekAction.moreOptions:
      return PhosphorIconsFill.dotsThreeOutline;
  }
}

class GuildIconPeekMenuPanel extends StatelessWidget {
  const GuildIconPeekMenuPanel({
    required this.guildName,
    required this.hasUnread,
    required this.itemKeys,
    super.key,
  });

  final String guildName;
  final bool hasUnread;
  final Map<GuildIconPeekAction, GlobalKey> itemKeys;

  @override
  Widget build(BuildContext context) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final List<GuildIconPeekAction> visibleActions =
        visibleGuildIconPeekActions(hasUnread: hasUnread);
    final List<Widget> items = <Widget>[
      ContextMenuTitle(title: guildName),
      const ContextMenuDivider(),
      for (final GuildIconPeekAction action in visibleActions)
        KeyedSubtree(
          key: itemKeys[action],
          child: ContextMenuItem(
            label: peekActionLabel(l10n, action),
            icon: peekActionIcon(action),
            onTap: () {},
          ),
        ),
    ];
    return Align(
      widthFactor: 1,
      heightFactor: 1,
      alignment: Alignment.centerLeft,
      child: ContextMenuPanel(items: items),
    );
  }
}
