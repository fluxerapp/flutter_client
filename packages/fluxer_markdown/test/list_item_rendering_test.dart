import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_markdown/src/config/fluxer_markdown_config.dart';
import 'package:fluxer_markdown/src/contexts/fluxer_markdown_context.dart';
import 'package:fluxer_markdown/src/renderers/fluxer_markdown_renderers.dart';
import 'package:fluxer_markdown/src/utils/jumbo_emoji.dart';
import 'package:fluxer_markdown/src/widgets/fluxer_markdown.dart';

const FluxerMarkdownConfig _testMarkdownConfig = FluxerMarkdownConfig(
  resolveEmojiShortcode: _noopEmojiShortcode,
  unicodeEmojiUrlBuilder: _noopUnicodeEmojiUrl,
  customEmojiUrlBuilder: _noopCustomEmojiUrl,
);
const TextStyle _baseStyle = TextStyle(fontSize: 16, height: 1.375);
final RegExp _internalFluxerLinkPattern = RegExp(
  r'https://web\.fluxer\.app/channels/\d+/\d+/\d+',
);

String? _noopEmojiShortcode(String name) => null;

String? _noopUnicodeEmojiUrl(String unicode) => null;

String _noopCustomEmojiUrl({
  required String id,
  required bool animated,
  required int size,
}) => '';

void main() {
  group('list item inline rendering', () {
    testWidgets('ordered list item with mixed formatting uses one RichText', (
      tester,
    ) async {
      const String url = 'https://fluxer.app';
      const String input = '1. plain **bold** [link]($url)';

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: SizedBox(
              width: 320,
              child: FluxerMarkdown(
                data: input,
                config: _testMarkdownConfig,
                baseStyle: _baseStyle,
              ),
            ),
          ),
        ),
      );

      expect(_richTextCountInListItemBody(tester, '1.'), 1);
      expect(find.textContaining('plain', findRichText: true), findsOneWidget);
      expect(find.textContaining('bold', findRichText: true), findsOneWidget);
      expect(find.textContaining('link', findRichText: true), findsOneWidget);
    });

    testWidgets('unordered list item with long mixed text uses one RichText', (
      tester,
    ) async {
      const String input =
          '- this is a long unordered list item with **bold** text that should wrap onto multiple lines when the width is constrained';
      const double maxWidth = 200;

      await tester.pumpWidget(
        const MaterialApp(
          home: MediaQuery(
            data: MediaQueryData(textScaler: TextScaler.noScaling),
            child: Scaffold(
              body: Center(
                child: SizedBox(
                  width: maxWidth,
                  child: FluxerMarkdown(
                    data: input,
                    config: _testMarkdownConfig,
                    baseStyle: _baseStyle,
                  ),
                ),
              ),
            ),
          ),
        ),
      );

      expect(_richTextCountInListItemBody(tester, '\u2022'), 1);
      final Size itemBodySize = _listItemBodySize(tester, '\u2022');
      final Size singleLineSize = await _measureSingleLineHeight(tester);
      expect(itemBodySize.height, greaterThan(singleLineSize.height));
    });

    testWidgets(
      'list item with text and custom emoji does not use jumbo size',
      (tester) async {
        const String input = '1. hello <:test:123456789012345678>';

        await tester.pumpWidget(
          const MaterialApp(
            home: Scaffold(
              body: SizedBox(
                width: 320,
                child: FluxerMarkdown(
                  data: input,
                  config: _testMarkdownConfig,
                  baseStyle: _baseStyle,
                ),
              ),
            ),
          ),
        );

        expect(_richTextCountInListItemBody(tester, '1.'), 1);
        final Size emojiSize = tester.getSize(find.byType(FluxerEmojiWidget));
        expect(emojiSize.height, lessThan(kFluxerMarkdownEmojiSizeJumbo));
        expect(
          emojiSize.height,
          closeTo(16 * kFluxerMarkdownEmojiSizeMultiplier, 1),
        );
      },
    );

    testWidgets('bare jump link inside list item renders inline', (
      tester,
    ) async {
      const String url =
          'https://web.fluxer.app/channels/123456789012345678/'
          '987654321098765432/111111111111111111';
      const String input = '1. before $url after';
      final FluxerMarkdownConfig config = FluxerMarkdownConfig(
        resolveEmojiShortcode: _noopEmojiShortcode,
        unicodeEmojiUrlBuilder: _noopUnicodeEmojiUrl,
        customEmojiUrlBuilder: _noopCustomEmojiUrl,
        internalLinkPattern: _internalFluxerLinkPattern,
        linkWidgetBuilder: (_, _, _) => const Text('jump pill'),
      );

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: SizedBox(
              width: 320,
              child: FluxerMarkdown(
                data: input,
                config: config,
                baseStyle: _baseStyle,
              ),
            ),
          ),
        ),
      );

      expect(_richTextCountInListItemBody(tester, '1.'), 1);
      expect(find.textContaining('before', findRichText: true), findsOneWidget);
      expect(find.textContaining('after', findRichText: true), findsOneWidget);
      expect(find.text('jump pill'), findsOneWidget);
    });

    testWidgets('loose list item with blank line keeps separate paragraphs', (
      tester,
    ) async {
      const String input = '1. first paragraph\n\n   second paragraph';

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: SizedBox(
              width: 320,
              child: FluxerMarkdown(
                data: input,
                config: _testMarkdownConfig,
                baseStyle: _baseStyle,
                context: FluxerMarkdownContext.restrictedEmbedDescription,
              ),
            ),
          ),
        ),
      );

      expect(_richTextCountInListItemBody(tester, '1.'), 2);
      expect(
        find.textContaining('first paragraph', findRichText: true),
        findsOneWidget,
      );
      expect(
        find.textContaining('second paragraph', findRichText: true),
        findsOneWidget,
      );
    });
  });
}

int _richTextCountInListItemBody(WidgetTester tester, String marker) {
  final Finder markerFinder = find.text(marker);
  expect(markerFinder, findsOneWidget);
  final Finder rowFinder = find.ancestor(
    of: markerFinder,
    matching: find.byWidgetPredicate(
      (Widget widget) =>
          widget is Row &&
          widget.children.any(
            (Widget child) => child is SizedBox && child.width == 24,
          ),
    ),
  );
  expect(rowFinder, findsOneWidget);
  final Finder expandedFinder = find.descendant(
    of: rowFinder,
    matching: find.byType(Expanded),
  );
  final Finder columnFinder = find.descendant(
    of: expandedFinder,
    matching: find.byType(Column),
  );
  final Column column = tester.widget<Column>(columnFinder);
  var count = 0;
  for (final Widget child in column.children) {
    if (child is RichText) {
      count++;
    }
  }
  return count;
}

Size _listItemBodySize(WidgetTester tester, String marker) {
  final Finder markerFinder = find.text(marker);
  final Finder rowFinder = find.ancestor(
    of: markerFinder,
    matching: find.byWidgetPredicate(
      (Widget widget) =>
          widget is Row &&
          widget.children.any(
            (Widget child) => child is SizedBox && child.width == 24,
          ),
    ),
  );
  final Finder expandedFinder = find.descendant(
    of: rowFinder,
    matching: find.byType(Expanded),
  );
  return tester.getSize(expandedFinder);
}

Future<Size> _measureSingleLineHeight(WidgetTester tester) async {
  await tester.pumpWidget(
    const MaterialApp(
      home: MediaQuery(
        data: MediaQueryData(textScaler: TextScaler.noScaling),
        child: Scaffold(
          body: Center(
            child: SizedBox(
              width: 200,
              child: Text('single line', style: _baseStyle),
            ),
          ),
        ),
      ),
    ),
  );
  return tester.getSize(find.text('single line'));
}
