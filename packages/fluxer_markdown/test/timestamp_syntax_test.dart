import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_markdown/src/config/fluxer_markdown_config.dart';
import 'package:fluxer_markdown/src/contexts/fluxer_markdown_context.dart';
import 'package:fluxer_markdown/src/contexts/fluxer_markdown_features.dart';
import 'package:fluxer_markdown/src/renderers/fluxer_markdown_element_tags.dart';
import 'package:fluxer_markdown/src/widgets/fluxer_live_timestamp.dart';
import 'package:fluxer_markdown/src/widgets/fluxer_markdown.dart';
import 'package:intl/intl.dart';
import 'package:markdown/markdown.dart' as md;
import 'package:material_ui/material_ui.dart';

import 'support/native_test_parser.dart';

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

final FluxerMarkdownFeatures _features = FluxerMarkdownFeatures.forContext(
  FluxerMarkdownContext.standardWithJumbo,
);

List<md.Node> _parse(String input) => parseTestMarkdownAst(input, _features);

List<md.Element> _timestampNodes(List<md.Node> nodes) {
  final result = <md.Element>[];
  void visit(List<md.Node> current) {
    for (final md.Node node in current) {
      if (node is! md.Element) {
        continue;
      }
      if (node.tag == FluxerMarkdownElementTags.timestamp) {
        result.add(node);
      } else {
        visit(node.children ?? const []);
      }
    }
  }

  visit(nodes);
  return result;
}

String _plainText(List<md.Node> nodes) => collectMarkdownText(nodes);

void main() {
  group('FluxerTimestampSyntax', () {
    test('parses a valid timestamp into a timestamp element', () {
      final nodes = _parse('<t:1618936830:R>');
      final timestamps = _timestampNodes(nodes);
      expect(timestamps, hasLength(1));
      expect(timestamps.single.textContent, '1618936830');
      expect(timestamps.single.attributes['flag'], 'R');
    });

    test('accepts s and S timestamp styles', () {
      final nodes = _parse('<t:1618936830:s> <t:1618936830:S>');
      final timestamps = _timestampNodes(nodes);
      expect(timestamps, hasLength(2));
      expect(timestamps[0].attributes['flag'], 's');
      expect(timestamps[1].attributes['flag'], 'S');
    });

    test('defaults the flag to f when the style is omitted', () {
      final nodes = _parse('<t:1618936830>');
      final timestamps = _timestampNodes(nodes);
      expect(timestamps, hasLength(1));
      expect(timestamps.single.attributes['flag'], 'f');
    });

    test('accepts the maximum representable timestamp', () {
      // 8.64e12 s * 1000 == 8.64e15 ms, the inclusive upper bound of DateTime.
      final nodes = _parse('<t:8640000000000:f>');
      expect(_timestampNodes(nodes), hasLength(1));
    });

    test(
      'renders an overflowing timestamp as literal text instead of crashing',
      () {
        // 15778476000000000 * 1000 overflows a 64-bit int, which previously
        // produced an out-of-range millisecond value and threw a RangeError
        // when building FluxerTimestampWidget.
        const input = '<t:15778476000000000:f>';
        final nodes = _parse(input);
        expect(_timestampNodes(nodes), isEmpty);
        expect(_plainText(nodes), input);
      },
    );

    test('rejects a timestamp one second past the maximum', () {
      const input = '<t:8640000000001:f>';
      final nodes = _parse(input);
      expect(_timestampNodes(nodes), isEmpty);
      expect(_plainText(nodes), input);
    });

    test('rejects a zero timestamp', () {
      const input = '<t:0:f>';
      final nodes = _parse(input);
      expect(_timestampNodes(nodes), isEmpty);
      expect(_plainText(nodes), input);
    });

    test('rejects a value larger than a 64-bit int', () {
      const input = '<t:99999999999999999999:f>';
      final nodes = _parse(input);
      expect(_timestampNodes(nodes), isEmpty);
      expect(_plainText(nodes), input);
    });
  });

  group('FluxerTimestamp rendering', () {
    const baseStyle = TextStyle(fontSize: 16, height: 1.375);

    Future<void> pumpMarkdown(
      WidgetTester tester,
      String text, {
      FluxerMarkdownConfig config = _testMarkdownConfig,
    }) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: FluxerMarkdown(
              astParser: parseTestMarkdownAst,
              data: text,
              config: config,
              baseStyle: baseStyle,
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

    testWidgets('relative timestamps tick without rebuilding markdown', (
      tester,
    ) async {
      var markdownBuilds = 0;
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: _MarkdownBuildCounter(
              onBuild: () => markdownBuilds++,
              child: FluxerMarkdown(
                astParser: parseTestMarkdownAst,
                data: '<t:1618936830:R>',
                config: FluxerMarkdownConfig(
                  resolveEmojiShortcode: _noopEmojiShortcode,
                  unicodeEmojiUrlBuilder: _noopUnicodeEmojiUrl,
                  customEmojiUrlBuilder: _noopCustomEmojiUrl,
                  timestampFormatter: (DateTime _, String style) {
                    if (style != 'R') {
                      return 'static';
                    }
                    return 'tick ${DateTime.now().millisecondsSinceEpoch}';
                  },
                ),
                baseStyle: baseStyle,
              ),
            ),
          ),
        ),
      );

      expect(find.byType(FluxerLiveTimestamp), findsOneWidget);
      final String before = tester.widget<Text>(find.byType(Text).first).data!;
      expect(before, startsWith('tick '));
      expect(markdownBuilds, 1);

      await tester.pump(const Duration(seconds: 1));

      final String after = tester.widget<Text>(find.byType(Text).first).data!;
      expect(after, startsWith('tick '));
      expect(after, isNot(before));
      expect(markdownBuilds, 1);
    });
  });
}

class _MarkdownBuildCounter extends StatefulWidget {
  const _MarkdownBuildCounter({required this.child, required this.onBuild});

  final Widget child;
  final VoidCallback onBuild;

  @override
  State<_MarkdownBuildCounter> createState() => _MarkdownBuildCounterState();
}

class _MarkdownBuildCounterState extends State<_MarkdownBuildCounter> {
  @override
  Widget build(BuildContext context) {
    widget.onBuild();
    return widget.child;
  }
}
