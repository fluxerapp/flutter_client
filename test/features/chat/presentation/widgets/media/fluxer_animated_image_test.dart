import 'package:cached_network_image_ce/cached_network_image.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/media/fluxer_animated_image.dart';
import 'package:fluxer_app/material_ui.dart';

CachedNetworkImage _animatedNetworkImage(WidgetTester tester) {
  return tester
      .widgetList<CachedNetworkImage>(find.byType(CachedNetworkImage))
      .firstWhere(
        (CachedNetworkImage image) =>
            image.memCacheWidth == null && image.memCacheHeight == null,
      );
}

Finder get _animatedTicker =>
    find.byKey(const ValueKey<String>('fluxer-animated-image-ticker'));

void main() {
  group('FluxerAnimatedImage', () {
    testWidgets('requests a display-sized animated proxy and skips mem cache', (
      tester,
    ) async {
      tester.view.devicePixelRatio = 2.0;
      addTearDown(tester.view.resetDevicePixelRatio);

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: SizedBox(
              width: 160,
              height: 160,
              child: FluxerAnimatedImage(
                animatedUrl: 'https://x/a.webp?format=webp&animated=true',
                staticUrl: 'https://x/a.webp?format=webp&animated=false',
                playing: true,
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
      );

      final CachedNetworkImage image = _animatedNetworkImage(tester);
      expect(image.imageUrl, contains('format=webp'));
      expect(image.imageUrl, contains('animated=true'));
      expect(image.imageUrl, contains('height=320'));
      expect(image.memCacheWidth, isNull);
      expect(image.memCacheHeight, isNull);
      expect(image.maxWidthDiskCache, isNull);
      expect(image.maxHeightDiskCache, isNull);
    });

    testWidgets('caps animated proxy pixels at 2x on 3x screens', (
      tester,
    ) async {
      tester.view.devicePixelRatio = 3.0;
      addTearDown(tester.view.resetDevicePixelRatio);

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: SizedBox(
              width: 160,
              height: 160,
              child: FluxerAnimatedImage(
                animatedUrl: 'https://x/a.webp?format=webp&animated=true',
                playing: true,
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
      );

      final CachedNetworkImage image = _animatedNetworkImage(tester);
      expect(image.imageUrl, contains('height=320'));
      expect(image.imageUrl, isNot(contains('height=480')));
    });

    testWidgets('keeps the animated url when playback pauses', (tester) async {
      tester.view.devicePixelRatio = 2.0;
      addTearDown(tester.view.resetDevicePixelRatio);

      Widget app({required bool playing}) {
        return MaterialApp(
          home: Scaffold(
            body: SizedBox(
              width: 160,
              height: 160,
              child: FluxerAnimatedImage(
                animatedUrl: 'https://x/a.webp?format=webp&animated=true',
                staticUrl: 'https://x/a.webp?format=webp&animated=false',
                loadAnimated: true,
                playing: playing,
                fit: BoxFit.contain,
              ),
            ),
          ),
        );
      }

      await tester.pumpWidget(app(playing: true));
      final String playingUrl = _animatedNetworkImage(tester).imageUrl;

      await tester.pumpWidget(app(playing: false));
      final CachedNetworkImage image = _animatedNetworkImage(tester);
      expect(image.imageUrl, playingUrl);
      final TickerMode ticker = tester.widget<TickerMode>(_animatedTicker);
      expect(ticker.enabled, isFalse);
    });

    testWidgets('wraps the animated image in an enabled TickerMode', (
      tester,
    ) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: SizedBox(
              width: 160,
              height: 160,
              child: FluxerAnimatedImage(
                animatedUrl: 'https://x/a.webp',
                playing: true,
              ),
            ),
          ),
        ),
      );

      final TickerMode ticker = tester.widget<TickerMode>(_animatedTicker);
      expect(ticker.enabled, isTrue);
    });

    testWidgets('caps decode cache for the static frame', (tester) async {
      tester.view.devicePixelRatio = 2.0;
      addTearDown(tester.view.resetDevicePixelRatio);

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: SizedBox(
              width: 160,
              height: 160,
              child: FluxerAnimatedImage(
                animatedUrl: 'https://x/a.webp',
                staticUrl: 'https://x/a.png',
                playing: false,
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
      );

      expect(
        find.byKey(const ValueKey<String>('fluxer-animated-image-ticker')),
        findsNothing,
      );
      final CachedNetworkImage image = tester.widget(
        find.byType(CachedNetworkImage),
      );
      expect(image.imageUrl, 'https://x/a.png');
      expect(image.memCacheWidth ?? image.memCacheHeight, 320);
    });

    testWidgets('uses the poster as a placeholder, not a stacked layer', (
      tester,
    ) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: SizedBox(
              width: 160,
              height: 160,
              child: FluxerAnimatedImage(
                animatedUrl: 'https://x/a.webp?format=webp&animated=true',
                staticUrl: 'https://x/a.webp?format=webp&animated=false',
                playing: true,
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
      );

      expect(
        find.descendant(
          of: find.byType(FluxerAnimatedImage),
          matching: find.byType(Stack),
        ),
        findsNothing,
      );
      final CachedNetworkImage animated = _animatedNetworkImage(tester);
      final Widget placeholder = animated.placeholder!(
        tester.element(find.byType(FluxerAnimatedImage)),
        animated.imageUrl,
      );
      expect(placeholder, isA<CachedNetworkImage>());
      expect(
        (placeholder as CachedNetworkImage).imageUrl,
        contains('animated=false'),
      );
      expect(animated.errorBuilder, isNotNull);
    });
  });
}
