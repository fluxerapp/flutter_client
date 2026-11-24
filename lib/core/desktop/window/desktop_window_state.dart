import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:fluxer_app/core/local_settings/local_setting_keys.dart';
import 'package:fluxer_app/core/local_settings/local_settings_store.dart';
import 'package:window_manager/window_manager.dart';

const Duration _kSaveDebounce = Duration(milliseconds: 500);

@immutable
class DesktopWindowState {
  const DesktopWindowState({required this.bounds, required this.maximized});

  final Rect bounds;
  final bool maximized;

  Map<String, Object> toJson() => {
    'x': bounds.left,
    'y': bounds.top,
    'width': bounds.width,
    'height': bounds.height,
    'maximized': maximized,
  };

  static DesktopWindowState? fromJson(Object? json) {
    if (json is! Map) {
      return null;
    }
    final Object? x = json['x'];
    final Object? y = json['y'];
    final Object? width = json['width'];
    final Object? height = json['height'];
    if (x is! num || y is! num || width is! num || height is! num) {
      return null;
    }
    if (width <= 0 || height <= 0) {
      return null;
    }
    return DesktopWindowState(
      bounds: Rect.fromLTWH(
        x.toDouble(),
        y.toDouble(),
        width.toDouble(),
        height.toDouble(),
      ),
      maximized: json['maximized'] == true,
    );
  }
}

DesktopWindowState? readDesktopWindowState(LocalSettingsStore store) =>
    DesktopWindowState.fromJson(
      store.read(LocalSettingKeys.desktopWindowState),
    );

class DesktopWindowStateTracker with WindowListener {
  DesktopWindowStateTracker(this._normalBounds, this._store);

  final LocalSettingsStore _store;
  Rect _normalBounds;
  Timer? _debounce;

  @override
  void onWindowResize() => _scheduleSave();

  @override
  void onWindowMove() => _scheduleSave();

  @override
  void onWindowMaximize() => _scheduleSave();

  @override
  void onWindowUnmaximize() => _scheduleSave();

  @override
  void onWindowRestore() => _scheduleSave();

  void _scheduleSave() {
    _debounce?.cancel();
    _debounce = Timer(_kSaveDebounce, () => unawaited(_save()));
  }

  Future<void> _save() async {
    if (!_store.read(LocalSettingKeys.desktopRememberWindowState)) {
      return;
    }
    final bool maximized;
    try {
      if (await windowManager.isFullScreen() ||
          await windowManager.isMinimized()) {
        return;
      }
      maximized = await windowManager.isMaximized();
      if (!maximized) {
        _normalBounds = await windowManager.getBounds();
      }
    } on Object {
      return;
    }
    _store.write(
      LocalSettingKeys.desktopWindowState,
      DesktopWindowState(bounds: _normalBounds, maximized: maximized).toJson(),
    );
  }
}
