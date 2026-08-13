import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/input/domain/default_keybinds.dart';
import 'package:fluxer_app/features/input/domain/keybind_combo.dart';
import 'package:fluxer_app/features/input/domain/keybind_combo_matcher.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('keyboardEventMatchesCombo', () {
    test('matches plain e key', () {
      const KeybindCombo combo = KeybindCombo(key: 'e');
      const KeyEvent event = KeyDownEvent(
        physicalKey: PhysicalKeyboardKey.keyE,
        logicalKey: LogicalKeyboardKey.keyE,
        character: 'e',
        timeStamp: Duration.zero,
      );
      expect(keyboardEventMatchesCombo(combo, event), isTrue);
    });

    test('ignores key repeat', () {
      const KeybindCombo combo = KeybindCombo(key: 'e');
      const KeyEvent event = KeyRepeatEvent(
        physicalKey: PhysicalKeyboardKey.keyE,
        logicalKey: LogicalKeyboardKey.keyE,
        character: 'e',
        timeStamp: Duration.zero,
      );
      expect(keyboardEventStartsComboPress(combo, event), isFalse);
    });
  });

  group('shortcuts overlay fallback', () {
    test('includes slash and shifted period combos', () {
      expect(shortcutsOverlayCombosForPlatform(), hasLength(2));
      expect(shortcutsOverlayCombosForPlatform().first.key, '/');
    });
  });
}
