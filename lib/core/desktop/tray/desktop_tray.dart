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
import 'package:nativeapi/nativeapi.dart' show Application;
import 'package:tray_manager/tray_manager.dart';
import 'package:window_manager/window_manager.dart'
    show
        WindowBlurredEvent,
        WindowCloseRequestedEvent,
        WindowEvent,
        WindowFocusedEvent,
        WindowMinimizedEvent,
        WindowRestoredEvent;

class DesktopTray {
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
  TrayIcon? _trayIcon;
  DesktopTrayMenu? _menu;
  bool _quitting = false;

  static Future<void> start(ProviderContainer container) async {
    if (_instance != null) {
      return;
    }
    final DesktopTray tray = DesktopTray._(container);
    _instance = tray;
    await tray._start();
  }

  DesktopBehaviorPreferencesState get _preferences =>
      _container.read(desktopBehaviorPreferencesProvider);

  DesktopTrayMenuState get _menuState =>
      _container.read(desktopTrayMenuStateProvider);

  Future<void> _start() async {
    await _container.read(desktopBehaviorPreferencesProvider.notifier).load();
    desktopMainWindow?.addListener(_onWindowEvent);
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
    } else if (_trayIcon == null) {
      _createTray();
    }
  }

  void _createTray() {
    final TrayIcon? trayIcon = TrayIcon.create();
    if (trayIcon == null) {
      talker.warning('[DesktopTray] Unable to create tray icon');
      return;
    }
    final Image? icon = ImageAsset.fromAsset(desktopTrayIconAsset());
    if (icon == null) {
      talker.warning('[DesktopTray] Tray icon asset could not be loaded');
      trayIcon.dispose();
      return;
    }
    trayIcon
      ..isIconTemplate = Platform.isMacOS
      ..icon = icon
      ..setContextMenuTrigger(
        Platform.isMacOS
            ? ContextMenuTrigger.clicked
            : ContextMenuTrigger.rightClicked,
      )
      ..addListener(_onTrayEvent)
      ..setVisible(true);
    _trayIcon = trayIcon;
    _rebuildMenu(_menuState);
  }

  void _disposeTray() {
    final TrayIcon? trayIcon = _trayIcon;
    _trayIcon = null;
    _menu?.disposeLater();
    _menu = null;
    if (trayIcon != null) {
      trayIcon
        ..setContextMenu(null)
        ..dispose();
    }
    if (!_quitting && !isDesktopMainWindowShown()) {
      _showWindow();
    }
  }

  void _rebuildMenu(DesktopTrayMenuState state) {
    final TrayIcon? trayIcon = _trayIcon;
    if (trayIcon == null) {
      return;
    }
    final DesktopTrayMenu? menu = DesktopTrayMenu.build(
      state: state,
      visibilityLabel: _visibilityLabel(state),
      onToggleWindow: _toggleWindow,
      actions: _actions,
    );
    if (menu == null) {
      return;
    }
    final DesktopTrayMenu? previous = _menu;
    _menu = menu;
    trayIcon
      ..setTooltip(state.productName)
      ..setContextMenu(menu.menu);
    previous?.disposeLater();
  }

  void _onTrayEvent(TrayIconEvent event) {
    switch (event) {
      case TrayIconClickedEvent():
        if (!Platform.isMacOS) {
          _toggleWindow();
        }
      case TrayIconDoubleClickedEvent():
        _showWindow();
      case TrayIconRightClickedEvent():
        if (Platform.isMacOS) {
          _trayIcon?.openContextMenu();
        }
    }
  }

  void _onWindowEvent(WindowEvent event) {
    switch (event) {
      case WindowCloseRequestedEvent(:final request):
        if (_quitting) {
          return;
        }
        if (Platform.isMacOS || _preferences.closeToTray) {
          request.cancel();
          _hideWindow();
        }
      case WindowMinimizedEvent():
        if (_preferences.minimizeToTray && _trayIcon != null) {
          _hideWindow();
        } else {
          _syncVisibilityLabel();
        }
      case WindowRestoredEvent() ||
          WindowFocusedEvent() ||
          WindowBlurredEvent():
        _syncVisibilityLabel();
      default:
        break;
    }
  }

  String _visibilityLabel(DesktopTrayMenuState state) {
    return isDesktopMainWindowShown()
        ? state.l10n.desktopTrayHide(state.productName)
        : state.l10n.desktopTrayShow(state.productName);
  }

  void _syncVisibilityLabel() {
    _menu?.visibilityItem?.label = _visibilityLabel(_menuState);
  }

  void _showWindow() {
    showDesktopMainWindow();
    if (Platform.isMacOS) {
      Application.instance.show();
    }
    _syncVisibilityLabel();
  }

  void _hideWindow() {
    hideDesktopMainWindow();
    _syncVisibilityLabel();
  }

  void _toggleWindow() {
    if (isDesktopMainWindowShown()) {
      _hideWindow();
    } else {
      _showWindow();
    }
  }

  void _quit() {
    _quitting = true;
    _disposeTray();
    Application.instance.quit(0);
  }
}
