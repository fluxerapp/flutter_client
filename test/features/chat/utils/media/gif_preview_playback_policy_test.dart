import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/chat/utils/media/gif_preview_playback_policy.dart';
import 'package:fluxer_app/features/chat/utils/media/gif_preview_player_config.dart';

void main() {
  group('GIF preview player config', () {
    test('uses a small muted player cache for lightweight previews', () {
      expect(gifPreviewPlayerConfiguration.muted, isTrue);
      expect(gifPreviewPlayerConfiguration.bufferSize, 4 * 1024 * 1024);
    });

    test(
      'keeps Android preview rendering on explicit hardware-safe defaults',
      () {
        final configuration = gifPreviewVideoControllerConfigurationFor(
          TargetPlatform.android,
        );

        expect(configuration.vo, 'gpu');
        expect(configuration.hwdec, 'auto-safe');
        expect(configuration.enableHardwareAcceleration, isTrue);
      },
    );

    test('does not force Android mpv output options on desktop', () {
      final configuration = gifPreviewVideoControllerConfigurationFor(
        TargetPlatform.linux,
      );

      expect(configuration.vo, isNull);
      expect(configuration.hwdec, isNull);
      expect(configuration.enableHardwareAcceleration, isTrue);
    });
  });

  group('GifPreviewPlaybackPolicy', () {
    const policy = GifPreviewPlaybackPolicy(maxActiveVideos: 2);
    const candidates = <GifPreviewPlaybackCandidate>[
      GifPreviewPlaybackCandidate(index: 0, top: -120, bottom: -20, left: 0),
      GifPreviewPlaybackCandidate(index: 1, top: 0, bottom: 100, left: 120),
      GifPreviewPlaybackCandidate(index: 2, top: 0, bottom: 100, left: 0),
      GifPreviewPlaybackCandidate(index: 3, top: 140, bottom: 240, left: 0),
      GifPreviewPlaybackCandidate(index: 4, top: 260, bottom: 360, left: 0),
    ];

    test('suppresses playback while scrolling', () {
      expect(
        policy.allowedVideoIndexes(
          candidates: candidates,
          viewportTop: 0,
          viewportBottom: 250,
          isScrollActive: true,
        ),
        isEmpty,
      );
    });

    test('limits idle playback to the first visible previews', () {
      expect(
        policy.allowedVideoIndexes(
          candidates: candidates,
          viewportTop: 0,
          viewportBottom: 250,
          isScrollActive: false,
        ),
        <int>{2, 1},
      );
    });

    test('ignores previews outside the viewport', () {
      expect(
        policy.allowedVideoIndexes(
          candidates: candidates,
          viewportTop: 250,
          viewportBottom: 420,
          isScrollActive: false,
        ),
        <int>{4},
      );
    });

    test('auto-caps animated image playback to visible previews', () {
      final webpCandidates = List<GifPreviewPlaybackCandidate>.generate(
        12,
        (index) => GifPreviewPlaybackCandidate(
          index: index,
          top: index * 10,
          bottom: index * 10 + 8,
          left: 0,
        ),
      );
      final expectedIndexes = {for (var i = 0; i < 12; i++) i};

      expect(
        gifAnimatedImagePreviewPlaybackPolicy.allowedVideoIndexes(
          candidates: webpCandidates,
          viewportTop: 0,
          viewportBottom: 200,
          isScrollActive: false,
        ),
        expectedIndexes,
      );
      expect(
        gifAnimatedImagePreviewPlaybackPolicy.allowedVideoIndexes(
          candidates: webpCandidates,
          viewportTop: 0,
          viewportBottom: 200,
          isScrollActive: true,
        ),
        expectedIndexes,
      );
    });
  });
}
