import 'package:flutter/gestures.dart' show PointerDeviceKind;
import 'package:flutter/rendering.dart' show SelectedContent;
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_markdown/src/config/fluxer_markdown_config.dart';
import 'package:fluxer_markdown/src/widgets/fluxer_markdown.dart';
import 'package:material_ui/material_ui.dart';
import 'support/native_test_parser.dart';

const String _text = 'hello selectable markdown';

const FluxerMarkdownConfig _config = FluxerMarkdownConfig(
  unicodeEmojiUrlBuilder: _noopUnicodeEmojiUrl,
  customEmojiUrlBuilder: _noopCustomEmojiUrl,
);

const FluxerMarkdownConfig _revealedConfig = FluxerMarkdownConfig(
  unicodeEmojiUrlBuilder: _noopUnicodeEmojiUrl,
  customEmojiUrlBuilder: _noopCustomEmojiUrl,
  spoilersInitiallyRevealed: true,
);

String? _noopUnicodeEmojiUrl(String unicode) => null;

String _noopCustomEmojiUrl({
  required String id,
  required bool animated,
  required int size,
}) => '';

Future<void> _dragAcrossText(WidgetTester tester) async {
  final Finder text = find.byType(RichText);
  final TestGesture drag = await tester.startGesture(
    tester.getTopLeft(text) + const Offset(1, 7),
    kind: PointerDeviceKind.mouse,
  );
  await tester.pump();
  await drag.moveTo(tester.getBottomRight(text) + const Offset(40, -7));
  await tester.pump();
  await drag.up();
  await tester.pumpAndSettle();
}

Future<String> _selectAllIn(
  WidgetTester tester, {
  required String data,
  FluxerMarkdownConfig config = _config,
}) async {
  String selected = '';
  await tester.pumpWidget(
    MaterialApp(
      home: Scaffold(
        body: SelectionArea(
          onSelectionChanged: (SelectedContent? content) =>
              selected = content?.plainText ?? '',
          child: FluxerMarkdown(
            astParser: parseTestMarkdownAst,
            data: data,
            config: config,
          ),
        ),
      ),
    ),
  );
  tester
      .state<SelectableRegionState>(find.byType(SelectableRegion))
      .selectAll(SelectionChangedCause.keyboard);
  await tester.pumpAndSettle();
  return selected;
}

void main() {
  testWidgets('markdown text is selectable inside an outer SelectionArea', (
    WidgetTester tester,
  ) async {
    String selected = '';
    await tester.pumpWidget(
      MaterialApp(
        home: Center(
          child: SelectionArea(
            onSelectionChanged: (SelectedContent? content) =>
                selected = content?.plainText ?? '',
            child: const FluxerMarkdown(
              astParser: parseTestMarkdownAst,
              data: _text,
              config: _config,
            ),
          ),
        ),
      ),
    );

    await _dragAcrossText(tester);

    expect(selected, _text);
  });

  testWidgets('selectable markdown registers its text for selection', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Center(
          child: FluxerMarkdown(
            astParser: parseTestMarkdownAst,
            data: _text,
            config: _config,
            selectable: true,
          ),
        ),
      ),
    );

    await _dragAcrossText(tester);

    final RichText richText = tester.widget<RichText>(find.byType(RichText));
    expect(richText.selectionRegistrar, isNotNull);
    final SelectableRegionState region = tester.state<SelectableRegionState>(
      find.byType(SelectableRegion),
    );
    expect(region.contextMenuButtonItems, isNotEmpty);
  });

  testWidgets('hidden inline spoiler text is left out of the selection', (
    WidgetTester tester,
  ) async {
    final String selected = await _selectAllIn(
      tester,
      data: 'visible ||secret|| text',
    );

    expect(selected, contains('visible'));
    expect(selected, contains('text'));
    expect(selected, isNot(contains('secret')));
    expect(selected, isNot(contains('\uFDD0')));
  });

  testWidgets('revealed inline spoiler text is selectable', (
    WidgetTester tester,
  ) async {
    final String selected = await _selectAllIn(
      tester,
      data: 'visible ||secret|| text',
      config: _revealedConfig,
    );

    expect(selected, contains('secret'));
  });

  testWidgets('hidden block spoiler text is left out of the selection', (
    WidgetTester tester,
  ) async {
    final String selected = await _selectAllIn(
      tester,
      data: 'outside\n\n||\nhidden block\n||',
    );

    expect(selected, contains('outside'));
    expect(selected, isNot(contains('hidden block')));
  });

  testWidgets('copying leaves hidden spoiler text out of the clipboard', (
    WidgetTester tester,
  ) async {
    String? copied;
    tester.binding.defaultBinaryMessenger.setMockMethodCallHandler(
      SystemChannels.platform,
      (MethodCall call) async {
        if (call.method == 'Clipboard.setData') {
          copied = (call.arguments as Map<Object?, Object?>)['text'] as String?;
        }
        return null;
      },
    );
    addTearDown(
      () => tester.binding.defaultBinaryMessenger.setMockMethodCallHandler(
        SystemChannels.platform,
        null,
      ),
    );
    await _selectAllIn(tester, data: 'visible ||secret|| text');

    tester
        .state<SelectableRegionState>(find.byType(SelectableRegion))
        .contextMenuButtonItems
        .firstWhere(
          (ContextMenuButtonItem item) =>
              item.type == ContextMenuButtonType.copy,
        )
        .onPressed!();
    await tester.pumpAndSettle();

    expect(copied, isNotNull);
    expect(copied, contains('visible'));
    expect(copied, isNot(contains('secret')));
  });
}
