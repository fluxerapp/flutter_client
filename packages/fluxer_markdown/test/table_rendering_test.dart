import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_markdown/src/config/fluxer_markdown_config.dart';
import 'package:fluxer_markdown/src/contexts/fluxer_markdown_context.dart';
import 'package:fluxer_markdown/src/widgets/fluxer_markdown.dart';

const Color _headerBackgroundColor = Color(0xFF112233);
const Color _rowOddBackgroundColor = Color(0xFF223344);
const Color _rowEvenBackgroundColor = Color(0xFF334455);
const Color _tableBorderColor = Color(0xFF445566);
const Color _headerTextColor = Color(0xFF556677);

const FluxerMarkdownConfig _testMarkdownConfig = FluxerMarkdownConfig(
  resolveEmojiShortcode: _noopEmojiShortcode,
  unicodeEmojiUrlBuilder: _noopUnicodeEmojiUrl,
  customEmojiUrlBuilder: _noopCustomEmojiUrl,
  tableBorderColor: _tableBorderColor,
  tableHeaderBackgroundColor: _headerBackgroundColor,
  tableHeaderTextColor: _headerTextColor,
  tableRowOddBackgroundColor: _rowOddBackgroundColor,
  tableRowEvenBackgroundColor: _rowEvenBackgroundColor,
  tableBorderRadius: BorderRadius.all(Radius.circular(6)),
);

String? _noopEmojiShortcode(String name) => null;

String? _noopUnicodeEmojiUrl(String unicode) => null;

String _noopCustomEmojiUrl({
  required String id,
  required bool animated,
  required int size,
}) => '';

const TextStyle _baseStyle = TextStyle(fontSize: 16, height: 1.375);
const double _testMinCellWidth = 80;

Finder _tableCellWithColor(Color color) {
  return find.byWidgetPredicate(
    (Widget widget) =>
        widget is Container &&
        widget.color == color &&
        widget.constraints?.minWidth == _testMinCellWidth,
  );
}

void main() {
  group('table rendering', () {
    testWidgets('standard context renders table cells', (tester) async {
      const String input = '''
| Header | Value |
| --- | --- |
| A | 1 |''';

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: FluxerMarkdown(
              data: input,
              config: _testMarkdownConfig,
              baseStyle: _baseStyle,
            ),
          ),
        ),
      );

      expect(find.textContaining('Header', findRichText: true), findsOneWidget);
      expect(find.textContaining('Value', findRichText: true), findsOneWidget);
      expect(find.textContaining('A', findRichText: true), findsOneWidget);
      expect(find.byType(Table), findsOneWidget);
      expect(find.byType(SingleChildScrollView), findsOneWidget);
    });

    testWidgets('uses configured header and zebra row backgrounds', (
      tester,
    ) async {
      const String input = '''
| Header | Value |
| --- | --- |
| Odd | 1 |
| Even | 2 |''';

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: FluxerMarkdown(
              data: input,
              config: _testMarkdownConfig,
              baseStyle: _baseStyle,
            ),
          ),
        ),
      );

      expect(_tableCellWithColor(_headerBackgroundColor), findsNWidgets(2));
      expect(_tableCellWithColor(_rowOddBackgroundColor), findsNWidgets(2));
      expect(_tableCellWithColor(_rowEvenBackgroundColor), findsNWidgets(2));
    });

    testWidgets('applies column alignment from markdown separator', (
      tester,
    ) async {
      const String input = '''
| Left | Center | Right |
| :--- | :---: | ---: |
| A | B | C |''';

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: FluxerMarkdown(
              data: input,
              config: _testMarkdownConfig,
              baseStyle: _baseStyle,
            ),
          ),
        ),
      );

      final Iterable<RichText> richTexts = tester.widgetList<RichText>(
        find.descendant(
          of: find.byType(Table),
          matching: find.byType(RichText),
        ),
      );
      final List<TextAlign> alignments = richTexts
          .skip(3)
          .take(3)
          .map((RichText richText) => richText.textAlign)
          .toList();
      expect(alignments, <TextAlign>[
        TextAlign.left,
        TextAlign.center,
        TextAlign.right,
      ]);
    });

    testWidgets('wraps table in rounded border container', (tester) async {
      const String input = '''
| Header | Value |
| --- | --- |
| A | 1 |''';

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: FluxerMarkdown(
              data: input,
              config: _testMarkdownConfig,
              baseStyle: _baseStyle,
            ),
          ),
        ),
      );

      final Container tableContainer = tester.widget<Container>(
        find.descendant(
          of: find.byType(SingleChildScrollView),
          matching: find.byWidgetPredicate(
            (Widget widget) =>
                widget is Container &&
                widget.decoration is BoxDecoration &&
                (widget.decoration! as BoxDecoration).border != null,
          ),
        ),
      );
      final BoxDecoration decoration =
          tableContainer.decoration! as BoxDecoration;
      expect(
        decoration.borderRadius,
        const BorderRadius.all(Radius.circular(6)),
      );
      expect(decoration.border?.top.color, _tableBorderColor);
      final Table table = tester.widget<Table>(find.byType(Table));
      expect(table.border?.horizontalInside.color, _tableBorderColor);
    });

    testWidgets('embed context does not render table structure', (
      tester,
    ) async {
      const String input = '| not | table |';

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: FluxerMarkdown(
              data: input,
              config: _testMarkdownConfig,
              context: FluxerMarkdownContext.restrictedEmbedDescription,
            ),
          ),
        ),
      );

      expect(
        find.textContaining('| not | table |', findRichText: true),
        findsOneWidget,
      );
      expect(find.byType(Table), findsNothing);
    });

    testWidgets('emoji row cells share the same background height', (
      tester,
    ) async {
      const String input = '''
| Header | Value | Other |
| --- | --- | --- |
| text only | <:pingumusic:123> <:pinguvibe:123> cool beans | more text |''';

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: FluxerMarkdown(
              data: input,
              config: _testMarkdownConfig,
              baseStyle: _baseStyle,
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();

      final Finder rowCellFinder = _tableCellWithColor(_rowOddBackgroundColor);

      expect(rowCellFinder, findsNWidgets(3));
      final double firstHeight = tester.getSize(rowCellFinder.first).height;
      for (var i = 1; i < 3; i++) {
        expect(
          tester.getSize(rowCellFinder.at(i)).height,
          closeTo(firstHeight, 1),
          reason: 'all cells in an emoji row should fill the same row height',
        );
      }
    });

    testWidgets('header row cells share the same background height', (
      tester,
    ) async {
      const String input = '''
| hello | this is quite a nice table | yeah | :pinched_fingers: |
| ---- | ------- | ------ | ------- |
| a | b | c | d |''';

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: SizedBox(
              width: 350,
              child: FluxerMarkdown(
                data: input,
                config: _testMarkdownConfig,
                baseStyle: _baseStyle,
              ),
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();

      final Finder headerCellFinder = _tableCellWithColor(
        _headerBackgroundColor,
      );

      expect(headerCellFinder, findsNWidgets(4));
      final double firstHeight = tester.getSize(headerCellFinder.first).height;
      for (var i = 1; i < 4; i++) {
        expect(
          tester.getSize(headerCellFinder.at(i)).height,
          closeTo(firstHeight, 1),
          reason: 'all header cells should fill the same row height',
        );
      }
    });

    testWidgets('header cells use top alignment like web baseline', (
      tester,
    ) async {
      const String input = '''
| hello | this is quite a nice table | yeah |
| ---- | ------- | ------ |
| a | b | c |''';

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: SizedBox(
              width: 280,
              child: FluxerMarkdown(
                data: input,
                config: _testMarkdownConfig,
                baseStyle: _baseStyle,
              ),
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();

      final Container headerCell = tester.widget<Container>(
        _tableCellWithColor(_headerBackgroundColor).first,
      );
      expect(headerCell.alignment, Alignment.topLeft);
      expect(
        headerCell.padding,
        const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      );
    });

    testWidgets('body cells use vertical center alignment like web', (
      tester,
    ) async {
      const String input = '''
| Header |
| --- |
| Value |''';

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: FluxerMarkdown(
              data: input,
              config: _testMarkdownConfig,
              baseStyle: _baseStyle,
            ),
          ),
        ),
      );

      final Container bodyCell = tester.widget<Container>(
        _tableCellWithColor(_rowOddBackgroundColor).first,
      );
      expect(bodyCell.alignment, Alignment.centerLeft);
    });

    testWidgets('table cell content respects padding inset', (tester) async {
      const String input = '''
| hello | value |
| --- | --- |
| a | b |''';

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: FluxerMarkdown(
              data: input,
              config: _testMarkdownConfig,
              baseStyle: _baseStyle,
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();

      final Finder helloText = find.descendant(
        of: _tableCellWithColor(_headerBackgroundColor).first,
        matching: find.textContaining('hello', findRichText: true),
      );
      final Finder helloCell = _tableCellWithColor(
        _headerBackgroundColor,
      ).first;
      expect(
        tester.getTopLeft(helloText).dx - tester.getTopLeft(helloCell).dx,
        closeTo(12, 1),
      );
      expect(
        tester.getTopLeft(helloText).dy - tester.getTopLeft(helloCell).dy,
        closeTo(8, 1),
      );
    });

    testWidgets('wide emoji table renders with visible height', (tester) async {
      const String input = '''
| hello | this is quite a nice table | yeah | :pinched_fingers:  |
| ---- | ------- | ------ | ------- |
| pingu pingu | <:pingumusic:1> | <:pingumusic:1><:pinguvibe:1> cool beans |
| hmm | strange formatting | when emotes are involved | <:HURRR:1> |
| quite silly | <:alien:1><:alien:1><:alien:1> | Bogos binted | huh? |''';

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: SizedBox(
              width: 350,
              child: FluxerMarkdown(
                data: input,
                config: _testMarkdownConfig,
                baseStyle: _baseStyle,
              ),
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(tester.getSize(find.byType(Table)).height, greaterThan(50));
      expect(find.textContaining('hello', findRichText: true), findsOneWidget);
    });
  });
}
