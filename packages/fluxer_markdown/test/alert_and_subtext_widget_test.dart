import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_markdown/src/config/fluxer_markdown_config.dart';
import 'package:fluxer_markdown/src/widgets/fluxer_markdown.dart';

const FluxerMarkdownConfig _testMarkdownConfig = FluxerMarkdownConfig(
  resolveEmojiShortcode: _noopEmojiShortcode,
  unicodeEmojiUrlBuilder: _noopUnicodeEmojiUrl,
  customEmojiUrlBuilder: _noopCustomEmojiUrl,
  alertBuilder: _testAlertBuilder,
);

String? _noopEmojiShortcode(String name) => null;

String? _noopUnicodeEmojiUrl(String unicode) => null;

String _noopCustomEmojiUrl({
  required String id,
  required bool animated,
  required int size,
}) => '';

Widget _testAlertBuilder(
  BuildContext context,
  FluxerAlertType type,
  Widget body,
  TextStyle baseStyle,
) {
  return Semantics(label: 'alert-${type.name}', child: body);
}

void main() {
  group('alert and subtext widgets', () {
    testWidgets('renders note alert type', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: FluxerMarkdown(
              data: '> [!NOTE]\n> Body text',
              config: _testMarkdownConfig,
            ),
          ),
        ),
      );
      expect(
        find.textContaining('Body text', findRichText: true),
        findsOneWidget,
      );
    });

    testWidgets('renders subtext with smaller style', (tester) async {
      const TextStyle baseStyle = TextStyle(fontSize: 16);
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: FluxerMarkdown(
              data: '-# smaller text',
              config: _testMarkdownConfig,
              baseStyle: baseStyle,
            ),
          ),
        ),
      );

      final RichText richText = tester.widget<RichText>(find.byType(RichText));
      expect(richText.text.style?.fontSize, closeTo(13, 0.5));
    });
  });
}
