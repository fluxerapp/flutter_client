import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/accessibility/motion_preferences.dart';
import 'package:fluxer_dart/export.dart' show StickerAnimationOptions;

void main() {
  group('resolveMotionPreferencesModel', () {
    test('pauses emoji and gifs under reduced motion by default', () {
      final model = resolveMotionPreferencesModel(
        const MotionPreferencesInput(
          syncWithSystem: false,
          manualReducedMotion: true,
        ),
      );
      expect(model.reducedMotion, isTrue);
      expect(model.effectiveAnimateEmoji, isFalse);
      expect(model.effectiveGifAutoPlay, isFalse);
      expect(
        model.effectiveAnimateStickers,
        StickerAnimationOptions.animateOnInteraction,
      );
    });

    test('keeps animation when override dirty flags are set', () {
      final model = resolveMotionPreferencesModel(
        const MotionPreferencesInput(
          syncWithSystem: false,
          manualReducedMotion: true,
          keepAnimatedEmojiUnderReducedMotion: true,
          keepGifAutoPlayUnderReducedMotion: true,
          keepStickerAnimationUnderReducedMotion: true,
        ),
      );
      expect(model.effectiveAnimateEmoji, isTrue);
      expect(model.effectiveGifAutoPlay, isTrue);
      expect(
        model.effectiveAnimateStickers,
        StickerAnimationOptions.alwaysAnimate,
      );
      expect(model.emojiOverridesReducedMotion, isTrue);
      expect(model.gifOverridesReducedMotion, isTrue);
      expect(model.stickerOverridesReducedMotion, isTrue);
    });

    test('uses mobile gif default when not overridden', () {
      final model = resolveMotionPreferencesModel(
        const MotionPreferencesInput(isMobile: true),
      );
      expect(model.effectiveGifAutoPlay, isTrue);
    });
  });

  group('resolveAnimateEmojiRequest', () {
    test('writes base preference when reduced motion is off', () {
      final write = resolveAnimateEmojiRequest(
        input: const MotionPreferencesInput(),
        value: false,
      );
      expect(write.animateEmoji, isFalse);
      expect(write.keepAnimatedEmojiUnderReducedMotion, isNull);
    });

    test('sets keep flag when enabling under reduced motion', () {
      final write = resolveAnimateEmojiRequest(
        input: const MotionPreferencesInput(
          syncWithSystem: false,
          manualReducedMotion: true,
        ),
        value: true,
      );
      expect(write.animateEmoji, isTrue);
      expect(write.keepAnimatedEmojiUnderReducedMotion, isTrue);
    });
  });
}
