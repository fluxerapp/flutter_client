import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/input/domain/keybind_action.dart';
import 'package:fluxer_app/features/input/domain/keybind_dispatch_context.dart';
import 'package:fluxer_app/features/input/services/keybind_dispatcher.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  test('escape priority prefers decline call over mark channel read', () {
    final KeybindDispatcher dispatcher = KeybindDispatcher();
    const KeyEvent event = KeyDownEvent(
      physicalKey: PhysicalKeyboardKey.escape,
      logicalKey: LogicalKeyboardKey.escape,
      timeStamp: Duration.zero,
    );
    final List<KeybindAction> actions = dispatcher.matchActions(
      event: event,
      context: const KeybindDispatchContext(
        keyboardModeEnabled: false,
        hasMessageFocus: false,
        editableHasFocus: false,
        editableText: '',
        modalOpen: false,
        fullscreenMediaOpen: false,
        hasIncomingCall: true,
        channelHasUnread: true,
        quickSwitcherOpen: false,
      ),
    );
    expect(actions.first, KeybindAction.voiceDeclineCall);
  });

  test('chat mark channel read requires unread', () {
    final KeybindDispatcher dispatcher = KeybindDispatcher();
    const KeyEvent event = KeyDownEvent(
      physicalKey: PhysicalKeyboardKey.escape,
      logicalKey: LogicalKeyboardKey.escape,
      timeStamp: Duration.zero,
    );
    final List<KeybindAction> withoutUnread = dispatcher.matchActions(
      event: event,
      context: const KeybindDispatchContext(
        keyboardModeEnabled: false,
        hasMessageFocus: false,
        editableHasFocus: false,
        editableText: '',
        modalOpen: false,
        fullscreenMediaOpen: false,
        hasIncomingCall: false,
        channelHasUnread: false,
        quickSwitcherOpen: false,
      ),
    );
    expect(withoutUnread, isEmpty);
  });
}
