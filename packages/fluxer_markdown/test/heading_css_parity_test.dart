import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_markdown/src/config/fluxer_markdown_config.dart';
import 'package:fluxer_markdown/src/contexts/fluxer_markdown_context.dart';
import 'package:fluxer_markdown/src/utils/markup_spacing.dart';
import 'package:fluxer_markdown/src/widgets/fluxer_markdown.dart';
import 'package:material_ui/material_ui.dart';
import 'support/native_test_parser.dart';

const FluxerMarkdownConfig _testMarkdownConfig = FluxerMarkdownConfig(
  resolveEmojiShortcode: _noopEmojiShortcode,
  unicodeEmojiUrlBuilder: _noopUnicodeEmojiUrl,
  customEmojiUrlBuilder: _noopCustomEmojiUrl,
);
const TextStyle _codeTextStyle = TextStyle(
  fontFamily: 'monospace',
  fontSize: 16,
);
const FluxerMarkdownConfig _headingMarkdownConfig = FluxerMarkdownConfig(
  resolveEmojiShortcode: _noopEmojiShortcode,
  unicodeEmojiUrlBuilder: _noopUnicodeEmojiUrl,
  customEmojiUrlBuilder: _noopCustomEmojiUrl,
  codeTextStyle: _codeTextStyle,
);
const TextStyle _baseStyle = TextStyle(fontSize: 16, height: 1.375);

String? _noopEmojiShortcode(String name) => null;

String? _noopUnicodeEmojiUrl(String unicode) => null;

String _noopCustomEmojiUrl({
  required String id,
  required bool animated,
  required int size,
}) => '';

Future<void> _pumpMarkdown(
  WidgetTester tester,
  String data, {
  FluxerMarkdownContext context = FluxerMarkdownContext.standardWithJumbo,
}) async {
  await tester.pumpWidget(
    MaterialApp(
      home: Scaffold(
        body: SizedBox(
          width: 320,
          child: FluxerMarkdown(
            astParser: parseTestMarkdownAst,
            data: data,
            config: _testMarkdownConfig,
            baseStyle: _baseStyle,
            context: context,
          ),
        ),
      ),
    ),
  );
  await tester.pumpAndSettle();
}

EdgeInsets _headingPadding(WidgetTester tester, String headingText) {
  final Finder headingFinder = find.textContaining(
    headingText,
    findRichText: true,
  );
  expect(headingFinder, findsOneWidget);
  final Finder paddingFinder = find.ancestor(
    of: headingFinder,
    matching: find.byWidgetPredicate(
      (Widget widget) =>
          widget is Padding &&
          widget.padding is EdgeInsets &&
          (widget.padding as EdgeInsets).top > 0,
    ),
  );
  expect(paddingFinder, findsOneWidget);
  return tester.widget<Padding>(paddingFinder).padding as EdgeInsets;
}

double? _textSpanFontSize(InlineSpan root, String text) {
  double? result;
  void visit(InlineSpan span) {
    if (span is TextSpan) {
      if (span.text == text) {
        result = span.style?.fontSize;
      }
      for (final InlineSpan child in span.children ?? const <InlineSpan>[]) {
        visit(child);
      }
    }
  }

  visit(root);
  return result;
}

void main() {
  group('heading css parity', () {
    testWidgets('first heading uses reduced top margin', (tester) async {
      await _pumpMarkdown(tester, '# First heading');
      final EdgeInsets padding = _headingPadding(tester, 'First heading');
      expect(padding.top, FluxerMarkupSpacing.headingTopFirst);
      expect(padding.bottom, FluxerMarkupSpacing.headingBottom);
    });

    testWidgets('subsequent heading uses standard top margin', (tester) async {
      await _pumpMarkdown(tester, '# First\n\n# Second');
      final EdgeInsets padding = _headingPadding(tester, 'Second');
      expect(padding.top, FluxerMarkupSpacing.headingTop);
      expect(padding.bottom, FluxerMarkupSpacing.headingBottom);
    });

    testWidgets('heading levels use web em font sizes', (tester) async {
      await _pumpMarkdown(
        tester,
        '# H1\n## H2\n### H3\n#### H4',
        context: FluxerMarkdownContext.restrictedEmbedDescription,
      );

      expect(
        tester
            .widget<RichText>(find.textContaining('H1', findRichText: true))
            .text
            .style
            ?.fontSize,
        16 * 1.375,
      );
      expect(
        tester
            .widget<RichText>(find.textContaining('H2', findRichText: true))
            .text
            .style
            ?.fontSize,
        16 * 1.25,
      );
      expect(
        tester
            .widget<RichText>(find.textContaining('H3', findRichText: true))
            .text
            .style
            ?.fontSize,
        16 * 1.125,
      );
      expect(
        tester
            .widget<RichText>(find.textContaining('H4', findRichText: true))
            .text
            .style
            ?.fontSize,
        16,
      );
    });

    testWidgets('headings use weight 600', (tester) async {
      await _pumpMarkdown(tester, '# Bold heading');
      final RichText richText = tester.widget<RichText>(
        find.textContaining('Bold heading', findRichText: true),
      );
      expect(richText.text.style?.fontWeight, FontWeight.w600);
    });

    testWidgets('inline code in headings scales with heading size', (
      tester,
    ) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: SizedBox(
              width: 320,
              child: FluxerMarkdown(
                astParser: parseTestMarkdownAst,
                data: '# header 1 `with code text`',
                config: _headingMarkdownConfig,
                baseStyle: _baseStyle,
              ),
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();

      final RichText richText = tester.widget<RichText>(
        find.textContaining('header 1', findRichText: true),
      );
      const double headingFontSize = 16 * 1.375;
      expect(richText.text.style?.fontSize, headingFontSize);
      expect(
        _textSpanFontSize(richText.text, 'with code text'),
        closeTo(headingFontSize * 0.85, 0.01),
      );
    });
  });
}
