import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_markdown/src/config/fluxer_markdown_config.dart';
import 'package:fluxer_markdown/src/renderers/fluxer_markdown_renderers.dart';
import 'package:fluxer_markdown/src/utils/jumbo_emoji.dart';
import 'package:fluxer_markdown/src/widgets/fluxer_markdown.dart';

const FluxerMarkdownConfig _testMarkdownConfig = FluxerMarkdownConfig(
  resolveEmojiShortcode: _noopEmojiShortcode,
  unicodeEmojiUrlBuilder: _noopUnicodeEmojiUrl,
  customEmojiUrlBuilder: _noopCustomEmojiUrl,
);
const TextStyle _baseStyle = TextStyle(fontSize: 16, height: 1.375);
const String _emojiA = '<:a:111111111111111111>';
const String _emojiB = '<:b:222222222222222222>';
const String _emojiC = '<:c:333333333333333333>';

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
        body: SizedBox(
          width: 320,
          child: FluxerMarkdown(
            data: data,
            config: _testMarkdownConfig,
            baseStyle: _baseStyle,
          ),
        ),
      ),
    ),
  );
  await tester.pumpAndSettle();
}

void _expectAllEmojisNormal(WidgetTester tester) {
  final Finder emojiFinder = find.byType(FluxerEmojiWidget);
  expect(emojiFinder, findsWidgets);
  final int count = tester.widgetList(emojiFinder).length;
  for (var i = 0; i < count; i++) {
    final Size size = tester.getSize(emojiFinder.at(i));
    expect(size.height, lessThan(kFluxerMarkdownEmojiSizeJumbo));
    expect(size.height, closeTo(16 * kFluxerMarkdownEmojiSizeMultiplier, 1));
  }
}

void _expectAllEmojisJumbo(WidgetTester tester) {
  final Finder emojiFinder = find.byType(FluxerEmojiWidget);
  expect(emojiFinder, findsWidgets);
  final int count = tester.widgetList(emojiFinder).length;
  for (var i = 0; i < count; i++) {
    final Size size = tester.getSize(emojiFinder.at(i));
    expect(size.height, closeTo(kFluxerMarkdownEmojiSizeJumbo, 1));
  }
}

void main() {
  group('jumbo emoji text flow', () {
    testWidgets('mixed emoji-only line and text line uses normal size', (
      tester,
    ) async {
      await _pumpMarkdown(tester, '$_emojiA\n$_emojiB text');
      _expectAllEmojisNormal(tester);
    });

    testWidgets('mixed lines with trailing isolated emoji use normal size', (
      tester,
    ) async {
      await _pumpMarkdown(tester, '$_emojiA\n$_emojiB text\n$_emojiC');
      _expectAllEmojisNormal(tester);
    });

    testWidgets('pure multi-line emoji-only message uses jumbo size', (
      tester,
    ) async {
      await _pumpMarkdown(tester, '$_emojiA\n$_emojiB');
      _expectAllEmojisJumbo(tester);
    });

    testWidgets('more than six emoji-only lines use normal size', (
      tester,
    ) async {
      final String input = List<String>.generate(
        7,
        (int index) => '<:e$index:${index.toString().padLeft(18, '1')}>',
      ).join('\n');
      await _pumpMarkdown(tester, input);
      _expectAllEmojisNormal(tester);
    });
  });
}
