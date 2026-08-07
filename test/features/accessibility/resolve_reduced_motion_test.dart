import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/accessibility/resolve_reduced_motion.dart';

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
}
