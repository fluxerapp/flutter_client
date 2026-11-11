import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:window_manager/window_manager.dart';

final DesktopMainWindow desktopMainWindow = DesktopMainWindow._();

class DesktopMainWindow extends ChangeNotifier with WindowListener {
  DesktopMainWindow._();

  bool _attached = false;
  bool _visible = false;
  bool _minimized = false;
  bool _focused = false;
  bool _maximized = false;

  bool get isVisible => _visible;
  bool get isMinimized => _minimized;
  bool get isFocused => _focused;
  bool get isMaximized => _maximized;

  Future<void> attach() async {
    if (_attached) {
      return;
    }
    _attached = true;
    windowManager.addListener(this);
    await refresh();
  }

  Future<void> refresh() async {
    if (!_attached) {
      return;
    }
    try {
      final (
        bool visible,
        bool minimized,
        bool focused,
        bool maximized,
      ) = await (
        windowManager.isVisible(),
        windowManager.isMinimized(),
        windowManager.isFocused(),
        windowManager.isMaximized(),
      ).wait;
      _update(
        visible: visible,
        minimized: minimized,
        focused: focused,
        maximized: maximized,
      );
    } on Object {
      return;
    }
  }

  void _update({
    bool? visible,
    bool? minimized,
    bool? focused,
    bool? maximized,
  }) {
    final bool changed =
        (visible != null && visible != _visible) ||
        (minimized != null && minimized != _minimized) ||
        (focused != null && focused != _focused) ||
        (maximized != null && maximized != _maximized);
    _visible = visible ?? _visible;
    _minimized = minimized ?? _minimized;
    _focused = focused ?? _focused;
    _maximized = maximized ?? _maximized;
    if (changed) {
      notifyListeners();
    }
  }

  void _updateAndRefresh({
    bool? visible,
    bool? minimized,
    bool? focused,
    bool? maximized,
  }) {
    _update(
      visible: visible,
      minimized: minimized,
      focused: focused,
      maximized: maximized,
    );
    unawaited(refresh());
  }

  @override
  void onWindowFocus() => _updateAndRefresh(visible: true, focused: true);

  @override
  void onWindowBlur() => _updateAndRefresh(focused: false);

  @override
  void onWindowMinimize() => _updateAndRefresh(minimized: true, focused: false);

  @override
  void onWindowRestore() => _updateAndRefresh(minimized: false);

  @override
  void onWindowMaximize() => _updateAndRefresh(maximized: true);

  @override
  void onWindowUnmaximize() => _updateAndRefresh(maximized: false);

  @override
  void onWindowEnterFullScreen() => unawaited(refresh());

  @override
  void onWindowLeaveFullScreen() => unawaited(refresh());
}

bool isDesktopMainWindowShown() {
  return desktopMainWindow.isVisible && !desktopMainWindow.isMinimized;
}

bool isDesktopMainWindowFocused() {
  return isDesktopMainWindowShown() && desktopMainWindow.isFocused;
}

void revealDesktopMainWindow() => showDesktopMainWindow();

void showDesktopMainWindow() {
  desktopMainWindow._update(visible: true, minimized: false);
  unawaited(_showDesktopMainWindow());
}

Future<void> _showDesktopMainWindow() async {
  try {
    if (await windowManager.isMinimized()) {
      await windowManager.restore();
    }
    await windowManager.show();
    await windowManager.focus();
  } on Object {
    return;
  } finally {
    unawaited(desktopMainWindow.refresh());
  }
}

void hideDesktopMainWindow() {
  desktopMainWindow._update(visible: false, focused: false);
  unawaited(_hideDesktopMainWindow());
}

Future<void> _hideDesktopMainWindow() async {
  try {
    if (await windowManager.isFullScreen()) {
      final Completer<void> exited = Completer<void>();
      final _FullScreenExitListener listener = _FullScreenExitListener(() {
        if (!exited.isCompleted) {
          exited.complete();
        }
      });
      windowManager.addListener(listener);
      try {
        await windowManager.setFullScreen(false);
        await exited.future.timeout(
          const Duration(seconds: 2),
          onTimeout: () {},
        );
      } finally {
        windowManager.removeListener(listener);
      }
    }
    await windowManager.hide();
  } on Object {
    return;
  } finally {
    unawaited(desktopMainWindow.refresh());
  }
}

void minimizeDesktopMainWindow() {
  unawaited(windowManager.minimize().catchError((Object _) {}));
}

void closeDesktopMainWindow() {
  unawaited(windowManager.close().catchError((Object _) {}));
}

void toggleMaximizeDesktopMainWindow() {
  unawaited(_toggleMaximize());
}

Future<void> _toggleMaximize() async {
  try {
    if (await windowManager.isMaximized()) {
      await windowManager.unmaximize();
    } else {
      await windowManager.maximize();
    }
  } on Object {
    return;
  }
}

void setDesktopMainWindowTitle(String title) {
  unawaited(windowManager.setTitle(title).catchError((Object _) {}));
}

void popUpDesktopMainWindowMenu() {
  unawaited(windowManager.popUpWindowMenu().catchError((Object _) {}));
}

Future<void> quitDesktopApp() async {
  try {
    await windowManager.setPreventClose(false);
    await windowManager.destroy();
  } on Object {
    return;
  }
}

class _FullScreenExitListener with WindowListener {
  _FullScreenExitListener(this._onExit);

  final VoidCallback _onExit;

  @override
  void onWindowLeaveFullScreen() => _onExit();
}
