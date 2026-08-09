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
    test('activates all visible images', () {
      final AnimatedImagePlaybackController controller =
          AnimatedImagePlaybackController();

      controller
        ..register('a', 1)
        ..register('b', 1)
        ..register('c', 1)
        ..register('d', 1)
        ..expectPlaying('a', isTrue)
        ..expectPlaying('b', isTrue)
        ..expectPlaying('c', isTrue)
        ..expectPlaying('d', isTrue);
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
