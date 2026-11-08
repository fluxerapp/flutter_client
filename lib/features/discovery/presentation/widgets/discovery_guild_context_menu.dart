import 'dart:async';

import 'package:flutter/services.dart';
import 'package:fluxer_app/features/moderation/domain/iar_context.dart';
import 'package:fluxer_app/features/moderation/presentation/report_flow/open_report_flow.dart';
import 'package:fluxer_app/features/ui/action_menu/context_menu_widgets.dart';
import 'package:fluxer_app/features/ui/tappable/fluxer_gesture_detector.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/icons/phosphor.dart';

enum DiscoveryGuildCardAction { copyId, report }

Future<DiscoveryGuildCardAction?> showDiscoveryGuildContextMenu(
  BuildContext context, {
  required Offset position,
}) async {
  final RenderBox? overlay =
      Overlay.of(context).context.findRenderObject() as RenderBox?;
  if (overlay == null) {
    return null;
  }
  final Offset localPosition = overlay.globalToLocal(position);
  final FluxerLocalizations l10n = FluxerLocalizations.of(context);
  return Navigator.of(context).push<DiscoveryGuildCardAction>(
    _DiscoveryGuildContextMenuRoute(
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
      position: localPosition,
      overlaySize: overlay.size,
      l10n: l10n,
    ),
  );
}

class _DiscoveryGuildContextMenuRoute
    extends PopupRoute<DiscoveryGuildCardAction> {
  _DiscoveryGuildContextMenuRoute({
    required this.barrierLabel,
    required this.position,
    required this.overlaySize,
    required this.l10n,
  });

  final Offset position;
  final Size overlaySize;
  final FluxerLocalizations l10n;

  @override
  Duration get transitionDuration => const Duration(milliseconds: 120);

  @override
  bool get barrierDismissible => true;

  @override
  Color? get barrierColor => Colors.transparent;

  @override
  final String barrierLabel;

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
    final double menuHeight =
        DiscoveryGuildCardAction.values.length * itemHeight + 16;
    double left = position.dx;
    double top = position.dy;
    if (left + menuWidth > overlaySize.width) {
      left = overlaySize.width - menuWidth - 8;
    }
    if (top + menuHeight > overlaySize.height) {
      top = overlaySize.height - menuHeight - 8;
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
          child: ContextMenuPanel(
            items: <Widget>[
              ContextMenuItem(
                label: l10n.guildMenuCopyCommunityId,
                icon: PhosphorIconsBold.copy,
                onTap: () =>
                    Navigator.of(context).pop(DiscoveryGuildCardAction.copyId),
              ),
              ContextMenuItem(
                label: l10n.guildMenuReportCommunity,
                icon: PhosphorIconsBold.flag,
                isDanger: true,
                onTap: () =>
                    Navigator.of(context).pop(DiscoveryGuildCardAction.report),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

Future<void> handleDiscoveryGuildCardAction({
  required BuildContext context,
  required DiscoveryGuildCardAction action,
  required IarGuildContext guild,
}) async {
  switch (action) {
    case DiscoveryGuildCardAction.copyId:
      await Clipboard.setData(ClipboardData(text: guild.guildId));
    case DiscoveryGuildCardAction.report:
      await openReportFlow(context, iarContext: guild);
  }
}
