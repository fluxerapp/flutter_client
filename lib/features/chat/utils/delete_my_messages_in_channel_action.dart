import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/api/fluxer_client_provider.dart';
import 'package:fluxer_app/features/chat/providers/core/chat_view_model.dart';
import 'package:fluxer_app/features/ui/ui.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_dart/export.dart';
import 'package:material_ui/material_ui.dart';

Future<void> confirmAndDeleteMyMessagesInChannel(
  BuildContext context,
  WidgetRef ref, {
  required String channelId,
  required bool isPrivateConversation,
}) async {
  final FluxerLocalizations l10n = FluxerLocalizations.of(context);
  final String title = isPrivateConversation
      ? l10n.dmDeleteMyMessagesTitle
      : l10n.channelMenuDeleteMyMessagesTitle;
  final String description = isPrivateConversation
      ? l10n.dmDeleteMyMessagesDescription
      : l10n.channelMenuDeleteMyMessagesDescription;
  final bool? confirmed = await FluxerConfirmModal.show(
    context,
    title: title,
    description: description,
    confirmLabel: l10n.channelMenuDeleteMyMessagesConfirm,
    isDanger: true,
    onConfirm: () {},
  );
  if (confirmed != true) {
    return;
  }
  final toast = ref.read(toastProvider.notifier);
  try {
    await ref
        .read(fluxerClientProvider)
        .channels
        .bulkDeleteMyMessagesInChannel(
          channelId: channelId,
          body: const SudoVerificationSchema(),
        );
    if (ref.read(chatViewModelProvider).channelId == channelId) {
      await ref.read(chatViewModelProvider.notifier).reloadCurrentChannel();
    }
    toast.show(
      FluxerToast(
        message: l10n.channelMenuDeletedYourMessages,
        variant: FluxerToastVariant.success,
      ),
    );
  } on Object {
    toast.show(
      FluxerToast(
        message: l10n.channelMenuCouldNotDeleteYourMessages,
        variant: FluxerToastVariant.danger,
      ),
    );
  }
}
