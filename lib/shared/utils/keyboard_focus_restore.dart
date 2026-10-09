import 'package:flutter/widgets.dart';

/// paused or hidden. inactive is system UI over the app, like paste.
bool isAppBackgroundLifecycleState(AppLifecycleState state) {
  return state == AppLifecycleState.paused || state == AppLifecycleState.hidden;
}

bool _canSafelyRequestFocus([AppLifecycleState? state]) {
  final AppLifecycleState? current =
      state ?? WidgetsBinding.instance.lifecycleState;
  return current == null || current == AppLifecycleState.resumed;
}

void _showKeyboard(FocusNode node) {
  if (!node.hasFocus) {
    if (node.canRequestFocus) {
      node.requestFocus();
    }
    return;
  }
  final BuildContext? context = node.context;
  if (context == null || !context.mounted) {
    return;
  }
  final EditableTextState? editable = context
      .findAncestorStateOfType<EditableTextState>();
  if (editable != null) {
    editable.requestKeyboard();
    return;
  }
  node.requestFocus();
}

void nudgeComposerKeyboardOpen(FocusNode node) {
  if (!node.canRequestFocus || !node.hasFocus) {
    return;
  }
  _showKeyboard(node);
}

void reconnectComposerKeyboard(FocusNode node) {
  if (!node.canRequestFocus) {
    return;
  }
  if (!node.hasFocus) {
    node.requestFocus();
    return;
  }
  nudgeComposerKeyboardOpen(node);
  node.unfocus();
  WidgetsBinding.instance.addPostFrameCallback((_) {
    if (node.canRequestFocus && !node.hasFocus) {
      node.requestFocus();
    }
  });
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

  void dispose() {
    _restoreGeneration++;
  }

  void cancelImeReconnect() {
    _restoreGeneration++;
    _pendingRestore = false;
  }

  void reconnectOpenField() {
    _pendingRestore = false;
    if (!_canAttemptRestore() || _anotherEditableHasFocus()) {
      return;
    }
    reconnectComposerKeyboard(focusNode);
  }

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
    final int generation = ++_restoreGeneration;
    WidgetsBinding.instance
      ..scheduleFrame()
      ..addPostFrameCallback((_) {
        if (generation != _restoreGeneration) {
          return;
        }
        _pendingRestore = false;
        _restoreFocus();
      });
  }

  void _restoreFocus() {
    if (!_canAttemptRestore() || _anotherEditableHasFocus()) {
      return;
    }
    if (!focusNode.hasFocus) {
      focusNode.requestFocus();
      return;
    }
    reconnectComposerKeyboard(focusNode);
  }

  bool _canAttemptRestore() {
    if (!canRestoreFocus() || !focusNode.canRequestFocus) {
      return false;
    }
    return _canSafelyRequestFocus();
  }

  bool _anotherEditableHasFocus() {
    final FocusNode? primary = FocusManager.instance.primaryFocus;
    return primary != null &&
        primary.hasFocus &&
        primary != focusNode &&
        _isEditableFocus(primary);
  }
}

bool _isEditableFocus(FocusNode node) {
  final BuildContext? context = node.context;
  if (context == null) {
    return false;
  }
  return context.widget is EditableText ||
      context.findAncestorWidgetOfExactType<EditableText>() != null;
}
