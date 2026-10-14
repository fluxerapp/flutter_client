import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/features/chat/presentation/sheets/message_debug_sheet.dart';
import 'package:fluxer_app/features/ui/ui.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/widgets/debug_bottom_sheet.dart';

import '../../helpers/pump_fluxer_app.dart';
import '../../helpers/test_l10n.dart';

Future<void> _open(
  WidgetTester tester,
  void Function(BuildContext context) open,
) async {
  await tester.pumpWidget(const SizedBox());
  await tester.pumpWidget(
    pumpFluxerApp(
      child: Scaffold(
        body: Builder(
          builder: (context) => TextButton(
            onPressed: () => open(context),
            child: const Text('open'),
          ),
        ),
      ),
    ),
  );
  await tester.tap(find.text('open'));
  await tester.pumpAndSettle();
}

List<Type> _layout(WidgetTester tester) {
  final Finder body = find.byType(SingleChildScrollView).last;
  return <Type>[
    for (final Type type in <Type>[
      FluxerMenuGroup,
      FluxerBottomSheetMenuItem,
      SelectableText,
    ])
      if (find
          .descendant(of: body, matching: find.byType(type))
          .evaluate()
          .isNotEmpty)
        type,
  ];
}

void main() {
  testWidgets('channel and message debug sheets share one layout', (
    tester,
  ) async {
    await _open(
      tester,
      (context) => showDebugBottomSheet(
        context,
        title: 'Debug channel',
        data: <String, Object?>{'id': '1', 'name': 'general'},
      ),
    );
    expect(find.text(testL10n.chatMessageDebugCopyJson), findsOneWidget);
    final List<Type> channelLayout = _layout(tester);

    await _open(
      tester,
      (context) => showMessageDebugSheet(
        context,
        message: Message(
          id: 'message-1',
          channelId: 'channel-1',
          authorId: 'author-1',
          authorName: 'Author',
          content: 'hello',
          timestamp: DateTime.utc(2026),
        ),
      ),
    );
    final List<Type> messageLayout = _layout(tester);

    expect(channelLayout, messageLayout);
    expect(channelLayout, <Type>[
      FluxerMenuGroup,
      FluxerBottomSheetMenuItem,
      SelectableText,
    ]);
  });
}
