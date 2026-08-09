import 'package:flutter/material.dart';
import 'package:fluxer_app/features/ui/button/fluxer_button.dart';
import 'package:fluxer_app/features/ui/modal/fluxer_modal.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';

enum VoiceConnectionConfirmResult { switchToThisDevice, justJoin }

Future<VoiceConnectionConfirmResult?> showVoiceConnectionConfirmModal(
  BuildContext context, {
  required int otherDeviceCount,
}) {
  final FluxerLocalizations l10n = FluxerLocalizations.of(context);
  return FluxerModal.show<VoiceConnectionConfirmResult?>(
    context,
    useRootNavigator: true,
    title: l10n.voiceConnectionConfirmTitle,
    description: l10n.voiceConnectionConfirmDescription(otherDeviceCount),
    builder: (BuildContext dialogContext, VoidCallback close) {
      return const SizedBox.shrink();
    },
    actionsBuilder:
        (void Function([VoiceConnectionConfirmResult? result]) pop) => <Widget>[
          FluxerButton.primary(
            onPressed: () =>
                pop(VoiceConnectionConfirmResult.switchToThisDevice),
            label: l10n.voiceConnectionConfirmSwitch,
          ),
          const SizedBox(height: 8),
          FluxerButton.secondary(
            onPressed: () => pop(VoiceConnectionConfirmResult.justJoin),
            label: l10n.voiceConnectionConfirmJustJoin,
          ),
          const SizedBox(height: 8),
          FluxerButton.secondary(
            onPressed: () => pop(),
            label: l10n.voiceConnectionConfirmDoNothing,
          ),
        ],
  );
}
