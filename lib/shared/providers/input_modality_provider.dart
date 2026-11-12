import 'dart:io';

import 'package:flutter/gestures.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/shared/utils/input_modality.dart';

const double kDesktopPointerUiMinWidth = 640;

class InputModalityNotifier extends Notifier<bool> {
  DateTime? _iosDesktopPointerSuppressedUntil;

  Offset? lastPointerDownPosition;

  @override
  bool build() => initialIsTouchPrimary();

  void handlePointerEvent(PointerEvent event) {
    final DateTime now = DateTime.now();

    if (event is PointerDownEvent) {
      lastPointerDownPosition = event.position;
    }

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

class DesktopPointerUiScope extends ConsumerWidget {
  const DesktopPointerUiScope({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool wide =
        MediaQuery.sizeOf(context).width >= kDesktopPointerUiMinWidth;
    final bool touch = ref.watch(inputModalityProvider);
    return _DesktopPointerUiInherited(enabled: wide && !touch, child: child);
  }
}

class _DesktopPointerUiInherited extends InheritedWidget {
  const _DesktopPointerUiInherited({
    required this.enabled,
    required super.child,
  });

  final bool enabled;

  @override
  bool updateShouldNotify(_DesktopPointerUiInherited oldWidget) =>
      enabled != oldWidget.enabled;
}

bool usesDesktopPointerUi(BuildContext context) {
  final _DesktopPointerUiInherited? scope = context
      .dependOnInheritedWidgetOfExactType<_DesktopPointerUiInherited>();
  if (scope != null) {
    return scope.enabled;
  }
  final Size? size = MediaQuery.maybeSizeOf(context);
  if (size == null || size.width < kDesktopPointerUiMinWidth) {
    return false;
  }
  try {
    return !ProviderScope.containerOf(
      context,
      listen: false,
    ).read(inputModalityProvider);
  } on Object {
    return false;
  }
}
