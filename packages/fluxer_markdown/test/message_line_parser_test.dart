import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_markdown/src/contexts/fluxer_markdown_context.dart';
import 'package:fluxer_markdown/src/contexts/fluxer_markdown_features.dart';
import 'package:fluxer_markdown/src/parsing/markdown_preprocessor.dart';
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

    test(
      'splits unordered list from preceding text without extra blank line',
      () {
        const String input = 'before\n- item';
        final List<MessageContentSegment> segments =
            parseMessageContentStructure(input, features);
        expect(segments, hasLength(2));
        expect(segments[0], isA<MessageTextFlowSegment>());
        expect((segments[0] as MessageTextFlowSegment).text, 'before');
        expect(segments[1], isA<MessageBlockMarkdownSegment>());
        expect((segments[1] as MessageBlockMarkdownSegment).text, '- item');
      },
    );

    test(
      'splits ordered list from preceding text without extra blank line',
      () {
        const String input = 'before\n1. item';
        final List<MessageContentSegment> segments =
            parseMessageContentStructure(input, features);
        expect(segments, hasLength(2));
        expect(segments[0], isA<MessageTextFlowSegment>());
        expect((segments[0] as MessageTextFlowSegment).text, 'before');
        expect(segments[1], isA<MessageBlockMarkdownSegment>());
        expect((segments[1] as MessageBlockMarkdownSegment).text, '1. item');
      },
    );

    test('preserves intentional blank line before a list', () {
      const String input = 'before\n\n- item';
      final List<MessageContentSegment> segments = parseMessageContentStructure(
        input,
        features,
      );
      expect(segments, hasLength(2));
      expect(segments[0], isA<MessageTextFlowSegment>());
      expect((segments[0] as MessageTextFlowSegment).text, 'before\n\n');
      expect(segments[1], isA<MessageBlockMarkdownSegment>());
      expect((segments[1] as MessageBlockMarkdownSegment).text, '- item');
    });

    test(
      'single line blockquote followed by non-blockquote lines splits correctly',
      () {
        const String input =
            '> This is a quoted line.\nThis is not a quoted line.\nThis is also not a quoted line.';
        final List<MessageContentSegment> segments =
            parseMessageContentStructure(input, features);

        expect(segments, hasLength(2));
        expect(segments[0], isA<MessageBlockMarkdownSegment>());
        expect(
          (segments[0] as MessageBlockMarkdownSegment).text,
          '> This is a quoted line.',
        );
        expect(segments[1], isA<MessageTextFlowSegment>());
        expect(
          (segments[1] as MessageTextFlowSegment).text,
          'This is not a quoted line.\nThis is also not a quoted line.',
        );
      },
    );

    test(
      'multiline blockquote followed by non-blockquote lines splits correctly',
      () {
        const String input =
            '> First quoted line.\n> Second quoted line.\nThis is not a quoted line.';
        final List<MessageContentSegment> segments =
            parseMessageContentStructure(input, features);

        expect(segments, hasLength(2));
        expect(segments[0], isA<MessageBlockMarkdownSegment>());
        expect(
          (segments[0] as MessageBlockMarkdownSegment).text,
          '> First quoted line.\n> Second quoted line.',
        );
        expect(segments[1], isA<MessageTextFlowSegment>());
        expect(
          (segments[1] as MessageTextFlowSegment).text,
          'This is not a quoted line.',
        );
      },
    );

    test('splits code block with inline closing fence from trailing text', () {
      const String input = 'before\n```dart\ncode```\nafter';
      final String normalized = preprocessFluxerMarkdown(input, features);
      final List<MessageContentSegment> segments = parseMessageContentStructure(
        normalized,
        features,
      );
      expect(segments, hasLength(3));
      expect(segments[0], isA<MessageTextFlowSegment>());
      expect((segments[0] as MessageTextFlowSegment).text, 'before');
      expect(segments[1], isA<MessageBlockMarkdownSegment>());
      expect(
        (segments[1] as MessageBlockMarkdownSegment).text,
        '```dart\ncode\n```',
      );
      expect(segments[2], isA<MessageTextFlowSegment>());
      expect((segments[2] as MessageTextFlowSegment).text, 'after');
    });

    test(
      'splits code block with inline closing fence without preprocessing',
      () {
        const String input = '```dart\ncode```\nafter';
        final List<MessageContentSegment> segments =
            parseMessageContentStructure(input, features);
        expect(segments, hasLength(2));
        expect(segments[0], isA<MessageBlockMarkdownSegment>());
        expect(
          (segments[0] as MessageBlockMarkdownSegment).text,
          '```dart\ncode```',
        );
        expect(segments[1], isA<MessageTextFlowSegment>());
        expect((segments[1] as MessageTextFlowSegment).text, 'after');
      },
    );

    test('routes table-only message to block markdown segment', () {
      const String input = '''
| Header | Value |
| --- | --- |
| A | 1 |''';
      final List<MessageContentSegment> segments = parseMessageContentStructure(
        input,
        features,
      );
      expect(segments, hasLength(1));
      expect(segments.first, isA<MessageBlockMarkdownSegment>());
      expect((segments.first as MessageBlockMarkdownSegment).text, input);
    });

    test('splits text before a table into text flow and block segments', () {
      const String input = '''
before

| Header | Value |
| --- | --- |
| A | 1 |''';
      final List<MessageContentSegment> segments = parseMessageContentStructure(
        input,
        features,
      );
      expect(segments, hasLength(2));
      expect(segments[0], isA<MessageTextFlowSegment>());
      expect((segments[0] as MessageTextFlowSegment).text, 'before\n\n');
      expect(segments[1], isA<MessageBlockMarkdownSegment>());
      expect((segments[1] as MessageBlockMarkdownSegment).text, '''
| Header | Value |
| --- | --- |
| A | 1 |''');
    });

    test('does not add trailing newline before an adjacent table', () {
      const String input = '''
before
| Header | Value |
| --- | --- |
| A | 1 |''';
      final List<MessageContentSegment> segments = parseMessageContentStructure(
        input,
        features,
      );
      expect(segments, hasLength(2));
      expect(segments[0], isA<MessageTextFlowSegment>());
      expect((segments[0] as MessageTextFlowSegment).text, 'before');
      expect(segments[1], isA<MessageBlockMarkdownSegment>());
    });

    test('keeps single-line pipe text in text flow when not a table', () {
      const String input = '| not | table |';
      final List<MessageContentSegment> segments = parseMessageContentStructure(
        input,
        features,
      );
      expect(segments, hasLength(1));
      expect(segments.first, isA<MessageTextFlowSegment>());
      expect((segments.first as MessageTextFlowSegment).text, input);
    });

    test('keeps inline pipe text in text flow when separator is missing', () {
      const String input = 'column one | column two';
      final List<MessageContentSegment> segments = parseMessageContentStructure(
        input,
        features,
      );
      expect(segments, hasLength(1));
      expect(segments.first, isA<MessageTextFlowSegment>());
      expect((segments.first as MessageTextFlowSegment).text, input);
    });
  });

  group('normalizeBlockquoteBarMarkdown', () {
    test('rewrites triple-quote opener to single blockquote marker', () {
      expect(normalizeBlockquoteBarMarkdown('>>> a'), '> a');
    });

    test('normalizes all lines of a multi-line bar', () {
      const String input = '>>> line one\nline two';
      expect(normalizeBlockquoteBarMarkdown(input), '> line one\n> line two');
    });

    test('normalizes blank lines in a multi-line bar', () {
      const String input = '>>> line one\n\nline two';
      expect(
        normalizeBlockquoteBarMarkdown(input),
        '> line one\n>\n> line two',
      );
    });

    test('preserves leading indentation on continuation lines', () {
      const String input = '  >>> indented\n  nested';
      expect(normalizeBlockquoteBarMarkdown(input), '  > indented\n  > nested');
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

    test('parsed multi-line bar blockquote has depth one', () {
      const String input = '>>> line one\n\nline two';
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
