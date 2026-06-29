import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/features/chat/providers/channel/channel_details_providers.dart';
import 'package:fluxer_app/features/ui/bottom_sheet/fluxer_confirm_sheet.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';

/// Shows a confirmation bottom sheet for unpinning a pinned message.
///
/// Resolves to `true` when the user taps confirm; `null` when dismissed.
Future<bool?> showUnpinMessageConfirmSheet(
  BuildContext context,
  WidgetRef ref, {
  required String channelId,
  required String messageId,
}) {
  final l10n = FluxerLocalizations.of(context);
  return FluxerConfirmSheet.show(
    context,
    title: l10n.chatMessageUnpinConfirmTitle,
    description: l10n.chatMessageUnpinConfirmDescription,
    confirmLabel: l10n.chatMessageUnpinIt,
    isDanger: true,
    onConfirm: () {
      unawaited(
        ref
            .read(channelPinsRepositoryProvider)
            .unpinMessage(channelId: channelId, messageId: messageId),
      );
    },
  );
}
