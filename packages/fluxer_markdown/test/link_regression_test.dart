import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_markdown/src/config/fluxer_markdown_config.dart';
import 'package:fluxer_markdown/src/contexts/fluxer_markdown_context.dart';
import 'package:fluxer_markdown/src/contexts/fluxer_markdown_features.dart';
import 'package:fluxer_markdown/src/widgets/fluxer_markdown.dart';
import 'package:markdown/markdown.dart' as md;
import 'package:material_ui/material_ui.dart';

import 'support/native_test_parser.dart';

String? _noopEmojiShortcode(String name) => null;

String? _noopUnicodeEmojiUrl(String unicode) => null;

String _noopCustomEmojiUrl({
  required String id,
  required bool animated,
  required int size,
}) => '';

const FluxerMarkdownConfig _config = FluxerMarkdownConfig(
  resolveEmojiShortcode: _noopEmojiShortcode,
  unicodeEmojiUrlBuilder: _noopUnicodeEmojiUrl,
  customEmojiUrlBuilder: _noopCustomEmojiUrl,
);

Widget _wrap(String data) => MaterialApp(
  home: Scaffold(
    body: FluxerMarkdown(
      astParser: parseTestMarkdownAst,
      data: data,
      config: _config,
    ),
  ),
);

void main() {
  final FluxerMarkdownFeatures features = FluxerMarkdownFeatures.forContext(
    FluxerMarkdownContext.standardWithJumbo,
  );

  List<md.Node> parse(String input) => parseTestMarkdownAst(input, features);

  group('link regressions', () {
    test('angle-bracket https links parse as autolinks', () {
      final nodes = parse('<https://example.com/path>');
      final md.Element? link = findMarkdownTag(nodes, 'a');
      expect(link, isNotNull);
      expect(link!.attributes['href'], 'https://example.com/path');
      expect(link.textContent, 'https://example.com/path');
    });

    test('angle destinations in masked links parse', () {
      final nodes = parse('[click](<https://example.com>)');
      final md.Element? link = findMarkdownTag(nodes, 'a');
      expect(link, isNotNull);
      expect(link!.attributes['href'], 'https://example.com');
      expect(link.textContent, 'click');
    });

    test('image syntax is treated as bang plus masked link', () {
      final nodes = parse('![alt](https://example.com/x.png)');
      expect(containsMarkdownTag(nodes, 'img'), isFalse);
      expect(containsMarkdownTag(nodes, 'a'), isTrue);
      expect(collectMarkdownText(nodes), '!alt');
    });

    test('javascript angle links are not autolinked', () {
      expect(containsMarkdownTag(parse('<javascript:alert(1)>'), 'a'), isFalse);
    });

    testWidgets('misleading url-like masked labels render literally', (
      tester,
    ) async {
      await tester.pumpWidget(
        _wrap('[https://evil.example](https://good.example)'),
      );
      expect(
        find.textContaining(
          '[https://evil.example](https://good.example)',
          findRichText: true,
        ),
        findsOneWidget,
      );
    });

    testWidgets('same-url masked labels remain links', (tester) async {
      await tester.pumpWidget(
        _wrap('[https://example.com/path](https://example.com/path)'),
      );
      expect(
        find.textContaining('[https://', findRichText: true),
        findsNothing,
      );
      expect(
        find.textContaining('https://example.com/path', findRichText: true),
        findsOneWidget,
      );
    });

    test('autolinks after zero-width space parse as links', () {
      final nodes = parse('\u200bhttps://example.com/path');
      final md.Element? link = findMarkdownTag(nodes, 'a');
      expect(link, isNotNull);
      expect(link!.attributes['href'], 'https://example.com/path');
    });

    testWidgets('masked links with userinfo render literally', (tester) async {
      await tester.pumpWidget(_wrap('[x](https://user:pass@example.com)'));
      expect(
        find.textContaining(
          '[x](https://user:pass@example.com)',
          findRichText: true,
        ),
        findsOneWidget,
      );
    });

    test('valid masked links inside inline code stay literal', () {
      final nodes = parse('`[label](https://example.com)`');
      expect(containsMarkdownTag(nodes, 'code'), isTrue);
      expect(containsMarkdownTag(nodes, 'a'), isFalse);
      expect(collectMarkdownText(nodes), '[label](https://example.com)');
    });

    test('invalid masked links inside inline code stay literal', () {
      final nodes = parse('`[](https://example.com)`');
      expect(containsMarkdownTag(nodes, 'code'), isTrue);
      expect(containsMarkdownTag(nodes, 'a'), isFalse);
      expect(collectMarkdownText(nodes), '[](https://example.com)');
    });

    testWidgets('blank masked link labels render literally', (tester) async {
      await tester.pumpWidget(_wrap('[](https://example.com)'));
      expect(
        find.textContaining('[](https://example.com)', findRichText: true),
        findsOneWidget,
      );
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
            body: FluxerMarkdown(
              astParser: parseTestMarkdownAst,
              data: '<user@example.com>',
              config: config,
            ),
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
            body: FluxerMarkdown(
              astParser: parseTestMarkdownAst,
              data: '<https://example.com>',
              config: config,
            ),
          ),
        ),
      );

      await tester.tapOnText(find.textRange.ofSubstring('https://example.com'));
      expect(tappedHref, 'https://example.com');
    });
  });
}
