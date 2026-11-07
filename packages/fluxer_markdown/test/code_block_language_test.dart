import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_markdown/src/renderers/fluxer_markdown_renderers.dart';
import 'package:fluxer_markdown/src/utils/code_block_highlight.dart';
import 'package:markdown/markdown.dart' as md;
import 'package:material_ui/material_ui.dart';

md.Element _fence(String language, String code) =>
    md.Element('code', [md.Text(code)])
      ..attributes['class'] = 'language-$language';

Future<void> _pumpCodeBlock(WidgetTester tester, md.Element element) {
  return tester.pumpWidget(
    MaterialApp(
      home: Scaffold(
        body: FluxerCodeBlockWidget(
          element: element,
          isDark: true,
          baseStyle: const TextStyle(fontSize: 14),
        ),
      ),
    ),
  );
}

void main() {
  testWidgets('an unknown fence language is not shown as part of the code', (
    WidgetTester tester,
  ) async {
    await _pumpCodeBlock(tester, _fence('n', 'print("hi")\n'));

    expect(find.text('print("hi")'), findsOneWidget);
    expect(find.textContaining('n\nprint'), findsNothing);
  });

  testWidgets('cc highlights as C++ like the web client', (
    WidgetTester tester,
  ) async {
    await _pumpCodeBlock(tester, _fence('cc', 'int x = 1;\n'));

    expect(find.byType(FluxerHighlightedCode), findsOneWidget);
    expect(find.textContaining('cc\n'), findsNothing);
  });
}
