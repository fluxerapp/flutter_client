import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/markdown/native_markdown_parser.dart';
import 'package:fluxer_markdown/src/config/fluxer_markdown_config.dart';
import 'package:fluxer_markdown/src/widgets/fluxer_markdown.dart';

const Color _tableBorderColor = Color(0xFF445566);
const Color _headerBackgroundColor = Color(0xFF112233);
const Color _rowOddBackgroundColor = Color(0xFF223344);
const Color _rowEvenBackgroundColor = Color(0xFF334455);
const Color _headerTextColor = Color(0xFF556677);

const FluxerMarkdownConfig kWideTableMarkdownConfig = FluxerMarkdownConfig(
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

const String kWideMarkdownTable = '''
| Col1 | Col2 | Col3 | Col4 | Col5 | Col6 | Col7 | Col8 |
| --- | --- | --- | --- | --- | --- | --- | --- |
| A | B | C | D | E | F | G | H |
''';

const String kNarrowMarkdownTable = '''
| Header | Value |
| --- | --- |
| A | 1 |
''';

String? _noopEmojiShortcode(String name) => null;

String? _noopUnicodeEmojiUrl(String unicode) => null;

String _noopCustomEmojiUrl({
  required String id,
  required bool animated,
  required int size,
}) => '';

Widget buildWideMarkdownTable({double width = 400, double height = 120}) {
  return SizedBox(
    width: width,
    height: height,
    child: const FluxerMarkdown(
      astParser: parseNativeFluxerMarkdownAst,
      data: kWideMarkdownTable,
      config: kWideTableMarkdownConfig,
    ),
  );
}

Finder findHorizontalTableScrollable() {
  return find.byWidgetPredicate(
    (Widget widget) => widget is Scrollable && widget.axis == Axis.horizontal,
  );
}

ScrollableState tableScrollableState(WidgetTester tester) {
  return tester.state<ScrollableState>(findHorizontalTableScrollable());
}

Offset tableDragStart(WidgetTester tester) {
  final RenderBox tableBox = tester.renderObject<RenderBox>(find.byType(Table));
  return tableBox.localToGlobal(
    Offset(tableBox.size.width / 2, tableBox.size.height / 2),
  );
}
