import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/messages/message_list_live_entrance.dart';
import 'package:fluxer_app/material_ui.dart';

void main() {
  testWidgets('starts translated and faded in', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: MessageListLiveEntrance(
            child: SizedBox(height: 40, width: 200),
          ),
        ),
      ),
    );
    await tester.pump();
    final Finder entrance = find.descendant(
      of: find.byType(MessageListLiveEntrance),
      matching: find.byType(Opacity),
    );
    final Opacity opacity = tester.widget(entrance);
    expect(opacity.opacity, lessThan(1));
    final Transform transform = tester.widget(
      find.descendant(
        of: find.byType(MessageListLiveEntrance),
        matching: find.byType(Transform),
      ),
    );
    final Matrix4 matrix = transform.transform;
    expect(matrix.getTranslation().y, greaterThan(0));
  });

  testWidgets('finishes opaque at rest', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: MessageListLiveEntrance(
            child: SizedBox(height: 40, width: 200),
          ),
        ),
      ),
    );
    await tester.pump();
    await tester.pump(kMessageListLiveTailMotionDuration);
    await tester.pump();
    final Opacity opacity = tester.widget(
      find.descendant(
        of: find.byType(MessageListLiveEntrance),
        matching: find.byType(Opacity),
      ),
    );
    expect(opacity.opacity, 1);
    final Transform transform = tester.widget(
      find.descendant(
        of: find.byType(MessageListLiveEntrance),
        matching: find.byType(Transform),
      ),
    );
    expect(transform.transform.getTranslation().y, 0);
  });
}
