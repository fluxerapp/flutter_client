import 'package:cached_network_image_ce/cached_network_image.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/utils/emoji_image_cache.dart';
import 'package:visibility_detector/visibility_detector.dart';

void main() {
  setUp(() {
    VisibilityDetectorController.instance.updateInterval = Duration.zero;
  });

  tearDown(() {
    VisibilityDetectorController.instance.updateInterval = const Duration(
      milliseconds: 500,
    );
  });

  Widget wrapEmoji({required CachedEmojiImage emoji, required bool onScreen}) {
    return ProviderScope(
      child: MaterialApp(
        home: Scaffold(
          body: ClipRect(
            child: Stack(
              clipBehavior: Clip.none,
              children: <Widget>[
                Positioned(left: 0, top: onScreen ? 0 : 5000, child: emoji),
              ],
            ),
          ),
        ),
      ),
    );
  }

  String imageUrl(WidgetTester tester) {
    return tester
        .widget<CachedNetworkImage>(find.byType(CachedNetworkImage))
        .imageUrl;
  }

  testWidgets('static emoji requests non-animated URL', (tester) async {
    await tester.pumpWidget(
      wrapEmoji(
        onScreen: true,
        emoji: const CachedEmojiImage(
          emojiId: '123',
          animated: false,
          requestSize: 48,
          size: 32,
        ),
      ),
    );
    await tester.pump();

    expect(imageUrl(tester), isNot(contains('animated=true')));
  });

  testWidgets(
    'animated emoji with pauseWhenOffscreen false requests animated URL',
    (tester) async {
      await tester.pumpWidget(
        wrapEmoji(
          onScreen: true,
          emoji: const CachedEmojiImage(
            emojiId: '456',
            animated: true,
            pauseWhenOffscreen: false,
            requestSize: 48,
            size: 32,
          ),
        ),
      );
      await tester.pump();

      expect(imageUrl(tester), contains('animated=true'));
      final CachedNetworkImage image = tester.widget(
        find.byType(CachedNetworkImage),
      );
      expect(image.memCacheWidth, isNull);
      expect(image.memCacheHeight, isNull);
    },
  );

  testWidgets('animated emoji load error renders the static rendition (#776)', (
    tester,
  ) async {
    await tester.pumpWidget(
      wrapEmoji(
        onScreen: true,
        emoji: CachedEmojiImage(
          emojiId: '456',
          animated: true,
          pauseWhenOffscreen: false,
          requestSize: 48,
          size: 32,
          errorBuilder: (_) => const SizedBox.shrink(),
        ),
      ),
    );
    await tester.pump();

    final CachedNetworkImage animated = tester.widget(
      find.byType(CachedNetworkImage),
    );
    final Widget fallback = animated.errorBuilder!(
      tester.element(find.byType(CachedNetworkImage)),
      Exception('decode failed'),
      StackTrace.empty,
    );
    expect(fallback, isA<CachedNetworkImage>());
    expect(
      (fallback as CachedNetworkImage).imageUrl,
      isNot(contains('animated=true')),
    );
    expect(fallback.imageUrl, contains('quality=lossless'));
  });

  testWidgets('animated emoji pauses when off-screen', (tester) async {
    await tester.pumpWidget(
      wrapEmoji(
        onScreen: false,
        emoji: const CachedEmojiImage(
          emojiId: '789',
          animated: true,
          requestSize: 48,
          size: 32,
        ),
      ),
    );
    await tester.pump();
    await tester.pump();

    expect(imageUrl(tester), isNot(contains('animated=true')));
  });

  testWidgets('picker visibility keeps static base image visible', (
    tester,
  ) async {
    await tester.pumpWidget(
      wrapEmoji(
        onScreen: true,
        emoji: const CachedEmojiImage(
          emojiId: 'picker-1',
          animated: true,
          isInView: false,
          requestSize: 48,
          size: 32,
        ),
      ),
    );
    await tester.pump();

    expect(find.byType(VisibilityDetector), findsNothing);
    expect(find.byType(CachedNetworkImage), findsOneWidget);
    expect(imageUrl(tester), isNot(contains('animated=true')));
  });

  testWidgets('picker visibility shows animated image when in view', (
    tester,
  ) async {
    await tester.pumpWidget(
      wrapEmoji(
        onScreen: true,
        emoji: const CachedEmojiImage(
          emojiId: 'picker-2',
          animated: true,
          isInView: true,
          requestSize: 48,
          size: 32,
        ),
      ),
    );
    await tester.pump();

    expect(find.byType(CachedNetworkImage), findsOneWidget);
    expect(imageUrl(tester), contains('animated=true'));
  });

  testWidgets(
    'duplicate on-screen animated emoji keep unique visibility keys',
    (tester) async {
      await tester.pumpWidget(
        const ProviderScope(
          child: MaterialApp(
            home: Scaffold(
              body: Column(
                children: <Widget>[
                  CachedEmojiImage(
                    emojiId: 'same',
                    animated: true,
                    requestSize: 48,
                    size: 32,
                  ),
                  CachedEmojiImage(
                    emojiId: 'same',
                    animated: true,
                    requestSize: 48,
                    size: 32,
                  ),
                ],
              ),
            ),
          ),
        ),
      );
      await tester.pump();
      VisibilityDetectorController.instance.notifyNow();
      await tester.pump();

      final List<VisibilityDetector> detectors = tester
          .widgetList<VisibilityDetector>(find.byType(VisibilityDetector))
          .toList();
      expect(detectors, hasLength(2));
      expect(detectors[0].key, isNot(detectors[1].key));

      final List<CachedNetworkImage> images = tester
          .widgetList<CachedNetworkImage>(find.byType(CachedNetworkImage))
          .toList();
      expect(images, hasLength(2));
      expect(
        images.every(
          (CachedNetworkImage image) =>
              image.imageUrl.contains('animated=true'),
        ),
        isTrue,
      );
    },
  );

  testWidgets('animated emoji plays when scrolled on-screen', (tester) async {
    await tester.pumpWidget(
      wrapEmoji(
        onScreen: false,
        emoji: const CachedEmojiImage(
          emojiId: '789',
          animated: true,
          requestSize: 48,
          size: 32,
        ),
      ),
    );
    await tester.pump();
    await tester.pump();

    await tester.pumpWidget(
      wrapEmoji(
        onScreen: true,
        emoji: const CachedEmojiImage(
          emojiId: '789',
          animated: true,
          requestSize: 48,
          size: 32,
        ),
      ),
    );
    await tester.pump();
    await tester.pump();

    expect(imageUrl(tester), contains('animated=true'));
  });
}
