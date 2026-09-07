import 'package:fluxer_app/features/chat/utils/voice_message_constants.dart';
import 'package:fluxer_app/features/chat/utils/voice_message_recording_gestures.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:test/test.dart';

void main() {
  group('voiceMessageLockGesturePassesThreshold', () {
    test('requires vertical drag not hold in place', () {
      const Offset start = Offset(100, 200);
      expect(
        voiceMessageLockGesturePassesThreshold(
          pointerStart: start,
          globalPosition: start,
        ),
        isFalse,
      );
      expect(
        voiceMessageLockGesturePassesThreshold(
          pointerStart: start,
          globalPosition: Offset(
            start.dx,
            start.dy - kVoiceMessageLockDragMinVerticalDeltaPx,
          ),
        ),
        isTrue,
      );
    });
  });

  group('voiceMessageDiscardGestureHitsTarget', () {
    test('hits inflated trash rect', () {
      const Rect trash = Rect.fromLTWH(8, 400, 40, 40);
      expect(
        voiceMessageDiscardGestureHitsTarget(
          target: trash,
          globalPosition: const Offset(28, 420),
        ),
        isTrue,
      );
      expect(
        voiceMessageDiscardGestureHitsTarget(
          target: trash,
          globalPosition: const Offset(8 - kVoiceMessageDiscardHitPadPx, 420),
        ),
        isTrue,
      );
      expect(
        voiceMessageDiscardGestureHitsTarget(
          target: trash,
          globalPosition: const Offset(200, 420),
        ),
        isFalse,
      );
    });
  });

  group('voiceMessageHoldPreview', () {
    test('trash wins when finger is both left and up', () {
      const Offset start = Offset(300, 500);
      const Rect trash = Rect.fromLTWH(8, 430, 40, 80);
      const Rect lock = Rect.fromLTWH(300, 430, 36, 44);
      final VoiceMessageHoldPreview preview = voiceMessageHoldPreview(
        globalPosition: const Offset(20, 448),
        pointerStart: start,
        trashRect: trash,
        lockRect: lock,
      );
      expect(preview.discardPreview, isTrue);
      expect(preview.lockPreview, isFalse);
    });

    test('lock preview when sliding up without hitting trash', () {
      const Offset start = Offset(300, 500);
      const Rect trash = Rect.fromLTWH(8, 470, 40, 40);
      final VoiceMessageHoldPreview preview = voiceMessageHoldPreview(
        globalPosition: Offset(
          start.dx,
          start.dy - kVoiceMessageLockDragMinVerticalDeltaPx,
        ),
        pointerStart: start,
        trashRect: trash,
        lockRect: const Rect.fromLTWH(300, 430, 36, 44),
      );
      expect(preview.discardPreview, isFalse);
      expect(preview.lockPreview, isTrue);
    });
  });

  group('resolveVoiceMessageHoldRelease', () {
    test('locks when lock preview is armed', () {
      expect(
        resolveVoiceMessageHoldRelease(
          isLocked: false,
          isSending: false,
          isRecording: true,
          discardPreview: false,
          lockPreview: true,
          durationMs: 800,
        ),
        VoiceMessageHoldReleaseAction.lock,
      );
    });

    test('discards when released on trash', () {
      expect(
        resolveVoiceMessageHoldRelease(
          isLocked: false,
          isSending: false,
          isRecording: true,
          discardPreview: true,
          lockPreview: false,
          durationMs: 800,
        ),
        VoiceMessageHoldReleaseAction.discard,
      );
    });

    test('sends when duration meets minimum', () {
      expect(
        resolveVoiceMessageHoldRelease(
          isLocked: false,
          isSending: false,
          isRecording: true,
          discardPreview: false,
          lockPreview: false,
          durationMs: kVoiceMessageMinSendDurationMs,
        ),
        VoiceMessageHoldReleaseAction.send,
      );
    });

    test('discards short recordings', () {
      expect(
        resolveVoiceMessageHoldRelease(
          isLocked: false,
          isSending: false,
          isRecording: true,
          discardPreview: false,
          lockPreview: false,
          durationMs: kVoiceMessageMinSendDurationMs - 1,
        ),
        VoiceMessageHoldReleaseAction.discard,
      );
    });

    test('ignores release after lock', () {
      expect(
        resolveVoiceMessageHoldRelease(
          isLocked: true,
          isSending: false,
          isRecording: true,
          discardPreview: false,
          lockPreview: false,
          durationMs: 800,
        ),
        VoiceMessageHoldReleaseAction.ignore,
      );
    });
  });
}
