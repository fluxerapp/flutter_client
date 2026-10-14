import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/messages/message_confirm_preview.dart';
import 'package:fluxer_app/features/chat/providers/channel/channel_details_providers.dart';
import 'package:fluxer_app/features/ui/modal/fluxer_modal.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/utils/api_error_presentation.dart';

Future<bool?> showPinMessageConfirmModal(
  BuildContext context,
  WidgetRef ref, {
  required Message message,
  String? guildId,
}) {
  final l10n = FluxerLocalizations.of(context);
  return FluxerConfirmModal.show(
    context,
    title: l10n.chatMessagePin,
    description: l10n.chatMessagePinConfirmDescription,
    confirmLabel: l10n.chatMessagePinConfirm,
    body: MessageConfirmPreview(message: message, guildId: guildId),
    onConfirm: () {
      unawaited(
        ref
            .read(channelPinsRepositoryProvider)
            .pinMessage(channelId: message.channelId, messageId: message.id)
            .catchError(
              (Object error) =>
                  showApiErrorFromRoot(ApiErrorAction.pinMessage, error),
            ),
      );
    },
  );
}
