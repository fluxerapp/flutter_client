import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/ui/input/emoji_text_editing_controller.dart';
import 'package:fluxer_app/features/ui/input/fluxer_clipboard_scope.dart';
import 'package:fluxer_app/material_ui.dart';

Future<void> _pumpScope(
  WidgetTester tester, {
  required TextEditingController controller,
  FluxerNativePasteCallback? onNativePaste,
  bool supportsShowingSystemContextMenu = false,
}) async {
  await tester.pumpWidget(
    MaterialApp(
      builder: (BuildContext context, Widget? child) => MediaQuery(
        data: MediaQuery.of(context).copyWith(
          supportsShowingSystemContextMenu: supportsShowingSystemContextMenu,
        ),
        child: child!,
      ),
      home: Scaffold(
        body: FluxerClipboardScope(
          controller: controller,
          onNativePaste: onNativePaste,
          builder:
              (
                BuildContext context,
                FluxerClipboardScopeState scope,
                FocusNode fieldFocus,
              ) {
                return TextField(
                  controller: controller,
                  focusNode: fieldFocus,
                  contextMenuBuilder: scope.buildContextMenu,
                );
              },
        ),
      ),
    ),
  );
}

MethodCall _nativePaste({String? text, List<Map<String, Object?>>? files}) {
  return MethodCall('paste', <String, Object?>{
    'text': ?text,
    'files': files ?? const <Map<String, Object?>>[],
  });
}

void main() {
  testWidgets('IME select-all control character selects the field', (
    WidgetTester tester,
  ) async {
    final TextEditingController controller = TextEditingController(
      text: 'hello',
    );
    addTearDown(controller.dispose);
    final FocusNode focusNode = FocusNode();
    addTearDown(focusNode.dispose);

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: FluxerClipboardScope(
            controller: controller,
            focusNode: focusNode,
            builder:
                (
                  BuildContext context,
                  FluxerClipboardScopeState scope,
                  FocusNode fieldFocus,
                ) {
                  return TextField(
                    controller: controller,
                    focusNode: fieldFocus,
                  );
                },
          ),
        ),
      ),
    );

    await tester.tap(find.byType(TextField));
    await tester.pump();

    final KeyEventResult result = focusNode.onKeyEvent!(
      focusNode,
      const KeyDownEvent(
        physicalKey: PhysicalKeyboardKey.keyA,
        logicalKey: LogicalKeyboardKey.keyA,
        character: '\u0001',
        timeStamp: Duration.zero,
      ),
    );

    expect(result, KeyEventResult.handled);
    expect(controller.selection.baseOffset, 0);
    expect(controller.selection.extentOffset, 5);
  });

  group('handleNativePasteCall', () {
    testWidgets('leaves plain fields to the platform paste', (
      WidgetTester tester,
    ) async {
      final TextEditingController controller = TextEditingController();
      addTearDown(controller.dispose);
      await _pumpScope(tester, controller: controller);
      await tester.tap(find.byType(TextField));
      await tester.pump();

      expect(await handleNativePasteCall(_nativePaste(text: 'hi')), isFalse);
      expect(controller.text, isEmpty);
    });

    testWidgets('ignores pastes when no scope has focus', (
      WidgetTester tester,
    ) async {
      final TextEditingController controller = TextEditingController();
      addTearDown(controller.dispose);
      var called = false;
      await _pumpScope(
        tester,
        controller: controller,
        onNativePaste:
            ({
              required String? text,
              required List<NativePasteFile> files,
            }) async {
              called = true;
              return true;
            },
      );

      expect(await handleNativePasteCall(_nativePaste(text: 'hi')), isFalse);
      expect(called, isFalse);
    });

    testWidgets('chips inline tokens pasted into a token field', (
      WidgetTester tester,
    ) async {
      final EmojiTextEditingController controller =
          EmojiTextEditingController();
      addTearDown(controller.dispose);
      await _pumpScope(tester, controller: controller);
      await tester.tap(find.byType(TextField));
      await tester.pump();

      expect(await handleNativePasteCall(_nativePaste(text: ':wave:')), isTrue);
      expect(controller.actualText, ':wave:');
      expect(controller.text.length, 1);
    });

    testWidgets('forwards text and files to the scope paste handler', (
      WidgetTester tester,
    ) async {
      final TextEditingController controller = TextEditingController();
      addTearDown(controller.dispose);
      String? pastedText;
      List<NativePasteFile>? pastedFiles;
      await _pumpScope(
        tester,
        controller: controller,
        onNativePaste:
            ({
              required String? text,
              required List<NativePasteFile> files,
            }) async {
              pastedText = text;
              pastedFiles = files;
              return true;
            },
      );
      await tester.tap(find.byType(TextField));
      await tester.pump();

      final bool handled = await handleNativePasteCall(
        _nativePaste(
          files: <Map<String, Object?>>[
            <String, Object?>{
              'data': Uint8List.fromList(<int>[1, 2, 3]),
              'name': 'clipboard.png',
              'mimeType': 'image/png',
            },
          ],
        ),
      );

      expect(handled, isTrue);
      expect(pastedText, isNull);
      expect(pastedFiles, hasLength(1));
      expect(pastedFiles!.single.name, 'clipboard.png');
      expect(pastedFiles!.single.mimeType, 'image/png');
      expect(pastedFiles!.single.bytes, <int>[1, 2, 3]);
    });
  });

  testWidgets('uses the system context menu on iOS', (
    WidgetTester tester,
  ) async {
    final EmojiTextEditingController controller = EmojiTextEditingController()
      ..text = 'hello';
    addTearDown(controller.dispose);
    final List<MethodCall> calls = <MethodCall>[];
    tester.binding.defaultBinaryMessenger.setMockMethodCallHandler(
      SystemChannels.platform,
      (MethodCall call) async {
        calls.add(call);
        if (call.method == 'Clipboard.hasStrings') {
          return <String, bool>{'value': true};
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
    await _pumpScope(
      tester,
      controller: controller,
      supportsShowingSystemContextMenu: true,
    );
    await tester.tap(find.byType(TextField));
    await tester.pump();
    controller.selection = const TextSelection(baseOffset: 0, extentOffset: 5);
    await tester.pump();

    final EditableTextState state = tester.state<EditableTextState>(
      find.byType(EditableText),
    );
    expect(state.showToolbar(), isTrue);
    await tester.pump();

    final MethodCall show = calls.lastWhere(
      (MethodCall call) => call.method == 'ContextMenu.showSystemContextMenu',
    );
    final List<Object?> items =
        (show.arguments as Map<Object?, Object?>)['items']! as List<Object?>;
    final List<Object?> types = <Object?>[
      for (final Object? item in items)
        (item! as Map<Object?, Object?>)['type'],
    ];
    expect(types, containsAllInOrder(<Object?>['custom', 'custom', 'paste']));
    expect(
      calls.where((MethodCall call) => call.method == 'Clipboard.getData'),
      isEmpty,
    );
  }, variant: TargetPlatformVariant.only(TargetPlatform.iOS));
}
