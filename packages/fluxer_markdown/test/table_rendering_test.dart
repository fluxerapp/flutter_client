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

Finder _tableCellWithColor(Color color) {
  return find.byWidgetPredicate(
    (Widget widget) =>
        widget is Container &&
        widget.color == color &&
        widget.constraints?.minWidth == 80,
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
            body: FluxerMarkdown(data: input, config: _testMarkdownConfig),
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
            body: FluxerMarkdown(data: input, config: _testMarkdownConfig),
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
            body: FluxerMarkdown(data: input, config: _testMarkdownConfig),
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
            body: FluxerMarkdown(data: input, config: _testMarkdownConfig),
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
  });
}
