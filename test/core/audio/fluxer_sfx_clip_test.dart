import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/audio/enums/fluxer_sfx_clip.dart';

void main() {
  const Set<FluxerSfxClip> notificationClips = <FluxerSfxClip>{
    FluxerSfxClip.message,
    FluxerSfxClip.directMessage,
    FluxerSfxClip.sameChannelMessage,
    FluxerSfxClip.incomingRing,
  };

  const Set<FluxerSfxClip> sessionFeedbackClips = <FluxerSfxClip>{
    FluxerSfxClip.cameraOff,
    FluxerSfxClip.cameraOn,
    FluxerSfxClip.deaf,
    FluxerSfxClip.undeaf,
    FluxerSfxClip.mute,
    FluxerSfxClip.unmute,
    FluxerSfxClip.pttActive,
    FluxerSfxClip.pttInactive,
    FluxerSfxClip.streamStart,
    FluxerSfxClip.streamStop,
    FluxerSfxClip.userJoin,
    FluxerSfxClip.userLeave,
    FluxerSfxClip.userMove,
    FluxerSfxClip.viewerJoin,
    FluxerSfxClip.viewerLeave,
    FluxerSfxClip.voiceDisconnect,
  };

  group('FluxerSfxClip.respectsRinger', () {
    test('every clip is assigned to exactly one policy', () {
      final Set<FluxerSfxClip> allClips = FluxerSfxClip.values.toSet();
      expect(notificationClips.length + sessionFeedbackClips.length, 20);
      expect(notificationClips.union(sessionFeedbackClips), allClips);
      expect(notificationClips.intersection(sessionFeedbackClips), isEmpty);
    });

    test('notification clips respect the ringer', () {
      for (final FluxerSfxClip clip in notificationClips) {
        expect(clip.respectsRinger, isTrue, reason: clip.name);
      }
    });

    test('session feedback clips ignore the ringer', () {
      for (final FluxerSfxClip clip in sessionFeedbackClips) {
        expect(clip.respectsRinger, isFalse, reason: clip.name);
      }
    });
  });
}
