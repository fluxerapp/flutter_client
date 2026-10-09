import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/chat/providers/core/chat_view_model.dart';
import 'package:fluxer_app/features/chat/services/composer_mention_controller.dart';
import 'package:fluxer_app/features/chat/services/composer_text_session.dart';

Future<
  ({
    ProviderContainer container,
    ComposerMentionController controller,
    ComposerTextSession session,
    FocusNode focusNode,
  })
>
_pumpSession(WidgetTester tester) async {
  late ProviderContainer container;
  ComposerMentionController? controller;
  ComposerTextSession? session;
  final FocusNode focusNode = FocusNode();
  addTearDown(focusNode.dispose);

  await tester.pumpWidget(
    UncontrolledProviderScope(
      container: container = ProviderContainer(
        overrides: [chatViewModelProvider.overrideWith(ChatViewModel.new)],
      ),
      child: MaterialApp(
        home: Scaffold(
          body: Consumer(
            builder: (BuildContext context, WidgetRef ref, Widget? _) {
              controller ??= ComposerMentionController(ref: ref);
              session ??= ComposerTextSession(
                ref: ref,
                controller: controller!,
                focusNode: focusNode,
              );
              return TextField(controller: controller, focusNode: focusNode);
            },
          ),
        ),
      ),
    ),
  );
  addTearDown(container.dispose);
  await tester.pumpAndSettle();
  return (
    container: container,
    controller: controller!,
    session: session!,
    focusNode: focusNode,
  );
}

void main() {
  testWidgets('pushes controller wire text into chat view model', (
    tester,
  ) async {
    final setup = await _pumpSession(tester);
    setup.controller.text = 'hello';
    setup.session.onControllerChanged();
    await tester.pump();

    expect(setup.container.read(chatViewModelProvider).messageText, 'hello');
  });

  testWidgets('onChannelChanged applies view model text to controller', (
    tester,
  ) async {
    final setup = await _pumpSession(tester);
    setup.controller.text = 'channel-a';
    setup.container
        .read(chatViewModelProvider.notifier)
        .updateMessageText('channel-b-draft');
    setup.session.onChannelChanged();
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 50));

    expect(setup.controller.toWireText(), 'channel-b-draft');
    expect(
      setup.container.read(chatViewModelProvider).messageText,
      'channel-b-draft',
    );
  });

  testWidgets('does not push stale text during channel apply', (tester) async {
    final setup = await _pumpSession(tester);
    setup.controller.text = 'stale-local';
    setup.container.read(chatViewModelProvider.notifier).updateMessageText('');
    setup.session.onChannelChanged();
    setup.session.onControllerChanged();
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 50));

    expect(setup.container.read(chatViewModelProvider).messageText, '');
  });
}
