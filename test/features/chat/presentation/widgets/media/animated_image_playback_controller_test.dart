// Cascade invocations are intentional in these tests.
// ignore_for_file: cascade_invocations

import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/media/animated_image_playback_controller.dart';

extension _ControllerExpects on AnimatedImagePlaybackController {
  void expectPlaying(String key, Matcher matcher) {
    expect(isPlaying(key), matcher);
  }
}

void main() {
  group('AnimatedImagePlaybackController', () {
    test('activates visible images up to the configured cap', () {
      final AnimatedImagePlaybackController controller =
          AnimatedImagePlaybackController();

      for (int index = 0; index < 8; index += 1) {
        controller.register('gif-$index', 1, top: index.toDouble());
      }

      for (int index = 0; index < 6; index += 1) {
        controller.expectPlaying('gif-$index', isTrue);
      }
      controller
        ..expectPlaying('gif-6', isFalse)
        ..expectPlaying('gif-7', isFalse);
    });

    test('does not activate images with zero visibility', () {
      final AnimatedImagePlaybackController controller =
          AnimatedImagePlaybackController();

      controller
        ..register('a', 0.5)
        ..register('b', 0)
        ..expectPlaying('a', isTrue)
        ..expectPlaying('b', isFalse);
    });

    test('stops playback when an image unregisters', () {
      final AnimatedImagePlaybackController controller =
          AnimatedImagePlaybackController();

      controller
        ..register('a', 1)
        ..register('b', 1)
        ..expectPlaying('a', isTrue)
        ..unregister('a')
        ..expectPlaying('a', isFalse)
        ..expectPlaying('b', isTrue);
    });

    test('suppresses playback while scrolling', () {
      final AnimatedImagePlaybackController controller =
          AnimatedImagePlaybackController();

      controller
        ..register('a', 1)
        ..register('b', 1)
        ..expectPlaying('a', isTrue)
        ..setScrollActive(active: true)
        ..expectPlaying('a', isFalse)
        ..expectPlaying('b', isFalse)
        ..setScrollActive(active: false)
        ..expectPlaying('a', isTrue)
        ..expectPlaying('b', isTrue);
    });

    test('notifies listeners when active set changes', () {
      final AnimatedImagePlaybackController controller =
          AnimatedImagePlaybackController();
      int notificationCount = 0;
      controller.addListener(() => notificationCount++);

      controller
        ..register('a', 1)
        ..expectPlaying('a', isTrue);
      expect(notificationCount, 1);

      controller
        ..updateVisibility('a', 0)
        ..expectPlaying('a', isFalse);
      expect(notificationCount, 2);

      controller
        ..updateVisibility('a', 1)
        ..expectPlaying('a', isTrue);
      expect(notificationCount, 3);
    });

    test('does not notify when scroll-active is set to the same value', () {
      final AnimatedImagePlaybackController controller =
          AnimatedImagePlaybackController();
      int notificationCount = 0;
      controller.addListener(() => notificationCount++);

      controller
        ..register('a', 1)
        ..setScrollActive(active: true)
        ..setScrollActive(active: true);
      expect(notificationCount, 2);
    });

    test('does not recompute when register values are unchanged', () {
      final AnimatedImagePlaybackController controller =
          AnimatedImagePlaybackController();
      int notificationCount = 0;
      controller.addListener(() => notificationCount++);

      controller
        ..register('a', 1, top: 10, left: 2)
        ..register('a', 1, top: 10, left: 2);
      expect(notificationCount, 1);
    });

    test('does not notify listeners when state is unchanged', () {
      final AnimatedImagePlaybackController controller =
          AnimatedImagePlaybackController();
      int notificationCount = 0;
      controller.addListener(() => notificationCount++);

      controller
        ..register('a', 1)
        ..expectPlaying('a', isTrue);
      expect(notificationCount, 1);

      controller
        ..updateVisibility('a', 1)
        ..expectPlaying('a', isTrue);
      expect(notificationCount, 1);
    });
  });
}
