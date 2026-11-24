import 'dart:async';
import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:fluxer_app/core/desktop/autostart/desktop_autostart.dart';
import 'package:fluxer_app/core/desktop/window/desktop_main_window.dart';
import 'package:fluxer_app/core/desktop/window/desktop_window_placement.dart';
import 'package:fluxer_app/core/desktop/window/desktop_window_state.dart';
import 'package:fluxer_app/core/local_settings/local_settings_store.dart';
import 'package:fluxer_app/features/settings/providers/preferences/desktop_behavior_preferences_provider.dart';
import 'package:window_manager/window_manager.dart';

const Size _kDefaultSize = Size(1280, 720);

bool _usesNativeTitleBar = false;

bool get desktopUsesNativeTitleBar =>
    (Platform.isWindows || Platform.isLinux) && _usesNativeTitleBar;

TitleBarStyle? _titleBarStyle() {
  if (Platform.isMacOS || (Platform.isWindows && !_usesNativeTitleBar)) {
    return TitleBarStyle.hidden;
  }
  return null;
}

Future<void> configureDesktopWindow(
  List<String> args, {
  required LocalSettingsStore localSettings,
}) async {
  await windowManager.ensureInitialized();

  await DesktopAutostart.resolveLaunch(args);
  final DesktopBehaviorPreferencesState behavior =
      readDesktopBehaviorPreferences(localSettings);
  final (List<Rect> workAreas, Rect? primary) = await (
    displayWorkAreas(),
    primaryWorkArea(),
  ).wait;
  _usesNativeTitleBar = behavior.useNativeTitleBar;
  final DesktopWindowState? saved = behavior.rememberWindowState
      ? readDesktopWindowState(localSettings)
      : null;

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
    DesktopWindowStateTracker(await windowManager.getBounds(), localSettings),
  );

  final bool maximized = saved?.maximized ?? false;
  final bool startHidden =
      DesktopAutostart.launchedAtLogin && behavior.startMinimized;
  WidgetsBinding.instance.addPostFrameCallback((_) {
    unawaited(
      startHidden
          ? desktopMainWindow.refresh()
          : _showDesktopWindow(maximized: maximized),
    );
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
