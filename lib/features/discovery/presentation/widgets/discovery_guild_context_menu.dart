import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluxer_app/features/ui/action_menu/context_menu_widgets.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

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
      position: localPosition,
      overlaySize: overlay.size,
      l10n: l10n,
    ),
  );
}

class _DiscoveryGuildContextMenuRoute
    extends PopupRoute<DiscoveryGuildCardAction> {
  _DiscoveryGuildContextMenuRoute({
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
    const double menuHeight = 96;
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
          child: GestureDetector(
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
                icon: PhosphorIconsRegular.copy,
                onTap: () =>
                    Navigator.of(context).pop(DiscoveryGuildCardAction.copyId),
              ),
              ContextMenuItem(
                label: l10n.guildMenuReportCommunity,
                icon: PhosphorIconsRegular.flag,
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
  required String guildId,
}) async {
  switch (action) {
    case DiscoveryGuildCardAction.copyId:
      await Clipboard.setData(ClipboardData(text: guildId));
    case DiscoveryGuildCardAction.report:
      break;
  }
}
