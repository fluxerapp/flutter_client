import 'package:window_manager/window_manager.dart';

Window? _mainWindow;

Window? get desktopMainWindow {
  final Window? cached = _mainWindow;
  if (cached != null) {
    return cached;
  }
  try {
    return _mainWindow = WindowManager.instance.getCurrent();
  } on Object {
    return null;
  }
}

bool isDesktopMainWindowShown() {
  final Window? window = desktopMainWindow;
  return window != null && window.isVisible && !window.isMinimized;
}

void showDesktopMainWindow() {
  final Window? window = desktopMainWindow;
  if (window == null) {
    return;
  }
  if (window.isMinimized) {
    window.restore();
  }
  window
    ..show()
    ..focus();
}

void hideDesktopMainWindow() {
  final Window? window = desktopMainWindow;
  if (window == null) {
    return;
  }
  if (!window.isFullScreen) {
    window.hide();
    return;
  }
  late final ListenerId listenerId;
  listenerId = window.addListener((WindowEvent event) {
    if (event is WindowExitedFullScreenEvent) {
      window
        ..removeListener(listenerId)
        ..hide();
    }
  });
  window.isFullScreen = false;
}
