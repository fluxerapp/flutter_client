import 'dart:async';

import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/composer/voice_message_live_gradient.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/composer/voice_message_recording_controller.dart';
import 'package:fluxer_app/features/chat/service/voice_message_send.dart';
import 'package:fluxer_app/features/chat/utils/voice_message_constants.dart';
import 'package:fluxer_app/features/ui/button/fluxer_button.dart';
import 'package:fluxer_app/features/ui/button/fluxer_button_size.dart';
import 'package:fluxer_app/features/ui/button/fluxer_button_variant.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class VoiceMessageDiscardButton extends StatelessWidget {
  const VoiceMessageDiscardButton({
    required this.controller,
    required this.size,
    super.key,
  });

  final VoiceMessageRecordingController controller;
  final FluxerButtonSize size;

  @override
  Widget build(BuildContext context) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final bool armed = controller.discardPreview;
    final bool locked = controller.isLocked;
    final VoidCallback? onPressed = controller.isSending
        ? null
        : () => unawaited(controller.stop(send: false));
    return IgnorePointer(
      key: controller.trashKey,
      ignoring: !locked,
      child: armed
          ? FluxerButton.circle(
              icon: PhosphorIconsFill.trash,
              semanticLabel: l10n.voiceMessageDiscard,
              variant: FluxerButtonVariant.dangerPrimary,
              iconSize: 20,
              size: size,
              onPressed: onPressed,
            )
          : FluxerButton.circleAlt(
              icon: PhosphorIconsFill.trash,
              semanticLabel: l10n.voiceMessageDiscard,
              size: size,
              onPressed: onPressed,
            ),
    );
  }
}

class VoiceMessageRecordingBar extends StatelessWidget {
  const VoiceMessageRecordingBar({
    required this.controller,
    required this.trailing,
    required this.actionSize,
    super.key,
  });

  final VoiceMessageRecordingController controller;
  final Widget trailing;
  final FluxerButtonSize actionSize;

  static double heightFor(FluxerButtonSize actionSize) {
    return actionSize.height +
        kVoiceMessageRecordingBarInsetTop +
        kVoiceMessageRecordingBarInsetBottom;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: heightFor(actionSize),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(kVoiceMessageRecordingBarRadiusPx),
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            VoiceMessageLiveGradient(rmsLevel: controller.rmsLevel),
            Padding(
              padding: const EdgeInsets.fromLTRB(
                kVoiceMessageRecordingBarInsetH,
                kVoiceMessageRecordingBarInsetTop,
                kVoiceMessageRecordingBarInsetH,
                kVoiceMessageRecordingBarInsetBottom,
              ),
              child: Row(
                children: <Widget>[
                  VoiceMessageDiscardButton(
                    controller: controller,
                    size: actionSize,
                  ),
                  const SizedBox(width: 8),
                  Container(
                    width: 8,
                    height: 8,
                    decoration: BoxDecoration(
                      color: context.colors.accentDanger,
                      shape: BoxShape.circle,
                    ),
                  ),
                  const SizedBox(width: 10),
                  ValueListenableBuilder<int>(
                    valueListenable: controller.durationMs,
                    builder: (BuildContext context, int durationMs, _) {
                      return Text(
                        formatVoiceDurationMs(durationMs),
                        style: context.textStyles.label.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontFeatures: const <FontFeature>[
                            FontFeature.tabularFigures(),
                          ],
                        ),
                      );
                    },
                  ),
                  const Spacer(),
                  trailing,
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class VoiceMessageLockChip extends StatelessWidget {
  const VoiceMessageLockChip({required this.controller, super.key});

  final VoiceMessageRecordingController controller;

  @override
  Widget build(BuildContext context) {
    final bool showLockedStyle = controller.isLocked;
    final bool showActive = controller.lockPreview || controller.isLocked;
    return IgnorePointer(
      child: Opacity(
        opacity: showActive ? 1 : 0.55,
        child: Container(
          key: controller.lockKey,
          width: 36,
          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
          decoration: BoxDecoration(
            color: showLockedStyle ? Colors.white : Colors.black,
            borderRadius: BorderRadius.circular(12),
            boxShadow: const <BoxShadow>[
              BoxShadow(
                color: Color(0x40000000),
                blurRadius: 16,
                offset: Offset(0, 6),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Icon(
                showLockedStyle
                    ? PhosphorIconsFill.lockSimple
                    : PhosphorIconsFill.lockSimpleOpen,
                size: 18,
                color: showLockedStyle
                    ? context.colors.accentSuccess
                    : Colors.white,
              ),
              if (!showLockedStyle)
                const Icon(
                  PhosphorIconsBold.caretUp,
                  size: 16,
                  color: Colors.white,
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class VoiceMessageRecordingSendButton extends StatelessWidget {
  const VoiceMessageRecordingSendButton({
    required this.controller,
    required this.size,
    super.key,
  });

  final VoiceMessageRecordingController controller;
  final FluxerButtonSize size;

  @override
  Widget build(BuildContext context) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    return FluxerButton.circle(
      icon: PhosphorIconsFill.paperPlaneRight,
      semanticLabel: l10n.voiceMessageSend,
      iconSize: 20,
      size: size,
      onPressed: controller.isSending
          ? null
          : () => unawaited(
              controller.stop(
                send:
                    controller.durationMs.value >=
                    kVoiceMessageMinSendDurationMs,
              ),
            ),
    );
  }
}
