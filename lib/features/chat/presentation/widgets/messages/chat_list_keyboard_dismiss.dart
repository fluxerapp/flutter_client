import 'package:flutter/gestures.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/gestures/horizontal_drag_axis_lock.dart';

/// Dismisses the keyboard on a tap or vertical scroll of the message list.
///
/// A leftward swipe (swipe-to-reply) keeps the current focus so the IME
/// does not hide and restore mid-gesture.
class ChatListKeyboardDismiss extends StatefulWidget {
  const ChatListKeyboardDismiss({required this.child, super.key});

  final Widget child;

  @override
  State<ChatListKeyboardDismiss> createState() =>
      _ChatListKeyboardDismissState();
}

class _ChatListKeyboardDismissState extends State<ChatListKeyboardDismiss> {
  _TrackedPointer? _tracked;

  void _dismissKeyboard() {
    FocusManager.instance.primaryFocus?.unfocus();
  }

  void _onPointerDown(PointerDownEvent event) {
    if (_tracked != null) {
      return;
    }
    _tracked = _TrackedPointer(
      pointer: event.pointer,
      downPosition: event.position,
      downTime: event.timeStamp,
      slop: computeHitSlop(
        event.kind,
        MediaQuery.maybeGestureSettingsOf(context),
      ),
    );
  }

  void _onPointerMove(PointerMoveEvent event) {
    final _TrackedPointer? tracked = _tracked;
    if (tracked == null ||
        tracked.settled ||
        event.pointer != tracked.pointer) {
      return;
    }
    final HorizontalDragAxisLockDecision decision =
        resolveHorizontalDragAxisLock(
          deltaFromStart: event.position - tracked.downPosition,
          slop: tracked.slop,
          elapsed: event.timeStamp - tracked.downTime,
        );
    if (decision == HorizontalDragAxisLockDecision.pending) {
      return;
    }
    tracked.settled = true;
    if (decision != HorizontalDragAxisLockDecision.keepHorizontal) {
      _dismissKeyboard();
    }
  }

  void _onPointerUp(PointerUpEvent event) {
    final _TrackedPointer? tracked = _tracked;
    if (tracked == null || event.pointer != tracked.pointer) {
      return;
    }
    if (!tracked.settled) {
      _dismissKeyboard();
    }
    _tracked = null;
  }

  void _onPointerCancel(PointerCancelEvent event) {
    if (_tracked?.pointer == event.pointer) {
      _tracked = null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Listener(
      behavior: HitTestBehavior.translucent,
      onPointerDown: _onPointerDown,
      onPointerMove: _onPointerMove,
      onPointerUp: _onPointerUp,
      onPointerCancel: _onPointerCancel,
      child: widget.child,
    );
  }
}

class _TrackedPointer {
  _TrackedPointer({
    required this.pointer,
    required this.downPosition,
    required this.downTime,
    required this.slop,
  });

  final int pointer;
  final Offset downPosition;
  final Duration downTime;
  final double slop;
  bool settled = false;
}
