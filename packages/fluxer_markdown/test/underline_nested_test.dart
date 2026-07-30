import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_markdown/src/config/fluxer_markdown_config.dart';
import 'package:fluxer_markdown/src/contexts/fluxer_markdown_context.dart';
import 'package:fluxer_markdown/src/widgets/fluxer_markdown.dart';
import 'support/markdown_parse_test_helper.dart';

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
  final features = MarkdownParseTestHelper.featuresFor(
    FluxerMarkdownContext.restrictedUserBio,
  );

  test('__**text**__ parses nested bold inside underline in messages', () {
    final messageFeatures = MarkdownParseTestHelper.featuresFor(
      FluxerMarkdownContext.standardWithJumbo,
    );
    final nodes = MarkdownParseTestHelper.parseInline(
      '__**text**__',
      messageFeatures,
    );
    expect(MarkdownParseTestHelper.containsTag(nodes, 'underline'), isTrue);
    expect(MarkdownParseTestHelper.containsTag(nodes, 'strong'), isTrue);
    expect(MarkdownParseTestHelper.collectText(nodes), 'text');
  });

  test('__**text**__ parses nested bold inside underline in bios', () {
    final nodes = MarkdownParseTestHelper.parseInline('__**text**__', features);
    expect(MarkdownParseTestHelper.containsTag(nodes, 'underline'), isTrue);
    expect(MarkdownParseTestHelper.containsTag(nodes, 'strong'), isTrue);
    expect(MarkdownParseTestHelper.collectText(nodes), 'text');
  });

  testWidgets('__**text**__ renders bold and underline', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: FluxerMarkdown(
            data: '__**text**__',
            config: _testMarkdownConfig,
            context: FluxerMarkdownContext.restrictedUserBio,
          ),
        ),
      ),
    );
    final RichText richText = tester.widget<RichText>(find.byType(RichText));
    expect(richText.text.toPlainText(), 'text');
    expect(
      _leafTextHasStyle(
        richText.text,
        'text',
        fontWeight: FontWeight.w700,
        decoration: TextDecoration.underline,
      ),
      isTrue,
    );
  });
}

bool _leafTextHasStyle(
  InlineSpan span,
  String leafText, {
  FontWeight? fontWeight,
  TextDecoration? decoration,
}) {
  if (span is! TextSpan) {
    return false;
  }
  final String? text = span.text;
  if (text != null && text.contains(leafText)) {
    final TextStyle? style = span.style;
    if (fontWeight != null && style?.fontWeight != fontWeight) {
      return false;
    }
    if (decoration != null &&
        !(style?.decoration?.contains(decoration) ?? false)) {
      return false;
    }
    return true;
  }
  for (final InlineSpan child in span.children ?? const <InlineSpan>[]) {
    if (_leafTextHasStyle(
      child,
      leafText,
      fontWeight: fontWeight,
      decoration: decoration,
    )) {
      return true;
    }
  }
  return false;
}
