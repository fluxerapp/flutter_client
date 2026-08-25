import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/features/chat/providers/core/chat_view_model.dart';
import 'package:fluxer_app/features/ui/bottom_sheet/fluxer_confirm_sheet.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';

/// Shows a confirmation bottom sheet for clearing every reaction from a
/// message.
///
/// Resolves to `true` when the user taps confirm; `null` when dismissed.
Future<bool?> showRemoveAllReactionsConfirmSheet(
  BuildContext context,
  WidgetRef ref, {
  required String messageId,
}) {
  final l10n = FluxerLocalizations.of(context);
  return FluxerConfirmSheet.show(
    context,
    title: l10n.chatMessageRemoveAllReactionsConfirmTitle,
    description: l10n.chatMessageRemoveAllReactionsConfirmDescription,
    confirmLabel: l10n.chatMessageRemoveAllReactions,
    isDanger: true,
    onConfirm: () {
      unawaited(
        ref
            .read(chatViewModelProvider.notifier)
            .removeAllReactionsOnMessage(messageId),
      );
    },
  );
}
