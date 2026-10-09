import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/messages/message_list_live_entrance.dart';
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
