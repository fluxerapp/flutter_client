import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_markdown/src/contexts/fluxer_markdown_context.dart';
import 'package:fluxer_markdown/src/parsing/markdown_preprocessor.dart';
import 'package:markdown/markdown.dart' as md;
import 'support/markdown_parse_test_helper.dart';

void main() {
  final features = MarkdownParseTestHelper.featuresFor(
    FluxerMarkdownContext.standardWithJumbo,
  );

  group('web fixtures parity', () {
    test('empty input produces no nodes', () {
      expect(MarkdownParseTestHelper.parseBlock('', features), isEmpty);
    });

    test('combined inline formatting', () {
      final nodes = MarkdownParseTestHelper.parseInline(
        '**bold** *em* __under__ ~~strike~~ `code`',
        features,
      );
      expect(MarkdownParseTestHelper.containsTag(nodes, 'strong'), isTrue);
      expect(MarkdownParseTestHelper.containsTag(nodes, 'em'), isTrue);
      expect(MarkdownParseTestHelper.containsTag(nodes, 'underline'), isTrue);
      expect(MarkdownParseTestHelper.containsTag(nodes, 'del'), isTrue);
      expect(MarkdownParseTestHelper.containsTag(nodes, 'code'), isTrue);
    });

    test('windows path backslashes may collapse before dots via markdown', () {
      final nodes = MarkdownParseTestHelper.parseInline(r'C:\. path', features);
      expect(MarkdownParseTestHelper.collectText(nodes), 'C:. path');
    });

    test('escaped ordered list marker renders as text', () {
      final nodes = MarkdownParseTestHelper.parseBlock(
        r'1\. not a list',
        features,
      );
      expect(
        MarkdownParseTestHelper.collectText(nodes),
        contains('not a list'),
      );
      expect(MarkdownParseTestHelper.containsTag(nodes, 'li'), isFalse);
    });

    test('mentions and timestamp parse', () {
      final nodes = MarkdownParseTestHelper.parseInline(
        '@everyone <@123> <#456> <t:1234567890:R>',
        features,
      );
      expect(
        MarkdownParseTestHelper.containsTag(nodes, 'mention-everyone'),
        isTrue,
      );
      expect(
        MarkdownParseTestHelper.containsTag(nodes, 'mention-user'),
        isTrue,
      );
      expect(
        MarkdownParseTestHelper.containsTag(nodes, 'mention-channel'),
        isTrue,
      );
      expect(MarkdownParseTestHelper.containsTag(nodes, 'timestamp'), isTrue);
    });

    test('numeric dot unescape after masked link', () {
      final nodes = MarkdownParseTestHelper.parseInline(
        '[`34d2f5e`](https://-/a/commit/-) 1\\.2\\.3\\.4\\.5\\.6\\.7\\.8\\.9\\.10\n \\- Amy',
        features,
      );
      expect(
        MarkdownParseTestHelper.collectText(nodes),
        contains('1.2.3.4.5.6.7.8.9.10'),
      );
    });

    test('word and sentence dot unescape', () {
      final nodes = MarkdownParseTestHelper.parseInline(
        r'Four more years\. religion\.\.\.',
        features,
      );
      expect(
        MarkdownParseTestHelper.collectText(nodes),
        'Four more years. religion...',
      );
    });

    test('fluxer protocol links parse as links', () {
      final nodes = MarkdownParseTestHelper.parseInline(
        'fluxer://invite/abc fluxer:/channels/123/456 [Open gift](fluxer:gift/xyz)',
        features,
      );
      expect(MarkdownParseTestHelper.containsTag(nodes, 'a'), isTrue);
      expect(
        MarkdownParseTestHelper.collectText(nodes),
        contains('fluxer://invite/abc'),
      );
    });

    test('encoded characters in autolink hrefs are not double-encoded', () {
      for (final String input in <String>[
        'https://example.com/path%20with%20spaces',
        'https://example.com/file%2Fname?query=hello%20world',
        'http://localhost:5173/path%20test',
      ]) {
        final nodes = MarkdownParseTestHelper.parseInline(input, features);
        expect(
          MarkdownParseTestHelper.containsTag(nodes, 'a'),
          isTrue,
          reason: input,
        );
        final md.Element link = nodes.whereType<md.Element>().firstWhere(
          (md.Element node) => node.tag == 'a',
        );
        expect(link.attributes['href'], input, reason: input);
        expect(link.textContent, input, reason: input);
      }
    });

    test('localhost http urls autolink', () {
      for (final String input in <String>[
        'http://localhost:5173',
        'https://localhost:5173/path',
        'http://localhost',
      ]) {
        final nodes = MarkdownParseTestHelper.parseInline(input, features);
        expect(
          MarkdownParseTestHelper.containsTag(nodes, 'a'),
          isTrue,
          reason: input,
        );
        final md.Element link = nodes.whereType<md.Element>().firstWhere(
          (md.Element node) => node.tag == 'a',
        );
        expect(link.attributes['href'], input);
        expect(link.textContent, input);
      }
    });

    test('localhost urls do not partially match longer hostnames', () {
      final nodes = MarkdownParseTestHelper.parseInline(
        'http://localhostish',
        features,
      );
      expect(MarkdownParseTestHelper.containsTag(nodes, 'a'), isFalse);
    });

    test('rejects apostrophe in masked link authority', () {
      const String input = "[Bad](https://ex'ample.com/path)";
      final nodes = MarkdownParseTestHelper.parseInline(input, features);
      expect(MarkdownParseTestHelper.containsTag(nodes, 'a'), isFalse);
    });

    test('rejects empty masked link labels', () {
      for (final String input in <String>[
        '[](https://duckduckgo.com)',
        '[ ](https://duckduckgo.com)',
      ]) {
        final nodes = MarkdownParseTestHelper.parseInline(input, features);
        expect(MarkdownParseTestHelper.containsTag(nodes, 'a'), isFalse);
      }
    });

    test('subtext requires visible content', () {
      expect(
        MarkdownParseTestHelper.describeSegments(
          MarkdownParseTestHelper.parseSegments('-# hello', features),
        ),
        contains('Subtext:hello'),
      );
      for (final String input in <String>['-#', '-# ', '-# \t', '-#  hello']) {
        final segments = MarkdownParseTestHelper.parseSegments(input, features);
        expect(segments.whereType<FluxerSubtextSegment>(), isEmpty);
      }
    });

    test('phone and sms angle links parse', () {
      final nodes = MarkdownParseTestHelper.parseInline(
        '<+12025550123> and <sms:+12025550123>',
        features,
      );
      expect(MarkdownParseTestHelper.containsTag(nodes, 'a'), isTrue);
      final links = nodes.whereType<md.Element>().where(
        (md.Element e) => e.tag == 'a',
      );
      expect(links.length, greaterThanOrEqualTo(2));
    });

    test('angle email links parse as mailto', () {
      final nodes = MarkdownParseTestHelper.parseInline(
        '<user@example.com>',
        features,
      );
      expect(MarkdownParseTestHelper.containsTag(nodes, 'a'), isTrue);
      final md.Element link = nodes.whereType<md.Element>().firstWhere(
        (md.Element node) => node.tag == 'a',
      );
      expect(link.attributes['href'], 'mailto:user@example.com');
    });

    test('horizontal rules stay plain text in block parsing', () {
      final nodes = MarkdownParseTestHelper.parseBlock('---', features);
      expect(MarkdownParseTestHelper.containsTag(nodes, 'hr'), isFalse);
    });

    test('setext headings stay plain text in block parsing', () {
      final nodes = MarkdownParseTestHelper.parseBlock(
        'Title\n=======',
        features,
      );
      expect(MarkdownParseTestHelper.containsTag(nodes, 'h1'), isFalse);
    });

    test('rejects slash-command-like masked link labels', () {
      const String input = '[</command:123>](https://example.com)';
      final nodes = MarkdownParseTestHelper.parseInline(input, features);
      expect(MarkdownParseTestHelper.containsTag(nodes, 'a'), isFalse);
    });

    test('rejects email-like masked link labels', () {
      const String input = '[user@example.com](https://example.com)';
      final nodes = MarkdownParseTestHelper.parseInline(input, features);
      expect(MarkdownParseTestHelper.containsTag(nodes, 'a'), isFalse);
    });

    test('rejects whitespace-only formatting markers', () {
      for (final String input in <String>['** **', '__ __', '~~ ~~', '|| ||']) {
        final nodes = MarkdownParseTestHelper.parseInline(input, features);
        expect(
          MarkdownParseTestHelper.containsTag(nodes, 'spoiler'),
          isFalse,
          reason: input,
        );
      }
    });

    test(
      'inline code across newlines is not matched as a single code span',
      () {
        final nodes = MarkdownParseTestHelper.parseInline(
          'before `\nHello world\n` after',
          features,
        );
        expect(MarkdownParseTestHelper.collectText(nodes), contains('before'));
        expect(MarkdownParseTestHelper.collectText(nodes), contains('after'));
      },
    );

    test('rejects atx headings above level four', () {
      for (final String input in <String>['##### h5', '###### h6']) {
        final nodes = MarkdownParseTestHelper.parseBlock(input, features);
        expect(MarkdownParseTestHelper.containsTag(nodes, 'h5'), isFalse);
        expect(MarkdownParseTestHelper.containsTag(nodes, 'h6'), isFalse);
        expect(MarkdownParseTestHelper.containsTag(nodes, 'h4'), isFalse);
        expect(
          MarkdownParseTestHelper.collectText(nodes),
          contains(input.substring(input.indexOf(' ') + 1)),
        );
      }
    });

    test('rejects indented code blocks', () {
      const String input = '    indented code';
      final nodes = MarkdownParseTestHelper.parseBlock(input, features);
      expect(MarkdownParseTestHelper.containsTag(nodes, 'pre'), isFalse);
      expect(
        MarkdownParseTestHelper.collectText(nodes),
        contains('indented code'),
      );
    });

    test('triple underscore renders bold and italic', () {
      final nodes = MarkdownParseTestHelper.parseInline('___both___', features);
      expect(MarkdownParseTestHelper.containsTag(nodes, 'strong'), isTrue);
      expect(MarkdownParseTestHelper.containsTag(nodes, 'em'), isTrue);
    });

    test('bold can span soft line breaks', () {
      final nodes = MarkdownParseTestHelper.parseInline(
        '**line\nbreak**',
        features,
      );
      expect(MarkdownParseTestHelper.containsTag(nodes, 'strong'), isTrue);
      expect(MarkdownParseTestHelper.collectText(nodes), contains('line'));
      expect(MarkdownParseTestHelper.collectText(nodes), contains('break'));
    });

    test('masked links are escaped when allowMaskedLinks is false', () {
      final features = MarkdownParseTestHelper.featuresWith(
        allowMaskedLinks: false,
      );
      final nodes = MarkdownParseTestHelper.parseInline(
        '[label](https://example.com)',
        features,
      );
      expect(MarkdownParseTestHelper.containsTag(nodes, 'a'), isFalse);
    });

    test('autolinks are escaped when allowAutolinks is false', () {
      final features = MarkdownParseTestHelper.featuresWith(
        allowAutolinks: false,
      );
      final nodes = MarkdownParseTestHelper.parseInline(
        'https://example.com',
        features,
      );
      expect(MarkdownParseTestHelper.containsTag(nodes, 'a'), isFalse);
    });

    test('rejects invisible-char masked link labels', () {
      const String input = '[\u200e ](https://duckduckgo.com)';
      final nodes = MarkdownParseTestHelper.parseInline(input, features);
      expect(MarkdownParseTestHelper.containsTag(nodes, 'a'), isFalse);
    });

    test('rejects single-space list indents in block parsing', () {
      const String input = ' - item';
      final nodes = MarkdownParseTestHelper.parseBlock(input, features);
      expect(MarkdownParseTestHelper.containsTag(nodes, 'li'), isFalse);
      expect(MarkdownParseTestHelper.collectText(nodes), contains('item'));
    });

    test('block spoiler segment extraction', () {
      const String input = '||\nBlock spoiler content\nClick to reveal!\n||';
      final segments = MarkdownParseTestHelper.parseSegments(input, features);
      expect(
        segments.whereType<FluxerBlockSpoilerSegment>().single.text,
        'Block spoiler content\nClick to reveal!',
      );
    });
  });
}
