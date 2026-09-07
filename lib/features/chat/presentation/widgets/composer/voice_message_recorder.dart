import 'dart:async';

import 'package:fluxer_app/features/chat/presentation/widgets/composer/voice_message_recording_controller.dart';
import 'package:fluxer_app/features/ui/button/fluxer_button.dart';
import 'package:fluxer_app/features/ui/button/fluxer_button_size.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class VoiceMessageRecorder extends StatefulWidget {
  const VoiceMessageRecorder({
    required this.channelId,
    required this.disabled,
    required this.controller,
    this.holdToRecord = true,
    this.buttonSize = FluxerButtonSize.compact,
    super.key,
  });

  final String channelId;
  final bool disabled;
  final VoiceMessageRecordingController controller;
  final bool holdToRecord;
  final FluxerButtonSize buttonSize;

  @override
  State<VoiceMessageRecorder> createState() => _VoiceMessageRecorderState();
}

class _VoiceMessageRecorderState extends State<VoiceMessageRecorder> {
  @override
  void didUpdateWidget(covariant VoiceMessageRecorder oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.disabled &&
        widget.controller.isRecording &&
        !widget.controller.isSending) {
      unawaited(widget.controller.discardIfDisabled());
    }
  }

  void _handlePointerDown(PointerDownEvent event) {
    if (widget.disabled ||
        widget.controller.isSending ||
        widget.controller.isActive) {
      return;
    }
    if (widget.holdToRecord) {
      unawaited(
        widget.controller.startHold(
          context: context,
          channelId: widget.channelId,
          event: event,
        ),
      );
      return;
    }
    unawaited(
      widget.controller.startLocked(
        context: context,
        channelId: widget.channelId,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    return Semantics(
      label: l10n.voiceMessageTitle,
      hint: widget.holdToRecord ? l10n.voiceMessageHoldHint : null,
      button: true,
      child: Listener(
        behavior: HitTestBehavior.opaque,
        onPointerDown: widget.disabled ? null : _handlePointerDown,
        child: IgnorePointer(
          child: ExcludeSemantics(
            child: FluxerButton.circleAlt(
              icon: PhosphorIconsFill.microphone,
              semanticLabel: l10n.voiceMessageTitle,
              size: widget.buttonSize,
              onPressed: widget.disabled ? null : () {},
            ),
          ),
        ),
      ),
    );
  }
}
