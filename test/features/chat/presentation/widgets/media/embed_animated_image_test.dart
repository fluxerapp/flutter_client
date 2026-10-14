// Root ProviderScope built by a helper; the lint only exempts a
// ProviderScope written inline in pumpWidget.
// ignore_for_file: riverpod_lint/scoped_providers_should_specify_dependencies

import 'package:cached_network_image_ce/cached_network_image.dart';
import 'package:flutter/gestures.dart';
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

    testWidgets('unmounts the animated decoder when offscreen', (tester) async {
      await tester.pumpWidget(
        _wrap(
          const ClipRect(
            child: Stack(
              children: <Widget>[
                Positioned(
                  left: 0,
                  top: 5000,
                  child: SizedBox(
                    width: 200,
                    height: 200,
                    child: EmbedAnimatedImage(
                      animatedUrl: 'https://x/a.webp',
                      staticUrl: 'https://x/a.png',
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
      await tester.pump();
      final List<CachedNetworkImage> images = tester
          .widgetList<CachedNetworkImage>(find.byType(CachedNetworkImage))
          .toList();
      expect(images, hasLength(1));
      expect(images.single.imageUrl, 'https://x/a.png');
      expect(
        find.byKey(const ValueKey<String>('fluxer-animated-image-ticker')),
        findsNothing,
      );
    });

    testWidgets('keeps an over-budget animated image mounted while paused', (
      tester,
    ) async {
      final AnimatedImagePlaybackController controller =
          AnimatedImagePlaybackController(maxActiveVideos: 1);
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
                  ),
                ),
                SizedBox(
                  height: 200,
                  child: EmbedAnimatedImage(
                    animatedUrl: 'https://x/b.webp',
                    staticUrl: 'https://x/b.png',
                  ),
                ),
              ],
            ),
          ),
        ),
      );
      await tester.pump();

      final FluxerAnimatedImage paused = tester
          .widgetList<FluxerAnimatedImage>(find.byType(FluxerAnimatedImage))
          .singleWhere((FluxerAnimatedImage image) => !image.playing);
      expect(paused.loadAnimated, isTrue);
      final Iterable<TickerMode> tickers = tester.widgetList<TickerMode>(
        find.byKey(const ValueKey<String>('fluxer-animated-image-ticker')),
      );
      expect(
        tickers.map((TickerMode ticker) => ticker.enabled),
        unorderedEquals(<bool>[true, false]),
      );
    });

    testWidgets('keeps playing after its message row remounts', (tester) async {
      final AnimatedImagePlaybackController controller =
          AnimatedImagePlaybackController(maxActiveVideos: 3);
      Widget row({required bool spaced}) {
        const Widget image = SizedBox(
          height: 200,
          child: EmbedAnimatedImage(
            animatedUrl: 'https://x/a.webp',
            staticUrl: 'https://x/a.png',
          ),
        );
        return _wrap(
          AnimatedImagePlaybackScope(
            controller: controller,
            child: spaced
                ? const Column(children: <Widget>[SizedBox(height: 8), image])
                : image,
          ),
        );
      }

      await tester.pumpWidget(row(spaced: false));
      await tester.pump();
      expect(
        tester
            .widget<FluxerAnimatedImage>(find.byType(FluxerAnimatedImage))
            .playing,
        isTrue,
      );

      await tester.pumpWidget(row(spaced: true));
      await tester.pump();
      await tester.pump();

      expect(
        tester
            .widget<FluxerAnimatedImage>(find.byType(FluxerAnimatedImage))
            .playing,
        isTrue,
      );
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
                  ),
                ),
                SizedBox(
                  height: 200,
                  child: EmbedAnimatedImage(
                    animatedUrl: 'https://x/b.webp',
                    staticUrl: 'https://x/b.png',
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

    testWidgets('plays every visible image when more than six are on screen', (
      tester,
    ) async {
      final AnimatedImagePlaybackController controller =
          AnimatedImagePlaybackController();
      await tester.pumpWidget(
        _wrap(
          AnimatedImagePlaybackScope(
            controller: controller,
            child: Column(
              children: <Widget>[
                for (int index = 0; index < 7; index += 1)
                  SizedBox(
                    height: 80,
                    child: EmbedAnimatedImage(
                      animatedUrl: 'https://x/$index.webp',
                      staticUrl: 'https://x/$index.png',
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
      expect(images, hasLength(7));
      expect(
        images.every((FluxerAnimatedImage image) => image.playing),
        isTrue,
      );
    });

    testWidgets('scrolling re-ranks images that stay partly visible', (
      tester,
    ) async {
      final AnimatedImagePlaybackController controller =
          AnimatedImagePlaybackController(maxActiveVideos: 1);
      final ScrollController scrollController = ScrollController();
      addTearDown(scrollController.dispose);
      await tester.pumpWidget(
        _wrap(
          AnimatedImagePlaybackScope(
            controller: controller,
            child: SizedBox(
              height: 300,
              child: SingleChildScrollView(
                controller: scrollController,
                child: const Column(
                  children: <Widget>[
                    SizedBox(
                      height: 200,
                      child: EmbedAnimatedImage(
                        animatedUrl: 'https://x/a.webp',
                        staticUrl: 'https://x/a.png',
                      ),
                    ),
                    SizedBox(
                      height: 200,
                      child: EmbedAnimatedImage(
                        animatedUrl: 'https://x/b.webp',
                        staticUrl: 'https://x/b.png',
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
      List<bool> playing() => tester
          .widgetList<FluxerAnimatedImage>(find.byType(FluxerAnimatedImage))
          .map((FluxerAnimatedImage image) => image.playing)
          .toList();

      await tester.pump();
      expect(playing(), <bool>[true, false]);

      scrollController.jumpTo(100);
      await tester.pump();
      await tester.pump();

      expect(playing(), <bool>[false, true]);
    });

    testWidgets('sticker mode stays static when never animate', (tester) async {
      await tester.pumpWidget(
        _wrap(
          const EmbedAnimatedImage(
            animatedUrl: 'https://x/a.webp',
            staticUrl: 'https://x/a.png',
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
      expect(image.loadAnimated, isFalse);
      expect(
        find.byKey(const ValueKey<String>('fluxer-animated-image-ticker')),
        findsNothing,
      );
      expect(
        tester
            .widget<CachedNetworkImage>(find.byType(CachedNetworkImage))
            .imageUrl,
        'https://x/a.png',
      );
    });

    testWidgets('sticker mode holds the animated frame until interaction', (
      tester,
    ) async {
      await tester.pumpWidget(
        _wrap(
          const SizedBox(
            height: 200,
            child: EmbedAnimatedImage(
              animatedUrl: 'https://x/a.webp',
              staticUrl: 'https://x/a.png',
              useStickerAnimationPreference: true,
            ),
          ),
          animateStickers: StickerAnimationOptions.animateOnInteraction,
        ),
      );
      await tester.pump();
      final FluxerAnimatedImage image = tester.widget<FluxerAnimatedImage>(
        find.byType(FluxerAnimatedImage),
      );
      expect(image.playing, isFalse);
      expect(image.loadAnimated, isTrue);
      final TickerMode ticker = tester.widget<TickerMode>(
        find.byKey(const ValueKey<String>('fluxer-animated-image-ticker')),
      );
      expect(ticker.enabled, isFalse);
    });

    testWidgets('sticker mode plays while the pointer is over it', (
      tester,
    ) async {
      await tester.pumpWidget(
        _wrap(
          const SizedBox(
            width: 200,
            height: 200,
            child: EmbedAnimatedImage(
              animatedUrl: 'https://x/a.webp',
              staticUrl: 'https://x/a.png',
              useStickerAnimationPreference: true,
            ),
          ),
          animateStickers: StickerAnimationOptions.animateOnInteraction,
        ),
      );
      await tester.pump();

      final TestGesture gesture = await tester.createGesture(
        kind: PointerDeviceKind.mouse,
      );
      await gesture.addPointer(
        location: tester.getCenter(find.byType(EmbedAnimatedImage)),
      );
      await tester.pump();
      FluxerAnimatedImage image = tester.widget<FluxerAnimatedImage>(
        find.byType(FluxerAnimatedImage),
      );
      expect(image.playing, isTrue);
      expect(image.loadAnimated, isTrue);

      await gesture.moveTo(const Offset(400, 400));
      await tester.pump();
      image = tester.widget<FluxerAnimatedImage>(
        find.byType(FluxerAnimatedImage),
      );
      expect(image.playing, isFalse);
      expect(image.loadAnimated, isTrue);
      await gesture.removePointer();
    });

    testWidgets('sticker mode plays when always animate', (tester) async {
      await tester.pumpWidget(
        _wrap(
          const EmbedAnimatedImage(
            animatedUrl: 'https://x/a.webp',
            staticUrl: 'https://x/a.png',
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
                      ),
                    ),
                    SizedBox(
                      height: 200,
                      child: EmbedAnimatedImage(
                        animatedUrl: 'https://x/b.webp',
                        staticUrl: 'https://x/b.png',
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
      expect(images[0].loadAnimated, isFalse);
      expect(images[1].playing, isTrue);
      expect(images[1].loadAnimated, isTrue);
    });

    testWidgets('paused stickers leave the playback budget to gifs', (
      tester,
    ) async {
      final AnimatedImagePlaybackController controller =
          AnimatedImagePlaybackController(
            maxActiveVideos: kMaxActiveChatAnimatedImages,
          );
      await tester.pumpWidget(
        _wrap(
          AnimatedImagePlaybackScope(
            controller: controller,
            child: Column(
              children: <Widget>[
                const SizedBox(
                  height: 100,
                  child: EmbedAnimatedImage(
                    animatedUrl: 'https://x/gif.webp',
                    staticUrl: 'https://x/gif.png',
                  ),
                ),
                for (
                  int index = 0;
                  index < kMaxActiveChatAnimatedImages;
                  index += 1
                )
                  SizedBox(
                    width: 100,
                    height: 100,
                    child: EmbedAnimatedImage(
                      animatedUrl: 'https://x/sticker-$index.webp',
                      staticUrl: 'https://x/sticker-$index.png',
                      useStickerAnimationPreference: true,
                    ),
                  ),
              ],
            ),
          ),
          animateStickers: StickerAnimationOptions.animateOnInteraction,
        ),
      );
      await tester.pump();

      FluxerAnimatedImage image(String url) => tester
          .widgetList<FluxerAnimatedImage>(find.byType(FluxerAnimatedImage))
          .singleWhere((FluxerAnimatedImage image) => image.animatedUrl == url);

      expect(image('https://x/gif.webp').playing, isTrue);

      final TestGesture gesture = await tester.startGesture(
        tester.getCenter(
          find.byWidgetPredicate(
            (Widget widget) =>
                widget is EmbedAnimatedImage &&
                widget.animatedUrl == 'https://x/sticker-1.webp',
          ),
        ),
      );
      await tester.pump();
      expect(image('https://x/sticker-1.webp').playing, isTrue);
      expect(image('https://x/gif.webp').playing, isTrue);

      await gesture.up();
      await tester.pump();
      expect(image('https://x/sticker-1.webp').playing, isFalse);
      expect(image('https://x/gif.webp').playing, isTrue);
    });

    testWidgets('a pressed sticker plays when gifs fill the budget', (
      tester,
    ) async {
      final AnimatedImagePlaybackController controller =
          AnimatedImagePlaybackController(
            maxActiveVideos: kMaxActiveChatAnimatedImages,
          );
      await tester.pumpWidget(
        _wrap(
          AnimatedImagePlaybackScope(
            controller: controller,
            child: Column(
              children: <Widget>[
                const SizedBox(
                  width: 100,
                  height: 100,
                  child: EmbedAnimatedImage(
                    animatedUrl: 'https://x/sticker.webp',
                    staticUrl: 'https://x/sticker.png',
                    useStickerAnimationPreference: true,
                  ),
                ),
                for (
                  int index = 0;
                  index < kMaxActiveChatAnimatedImages;
                  index += 1
                )
                  SizedBox(
                    height: 100,
                    child: EmbedAnimatedImage(
                      animatedUrl: 'https://x/gif-$index.webp',
                      staticUrl: 'https://x/gif-$index.png',
                    ),
                  ),
              ],
            ),
          ),
          animateStickers: StickerAnimationOptions.animateOnInteraction,
        ),
      );
      await tester.pump();

      FluxerAnimatedImage image(String url) => tester
          .widgetList<FluxerAnimatedImage>(find.byType(FluxerAnimatedImage))
          .singleWhere((FluxerAnimatedImage image) => image.animatedUrl == url);

      final TestGesture gesture = await tester.startGesture(
        tester.getCenter(
          find.byWidgetPredicate(
            (Widget widget) =>
                widget is EmbedAnimatedImage &&
                widget.animatedUrl == 'https://x/sticker.webp',
          ),
        ),
      );
      await tester.pump();
      expect(image('https://x/sticker.webp').playing, isTrue);
      await gesture.up();
      await tester.pump();
      expect(<bool>[
        for (int index = 0; index < kMaxActiveChatAnimatedImages; index += 1)
          image('https://x/gif-$index.webp').playing,
      ], everyElement(isTrue));
    });

    testWidgets('stays playing across a transient hide blip', (tester) async {
      await tester.pumpWidget(
        _wrap(
          const SizedBox(
            width: 200,
            height: 200,
            child: EmbedAnimatedImage(
              animatedUrl: 'https://x/a.webp',
              staticUrl: 'https://x/a.png',
            ),
          ),
        ),
      );
      await tester.pump();

      final VisibilityDetector detector = tester.widget<VisibilityDetector>(
        find.byType(VisibilityDetector),
      );
      final Key detectorKey = detector.key!;
      detector.onVisibilityChanged!(VisibilityInfo(key: detectorKey));
      detector.onVisibilityChanged!(
        VisibilityInfo(
          key: detectorKey,
          size: const Size(200, 200),
          visibleBounds: const Rect.fromLTWH(0, 0, 200, 200),
        ),
      );
      await tester.pump();

      final FluxerAnimatedImage image = tester.widget<FluxerAnimatedImage>(
        find.byType(FluxerAnimatedImage),
      );
      expect(image.playing, isTrue);
      expect(
        find.byKey(const ValueKey<String>('fluxer-animated-image-ticker')),
        findsOneWidget,
      );
      final List<CachedNetworkImage> images = tester
          .widgetList<CachedNetworkImage>(find.byType(CachedNetworkImage))
          .toList();
      expect(
        images.any(
          (CachedNetworkImage networkImage) =>
              networkImage.imageUrl.contains('a.webp'),
        ),
        isTrue,
      );
    });

    testWidgets('on-screen gifs keep unique visibility detector keys', (
      tester,
    ) async {
      await tester.pumpWidget(
        _wrap(
          const Column(
            children: <Widget>[
              SizedBox(
                height: 200,
                child: EmbedAnimatedImage(
                  animatedUrl: 'https://x/a.webp',
                  staticUrl: 'https://x/a.png',
                ),
              ),
              SizedBox(
                height: 200,
                child: EmbedAnimatedImage(
                  animatedUrl: 'https://x/b.webp',
                  staticUrl: 'https://x/b.png',
                ),
              ),
            ],
          ),
        ),
      );
      await tester.pump();

      final List<VisibilityDetector> detectors = tester
          .widgetList<VisibilityDetector>(find.byType(VisibilityDetector))
          .toList();
      expect(detectors, hasLength(2));
      expect(detectors[0].key, isNot(detectors[1].key));
    });
  });
}
