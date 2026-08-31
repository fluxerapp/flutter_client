import 'package:cached_network_image_ce/cached_network_image.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_markdown/src/config/fluxer_markdown_config.dart';
import 'package:fluxer_markdown/src/widgets/fluxer_markdown.dart';
import 'package:material_ui/material_ui.dart';
import 'support/native_test_parser.dart';

String? _noopEmojiShortcode(String name) => null;

String? _noopUnicodeEmojiUrl(String unicode) => null;

void main() {
  testWidgets(
    'animateCustomEmoji false forces static URL and cache key for animated emoji',
    (tester) async {
      bool? requestedAnimated;
      final FluxerMarkdownConfig config = FluxerMarkdownConfig(
        resolveEmojiShortcode: _noopEmojiShortcode,
        unicodeEmojiUrlBuilder: _noopUnicodeEmojiUrl,
        animateCustomEmoji: false,
        customEmojiUrlBuilder:
            ({required String id, required bool animated, required int size}) {
              requestedAnimated = animated;
              return 'https://example.com/emojis/$id.webp'
                  '${animated ? '?animated=true' : ''}';
            },
      );

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: FluxerMarkdown(
              astParser: parseTestMarkdownAst,
              data: '<a:party:111111111111111111>',
              config: config,
              baseStyle: const TextStyle(fontSize: 16),
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(requestedAnimated, isFalse);
      final CachedNetworkImage image = tester.widget(
        find.byType(CachedNetworkImage),
      );
      expect(image.imageUrl, isNot(contains('animated=true')));
      expect(image.cacheKey, contains('_s_'));
      expect(image.cacheKey, isNot(contains('_a_')));
      expect(image.memCacheWidth, isNotNull);
    },
  );

  testWidgets('animateCustomEmoji true keeps animated URL and cache key', (
    tester,
  ) async {
    bool? requestedAnimated;
    final FluxerMarkdownConfig config = FluxerMarkdownConfig(
      resolveEmojiShortcode: _noopEmojiShortcode,
      unicodeEmojiUrlBuilder: _noopUnicodeEmojiUrl,
      customEmojiUrlBuilder:
          ({required String id, required bool animated, required int size}) {
            requestedAnimated = animated;
            return 'https://example.com/emojis/$id.webp'
                '${animated ? '?animated=true' : ''}';
          },
    );

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: FluxerMarkdown(
            astParser: parseTestMarkdownAst,
            data: '<a:party:111111111111111111>',
            config: config,
            baseStyle: const TextStyle(fontSize: 16),
          ),
        ),
      ),
    );
    await tester.pumpAndSettle();

    expect(requestedAnimated, isTrue);
    final CachedNetworkImage image = tester.widget(
      find.byType(CachedNetworkImage),
    );
    expect(image.imageUrl, contains('animated=true'));
    expect(image.cacheKey, contains('_a_'));
    expect(image.memCacheWidth, isNull);
    expect(image.memCacheHeight, isNull);
    expect(image.fadeInDuration, Duration.zero);
    expect(image.fadeOutDuration, Duration.zero);
  });
}
