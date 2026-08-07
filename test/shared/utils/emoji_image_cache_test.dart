import 'package:cached_network_image_ce/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
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
    },
  );

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

  testWidgets('picker visibility overlays animated image when in view', (
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

    expect(find.byType(CachedNetworkImage), findsNWidgets(2));
  });

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
