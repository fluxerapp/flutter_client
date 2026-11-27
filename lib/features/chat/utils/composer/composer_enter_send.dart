import 'package:flutter/services.dart';

bool isComposerSubmitKey(LogicalKeyboardKey key) {
  return key == LogicalKeyboardKey.enter ||
      key == LogicalKeyboardKey.numpadEnter;
}

bool composerCommandModifierPressed() {
  final HardwareKeyboard keyboard = HardwareKeyboard.instance;
  return keyboard.isControlPressed ||
      keyboard.isAltPressed ||
      keyboard.isMetaPressed;
}

bool composerModifierPressed() {
  return HardwareKeyboard.instance.isShiftPressed ||
      composerCommandModifierPressed();
}

bool composerEnterSends({
  required bool isNativeMobileOs,
  required bool physicalKeyboardConnected,
}) {
  if (isNativeMobileOs) {
    return physicalKeyboardConnected;
  }
  return true;
}
