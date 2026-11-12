import 'dart:async';
import 'dart:io';

import 'package:flutter/widgets.dart' show WidgetsBinding;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/desktop/tray/desktop_tray_actions.dart';
import 'package:fluxer_app/core/desktop/tray/desktop_tray_icon.dart';
import 'package:fluxer_app/core/desktop/tray/desktop_tray_menu.dart';
import 'package:fluxer_app/core/desktop/tray/desktop_tray_state.dart';
import 'package:fluxer_app/core/desktop/window/desktop_main_window.dart';
import 'package:fluxer_app/core/talker.dart';
import 'package:fluxer_app/features/settings/providers/preferences/desktop_behavior_preferences_provider.dart';
import 'package:tray_manager/tray_manager.dart';
import 'package:window_manager/window_manager.dart';

class DesktopTray with TrayListener, WindowListener {
  DesktopTray._(this._container) {
    _actions = DesktopTrayActions(
      _container,
      showWindow: _showWindow,
      quit: _quit,
    );
  }

  static DesktopTray? _instance;

  final ProviderContainer _container;
  late final DesktopTrayActions _actions;
  bool _trayVisible = false;
  bool _quitting = false;
  String? _visibilityLabelShown;

  static Future<void> start(ProviderContainer container) async {
    if (_instance != null) {
      return;
    }
    final DesktopTray tray = DesktopTray._(container);
    _instance = tray;
    await tray._start();
  }

  static void quit() {
    final DesktopTray? tray = _instance;
    if (tray == null) {
      unawaited(quitDesktopApp());
      return;
    }
    tray._quit();
  }

  DesktopBehaviorPreferencesState get _preferences =>
      _container.read(desktopBehaviorPreferencesProvider);

  DesktopTrayMenuState get _menuState =>
      _container.read(desktopTrayMenuStateProvider);

  Future<void> _start() async {
    await _container.read(desktopBehaviorPreferencesProvider.notifier).load();
    windowManager.addListener(this);
    trayManager.addListener(this);
    desktopMainWindow.addListener(_syncVisibilityLabel);
    WidgetsBinding.instance.addPostFrameCallback((_) => _attach());
  }

  void _attach() {
    _container
      ..listen<DesktopBehaviorPreferencesState>(
        desktopBehaviorPreferencesProvider,
        (_, next) => _applyPreferences(next),
      )
      ..listen<DesktopTrayMenuState>(
        desktopTrayMenuStateProvider,
        (_, next) => _rebuildMenu(next),
      );
    _applyPreferences(_preferences);
  }

  void _applyPreferences(DesktopBehaviorPreferencesState preferences) {
    if (!preferences.showTrayIcon) {
      _disposeTray();
    } else if (!_trayVisible) {
      unawaited(_createTray());
    }
  }

  Future<void> _createTray() async {
    _trayVisible = true;
    try {
      await trayManager.setIcon(
        desktopTrayIconAsset(),
        isTemplate: Platform.isMacOS,
      );
    } on Object catch (error, stackTrace) {
      _trayVisible = false;
      talker.error(
        '[DesktopTray] Unable to create tray icon',
        error,
        stackTrace,
      );
      return;
    }
    _rebuildMenu(_menuState);
  }

  void _disposeTray() {
    if (_trayVisible) {
      _trayVisible = false;
      _visibilityLabelShown = null;
      unawaited(_guard('destroy', trayManager.destroy));
    }
    if (!_quitting && !isDesktopMainWindowShown()) {
      _showWindow();
    }
  }

  void _rebuildMenu(DesktopTrayMenuState state) {
    if (!_trayVisible) {
      return;
    }
    final String visibilityLabel = _visibilityLabel(state);
    _visibilityLabelShown = visibilityLabel;
    final Menu menu = buildDesktopTrayMenu(
      state: state,
      visibilityLabel: visibilityLabel,
      onToggleWindow: _toggleWindow,
      actions: _actions,
    );
    unawaited(
      _guard('update menu', () async {
        if (!Platform.isLinux) {
          await trayManager.setToolTip(state.productName);
        }
        await trayManager.setContextMenu(menu);
      }),
    );
  }

  Future<void> _guard(String action, Future<void> Function() run) async {
    try {
      await run();
    } on Object catch (error, stackTrace) {
      talker.warning('[DesktopTray] Failed to $action', error, stackTrace);
    }
  }

  @override
  void onTrayIconMouseDown() {
    if (Platform.isMacOS) {
      unawaited(_guard('open menu', trayManager.popUpContextMenu));
    } else {
      _toggleWindow();
    }
  }

  @override
  void onTrayIconRightMouseDown() {
    unawaited(_guard('open menu', trayManager.popUpContextMenu));
  }

  @override
  void onWindowClose() {
    if (_quitting) {
      return;
    }
    if (_preferences.closeToTray && _trayVisible) {
      _hideWindow();
    } else {
      _quit();
    }
  }

  @override
  void onWindowMinimize() {
    if (_preferences.minimizeToTray && _trayVisible) {
      _hideWindow();
    }
  }

  String _visibilityLabel(DesktopTrayMenuState state) {
    return isDesktopMainWindowShown()
        ? state.l10n.desktopTrayHide(state.productName)
        : state.l10n.desktopTrayShow(state.productName);
  }

  void _syncVisibilityLabel() {
    if (_trayVisible && _visibilityLabel(_menuState) != _visibilityLabelShown) {
      _rebuildMenu(_menuState);
    }
  }

  void _showWindow() {
    revealDesktopMainWindow();
  }

  void _hideWindow() {
    hideDesktopMainWindow();
  }

  void _toggleWindow() {
    if (isDesktopMainWindowShown()) {
      _hideWindow();
    } else {
      _showWindow();
    }
  }

  void _quit() {
    if (_quitting) {
      return;
    }
    _quitting = true;
    _disposeTray();
    unawaited(quitDesktopApp());
  }
}
