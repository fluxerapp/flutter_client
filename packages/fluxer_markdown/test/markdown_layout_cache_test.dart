import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_markdown/src/config/fluxer_markdown_config.dart';
import 'package:fluxer_markdown/src/widgets/fluxer_markdown.dart';
import 'package:material_ui/material_ui.dart';

String? _noopEmojiShortcode(String name) => null;

String? _noopUnicodeEmojiUrl(String unicode) => null;

String _noopCustomEmojiUrl({
  required String id,
  required bool animated,
  required int size,
}) => '';

FluxerMarkdownConfig _configWithTimestamp(FluxerTimestampFormatter formatter) {
  return FluxerMarkdownConfig(
    resolveEmojiShortcode: _noopEmojiShortcode,
    unicodeEmojiUrlBuilder: _noopUnicodeEmojiUrl,
    customEmojiUrlBuilder: _noopCustomEmojiUrl,
    timestampFormatter: formatter,
  );
}

Future<void> _pumpTimestamp(
  WidgetTester tester,
  FluxerTimestampFormatter formatter,
) async {
  await tester.pumpWidget(
    MaterialApp(
      home: Scaffold(
        body: FluxerMarkdown(
          data: '<t:1618936830:t>',
          config: _configWithTimestamp(formatter),
          baseStyle: const TextStyle(fontSize: 16),
        ),
      ),
    ),
  );
}

void main() {
  testWidgets('timestamp formatter output changes invalidate cached body', (
    tester,
  ) async {
    await _pumpTimestamp(tester, (DateTime _, String _) => 'morning');
    expect(find.textContaining('morning', findRichText: true), findsOneWidget);

    await _pumpTimestamp(tester, (DateTime _, String _) => 'evening');
    expect(find.textContaining('evening', findRichText: true), findsOneWidget);
    expect(find.textContaining('morning', findRichText: true), findsNothing);
  });
}
