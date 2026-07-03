import 'package:flutter/material.dart';
import 'package:flutter_highlight/flutter_highlight.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_markdown/src/config/fluxer_markdown_config.dart';
import 'package:fluxer_markdown/src/widgets/fluxer_markdown.dart';

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

bool _richTextHasStyledLeaf(
  InlineSpan span,
  String text, {
  FontStyle? fontStyle,
  FontWeight? fontWeight,
}) {
  if (span is TextSpan) {
    final String leaf = span.toPlainText();
    if (leaf.contains(text)) {
      final bool styleMatch =
          (fontStyle == null || span.style?.fontStyle == fontStyle) &&
          (fontWeight == null || span.style?.fontWeight == fontWeight);
      if (styleMatch && leaf.trim() == text) {
        return true;
      }
    }
    for (final InlineSpan child in span.children ?? const <InlineSpan>[]) {
      if (_richTextHasStyledLeaf(
        child,
        text,
        fontStyle: fontStyle,
        fontWeight: fontWeight,
      )) {
        return true;
      }
    }
  }
  return false;
}

InlineSpan? _findCodeBlockRichText(WidgetTester tester) {
  final Finder richTextFinder = find.byWidgetPredicate(
    (Widget widget) =>
        widget is RichText &&
        widget.text.toPlainText().contains('test four five six'),
  );
  if (richTextFinder.evaluate().isEmpty) {
    return null;
  }
  return tester.widget<RichText>(richTextFinder.first).text;
}

void main() {
  group('code block emphasis', () {
    testWidgets('md fenced block keeps emphasis literal without body styling', (
      tester,
    ) async {
      const String input = '''
```md
test one two three
*test four five six*
**test seven eight nine**
```''';
      await _pumpMarkdown(tester, input);

      expect(find.byType(HighlightView), findsOneWidget);

      final InlineSpan? root = _findCodeBlockRichText(tester);
      expect(root, isNotNull);
      final InlineSpan codeBlockText = root!;
      expect(codeBlockText.toPlainText(), contains('*test four five six*'));
      expect(
        codeBlockText.toPlainText(),
        contains('**test seven eight nine**'),
      );
      expect(
        _richTextHasStyledLeaf(
          codeBlockText,
          'test four five six',
          fontStyle: FontStyle.italic,
        ),
        isFalse,
      );
      expect(
        _richTextHasStyledLeaf(
          codeBlockText,
          'test seven eight nine',
          fontWeight: FontWeight.w700,
        ),
        isFalse,
      );
    });

    testWidgets('plain fenced block keeps emphasis literal', (tester) async {
      const String input = '''
```
test one two three
*test four five six*
**test seven eight nine**
```''';
      await _pumpMarkdown(tester, input);

      expect(find.byType(HighlightView), findsNothing);
      final Finder richTextFinder = find.byWidgetPredicate(
        (Widget widget) =>
            widget is RichText &&
            widget.text.toPlainText().contains('*test four five six*'),
      );
      expect(richTextFinder, findsOneWidget);
    });

    testWidgets('dart fenced block still applies syntax highlighting colors', (
      tester,
    ) async {
      const String input = '''
```dart
void main() {}
```''';
      await _pumpMarkdown(tester, input);

      final Finder richTextFinder = find.descendant(
        of: find.byType(HighlightView),
        matching: find.byType(RichText),
      );
      expect(richTextFinder, findsOneWidget);
      expect(
        tester.widget<RichText>(richTextFinder).text.toPlainText(),
        'void main() {}',
      );
    });
  });
}
