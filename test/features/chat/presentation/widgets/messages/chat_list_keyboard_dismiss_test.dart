import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/messages/chat_list_keyboard_dismiss.dart';
import 'package:fluxer_app/material_ui.dart';

void main() {
  Future<FocusNode> pumpFocusedField(WidgetTester tester) async {
    final FocusNode focus = FocusNode();
    addTearDown(focus.dispose);
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Column(
            children: <Widget>[
              SizedBox(height: 48, child: TextField(focusNode: focus)),
              const Expanded(
                child: ChatListKeyboardDismiss(
                  child: ColoredBox(
                    color: Color(0xFF112233),
                    child: SizedBox.expand(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
    focus.requestFocus();
    await tester.pump();
    expect(focus.hasFocus, isTrue);
    return focus;
  }

  Offset listCenter(WidgetTester tester) {
    return tester.getCenter(find.byType(ChatListKeyboardDismiss));
  }

  testWidgets('pointer down does not dismiss the keyboard', (tester) async {
    final FocusNode focus = await pumpFocusedField(tester);
    final TestGesture gesture = await tester.startGesture(listCenter(tester));
    await tester.pump();
    expect(focus.hasFocus, isTrue);
    await gesture.up();
  });

  testWidgets('tap on the list dismisses the keyboard', (tester) async {
    final FocusNode focus = await pumpFocusedField(tester);
    await tester.tapAt(listCenter(tester));
    await tester.pump();
    expect(focus.hasFocus, isFalse);
  });

  testWidgets('cancelled press does not dismiss the keyboard', (tester) async {
    final FocusNode focus = await pumpFocusedField(tester);
    final TestGesture gesture = await tester.startGesture(listCenter(tester));
    await gesture.cancel();
    await tester.pump();
    expect(focus.hasFocus, isTrue);
  });

  testWidgets('vertical drag dismisses the keyboard', (tester) async {
    final FocusNode focus = await pumpFocusedField(tester);
    final TestGesture gesture = await tester.startGesture(listCenter(tester));
    await gesture.moveBy(const Offset(0, 40));
    await tester.pump();
    expect(focus.hasFocus, isFalse);
    await gesture.up();
  });

  testWidgets('leftward swipe keeps the keyboard focused', (tester) async {
    final FocusNode focus = await pumpFocusedField(tester);
    final TestGesture gesture = await tester.startGesture(listCenter(tester));
    await gesture.moveBy(const Offset(-40, 0));
    await tester.pump();
    expect(focus.hasFocus, isTrue);
    await gesture.up();
    await tester.pump();
    expect(focus.hasFocus, isTrue);
  });

  testWidgets('clear leftward move keeps the keyboard focused', (tester) async {
    final FocusNode focus = await pumpFocusedField(tester);
    final TestGesture gesture = await tester.startGesture(listCenter(tester));
    await gesture.moveBy(const Offset(-80, 8));
    await tester.pump();
    expect(focus.hasFocus, isTrue);
    await gesture.up();
    await tester.pump();
    expect(focus.hasFocus, isTrue);
  });

  testWidgets('mostly vertical move dismisses the keyboard', (tester) async {
    final FocusNode focus = await pumpFocusedField(tester);
    final TestGesture gesture = await tester.startGesture(listCenter(tester));
    await gesture.moveBy(const Offset(-20, 40));
    await tester.pump();
    expect(focus.hasFocus, isFalse);
    await gesture.up();
  });

  testWidgets('tap on the list calls onDismissPanels', (tester) async {
    int dismissCount = 0;
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: ChatListKeyboardDismiss(
            onDismissPanels: () => dismissCount++,
            child: const ColoredBox(
              color: Color(0xFF112233),
              child: SizedBox.expand(),
            ),
          ),
        ),
      ),
    );
    await tester.tapAt(listCenter(tester));
    await tester.pump();
    expect(dismissCount, 1);
  });

  testWidgets('vertical drag calls onDismissPanels', (tester) async {
    int dismissCount = 0;
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: ChatListKeyboardDismiss(
            onDismissPanels: () => dismissCount++,
            child: const ColoredBox(
              color: Color(0xFF112233),
              child: SizedBox.expand(),
            ),
          ),
        ),
      ),
    );
    final TestGesture gesture = await tester.startGesture(listCenter(tester));
    await gesture.moveBy(const Offset(0, 40));
    await tester.pump();
    expect(dismissCount, 1);
    await gesture.up();
  });

  testWidgets('leftward swipe does not call onDismissPanels', (tester) async {
    int dismissCount = 0;
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: ChatListKeyboardDismiss(
            onDismissPanels: () => dismissCount++,
            child: const ColoredBox(
              color: Color(0xFF112233),
              child: SizedBox.expand(),
            ),
          ),
        ),
      ),
    );
    final TestGesture gesture = await tester.startGesture(listCenter(tester));
    await gesture.moveBy(const Offset(-40, 0));
    await tester.pump();
    await gesture.up();
    await tester.pump();
    expect(dismissCount, 0);
  });

  testWidgets('cancelled press does not call onDismissPanels', (tester) async {
    int dismissCount = 0;
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: ChatListKeyboardDismiss(
            onDismissPanels: () => dismissCount++,
            child: const ColoredBox(
              color: Color(0xFF112233),
              child: SizedBox.expand(),
            ),
          ),
        ),
      ),
    );
    final TestGesture gesture = await tester.startGesture(listCenter(tester));
    await gesture.cancel();
    await tester.pump();
    expect(dismissCount, 0);
  });
}
