import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/input/domain/default_keybind.dart';
import 'package:fluxer_app/features/input/domain/editable_focus_behavior.dart';
import 'package:fluxer_app/features/input/domain/keybind_action.dart';
import 'package:fluxer_app/features/input/domain/keybind_combo.dart';
import 'package:fluxer_app/features/input/domain/keybind_dispatch_context.dart';
import 'package:fluxer_app/features/input/domain/keybind_section.dart';
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
      ),
    );
    expect(withoutUnread, isEmpty);
  });

  test('global hold shortcuts leave local matching while the hook runs', () {
    final KeybindDispatcher dispatcher = KeybindDispatcher(
      entries: const <DefaultKeybind>[
        DefaultKeybind(
          action: KeybindAction.voicePushToTalk,
          combo: KeybindCombo(key: 'v', code: 'KeyV'),
          section: KeybindSection.voiceAndVideo,
          editableFocusBehavior: EditableFocusBehavior.allow,
          global: true,
        ),
      ],
    );
    const KeyEvent event = KeyDownEvent(
      physicalKey: PhysicalKeyboardKey.keyV,
      logicalKey: LogicalKeyboardKey.keyV,
      character: 'v',
      timeStamp: Duration.zero,
    );
    const KeybindDispatchContext context = KeybindDispatchContext(
      keyboardModeEnabled: false,
      hasMessageFocus: false,
      editableHasFocus: false,
      editableText: '',
      modalOpen: false,
      fullscreenMediaOpen: false,
      hasIncomingCall: false,
      channelHasUnread: false,
    );
    expect(
      dispatcher.matchActions(event: event, context: context),
      <KeybindAction>[KeybindAction.voicePushToTalk],
    );
    dispatcher.globalRoutingActive = true;
    expect(dispatcher.matchActions(event: event, context: context), isEmpty);
    expect(dispatcher.matchHoldActions(event), isEmpty);
  });
}
