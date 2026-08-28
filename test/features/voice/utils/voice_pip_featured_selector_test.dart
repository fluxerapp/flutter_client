import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/ui/voice/voice_participant_media_tile.dart';
import 'package:fluxer_app/features/voice/utils/voice_pip_featured_selector.dart';

VoicePipCandidate _cam({
  required String id,
  required String speakingKey,
  bool hasVideo = true,
  bool isLocal = false,
  bool isMuted = false,
}) {
  return VoicePipCandidate(
    tileId: '$id|camera',
    speakingKey: speakingKey,
    source: VoiceParticipantTileSource.camera,
    hasVideo: hasVideo,
    isLocal: isLocal,
    isMuted: isMuted,
  );
}

VoicePipCandidate _screen({required String id, required String speakingKey}) {
  return VoicePipCandidate(
    tileId: '$id|screen',
    speakingKey: speakingKey,
    source: VoiceParticipantTileSource.screenShare,
    hasVideo: true,
    isLocal: false,
    isMuted: false,
  );
}

void main() {
  final DateTime t0 = DateTime.utc(2026);

  group('selectVoicePipFeatured', () {
    test('watched screen share wins over speaking camera', () {
      final VoicePipFeaturedResult result = selectVoicePipFeatured(
        previous: const VoicePipFeaturedResult(),
        now: t0,
        tiles: <VoicePipCandidate>[
          _cam(id: 'a', speakingKey: 'a'),
          _screen(id: 'b', speakingKey: 'b'),
        ],
        watchedTileId: 'b|screen',
        pinnedTileId: 'a|camera',
        speakingKeys: const <String>{'a'},
        recentlySpokeKeys: const <String>{},
      );
      expect(result.tileId, 'b|screen');
      expect(result.pendingSwitchAt, isNull);
    });

    test('pin wins when not watching a stream', () {
      final VoicePipFeaturedResult result = selectVoicePipFeatured(
        previous: const VoicePipFeaturedResult(),
        now: t0,
        tiles: <VoicePipCandidate>[
          _cam(id: 'a', speakingKey: 'a'),
          _cam(id: 'b', speakingKey: 'b'),
        ],
        watchedTileId: null,
        pinnedTileId: 'b|camera',
        speakingKeys: const <String>{'a'},
        recentlySpokeKeys: const <String>{},
      );
      expect(result.tileId, 'b|camera');
    });

    test('falls back to an avatar tile when nobody has video', () {
      final VoicePipFeaturedResult result = selectVoicePipFeatured(
        previous: const VoicePipFeaturedResult(),
        now: t0,
        tiles: <VoicePipCandidate>[
          _cam(id: 'a', speakingKey: 'a', hasVideo: false),
        ],
        watchedTileId: null,
        pinnedTileId: null,
        speakingKeys: const <String>{'a'},
        recentlySpokeKeys: const <String>{},
      );
      expect(result.tileId, 'a|camera');
    });

    test('prefers speaking remote camera over local', () {
      final VoicePipFeaturedResult result = selectVoicePipFeatured(
        previous: const VoicePipFeaturedResult(),
        now: t0,
        tiles: <VoicePipCandidate>[
          _cam(id: 'me', speakingKey: 'me', isLocal: true),
          _cam(id: 'a', speakingKey: 'a'),
        ],
        watchedTileId: null,
        pinnedTileId: null,
        speakingKeys: const <String>{'a'},
        recentlySpokeKeys: const <String>{},
      );
      expect(result.tileId, 'a|camera');
    });

    test('holds current speaker until hysteresis elapses', () {
      const VoicePipCandidate first = VoicePipCandidate(
        tileId: 'a|camera',
        speakingKey: 'a',
        source: VoiceParticipantTileSource.camera,
        hasVideo: true,
        isLocal: false,
        isMuted: false,
      );
      final VoicePipFeaturedResult afterFirst = selectVoicePipFeatured(
        previous: const VoicePipFeaturedResult(),
        now: t0,
        tiles: <VoicePipCandidate>[
          first,
          _cam(id: 'b', speakingKey: 'b'),
        ],
        watchedTileId: null,
        pinnedTileId: null,
        speakingKeys: const <String>{'a'},
        recentlySpokeKeys: const <String>{},
      );
      expect(afterFirst.tileId, 'a|camera');

      final VoicePipFeaturedResult held = selectVoicePipFeatured(
        previous: afterFirst,
        now: t0.add(const Duration(milliseconds: 200)),
        tiles: <VoicePipCandidate>[
          first,
          _cam(id: 'b', speakingKey: 'b'),
        ],
        watchedTileId: null,
        pinnedTileId: null,
        speakingKeys: const <String>{'a', 'b'},
        recentlySpokeKeys: const <String>{'a'},
      );
      expect(held.tileId, 'a|camera');
      expect(held.pendingSwitchAt, isNotNull);

      final VoicePipFeaturedResult switched = selectVoicePipFeatured(
        previous: held,
        now: t0.add(
          const Duration(milliseconds: 200) + kVoicePipSpeakerHysteresis,
        ),
        tiles: <VoicePipCandidate>[
          first,
          _cam(id: 'b', speakingKey: 'b'),
        ],
        watchedTileId: null,
        pinnedTileId: null,
        speakingKeys: const <String>{'b'},
        recentlySpokeKeys: const <String>{'a', 'b'},
      );
      expect(switched.tileId, 'b|camera');
    });

    test('switches immediately when current speaker hold expires', () {
      final VoicePipFeaturedResult previous = VoicePipFeaturedResult(
        tileId: 'a|camera',
        speakingSince: <String, DateTime>{'a|camera': t0},
      );
      final VoicePipFeaturedResult result = selectVoicePipFeatured(
        previous: previous,
        now: t0.add(const Duration(seconds: 1)),
        tiles: <VoicePipCandidate>[
          _cam(id: 'a', speakingKey: 'a'),
          _cam(id: 'b', speakingKey: 'b'),
        ],
        watchedTileId: null,
        pinnedTileId: null,
        speakingKeys: const <String>{'b'},
        recentlySpokeKeys: const <String>{},
      );
      expect(result.tileId, 'b|camera');
    });
  });
}
