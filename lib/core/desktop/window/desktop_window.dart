import 'dart:async';
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
  await windowManager.ensureInitialized();

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

  await windowManager.waitUntilReadyToShow(
    WindowOptions(
      size: size,
      minimumSize: kDesktopWindowMinimumSize,
      center: savedArea == null,
      titleBarStyle: _titleBarStyle(),
      windowButtonVisibility: Platform.isMacOS ? true : null,
    ),
  );
  if (saved != null && savedArea != null) {
    await windowManager.setPosition(
      clampIntoWorkArea(saved.bounds.topLeft, size, savedArea),
    );
  }
  if (!Platform.isMacOS) {
    await windowManager.setPreventClose(true);
  }

  await desktopMainWindow.attach();
  windowManager.addListener(
    DesktopWindowStateTracker(await windowManager.getBounds()),
  );

  final bool maximized = saved?.maximized ?? false;
  WidgetsBinding.instance.addPostFrameCallback((_) {
    unawaited(_showDesktopWindow(maximized: maximized));
  });
}

Future<void> _showDesktopWindow({required bool maximized}) async {
  if (maximized) {
    await windowManager.maximize();
  }
  await windowManager.show();
  await windowManager.focus();
  await desktopMainWindow.refresh();
}
