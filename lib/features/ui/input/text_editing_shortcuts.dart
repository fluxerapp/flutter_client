import 'package:flutter/services.dart';

enum TextEditingShortcutKind { copy, cut, paste, selectAll, undo, redo }

/// Copy/cut/paste/select-all/undo/redo from Ctrl/Cmd or IME control characters.
TextEditingShortcutKind? matchTextEditingShortcut(KeyEvent event) {
  if (event is! KeyDownEvent) {
    return null;
  }
  final HardwareKeyboard keyboard = HardwareKeyboard.instance;
  if (keyboard.isAltPressed) {
    return null;
  }

  final bool modifierPressed =
      keyboard.isControlPressed || keyboard.isMetaPressed;
  final String? character = event.character;
  final int? code = character != null && character.length == 1
      ? character.codeUnitAt(0)
      : null;
  if (!modifierPressed && (code == null || code < 1 || code > 26)) {
    return null;
  }

  bool matches(LogicalKeyboardKey key, int controlCode) {
    return (event.logicalKey == key && modifierPressed) || code == controlCode;
  }

  if (matches(LogicalKeyboardKey.keyA, 0x01)) {
    return TextEditingShortcutKind.selectAll;
  }
  if (matches(LogicalKeyboardKey.keyC, 0x03)) {
    return TextEditingShortcutKind.copy;
  }
  if (matches(LogicalKeyboardKey.keyX, 0x18)) {
    return TextEditingShortcutKind.cut;
  }
  if (matches(LogicalKeyboardKey.keyV, 0x16)) {
    return TextEditingShortcutKind.paste;
  }
  if (matches(LogicalKeyboardKey.keyY, 0x19)) {
    return TextEditingShortcutKind.redo;
  }
  if (matches(LogicalKeyboardKey.keyZ, 0x1a)) {
    if (keyboard.isShiftPressed) {
      return TextEditingShortcutKind.redo;
    }
    return TextEditingShortcutKind.undo;
  }
  return null;
}
