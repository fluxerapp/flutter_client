import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/chat/utils/media_kit_player_lifecycle.dart';

void main() {
  group('MediaKitPlayerLifecycleCoordinator', () {
    test('pauseAll does not throw when no players are registered', () async {
      await MediaKitPlayerLifecycleCoordinator.instance.pauseAll();
    });
  });

  group('MediaKitForegroundResumeController', () {
    test('resumes only after background paused playback', () async {
      final MediaKitForegroundResumeController controller =
          MediaKitForegroundResumeController();
      var resumeCount = 0;

      controller.handleAppForegroundChanged(
        isForeground: false,
        isPlaying: true,
        canResume: true,
        onResume: () async {
          resumeCount++;
        },
      );
      controller.handleAppForegroundChanged(
        isForeground: true,
        isPlaying: false,
        canResume: true,
        onResume: () async {
          resumeCount++;
        },
      );

      await pumpEventQueue();
      expect(resumeCount, 1);
    });

    test('does not resume when playback was already paused', () async {
      final MediaKitForegroundResumeController controller =
          MediaKitForegroundResumeController();
      var resumeCount = 0;

      controller.handleAppForegroundChanged(
        isForeground: false,
        isPlaying: false,
        canResume: true,
        onResume: () async {
          resumeCount++;
        },
      );
      controller.handleAppForegroundChanged(
        isForeground: true,
        isPlaying: false,
        canResume: true,
        onResume: () async {
          resumeCount++;
        },
      );

      await pumpEventQueue();
      expect(resumeCount, 0);
    });
  });
}
