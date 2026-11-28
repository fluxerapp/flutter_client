import 'package:flutter/gestures.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/messages/selection/message_list_selection_area.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/messages/selection/message_selection_content.dart';
import 'package:fluxer_app/material_ui.dart';

const String _first = 'First message body';
const String _second = 'Second message body';

Widget _row(String author, String body) {
  return Builder(
    builder: (BuildContext context) => Padding(
      padding: const EdgeInsets.all(8),
      child: Row(
        children: <Widget>[
          Text(author),
          const SizedBox(width: 8),
          MessageSelectionContent(
            registrar: MessageListSelectionArea.registrarOf(context)!,
            child: Text(body),
          ),
        ],
      ),
    ),
  );
}

Widget _app() {
  return MaterialApp(
    home: Scaffold(
      body: MessageListSelectionArea(
        child: ListView(
          children: <Widget>[_row('Alice', _first), _row('Bob', _second)],
        ),
      ),
    ),
  );
}

void main() {
  testWidgets('selection across messages copies only message bodies', (
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
    await tester.pumpWidget(_app());

    final TestGesture drag = await tester.startGesture(
      tester.getTopLeft(find.text(_first)) + const Offset(1, 6),
      kind: PointerDeviceKind.mouse,
    );
    await tester.pump();
    await drag.moveTo(
      tester.getTopRight(find.text(_second)) + const Offset(-1, 6),
    );
    await tester.pump();
    await drag.up();
    await tester.pumpAndSettle();

    final MessageListSelectionAreaState area = tester.state(
      find.byType(MessageListSelectionArea),
    );
    expect(area.selectedText(), '$_first\n$_second');

    await tester.sendKeyDownEvent(LogicalKeyboardKey.controlLeft);
    await tester.sendKeyEvent(LogicalKeyboardKey.keyC);
    await tester.sendKeyUpEvent(LogicalKeyboardKey.controlLeft);
    await tester.pumpAndSettle();

    expect(copied, '$_first\n$_second');
  });

  testWidgets('right click keeps a snapshot of the selection', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(_app());

    final TestGesture drag = await tester.startGesture(
      tester.getTopLeft(find.text(_first)) + const Offset(1, 6),
      kind: PointerDeviceKind.mouse,
    );
    await tester.pump();
    await drag.moveTo(
      tester.getTopRight(find.text(_first)) + const Offset(-1, 6),
    );
    await tester.pump();
    await drag.up();
    await tester.pumpAndSettle();

    final TestGesture secondary = await tester.startGesture(
      tester.getCenter(find.text(_second)),
      kind: PointerDeviceKind.mouse,
      buttons: kSecondaryMouseButton,
    );
    await tester.pump();
    await secondary.up();
    await tester.pumpAndSettle();

    final MessageListSelectionAreaState area = tester.state(
      find.byType(MessageListSelectionArea),
    );
    expect(area.takeSelectionSnapshot(), _first);
  });

  testWidgets('rows keep their state when list selection toggles', (
    WidgetTester tester,
  ) async {
    Widget build({required bool enabled}) => MaterialApp(
      home: Scaffold(
        body: MessageListSelectionArea(
          enabled: enabled,
          child: ListView(children: const <Widget>[_Counter()]),
        ),
      ),
    );

    await tester.pumpWidget(build(enabled: true));
    await tester.tap(find.byType(_Counter));
    await tester.pump();
    expect(find.text('1'), findsOneWidget);

    await tester.pumpWidget(build(enabled: false));
    expect(find.text('1'), findsOneWidget);

    await tester.pumpWidget(build(enabled: true));
    expect(find.text('1'), findsOneWidget);
  });
}

class _Counter extends StatefulWidget {
  const _Counter();

  @override
  State<_Counter> createState() => _CounterState();
}

class _CounterState extends State<_Counter> {
  int _count = 0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => setState(() => _count++),
      child: Text('$_count'),
    );
  }
}
