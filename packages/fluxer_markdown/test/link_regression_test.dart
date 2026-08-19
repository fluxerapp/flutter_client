import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_markdown/src/config/fluxer_markdown_config.dart';
import 'package:fluxer_markdown/src/contexts/fluxer_markdown_context.dart';
import 'package:fluxer_markdown/src/widgets/fluxer_markdown.dart';
import 'package:markdown/markdown.dart' as md;
import 'package:material_ui/material_ui.dart';

import 'support/markdown_parse_test_helper.dart';

String? _noopEmojiShortcode(String name) => null;

String? _noopUnicodeEmojiUrl(String unicode) => null;

String _noopCustomEmojiUrl({
  required String id,
  required bool animated,
  required int size,
}) => '';

void main() {
  final features = MarkdownParseTestHelper.featuresFor(
    FluxerMarkdownContext.standardWithJumbo,
  );

  group('link regressions', () {
    test('angle-bracket https links parse as autolinks', () {
      const String input = '<https://example.com/path>';
      final nodes = MarkdownParseTestHelper.parseInline(input, features);
      expect(MarkdownParseTestHelper.containsTag(nodes, 'a'), isTrue);
      final md.Element link = nodes.whereType<md.Element>().firstWhere(
        (md.Element node) => node.tag == 'a',
      );
      expect(link.attributes['href'], 'https://example.com/path');
      expect(link.textContent, 'https://example.com/path');
    });

    test('angle destinations in masked links parse', () {
      const String input = '[click](<https://example.com>)';
      expect(
        MarkdownParseTestHelper.preprocess(input, features),
        '[click](https://example.com)',
      );
      final nodes = MarkdownParseTestHelper.parseInline(input, features);
      expect(MarkdownParseTestHelper.containsTag(nodes, 'a'), isTrue);
      final md.Element link = nodes.whereType<md.Element>().firstWhere(
        (md.Element node) => node.tag == 'a',
      );
      expect(link.attributes['href'], 'https://example.com');
      expect(link.textContent, 'click');
    });

    test('image syntax is treated as bang plus masked link', () {
      const String input = '![alt](https://example.com/x.png)';
      final nodes = MarkdownParseTestHelper.parseInline(input, features);
      expect(MarkdownParseTestHelper.containsTag(nodes, 'img'), isFalse);
      expect(MarkdownParseTestHelper.containsTag(nodes, 'a'), isTrue);
      expect(MarkdownParseTestHelper.collectText(nodes), '!alt');
    });

    test('javascript angle links are not autolinked', () {
      const String input = '<javascript:alert(1)>';
      final nodes = MarkdownParseTestHelper.parseInline(input, features);
      expect(MarkdownParseTestHelper.containsTag(nodes, 'a'), isFalse);
    });

    test('misleading url-like masked labels are rejected', () {
      const String input = '[https://evil.example](https://good.example)';
      final nodes = MarkdownParseTestHelper.parseInline(input, features);
      expect(MarkdownParseTestHelper.containsTag(nodes, 'a'), isFalse);
    });

    test('same-url masked labels remain links', () {
      const String input =
          '[https://example.com/path](https://example.com/path)';
      final nodes = MarkdownParseTestHelper.parseInline(input, features);
      expect(MarkdownParseTestHelper.containsTag(nodes, 'a'), isTrue);
    });

    test('autolinks after zero-width space parse as links', () {
      const String input = '\u200bhttps://example.com/path';
      final nodes = MarkdownParseTestHelper.parseInline(input, features);
      expect(MarkdownParseTestHelper.containsTag(nodes, 'a'), isTrue);
      final md.Element link = nodes.whereType<md.Element>().firstWhere(
        (md.Element node) => node.tag == 'a',
      );
      expect(link.attributes['href'], 'https://example.com/path');
      expect(link.textContent, 'https://example.com/path');
    });

    test('masked links with userinfo are rejected', () {
      const String input = '[x](https://user:pass@example.com)';
      final nodes = MarkdownParseTestHelper.parseInline(input, features);
      expect(MarkdownParseTestHelper.containsTag(nodes, 'a'), isFalse);
    });

    test('valid masked links inside inline code stay literal', () {
      const String input = '`[label](https://example.com)`';
      final nodes = MarkdownParseTestHelper.parseInline(input, features);
      expect(MarkdownParseTestHelper.containsTag(nodes, 'code'), isTrue);
      expect(MarkdownParseTestHelper.containsTag(nodes, 'a'), isFalse);
      expect(
        MarkdownParseTestHelper.collectText(nodes),
        '[label](https://example.com)',
      );
    });

    test('invalid masked links inside inline code stay literal', () {
      const String input = '`[](https://example.com)`';
      expect(MarkdownParseTestHelper.preprocess(input, features), input);
      final nodes = MarkdownParseTestHelper.parseInline(input, features);
      expect(MarkdownParseTestHelper.containsTag(nodes, 'code'), isTrue);
      expect(MarkdownParseTestHelper.containsTag(nodes, 'a'), isFalse);
      expect(
        MarkdownParseTestHelper.collectText(nodes),
        '[](https://example.com)',
      );
    });

    test('masked links outside code still neutralize when invalid', () {
      const String input = '[](https://example.com)';
      final nodes = MarkdownParseTestHelper.parseInline(input, features);
      expect(MarkdownParseTestHelper.containsTag(nodes, 'a'), isFalse);
    });

    testWidgets('angle email links render as tappable mailto', (tester) async {
      String? tappedHref;
      final FluxerMarkdownConfig config = FluxerMarkdownConfig(
        resolveEmojiShortcode: _noopEmojiShortcode,
        unicodeEmojiUrlBuilder: _noopUnicodeEmojiUrl,
        customEmojiUrlBuilder: _noopCustomEmojiUrl,
        onTapLink: (_, href) async {
          tappedHref = href;
        },
      );

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: FluxerMarkdown(data: '<user@example.com>', config: config),
          ),
        ),
      );

      expect(find.text('user@example.com', findRichText: true), findsOneWidget);
      expect(
        find.textContaining('[user@example.com](mailto:', findRichText: true),
        findsNothing,
      );

      await tester.tapOnText(find.textRange.ofSubstring('user@example.com'));
      expect(tappedHref, 'mailto:user@example.com');
    });

    testWidgets('angle https links render as tappable links', (tester) async {
      String? tappedHref;
      final FluxerMarkdownConfig config = FluxerMarkdownConfig(
        resolveEmojiShortcode: _noopEmojiShortcode,
        unicodeEmojiUrlBuilder: _noopUnicodeEmojiUrl,
        customEmojiUrlBuilder: _noopCustomEmojiUrl,
        onTapLink: (_, href) async {
          tappedHref = href;
        },
      );

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: FluxerMarkdown(data: '<https://example.com>', config: config),
          ),
        ),
      );

      await tester.tapOnText(find.textRange.ofSubstring('https://example.com'));
      expect(tappedHref, 'https://example.com');
    });
  });
}
