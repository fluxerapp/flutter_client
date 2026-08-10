import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_markdown/src/contexts/fluxer_markdown_context.dart';
import 'package:fluxer_markdown/src/parsing/markdown_preprocessor.dart';
import 'support/markdown_parse_test_helper.dart';

void main() {
  group('context feature gating', () {
    test('restricted user bio disables role and everyone mentions', () {
      final features = MarkdownParseTestHelper.featuresFor(
        FluxerMarkdownContext.restrictedUserBio,
      );
      final nodes = MarkdownParseTestHelper.parseInline(
        '@everyone <@&123>',
        features,
      );
      expect(MarkdownParseTestHelper.collectText(nodes), '@everyone <@&123>');
    });

    test(
      'restricted inline reply escapes blockquotes and multiline quotes',
      () {
        final features = MarkdownParseTestHelper.featuresFor(
          FluxerMarkdownContext.restrictedInlineReply,
        );
        final processed = MarkdownParseTestHelper.preprocess(
          '> quote\n>>> quote',
          features,
        );
        expect(processed, '${r'\> quote'}\n${r'\>>> quote'}');
      },
    );

    test('restricted inline reply escapes headings and lists', () {
      final features = MarkdownParseTestHelper.featuresFor(
        FluxerMarkdownContext.restrictedInlineReply,
      );
      final processed = MarkdownParseTestHelper.preprocess(
        '# heading\n- item',
        features,
      );
      expect(processed, contains(r'\# heading'));
      expect(processed, contains(r'\- item'));
    });

    test('restricted embed description allows headings and alerts', () {
      final features = MarkdownParseTestHelper.featuresFor(
        FluxerMarkdownContext.restrictedEmbedDescription,
      );
      expect(features.allowHeadings, isTrue);
      expect(features.allowAlerts, isTrue);
      expect(features.allowTables, isFalse);
      final nodes = MarkdownParseTestHelper.parseBlock('# Title', features);
      expect(MarkdownParseTestHelper.containsTag(nodes, 'h1'), isTrue);
    });

    test('restricted embed description escapes table pipes', () {
      final features = MarkdownParseTestHelper.featuresFor(
        FluxerMarkdownContext.restrictedEmbedDescription,
      );
      final processed = MarkdownParseTestHelper.preprocess(
        '| a | b |',
        features,
      );
      expect(processed, r'\| a \| b \|');
    });

    test('restricted user bio escapes subtext', () {
      final features = MarkdownParseTestHelper.featuresFor(
        FluxerMarkdownContext.restrictedUserBio,
      );
      final segments = MarkdownParseTestHelper.parseSegments(
        '-# hidden',
        features,
      );
      expect(segments.whereType<FluxerSubtextSegment>(), isEmpty);
    });
  });
}
