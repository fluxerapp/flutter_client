import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_markdown/src/config/fluxer_markdown_config.dart';
import 'package:fluxer_markdown/src/contexts/fluxer_markdown_context.dart';
import 'package:fluxer_markdown/src/widgets/fluxer_markdown.dart';

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
    });
  });
}
