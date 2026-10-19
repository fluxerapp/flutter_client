import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/channels/domain/channel.dart';
import 'package:fluxer_app/features/threads/presentation/create_thread_sheet.dart';
import 'package:fluxer_app/features/threads/providers/thread_ui_providers.dart';
import 'package:fluxer_app/material_ui.dart';

import '../../../helpers/pump_fluxer_app.dart';

const Channel _parent = Channel(id: 'c1', guildId: 'g1', name: 'general');

bool _textFieldFocused(WidgetTester tester) => tester
    .widgetList<EditableText>(find.byType(EditableText))
    .any((EditableText field) => field.focusNode.hasFocus);

void main() {
  testWidgets('thread name focuses only after the sheet finishes opening', (
    WidgetTester tester,
  ) async {
    tester.view.physicalSize = const Size(390, 844);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.reset);
    await tester.pumpWidget(
      pumpFluxerApp(
        disableAnimations: false,
        overrides: [
          parentThreadActorProvider('g1', 'c1').overrideWithValue(null),
        ],
        child: Scaffold(
          body: Consumer(
            builder: (BuildContext context, WidgetRef ref, Widget? _) =>
                TextButton(
                  onPressed: () =>
                      showCreateThreadSheet(context, ref, parent: _parent),
                  child: const Text('open'),
                ),
          ),
        ),
      ),
    );

    await tester.tap(find.text('open'));
    await tester.pump();
    await tester.pump();
    final ModalRoute<dynamic> route = ModalRoute.of(
      tester.element(find.byType(EditableText).first),
    )!;
    expect(route.animation!.isCompleted, isFalse);
    expect(_textFieldFocused(tester), isFalse);

    await pumpFluxerFrames(tester);
    expect(route.animation!.isCompleted, isTrue);
    expect(_textFieldFocused(tester), isTrue);
  });
}
