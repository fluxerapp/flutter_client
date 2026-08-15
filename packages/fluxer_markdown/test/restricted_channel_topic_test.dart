import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_markdown/src/config/fluxer_markdown_config.dart';
import 'package:fluxer_markdown/src/contexts/fluxer_markdown_context.dart';
import 'package:fluxer_markdown/src/contexts/fluxer_markdown_features.dart';
import 'package:fluxer_markdown/src/parsing/message_line_parser.dart';
import 'package:fluxer_markdown/src/widgets/fluxer_markdown.dart';
import 'package:material_ui/material_ui.dart';

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
  final features = FluxerMarkdownFeatures.forContext(
    FluxerMarkdownContext.restrictedChannelTopic,
  );

  group('restricted channel topic', () {
    test('uses message line parsing', () {
      expect(
        usesMessageLineParsing(FluxerMarkdownContext.restrictedChannelTopic),
        isTrue,
      );
    });

    test('does not collapse to restricted inline preview', () {
      expect(features.isRestrictedInlinePreview, isFalse);
      expect(features.allowHeadings, isFalse);
      expect(features.allowLists, isFalse);
      expect(features.allowBlockquotes, isFalse);
    });

    testWidgets('preserves single newlines in topic text', (tester) async {
      const String input = 'first line\nsecond line';
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: SizedBox(
              width: 320,
              child: FluxerMarkdown(
                data: input,
                config: _testMarkdownConfig,
                context: FluxerMarkdownContext.restrictedChannelTopic,
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
      expect(renderedText, contains('first line'));
      expect(renderedText, contains('second line'));
      expect(renderedText, isNot('first line second line'));
    });
  });
}
