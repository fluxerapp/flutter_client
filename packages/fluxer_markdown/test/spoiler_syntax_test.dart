import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_markdown/src/config/fluxer_markdown_config.dart';
import 'package:fluxer_markdown/src/contexts/fluxer_markdown_context.dart';
import 'package:fluxer_markdown/src/contexts/fluxer_markdown_features.dart';
import 'package:fluxer_markdown/src/renderers/fluxer_markdown_renderers.dart';
import 'package:fluxer_markdown/src/syntaxes/fluxer_markdown_syntaxes.dart';
import 'package:markdown/markdown.dart' as md;
import 'package:material_ui/material_ui.dart';

const String _customEmojiId = '1475037642086498372';
const String _customEmojiInput = '|| <:kekw:$_customEmojiId> ||';

const FluxerMarkdownConfig _testMarkdownConfig = FluxerMarkdownConfig(
  resolveEmojiShortcode: _resolveEmojiShortcode,
  unicodeEmojiUrlBuilder: _noopUnicodeEmojiUrl,
  customEmojiUrlBuilder: _noopCustomEmojiUrl,
);

String? _resolveEmojiShortcode(String name) {
  if (name == 'thumbsup') {
    return '\u{1F44D}';
  }
  return null;
}

String? _noopUnicodeEmojiUrl(String unicode) => null;

String _noopCustomEmojiUrl({
  required String id,
  required bool animated,
  required int size,
}) => 'https://example.com/emoji/$id';

md.Document _inlineDocument() => md.Document(
  encodeHtml: false,
  withDefaultBlockSyntaxes: false,
  blockSyntaxes: const [],
  inlineSyntaxes: [
    FluxerSpoilerSyntax(),
    FluxerUnicodeEmojiToneSyntax(_resolveEmojiShortcode),
    FluxerUnicodeEmojiSyntax(_resolveEmojiShortcode),
    FluxerCustomEmojiSyntax(),
  ],
);

md.Document _inlineDocumentWithAutolink() => md.Document(
  encodeHtml: false,
  withDefaultBlockSyntaxes: false,
  blockSyntaxes: const [],
  inlineSyntaxes: [
    FluxerSpoilerSyntax(),
    FluxerUnicodeEmojiToneSyntax(_resolveEmojiShortcode),
    FluxerUnicodeEmojiSyntax(_resolveEmojiShortcode),
    FluxerCustomEmojiSyntax(),
    FluxerAutolinkExtensionSyntax(),
  ],
);

const String _longSpoiledLink =
    '||https://example.com/very/long/path/that/should/not/wrap||';

const FluxerMarkdownConfig _revealedMarkdownConfig = FluxerMarkdownConfig(
  resolveEmojiShortcode: _resolveEmojiShortcode,
  unicodeEmojiUrlBuilder: _noopUnicodeEmojiUrl,
  customEmojiUrlBuilder: _noopCustomEmojiUrl,
  spoilersInitiallyRevealed: true,
);

List<md.Element> _spoilerNodes(List<md.Node> nodes) => nodes
    .whereType<md.Element>()
    .where((node) => node.tag == FluxerSpoilerSyntax.tag)
    .toList();

List<md.Element> _customEmojiNodes(List<md.Node> nodes) {
  final results = <md.Element>[];
  void visit(md.Node node) {
    if (node is md.Element) {
      if (node.tag == FluxerCustomEmojiSyntax.tag) {
        results.add(node);
      }
      for (final child in node.children ?? const <md.Node>[]) {
        visit(child);
      }
    }
  }

  for (final node in nodes) {
    visit(node);
  }
  return results;
}

List<md.Element> _unicodeEmojiNodes(List<md.Node> nodes) {
  final results = <md.Element>[];
  void visit(md.Node node) {
    if (node is md.Element) {
      if (node.tag == FluxerUnicodeEmojiToneSyntax.tag) {
        results.add(node);
      }
      for (final child in node.children ?? const <md.Node>[]) {
        visit(child);
      }
    }
  }

  for (final node in nodes) {
    visit(node);
  }
  return results;
}

void main() {
  group('FluxerSpoilerSyntax', () {
    test('parses custom emoji inside a spoiler', () {
      final nodes = _inlineDocument().parseInline(_customEmojiInput);
      final spoilers = _spoilerNodes(nodes);
      expect(spoilers, hasLength(1));
      final customEmoji = _customEmojiNodes(spoilers);
      expect(customEmoji, hasLength(1));
      expect(customEmoji.single.textContent, 'kekw');
      expect(customEmoji.single.attributes['id'], _customEmojiId);
    });

    test('parses unicode shortcode inside a spoiler', () {
      final nodes = _inlineDocument().parseInline('|| :thumbsup: ||');
      final spoilers = _spoilerNodes(nodes);
      expect(spoilers, hasLength(1));
      final unicodeEmoji = _unicodeEmojiNodes(spoilers);
      expect(unicodeEmoji, hasLength(1));
      expect(unicodeEmoji.single.textContent, 'thumbsup');
      expect(unicodeEmoji.single.attributes['surrogate'], '\u{1F44D}');
    });

    test('parses multiple inline elements inside a spoiler', () {
      final nodes = _inlineDocument().parseInline(
        '||hello <:kekw:$_customEmojiId> :thumbsup:||',
      );
      final spoilers = _spoilerNodes(nodes);
      expect(spoilers, hasLength(1));
      expect(_customEmojiNodes(spoilers), hasLength(1));
      expect(_unicodeEmojiNodes(spoilers), hasLength(1));
      final children = spoilers.single.children ?? const [];
      expect(children.whereType<md.Text>(), isNotEmpty);
    });
  });

  group('FluxerSpoiler rendering', () {
    final features = FluxerMarkdownFeatures.forContext(
      FluxerMarkdownContext.standardWithJumbo,
    );
    const baseStyle = TextStyle(fontSize: 16, height: 1.375);

    Future<void> pumpMarkdown(WidgetTester tester, String text) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Builder(
              builder: (context) => buildFluxerMarkdownTextFlow(
                context: context,
                text: text,
                baseStyle: baseStyle,
                config: _testMarkdownConfig,
                features: features,
                inlineDocument: _inlineDocument(),
                selectable: false,
                isDark: false,
              ),
            ),
          ),
        ),
      );
    }

    testWidgets('renders custom emoji inside a spoiler as a widget', (
      tester,
    ) async {
      await pumpMarkdown(tester, _customEmojiInput);
      expect(tester.takeException(), isNull);
      expect(find.byType(FluxerEmojiWidget), findsOneWidget);
      final List<String> renderedTexts = tester
          .widgetList<RichText>(find.byType(RichText))
          .map((RichText richText) => richText.text.toPlainText())
          .toList();
      expect(renderedTexts.any((String t) => t.contains('<:kekw:')), isFalse);
    });

    testWidgets('blocks taps to inner content until revealed', (tester) async {
      await pumpMarkdown(tester, _customEmojiInput);

      IgnorePointer contentBlocker() => tester.widget<IgnorePointer>(
        find
            .ancestor(
              of: find.byType(FluxerEmojiWidget),
              matching: find.byType(IgnorePointer),
            )
            .first,
      );

      expect(contentBlocker().ignoring, isTrue);

      await tester.tap(find.byType(FluxerEmojiWidget), warnIfMissed: false);
      await tester.pumpAndSettle();

      expect(contentBlocker().ignoring, isFalse);
    });

    testWidgets('does not blur hidden spoiler content', (tester) async {
      await pumpMarkdown(tester, _customEmojiInput);
      expect(find.byType(ImageFiltered), findsNothing);
      expect(find.byType(ColoredBox), findsWidgets);
    });

    testWidgets('covers hidden spoilers when no spoiler color is set', (
      tester,
    ) async {
      await pumpMarkdown(tester, '||secret||');
      expect(find.byType(ColoredBox), findsWidgets);
      expect(find.textContaining('secret', findRichText: true), findsOneWidget);
    });

    testWidgets('flattens revealed spoiler for single-line ellipsis', (
      tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: SizedBox(
              width: 200,
              child: Builder(
                builder: (context) => buildFluxerMarkdownTextFlow(
                  context: context,
                  text: _longSpoiledLink,
                  baseStyle: baseStyle,
                  config: _revealedMarkdownConfig,
                  features: FluxerMarkdownFeatures.forContext(
                    FluxerMarkdownContext.restrictedInlineReply,
                  ),
                  inlineDocument: _inlineDocumentWithAutolink(),
                  selectable: false,
                  isDark: false,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(tester.takeException(), isNull);
      expect(find.byType(GestureDetector), findsNothing);
      expect(find.byType(RichText), findsOneWidget);
      expect(tester.widget<RichText>(find.byType(RichText)).maxLines, 1);
    });

    testWidgets('constrains unrevealed spoiler for single-line ellipsis', (
      tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: SizedBox(
              width: 200,
              child: Builder(
                builder: (context) => buildFluxerMarkdownTextFlow(
                  context: context,
                  text: _longSpoiledLink,
                  baseStyle: baseStyle,
                  config: _testMarkdownConfig,
                  features: FluxerMarkdownFeatures.forContext(
                    FluxerMarkdownContext.restrictedInlineReply,
                  ),
                  inlineDocument: _inlineDocumentWithAutolink(),
                  selectable: false,
                  isDark: false,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(tester.takeException(), isNull);
      expect(find.byType(GestureDetector), findsOneWidget);
      final RichText spoilerRichText = tester.widget<RichText>(
        find.descendant(
          of: find.byType(GestureDetector),
          matching: find.byType(RichText),
        ),
      );
      expect(spoilerRichText.maxLines, 1);
    });

    testWidgets('keeps spoiler widget when maxLines is not set', (
      tester,
    ) async {
      await pumpMarkdown(tester, _longSpoiledLink);

      expect(find.byType(GestureDetector), findsOneWidget);
      expect(find.byType(RichText), findsNWidgets(2));
    });
  });
}
