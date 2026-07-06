import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/api/fluxer_client_provider.dart';
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/features/ui/toast/fluxer_toast.dart';
import 'package:fluxer_app/features/ui/toast/toast_provider.dart';
import 'package:fluxer_app/shared/utils/sdk_converters.dart';
import 'package:fluxer_app/shared/widgets/debug_bottom_sheet.dart';

Future<void> showChannelDebugSheet(
  BuildContext context, {
  required WidgetRef ref,
  required String channelId,
  required String title,
}) async {
  Map<String, Object?>? data;
  final localChannel = await ref
      .read(fluxerDatabaseProvider)
      .channelDao
      .getChannelById(channelId);
  if (localChannel != null) {
    data = channelResponseFromRow(localChannel).toJson();
  } else {
    try {
      final channel = await ref
          .read(fluxerClientProvider)
          .channels
          .getChannel(channelId: channelId);
      data = channel.toJson();
    } on Exception catch (_) {}
  }
  if (data == null || !context.mounted) {
    return;
  }
  await showDebugBottomSheet(
    context,
    title: title,
    data: data,
    onCopied: (message) => ref
        .read(toastProvider.notifier)
        .show(
          FluxerToast(message: message, variant: FluxerToastVariant.success),
        ),
  );
}
