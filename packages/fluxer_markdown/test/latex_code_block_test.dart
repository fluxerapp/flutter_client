import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_markdown/src/config/fluxer_markdown_config.dart';
import 'package:fluxer_markdown/src/utils/code_block_highlight.dart';
import 'package:fluxer_markdown/src/widgets/fluxer_markdown.dart';
import 'package:latext/latext.dart';
import 'package:material_ui/material_ui.dart';

const FluxerMarkdownConfig _testMarkdownConfig = FluxerMarkdownConfig(
  resolveEmojiShortcode: _noopEmojiShortcode,
  unicodeEmojiUrlBuilder: _noopUnicodeEmojiUrl,
  customEmojiUrlBuilder: _noopCustomEmojiUrl,
);

const TextStyle _baseStyle = TextStyle(fontSize: 16, height: 1.375);

String? _noopEmojiShortcode(String name) => null;

String? _noopUnicodeEmojiUrl(String unicode) => null;

String _noopCustomEmojiUrl({
  required String id,
  required bool animated,
  required int size,
}) => '';

Future<void> _pumpMarkdown(WidgetTester tester, String data) async {
  await tester.pumpWidget(
    MaterialApp(
      home: Scaffold(
        body: FluxerMarkdown(
          data: data,
          config: _testMarkdownConfig,
          baseStyle: _baseStyle,
        ),
      ),
    ),
  );
}

void main() {
  group('latex code blocks', () {
    testWidgets('renders latex fenced block with LaTexT', (tester) async {
      const String input = r'''
```latex
\int_0^\infty e^{-x} dx
```''';
      await _pumpMarkdown(tester, input);
      expect(find.byType(LaTexT), findsOneWidget);
      expect(find.textContaining('latex\n'), findsNothing);
    });

    testWidgets('renders tex fenced block with LaTexT', (tester) async {
      const String input = '''
```tex
x^2 + y^2 = z^2
```''';
      await _pumpMarkdown(tester, input);
      expect(find.byType(LaTexT), findsOneWidget);
      expect(find.textContaining('tex\n'), findsNothing);
    });

    testWidgets('dart fenced block still uses syntax highlighting', (
      tester,
    ) async {
      const String input = '''
```dart
void main() {}
```''';
      await _pumpMarkdown(tester, input);
      expect(find.byType(FluxerHighlightedCode), findsOneWidget);
      expect(find.byType(LaTexT), findsNothing);
    });

    testWidgets('keeps markdown alert syntax inside fenced block', (
      tester,
    ) async {
      const String input = '''
```
> [!NOTE]
Alert syntax stays literal
```''';
      await _pumpMarkdown(tester, input);
      expect(find.textContaining('[!NOTE]'), findsOneWidget);
      expect(find.textContaining('Alert syntax stays literal'), findsOneWidget);
    });

    testWidgets('renders code block when closing fence is on the last line', (
      tester,
    ) async {
      const String input = '```dart\nvoid main() {}```';
      await _pumpMarkdown(tester, input);
      expect(find.byType(FluxerHighlightedCode), findsOneWidget);
      expect(find.textContaining('```'), findsNothing);
    });

    testWidgets(
      'renders multi-line code block when closing fence is adjacent to last line',
      (tester) async {
        const String input = '```\nline one\nline two```';
        await _pumpMarkdown(tester, input);
        expect(find.textContaining('line one'), findsOneWidget);
        expect(find.textContaining('line two'), findsOneWidget);
        expect(find.textContaining('```'), findsNothing);
      },
    );
  });
}
