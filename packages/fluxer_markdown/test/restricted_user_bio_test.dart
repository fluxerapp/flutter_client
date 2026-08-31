import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_markdown/src/config/fluxer_markdown_config.dart';
import 'package:fluxer_markdown/src/contexts/fluxer_markdown_context.dart';
import 'package:fluxer_markdown/src/contexts/fluxer_markdown_features.dart';
import 'package:fluxer_markdown/src/widgets/fluxer_markdown.dart';
import 'package:material_ui/material_ui.dart';

import 'support/native_test_parser.dart';

const FluxerMarkdownConfig _testMarkdownConfig = FluxerMarkdownConfig(
  resolveEmojiShortcode: _noopEmojiShortcode,
  unicodeEmojiUrlBuilder: _noopUnicodeEmojiUrl,
  customEmojiUrlBuilder: _noopCustomEmojiUrl,
);

String? _noopEmojiShortcode(String name) => null;

String? _noopUnicodeEmojiUrl(String unicode) => null;

String _noopCustomEmojiUrl({
  required String id,
  required bool animated,
  required int size,
}) => '';

void main() {
  final features = FluxerMarkdownFeatures.forContext(
    FluxerMarkdownContext.restrictedUserBio,
  );

  group('restricted user bio', () {
    test('matches web RESTRICTED_USER_BIO parser flags', () {
      expect(features.allowSpoilers, isTrue);
      expect(features.allowLists, isTrue);
      expect(features.allowBlockquotes, isTrue);
      expect(features.allowMultilineBlockquotes, isTrue);
      expect(features.allowUserMentions, isTrue);
      expect(features.allowChannelMentions, isTrue);
      expect(features.allowCommandMentions, isTrue);
      expect(features.allowGuildNavigations, isTrue);

      expect(features.allowHeadings, isFalse);
      expect(features.allowCodeBlocks, isFalse);
      expect(features.allowRoleMentions, isFalse);
      expect(features.allowEveryoneMentions, isFalse);
      expect(features.allowSubtext, isFalse);
      expect(features.allowTables, isFalse);
      expect(features.allowAlerts, isFalse);
      expect(features.allowJumboEmoji, isFalse);
      expect(features.isRestrictedInlinePreview, isFalse);
    });

    test('does not parse role or everyone mentions', () {
      final nodes = parseTestMarkdownAst('@everyone <@&123>', features);
      expect(containsMarkdownTag(nodes, 'mention-role'), isFalse);
      expect(containsMarkdownTag(nodes, 'mention-everyone'), isFalse);
      expect(collectMarkdownText(nodes), '@everyone <@&123>');
    });

    test('keeps headings, subtext, and fenced code blocks literal', () {
      final nodes = parseTestMarkdownAst(
        '# heading\n-# note\n```\ncode\n```',
        features,
      );
      expect(containsMarkdownTag(nodes, 'h1'), isFalse);
      expect(containsMarkdownTag(nodes, 'subtext'), isFalse);
      expect(containsMarkdownTag(nodes, 'pre'), isFalse);
      final String text = collectMarkdownText(nodes);
      expect(text, contains('# heading'));
      expect(text, contains('-# note'));
      expect(text, contains('```'));
    });

    test('keeps blockquotes and lists enabled', () {
      final nodes = parseTestMarkdownAst('> quote\n- item', features);
      expect(containsMarkdownTag(nodes, 'blockquote'), isTrue);
      expect(containsMarkdownTag(nodes, 'ul'), isTrue);
    });

    test('parses user mentions and inline spoilers', () {
      final nodes = parseTestMarkdownAst('<@123> ||secret||', features);
      expect(containsMarkdownTag(nodes, 'mention-user'), isTrue);
      expect(containsMarkdownTag(nodes, 'spoiler'), isTrue);
    });

    testWidgets('renders blockquotes and lists as block content', (
      tester,
    ) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: FluxerMarkdown(
              astParser: parseTestMarkdownAst,
              data: '> quote\n- item',
              config: _testMarkdownConfig,
              context: FluxerMarkdownContext.restrictedUserBio,
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();

      final String renderedText = tester
          .widgetList<RichText>(find.byType(RichText))
          .map((RichText richText) => richText.text.toPlainText())
          .join(' ');
      expect(renderedText, contains('quote'));
      expect(renderedText, contains('item'));
    });
  });
}
