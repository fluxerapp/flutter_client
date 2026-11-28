import 'dart:async';

import 'package:flutter/services.dart';
import 'package:fluxer_app/features/moderation/domain/iar_context.dart';
import 'package:fluxer_app/features/moderation/presentation/report_flow/open_report_flow.dart';
import 'package:fluxer_app/features/ui/action_menu/fluxer_action_menu.dart';
import 'package:fluxer_app/features/ui/desktop_surface/fluxer_desktop_surface.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/icons/phosphor.dart';

enum DiscoveryGuildCardAction { copyId, report }

Future<DiscoveryGuildCardAction?> showDiscoveryGuildContextMenu(
  BuildContext context, {
  required Offset position,
}) async {
  final FluxerLocalizations l10n = FluxerLocalizations.of(context);
  return await pushFluxerDesktopMenu<DiscoveryGuildCardAction>(
    context,
    position: position,
    builder: (BuildContext menuContext, VoidCallback _) {
      void pop(DiscoveryGuildCardAction action) =>
          Navigator.of(menuContext).pop(action);
      return FluxerDesktopMenuPanel.fitContent(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            FluxerMenuItem(
              label: l10n.guildMenuCopyCommunityId,
              icon: PhosphorIconsBold.copy,
              onPressed: () => pop(DiscoveryGuildCardAction.copyId),
            ),
            FluxerMenuItem(
              label: l10n.guildMenuReportCommunity,
              icon: PhosphorIconsBold.flag,
              isDanger: true,
              onPressed: () => pop(DiscoveryGuildCardAction.report),
            ),
          ],
        ),
      );
    },
  );
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
