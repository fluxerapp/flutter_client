import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_markdown/src/config/fluxer_markdown_config.dart';
import 'package:fluxer_markdown/src/widgets/fluxer_markdown.dart';
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

const List<String> _mixedMessages = <String>[
  'hello world',
  '**bold** *italic* `code`',
  'https://example.com/docs',
  'ping <@123> and @everyone',
  '<:wave:111111111111111111> hi',
  '```dart\nvoid main() {}\n```',
  '||hidden spoiler||',
];

void main() {
  testWidgets('builds a mixed markdown list without errors', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: ListView.builder(
            itemCount: 50,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: FluxerMarkdown(
                  data: _mixedMessages[index % _mixedMessages.length],
                  parseCacheKey: 'msg-$index',
                  config: _testMarkdownConfig,
                  baseStyle: _baseStyle,
                ),
              );
            },
          ),
        ),
      ),
    );
    await tester.pump();
    expect(tester.takeException(), isNull);
    expect(find.byType(FluxerMarkdown), findsWidgets);

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: ListView.builder(
            itemCount: 50,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: FluxerMarkdown(
                  data: _mixedMessages[index % _mixedMessages.length],
                  parseCacheKey: 'msg-$index',
                  config: _testMarkdownConfig,
                  baseStyle: _baseStyle,
                ),
              );
            },
          ),
        ),
      ),
    );
    await tester.pump();
    expect(tester.takeException(), isNull);
  });
}
