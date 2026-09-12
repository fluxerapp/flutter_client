import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/ui/input/fluxer_clipboard_scope.dart';
import 'package:fluxer_app/material_ui.dart';

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
}
