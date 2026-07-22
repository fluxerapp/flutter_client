import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_markdown/src/config/fluxer_markdown_config.dart';
import 'package:fluxer_markdown/src/contexts/fluxer_markdown_context.dart';
import 'package:fluxer_markdown/src/contexts/fluxer_markdown_features.dart';
import 'package:fluxer_markdown/src/renderers/fluxer_markdown_renderers.dart';
import 'package:fluxer_markdown/src/syntaxes/fluxer_markdown_syntaxes.dart';
import 'package:intl/intl.dart';
import 'package:markdown/markdown.dart' as md;

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

md.Document _inlineDocument() => md.Document(
  encodeHtml: false,
  withDefaultBlockSyntaxes: false,
  blockSyntaxes: const [],
  inlineSyntaxes: [FluxerTimestampSyntax()],
);

List<md.Element> _timestampNodes(List<md.Node> nodes) => nodes
    .whereType<md.Element>()
    .where((node) => node.tag == FluxerTimestampSyntax.tag)
    .toList();

String _plainText(List<md.Node> nodes) =>
    nodes.map((node) => node.textContent).join();

void main() {
  group('FluxerTimestampSyntax', () {
    test('parses a valid timestamp into a timestamp element', () {
      final nodes = _inlineDocument().parseInline('<t:1618936830:R>');
      final timestamps = _timestampNodes(nodes);
      expect(timestamps, hasLength(1));
      expect(timestamps.single.textContent, '1618936830');
      expect(timestamps.single.attributes['flag'], 'R');
    });

    test('accepts s and S timestamp styles', () {
      final nodes = _inlineDocument().parseInline(
        '<t:1618936830:s> <t:1618936830:S>',
      );
      final timestamps = _timestampNodes(nodes);
      expect(timestamps, hasLength(2));
      expect(timestamps[0].attributes['flag'], 's');
      expect(timestamps[1].attributes['flag'], 'S');
    });

    test('defaults the flag to f when the style is omitted', () {
      final nodes = _inlineDocument().parseInline('<t:1618936830>');
      final timestamps = _timestampNodes(nodes);
      expect(timestamps, hasLength(1));
      expect(timestamps.single.attributes['flag'], 'f');
    });

    test('accepts the maximum representable timestamp', () {
      // 8.64e12 s * 1000 == 8.64e15 ms, the inclusive upper bound of DateTime.
      final nodes = _inlineDocument().parseInline('<t:8640000000000:f>');
      expect(_timestampNodes(nodes), hasLength(1));
    });

    test(
      'renders an overflowing timestamp as literal text instead of crashing',
      () {
        // 15778476000000000 * 1000 overflows a 64-bit int, which previously
        // produced an out-of-range millisecond value and threw a RangeError
        // when building FluxerTimestampWidget.
        const input = '<t:15778476000000000:f>';
        final nodes = _inlineDocument().parseInline(input);
        expect(_timestampNodes(nodes), isEmpty);
        expect(_plainText(nodes), input);
      },
    );

    test('rejects a timestamp one second past the maximum', () {
      const input = '<t:8640000000001:f>';
      final nodes = _inlineDocument().parseInline(input);
      expect(_timestampNodes(nodes), isEmpty);
      expect(_plainText(nodes), input);
    });

    test('rejects a zero timestamp', () {
      const input = '<t:0:f>';
      final nodes = _inlineDocument().parseInline(input);
      expect(_timestampNodes(nodes), isEmpty);
      expect(_plainText(nodes), input);
    });

    test('rejects a value larger than a 64-bit int', () {
      const input = '<t:99999999999999999999:f>';
      final nodes = _inlineDocument().parseInline(input);
      expect(_timestampNodes(nodes), isEmpty);
      expect(_plainText(nodes), input);
    });
  });

  group('FluxerTimestamp rendering', () {
    final features = FluxerMarkdownFeatures.forContext(
      FluxerMarkdownContext.standardWithJumbo,
    );
    const baseStyle = TextStyle(fontSize: 16, height: 1.375);

    Future<void> pumpMarkdown(
      WidgetTester tester,
      String text, {
      FluxerMarkdownConfig config = _testMarkdownConfig,
    }) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Builder(
              builder: (context) => buildFluxerMarkdownTextFlow(
                context: context,
                text: text,
                baseStyle: baseStyle,
                config: config,
                features: features,
                inlineDocument: _inlineDocument(),
                selectable: false,
                isDark: false,
              ),
            ),
          ),
        ),
      );
    }

    testWidgets('does not throw when rendering an out-of-range timestamp', (
      tester,
    ) async {
      await pumpMarkdown(tester, '<t:15778476000000000:f>');
      expect(tester.takeException(), isNull);
    });

    testWidgets('renders a valid timestamp as inline formatted text', (
      tester,
    ) async {
      const int unix = 1618936830;
      await pumpMarkdown(tester, '<t:$unix:f>');
      expect(tester.takeException(), isNull);
      final List<String> renderedTexts = tester
          .widgetList<RichText>(find.byType(RichText))
          .map((RichText richText) => richText.text.toPlainText())
          .toList();
      final String expected = DateFormat.yMMMMd(
        'en-US',
      ).add_Hm().format(DateTime.fromMillisecondsSinceEpoch(unix * 1000));
      expect(renderedTexts, contains(expected));
      expect(renderedTexts.any((String t) => t.contains('<t:')), isFalse);
    });

    testWidgets('uses the configured timestamp formatter', (tester) async {
      DateTime? seenDateTime;
      String? seenStyle;
      final FluxerMarkdownConfig config = FluxerMarkdownConfig(
        resolveEmojiShortcode: _noopEmojiShortcode,
        unicodeEmojiUrlBuilder: _noopUnicodeEmojiUrl,
        customEmojiUrlBuilder: _noopCustomEmojiUrl,
        timestampFormatter: (DateTime localDateTime, String style) {
          seenDateTime = localDateTime;
          seenStyle = style;
          return 'localised timestamp';
        },
      );

      await pumpMarkdown(tester, '<t:1618936830:D>', config: config);

      expect(seenDateTime?.millisecondsSinceEpoch, 1618936830 * 1000);
      expect(seenStyle, 'D');
      final List<String> renderedTexts = tester
          .widgetList<RichText>(find.byType(RichText))
          .map((RichText richText) => richText.text.toPlainText())
          .toList();
      expect(renderedTexts, contains('localised timestamp'));
    });
  });
}
