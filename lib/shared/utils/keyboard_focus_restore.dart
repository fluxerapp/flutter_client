import 'dart:async';

import 'package:flutter/foundation.dart';
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

bool _useReadOnlyImeReconnect(
  void Function({required bool readOnly})? toggleReadOnly,
) {
  if (toggleReadOnly == null) {
    return false;
  }
  return defaultTargetPlatform == TargetPlatform.iOS ||
      defaultTargetPlatform == TargetPlatform.android;
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

/// Reopens the IME for [node]. On mobile, a brief read-only toggle recreates the
/// TextInputConnection without dismissing the keyboard. Elsewhere, focus cycles.
void reconnectComposerKeyboard(
  FocusNode node, {
  void Function({required bool readOnly})? toggleReadOnly,
}) {
  if (!node.canRequestFocus) {
    return;
  }
  if (!node.hasFocus) {
    node.requestFocus();
    return;
  }
  if (_useReadOnlyImeReconnect(toggleReadOnly)) {
    _readOnlyToggle(node, toggleReadOnly!);
    return;
  }
  node.unfocus();
  WidgetsBinding.instance.addPostFrameCallback((_) {
    if (node.canRequestFocus && !node.hasFocus) {
      node.requestFocus();
    }
  });
}

/// read-only flash with abort and fallback safety nets.
void _readOnlyToggle(
  FocusNode node,
  void Function({required bool readOnly}) toggleReadOnly,
) {
  _cancelActiveReadOnlyReconnect(toggleReadOnly);
  final int id = _nextReconnectId++;
  _activeReconnectId = id;
  toggleReadOnly(readOnly: true);

  bool ownsThisReconnect() => _activeReconnectId == id;

  void schedule(Duration delay, VoidCallback action) {
    _readOnlyReconnectTimers.add(
      Timer(delay, () {
        if (!ownsThisReconnect()) {
          return;
        }
        action();
      }),
    );
  }

  schedule(const Duration(milliseconds: 50), () {
    toggleReadOnly(readOnly: false);
    if (!node.hasFocus) {
      _activeReconnectId = null;
    }
  });

  schedule(const Duration(milliseconds: 100), () {
    if (!node.hasFocus) {
      return;
    }
    _showKeyboard(node);
    _activeReconnectId = null;
  });

  schedule(const Duration(milliseconds: 400), () {
    toggleReadOnly(readOnly: false);
    if (node.hasFocus) {
      _showKeyboard(node);
    }
    _activeReconnectId = null;
  });
}

int _nextReconnectId = 0;
int? _activeReconnectId;
final List<Timer> _readOnlyReconnectTimers = <Timer>[];

/// True while a mobile read-only IME reconnect sequence is in flight.
bool isActiveReadOnlyReconnect() => _activeReconnectId != null;

void _cancelActiveReadOnlyReconnect(
  void Function({required bool readOnly})? toggleReadOnly,
) {
  for (final Timer timer in _readOnlyReconnectTimers) {
    timer.cancel();
  }
  _readOnlyReconnectTimers.clear();
  if (_activeReconnectId == null) {
    return;
  }
  _activeReconnectId = null;
  toggleReadOnly?.call(readOnly: false);
}

/// Re-requests [focusNode] on resume when the keyboard was open before backgrounding.
class KeyboardFocusRestoreHandle {
  KeyboardFocusRestoreHandle({
    required this.focusNode,
    required this.shouldTrackOnBackground,
    required this.canRestoreFocus,
    this.toggleReadOnly,
  });

  final FocusNode focusNode;
  final bool Function() shouldTrackOnBackground;
  final bool Function() canRestoreFocus;
  final void Function({required bool readOnly})? toggleReadOnly;

  bool _pendingRestore = false;
  int _restoreGeneration = 0;

  bool get hasPendingRestore => _pendingRestore;

  void dispose() {
    _restoreGeneration++;
    _cancelActiveReadOnlyReconnect(toggleReadOnly);
  }

  void cancelReadOnlyReconnect() {
    _restoreGeneration++;
    _cancelActiveReadOnlyReconnect(toggleReadOnly);
  }

  void reconnectOpenField() {
    _pendingRestore = false;
    if (!_canAttemptRestore() || _anotherEditableHasFocus()) {
      return;
    }
    reconnectComposerKeyboard(focusNode, toggleReadOnly: toggleReadOnly);
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
    reconnectComposerKeyboard(focusNode, toggleReadOnly: toggleReadOnly);
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
