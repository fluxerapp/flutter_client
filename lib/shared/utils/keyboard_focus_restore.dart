import 'package:flutter/widgets.dart';

const Duration kKeyboardFocusRestoreRetryDelay = Duration(milliseconds: 100);

bool isAppBackgroundLifecycleState(AppLifecycleState state) {
  return state == AppLifecycleState.inactive ||
      state == AppLifecycleState.paused ||
      state == AppLifecycleState.hidden;
}

/// Re-requests [focusNode] on resume when the keyboard was open before backgrounding.
class KeyboardFocusRestoreHandle {
  KeyboardFocusRestoreHandle({
    required this.focusNode,
    required this.shouldTrackOnBackground,
    required this.canRestoreFocus,
    this.retryDelay = kKeyboardFocusRestoreRetryDelay,
  });

  final FocusNode focusNode;
  final bool Function() shouldTrackOnBackground;
  final bool Function() canRestoreFocus;
  final Duration retryDelay;

  bool _pendingRestore = false;

  bool get hasPendingRestore => _pendingRestore;

  void handleLifecycleState(AppLifecycleState state) {
    if (isAppBackgroundLifecycleState(state)) {
      if (shouldTrackOnBackground()) {
        _pendingRestore = true;
      }
      return;
    }
    if (state == AppLifecycleState.resumed) {
      scheduleRestoreIfPending();
    }
  }

  void scheduleRestoreIfPending() {
    if (!_pendingRestore || !canRestoreFocus()) {
      return;
    }
    _pendingRestore = false;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _restoreFocus();
    });
  }

  void _restoreFocus() {
    if (!canRestoreFocus() || !focusNode.canRequestFocus) {
      return;
    }

    focusNode.requestFocus();

    Future<void>.delayed(retryDelay, () {
      if (!canRestoreFocus() || !focusNode.canRequestFocus) {
        return;
      }
      if (!focusNode.hasFocus) {
        focusNode.requestFocus();
      }
    });
  }
}
