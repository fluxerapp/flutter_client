import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/ui/voice/voice_participant_media_tile.dart';
import 'package:fluxer_app/features/voice/utils/media/watched_video_tile.dart';
import 'package:fluxer_dart/gateway.dart';

void main() {
  group('voiceTileTapOpensFullscreen', () {
    test('screen share opens unless it is your own', () {
      expect(
        voiceTileTapOpensFullscreen(
          source: VoiceParticipantTileSource.screenShare,
          selfVideo: false,
          isOwnScreenShare: false,
        ),
        isTrue,
      );
      expect(
        voiceTileTapOpensFullscreen(
          source: VoiceParticipantTileSource.screenShare,
          selfVideo: false,
          isOwnScreenShare: true,
        ),
        isFalse,
      );
    });

    test('camera opens only while video is on', () {
      expect(
        voiceTileTapOpensFullscreen(
          source: VoiceParticipantTileSource.camera,
          selfVideo: true,
          isOwnScreenShare: false,
        ),
        isTrue,
      );
      expect(
        voiceTileTapOpensFullscreen(
          source: VoiceParticipantTileSource.camera,
          selfVideo: false,
          isOwnScreenShare: false,
        ),
        isFalse,
      );
    });
  });

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
    test('expanded tile id wins over focus layout', () {
      expect(
        voiceTileVideoFullscreenExpanded(
          screenShareExpanded: true,
          source: VoiceParticipantTileSource.camera,
          voice: const VoiceState(userId: 'u1', selfVideo: true),
          isWatching: false,
          isFocusMain: false,
          isOwnScreenShare: false,
          tileId: 'a|camera',
          expandedTileId: 'a|camera',
        ),
        isTrue,
      );
      expect(
        voiceTileVideoFullscreenExpanded(
          screenShareExpanded: true,
          source: VoiceParticipantTileSource.camera,
          voice: const VoiceState(userId: 'u1', selfVideo: true),
          isWatching: false,
          isFocusMain: false,
          isOwnScreenShare: false,
          tileId: 'b|camera',
          expandedTileId: 'a|camera',
        ),
        isFalse,
      );
    });

    test('camera expands on the main stage when video is on', () {
      expect(
        voiceTileVideoFullscreenExpanded(
          screenShareExpanded: true,
          source: VoiceParticipantTileSource.camera,
          voice: const VoiceState(userId: 'u1', selfVideo: true),
          isWatching: false,
          isFocusMain: false,
          isOwnScreenShare: false,
          tileId: 'a|camera',
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
          tileId: 'a|camera',
        ),
        isTrue,
      );
    });
  });
}
