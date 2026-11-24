import 'package:flutter/services.dart';
import 'package:fluxer_app/features/input/domain/keybind_combo.dart';

final Map<LogicalKeyboardKey, String> _kLogicalKeyNames =
    <LogicalKeyboardKey, String>{
      LogicalKeyboardKey.arrowUp: 'ArrowUp',
      LogicalKeyboardKey.arrowDown: 'ArrowDown',
      LogicalKeyboardKey.arrowLeft: 'ArrowLeft',
      LogicalKeyboardKey.arrowRight: 'ArrowRight',
      LogicalKeyboardKey.enter: 'Enter',
      LogicalKeyboardKey.numpadEnter: 'Enter',
      LogicalKeyboardKey.escape: 'Escape',
      LogicalKeyboardKey.backspace: 'Backspace',
      LogicalKeyboardKey.delete: 'Delete',
      LogicalKeyboardKey.tab: 'Tab',
      LogicalKeyboardKey.space: ' ',
      LogicalKeyboardKey.home: 'Home',
      LogicalKeyboardKey.end: 'End',
      LogicalKeyboardKey.pageUp: 'PageUp',
      LogicalKeyboardKey.pageDown: 'PageDown',
      LogicalKeyboardKey.insert: 'Insert',
      LogicalKeyboardKey.capsLock: 'CapsLock',
      LogicalKeyboardKey.pause: 'Pause',
      LogicalKeyboardKey.scrollLock: 'ScrollLock',
      LogicalKeyboardKey.printScreen: 'PrintScreen',
      LogicalKeyboardKey.contextMenu: 'ContextMenu',
      LogicalKeyboardKey.f1: 'F1',
      LogicalKeyboardKey.f2: 'F2',
      LogicalKeyboardKey.f3: 'F3',
      LogicalKeyboardKey.f4: 'F4',
      LogicalKeyboardKey.f5: 'F5',
      LogicalKeyboardKey.f6: 'F6',
      LogicalKeyboardKey.f7: 'F7',
      LogicalKeyboardKey.f8: 'F8',
      LogicalKeyboardKey.f9: 'F9',
      LogicalKeyboardKey.f10: 'F10',
      LogicalKeyboardKey.f11: 'F11',
      LogicalKeyboardKey.f12: 'F12',
      LogicalKeyboardKey.f13: 'F13',
      LogicalKeyboardKey.f14: 'F14',
      LogicalKeyboardKey.f15: 'F15',
      LogicalKeyboardKey.f16: 'F16',
      LogicalKeyboardKey.f17: 'F17',
      LogicalKeyboardKey.f18: 'F18',
      LogicalKeyboardKey.f19: 'F19',
      LogicalKeyboardKey.f20: 'F20',
      LogicalKeyboardKey.f21: 'F21',
      LogicalKeyboardKey.f22: 'F22',
      LogicalKeyboardKey.f23: 'F23',
      LogicalKeyboardKey.f24: 'F24',
    };

final Map<PhysicalKeyboardKey, String> _kPhysicalKeyCodes =
    <PhysicalKeyboardKey, String>{
      for (int i = 0; i < 26; i++)
        _letterKeys[i]: 'Key${String.fromCharCode(65 + i)}',
      for (int i = 0; i < 10; i++) _digitKeys[i]: 'Digit$i',
      for (int i = 0; i < 10; i++) _numpadKeys[i]: 'Numpad$i',
      PhysicalKeyboardKey.space: 'Space',
      PhysicalKeyboardKey.enter: 'Enter',
      PhysicalKeyboardKey.escape: 'Escape',
      PhysicalKeyboardKey.backspace: 'Backspace',
      PhysicalKeyboardKey.tab: 'Tab',
      PhysicalKeyboardKey.delete: 'Delete',
      PhysicalKeyboardKey.insert: 'Insert',
      PhysicalKeyboardKey.home: 'Home',
      PhysicalKeyboardKey.end: 'End',
      PhysicalKeyboardKey.pageUp: 'PageUp',
      PhysicalKeyboardKey.pageDown: 'PageDown',
      PhysicalKeyboardKey.arrowUp: 'ArrowUp',
      PhysicalKeyboardKey.arrowDown: 'ArrowDown',
      PhysicalKeyboardKey.arrowLeft: 'ArrowLeft',
      PhysicalKeyboardKey.arrowRight: 'ArrowRight',
      PhysicalKeyboardKey.minus: 'Minus',
      PhysicalKeyboardKey.equal: 'Equal',
      PhysicalKeyboardKey.bracketLeft: 'BracketLeft',
      PhysicalKeyboardKey.bracketRight: 'BracketRight',
      PhysicalKeyboardKey.backslash: 'Backslash',
      PhysicalKeyboardKey.semicolon: 'Semicolon',
      PhysicalKeyboardKey.quote: 'Quote',
      PhysicalKeyboardKey.backquote: 'Backquote',
      PhysicalKeyboardKey.comma: 'Comma',
      PhysicalKeyboardKey.period: 'Period',
      PhysicalKeyboardKey.slash: 'Slash',
      PhysicalKeyboardKey.capsLock: 'CapsLock',
      PhysicalKeyboardKey.numpadEnter: 'NumpadEnter',
      PhysicalKeyboardKey.numpadAdd: 'NumpadAdd',
      PhysicalKeyboardKey.numpadSubtract: 'NumpadSubtract',
      PhysicalKeyboardKey.numpadMultiply: 'NumpadMultiply',
      PhysicalKeyboardKey.numpadDivide: 'NumpadDivide',
      PhysicalKeyboardKey.numpadDecimal: 'NumpadDecimal',
      PhysicalKeyboardKey.f1: 'F1',
      PhysicalKeyboardKey.f2: 'F2',
      PhysicalKeyboardKey.f3: 'F3',
      PhysicalKeyboardKey.f4: 'F4',
      PhysicalKeyboardKey.f5: 'F5',
      PhysicalKeyboardKey.f6: 'F6',
      PhysicalKeyboardKey.f7: 'F7',
      PhysicalKeyboardKey.f8: 'F8',
      PhysicalKeyboardKey.f9: 'F9',
      PhysicalKeyboardKey.f10: 'F10',
      PhysicalKeyboardKey.f11: 'F11',
      PhysicalKeyboardKey.f12: 'F12',
    };

const List<PhysicalKeyboardKey> _letterKeys = <PhysicalKeyboardKey>[
  PhysicalKeyboardKey.keyA,
  PhysicalKeyboardKey.keyB,
  PhysicalKeyboardKey.keyC,
  PhysicalKeyboardKey.keyD,
  PhysicalKeyboardKey.keyE,
  PhysicalKeyboardKey.keyF,
  PhysicalKeyboardKey.keyG,
  PhysicalKeyboardKey.keyH,
  PhysicalKeyboardKey.keyI,
  PhysicalKeyboardKey.keyJ,
  PhysicalKeyboardKey.keyK,
  PhysicalKeyboardKey.keyL,
  PhysicalKeyboardKey.keyM,
  PhysicalKeyboardKey.keyN,
  PhysicalKeyboardKey.keyO,
  PhysicalKeyboardKey.keyP,
  PhysicalKeyboardKey.keyQ,
  PhysicalKeyboardKey.keyR,
  PhysicalKeyboardKey.keyS,
  PhysicalKeyboardKey.keyT,
  PhysicalKeyboardKey.keyU,
  PhysicalKeyboardKey.keyV,
  PhysicalKeyboardKey.keyW,
  PhysicalKeyboardKey.keyX,
  PhysicalKeyboardKey.keyY,
  PhysicalKeyboardKey.keyZ,
];

const List<PhysicalKeyboardKey> _digitKeys = <PhysicalKeyboardKey>[
  PhysicalKeyboardKey.digit0,
  PhysicalKeyboardKey.digit1,
  PhysicalKeyboardKey.digit2,
  PhysicalKeyboardKey.digit3,
  PhysicalKeyboardKey.digit4,
  PhysicalKeyboardKey.digit5,
  PhysicalKeyboardKey.digit6,
  PhysicalKeyboardKey.digit7,
  PhysicalKeyboardKey.digit8,
  PhysicalKeyboardKey.digit9,
];

const List<PhysicalKeyboardKey> _numpadKeys = <PhysicalKeyboardKey>[
  PhysicalKeyboardKey.numpad0,
  PhysicalKeyboardKey.numpad1,
  PhysicalKeyboardKey.numpad2,
  PhysicalKeyboardKey.numpad3,
  PhysicalKeyboardKey.numpad4,
  PhysicalKeyboardKey.numpad5,
  PhysicalKeyboardKey.numpad6,
  PhysicalKeyboardKey.numpad7,
  PhysicalKeyboardKey.numpad8,
  PhysicalKeyboardKey.numpad9,
];

final Set<LogicalKeyboardKey> _kModifierKeys = <LogicalKeyboardKey>{
  LogicalKeyboardKey.shift,
  LogicalKeyboardKey.shiftLeft,
  LogicalKeyboardKey.shiftRight,
  LogicalKeyboardKey.control,
  LogicalKeyboardKey.controlLeft,
  LogicalKeyboardKey.controlRight,
  LogicalKeyboardKey.alt,
  LogicalKeyboardKey.altLeft,
  LogicalKeyboardKey.altRight,
  LogicalKeyboardKey.meta,
  LogicalKeyboardKey.metaLeft,
  LogicalKeyboardKey.metaRight,
  LogicalKeyboardKey.fn,
};

bool isModifierKeyEvent(KeyEvent event) =>
    _kModifierKeys.contains(event.logicalKey);

String? webCodeForPhysicalKey(PhysicalKeyboardKey key) =>
    _kPhysicalKeyCodes[key];

String webKeyForKeyEvent(KeyEvent event) {
  final String? named = _kLogicalKeyNames[event.logicalKey];
  if (named != null) {
    return named;
  }
  final String? character = event.character;
  if (character != null &&
      character.length == 1 &&
      character.codeUnitAt(0) >= 32 &&
      character.codeUnitAt(0) != 127) {
    return character.toLowerCase();
  }
  final String label = event.logicalKey.keyLabel;
  return label.length == 1 ? label.toLowerCase() : label;
}

KeybindCombo? keybindComboFromKeyEvent(KeyEvent event) {
  if (event is! KeyDownEvent || isModifierKeyEvent(event)) {
    return null;
  }
  final HardwareKeyboard keyboard = HardwareKeyboard.instance;
  return KeybindCombo(
    key: webKeyForKeyEvent(event),
    code: webCodeForPhysicalKey(event.physicalKey),
    ctrl: keyboard.isControlPressed,
    alt: keyboard.isAltPressed,
    shift: keyboard.isShiftPressed,
    meta: keyboard.isMetaPressed,
  );
}
