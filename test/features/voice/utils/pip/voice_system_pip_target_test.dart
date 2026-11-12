import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/ui/voice/voice_participant_media_tile.dart';
import 'package:fluxer_app/features/voice/providers/voice_system_pip_providers.dart';
import 'package:fluxer_app/features/voice/utils/pip/pip_featured_selector.dart';
import 'package:fluxer_app/features/voice/utils/pip/system_pip_target.dart';
import 'package:livekit_client/livekit_client.dart';

VoicePipCandidate _cam(
  String id, {
  bool hasVideo = true,
  bool isLocal = false,
}) {
  return VoicePipCandidate(
    tileId: '$id|camera',
    speakingKey: id,
    source: VoiceParticipantTileSource.camera,
    hasVideo: hasVideo,
    isLocal: isLocal,
    isMuted: false,
  );
}

VoicePipCandidate _screen(String id, {bool isLocal = false}) {
  return VoicePipCandidate(
    tileId: '$id|screen',
    speakingKey: id,
    source: VoiceParticipantTileSource.screenShare,
    hasVideo: true,
    isLocal: isLocal,
    isMuted: false,
  );
}

void main() {
  group('resolveVoiceSystemPipTileId', () {
    final List<VoicePipCandidate> candidates = <VoicePipCandidate>[
      _cam('a'),
      _screen('a'),
      _cam('b'),
      _screen('b'),
      _cam('me', isLocal: true),
      _screen('me', isLocal: true),
      _cam('off', hasVideo: false),
    ];

    test('returns null when nothing is watched', () {
      expect(
        resolveVoiceSystemPipTileId(
          expandedTileId: null,
          pinnedTileId: null,
          watchedTileIds: const <String>{},
          candidates: candidates,
        ),
        isNull,
      );
    });

    test('expanded tile wins over pinned and watched', () {
      expect(
        resolveVoiceSystemPipTileId(
          expandedTileId: 'b|camera',
          pinnedTileId: 'a|camera',
          watchedTileIds: const <String>{'a|screen'},
          candidates: candidates,
        ),
        'b|camera',
      );
    });

    test('pinned tile wins over watched screen share', () {
      expect(
        resolveVoiceSystemPipTileId(
          expandedTileId: null,
          pinnedTileId: 'a|camera',
          watchedTileIds: const <String>{'b|screen'},
          candidates: candidates,
        ),
        'a|camera',
      );
    });

    test('falls back to a watched screen share', () {
      expect(
        resolveVoiceSystemPipTileId(
          expandedTileId: null,
          pinnedTileId: null,
          watchedTileIds: const <String>{'b|screen'},
          candidates: candidates,
        ),
        'b|screen',
      );
    });

    test('skips local, video-less and blocked tiles', () {
      expect(
        resolveVoiceSystemPipTileId(
          expandedTileId: 'me|screen',
          pinnedTileId: 'off|camera',
          watchedTileIds: const <String>{'a|screen', 'b|screen'},
          candidates: candidates,
          blockedTileIds: const <String>{'a|screen'},
        ),
        'b|screen',
      );
    });

    test('unknown tile ids are ignored', () {
      expect(
        resolveVoiceSystemPipTileId(
          expandedTileId: 'gone|camera',
          pinnedTileId: null,
          watchedTileIds: const <String>{'gone|screen'},
          candidates: candidates,
        ),
        isNull,
      );
    });

    test('prefers the tile the in-app pip shows when it is focused', () {
      expect(
        resolveVoiceSystemPipTileId(
          expandedTileId: null,
          pinnedTileId: 'a|camera',
          watchedTileIds: const <String>{'b|screen'},
          preferredTileId: 'b|screen',
          candidates: candidates,
        ),
        'b|screen',
      );
    });

    test('ignores an in-app pip tile that is not focused', () {
      expect(
        resolveVoiceSystemPipTileId(
          expandedTileId: null,
          pinnedTileId: null,
          watchedTileIds: const <String>{'b|screen'},
          preferredTileId: 'a|camera',
          candidates: candidates,
        ),
        'b|screen',
      );
      expect(
        resolveVoiceSystemPipTileId(
          expandedTileId: null,
          pinnedTileId: null,
          watchedTileIds: const <String>{},
          preferredTileId: 'a|camera',
          candidates: candidates,
        ),
        isNull,
      );
    });
  });

  group('voiceSystemPipQuality', () {
    test('small windows use lower layers', () {
      expect(
        voiceSystemPipQuality(isScreenShare: false, pipSize: null),
        VideoQuality.LOW,
      );
      expect(
        voiceSystemPipQuality(
          isScreenShare: true,
          pipSize: const Size(240, 135),
        ),
        VideoQuality.MEDIUM,
      );
    });

    test('enlarged windows raise quality', () {
      expect(
        voiceSystemPipQuality(
          isScreenShare: false,
          pipSize: const Size(400, 225),
        ),
        VideoQuality.MEDIUM,
      );
      expect(
        voiceSystemPipQuality(
          isScreenShare: true,
          pipSize: const Size(400, 225),
        ),
        VideoQuality.HIGH,
      );
    });
  });
}
