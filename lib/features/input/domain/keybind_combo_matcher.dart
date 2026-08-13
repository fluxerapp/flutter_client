import 'package:flutter/services.dart';
import 'package:fluxer_app/features/input/domain/default_keybinds.dart';
import 'package:fluxer_app/features/input/domain/keybind_combo.dart';

String normalizeShortcutKey(String key) {
  if (key == ' ') {
    return 'space';
  }
  if (key == 'Break') {
    return 'pause';
  }
  return key.toLowerCase();
}

bool _isPrintableNonLetterShortcutKey(String? key) {
  if (key == null || key.isEmpty) {
    return false;
  }
  if (key.length != 1) {
    return false;
  }
  final int code = key.codeUnitAt(0);
  return !((code >= 65 && code <= 90) || (code >= 97 && code <= 122));
}

bool keyboardEventTriggerMatchesCombo(KeybindCombo combo, KeyEvent event) {
  final String? expectedLayoutKey = combo.key.isNotEmpty
      ? combo.key
      : combo.code;
  if (expectedLayoutKey != null && expectedLayoutKey.isNotEmpty) {
    final String eventKey = (event.character?.isNotEmpty ?? false)
        ? event.character!
        : event.logicalKey.keyLabel;
    if (normalizeShortcutKey(eventKey) ==
        normalizeShortcutKey(expectedLayoutKey)) {
      return true;
    }
    if (combo.code != null &&
        _physicalKeyName(event) == combo.code &&
        combo.ctrlOrMeta &&
        combo.alt) {
      return true;
    }
  }
  if (combo.code != null && combo.code!.isNotEmpty) {
    return _physicalKeyName(event) == combo.code;
  }
  if (expectedLayoutKey == null || expectedLayoutKey.isEmpty) {
    return false;
  }
  final String eventKey = event.logicalKey.keyLabel;
  return normalizeShortcutKey(eventKey) ==
      normalizeShortcutKey(expectedLayoutKey);
}

String? _physicalKeyName(KeyEvent event) {
  final String debugName = event.physicalKey.debugName ?? '';
  if (debugName.startsWith('PhysicalKeyboardKey.')) {
    return debugName.substring('PhysicalKeyboardKey.'.length);
  }
  return debugName.isEmpty ? null : debugName;
}

bool keyboardEventMatchesCombo(KeybindCombo combo, KeyEvent event) {
  if (!combo.hasTrigger) {
    return false;
  }
  final bool isMacOS = isMacOsKeybindPlatform;
  final bool expectsCtrl = combo.ctrl || (combo.ctrlOrMeta && !isMacOS);
  final bool expectsMeta = combo.meta || (combo.ctrlOrMeta && isMacOS);
  final HardwareKeyboard keyboard = HardwareKeyboard.instance;
  if (keyboard.isControlPressed != expectsCtrl) {
    return false;
  }
  if (keyboard.isMetaPressed != expectsMeta) {
    return false;
  }
  if (keyboard.isAltPressed != combo.alt) {
    return false;
  }
  if (!keyboardEventTriggerMatchesCombo(combo, event)) {
    return false;
  }
  if (keyboard.isShiftPressed != combo.shift) {
    if (combo.shift ||
        !keyboard.isShiftPressed ||
        !_isPrintableNonLetterShortcutKey(combo.key)) {
      return false;
    }
  }
  return true;
}

bool keyboardEventStartsComboPress(KeybindCombo combo, KeyEvent event) {
  if (event is KeyRepeatEvent) {
    return false;
  }
  if (event is! KeyDownEvent) {
    return false;
  }
  return keyboardEventMatchesCombo(combo, event);
}

bool isPrintableCharacterKey(KeyEvent event) {
  if (event is! KeyDownEvent) {
    return false;
  }
  final String? character = event.character;
  if (character == null || character.isEmpty) {
    return false;
  }
  if (character.length != 1) {
    return false;
  }
  final int code = character.codeUnitAt(0);
  return code >= 32 && code != 127;
}

bool isAnyKeyFocusTextareaTrigger(KeyEvent event) {
  if (event is KeyRepeatEvent) {
    return false;
  }
  if (event is! KeyDownEvent) {
    return false;
  }
  final HardwareKeyboard keyboard = HardwareKeyboard.instance;
  if (keyboard.isControlPressed ||
      keyboard.isMetaPressed ||
      keyboard.isAltPressed) {
    return false;
  }
  if (event.logicalKey == LogicalKeyboardKey.tab) {
    return false;
  }
  return isPrintableCharacterKey(event);
}
