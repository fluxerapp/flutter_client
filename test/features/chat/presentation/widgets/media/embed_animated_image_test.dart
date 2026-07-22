import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/media/animated_image_playback_controller.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/media/embed_animated_image.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/media/fluxer_animated_image.dart';
import 'package:visibility_detector/visibility_detector.dart';

void main() {
  group('EmbedAnimatedImage', () {
    setUp(() {
      VisibilityDetectorController.instance.updateInterval = Duration.zero;
    });

    tearDown(() {
      VisibilityDetectorController.instance.updateInterval = const Duration(
        milliseconds: 500,
      );
    });

    testWidgets('plays when visible without a scope', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: EmbedAnimatedImage(
              animatedUrl: 'https://x/a.webp',
              staticUrl: 'https://x/a.png',
              visibilityKey: 'v1',
            ),
          ),
        ),
      );
      await tester.pump();
      final FluxerAnimatedImage image = tester.widget<FluxerAnimatedImage>(
        find.byType(FluxerAnimatedImage),
      );
      expect(image.playing, isTrue);
    });

    testWidgets('pauses when offscreen', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: ClipRect(
              child: Stack(
                children: <Widget>[
                  Positioned(
                    left: 0,
                    top: 5000,
                    child: EmbedAnimatedImage(
                      animatedUrl: 'https://x/a.webp',
                      staticUrl: 'https://x/a.png',
                      visibilityKey: 'v1',
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
      await tester.pump();
      final FluxerAnimatedImage image = tester.widget<FluxerAnimatedImage>(
        find.byType(FluxerAnimatedImage),
      );
      expect(image.playing, isFalse);
    });

    testWidgets('respects scope cap', (tester) async {
      final AnimatedImagePlaybackController controller =
          AnimatedImagePlaybackController(maxActive: 1);
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AnimatedImagePlaybackScope(
              controller: controller,
              child: const Column(
                children: <Widget>[
                  SizedBox(
                    height: 200,
                    child: EmbedAnimatedImage(
                      animatedUrl: 'https://x/a.webp',
                      staticUrl: 'https://x/a.png',
                      visibilityKey: 'v1',
                    ),
                  ),
                  SizedBox(
                    height: 200,
                    child: EmbedAnimatedImage(
                      animatedUrl: 'https://x/b.webp',
                      staticUrl: 'https://x/b.png',
                      visibilityKey: 'v2',
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
      await tester.pump();
      final List<FluxerAnimatedImage> images = tester
          .widgetList<FluxerAnimatedImage>(find.byType(FluxerAnimatedImage))
          .toList();
      final int activeCount = images.where((img) => img.playing).length;
      expect(activeCount, 1);
    });

    testWidgets('pauses inside a scope while scrolling', (tester) async {
      final AnimatedImagePlaybackController controller =
          AnimatedImagePlaybackController(maxActive: 3);
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AnimatedImagePlaybackScope(
              controller: controller,
              child: const EmbedAnimatedImage(
                animatedUrl: 'https://x/a.webp',
                staticUrl: 'https://x/a.png',
                visibilityKey: 'v1',
              ),
            ),
          ),
        ),
      );
      await tester.pump();
      controller.setScrolling(value: true);
      await tester.pump();
      final FluxerAnimatedImage image = tester.widget<FluxerAnimatedImage>(
        find.byType(FluxerAnimatedImage),
      );
      expect(image.playing, isFalse);
    });
  });
}
