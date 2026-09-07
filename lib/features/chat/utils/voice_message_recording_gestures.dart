import 'package:fluxer_app/features/chat/utils/voice_message_constants.dart';
import 'package:fluxer_app/material_ui.dart';

enum VoiceMessageHoldReleaseAction { discard, lock, send, ignore }

class VoiceMessageHoldPreview {
  const VoiceMessageHoldPreview({
    required this.discardPreview,
    required this.lockPreview,
  });

  final bool discardPreview;
  final bool lockPreview;
}

bool voiceMessageLockGesturePassesThreshold({
  required Offset pointerStart,
  required Offset globalPosition,
}) {
  return pointerStart.dy - globalPosition.dy >=
          kVoiceMessageLockDragMinVerticalDeltaPx &&
      (globalPosition.dx - pointerStart.dx).abs() <=
          kVoiceMessageLockDragMaxHorizontalDeltaPx;
}

bool voiceMessageDiscardGestureHitsTarget({
  required Rect target,
  required Offset globalPosition,
  double pad = kVoiceMessageDiscardHitPadPx,
}) {
  return target.inflate(pad).contains(globalPosition);
}

Rect? voiceMessageHitRect(GlobalKey key) {
  final RenderObject? renderObject = key.currentContext?.findRenderObject();
  if (renderObject is! RenderBox || !renderObject.hasSize) {
    return null;
  }
  return renderObject.localToGlobal(Offset.zero) & renderObject.size;
}

VoiceMessageHoldPreview voiceMessageHoldPreview({
  required Offset globalPosition,
  required Offset? pointerStart,
  required Rect? trashRect,
  required Rect? lockRect,
}) {
  final bool discard =
      trashRect != null &&
      voiceMessageDiscardGestureHitsTarget(
        target: trashRect,
        globalPosition: globalPosition,
      );
  if (discard) {
    return const VoiceMessageHoldPreview(
      discardPreview: true,
      lockPreview: false,
    );
  }
  final bool insideLock = lockRect?.contains(globalPosition) ?? false;
  final bool lock =
      insideLock ||
      (pointerStart != null &&
          voiceMessageLockGesturePassesThreshold(
            pointerStart: pointerStart,
            globalPosition: globalPosition,
          ));
  return VoiceMessageHoldPreview(discardPreview: false, lockPreview: lock);
}

VoiceMessageHoldReleaseAction resolveVoiceMessageHoldRelease({
  required bool isLocked,
  required bool isSending,
  required bool isRecording,
  required bool discardPreview,
  required bool lockPreview,
  required int durationMs,
}) {
  if (isLocked || isSending || !isRecording) {
    return VoiceMessageHoldReleaseAction.ignore;
  }
  if (discardPreview) {
    return VoiceMessageHoldReleaseAction.discard;
  }
  if (lockPreview) {
    return VoiceMessageHoldReleaseAction.lock;
  }
  if (durationMs >= kVoiceMessageMinSendDurationMs) {
    return VoiceMessageHoldReleaseAction.send;
  }
  return VoiceMessageHoldReleaseAction.discard;
}
