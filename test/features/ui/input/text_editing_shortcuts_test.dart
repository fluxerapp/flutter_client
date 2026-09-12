import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/ui/input/text_editing_shortcuts.dart';

KeyDownEvent _down(
  LogicalKeyboardKey key, {
  String? character,
  PhysicalKeyboardKey? physicalKey,
}) {
  return KeyDownEvent(
    physicalKey: physicalKey ?? const PhysicalKeyboardKey(0),
    logicalKey: key,
    character: character,
    timeStamp: Duration.zero,
  );
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  tearDown(HardwareKeyboard.instance.clearState);

  group('matchTextEditingShortcut', () {
    test('matches IME control characters', () {
      expect(
        matchTextEditingShortcut(
          _down(LogicalKeyboardKey.keyA, character: '\u0001'),
        ),
        TextEditingShortcutKind.selectAll,
      );
      expect(
        matchTextEditingShortcut(
          _down(LogicalKeyboardKey.keyZ, character: '\u001a'),
        ),
        TextEditingShortcutKind.undo,
      );
      expect(
        matchTextEditingShortcut(
          _down(LogicalKeyboardKey.keyY, character: '\u0019'),
        ),
        TextEditingShortcutKind.redo,
      );
      expect(
        matchTextEditingShortcut(
          _down(LogicalKeyboardKey.keyC, character: '\u0003'),
        ),
        TextEditingShortcutKind.copy,
      );
      expect(
        matchTextEditingShortcut(
          _down(LogicalKeyboardKey.keyX, character: '\u0018'),
        ),
        TextEditingShortcutKind.cut,
      );
      expect(
        matchTextEditingShortcut(
          _down(LogicalKeyboardKey.keyV, character: '\u0016'),
        ),
        TextEditingShortcutKind.paste,
      );
    });

    test('ignores a plain letter', () {
      expect(
        matchTextEditingShortcut(_down(LogicalKeyboardKey.keyA, character: 'a')),
        isNull,
      );
    });

    test('ignores Alt combinations', () {
      HardwareKeyboard.instance.handleKeyEvent(
        _down(
          LogicalKeyboardKey.altLeft,
          physicalKey: PhysicalKeyboardKey.altLeft,
        ),
      );
      HardwareKeyboard.instance.handleKeyEvent(
        _down(
          LogicalKeyboardKey.controlLeft,
          physicalKey: PhysicalKeyboardKey.controlLeft,
        ),
      );
      expect(
        matchTextEditingShortcut(_down(LogicalKeyboardKey.keyA)),
        isNull,
      );
    });

    test('matches held Control plus letter', () {
      HardwareKeyboard.instance.handleKeyEvent(
        _down(
          LogicalKeyboardKey.controlLeft,
          physicalKey: PhysicalKeyboardKey.controlLeft,
        ),
      );
      expect(
        matchTextEditingShortcut(_down(LogicalKeyboardKey.keyA)),
        TextEditingShortcutKind.selectAll,
      );
      expect(
        matchTextEditingShortcut(_down(LogicalKeyboardKey.keyZ)),
        TextEditingShortcutKind.undo,
      );
    });

    test('treats Control+Shift+Z as redo', () {
      HardwareKeyboard.instance.handleKeyEvent(
        _down(
          LogicalKeyboardKey.controlLeft,
          physicalKey: PhysicalKeyboardKey.controlLeft,
        ),
      );
      HardwareKeyboard.instance.handleKeyEvent(
        _down(
          LogicalKeyboardKey.shiftLeft,
          physicalKey: PhysicalKeyboardKey.shiftLeft,
        ),
      );
      expect(
        matchTextEditingShortcut(_down(LogicalKeyboardKey.keyZ)),
        TextEditingShortcutKind.redo,
      );
    });
  });
}
