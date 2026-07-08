import 'package:flutter/material.dart';
import 'package:fluxer_app/features/moderation/iar/iar_flow.dart';
import 'package:fluxer_app/features/moderation/iar/iar_simple_report_sheet.dart';
import 'package:fluxer_app/features/ui/modal/fluxer_modal.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';

/// Opens the community report pre-confirm dialog, then the simple IAR sheet.
Future<void> showReportGuildFlow(
  BuildContext context, {
  required String guildId,
  required String guildName,
  String? inviteCode,
}) async {
  final l10n = FluxerLocalizations.of(context);
  final iarContext = IarGuildContext(
    guildId: guildId,
    guildName: guildName,
    inviteCode: inviteCode,
  );
  final confirmed = await FluxerConfirmModal.show(
    context,
    title: l10n.guildMenuReportCommunity,
    description: l10n.iarReportGuildPreconfirmBody,
    confirmLabel: l10n.iarContinueToReportCommunity,
    isDanger: true,
    onConfirm: () {},
  );
  if (confirmed != true || !context.mounted) {
    return;
  }
  await showSimpleIarReportSheet(context, iarContext: iarContext);
}
