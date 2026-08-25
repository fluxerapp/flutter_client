import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/media/animated_image_playback_controller.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/media/embed_animated_image.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/media/fluxer_animated_image.dart';
import 'package:fluxer_app/features/settings/providers/appearance_preferences_provider.dart';
import 'package:fluxer_app/features/settings/providers/user_settings_view_model.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_dart/export.dart' show StickerAnimationOptions;
import 'package:visibility_detector/visibility_detector.dart';

const _kTestUserSettings = UserSettingsViewState(
  userId: '1',
  username: 'tester',
  displayName: 'Tester',
  discriminator: '0000',
  avatar: null,
  avatarColor: null,
  memberSince: null,
  status: 'online',
  messageDisplayCompact: false,
  developerMode: false,
  trustedDomains: <String>[],
);

Widget _wrap(
  Widget child, {
  StickerAnimationOptions animateStickers =
      StickerAnimationOptions.alwaysAnimate,
}) {
  return ProviderScope(
    overrides: [
      appearancePreferencesProvider.overrideWithValue(
        const AppearancePreferencesState(),
      ),
      userSettingsViewModelProvider.overrideWithValue(
        _kTestUserSettings.copyWith(animateStickers: animateStickers),
      ),
    ],
    child: MaterialApp(
      home: MediaQuery(
        data: const MediaQueryData(size: Size(1200, 900)),
        child: Scaffold(body: child),
      ),
    ),
  );
}

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
        _wrap(
          const EmbedAnimatedImage(
            animatedUrl: 'https://x/a.webp',
            staticUrl: 'https://x/a.png',
            visibilityKey: 'v1',
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
        _wrap(
          const ClipRect(
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
      );
      await tester.pump();
      final FluxerAnimatedImage image = tester.widget<FluxerAnimatedImage>(
        find.byType(FluxerAnimatedImage),
      );
      expect(image.playing, isFalse);
    });

    testWidgets('plays all visible images in scope', (tester) async {
      final AnimatedImagePlaybackController controller =
          AnimatedImagePlaybackController();
      await tester.pumpWidget(
        _wrap(
          AnimatedImagePlaybackScope(
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
      );
      await tester.pump();
      final List<FluxerAnimatedImage> images = tester
          .widgetList<FluxerAnimatedImage>(find.byType(FluxerAnimatedImage))
          .toList();
      final int activeCount = images.where((img) => img.playing).length;
      expect(activeCount, 2);
    });

    testWidgets('sticker mode stays static when never animate', (tester) async {
      await tester.pumpWidget(
        _wrap(
          const EmbedAnimatedImage(
            animatedUrl: 'https://x/a.webp',
            staticUrl: 'https://x/a.png',
            visibilityKey: 'sticker-1',
            useStickerAnimationPreference: true,
          ),
          animateStickers: StickerAnimationOptions.neverAnimate,
        ),
      );
      await tester.pump();
      final FluxerAnimatedImage image = tester.widget<FluxerAnimatedImage>(
        find.byType(FluxerAnimatedImage),
      );
      expect(image.playing, isFalse);
    });

    testWidgets('sticker mode plays when always animate', (tester) async {
      await tester.pumpWidget(
        _wrap(
          const EmbedAnimatedImage(
            animatedUrl: 'https://x/a.webp',
            staticUrl: 'https://x/a.png',
            visibilityKey: 'sticker-2',
            useStickerAnimationPreference: true,
          ),
        ),
      );
      await tester.pump();
      final FluxerAnimatedImage image = tester.widget<FluxerAnimatedImage>(
        find.byType(FluxerAnimatedImage),
      );
      expect(image.playing, isTrue);
    });

    testWidgets('sticker mode ignores gif autoplay', (tester) async {
      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            appearancePreferencesProvider.overrideWithValue(
              const AppearancePreferencesState(),
            ),
            userSettingsViewModelProvider.overrideWithValue(
              _kTestUserSettings.copyWith(
                animateStickers: StickerAnimationOptions.alwaysAnimate,
                gifAutoPlay: false,
              ),
            ),
          ],
          child: const MaterialApp(
            home: MediaQuery(
              data: MediaQueryData(size: Size(1200, 900)),
              child: Scaffold(
                body: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 200,
                      child: EmbedAnimatedImage(
                        animatedUrl: 'https://x/a.webp',
                        staticUrl: 'https://x/a.png',
                        visibilityKey: 'gif-1',
                      ),
                    ),
                    SizedBox(
                      height: 200,
                      child: EmbedAnimatedImage(
                        animatedUrl: 'https://x/b.webp',
                        staticUrl: 'https://x/b.png',
                        visibilityKey: 'sticker-3',
                        useStickerAnimationPreference: true,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
      await tester.pump();
      final List<FluxerAnimatedImage> images = tester
          .widgetList<FluxerAnimatedImage>(find.byType(FluxerAnimatedImage))
          .toList();
      expect(images[0].playing, isFalse);
      expect(images[1].playing, isTrue);
    });
  });
}
