import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_markdown/src/config/fluxer_markdown_config.dart';
import 'package:fluxer_markdown/src/contexts/fluxer_markdown_context.dart';
import 'package:fluxer_markdown/src/renderers/fluxer_markdown_renderers.dart';
import 'package:fluxer_markdown/src/utils/jumbo_emoji.dart';
import 'package:fluxer_markdown/src/widgets/fluxer_markdown.dart';
import 'package:material_ui/material_ui.dart';

const FluxerMarkdownConfig _testMarkdownConfig = FluxerMarkdownConfig(
  resolveEmojiShortcode: _noopEmojiShortcode,
  unicodeEmojiUrlBuilder: _noopUnicodeEmojiUrl,
  customEmojiUrlBuilder: _noopCustomEmojiUrl,
);
const TextStyle _baseStyle = TextStyle(fontSize: 16, height: 1.375);
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
  group('list item inline rendering', () {
    testWidgets('ordered list item with mixed formatting uses one RichText', (
      tester,
    ) async {
      const String url = 'https://fluxer.app';
      const String input = '1. plain **bold** [link]($url)';

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: SizedBox(
              width: 320,
              child: FluxerMarkdown(
                data: input,
                config: _testMarkdownConfig,
                baseStyle: _baseStyle,
              ),
            ),
          ),
        ),
      );

      expect(_richTextCountInListItemBody(tester, '1.'), 1);
      expect(find.textContaining('plain', findRichText: true), findsOneWidget);
      expect(find.textContaining('bold', findRichText: true), findsOneWidget);
      expect(find.textContaining('link', findRichText: true), findsOneWidget);
    });

    testWidgets('unordered list item with long mixed text uses one RichText', (
      tester,
    ) async {
      const String input =
          '- this is a long unordered list item with **bold** text that should wrap onto multiple lines when the width is constrained';
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
                    baseStyle: _baseStyle,
                  ),
                ),
              ),
            ),
          ),
        ),
      );

      expect(_richTextCountInListItemBody(tester, '\u2022'), 1);
      final Size itemBodySize = _listItemBodySize(tester, '\u2022');
      final Size singleLineSize = await _measureSingleLineHeight(tester);
      expect(itemBodySize.height, greaterThan(singleLineSize.height));
    });

    testWidgets(
      'list item with text and custom emoji does not use jumbo size',
      (tester) async {
        const String input = '1. hello <:test:123456789012345678>';

        await tester.pumpWidget(
          const MaterialApp(
            home: Scaffold(
              body: SizedBox(
                width: 320,
                child: FluxerMarkdown(
                  data: input,
                  config: _testMarkdownConfig,
                  baseStyle: _baseStyle,
                ),
              ),
            ),
          ),
        );

        expect(_richTextCountInListItemBody(tester, '1.'), 1);
        final Size emojiSize = tester.getSize(find.byType(FluxerEmojiWidget));
        expect(emojiSize.height, lessThan(kFluxerMarkdownEmojiSizeJumbo));
        expect(
          emojiSize.height,
          closeTo(16 * kFluxerMarkdownEmojiSizeMultiplier, 1),
        );
      },
    );

    testWidgets('bare jump link inside list item renders inline', (
      tester,
    ) async {
      const String url =
          'https://web.fluxer.app/channels/123456789012345678/'
          '987654321098765432/111111111111111111';
      const String input = '1. before $url after';
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
            body: SizedBox(
              width: 320,
              child: FluxerMarkdown(
                data: input,
                config: config,
                baseStyle: _baseStyle,
              ),
            ),
          ),
        ),
      );

      expect(_richTextCountInListItemBody(tester, '1.'), 1);
      expect(find.textContaining('before', findRichText: true), findsOneWidget);
      expect(find.textContaining('after', findRichText: true), findsOneWidget);
      expect(find.text('jump pill'), findsOneWidget);
    });

    testWidgets('loose list item with blank line keeps separate paragraphs', (
      tester,
    ) async {
      const String input = '1. first paragraph\n\n   second paragraph';

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: SizedBox(
              width: 320,
              child: FluxerMarkdown(
                data: input,
                config: _testMarkdownConfig,
                baseStyle: _baseStyle,
                context: FluxerMarkdownContext.restrictedEmbedDescription,
              ),
            ),
          ),
        ),
      );

      expect(_richTextCountInListItemBody(tester, '1.'), 2);
      expect(
        find.textContaining('first paragraph', findRichText: true),
        findsOneWidget,
      );
      expect(
        find.textContaining('second paragraph', findRichText: true),
        findsOneWidget,
      );
    });

    testWidgets('ordered list with multi-digit numbers does not wrap markers', (
      tester,
    ) async {
      await _pumpMarkdown(
        tester,
        data: '8. item eight\n9. item nine\n10. item ten\n11. item eleven',
      );

      _expectMarkersSingleLine(tester, const ['8.', '9.', '10.', '11.']);
      final double markerColumnWidth8 = _listMarkerColumnWidth(tester, '8.');
      final double markerColumnWidth10 = _listMarkerColumnWidth(tester, '10.');
      expect(markerColumnWidth8, markerColumnWidth10);
      expect(markerColumnWidth10, greaterThan(24));
      expect(
        tester.getSize(_markerFinder('10.')).width,
        lessThanOrEqualTo(markerColumnWidth10),
      );
    });

    testWidgets('ordered list with three-digit numbers uses a wider column', (
      tester,
    ) async {
      await _pumpMarkdown(
        tester,
        data: '8. item eight\n9. item nine\n10. item ten\n11. item eleven',
      );
      final double twoDigitWidth = _listMarkerColumnWidth(tester, '10.');

      await _pumpMarkdown(
        tester,
        data: '98. item\n99. item\n100. item\n101. item',
      );
      _expectMarkersSingleLine(tester, const ['98.', '99.', '100.', '101.']);
      final double threeDigitWidth = _listMarkerColumnWidth(tester, '100.');
      expect(_listMarkerColumnWidth(tester, '98.'), threeDigitWidth);
      expect(threeDigitWidth, greaterThan(twoDigitWidth));
      expect(
        tester.getSize(_markerFinder('100.')).width,
        lessThanOrEqualTo(threeDigitWidth),
      );
    });

    testWidgets(
      'ordered list with million-scale numbers does not wrap markers',
      (tester) async {
        await _pumpMarkdown(
          tester,
          data: '1000000. one million\n1000001. next',
          width: 400,
        );
        _expectMarkersSingleLine(tester, const ['1000000.', '1000001.']);
        final double millionWidth = _listMarkerColumnWidth(tester, '1000000.');
        expect(_listMarkerColumnWidth(tester, '1000001.'), millionWidth);
        expect(
          tester.getSize(_markerFinder('1000000.')).width,
          lessThanOrEqualTo(millionWidth),
        );

        await _pumpMarkdown(tester, data: '101. item');
        expect(
          millionWidth,
          greaterThan(_listMarkerColumnWidth(tester, '101.')),
        );
      },
    );

    testWidgets('ordered list with nine-digit numbers does not wrap markers', (
      tester,
    ) async {
      await _pumpMarkdown(tester, data: '999999999. last', width: 400);
      _expectMarkersSingleLine(tester, const ['999999999.']);
      expect(
        tester.getSize(_markerFinder('999999999.')).width,
        lessThanOrEqualTo(_listMarkerColumnWidth(tester, '999999999.')),
      );
    });

    testWidgets('ordered list markers stay one line under text scale', (
      tester,
    ) async {
      const TextScaler scaler = TextScaler.linear(1.5);
      await _pumpMarkdown(
        tester,
        data: '98. item\n99. item\n100. item\n101. item',
        textScaler: scaler,
      );
      _expectMarkersSingleLine(tester, const [
        '98.',
        '99.',
        '100.',
        '101.',
      ], expectedHeight: 16 * 1.375 * 1.5);
    });

    testWidgets('ordered list column fits letter-spaced markers', (
      tester,
    ) async {
      const TextStyle spacedStyle = TextStyle(
        fontSize: 16,
        height: 1.375,
        letterSpacing: 2,
      );
      await _pumpMarkdown(
        tester,
        data: '10. item ten\n11. item eleven',
        style: spacedStyle,
      );
      _expectMarkersSingleLine(tester, const ['10.', '11.']);
      expect(
        tester.getSize(_markerFinder('10.')).width,
        lessThanOrEqualTo(_listMarkerColumnWidth(tester, '10.')),
      );
    });

    testWidgets(
      'ordered list start offset keeps multi-digit markers on one line',
      (tester) async {
        await _pumpMarkdown(tester, data: '99. a\n100. b');
        _expectMarkersSingleLine(tester, const ['99.', '100.']);
        expect(
          _listMarkerColumnWidth(tester, '99.'),
          _listMarkerColumnWidth(tester, '100.'),
        );
      },
    );

    testWidgets('ordered list body hangs under the item text', (tester) async {
      const String input =
          '10. this is a long ordered list item that should wrap onto multiple lines';
      await _pumpMarkdown(tester, data: input, width: 200);

      final Rect markerColumn = tester.getRect(
        _listMarkerSizedBoxFinder('10.'),
      );
      final Rect body = tester.getRect(
        find.descendant(
          of: _listItemRowFinder('10.'),
          matching: find.byType(Expanded),
        ),
      );
      expect(body.left, closeTo(markerColumn.right, 0.5));
      expect(body.height, greaterThan(16 * 1.375 + 1));
    });

    testWidgets('nested ordered list uses an independent alpha marker column', (
      tester,
    ) async {
      await _pumpMarkdown(tester, data: '1. parent\n   1. nested');
      _expectMarkersSingleLine(tester, const ['1.', 'a.']);
      expect(find.textContaining('parent', findRichText: true), findsOneWidget);
      expect(find.textContaining('nested', findRichText: true), findsOneWidget);
    });
  });
}

int _richTextCountInListItemBody(WidgetTester tester, String marker) {
  expect(_markerFinder(marker), findsOneWidget);
  final Finder rowFinder = _listItemRowFinder(marker);
  expect(rowFinder, findsOneWidget);
  final Finder expandedFinder = find.descendant(
    of: rowFinder,
    matching: find.byType(Expanded),
  );
  final Finder columnFinder = find.descendant(
    of: expandedFinder,
    matching: find.byType(Column),
  );
  final Column column = tester.widget<Column>(columnFinder);
  var count = 0;
  for (final Widget child in column.children) {
    if (child is RichText) {
      count++;
    }
  }
  return count;
}

Size _listItemBodySize(WidgetTester tester, String marker) {
  final Finder expandedFinder = find.descendant(
    of: _listItemRowFinder(marker),
    matching: find.byType(Expanded),
  );
  return tester.getSize(expandedFinder);
}

double _listMarkerColumnWidth(WidgetTester tester, String marker) {
  return tester.getSize(_listMarkerSizedBoxFinder(marker)).width;
}

Finder _markerFinder(String marker) {
  return find.byWidgetPredicate(
    (Widget widget) =>
        widget is RichText && widget.text.toPlainText() == marker,
  );
}

Finder _listItemRowFinder(String marker) {
  return find.ancestor(
    of: _markerFinder(marker),
    matching: find.byWidgetPredicate(
      (Widget widget) =>
          widget is Row &&
          widget.children.any(
            (Widget child) =>
                child is SizedBox &&
                child.child is RichText &&
                (child.child! as RichText).text.toPlainText() == marker,
          ),
    ),
  );
}

Finder _listMarkerSizedBoxFinder(String marker) {
  return find.ancestor(
    of: _markerFinder(marker),
    matching: find.byWidgetPredicate(
      (Widget widget) =>
          widget is SizedBox &&
          widget.child is RichText &&
          (widget.child! as RichText).text.toPlainText() == marker,
    ),
  );
}

void _expectMarkersSingleLine(
  WidgetTester tester,
  List<String> markers, {
  double expectedHeight = 16 * 1.375,
}) {
  for (final String marker in markers) {
    final Finder markerFinder = _markerFinder(marker);
    expect(markerFinder, findsOneWidget);
    expect(tester.getSize(markerFinder).height, closeTo(expectedHeight, 1));
  }
}

Future<void> _pumpMarkdown(
  WidgetTester tester, {
  required String data,
  double width = 320,
  TextScaler textScaler = TextScaler.noScaling,
  TextStyle style = _baseStyle,
}) async {
  await tester.pumpWidget(
    MaterialApp(
      home: MediaQuery(
        data: MediaQueryData(textScaler: textScaler),
        child: Scaffold(
          body: SizedBox(
            width: width,
            child: FluxerMarkdown(
              data: data,
              config: _testMarkdownConfig,
              baseStyle: style,
            ),
          ),
        ),
      ),
    ),
  );
}

Future<Size> _measureSingleLineHeight(WidgetTester tester) async {
  await tester.pumpWidget(
    const MaterialApp(
      home: MediaQuery(
        data: MediaQueryData(textScaler: TextScaler.noScaling),
        child: Scaffold(
          body: Center(
            child: SizedBox(
              width: 200,
              child: Text('single line', style: _baseStyle),
            ),
          ),
        ),
      ),
    ),
  );
  return tester.getSize(find.text('single line'));
}
