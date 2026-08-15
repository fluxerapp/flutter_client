import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_markdown/src/config/fluxer_markdown_config.dart';
import 'package:fluxer_markdown/src/contexts/fluxer_markdown_context.dart';
import 'package:fluxer_markdown/src/parsing/markdown_preprocessor.dart';
import 'package:fluxer_markdown/src/renderers/fluxer_markdown_renderers.dart';
import 'package:fluxer_markdown/src/widgets/fluxer_markdown.dart';
import 'package:material_ui/material_ui.dart';

import 'support/markdown_parse_test_helper.dart';

const FluxerMarkdownConfig _testMarkdownConfig = FluxerMarkdownConfig(
  resolveEmojiShortcode: _resolveEmojiShortcode,
  unicodeEmojiUrlBuilder: _noopUnicodeEmojiUrl,
  customEmojiUrlBuilder: _noopCustomEmojiUrl,
);

String? _resolveEmojiShortcode(String name) => null;

String? _noopUnicodeEmojiUrl(String unicode) => null;

String _noopCustomEmojiUrl({
  required String id,
  required bool animated,
  required int size,
}) => 'https://example.com/emoji/$id';

void main() {
  final features = MarkdownParseTestHelper.featuresFor(
    FluxerMarkdownContext.restrictedInlineReply,
  );

  group('restricted inline reply', () {
    test('matches web parser flags for code blocks and subtext', () {
      expect(features.allowCodeBlocks, isTrue);
      expect(features.allowSubtext, isTrue);
      expect(features.allowBlockquotes, isFalse);
      expect(features.allowLists, isFalse);
      expect(features.isRestrictedInlinePreview, isTrue);
    });

    test('parses fenced code blocks instead of escaping them', () {
      const input = '```\nsecret code\n```';
      final processed = MarkdownParseTestHelper.preprocess(input, features);
      expect(processed, input);
      final segments = MarkdownParseTestHelper.parseSegments(
        processed,
        features,
      );
      expect(segments.whereType<FluxerTextSegment>(), isNotEmpty);
    });

    test('extracts subtext segments', () {
      final segments = MarkdownParseTestHelper.parseSegments(
        'hello\n-# small note',
        features,
      );
      expect(segments.whereType<FluxerSubtextSegment>(), hasLength(1));
    });

    testWidgets('renders fenced code blocks as inline code in previews', (
      tester,
    ) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: SizedBox(
              width: 240,
              child: FluxerMarkdown(
                data: '```\nsecret code\n```',
                config: _testMarkdownConfig,
                context: FluxerMarkdownContext.restrictedInlineReply,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();

      final String renderedText = tester
          .widgetList<RichText>(find.byType(RichText))
          .map((RichText richText) => richText.text.toPlainText())
          .join();
      expect(renderedText, contains('secret code'));
      expect(find.byType(FluxerCodeBlockWidget), findsNothing);
    });

    testWidgets('renders subtext without smaller styling', (tester) async {
      const double baseFontSize = 14;
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: SizedBox(
              width: 240,
              child: FluxerMarkdown(
                data: '-# preview note',
                config: _testMarkdownConfig,
                context: FluxerMarkdownContext.restrictedInlineReply,
                baseStyle: TextStyle(fontSize: baseFontSize),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();

      final RichText richText = tester.widget<RichText>(find.byType(RichText));
      final TextStyle style = richText.text.style!;
      expect(style.fontSize, baseFontSize);
      expect(richText.text.toPlainText(), contains('preview note'));
    });
  });
}
