import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/features/ui/toast/fluxer_toast.dart';
import 'package:fluxer_app/features/ui/toast/toast_provider.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';

Future<void> copyToClipboard({
  required BuildContext context,
  required String value,
  String? message,
  FluxerToastVariant variant = FluxerToastVariant.success,
}) async {
  await Clipboard.setData(ClipboardData(text: value));
  if (!context.mounted) {
    return;
  }
  final String toastMessage =
      message ?? FluxerLocalizations.of(context).copiedToClipboard;
  ProviderScope.containerOf(context, listen: false)
      .read(toastProvider.notifier)
      .show(FluxerToast(message: toastMessage, variant: variant));
}
