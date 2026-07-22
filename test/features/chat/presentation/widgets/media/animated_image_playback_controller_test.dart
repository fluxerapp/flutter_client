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
    test('activates visible images up to the cap', () {
      final AnimatedImagePlaybackController controller =
          AnimatedImagePlaybackController(maxActive: 3);

      controller
        ..register('a', 1)
        ..register('b', 1)
        ..register('c', 1)
        ..register('d', 1)
        ..expectPlaying('a', isTrue)
        ..expectPlaying('b', isTrue)
        ..expectPlaying('c', isTrue)
        ..expectPlaying('d', isFalse);
    });

    test('prefers the most visible images when capping', () {
      final AnimatedImagePlaybackController controller =
          AnimatedImagePlaybackController(maxActive: 2);

      controller
        ..register('a', 0.5)
        ..register('b', 1)
        ..register('c', 0.25)
        ..expectPlaying('a', isTrue)
        ..expectPlaying('b', isTrue)
        ..expectPlaying('c', isFalse);
    });

    test('pauses all images while scrolling', () {
      final AnimatedImagePlaybackController controller =
          AnimatedImagePlaybackController(maxActive: 3);

      controller
        ..register('a', 1)
        ..register('b', 1)
        ..expectPlaying('a', isTrue)
        ..expectPlaying('b', isTrue)
        ..setScrolling(value: true)
        ..expectPlaying('a', isFalse)
        ..expectPlaying('b', isFalse);
    });

    test('resumes active images after scrolling ends', () {
      final AnimatedImagePlaybackController controller =
          AnimatedImagePlaybackController(maxActive: 3);

      controller
        ..register('a', 1)
        ..register('b', 1)
        ..setScrolling(value: true)
        ..setScrolling(value: false)
        ..expectPlaying('a', isTrue)
        ..expectPlaying('b', isTrue);
    });

    test('activates the next visible image when an active one unregisters', () {
      final AnimatedImagePlaybackController controller =
          AnimatedImagePlaybackController(maxActive: 2);

      controller
        ..register('a', 1)
        ..register('b', 1)
        ..register('c', 1)
        ..expectPlaying('c', isFalse)
        ..unregister('a')
        ..expectPlaying('b', isTrue)
        ..expectPlaying('c', isTrue);
    });

    test('notifies listeners when active set changes', () {
      final AnimatedImagePlaybackController controller =
          AnimatedImagePlaybackController(maxActive: 1);
      int notificationCount = 0;
      controller.addListener(() => notificationCount++);

      controller
        ..register('a', 0.5)
        ..register('b', 1)
        ..expectPlaying('a', isFalse)
        ..expectPlaying('b', isTrue);
      expect(notificationCount, 2);

      controller
        ..unregister('b')
        ..expectPlaying('a', isTrue);
      expect(notificationCount, 3);
    });

    test('does not notify listeners when state is unchanged', () {
      final AnimatedImagePlaybackController controller =
          AnimatedImagePlaybackController(maxActive: 3);
      int notificationCount = 0;
      controller.addListener(() => notificationCount++);

      controller
        ..register('a', 1)
        ..expectPlaying('a', isTrue);
      expect(notificationCount, 1);

      controller
        ..setScrolling(value: false)
        ..updateVisibility('a', 1)
        ..expectPlaying('a', isTrue);
      expect(notificationCount, 1);
    });
  });
}
