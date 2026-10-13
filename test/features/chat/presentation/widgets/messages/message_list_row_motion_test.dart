import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/messages/message_list_row_motion.dart';
import 'package:fluxer_app/material_ui.dart';

void main() {
  testWidgets('MessageListLiveRemoval collapses', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: MessageListLiveRemoval(child: SizedBox(height: 80, width: 200)),
        ),
      ),
    );
    await tester.pump();
    await tester.pump(kMessageListLiveTailMotionDuration);
    await tester.pump();
    expect(find.byType(SizedBox), findsOneWidget);
  });

  testWidgets('MessageListLiveRemoval drops the row at once when motion off', (
    tester,
  ) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: MediaQuery(
          data: MediaQueryData(disableAnimations: true),
          child: Scaffold(
            body: Align(
              alignment: Alignment.topLeft,
              child: MessageListLiveRemoval(
                child: SizedBox(height: 80, width: 200, child: Text('gone')),
              ),
            ),
          ),
        ),
      ),
    );
    expect(find.text('gone'), findsNothing);
    expect(tester.getSize(find.byType(MessageListLiveRemoval)), Size.zero);
  });

  testWidgets('MessageListRowResize passes child through when motion off', (
    tester,
  ) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: MediaQuery(
          data: MediaQueryData(disableAnimations: true),
          child: Scaffold(body: MessageListRowResize(child: Text('hello'))),
        ),
      ),
    );
    expect(find.text('hello'), findsOneWidget);
    expect(find.byType(AnimatedSize), findsNothing);
  });
}
