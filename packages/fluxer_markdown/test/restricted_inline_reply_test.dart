import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_markdown/src/config/fluxer_markdown_config.dart';
import 'package:fluxer_markdown/src/contexts/fluxer_markdown_context.dart';
import 'package:fluxer_markdown/src/contexts/fluxer_markdown_features.dart';
import 'package:fluxer_markdown/src/renderers/fluxer_markdown_renderers.dart';
import 'package:fluxer_markdown/src/utils/bounded_text.dart';
import 'package:fluxer_markdown/src/widgets/fluxer_markdown.dart';
import 'package:material_ui/material_ui.dart';

import 'support/native_test_parser.dart';

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
      final nodes = parseTestMarkdownAst(input, features);
      expect(containsMarkdownTag(nodes, 'pre'), isTrue);
      expect(collectMarkdownText(nodes), contains('secret code'));
    });

    test('extracts subtext segments', () {
      final nodes = parseTestMarkdownAst('hello\n-# small note', features);
      expect(containsMarkdownTag(nodes, 'subtext'), isTrue);
      expect(
        collectMarkdownText([findMarkdownTag(nodes, 'subtext')!]),
        'small note',
      );
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
                astParser: parseTestMarkdownAst,
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
                astParser: parseTestMarkdownAst,
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

    testWidgets('sizes emoji to the preview line box', (tester) async {
      const double fontSize = 14;
      const double lineHeight = 18 / fontSize;
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: SizedBox(
              width: 240,
              height: 20,
              child: FluxerMarkdown(
                astParser: parseTestMarkdownAst,
                data: '<:a:111111111111111111>',
                config: _testMarkdownConfig,
                context: FluxerMarkdownContext.restrictedInlineReply,
                baseStyle: TextStyle(fontSize: fontSize, height: lineHeight),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ),
      );
      await tester.pump();

      final FluxerEmojiWidget emoji = tester.widget<FluxerEmojiWidget>(
        find.byType(FluxerEmojiWidget),
      );
      expect(emoji.fitToLineHeight, isTrue);
      expect(emoji.size, closeTo(18, 0.01));
      expect(
        tester.getSize(find.byType(FluxerEmojiWidget)).height,
        closeTo(18, 1),
      );
    });

    testWidgets('keeps mention widgets taller than the text line', (
      tester,
    ) async {
      const Key mentionKey = Key('reply-mention');
      final FluxerMarkdownConfig config = FluxerMarkdownConfig(
        resolveEmojiShortcode: _resolveEmojiShortcode,
        unicodeEmojiUrlBuilder: _noopUnicodeEmojiUrl,
        customEmojiUrlBuilder: _noopCustomEmojiUrl,
        userMentionBuilder: (_, _, _) =>
            const SizedBox(key: mentionKey, width: 48, height: 24),
      );
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: SizedBox(
              width: 240,
              child: FluxerMarkdown(
                astParser: parseTestMarkdownAst,
                data: '<@123> hello',
                config: config,
                context: FluxerMarkdownContext.restrictedInlineReply,
                baseStyle: const TextStyle(fontSize: 14, height: 18 / 14),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ),
      );
      await tester.pump();

      expect(find.byKey(mentionKey), findsOneWidget);
      expect(tester.getSize(find.byKey(mentionKey)).height, 24);
      final RichText richText = tester.widget<RichText>(find.byType(RichText));
      expect(richText.strutStyle?.forceStrutHeight, isFalse);
      expect(
        tester.getSize(find.byType(FluxerBoundedTextClip).first).height,
        greaterThanOrEqualTo(24),
      );
    });

    testWidgets('renders command mentions through the mention builder', (
      tester,
    ) async {
      const Key commandKey = Key('reply-command');
      final FluxerMarkdownConfig config = FluxerMarkdownConfig(
        resolveEmojiShortcode: _resolveEmojiShortcode,
        unicodeEmojiUrlBuilder: _noopUnicodeEmojiUrl,
        customEmojiUrlBuilder: _noopCustomEmojiUrl,
        commandMentionBuilder: (_, command, _, _) =>
            Text('/$command', key: commandKey),
      );
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: SizedBox(
              width: 240,
              child: FluxerMarkdown(
                astParser: parseTestMarkdownAst,
                data: '</ban user:99>',
                config: config,
                context: FluxerMarkdownContext.restrictedInlineReply,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ),
      );
      await tester.pump();

      expect(find.byKey(commandKey), findsOneWidget);
      expect(find.text('/ban user'), findsOneWidget);
    });
  });
}
