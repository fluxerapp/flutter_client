import 'dart:async';
import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:window_manager/window_manager.dart';

const Duration _kSaveDebounce = Duration(milliseconds: 500);
const String _kWindowStateKey = 'desktop_window_state_v1';

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

Future<DesktopWindowState?> loadDesktopWindowState() async {
  try {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    final String? raw = preferences.getString(_kWindowStateKey);
    if (raw == null) {
      return null;
    }
    return DesktopWindowState.fromJson(jsonDecode(raw));
  } on Object {
    return null;
  }
}

Future<void> saveDesktopWindowState(DesktopWindowState state) async {
  try {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setString(_kWindowStateKey, jsonEncode(state.toJson()));
  } on Object {
    return;
  }
}

class DesktopWindowStateTracker {
  DesktopWindowStateTracker(this._window, this._normalBounds);

  final Window _window;
  Rect _normalBounds;
  Timer? _debounce;

  void attach() {
    _window.addListener(_onEvent);
  }

  void _onEvent(WindowEvent event) {
    switch (event) {
      case WindowResizedEvent() ||
          WindowMovedEvent() ||
          WindowMaximizedEvent() ||
          WindowRestoredEvent():
        _scheduleSave();
      default:
        break;
    }
  }

  void _scheduleSave() {
    _debounce?.cancel();
    _debounce = Timer(_kSaveDebounce, () => unawaited(_save()));
  }

  Future<void> _save() async {
    if (_window.isFullScreen || _window.isMinimized) {
      return;
    }
    final bool maximized = _window.isMaximized;
    if (!maximized) {
      _normalBounds = _window.bounds.toRect();
    }
    await saveDesktopWindowState(
      DesktopWindowState(bounds: _normalBounds, maximized: maximized),
    );
  }
}
