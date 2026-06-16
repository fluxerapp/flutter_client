import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_markdown/src/contexts/fluxer_markdown_context.dart';
import 'package:fluxer_markdown/src/contexts/fluxer_markdown_features.dart';
import 'package:fluxer_markdown/src/parsing/message_line_parser.dart';
import 'package:markdown/markdown.dart' as md;

void main() {
  final FluxerMarkdownFeatures features = FluxerMarkdownFeatures.forContext(
    FluxerMarkdownContext.standardWithJumbo,
  );

  group('parseMessageContentStructure', () {
    test('preserves two blank lines between plain text lines', () {
      const String input = 'test line one\n\n\ntest line two';
      final List<MessageContentSegment> segments = parseMessageContentStructure(
        input,
        features,
      );
      expect(segments, hasLength(1));
      expect(segments.first, isA<MessageTextFlowSegment>());
      expect(
        (segments.first as MessageTextFlowSegment).text,
        'test line one\n\n\ntest line two',
      );
    });

    test('parseMessageTextFlowParts matches web-style text nodes', () {
      const String input = 'test line one\n\n\ntest line two';
      final List<String> parts = parseMessageTextFlowParts(input, features);
      expect(parts, ['test line one\n\n\ntest line two']);
    });

    test('preserves single soft line break within a paragraph', () {
      const String input = 'line one\nline two';
      final List<MessageContentSegment> segments = parseMessageContentStructure(
        input,
        features,
      );
      expect(segments, hasLength(1));
      expect(
        (segments.first as MessageTextFlowSegment).text,
        'line one\nline two',
      );
    });

    test('splits block markdown from surrounding text', () {
      const String input = 'before\n\n# heading\n\nafter';
      final List<MessageContentSegment> segments = parseMessageContentStructure(
        input,
        features,
      );
      expect(segments, hasLength(3));
      expect(segments[0], isA<MessageTextFlowSegment>());
      // Web strips the blank line adjacent to a heading (it owns its margin).
      expect((segments[0] as MessageTextFlowSegment).text, 'before\n');
      expect(segments[1], isA<MessageBlockMarkdownSegment>());
      expect((segments[1] as MessageBlockMarkdownSegment).text, '# heading');
      expect(segments[2], isA<MessageTextFlowSegment>());
      expect((segments[2] as MessageTextFlowSegment).text, 'after');
    });

    test('does not use line parsing for restricted inline reply context', () {
      expect(
        usesMessageLineParsing(FluxerMarkdownContext.restrictedInlineReply),
        isFalse,
      );
      expect(
        usesMessageLineParsing(FluxerMarkdownContext.standardWithJumbo),
        isTrue,
      );
    });

    test('splits blockquote bar from preceding text', () {
      const String input = 'before\n>>> quote';
      final List<MessageContentSegment> segments = parseMessageContentStructure(
        input,
        features,
      );
      expect(segments, hasLength(2));
      expect(segments[0], isA<MessageTextFlowSegment>());
      expect((segments[0] as MessageTextFlowSegment).text, 'before');
      expect(segments[1], isA<MessageBlockMarkdownSegment>());
      expect((segments[1] as MessageBlockMarkdownSegment).text, '>>> quote');
    });
  });

  group('normalizeBlockquoteBarMarkdown', () {
    test('rewrites triple-quote opener to single blockquote marker', () {
      expect(normalizeBlockquoteBarMarkdown('>>> a'), '> a');
    });

    test('normalizes only the first line of a multi-line bar', () {
      const String input = '>>> line one\nline two';
      expect(normalizeBlockquoteBarMarkdown(input), '> line one\nline two');
    });

    test('preserves leading indentation on the opener line', () {
      expect(normalizeBlockquoteBarMarkdown('  >>> indented'), '  > indented');
    });

    test('leaves single-quote and plain text unchanged', () {
      expect(normalizeBlockquoteBarMarkdown('> a'), '> a');
      expect(normalizeBlockquoteBarMarkdown('plain'), 'plain');
    });

    test('parsed bar blockquote has depth one not three', () {
      const String input = '>>> quoted text';
      final String normalized = normalizeBlockquoteBarMarkdown(input);
      final md.Document document = md.Document(encodeHtml: false);
      final List<md.Node> nodes = document.parse(normalized);
      expect(blockquoteNestingDepth(nodes), 1);
    });

    test('raw triple-quote parses to depth three without normalization', () {
      const String input = '>>> quoted text';
      final md.Document document = md.Document(encodeHtml: false);
      final List<md.Node> nodes = document.parse(input);
      expect(blockquoteNestingDepth(nodes), 3);
    });
  });
}

int blockquoteNestingDepth(List<md.Node> nodes) {
  var maxDepth = 0;
  for (final md.Node node in nodes) {
    if (node is! md.Element) {
      continue;
    }
    if (node.tag == 'blockquote') {
      final int childDepth = blockquoteNestingDepth(node.children ?? const []);
      maxDepth = maxDepth < childDepth + 1 ? childDepth + 1 : maxDepth;
    } else {
      final int childDepth = blockquoteNestingDepth(node.children ?? const []);
      if (childDepth > maxDepth) {
        maxDepth = childDepth;
      }
    }
  }
  return maxDepth;
}
