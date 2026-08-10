import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_markdown/src/config/fluxer_markdown_config.dart';
import 'package:fluxer_markdown/src/widgets/fluxer_markdown.dart';

const FluxerMarkdownConfig _testMarkdownConfig = FluxerMarkdownConfig(
  resolveEmojiShortcode: _noopEmojiShortcode,
  unicodeEmojiUrlBuilder: _noopUnicodeEmojiUrl,
  customEmojiUrlBuilder: _noopCustomEmojiUrl,
);
const TextStyle _baseStyle = TextStyle(fontSize: 16, height: 1.375);

String? _noopEmojiShortcode(String name) => null;

String? _noopUnicodeEmojiUrl(String unicode) => null;

String _noopCustomEmojiUrl({
  required String id,
  required bool animated,
  required int size,
}) => '';

Future<void> _pumpGallerySection(WidgetTester tester, String data) async {
  await tester.pumpWidget(
    MaterialApp(
      home: Scaffold(
        body: SingleChildScrollView(
          child: SizedBox(
            width: 360,
            child: FluxerMarkdown(
              data: data,
              config: _testMarkdownConfig,
              baseStyle: _baseStyle,
            ),
          ),
        ),
      ),
    ),
  );
  await tester.pumpAndSettle();
  expect(tester.takeException(), isNull);
}

void main() {
  group('markdown gallery smoke', () {
    testWidgets('text formatting section renders', (tester) async {
      await _pumpGallerySection(
        tester,
        '**bold** *italic* __underline__ ~~strike~~ `code` ||spoiler||',
      );
      expect(find.textContaining('bold', findRichText: true), findsOneWidget);
      expect(
        find.textContaining('spoiler', findRichText: true),
        findsOneWidget,
      );
    });

    testWidgets('headings and subtext section renders', (tester) async {
      await _pumpGallerySection(
        tester,
        '# Heading one\n## Heading two\n-# Subtext line',
      );
      expect(
        find.textContaining('Heading one', findRichText: true),
        findsOneWidget,
      );
      expect(
        find.textContaining('Subtext line', findRichText: true),
        findsOneWidget,
      );
    });

    testWidgets('links section renders', (tester) async {
      await _pumpGallerySection(
        tester,
        'https://example.com\n[masked](https://example.com)\n<user@example.com>',
      );
      expect(
        find.textContaining('example.com', findRichText: true),
        findsWidgets,
      );
    });

    testWidgets('lists section renders', (tester) async {
      await _pumpGallerySection(
        tester,
        '- unordered\n  - nested\n1. ordered\n2. second',
      );
      expect(find.text('1.'), findsOneWidget);
      expect(find.text('\u2022'), findsWidgets);
    });

    testWidgets('blockquotes section renders', (tester) async {
      await _pumpGallerySection(tester, '> single line\n>>> multi\n\nline');
      expect(
        find.textContaining('single line', findRichText: true),
        findsOneWidget,
      );
      expect(find.textContaining('multi', findRichText: true), findsOneWidget);
    });

    testWidgets('code blocks and alerts section renders', (tester) async {
      await _pumpGallerySection(
        tester,
        '```dart\nvoid main() {}\n```\n> [!NOTE]\n> Alert body',
      );
      expect(
        find.textContaining('void main', findRichText: true),
        findsOneWidget,
      );
      expect(
        find.textContaining('Alert body', findRichText: true),
        findsOneWidget,
      );
    });

    testWidgets('mentions timestamps and spoilers section renders', (
      tester,
    ) async {
      await _pumpGallerySection(
        tester,
        '@everyone <@123> <t:1234567890:R>\n||\nBlock spoiler\n||',
      );
      expect(
        find.textContaining('@everyone', findRichText: true),
        findsOneWidget,
      );
    });
  });
}
