import 'dart:ui' show Rect;

import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/voice/utils/voice_screen_share_fullscreen.dart';

void main() {
  group('voiceScreenShareShouldExpand', () {
    const VoiceScreenShareFullscreenPrefs prefs =
        VoiceScreenShareFullscreenPrefs();

    test('false when not watching', () {
      expect(
        voiceScreenShareShouldExpand(
          isWatchingScreenShare: false,
          landscape: true,
          prefs: prefs,
        ),
        isFalse,
      );
    });

    test('landscape auto expand while watching', () {
      expect(
        voiceScreenShareShouldExpand(
          isWatchingScreenShare: true,
          landscape: true,
          prefs: prefs,
        ),
        isTrue,
      );
    });

    test('portrait stays windowed unless user expanded', () {
      expect(
        voiceScreenShareShouldExpand(
          isWatchingScreenShare: true,
          landscape: false,
          prefs: prefs,
        ),
        isFalse,
      );
      expect(
        voiceScreenShareShouldExpand(
          isWatchingScreenShare: true,
          landscape: false,
          prefs: const VoiceScreenShareFullscreenPrefs(userExpanded: true),
        ),
        isTrue,
      );
    });

    test('landscape auto expand blocked after user exits', () {
      expect(
        voiceScreenShareShouldExpand(
          isWatchingScreenShare: true,
          landscape: true,
          prefs: const VoiceScreenShareFullscreenPrefs(
            blockLandscapeAutoExpand: true,
          ),
        ),
        isFalse,
      );
    });
  });

  test('voiceScreenShareFullscreenRects expands one tile', () {
    final List<Rect> base = <Rect>[
      const Rect.fromLTWH(0, 0, 100, 60),
      const Rect.fromLTWH(120, 0, 80, 60),
    ];
    final List<Rect> expanded = voiceScreenShareFullscreenRects(
      baseRects: base,
      expandedTileIndex: 0,
      width: 400,
      height: 300,
      expanded: true,
    );
    expect(expanded[0], const Rect.fromLTWH(0, 0, 400, 300));
    expect(expanded[1].width, 0);
    expect(expanded[1].height, 0);
  });
}
