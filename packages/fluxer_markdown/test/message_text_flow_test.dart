import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_markdown/src/config/fluxer_markdown_config.dart';
import 'package:fluxer_markdown/src/contexts/fluxer_markdown_context.dart';
import 'package:fluxer_markdown/src/contexts/fluxer_markdown_features.dart';
import 'package:fluxer_markdown/src/renderers/fluxer_markdown_renderers.dart';
import 'package:fluxer_markdown/src/widgets/fluxer_markdown.dart';
import 'package:markdown/markdown.dart' as md;

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
  final FluxerMarkdownFeatures features = FluxerMarkdownFeatures.forContext(
    FluxerMarkdownContext.standardWithJumbo,
  );
  const TextStyle baseStyle = TextStyle(fontSize: 16, height: 1.375);

  group('buildFluxerMarkdownTextFlow', () {
    testWidgets('renders two blank lines at full line height', (tester) async {
      const String input = 'test line one\n\n\ntest line two';
      const double maxWidth = 320;
      late Size singleLineSize;
      late Size blankLineSize;
      await tester.pumpWidget(
        MaterialApp(
          home: MediaQuery(
            data: const MediaQueryData(textScaler: TextScaler.linear(1)),
            child: Scaffold(
              body: Center(
                child: SizedBox(
                  width: maxWidth,
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      return buildFluxerMarkdownTextFlow(
                        context: context,
                        text: 'test line one',
                        baseStyle: baseStyle,
                        config: _testMarkdownConfig,
                        features: features,
                        inlineDocument: md.Document(
                          encodeHtml: false,
                          withDefaultBlockSyntaxes: false,
                          blockSyntaxes: const [],
                        ),
                        selectable: false,
                        isDark: false,
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
        ),
      );
      singleLineSize = tester.getSize(find.byType(RichText));
      await tester.pumpWidget(
        MaterialApp(
          home: MediaQuery(
            data: const MediaQueryData(textScaler: TextScaler.linear(1)),
            child: Scaffold(
              body: Center(
                child: SizedBox(
                  width: maxWidth,
                  child: buildFluxerMarkdownTextFlow(
                    context: tester.element(find.byType(SizedBox)),
                    text: '\n',
                    baseStyle: baseStyle,
                    config: _testMarkdownConfig,
                    features: features,
                    inlineDocument: md.Document(
                      encodeHtml: false,
                      withDefaultBlockSyntaxes: false,
                      blockSyntaxes: const [],
                    ),
                    selectable: false,
                    isDark: false,
                  ),
                ),
              ),
            ),
          ),
        ),
      );
      blankLineSize = tester.getSize(find.byType(RichText));
      await tester.pumpWidget(
        MaterialApp(
          home: MediaQuery(
            data: const MediaQueryData(textScaler: TextScaler.linear(1)),
            child: Scaffold(
              body: Center(
                child: SizedBox(
                  width: maxWidth,
                  child: Builder(
                    builder: (context) {
                      return buildFluxerMarkdownTextFlow(
                        context: context,
                        text: input,
                        baseStyle: baseStyle,
                        config: _testMarkdownConfig,
                        features: features,
                        inlineDocument: md.Document(
                          encodeHtml: false,
                          withDefaultBlockSyntaxes: false,
                          blockSyntaxes: const [],
                        ),
                        selectable: false,
                        isDark: false,
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
        ),
      );
      final Size messageSize = tester.getSize(find.byType(RichText));
      // Rendering '\n' spans both blank lines between the two text lines, so the
      // block should be at least line one + both blank lines + line two tall.
      final double twoBlankLinesHeight = blankLineSize.height;
      final double expectedMinHeight =
          singleLineSize.height + twoBlankLinesHeight + singleLineSize.height;
      expect(twoBlankLinesHeight, greaterThan(8));
      expect(messageSize.height, greaterThanOrEqualTo(expectedMinHeight - 1));
    });
  });

  group('FluxerMarkdown widget', () {
    testWidgets('uses configured blockquote divider and text colors', (
      tester,
    ) async {
      const Color blockquoteBorderColor = Color(0xFF123456);
      const Color blockquoteTextColor = Color(0xFFABCDEF);
      const FluxerMarkdownConfig blockquoteConfig = FluxerMarkdownConfig(
        resolveEmojiShortcode: _noopEmojiShortcode,
        unicodeEmojiUrlBuilder: _noopUnicodeEmojiUrl,
        customEmojiUrlBuilder: _noopCustomEmojiUrl,
        blockquoteBorderColor: blockquoteBorderColor,
        blockquoteTextColor: blockquoteTextColor,
      );

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: SizedBox(
              width: 320,
              child: FluxerMarkdown(
                data: '> quoted text',
                config: blockquoteConfig,
                baseStyle: baseStyle,
              ),
            ),
          ),
        ),
      );

      final RichText quoteText = tester.widget<RichText>(
        find.text('quoted text', findRichText: true),
      );
      expect(quoteText.text.style?.color, blockquoteTextColor);

      final divider = find.byWidgetPredicate((widget) {
        if (widget is! Container) {
          return false;
        }
        final decoration = widget.decoration;
        return decoration is BoxDecoration &&
            decoration.color == blockquoteBorderColor;
      });
      expect(divider, findsOneWidget);
    });

    testWidgets('standard context renders blank lines in message text', (
      tester,
    ) async {
      const String input = 'test line one\n\n\ntest line two';
      await tester.pumpWidget(
        const MaterialApp(
          home: MediaQuery(
            data: MediaQueryData(textScaler: TextScaler.linear(1)),
            child: Scaffold(
              body: Center(
                child: SizedBox(
                  width: 320,
                  child: FluxerMarkdown(
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
      expect(
        find.textContaining('test line one', findRichText: true),
        findsOneWidget,
      );
      expect(
        find.textContaining('test line two', findRichText: true),
        findsOneWidget,
      );
      final RichText richText = tester.widget<RichText>(find.byType(RichText));
      final String renderedText = richText.text.toPlainText();
      expect(renderedText, 'test line one\n\n\ntest line two');
    });
  });
}
