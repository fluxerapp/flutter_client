import 'package:flutter/rendering.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_markdown/src/config/fluxer_markdown_config.dart';
import 'package:fluxer_markdown/src/contexts/fluxer_markdown_context.dart';
import 'package:fluxer_markdown/src/contexts/fluxer_markdown_features.dart';
import 'package:fluxer_markdown/src/renderers/fluxer_markdown_element_tags.dart';
import 'package:fluxer_markdown/src/renderers/fluxer_markdown_renderers.dart';
import 'package:fluxer_markdown/src/widgets/fluxer_markdown.dart';
import 'package:markdown/markdown.dart' as md;
import 'package:material_ui/material_ui.dart';

import 'support/native_test_parser.dart';

const String _customEmojiId = '1475037642086498372';
const String _customEmojiInput = '|| <:kekw:$_customEmojiId> ||';

const String _longSpoiledLink =
    '||https://example.com/very/long/path/that/should/not/wrap||';

const TextStyle _baseStyle = TextStyle(fontSize: 16, height: 1.375);

const FluxerMarkdownConfig _testMarkdownConfig = FluxerMarkdownConfig(
  resolveEmojiShortcode: _resolveEmojiShortcode,
  unicodeEmojiUrlBuilder: _noopUnicodeEmojiUrl,
  customEmojiUrlBuilder: _noopCustomEmojiUrl,
);

const FluxerMarkdownConfig _revealedMarkdownConfig = FluxerMarkdownConfig(
  resolveEmojiShortcode: _resolveEmojiShortcode,
  unicodeEmojiUrlBuilder: _noopUnicodeEmojiUrl,
  customEmojiUrlBuilder: _noopCustomEmojiUrl,
  spoilersInitiallyRevealed: true,
);

String? _resolveEmojiShortcode(String name) => null;

String? _noopUnicodeEmojiUrl(String unicode) => null;

String _noopCustomEmojiUrl({
  required String id,
  required bool animated,
  required int size,
}) => 'https://example.com/emoji/$id';

void main() {
  final FluxerMarkdownFeatures features = FluxerMarkdownFeatures.forContext(
    FluxerMarkdownContext.standardWithJumbo,
  );

  group('spoiler parsing', () {
    test('parses custom emoji inside a spoiler', () {
      final List<md.Node> nodes = parseTestMarkdownAst(
        _customEmojiInput,
        features,
      );
      final md.Element? spoiler = findMarkdownTag(
        nodes,
        FluxerMarkdownElementTags.spoiler,
      );
      expect(spoiler, isNotNull);
      final md.Element? customEmoji = findMarkdownTag([
        spoiler!,
      ], FluxerMarkdownElementTags.emojiCustom);
      expect(customEmoji, isNotNull);
      expect(customEmoji!.textContent, 'kekw');
      expect(customEmoji.attributes['id'], _customEmojiId);
    });

    test('parses unicode shortcode inside a spoiler', () {
      final List<md.Node> nodes = parseTestMarkdownAst(
        '|| :thumbsup: ||',
        features,
      );
      final md.Element? spoiler = findMarkdownTag(
        nodes,
        FluxerMarkdownElementTags.spoiler,
      );
      expect(spoiler, isNotNull);
      final md.Element? unicodeEmoji = findMarkdownTag([
        spoiler!,
      ], FluxerMarkdownElementTags.emojiUnicode);
      expect(unicodeEmoji, isNotNull);
      expect(unicodeEmoji!.textContent, 'thumbsup');
      expect(unicodeEmoji.attributes['surrogate'], '\u{1F44D}');
    });

    test('parses multiple inline elements inside a spoiler', () {
      final List<md.Node> nodes = parseTestMarkdownAst(
        '||hello <:kekw:$_customEmojiId> :thumbsup:||',
        features,
      );
      final md.Element? spoiler = findMarkdownTag(
        nodes,
        FluxerMarkdownElementTags.spoiler,
      );
      expect(spoiler, isNotNull);
      expect(
        containsMarkdownTag([spoiler!], FluxerMarkdownElementTags.emojiCustom),
        isTrue,
      );
      expect(
        containsMarkdownTag([spoiler], FluxerMarkdownElementTags.emojiUnicode),
        isTrue,
      );
      expect(spoiler.children!.whereType<md.Text>(), isNotEmpty);
      expect(collectMarkdownText([spoiler]), contains('hello'));
    });
  });

  group('spoiler rendering', () {
    Future<void> pumpMarkdown(
      WidgetTester tester,
      String text, {
      FluxerMarkdownConfig config = _testMarkdownConfig,
      FluxerMarkdownContext context = FluxerMarkdownContext.standardWithJumbo,
      double? width,
      int? maxLines,
      TextOverflow? overflow,
    }) async {
      final Widget markdown = FluxerMarkdown(
        astParser: parseTestMarkdownAst,
        data: text,
        config: config,
        context: context,
        baseStyle: _baseStyle,
        maxLines: maxLines,
        overflow: overflow,
      );
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: width == null
                ? markdown
                : SizedBox(width: width, child: markdown),
          ),
        ),
      );
    }

    testWidgets('renders custom emoji inside a revealed spoiler as a widget', (
      tester,
    ) async {
      await pumpMarkdown(
        tester,
        _customEmojiInput,
        config: _revealedMarkdownConfig,
      );
      expect(tester.takeException(), isNull);
      expect(find.byType(FluxerEmojiWidget), findsOneWidget);
      final List<String> renderedTexts = tester
          .widgetList<RichText>(find.byType(RichText))
          .map((RichText richText) => richText.text.toPlainText())
          .toList();
      expect(renderedTexts.any((String t) => t.contains('<:kekw:')), isFalse);
    });

    testWidgets('conceals custom emoji inside a hidden spoiler', (
      tester,
    ) async {
      await pumpMarkdown(tester, _customEmojiInput);
      expect(find.byType(FluxerEmojiWidget), findsNothing);
      expect(
        find.descendant(
          of: find.byType(GestureDetector),
          matching: find.byType(ColoredBox),
        ),
        findsOneWidget,
      );
    });

    testWidgets('blocks taps to inner content until revealed', (tester) async {
      await pumpMarkdown(tester, _customEmojiInput);

      expect(find.byType(FluxerEmojiWidget), findsNothing);

      await tester.tapAt(tester.getCenter(find.byType(RichText)));
      await tester.pumpAndSettle();

      expect(find.byType(FluxerEmojiWidget), findsOneWidget);
    });

    testWidgets(
      'hidden spoiler keeps the same layout metrics as surrounding text',
      (tester) async {
        await pumpMarkdown(tester, 'before ||spoiler|| after');
        final RenderParagraph paragraph = tester.renderObject<RenderParagraph>(
          find.byType(RichText),
        );
        final String plainText = tester
            .widget<RichText>(find.byType(RichText))
            .text
            .toPlainText();
        double measureHeight(String char) {
          final int idx = plainText.indexOf(char);
          return paragraph
              .getBoxesForSelection(
                TextSelection(baseOffset: idx, extentOffset: idx + 1),
              )
              .first
              .toRect()
              .height;
        }

        expect(measureHeight('b'), measureHeight('s'));
        expect(measureHeight('a'), measureHeight('s'));
      },
    );

    testWidgets('does not blur hidden spoiler content', (tester) async {
      await pumpMarkdown(tester, _customEmojiInput);
      expect(find.byType(ImageFiltered), findsNothing);
    });

    testWidgets('covers hidden spoilers when no spoiler color is set', (
      tester,
    ) async {
      await pumpMarkdown(tester, '||secret||');
      expect(find.textContaining('secret', findRichText: true), findsOneWidget);
      final RichText richText = tester.widget<RichText>(find.byType(RichText));
      final TextSpan rootSpan = richText.text as TextSpan;
      final TextSpan spoilerSpan = rootSpan.children!.single as TextSpan;
      final TextSpan leafSpan = spoilerSpan.children!.single as TextSpan;
      expect(leafSpan.style?.color, const Color(0x00000000));
      expect(leafSpan.style?.background?.color, isNotNull);
    });

    testWidgets('conceals formatted text inside hidden spoiler', (
      tester,
    ) async {
      await pumpMarkdown(tester, '||**secret**||');
      final RichText richText = tester.widget<RichText>(find.byType(RichText));
      final TextSpan rootSpan = richText.text as TextSpan;
      final TextSpan spoilerSpan = rootSpan.children!.single as TextSpan;
      final TextSpan boldSpan = spoilerSpan.children!.single as TextSpan;
      expect(boldSpan.style?.color, const Color(0x00000000));
      expect(boldSpan.style?.background?.color, isNotNull);
      expect(boldSpan.style?.fontWeight, FontWeight.w700);
    });

    testWidgets('reveals duplicate spoilers independently', (tester) async {
      await pumpMarkdown(tester, '||same|| mid ||same||');
      final RenderParagraph paragraph = tester.renderObject<RenderParagraph>(
        find.byType(RichText),
      );
      final String plainText = tester
          .widget<RichText>(find.byType(RichText))
          .text
          .toPlainText();
      final TextSelection firstSelection = TextSelection(
        baseOffset: plainText.indexOf('same'),
        extentOffset: plainText.indexOf('same') + 'same'.length,
      );
      await tester.tapAt(
        paragraph.getBoxesForSelection(firstSelection).first.toRect().center,
      );
      await tester.pumpAndSettle();

      final TextSpan rootSpan =
          tester.widget<RichText>(find.byType(RichText)).text as TextSpan;
      final TextSpan firstSpoiler = rootSpan.children![0] as TextSpan;
      final TextSpan secondSpoiler = rootSpan.children![2] as TextSpan;
      expect(firstSpoiler.style?.background, isNull);
      final TextSpan firstLeaf = firstSpoiler.children!.single as TextSpan;
      expect(firstLeaf.style?.color, isNot(const Color(0x00000000)));
      expect(secondSpoiler.style?.background, isNotNull);
      final TextSpan secondLeaf = secondSpoiler.children!.single as TextSpan;
      expect(secondLeaf.style?.color, const Color(0x00000000));
      expect(secondLeaf.style?.background?.color, isNotNull);
    });

    testWidgets('flattens revealed spoiler for single-line ellipsis', (
      tester,
    ) async {
      await pumpMarkdown(
        tester,
        _longSpoiledLink,
        config: _revealedMarkdownConfig,
        context: FluxerMarkdownContext.restrictedInlineReply,
        width: 200,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
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
      await pumpMarkdown(
        tester,
        _longSpoiledLink,
        context: FluxerMarkdownContext.restrictedInlineReply,
        width: 200,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
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

    testWidgets('keeps spoiler inline when maxLines is not set', (
      tester,
    ) async {
      await pumpMarkdown(tester, _longSpoiledLink);

      expect(find.byType(GestureDetector), findsNothing);
      expect(find.byType(RichText), findsOneWidget);
    });

    testWidgets('keeps trailing text on the same line after wrapped spoiler', (
      tester,
    ) async {
      await pumpMarkdown(
        tester,
        '||this is a longer spoiler that should wrap|| ok',
        config: _revealedMarkdownConfig,
        width: 120,
      );
      await tester.pumpAndSettle();

      final RichText richText = tester.widget<RichText>(find.byType(RichText));
      final String plainText = richText.text.toPlainText();
      final RenderParagraph paragraph = tester.renderObject<RenderParagraph>(
        find.byType(RichText),
      );
      final TextSelection trailingSelection = TextSelection(
        baseOffset: plainText.indexOf('ok'),
        extentOffset: plainText.indexOf('ok') + 'ok'.length,
      );
      final TextSelection wrapSelection = TextSelection(
        baseOffset: plainText.indexOf('wrap'),
        extentOffset: plainText.indexOf('wrap') + 'wrap'.length,
      );
      final Rect trailingRect = paragraph
          .getBoxesForSelection(trailingSelection)
          .first
          .toRect();
      final Rect wrapRect = paragraph
          .getBoxesForSelection(wrapSelection)
          .first
          .toRect();
      expect(trailingRect.top, closeTo(wrapRect.top, 1));
      expect(trailingRect.left, greaterThan(wrapRect.left));
    });
  });
}
