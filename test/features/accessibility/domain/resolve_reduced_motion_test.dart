import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/accessibility/domain/resolve_reduced_motion.dart';

void main() {
  group('resolveReducedMotion', () {
    test('uses platform preference when syncing with system', () {
      expect(
        resolveReducedMotion(
          syncReducedMotionWithSystem: true,
          reducedMotionOverride: true,
          platformReducedMotion: false,
        ),
        isFalse,
      );
      expect(
        resolveReducedMotion(
          syncReducedMotionWithSystem: true,
          reducedMotionOverride: false,
          platformReducedMotion: true,
        ),
        isTrue,
      );
    });

    test('uses override when not syncing with system', () {
      expect(
        resolveReducedMotion(
          syncReducedMotionWithSystem: false,
          reducedMotionOverride: true,
          platformReducedMotion: false,
        ),
        isTrue,
      );
      expect(
        resolveReducedMotion(
          syncReducedMotionWithSystem: false,
          reducedMotionOverride: false,
          platformReducedMotion: true,
        ),
        isFalse,
      );
    });
  });

  group('resolvePlatformReducedMotion', () {
    test('uses disableAnimations off Android', () {
      expect(
        resolvePlatformReducedMotion(
          disableAnimations: true,
          androidAnimatorDurationDisabled: false,
          useAndroidAnimatorDuration: false,
        ),
        isTrue,
      );
    });

    test('uses animator duration scale on Android', () {
      expect(
        resolvePlatformReducedMotion(
          disableAnimations: true,
          androidAnimatorDurationDisabled: false,
          useAndroidAnimatorDuration: true,
        ),
        isFalse,
      );
      expect(
        resolvePlatformReducedMotion(
          disableAnimations: false,
          androidAnimatorDurationDisabled: true,
          useAndroidAnimatorDuration: true,
        ),
        isTrue,
      );
    });
  });
}
