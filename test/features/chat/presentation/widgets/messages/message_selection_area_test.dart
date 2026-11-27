import 'package:flutter/gestures.dart';
import 'package:flutter/rendering.dart' show RendererBinding;
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/messages/chat_list_keyboard_dismiss.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/messages/message_selection_area.dart';
import 'package:fluxer_app/material_ui.dart';

const String _text = 'Hello there selectable message text';

Widget _app({required GestureTapUpCallback onSecondary}) {
  return MaterialApp(
    home: Scaffold(
      body: ChatListKeyboardDismiss(
        child: Center(
          child: MessageSelectionArea(
            contextMenuBuilder:
                (BuildContext context, SelectableRegionState state) =>
                    AdaptiveTextSelectionToolbar.selectableRegion(
                      selectableRegionState: state,
                    ),
            onSecondaryTapUpWithoutSelection: onSecondary,
            child: const Text(_text),
          ),
        ),
      ),
    ),
  );
}

void main() {
  testWidgets('right click without a selection opens the message menu', (
    WidgetTester tester,
  ) async {
    int calls = 0;
    await tester.pumpWidget(_app(onSecondary: (_) => calls++));

    await tester.tapAt(
      tester.getCenter(find.text(_text)),
      buttons: kSecondaryMouseButton,
      kind: PointerDeviceKind.mouse,
    );
    await tester.pumpAndSettle();

    expect(calls, 1);
  });

  testWidgets('mouse drag selects text and right click keeps the selection', (
    WidgetTester tester,
  ) async {
    int calls = 0;
    await tester.pumpWidget(_app(onSecondary: (_) => calls++));

    final Finder text = find.text(_text);
    final Offset start = tester.getTopLeft(text) + const Offset(2, 6);
    final Offset end = tester.getCenter(text);
    final TestGesture drag = await tester.startGesture(
      start,
      kind: PointerDeviceKind.mouse,
    );
    await tester.pump();
    await drag.moveTo(end);
    await tester.pump();
    await drag.up();
    await tester.pumpAndSettle();

    await tester.tapAt(
      end - const Offset(4, 0),
      buttons: kSecondaryMouseButton,
      kind: PointerDeviceKind.mouse,
    );
    await tester.pumpAndSettle();

    expect(calls, 0);
  });

  testWidgets('mouse selection in the chat list copies with the shortcut', (
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
    await tester.pumpWidget(_app(onSecondary: (_) {}));

    final Finder text = find.text(_text);
    final TestGesture drag = await tester.startGesture(
      tester.getTopLeft(text) + const Offset(1, 6),
      kind: PointerDeviceKind.mouse,
    );
    await tester.pump();
    await drag.moveTo(tester.getTopRight(text) + const Offset(-1, 6));
    await tester.pump();
    await drag.up();
    await tester.pumpAndSettle();

    await tester.sendKeyDownEvent(LogicalKeyboardKey.controlLeft);
    await tester.sendKeyEvent(LogicalKeyboardKey.keyC);
    await tester.sendKeyUpEvent(LogicalKeyboardKey.controlLeft);
    await tester.pumpAndSettle();

    expect(copied, _text);
  });

  testWidgets('hovering selectable text shows the text cursor', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(_app(onSecondary: (_) {}));
    final TestGesture mouse = await tester.createGesture(
      kind: PointerDeviceKind.mouse,
    );
    await mouse.addPointer(location: tester.getCenter(find.text(_text)));
    addTearDown(mouse.removePointer);
    await tester.pump();

    expect(
      RendererBinding.instance.mouseTracker.debugDeviceActiveCursor(1),
      SystemMouseCursors.text,
    );
  });
}
