import 'package:flutter/material.dart';
import 'package:fluxer_app/features/channels/domain/channel.dart';
import 'package:fluxer_app/features/channels/presentation/widgets/channel_notification_menu_content.dart';
import 'package:fluxer_app/features/ui/ui.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_dart/export.dart';

Future<void> showChannelNotificationSettingsSheet(
  BuildContext context, {
  required Channel channel,
  Future<void> Function(UserNotificationSettings setting)? onSetNotification,
}) async {
  final FluxerLocalizations l10n = FluxerLocalizations.of(context);
  await FluxerBottomSheet.show<void>(
    context,
    title: l10n.notificationSettings,
    variant: FluxerBottomSheetVariant.menu,
    builder: (sheetContext, close) =>
        ChannelNotificationMenuContent(channel: channel, onClose: close),
  );
}
