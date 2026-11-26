import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/voice/utils/screen_share/screen_share_fullscreen.dart';

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

    test('user expanded opens fullscreen without a watched stream', () {
      expect(
        voiceScreenShareShouldExpand(
          isWatchingScreenShare: false,
          landscape: false,
          prefs: const VoiceScreenShareFullscreenPrefs(userExpanded: true),
        ),
        isTrue,
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
}
