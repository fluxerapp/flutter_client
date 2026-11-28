import 'dart:async';

import 'package:fluxer_app/features/moderation/domain/iar_context.dart';
import 'package:fluxer_app/features/moderation/presentation/report_flow/open_report_flow.dart';
import 'package:fluxer_app/features/ui/action_menu/fluxer_action_menu.dart';
import 'package:fluxer_app/features/ui/desktop_surface/fluxer_desktop_surface.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/icons/phosphor.dart';
import 'package:fluxer_app/shared/utils/clipboard_utils.dart';

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
  final FluxerLocalizations l10n = FluxerLocalizations.of(context);
  return await pushFluxerDesktopMenu<InviteEmbedContextMenuAction>(
    context,
    position: position,
    builder: (BuildContext menuContext, VoidCallback _) {
      void pop(InviteEmbedContextMenuAction action) =>
          Navigator.of(menuContext).pop(action);
      return FluxerDesktopMenuPanel.fitContent(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            if (canCopyGuildId)
              FluxerMenuItem(
                label: l10n.guildMenuCopyCommunityId,
                icon: PhosphorIconsBold.copy,
                onPressed: () => pop(InviteEmbedContextMenuAction.copyGuildId),
              ),
            if (canCopyChannelId)
              FluxerMenuItem(
                label: l10n.dmCopyChannelId,
                icon: PhosphorIconsBold.copy,
                onPressed: () =>
                    pop(InviteEmbedContextMenuAction.copyChannelId),
              ),
            if (canReport)
              FluxerMenuItem(
                label: l10n.guildMenuReportCommunity,
                icon: PhosphorIconsBold.flag,
                isDanger: true,
                onPressed: () => pop(InviteEmbedContextMenuAction.report),
              ),
          ],
        ),
      );
    },
  );
}

Future<void> handleInviteEmbedContextMenuAction({
  required BuildContext context,
  required InviteEmbedContextMenuAction action,
  required String guildId,
  required String channelId,
  IarGuildContext? reportTarget,
}) async {
  switch (action) {
    case InviteEmbedContextMenuAction.copyGuildId:
      await copyToClipboard(context: context, value: guildId);
    case InviteEmbedContextMenuAction.copyChannelId:
      await copyToClipboard(context: context, value: channelId);
    case InviteEmbedContextMenuAction.report:
      if (reportTarget != null) {
        await openReportFlow(context, iarContext: reportTarget);
      }
  }
}
