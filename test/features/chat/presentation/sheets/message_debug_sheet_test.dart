import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/features/chat/presentation/sheets/message_debug_sheet.dart';
import 'package:fluxer_app/material_ui.dart';

import '../../../../helpers/pump_fluxer_app.dart';
import '../../../../helpers/test_l10n.dart';

Message _message() {
  return Message(
    id: 'message-1',
    channelId: 'channel-1',
    authorId: 'author-1',
    authorName: 'Author',
    content: 'hello',
    timestamp: DateTime.utc(2026),
  );
}

void main() {
  testWidgets('debug JSON long press shows the text selection copy menu', (
    tester,
  ) async {
    await tester.pumpWidget(
      pumpFluxerApp(
        child: Scaffold(
          body: Builder(
            builder: (context) => TextButton(
              onPressed: () =>
                  showMessageDebugSheet(context, message: _message()),
              child: const Text('open'),
            ),
          ),
        ),
      ),
    );

    await tester.tap(find.text('open'));
    await tester.pumpAndSettle();

    expect(find.text(testL10n.chatMessageDebugSheetTitle), findsOneWidget);
    expect(find.text(testL10n.chatMessageDebugCopyJson), findsOneWidget);
    expect(find.byType(SelectableText), findsOneWidget);

    await tester.longPress(find.byType(EditableText));
    await tester.pumpAndSettle();

    expect(find.text('Copy'), findsOneWidget);
  });
}
