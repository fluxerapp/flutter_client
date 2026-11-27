import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/input/domain/custom_keybind.dart';
import 'package:fluxer_app/features/input/domain/default_keybind.dart';
import 'package:fluxer_app/features/input/domain/editable_focus_behavior.dart';
import 'package:fluxer_app/features/input/domain/keybind_action.dart';
import 'package:fluxer_app/features/input/domain/keybind_combo.dart';
import 'package:fluxer_app/features/input/domain/keybind_dispatch_context.dart';
import 'package:fluxer_app/features/input/domain/keybind_resolution.dart';
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

  test('custom mouse button keybinds match only their button', () {
    final KeybindDispatcher dispatcher = KeybindDispatcher(
      entries: resolveEffectiveKeybinds(
        defaults: const <DefaultKeybind>[],
        customKeybinds: const <CustomKeybindEntry>[
          CustomKeybindEntry(
            id: 'mouse',
            action: 'voice_toggle_mute',
            combo: StoredKeybindCombo(mouseButton: 4),
          ),
        ],
        disableBuiltinKeybinds: true,
      ),
    );
    const KeybindDispatchContext context = KeybindDispatchContext(
      keyboardModeEnabled: false,
      hasMessageFocus: false,
      editableHasFocus: true,
      editableText: 'draft',
      modalOpen: false,
      fullscreenMediaOpen: false,
      hasIncomingCall: false,
      channelHasUnread: false,
    );
    expect(
      dispatcher
          .matchMouseEntries(button: 4, context: context)
          .map((DefaultKeybind entry) => entry.action),
      <KeybindAction>[KeybindAction.voiceToggleMute],
    );
    expect(dispatcher.matchMouseEntries(button: 3, context: context), isEmpty);
    const KeyEvent event = KeyDownEvent(
      physicalKey: PhysicalKeyboardKey.keyA,
      logicalKey: LogicalKeyboardKey.keyA,
      character: 'a',
      timeStamp: Duration.zero,
    );
    expect(dispatcher.matchActions(event: event, context: context), isEmpty);
  });

  test('mouse push to talk releases on the same button', () {
    final KeybindDispatcher dispatcher = KeybindDispatcher(
      entries: resolveEffectiveKeybinds(
        defaults: const <DefaultKeybind>[],
        customKeybinds: const <CustomKeybindEntry>[
          CustomKeybindEntry(
            id: 'ptt',
            action: 'voice_push_to_talk',
            combo: StoredKeybindCombo(mouseButton: 3),
          ),
        ],
        disableBuiltinKeybinds: true,
      ),
    );
    expect(dispatcher.matchMouseHoldActions(3), <KeybindAction>[
      KeybindAction.voicePushToTalk,
    ]);
    expect(dispatcher.matchMouseHoldActions(4), isEmpty);
  });
}
