import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_markdown/src/config/fluxer_markdown_config.dart';
import 'package:fluxer_markdown/src/widgets/fluxer_markdown.dart';
import 'package:material_ui/material_ui.dart';
import 'support/native_test_parser.dart';

const FluxerMarkdownConfig _testMarkdownConfig = FluxerMarkdownConfig(
  resolveEmojiShortcode: _noopEmojiShortcode,
  unicodeEmojiUrlBuilder: _noopUnicodeEmojiUrl,
  customEmojiUrlBuilder: _noopCustomEmojiUrl,
  alertBuilder: _testAlertBuilder,
  codeTextStyle: TextStyle(fontFamily: 'monospace', fontSize: 16),
);

String? _noopEmojiShortcode(String name) => null;

String? _noopUnicodeEmojiUrl(String unicode) => null;

String _noopCustomEmojiUrl({
  required String id,
  required bool animated,
  required int size,
}) => '';

Widget _testAlertBuilder(
  BuildContext context,
  FluxerAlertType type,
  Widget body,
  TextStyle baseStyle,
) {
  return Semantics(label: 'alert-${type.name}', child: body);
}

void main() {
  group('alert and subtext widgets', () {
    testWidgets('renders note alert type', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: FluxerMarkdown(
              astParser: parseTestMarkdownAst,
              data: '> [!NOTE]\n> Body text',
              config: _testMarkdownConfig,
            ),
          ),
        ),
      );
      expect(
        find.textContaining('Body text', findRichText: true),
        findsOneWidget,
      );
    });

    testWidgets('renders subtext with smaller style', (tester) async {
      const TextStyle baseStyle = TextStyle(fontSize: 16);
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: FluxerMarkdown(
              astParser: parseTestMarkdownAst,
              data: '-# smaller text',
              config: _testMarkdownConfig,
              baseStyle: baseStyle,
            ),
          ),
        ),
      );

      final RichText richText = tester.widget<RichText>(find.byType(RichText));
      expect(richText.text.style?.fontSize, closeTo(13, 0.5));
    });

    testWidgets('inline code in subtext scales with subtext size', (
      tester,
    ) async {
      const TextStyle baseStyle = TextStyle(fontSize: 16);
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: FluxerMarkdown(
              astParser: parseTestMarkdownAst,
              data: '-# subtext `with code text`',
              config: _testMarkdownConfig,
              baseStyle: baseStyle,
            ),
          ),
        ),
      );

      final RichText richText = tester.widget<RichText>(find.byType(RichText));
      const double subtextFontSize = 16 * 0.8125;
      expect(richText.text.style?.fontSize, closeTo(subtextFontSize, 0.01));

      double? inlineCodeFontSize;
      void visit(InlineSpan span) {
        if (span is TextSpan) {
          if (span.text == 'with code text') {
            inlineCodeFontSize = span.style?.fontSize;
          }
          for (final InlineSpan child
              in span.children ?? const <InlineSpan>[]) {
            visit(child);
          }
        }
      }

      visit(richText.text);
      expect(inlineCodeFontSize, closeTo(subtextFontSize * 0.85, 0.01));
    });

    testWidgets('preserves blank line between subtext and regular text', (
      tester,
    ) async {
      const String input = '-# small text\n\nregular text below';
      const TextStyle baseStyle = TextStyle(fontSize: 16, height: 1.375);
      await tester.pumpWidget(
        const MaterialApp(
          home: MediaQuery(
            data: MediaQueryData(textScaler: TextScaler.noScaling),
            child: Scaffold(
              body: Center(
                child: SizedBox(
                  width: 320,
                  child: FluxerMarkdown(
                    astParser: parseTestMarkdownAst,
                    data: input,
                    config: _testMarkdownConfig,
                    baseStyle: baseStyle,
                  ),
                ),
              ),
            ),
          ),
        ),
      );

      final RichText regularText = tester.widget<RichText>(
        find.textContaining('regular text below', findRichText: true),
      );
      expect(regularText.text.toPlainText(), 'regular text below');
      final double subtextBottom = tester
          .getBottomLeft(find.textContaining('small text', findRichText: true))
          .dy;
      final double regularTop = tester
          .getTopLeft(
            find.textContaining('regular text below', findRichText: true),
          )
          .dy;
      expect(regularTop, greaterThan(subtextBottom));
    });
  });
}
