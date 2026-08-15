import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_markdown/src/config/fluxer_markdown_config.dart';
import 'package:fluxer_markdown/src/widgets/fluxer_markdown.dart';
import 'package:material_ui/material_ui.dart';

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
  group('block spoiler', () {
    testWidgets('renders block spoiler content behind overlay', (tester) async {
      const String input = '||\nBlock spoiler content\nClick to reveal!\n||';

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: FluxerMarkdown(data: input, config: _testMarkdownConfig),
          ),
        ),
      );

      expect(
        find.textContaining('Block spoiler content', findRichText: true),
        findsOneWidget,
      );
      await tester.tap(find.byType(GestureDetector).first);
      await tester.pumpAndSettle();
      expect(
        find.textContaining('Block spoiler content', findRichText: true),
        findsOneWidget,
      );
    });
  });
}
