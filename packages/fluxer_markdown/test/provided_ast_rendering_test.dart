import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_markdown/src/config/fluxer_markdown_config.dart';
import 'package:fluxer_markdown/src/contexts/fluxer_markdown_context.dart';
import 'package:fluxer_markdown/src/contexts/fluxer_markdown_features.dart';
import 'package:fluxer_markdown/src/widgets/fluxer_markdown.dart';
import 'package:fluxer_markdown/src/widgets/system_emoji_fallback.dart';
import 'package:markdown/markdown.dart' as md;
import 'package:material_ui/material_ui.dart';

const FluxerMarkdownConfig _testConfig = FluxerMarkdownConfig(
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
  return KeyedSubtree(key: ValueKey('alert-${type.name}'), child: body);
}

md.Element _element(
  String tag,
  List<md.Node> children, [
  Map<String, String> attributes = const {},
]) {
  final element = md.Element(tag, children);
  element.attributes.addAll(attributes);
  return element;
}

List<md.Node>? _paragraphParser(String data, FluxerMarkdownFeatures features) {
  return [
    _element('p', [md.Text(data)]),
  ];
}

List<md.Node>? _alertParser(String data, FluxerMarkdownFeatures features) {
  return [
    _element(
      'alert',
      [
        _element('p', [md.Text(data)]),
      ],
      {'type': 'caution'},
    ),
  ];
}

List<md.Node>? _subtextParser(String data, FluxerMarkdownFeatures features) {
  return [
    _element('subtext', [md.Text(data)]),
  ];
}

List<md.Node>? _blockSpoilerParser(
  String data,
  FluxerMarkdownFeatures features,
) {
  return [
    _element('block-spoiler', [md.Text(data)]),
  ];
}

List<md.Node>? _fallbackParser(String data, FluxerMarkdownFeatures features) =>
    null;

Widget _wrap(Widget child) => MaterialApp(home: Scaffold(body: child));

void main() {
  testWidgets('provided paragraph renders through block renderer', (
    tester,
  ) async {
    await tester.pumpWidget(
      _wrap(
        const FluxerMarkdown(
          data: 'provided paragraph body',
          config: _testConfig,
          astParser: _paragraphParser,
        ),
      ),
    );
    expect(
      find.textContaining('provided paragraph body', findRichText: true),
      findsOneWidget,
    );
  });

  testWidgets('alert element routes to the alert builder', (tester) async {
    await tester.pumpWidget(
      _wrap(
        const FluxerMarkdown(
          data: 'alert body text',
          config: _testConfig,
          astParser: _alertParser,
        ),
      ),
    );
    expect(find.byKey(const ValueKey('alert-caution')), findsOneWidget);
    expect(
      find.textContaining('alert body text', findRichText: true),
      findsOneWidget,
    );
  });

  testWidgets('subtext element renders with reduced font size', (tester) async {
    await tester.pumpWidget(
      _wrap(
        const FluxerMarkdown(
          data: 'subtext body',
          config: _testConfig,
          baseStyle: TextStyle(fontSize: 16),
          astParser: _subtextParser,
        ),
      ),
    );
    final RichText richText = tester.widget<RichText>(find.byType(RichText));
    expect(richText.text.style?.fontSize, closeTo(13, 0.5));
  });

  testWidgets('block-spoiler element conceals its content', (tester) async {
    await tester.pumpWidget(
      _wrap(
        const FluxerMarkdown(
          data: 'hidden block content',
          config: _testConfig,
          astParser: _blockSpoilerParser,
        ),
      ),
    );
    expect(
      find.textContaining('hidden block content', findRichText: true),
      findsOneWidget,
    );
  });

  testWidgets('inline spoiler in provided AST reveals on tap', (tester) async {
    List<md.Node>? spoilerParser(String data, FluxerMarkdownFeatures features) {
      return [
        _element('p', [
          md.Text('before '),
          _element('spoiler', [md.Text('secret words')]),
        ]),
      ];
    }

    await tester.pumpWidget(
      _wrap(
        FluxerMarkdown(
          data: 'inline spoiler reveal case',
          config: _testConfig,
          astParser: spoilerParser,
        ),
      ),
    );
    expect(
      find.textContaining('secret words', findRichText: true),
      findsOneWidget,
    );
    await tester.tapAt(tester.getCenter(find.byType(RichText)));
    await tester.pumpAndSettle();
    expect(
      find.textContaining('secret words', findRichText: true),
      findsOneWidget,
    );
  });

  testWidgets('trailing inline widget appends to the last paragraph', (
    tester,
  ) async {
    await tester.pumpWidget(
      _wrap(
        const FluxerMarkdown(
          data: 'trailing widget case',
          config: _testConfig,
          astParser: _paragraphParser,
          trailingInlineWidget: SizedBox(
            key: Key('trailing'),
            width: 10,
            height: 10,
          ),
        ),
      ),
    );
    expect(find.byKey(const Key('trailing')), findsOneWidget);
    expect(find.byType(RichText), findsOneWidget);
  });

  testWidgets('null parser result falls back to the classic pipeline', (
    tester,
  ) async {
    await tester.pumpWidget(
      _wrap(
        const FluxerMarkdown(
          data: '**classic fallback bold**',
          config: _testConfig,
          astParser: _fallbackParser,
        ),
      ),
    );
    expect(
      find.textContaining('classic fallback bold', findRichText: true),
      findsOneWidget,
    );
  });

  testWidgets('emoji post-pass expands unicode emoji in text leaves', (
    tester,
  ) async {
    final config = FluxerMarkdownConfig(
      resolveEmojiShortcode: _noopEmojiShortcode,
      unicodeEmojiUrlBuilder: _noopUnicodeEmojiUrl,
      customEmojiUrlBuilder: _noopCustomEmojiUrl,
      unicodeEmojiPattern: RegExp('\u{1F600}'),
    );
    await tester.pumpWidget(
      _wrap(
        FluxerMarkdown(
          data: 'emoji postpass \u{1F600} case',
          config: config,
          astParser: _paragraphParser,
        ),
      ),
    );
    expect(find.byType(SystemEmojiFallback), findsOneWidget);
  });

  testWidgets('restricted inline preview flattens provided AST to one line', (
    tester,
  ) async {
    List<md.Node>? multiBlockParser(
      String data,
      FluxerMarkdownFeatures features,
    ) {
      return [
        _element('p', [md.Text('first line')]),
        _element('p', [md.Text('second line')]),
      ];
    }

    await tester.pumpWidget(
      _wrap(
        FluxerMarkdown(
          data: 'restricted preview case',
          config: _testConfig,
          context: FluxerMarkdownContext.restrictedInlineReply,
          maxLines: 1,
          astParser: multiBlockParser,
        ),
      ),
    );
    expect(find.byType(RichText), findsOneWidget);
    expect(
      find.textContaining('first line second line', findRichText: true),
      findsOneWidget,
    );
  });
}
