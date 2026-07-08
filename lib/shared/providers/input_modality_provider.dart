import 'package:flutter/gestures.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/shared/utils/input_modality.dart';

class InputModalityNotifier extends Notifier<bool> {
  @override
  bool build() => initialIsTouchPrimary();

  void handlePointerEvent(PointerEvent event) {
    if (isTouchPointerKind(event.kind) && !state) {
      state = true;
      return;
    }
    if (isMousePointerKind(event.kind) && state) {
      state = false;
    }
  }
}

final inputModalityProvider = NotifierProvider<InputModalityNotifier, bool>(
  InputModalityNotifier.new,
);

bool isTouchPrimaryInput(WidgetRef ref) => ref.watch(inputModalityProvider);
