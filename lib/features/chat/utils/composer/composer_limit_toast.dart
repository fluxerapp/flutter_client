import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/features/chat/providers/messages/message_length_limits_provider.dart';
import 'package:fluxer_app/features/ui/ui.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';

void showComposerTooLongToast(WidgetRef ref, FluxerLocalizations l10n) {
  ref
      .read(toastProvider.notifier)
      .show(
        FluxerToast(
          message: l10n.characterCounterTooLongToast(
            ref.read(maxMessageLengthProvider),
          ),
          variant: FluxerToastVariant.warning,
        ),
      );
}
