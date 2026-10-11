import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/ui/input/fluxer_clipboard_scope.dart';
import 'package:fluxer_app/features/ui/input/text_editing_shortcuts.dart';
import 'package:fluxer_app/material_ui.dart';

Future<void> _sendImeShortcut(String kind) async {
  await TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
      .handlePlatformMessage(
        imeEditingShortcutChannel.name,
        imeEditingShortcutChannel.codec.encodeMethodCall(
          MethodCall('perform', kind),
        ),
        (_) {},
      );
}

Future<void> _pumpField(
  WidgetTester tester,
  TextEditingController controller, {
  FluxerPasteCallback? onPaste,
}) async {
  await tester.pumpWidget(
    MaterialApp(
      home: Scaffold(
        body: FluxerClipboardScope(
          controller: controller,
          onPaste: onPaste,
          builder:
              (
                BuildContext context,
                FluxerClipboardScopeState scope,
                FocusNode fieldFocus,
              ) {
                return TextField(controller: controller, focusNode: fieldFocus);
              },
        ),
      ),
    ),
  );
  await tester.tap(find.byType(TextField));
  await tester.pump();
}

void main() {
  setUp(installImeEditingShortcutHandler);
  tearDown(() => imeEditingShortcutChannel.setMethodCallHandler(null));

  testWidgets('IME select all selects the focused field', (
    WidgetTester tester,
  ) async {
    final TextEditingController controller = TextEditingController(
      text: 'hello',
    );
    addTearDown(controller.dispose);
    await _pumpField(tester, controller);

    await _sendImeShortcut('selectAll');
    await tester.pump();

    expect(controller.selection.baseOffset, 0);
    expect(controller.selection.extentOffset, 5);
  });

  testWidgets('IME undo and redo walk the field history', (
    WidgetTester tester,
  ) async {
    final TextEditingController controller = TextEditingController();
    addTearDown(controller.dispose);
    await _pumpField(tester, controller);

    await tester.enterText(find.byType(TextField), 'hello');
    await tester.pump(const Duration(seconds: 1));
    await tester.enterText(find.byType(TextField), 'hello world');
    await tester.pump(const Duration(seconds: 1));

    await _sendImeShortcut('undo');
    await tester.pump();
    expect(controller.text, 'hello');

    await _sendImeShortcut('redo');
    await tester.pump();
    expect(controller.text, 'hello world');
  });

  testWidgets('IME copy puts the selection on the clipboard', (
    WidgetTester tester,
  ) async {
    String? clipboardText;
    tester.binding.defaultBinaryMessenger.setMockMethodCallHandler(
      SystemChannels.platform,
      (MethodCall call) async {
        if (call.method == 'Clipboard.setData') {
          clipboardText =
              (call.arguments as Map<Object?, Object?>)['text'] as String?;
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
    final TextEditingController controller = TextEditingController(
      text: 'hello world',
    );
    addTearDown(controller.dispose);
    await _pumpField(tester, controller);
    controller.selection = const TextSelection(baseOffset: 6, extentOffset: 11);
    await tester.pump();

    await _sendImeShortcut('copy');
    await tester.pump();

    expect(clipboardText, 'world');
  });

  testWidgets('IME paste goes through the scope paste handler', (
    WidgetTester tester,
  ) async {
    int pastes = 0;
    final TextEditingController controller = TextEditingController();
    addTearDown(controller.dispose);
    await _pumpField(
      tester,
      controller,
      onPaste: ({bool attachmentsOnly = false}) async {
        pastes += 1;
      },
    );

    await _sendImeShortcut('paste');
    await tester.pump();

    expect(pastes, 1);
  });

  testWidgets('IME select all reaches a field outside a clipboard scope', (
    WidgetTester tester,
  ) async {
    final TextEditingController controller = TextEditingController(
      text: 'plain',
    );
    addTearDown(controller.dispose);
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(body: TextField(controller: controller)),
      ),
    );
    await tester.tap(find.byType(TextField));
    await tester.pump();

    await _sendImeShortcut('selectAll');
    await tester.pump();

    expect(controller.selection.baseOffset, 0);
    expect(controller.selection.extentOffset, 5);
  });

  testWidgets('IME shortcuts without a focused field do nothing', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MaterialApp(home: Scaffold()));

    await _sendImeShortcut('selectAll');
    await _sendImeShortcut('unknown');
    await tester.pump();

    expect(tester.takeException(), isNull);
  });
}
