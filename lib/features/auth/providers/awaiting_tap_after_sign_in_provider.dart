import 'package:flutter/gestures.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'awaiting_tap_after_sign_in_provider.g.dart';

@Riverpod(keepAlive: true)
class AwaitingTapAfterSignIn extends _$AwaitingTapAfterSignIn {
  bool _listening = false;

  @override
  bool build() {
    ref.onDispose(_stopListening);
    return false;
  }

  void arm() {
    if (!_listening) {
      _listening = true;
      GestureBinding.instance.pointerRouter.addGlobalRoute(_handlePointer);
    }
    state = true;
  }

  void _handlePointer(PointerEvent event) {
    if (event is! PointerUpEvent) {
      return;
    }
    _stopListening();
    state = false;
  }

  void _stopListening() {
    if (!_listening) {
      return;
    }
    _listening = false;
    GestureBinding.instance.pointerRouter.removeGlobalRoute(_handlePointer);
  }
}
