import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:fluxer_app/core/desktop/window/desktop_main_window.dart';
import 'package:fluxer_app/core/desktop/window/desktop_window_placement.dart';
import 'package:fluxer_app/core/desktop/window/desktop_window_state.dart';
import 'package:window_manager/window_manager.dart';

const Size _kDefaultSize = Size(1280, 720);

TitleBarStyle? _titleBarStyle() {
  if (Platform.isMacOS || Platform.isWindows) {
    return TitleBarStyle.hidden;
  }
  return null;
}

Future<void> configureDesktopWindow() async {
  final Window? window = desktopMainWindow;
  if (window == null) {
    return;
  }

  final (
    DesktopWindowState? saved,
    List<Rect> workAreas,
    Rect? primary,
  ) = await (
    loadDesktopWindowState(),
    displayWorkAreas(),
    primaryWorkArea(),
  ).wait;

  final Rect? savedArea = saved == null
      ? null
      : workAreaShowingTitlebar(saved.bounds, workAreas);
  final Size size = fitToWorkArea(
    saved?.bounds.size ?? _kDefaultSize,
    savedArea ?? primary,
  );

  final TitleBarStyle? titleBarStyle = _titleBarStyle();
  if (titleBarStyle != null) {
    window
      ..titleBarStyle = titleBarStyle
      ..isWindowControlButtonsVisible = true;
  }
  if (window.isFullScreen) {
    window.isFullScreen = false;
  }
  if (window.isMaximized) {
    window.unmaximize();
  }
  if (window.isMinimized) {
    window.restore();
  }
  window
    ..setSize(size.toNative(), false)
    ..minimumSize = kDesktopWindowMinimumSize.toNative();
  if (saved != null && savedArea != null) {
    window.position = clampIntoWorkArea(
      saved.bounds.topLeft,
      size,
      savedArea,
    ).toNative();
  } else {
    window.center();
  }

  DesktopWindowStateTracker(window, window.bounds.toRect()).attach();

  final bool maximized = saved?.maximized ?? false;
  WidgetsBinding.instance.addPostFrameCallback((_) {
    _showDesktopWindow(window, maximized: maximized);
  });
}

void _showDesktopWindow(Window window, {required bool maximized}) {
  if (maximized) {
    window.maximize();
  }
  window
    ..show()
    ..focus();
}
