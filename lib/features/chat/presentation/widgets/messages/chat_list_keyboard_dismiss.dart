import 'package:flutter/gestures.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/gestures/directional_horizontal_drag_recognizer.dart';

/// Dismisses the keyboard and optional composer panels on list tap or scroll.
///
/// A clear leftward swipe keeps the current focus so the IME does not hide
/// and restore mid-gesture.
class ChatListKeyboardDismiss extends StatefulWidget {
  const ChatListKeyboardDismiss({
    required this.child,
    this.onDismissPanels,
    super.key,
  });

  final Widget child;
  final VoidCallback? onDismissPanels;

  @override
  State<ChatListKeyboardDismiss> createState() =>
      _ChatListKeyboardDismissState();
}

class _ChatListKeyboardDismissState extends State<ChatListKeyboardDismiss> {
  _TrackedPointer? _tracked;

  void _handleListInteraction() {
    FocusManager.instance.primaryFocus?.unfocus();
    widget.onDismissPanels?.call();
  }

  void _onPointerDown(PointerDownEvent event) {
    if (_tracked != null) {
      return;
    }
    _tracked = _TrackedPointer(
      pointer: event.pointer,
      downPosition: event.position,
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
    final Offset delta = event.position - tracked.downPosition;
    final double dx = delta.dx.abs();
    final double dy = delta.dy.abs();
    if (dx < tracked.slop && dy < tracked.slop) {
      return;
    }
    tracked.settled = true;
    if (claimsClearHorizontalDrag(
      deltaFromStart: delta,
      slop: tracked.slop,
      directions: const <HorizontalClaimDirection>{
        HorizontalClaimDirection.left,
      },
    )) {
      return;
    }
    _handleListInteraction();
  }

  void _onPointerUp(PointerUpEvent event) {
    final _TrackedPointer? tracked = _tracked;
    if (tracked == null || event.pointer != tracked.pointer) {
      return;
    }
    if (!tracked.settled) {
      _handleListInteraction();
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
    required this.slop,
  });

  final int pointer;
  final Offset downPosition;
  final double slop;
  bool settled = false;
}
