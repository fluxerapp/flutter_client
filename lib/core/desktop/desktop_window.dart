import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:math' as math;

import 'package:flutter/widgets.dart';
import 'package:screen_retriever/screen_retriever.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:window_manager/window_manager.dart';

const Size _kDefaultSize = Size(1280, 720);
const Size _kMinimumSize = Size(480, 560);
const double _kMaxWorkAreaFraction = 0.9;
const double _kMinVisibleTitlebarWidth = 120;
const double _kMinVisibleTitlebarHeight = 24;
const Duration _kSaveDebounce = Duration(milliseconds: 500);
const String _kWindowStateKey = 'desktop_window_state_v1';

class _WindowState {
  const _WindowState({required this.bounds, required this.maximized});

  final Rect bounds;
  final bool maximized;

  Map<String, Object> toJson() => {
    'x': bounds.left,
    'y': bounds.top,
    'width': bounds.width,
    'height': bounds.height,
    'maximized': maximized,
  };

  static _WindowState? fromJson(Object? json) {
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
    return _WindowState(
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

Future<_WindowState?> _loadWindowState() async {
  try {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    final String? raw = preferences.getString(_kWindowStateKey);
    if (raw == null) {
      return null;
    }
    return _WindowState.fromJson(jsonDecode(raw));
  } on Object {
    return null;
  }
}

Future<void> _saveWindowState(_WindowState state) async {
  try {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setString(_kWindowStateKey, jsonEncode(state.toJson()));
  } on Object {
    return;
  }
}

Future<List<Rect>> _displayWorkAreas() async {
  try {
    final List<Display> displays = await screenRetriever.getAllDisplays();
    return [
      for (final Display display in displays)
        (display.visiblePosition ?? Offset.zero) &
            (display.visibleSize ?? display.size),
    ];
  } on Object {
    return const [];
  }
}

Future<Rect?> _primaryWorkArea() async {
  try {
    final Display display = await screenRetriever.getPrimaryDisplay();
    final Rect area =
        (display.visiblePosition ?? Offset.zero) &
        (display.visibleSize ?? display.size);
    return area.isEmpty ? null : area;
  } on Object {
    return null;
  }
}

Size _fitToWorkArea(Size size, Rect? workArea) {
  double width = math.max(size.width, _kMinimumSize.width);
  double height = math.max(size.height, _kMinimumSize.height);
  if (workArea != null) {
    width = math.min(
      width,
      math.max(_kMinimumSize.width, workArea.width * _kMaxWorkAreaFraction),
    );
    height = math.min(
      height,
      math.max(_kMinimumSize.height, workArea.height * _kMaxWorkAreaFraction),
    );
  }
  return Size(width.floorToDouble(), height.floorToDouble());
}

Rect? _workAreaShowingTitlebar(Rect bounds, List<Rect> workAreas) {
  final Rect titlebar = Rect.fromLTWH(
    bounds.left,
    bounds.top,
    bounds.width,
    _kMinVisibleTitlebarHeight,
  );
  for (final Rect area in workAreas) {
    final Rect overlap = titlebar.intersect(area);
    if (overlap.width >= _kMinVisibleTitlebarWidth &&
        overlap.height >= _kMinVisibleTitlebarHeight / 2) {
      return area;
    }
  }
  return null;
}

Offset _clampIntoWorkArea(Offset position, Size size, Rect area) {
  return Offset(
    position.dx.clamp(area.left, math.max(area.left, area.right - size.width)),
    position.dy.clamp(area.top, math.max(area.top, area.bottom - size.height)),
  );
}

TitleBarStyle? _titleBarStyle() {
  if (Platform.isMacOS || Platform.isWindows) {
    return TitleBarStyle.hidden;
  }
  return null;
}

class _WindowStateTracker with WindowListener {
  _WindowStateTracker(this._normalBounds);

  Rect _normalBounds;
  Timer? _debounce;

  void _scheduleSave() {
    _debounce?.cancel();
    _debounce = Timer(_kSaveDebounce, () => unawaited(_save()));
  }

  Future<void> _save() async {
    if (await windowManager.isFullScreen() ||
        await windowManager.isMinimized()) {
      return;
    }
    final bool maximized = await windowManager.isMaximized();
    if (!maximized) {
      _normalBounds = await windowManager.getBounds();
    }
    await _saveWindowState(
      _WindowState(bounds: _normalBounds, maximized: maximized),
    );
  }

  @override
  void onWindowResize() => _scheduleSave();

  @override
  void onWindowMove() => _scheduleSave();

  @override
  void onWindowMaximize() => _scheduleSave();

  @override
  void onWindowUnmaximize() => _scheduleSave();
}

Future<void> configureDesktopWindow() async {
  await windowManager.ensureInitialized();

  final (_WindowState? saved, List<Rect> workAreas, Rect? primary) = await (
    _loadWindowState(),
    _displayWorkAreas(),
    _primaryWorkArea(),
  ).wait;

  final Rect? savedArea = saved == null
      ? null
      : _workAreaShowingTitlebar(saved.bounds, workAreas);
  final Size size = _fitToWorkArea(
    saved?.bounds.size ?? _kDefaultSize,
    savedArea ?? primary,
  );

  await windowManager.waitUntilReadyToShow(
    WindowOptions(
      size: size,
      minimumSize: _kMinimumSize,
      center: savedArea == null,
      titleBarStyle: _titleBarStyle(),
      windowButtonVisibility: Platform.isMacOS ? true : null,
    ),
  );
  if (saved != null && savedArea != null) {
    await windowManager.setPosition(
      _clampIntoWorkArea(saved.bounds.topLeft, size, savedArea),
    );
  }

  windowManager.addListener(
    _WindowStateTracker(await windowManager.getBounds()),
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
}
