import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/input/domain/keybind_action.dart';
import 'package:fluxer_app/features/input/domain/keybind_dispatch_context.dart';
import 'package:fluxer_app/features/input/services/keybind_dispatcher.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('KeybindDispatcher clipboard shortcuts', () {
    final KeybindDispatcher dispatcher = KeybindDispatcher();

    KeybindDispatchContext focusedTextContext({String text = 'draft'}) {
      return KeybindDispatchContext(
        keyboardModeEnabled: false,
        hasMessageFocus: false,
        editableHasFocus: true,
        editableText: text,
        modalOpen: false,
        fullscreenMediaOpen: false,
        hasIncomingCall: false,
        channelHasUnread: false,
        quickSwitcherOpen: false,
      );
    }

    test('does not match message copy on cmd+v', () {
      final List<KeybindAction> actions = dispatcher.matchActions(
        event: const KeyDownEvent(
          physicalKey: PhysicalKeyboardKey(0),
          logicalKey: LogicalKeyboardKey.keyV,
          timeStamp: Duration.zero,
          character: 'v',
        ),
        context: focusedTextContext(),
      );

      expect(actions, isEmpty);
    });

    test('does not match message copy on cmd+c while editing', () {
      final List<KeybindAction> actions = dispatcher.matchActions(
        event: const KeyDownEvent(
          physicalKey: PhysicalKeyboardKey(0),
          logicalKey: LogicalKeyboardKey.keyC,
          timeStamp: Duration.zero,
          character: 'c',
        ),
        context: focusedTextContext(),
      );

      expect(actions, isEmpty);
    });
  });
}
