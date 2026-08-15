import 'dart:async';

import 'package:fluxer_app/features/moderation/iar/iar_report_guild.dart';
import 'package:fluxer_app/features/ui/action_menu/context_menu_widgets.dart';
import 'package:fluxer_app/features/ui/tappable/fluxer_gesture_detector.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/shared/utils/clipboard_utils.dart';
import 'package:material_ui/material_ui.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

enum InviteEmbedContextMenuAction { copyGuildId, copyChannelId, report }

Future<InviteEmbedContextMenuAction?> showInviteEmbedContextMenu(
  BuildContext context, {
  required Offset position,
  required bool canCopyGuildId,
  required bool canCopyChannelId,
  required bool canReport,
}) async {
  if (!canCopyGuildId && !canCopyChannelId && !canReport) {
    return null;
  }
  final RenderBox? overlay =
      Overlay.of(context).context.findRenderObject() as RenderBox?;
  if (overlay == null) {
    return null;
  }
  final Offset localPosition = overlay.globalToLocal(position);
  final FluxerLocalizations l10n = FluxerLocalizations.of(context);
  return Navigator.of(context).push<InviteEmbedContextMenuAction>(
    _InviteEmbedContextMenuRoute(
      position: localPosition,
      overlaySize: overlay.size,
      l10n: l10n,
      canCopyGuildId: canCopyGuildId,
      canCopyChannelId: canCopyChannelId,
      canReport: canReport,
    ),
  );
}

class _InviteEmbedContextMenuRoute
    extends PopupRoute<InviteEmbedContextMenuAction> {
  _InviteEmbedContextMenuRoute({
    required this.position,
    required this.overlaySize,
    required this.l10n,
    required this.canCopyGuildId,
    required this.canCopyChannelId,
    required this.canReport,
  });

  final Offset position;
  final Size overlaySize;
  final FluxerLocalizations l10n;
  final bool canCopyGuildId;
  final bool canCopyChannelId;
  final bool canReport;

  @override
  Duration get transitionDuration => const Duration(milliseconds: 120);

  @override
  bool get barrierDismissible => true;

  @override
  Color? get barrierColor => Colors.transparent;

  @override
  String? get barrierLabel => 'Dismiss';

  @override
  Widget buildTransitions(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    return FadeTransition(opacity: animation, child: child);
  }

  @override
  Widget buildPage(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
  ) {
    const double menuWidth = kContextMenuWidth;
    const double itemHeight = 40;
    final int itemCount =
        (canCopyGuildId ? 1 : 0) +
        (canCopyChannelId ? 1 : 0) +
        (canReport ? 1 : 0);
    final double menuHeight = itemCount * itemHeight + 16;
    double left = position.dx;
    double top = position.dy;
    if (left + menuWidth > overlaySize.width) {
      left = overlaySize.width - menuWidth - 8;
    }
    if (top + menuHeight > overlaySize.height) {
      top = overlaySize.height - menuHeight - 8;
    }
    final List<Widget> items = <Widget>[];
    if (canCopyGuildId) {
      items.add(
        ContextMenuItem(
          label: l10n.guildMenuCopyCommunityId,
          icon: PhosphorIconsBold.copy,
          onTap: () => Navigator.of(
            context,
          ).pop(InviteEmbedContextMenuAction.copyGuildId),
        ),
      );
    }
    if (canCopyChannelId) {
      items.add(
        ContextMenuItem(
          label: l10n.dmCopyChannelId,
          icon: PhosphorIconsBold.copy,
          onTap: () => Navigator.of(
            context,
          ).pop(InviteEmbedContextMenuAction.copyChannelId),
        ),
      );
    }
    if (canReport) {
      items.add(
        ContextMenuItem(
          label: l10n.guildMenuReportCommunity,
          icon: PhosphorIconsBold.flag,
          isDanger: true,
          onTap: () =>
              Navigator.of(context).pop(InviteEmbedContextMenuAction.report),
        ),
      );
    }
    return Stack(
      children: <Widget>[
        Positioned.fill(
          child: FluxerGestureDetector(
            onTap: () => Navigator.of(context).pop(),
            behavior: HitTestBehavior.translucent,
          ),
        ),
        Positioned(
          left: left,
          top: top,
          child: ContextMenuPanel(items: items),
        ),
      ],
    );
  }
}

Future<void> handleInviteEmbedContextMenuAction({
  required BuildContext context,
  required InviteEmbedContextMenuAction action,
  required String guildId,
  required String guildName,
  required String inviteCode,
  required String channelId,
}) async {
  switch (action) {
    case InviteEmbedContextMenuAction.copyGuildId:
      await copyToClipboard(context: context, value: guildId);
    case InviteEmbedContextMenuAction.copyChannelId:
      await copyToClipboard(context: context, value: channelId);
    case InviteEmbedContextMenuAction.report:
      await showReportGuildFlow(
        context,
        guildId: guildId,
        guildName: guildName,
        inviteCode: inviteCode,
      );
  }
}
