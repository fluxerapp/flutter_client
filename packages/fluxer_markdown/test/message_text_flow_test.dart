import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
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
final RegExp _internalFluxerLinkPattern = RegExp(
  r'https://web\.fluxer\.app/channels/\d+/\d+/\d+',
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
            data: const MediaQueryData(textScaler: TextScaler.noScaling),
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
            data: const MediaQueryData(textScaler: TextScaler.noScaling),
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
            data: const MediaQueryData(textScaler: TextScaler.noScaling),
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
    testWidgets('restricted embed descriptions automatically link URLs', (
      tester,
    ) async {
      const String url = 'https://example.com/image.png';
      String? tappedHref;
      final FluxerMarkdownConfig config = FluxerMarkdownConfig(
        resolveEmojiShortcode: _noopEmojiShortcode,
        unicodeEmojiUrlBuilder: _noopUnicodeEmojiUrl,
        customEmojiUrlBuilder: _noopCustomEmojiUrl,
        onTapLink: (_, href) async {
          tappedHref = href;
        },
      );

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: FluxerMarkdown(
              data: 'Mobile: $url',
              config: config,
              context: FluxerMarkdownContext.restrictedEmbedDescription,
            ),
          ),
        ),
      );

      await tester.tapOnText(find.textRange.ofSubstring(url));

      expect(tappedHref, url);
    });

    testWidgets('blank markdown link labels render as plain text', (
      tester,
    ) async {
      const String url = 'https://fluxer.app';
      const String input = '[]($url)';
      String? tappedHref;
      final FluxerMarkdownConfig config = FluxerMarkdownConfig(
        resolveEmojiShortcode: _noopEmojiShortcode,
        unicodeEmojiUrlBuilder: _noopUnicodeEmojiUrl,
        customEmojiUrlBuilder: _noopCustomEmojiUrl,
        onTapLink: (_, href) async {
          tappedHref = href;
        },
      );

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: FluxerMarkdown(data: input, config: config),
          ),
        ),
      );

      expect(find.text(input, findRichText: true), findsOneWidget);

      await tester.tapOnText(find.textRange.ofSubstring(input));

      expect(tappedHref, isNull);
    });

    testWidgets('whitespace-only markdown link labels render as plain text', (
      tester,
    ) async {
      const String url = 'https://fluxer.app';
      const String input = '[     ]($url)';
      String? tappedHref;
      final FluxerMarkdownConfig config = FluxerMarkdownConfig(
        resolveEmojiShortcode: _noopEmojiShortcode,
        unicodeEmojiUrlBuilder: _noopUnicodeEmojiUrl,
        customEmojiUrlBuilder: _noopCustomEmojiUrl,
        onTapLink: (_, href) async {
          tappedHref = href;
        },
      );

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: FluxerMarkdown(data: input, config: config),
          ),
        ),
      );

      expect(find.text(input, findRichText: true), findsOneWidget);

      await tester.tapOnText(find.textRange.ofSubstring(input));

      expect(tappedHref, isNull);
    });

    testWidgets('non-blank markdown link labels still hyperlink', (
      tester,
    ) async {
      const String url = 'https://fluxer.app';
      String? tappedHref;
      final FluxerMarkdownConfig config = FluxerMarkdownConfig(
        resolveEmojiShortcode: _noopEmojiShortcode,
        unicodeEmojiUrlBuilder: _noopUnicodeEmojiUrl,
        customEmojiUrlBuilder: _noopCustomEmojiUrl,
        onTapLink: (_, href) async {
          tappedHref = href;
        },
      );

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: FluxerMarkdown(data: '[hello]($url)', config: config),
          ),
        ),
      );

      expect(find.text('hello', findRichText: true), findsOneWidget);

      await tester.tapOnText(find.textRange.ofSubstring('hello'));

      expect(tappedHref, url);
    });

    testWidgets('renders bold inside masked link labels', (tester) async {
      const String url = 'https://fluxer.app';
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: FluxerMarkdown(
              data: '[**bold**]($url)',
              config: _testMarkdownConfig,
            ),
          ),
        ),
      );
      final RichText richText = tester.widget<RichText>(find.byType(RichText));
      expect(richText.text.toPlainText(), 'bold');
      expect(
        _leafTextHasStyle(richText.text, 'bold', fontWeight: FontWeight.w700),
        isTrue,
      );
    });

    testWidgets('renders bold and underline for nested formatting', (
      tester,
    ) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: FluxerMarkdown(
              data: '__**text**__',
              config: _testMarkdownConfig,
            ),
          ),
        ),
      );
      final RichText richText = tester.widget<RichText>(find.byType(RichText));
      expect(richText.text.toPlainText(), 'text');
      expect(
        _leafTextHasStyle(
          richText.text,
          'text',
          fontWeight: FontWeight.w700,
          decoration: TextDecoration.underline,
        ),
        isTrue,
      );
    });

    testWidgets('renders underline inside masked link labels', (tester) async {
      const String url = 'https://fluxer.app';
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: FluxerMarkdown(
              data: '[__underline__]($url)',
              config: _testMarkdownConfig,
            ),
          ),
        ),
      );
      final RichText richText = tester.widget<RichText>(find.byType(RichText));
      expect(richText.text.toPlainText(), 'underline');
      expect(
        _leafTextHasStyle(
          richText.text,
          'underline',
          decoration: TextDecoration.underline,
        ),
        isTrue,
      );
    });

    testWidgets('renders strikethrough inside masked link labels', (
      tester,
    ) async {
      const String url = 'https://fluxer.app';
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: FluxerMarkdown(
              data: '[~~strike~~]($url)',
              config: _testMarkdownConfig,
            ),
          ),
        ),
      );
      final RichText richText = tester.widget<RichText>(find.byType(RichText));
      expect(richText.text.toPlainText(), 'strike');
      expect(
        _leafTextHasStyle(
          richText.text,
          'strike',
          decoration: TextDecoration.lineThrough,
        ),
        isTrue,
      );
    });

    testWidgets('renders mixed modifiers inside masked link labels', (
      tester,
    ) async {
      const String url = 'https://fluxer.app';
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: FluxerMarkdown(
              data: '[**bold** and ~~strike~~]($url)',
              config: _testMarkdownConfig,
            ),
          ),
        ),
      );
      final RichText richText = tester.widget<RichText>(find.byType(RichText));
      expect(richText.text.toPlainText(), 'bold and strike');
      expect(
        _leafTextHasStyle(richText.text, 'bold', fontWeight: FontWeight.w700),
        isTrue,
      );
      expect(
        _leafTextHasStyle(
          richText.text,
          'strike',
          decoration: TextDecoration.lineThrough,
        ),
        isTrue,
      );
    });

    testWidgets('formatted masked links remain tappable', (tester) async {
      const String url = 'https://fluxer.app';
      String? tappedHref;
      final FluxerMarkdownConfig config = FluxerMarkdownConfig(
        resolveEmojiShortcode: _noopEmojiShortcode,
        unicodeEmojiUrlBuilder: _noopUnicodeEmojiUrl,
        customEmojiUrlBuilder: _noopCustomEmojiUrl,
        onTapLink: (_, href) async {
          tappedHref = href;
        },
      );
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: FluxerMarkdown(data: '[**bold**]($url)', config: config),
          ),
        ),
      );
      await tester.tapOnText(find.textRange.ofSubstring('bold'));
      expect(tappedHref, url);
    });

    testWidgets('bold wrapping entire masked link still renders bold', (
      tester,
    ) async {
      const String url = 'https://fluxer.app';
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: FluxerMarkdown(
              data: '**[link]($url)**',
              config: _testMarkdownConfig,
            ),
          ),
        ),
      );
      final RichText richText = tester.widget<RichText>(find.byType(RichText));
      expect(richText.text.toPlainText(), 'link');
      expect(
        _leafTextHasStyle(richText.text, 'link', fontWeight: FontWeight.w700),
        isTrue,
      );
    });

    testWidgets('labeled message links keep their markdown label', (
      tester,
    ) async {
      const String url =
          'https://web.fluxer.app/channels/123456789012345678/'
          '987654321098765432/111111111111111111';
      String? tappedHref;
      final FluxerMarkdownConfig config = FluxerMarkdownConfig(
        resolveEmojiShortcode: _noopEmojiShortcode,
        unicodeEmojiUrlBuilder: _noopUnicodeEmojiUrl,
        customEmojiUrlBuilder: _noopCustomEmojiUrl,
        internalLinkPattern: _internalFluxerLinkPattern,
        linkWidgetBuilder: (_, _, _) => const Text('jump pill'),
        onTapLink: (_, href) async {
          tappedHref = href;
        },
      );

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: FluxerMarkdown(data: '[#510]($url)', config: config),
          ),
        ),
      );

      expect(find.text('#510', findRichText: true), findsOneWidget);
      expect(find.text('jump pill'), findsNothing);

      await tester.tapOnText(find.textRange.ofSubstring('#510'));

      expect(tappedHref, url);
    });

    testWidgets('labeled channel links keep their label without a pill', (
      tester,
    ) async {
      const String url =
          'https://web.canary.fluxer.app/channels/1500175496099627169/'
          '1500176315272364202';
      String? tappedHref;
      final FluxerMarkdownConfig config = FluxerMarkdownConfig(
        resolveEmojiShortcode: _noopEmojiShortcode,
        unicodeEmojiUrlBuilder: _noopUnicodeEmojiUrl,
        customEmojiUrlBuilder: _noopCustomEmojiUrl,
        internalLinkPattern: RegExp(
          r'https://web\.canary\.fluxer\.app/channels/\d+/\d+',
        ),
        linkWidgetBuilder: (_, _, _) => const Text('jump pill'),
        onTapLink: (_, href) async {
          tappedHref = href;
        },
      );

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: FluxerMarkdown(data: '[hi]($url)', config: config),
          ),
        ),
      );

      expect(find.text('hi', findRichText: true), findsOneWidget);
      expect(find.text('jump pill'), findsNothing);

      await tester.tapOnText(find.textRange.ofSubstring('hi'));

      expect(tappedHref, url);
    });

    testWidgets('bare message links can render custom jump widgets', (
      tester,
    ) async {
      const String url =
          'https://web.fluxer.app/channels/123456789012345678/'
          '987654321098765432/111111111111111111';
      final FluxerMarkdownConfig config = FluxerMarkdownConfig(
        resolveEmojiShortcode: _noopEmojiShortcode,
        unicodeEmojiUrlBuilder: _noopUnicodeEmojiUrl,
        customEmojiUrlBuilder: _noopCustomEmojiUrl,
        internalLinkPattern: _internalFluxerLinkPattern,
        linkWidgetBuilder: (_, _, _) => const Text('jump pill'),
      );

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: FluxerMarkdown(data: url, config: config),
          ),
        ),
      );

      expect(find.text('jump pill'), findsOneWidget);
    });

    testWidgets('angle-bracket message links render custom jump widgets', (
      tester,
    ) async {
      const String url =
          'https://web.fluxer.app/channels/123456789012345678/'
          '987654321098765432/111111111111111111';
      final FluxerMarkdownConfig config = FluxerMarkdownConfig(
        resolveEmojiShortcode: _noopEmojiShortcode,
        unicodeEmojiUrlBuilder: _noopUnicodeEmojiUrl,
        customEmojiUrlBuilder: _noopCustomEmojiUrl,
        internalLinkPattern: _internalFluxerLinkPattern,
        linkWidgetBuilder: (_, _, _) => const Text('jump pill'),
      );

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: FluxerMarkdown(data: '<$url>', config: config),
          ),
        ),
      );

      expect(find.text('jump pill'), findsOneWidget);
      expect(find.text(url, findRichText: true), findsNothing);
    });

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

    testWidgets('renders multiline >>> blockquote across blank lines', (
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
                data: '>>> line one\n\nline two',
                config: blockquoteConfig,
                baseStyle: baseStyle,
              ),
            ),
          ),
        ),
      );

      final RichText lineOneText = tester.widget<RichText>(
        find.text('line one', findRichText: true),
      );
      expect(lineOneText.text.style?.color, blockquoteTextColor);

      final RichText lineTwoText = tester.widget<RichText>(
        find.text('line two', findRichText: true),
      );
      expect(lineTwoText.text.style?.color, blockquoteTextColor);

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
            data: MediaQueryData(textScaler: TextScaler.noScaling),
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

    testWidgets('standard context preserves blank lines around a list', (
      tester,
    ) async {
      const String input = 'intro\n\n- item\n\ncloser';
      await tester.pumpWidget(
        const MaterialApp(
          home: MediaQuery(
            data: MediaQueryData(textScaler: TextScaler.noScaling),
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
      expect(find.textContaining('intro', findRichText: true), findsOneWidget);
      expect(find.textContaining('item', findRichText: true), findsOneWidget);
      expect(find.textContaining('closer', findRichText: true), findsOneWidget);
      final List<String> richTexts = tester
          .widgetList<RichText>(find.byType(RichText))
          .map((RichText richText) => richText.text.toPlainText())
          .toList();
      expect(
        richTexts.any((String text) => text.contains('intro\n\n')),
        isTrue,
      );
      expect(
        richTexts.any((String text) => text.startsWith('\n\ncloser')),
        isTrue,
      );
    });

    testWidgets('renders multi-line strikethrough across soft line breaks', (
      tester,
    ) async {
      const String input = '~~line one\nline two~~';
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: FluxerMarkdown(
              data: input,
              config: _testMarkdownConfig,
              baseStyle: baseStyle,
            ),
          ),
        ),
      );
      final RichText richText = tester.widget<RichText>(find.byType(RichText));
      final String renderedText = richText.text.toPlainText();
      expect(renderedText, 'line one\nline two');
      expect(renderedText, isNot(contains('~')));
      expect(_hasMultiLineStrikethrough(richText.text), isTrue);
    });

    testWidgets(
      'single line blockquote followed by non-quote lines renders correctly',
      (tester) async {
        const String input =
            '> This is a quoted line.\nThis is not a quoted line.\nThis is also not a quoted line.';
        await tester.pumpWidget(
          const MaterialApp(
            home: Scaffold(
              body: FluxerMarkdown(
                data: input,
                config: _testMarkdownConfig,
                baseStyle: baseStyle,
              ),
            ),
          ),
        );

        expect(
          find.textContaining('This is a quoted line.', findRichText: true),
          findsOneWidget,
        );
        expect(
          find.textContaining('This is not a quoted line.', findRichText: true),
          findsOneWidget,
        );
        expect(
          find.textContaining(
            'This is also not a quoted line.',
            findRichText: true,
          ),
          findsOneWidget,
        );

        final List<RichText> richTextWidgets = tester
            .widgetList<RichText>(find.byType(RichText))
            .toList();

        expect(richTextWidgets.length, 2);

        final String quoteText = richTextWidgets[0].text.toPlainText();
        expect(quoteText, 'This is a quoted line.');
        expect(quoteText, isNot(contains('not a quoted')));

        final String followingText = richTextWidgets[1].text.toPlainText();
        expect(
          followingText,
          'This is not a quoted line.\nThis is also not a quoted line.',
        );
      },
    );

    testWidgets(
      'trailing inline widget appears after last line not longest line',
      (tester) async {
        const String input =
            'This is a very long first line that exceeds phone width\nshort';
        const double maxWidth = 200;
        await tester.pumpWidget(
          const MaterialApp(
            home: MediaQuery(
              data: MediaQueryData(textScaler: TextScaler.noScaling),
              child: Scaffold(
                body: Center(
                  child: SizedBox(
                    width: maxWidth,
                    child: FluxerMarkdown(
                      data: input,
                      config: _testMarkdownConfig,
                      baseStyle: baseStyle,
                      trailingInlineWidget: Text(
                        '(edited)',
                        style: TextStyle(fontSize: 10, height: 1.2),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
        final Finder messageRichTextFinder = find.byWidgetPredicate(
          (Widget widget) =>
              widget is RichText && widget.text.toPlainText().contains('short'),
        );
        final RenderParagraph paragraph = tester.renderObject<RenderParagraph>(
          messageRichTextFinder,
        );
        final String plainText = paragraph.text.toPlainText();
        final int shortOffset = plainText.indexOf('short');
        final List<TextBox> shortBoxes = paragraph.getBoxesForSelection(
          TextSelection(
            baseOffset: shortOffset,
            extentOffset: shortOffset + 'short'.length,
          ),
        );
        final Rect shortRect = shortBoxes.last.toRect();
        final Offset editedGlobal = tester.getTopLeft(find.text('(edited)'));
        final Offset editedLocal = paragraph.globalToLocal(editedGlobal);
        final List<TextBox> longLineBoxes = paragraph.getBoxesForSelection(
          const TextSelection(baseOffset: 0, extentOffset: 4),
        );
        final Rect longLineRect = longLineBoxes.first.toRect();
        final double lineHeight =
            (baseStyle.fontSize ?? 16) * (baseStyle.height ?? 1);
        expect(editedLocal.dy, greaterThan(longLineRect.top + 8));
        expect(
          (editedLocal.dy - shortRect.top).abs(),
          lessThan(lineHeight + 4),
        );
        expect(editedLocal.dx, closeTo(shortRect.right + 4, 40));
        expect(editedLocal.dx, lessThan(maxWidth - 8));
      },
    );

    testWidgets(
      'trailing inline widget appears below code block when code is last',
      (tester) async {
        const String input = 'before\n```\ncode\n```';
        await tester.pumpWidget(
          const MaterialApp(
            home: Scaffold(
              body: FluxerMarkdown(
                data: input,
                config: _testMarkdownConfig,
                baseStyle: baseStyle,
                trailingInlineWidget: Text('(edited)'),
              ),
            ),
          ),
        );
        expect(find.text('(edited)'), findsOneWidget);
        final Offset editedOffset = tester.getTopLeft(find.text('(edited)'));
        final Offset beforeOffset = tester.getTopLeft(
          find.textContaining('before', findRichText: true),
        );
        expect(editedOffset.dy, greaterThan(beforeOffset.dy + 8));
      },
    );
  });
}

bool _hasMultiLineStrikethrough(InlineSpan span) {
  if (span is! TextSpan) {
    return false;
  }
  final TextDecoration? decoration = span.style?.decoration;
  if (decoration?.contains(TextDecoration.lineThrough) ?? false) {
    final String text = span.toPlainText();
    if (text.contains('line one') && text.contains('line two')) {
      return true;
    }
  }
  for (final InlineSpan child in span.children ?? const <InlineSpan>[]) {
    if (_hasMultiLineStrikethrough(child)) {
      return true;
    }
  }
  return false;
}

bool _leafTextHasStyle(
  InlineSpan span,
  String leafText, {
  FontWeight? fontWeight,
  TextDecoration? decoration,
  FontStyle? fontStyle,
}) {
  if (span is! TextSpan) {
    return false;
  }
  final String? text = span.text;
  if (text != null && text.contains(leafText)) {
    final TextStyle? style = span.style;
    if (fontWeight != null && style?.fontWeight != fontWeight) {
      return false;
    }
    if (decoration != null &&
        !(style?.decoration?.contains(decoration) ?? false)) {
      return false;
    }
    if (fontStyle != null && style?.fontStyle != fontStyle) {
      return false;
    }
    return true;
  }
  for (final InlineSpan child in span.children ?? const <InlineSpan>[]) {
    if (_leafTextHasStyle(
      child,
      leafText,
      fontWeight: fontWeight,
      decoration: decoration,
      fontStyle: fontStyle,
    )) {
      return true;
    }
  }
  return false;
}
