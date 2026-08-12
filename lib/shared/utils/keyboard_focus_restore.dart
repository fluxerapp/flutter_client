import 'package:flutter/widgets.dart';

const Duration kKeyboardFocusRestoreRetryDelay = Duration(milliseconds: 100);

/// True when the app is no longer visible (switched away / backgrounded).
///
/// Excludes [AppLifecycleState.inactive]: that also fires for system UI that
/// stays over the app (paste permission, control center, notification shade).
/// Re-requesting focus in those cases can break paste into the focused field.
bool isAppBackgroundLifecycleState(AppLifecycleState state) {
  return state == AppLifecycleState.paused || state == AppLifecycleState.hidden;
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
    // Already focused: requesting again can drop the text input connection
    // and make system paste a no-op.
    if (focusNode.hasFocus) {
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
