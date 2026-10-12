import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_markdown/src/config/fluxer_markdown_config.dart';
import 'package:fluxer_markdown/src/contexts/fluxer_markdown_context.dart';
import 'package:fluxer_markdown/src/widgets/fluxer_markdown.dart';
import 'package:material_ui/material_ui.dart';
import 'support/native_test_parser.dart';

const TextStyle _baseStyle = TextStyle(fontSize: 16, height: 1.375);

String? _noopUnicodeEmojiUrl(String unicode) => null;

String _noopCustomEmojiUrl({
  required String id,
  required bool animated,
  required int size,
}) => '';

final FluxerMarkdownConfig _config = FluxerMarkdownConfig(
  unicodeEmojiUrlBuilder: _noopUnicodeEmojiUrl,
  customEmojiUrlBuilder: _noopCustomEmojiUrl,
  userMentionBuilder: (_, String id, TextStyle style) =>
      Text('@user$id', style: style),
  channelMentionBuilder: (_, String id, TextStyle style) =>
      Text('#channel$id', style: style),
  everyoneMentionBuilder: (_, String label, TextStyle style) =>
      Text(label, style: style),
);

Future<double> _renderedHeight(
  WidgetTester tester, {
  required String data,
  required Finder target,
  required double scale,
  int? maxLines,
  Widget? trailingInlineWidget,
  FluxerMarkdownContext markdownContext =
      FluxerMarkdownContext.standardWithJumbo,
}) async {
  await tester.pumpWidget(
    MaterialApp(
      home: MediaQuery.withClampedTextScaling(
        minScaleFactor: scale,
        maxScaleFactor: scale,
        child: Scaffold(
          body: SizedBox(
            width: 800,
            child: FluxerMarkdown(
              astParser: parseTestMarkdownAst,
              data: data,
              config: _config,
              baseStyle: _baseStyle,
              maxLines: maxLines,
              trailingInlineWidget: trailingInlineWidget,
              context: markdownContext,
            ),
          ),
        ),
      ),
    ),
  );
  await tester.pump();
  return tester.getRect(target.first).height;
}

Future<void> _expectScalesOnce(
  WidgetTester tester, {
  required String data,
  required Finder target,
  int? maxLines,
  Widget? trailingInlineWidget,
  FluxerMarkdownContext markdownContext =
      FluxerMarkdownContext.standardWithJumbo,
}) async {
  final double base = await _renderedHeight(
    tester,
    data: data,
    target: target,
    scale: 1,
    maxLines: maxLines,
    trailingInlineWidget: trailingInlineWidget,
    markdownContext: markdownContext,
  );
  final double scaled = await _renderedHeight(
    tester,
    data: data,
    target: target,
    scale: 1.25,
    maxLines: maxLines,
    trailingInlineWidget: trailingInlineWidget,
    markdownContext: markdownContext,
  );
  expect(scaled / base, closeTo(1.25, 0.05));
}

Finder _textContaining(String text) => find.byWidgetPredicate(
  (Widget widget) =>
      widget is RichText && widget.text.toPlainText().contains(text),
);

void main() {
  group('inline widgets scale with the text once', () {
    testWidgets('user mention', (tester) async {
      await _expectScalesOnce(
        tester,
        data: 'hi <@123> there',
        target: _textContaining('@user123'),
      );
    });

    testWidgets('channel mention', (tester) async {
      await _expectScalesOnce(
        tester,
        data: 'see <#456> now',
        target: _textContaining('#channel456'),
      );
    });

    testWidgets('everyone mention', (tester) async {
      await _expectScalesOnce(
        tester,
        data: 'hey @everyone',
        target: _textContaining('@everyone'),
      );
    });

    testWidgets('relative timestamp', (tester) async {
      await _expectScalesOnce(
        tester,
        data: 'began <t:1767355200:R>',
        target: _textContaining('2026'),
      );
    });

    testWidgets('trailing inline widget', (tester) async {
      await _expectScalesOnce(
        tester,
        data: 'hello',
        target: _textContaining('(edited)'),
        trailingInlineWidget: const Text('(edited)', style: _baseStyle),
      );
    });

    testWidgets('bounded inline spoiler', (tester) async {
      await _expectScalesOnce(
        tester,
        data: 'a ||secret words|| b',
        target: _textContaining('secret words'),
        maxLines: 2,
      );
    });

    testWidgets('block spoiler', (tester) async {
      await _expectScalesOnce(
        tester,
        data: '||\nhidden block text\n||',
        target: _textContaining('hidden block text'),
      );
    });

    testWidgets('block spoiler in a reply preview', (tester) async {
      await _expectScalesOnce(
        tester,
        data: '||\nhidden block text\n||',
        target: _textContaining('hidden block text'),
        markdownContext: FluxerMarkdownContext.restrictedInlineReply,
      );
    });
  });
}
