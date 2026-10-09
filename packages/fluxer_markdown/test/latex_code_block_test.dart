import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_markdown/src/config/fluxer_markdown_config.dart';
import 'package:fluxer_markdown/src/utils/code_block_highlight.dart';
import 'package:fluxer_markdown/src/widgets/fluxer_markdown.dart';
import 'package:katex/katex.dart';
import 'package:material_ui/material_ui.dart';
import 'support/native_test_parser.dart';

const FluxerMarkdownConfig _testMarkdownConfig = FluxerMarkdownConfig(
  unicodeEmojiUrlBuilder: _noopUnicodeEmojiUrl,
  customEmojiUrlBuilder: _noopCustomEmojiUrl,
);

const TextStyle _baseStyle = TextStyle(fontSize: 16, height: 1.375);

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
          astParser: parseTestMarkdownAst,
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
    testWidgets('renders latex fenced block with Math', (tester) async {
      const String input = r'''
```latex
\int_0^\infty e^{-x} dx
```''';
      await _pumpMarkdown(tester, input);
      expect(find.byType(Math), findsOneWidget);
      expect(find.textContaining('latex\n'), findsNothing);
    });

    testWidgets('renders tex fenced block with Math', (tester) async {
      const String input = '''
```tex
x^2 + y^2 = z^2
```''';
      await _pumpMarkdown(tester, input);
      expect(find.byType(Math), findsOneWidget);
      expect(find.textContaining('tex\n'), findsNothing);
    });

    testWidgets('renders katex fenced block with Math', (tester) async {
      const String input = '''
```katex
E = mc^2
```''';
      await _pumpMarkdown(tester, input);
      expect(find.byType(Math), findsOneWidget);
      expect(find.textContaining('katex\n'), findsNothing);
    });

    testWidgets('renders fluxer art with KaTeX', (tester) async {
      const String input = r'''
```latex
% FluxerArt, fluxer.art
\def\B#1#2#3#4{\rlap{\hspace{#1pt}\raisebox{#2pt}{\color{##4641D9}\rule{#3pt}{#4pt}}}}\def\W#1#2#3#4{\rlap{\hspace{#1pt}\raisebox{#2pt}{\color{##ffffff}\rule{#3pt}{#4pt}}}}\B{46}{0}{40}{6}\B{33}{6}{66}{6}\rule{0pt}{132pt}\hspace{132pt}
```''';
      await _pumpMarkdown(tester, input);
      expect(find.byType(Math), findsOneWidget);
      expect(find.textContaining(r'\def'), findsNothing);
    });

    testWidgets(r'keeps a multiline formula with \neq as one Math', (
      tester,
    ) async {
      const String input = r'''
```latex
a \neq b
c = d
```''';
      await _pumpMarkdown(tester, input);
      expect(find.byType(Math), findsOneWidget);
      expect(find.textContaining(r'\neq'), findsNothing);
    });

    testWidgets('invalid latex stays plain code', (tester) async {
      const String input = r'''
```latex
\frac{
```''';
      await _pumpMarkdown(tester, input);
      expect(find.textContaining(r'\frac{'), findsOneWidget);
    });

    testWidgets('oversized latex stays plain code', (tester) async {
      final String input = '```latex\n${'x' * 1025}\n```';
      await _pumpMarkdown(tester, input);
      expect(find.byType(Math), findsNothing);
      expect(find.textContaining('x' * 32), findsOneWidget);
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
      expect(find.byType(Math), findsNothing);
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
