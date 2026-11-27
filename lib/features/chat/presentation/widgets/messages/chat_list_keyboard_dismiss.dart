import 'package:flutter/gestures.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/gestures/directional_horizontal_drag_recognizer.dart';
import 'package:fluxer_app/shared/utils/input_modality.dart';

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

  void _handleListInteraction(PointerDeviceKind kind) {
    final FocusNode? focus = FocusManager.instance.primaryFocus;
    if (focus != null &&
        !(isDesktopPointerKind(kind) && _focusIsInsideList(focus))) {
      focus.unfocus();
    }
    widget.onDismissPanels?.call();
  }

  bool _focusIsInsideList(FocusNode focus) {
    final BuildContext? focusContext = focus.context;
    if (focusContext == null || !focusContext.mounted) {
      return false;
    }
    return focusContext
            .findAncestorStateOfType<_ChatListKeyboardDismissState>() ==
        this;
  }

  void _onPointerDown(PointerDownEvent event) {
    if (_tracked != null) {
      return;
    }
    _tracked = _TrackedPointer(
      pointer: event.pointer,
      kind: event.kind,
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
      directions: <HorizontalClaimDirection>{
        if (Directionality.of(context) == TextDirection.rtl)
          HorizontalClaimDirection.right
        else
          HorizontalClaimDirection.left,
      },
    )) {
      return;
    }
    _handleListInteraction(tracked.kind);
  }

  void _onPointerUp(PointerUpEvent event) {
    final _TrackedPointer? tracked = _tracked;
    if (tracked == null || event.pointer != tracked.pointer) {
      return;
    }
    if (!tracked.settled) {
      _handleListInteraction(tracked.kind);
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
    required this.kind,
    required this.downPosition,
    required this.slop,
  });

  final int pointer;
  final PointerDeviceKind kind;
  final Offset downPosition;
  final double slop;
  bool settled = false;
}
