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

bool _canSafelyRequestFocus([AppLifecycleState? state]) {
  final AppLifecycleState? current =
      state ?? WidgetsBinding.instance.lifecycleState;
  return current == null || current == AppLifecycleState.resumed;
}

/// Re-requests [focusNode] on resume when the keyboard was open before backgrounding.
class KeyboardFocusRestoreHandle {
  KeyboardFocusRestoreHandle({
    required this.focusNode,
    required this.shouldTrackOnBackground,
    required this.canRestoreFocus,
  });

  final FocusNode focusNode;
  final bool Function() shouldTrackOnBackground;
  final bool Function() canRestoreFocus;

  bool _pendingRestore = false;
  int _restoreGeneration = 0;

  bool get hasPendingRestore => _pendingRestore;

  void handleLifecycleState(AppLifecycleState state) {
    if (isAppBackgroundLifecycleState(state)) {
      if (shouldTrackOnBackground()) {
        _pendingRestore = true;
      }
      return;
    }
    if (state == AppLifecycleState.inactive) {
      _restoreGeneration++;
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
    final int generation = ++_restoreGeneration;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (generation != _restoreGeneration) {
        return;
      }
      _restoreFocus();
    });
  }

  void _restoreFocus() {
    if (!_shouldRequestFocus()) {
      return;
    }
    focusNode.requestFocus();
  }

  bool _shouldRequestFocus() {
    if (!canRestoreFocus() || !focusNode.canRequestFocus) {
      return false;
    }
    if (!_canSafelyRequestFocus()) {
      return false;
    }
    // Re-requesting focus while the field is already focused can drop the
    // text input connection and make system paste a no-op.
    if (focusNode.hasFocus) {
      return false;
    }
    final FocusNode? primary = FocusManager.instance.primaryFocus;
    if (primary != null &&
        primary.hasFocus &&
        primary != focusNode &&
        _isEditableFocus(primary)) {
      return false;
    }
    return true;
  }
}

bool _isEditableFocus(FocusNode node) {
  final BuildContext? context = node.context;
  if (context == null) {
    return false;
  }
  return context.findAncestorWidgetOfExactType<EditableText>() != null;
}
