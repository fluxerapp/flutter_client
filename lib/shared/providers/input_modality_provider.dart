import 'dart:io';

import 'package:flutter/gestures.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/shared/utils/input_modality.dart';

class InputModalityNotifier extends Notifier<bool> {
  DateTime? _iosDesktopPointerSuppressedUntil;

  @override
  bool build() => initialIsTouchPrimary();

  void handlePointerEvent(PointerEvent event) {
    final DateTime now = DateTime.now();

    if (isTouchPointerKind(event.kind)) {
      if (Platform.isIOS && event is PointerDownEvent) {
        _iosDesktopPointerSuppressedUntil = now.add(
          kIosDesktopPointerSuppressionDuration,
        );
      }
      if (!state) {
        state = true;
      }
      return;
    }

    if (_iosDesktopPointerSuppressedUntil != null &&
        !now.isBefore(_iosDesktopPointerSuppressedUntil!)) {
      _iosDesktopPointerSuppressedUntil = null;
    }

    final bool promoteDesktop = shouldPromoteDesktopPointerKind(
      kind: event.kind,
      isIOS: Platform.isIOS,
      mouseIsConnected: WidgetsBinding.instance.mouseTracker.mouseIsConnected,
      isHoverEvent: event is PointerHoverEvent,
      now: now,
      iosTouchLockUntil: _iosDesktopPointerSuppressedUntil,
    );
    if (promoteDesktop && state) {
      state = false;
    }
  }
}

final inputModalityProvider = NotifierProvider<InputModalityNotifier, bool>(
  InputModalityNotifier.new,
);

bool isTouchPrimaryInput(WidgetRef ref) => ref.watch(inputModalityProvider);
