import 'package:flutter/gestures.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_markdown/src/config/fluxer_markdown_config.dart';
import 'package:fluxer_markdown/src/renderers/fluxer_markdown_renderers.dart';
import 'package:fluxer_markdown/src/utils/jumbo_emoji.dart';
import 'package:fluxer_markdown/src/widgets/fluxer_markdown.dart';
import 'package:material_ui/material_ui.dart';

const FluxerMarkdownConfig _testMarkdownConfig = FluxerMarkdownConfig(
  resolveEmojiShortcode: _resolveEmojiShortcode,
  unicodeEmojiUrlBuilder: _noopUnicodeEmojiUrl,
  customEmojiUrlBuilder: _noopCustomEmojiUrl,
);

const TextStyle _baseStyle = TextStyle(fontSize: 16, height: 1.375);

String? _resolveEmojiShortcode(String name) {
  if (name == 'thumbsup') {
    return '\u{1F44D}';
  }
  return null;
}

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
}

bool _hasWidgetSpan(InlineSpan span) {
  if (span is WidgetSpan) {
    return true;
  }
  if (span is TextSpan) {
    for (final InlineSpan child in span.children ?? const <InlineSpan>[]) {
      if (_hasWidgetSpan(child)) {
        return true;
      }
    }
  }
  return false;
}

void _visitSpans(InlineSpan span, void Function(InlineSpan span) visit) {
  visit(span);
  if (span is TextSpan) {
    for (final InlineSpan child in span.children ?? const <InlineSpan>[]) {
      _visitSpans(child, visit);
    }
  }
}

List<GestureRecognizer> _recognizersOf(InlineSpan span) {
  final List<GestureRecognizer> recognizers = <GestureRecognizer>[];
  _visitSpans(span, (InlineSpan node) {
    if (node is TextSpan && node.recognizer != null) {
      recognizers.add(node.recognizer!);
    }
  });
  return recognizers;
}

void main() {
  group('inline span rendering', () {
    testWidgets('inline code uses a text span', (tester) async {
      await _pumpMarkdown(tester, 'hello `world` there');
      final RichText richText = tester.widget<RichText>(find.byType(RichText));
      expect(richText.text.toPlainText(), contains('world'));
      expect(_hasWidgetSpan(richText.text), isFalse);
    });

    testWidgets('inline unicode shortcode uses a non-jumbo emoji widget', (
      tester,
    ) async {
      await _pumpMarkdown(tester, 'hello :thumbsup: there');
      final Size size = tester.getSize(find.byType(FluxerEmojiWidget));
      expect(size.height, lessThan(kFluxerMarkdownEmojiSizeJumbo));
      expect(
        size.height,
        closeTo(16 * kFluxerMarkdownEmojiSizeMultiplier, 0.01),
      );
    });

    testWidgets('jumbo unicode-only shortcode still uses an emoji widget', (
      tester,
    ) async {
      await _pumpMarkdown(tester, ':thumbsup:');
      expect(find.byType(FluxerEmojiWidget), findsOneWidget);
    });

    testWidgets('duplicate link hrefs use distinct recognizers', (
      tester,
    ) async {
      await _pumpMarkdown(
        tester,
        'https://example.com/a and https://example.com/a',
      );
      final List<GestureRecognizer> recognizers = _recognizersOf(
        tester.widget<RichText>(find.byType(RichText)).text,
      );
      expect(recognizers, hasLength(2));
      expect(identical(recognizers[0], recognizers[1]), isFalse);
    });
  });
}
