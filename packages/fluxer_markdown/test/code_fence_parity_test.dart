import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_markdown/src/contexts/fluxer_markdown_context.dart';
import 'support/markdown_parse_test_helper.dart';

void main() {
  final features = MarkdownParseTestHelper.featuresFor(
    FluxerMarkdownContext.standardWithJumbo,
  );

  group('code fence parity', () {
    test('space after fence is content not language', () {
      final nodes = MarkdownParseTestHelper.parseBlock(
        '``` hello\n```',
        features,
      );
      expect(MarkdownParseTestHelper.containsTag(nodes, 'pre'), isTrue);
      expect(MarkdownParseTestHelper.collectText(nodes), ' hello\n');
    });

    test('tab after fence is content not language', () {
      final nodes = MarkdownParseTestHelper.parseBlock(
        '```\thello\n```',
        features,
      );
      expect(MarkdownParseTestHelper.collectText(nodes), '\thello\n');
    });

    test('space before valid language chars is content', () {
      final nodes = MarkdownParseTestHelper.parseBlock(
        '``` c++\nx\n```',
        features,
      );
      expect(MarkdownParseTestHelper.collectText(nodes), ' c++\nx\n');
    });

    test('language immediately after fence is detected', () {
      final nodes = MarkdownParseTestHelper.parseBlock(
        '```js\ncode\n```',
        features,
      );
      expect(
        MarkdownParseTestHelper.describeNodes(nodes).join(' '),
        contains('language-js'),
      );
      expect(MarkdownParseTestHelper.collectText(nodes), 'code\n');
    });

    test('languages with special characters are detected', () {
      final nodes = MarkdownParseTestHelper.parseBlock(
        '```c#\nx\n```',
        features,
      );
      expect(
        MarkdownParseTestHelper.describeNodes(nodes).join(' '),
        contains('language-c#'),
      );
    });

    test('ansi language is detected', () {
      final nodes = MarkdownParseTestHelper.parseBlock(
        '```ansi\n\u001b[31mhi\u001b[0m\n```',
        features,
      );
      expect(
        MarkdownParseTestHelper.describeNodes(nodes).join(' '),
        contains('language-ansi'),
      );
    });

    test('glued language without body stays literal', () {
      final nodes = MarkdownParseTestHelper.parseBlock(
        '```hello\n```',
        features,
      );
      expect(MarkdownParseTestHelper.containsTag(nodes, 'pre'), isFalse);
      expect(MarkdownParseTestHelper.collectText(nodes), '```hello\n```');
    });

    test('bare fence has no language', () {
      final nodes = MarkdownParseTestHelper.parseBlock(
        '```\nfoo\n```',
        features,
      );
      expect(MarkdownParseTestHelper.collectText(nodes), 'foo\n');
      expect(
        MarkdownParseTestHelper.describeNodes(nodes).join(' '),
        isNot(contains('language-')),
      );
    });

    test('single line fence with space is content', () {
      final nodes = MarkdownParseTestHelper.parseBlock(
        '``` hello```',
        features,
      );
      expect(MarkdownParseTestHelper.collectText(nodes), ' hello');
    });
  });
}
