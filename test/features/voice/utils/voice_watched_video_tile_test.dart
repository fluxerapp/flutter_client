import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/ui/voice/voice_participant_media_tile.dart';
import 'package:fluxer_app/features/voice/utils/voice_watched_video_tile.dart';
import 'package:fluxer_dart/gateway.dart';

void main() {
  group('voiceFocusMainSupportsVideoFullscreen', () {
    test('screen share needs an active watch', () {
      expect(
        voiceFocusMainSupportsVideoFullscreen(
          source: VoiceParticipantTileSource.screenShare,
          voice: const VoiceState(userId: 'u1', selfStream: true),
          isWatching: false,
        ),
        isFalse,
      );
      expect(
        voiceFocusMainSupportsVideoFullscreen(
          source: VoiceParticipantTileSource.screenShare,
          voice: const VoiceState(userId: 'u1', selfStream: true),
          isWatching: true,
        ),
        isTrue,
      );
    });

    test('camera needs selfVideo only', () {
      expect(
        voiceFocusMainSupportsVideoFullscreen(
          source: VoiceParticipantTileSource.camera,
          voice: const VoiceState(userId: 'u1', selfVideo: true),
          isWatching: false,
        ),
        isTrue,
      );
    });
  });

  group('voiceTileVideoFullscreenExpanded', () {
    test('camera expands on the main stage when video is on', () {
      expect(
        voiceTileVideoFullscreenExpanded(
          screenShareExpanded: true,
          source: VoiceParticipantTileSource.camera,
          voice: const VoiceState(userId: 'u1', selfVideo: true),
          isWatching: false,
          isFocusMain: false,
          isOwnScreenShare: false,
        ),
        isFalse,
      );
      expect(
        voiceTileVideoFullscreenExpanded(
          screenShareExpanded: true,
          source: VoiceParticipantTileSource.camera,
          voice: const VoiceState(userId: 'u1', selfVideo: true),
          isWatching: false,
          isFocusMain: true,
          isOwnScreenShare: false,
        ),
        isTrue,
      );
    });
  });
}
