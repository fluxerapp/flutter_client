import 'package:flutter_riverpod/flutter_riverpod.dart';

class KeyboardModeNotifier extends Notifier<bool> {
  @override
  bool build() => false;

  void enter() {
    if (!state) {
      state = true;
    }
  }

  void exit() {
    if (state) {
      state = false;
    }
  }

  void toggle() => state = !state;
}

final keyboardModeProvider = NotifierProvider<KeyboardModeNotifier, bool>(
  KeyboardModeNotifier.new,
);
