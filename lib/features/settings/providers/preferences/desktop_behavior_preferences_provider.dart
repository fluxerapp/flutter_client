import 'package:flutter/foundation.dart';
import 'package:fluxer_app/core/desktop/window/desktop_window_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'desktop_behavior_preferences_provider.g.dart';

const String _kShowTrayIconKey = 'desktop_show_tray_icon';
const String _kMinimizeToTrayKey = 'desktop_minimize_to_tray';
const String _kCloseToTrayKey = 'desktop_close_to_tray';
const String _kStartMinimizedKey = 'desktop_start_minimized';
const String _kRememberWindowStateKey = kDesktopRememberWindowStateKey;
const String _kColoredTrayIconKey = 'desktop_colored_tray_icon';
const String _kMonochromeTrayIconToneKey = 'desktop_monochrome_tray_icon_tone';
const String _kUnreadLauncherBadgeKey = 'desktop_unread_launcher_badge';
const String _kDarkTaskbarBadgeKey = 'desktop_dark_taskbar_badge';
const String _kUseNativeTitleBarKey = 'desktop_use_native_title_bar';

enum MonochromeTrayIconTone {
  auto('auto'),
  white('white'),
  black('black');

  const MonochromeTrayIconTone(this.storageValue);

  final String storageValue;

  static MonochromeTrayIconTone fromStorage(String? value) {
    for (final MonochromeTrayIconTone tone in values) {
      if (tone.storageValue == value) {
        return tone;
      }
    }
    return MonochromeTrayIconTone.auto;
  }
}

@immutable
class DesktopBehaviorPreferencesState {
  const DesktopBehaviorPreferencesState({
    this.showTrayIcon = true,
    this.storedMinimizeToTray = false,
    this.storedCloseToTray = true,
    this.storedStartMinimized = false,
    this.rememberWindowState = true,
    this.coloredTrayIcon = false,
    this.monochromeTrayIconTone = MonochromeTrayIconTone.auto,
    this.unreadLauncherBadge = false,
    this.darkTaskbarBadge = false,
    this.useNativeTitleBar = false,
  });

  final bool showTrayIcon;
  final bool storedMinimizeToTray;
  final bool storedCloseToTray;
  final bool storedStartMinimized;
  final bool rememberWindowState;
  final bool coloredTrayIcon;
  final MonochromeTrayIconTone monochromeTrayIconTone;
  final bool unreadLauncherBadge;
  final bool darkTaskbarBadge;
  final bool useNativeTitleBar;

  bool get minimizeToTray => showTrayIcon && storedMinimizeToTray;
  bool get closeToTray => showTrayIcon && storedCloseToTray;
  bool get startMinimized => showTrayIcon && storedStartMinimized;

  DesktopBehaviorPreferencesState copyWith({
    bool? showTrayIcon,
    bool? minimizeToTray,
    bool? closeToTray,
    bool? startMinimized,
    bool? rememberWindowState,
    bool? coloredTrayIcon,
    MonochromeTrayIconTone? monochromeTrayIconTone,
    bool? unreadLauncherBadge,
    bool? darkTaskbarBadge,
    bool? useNativeTitleBar,
  }) {
    return DesktopBehaviorPreferencesState(
      showTrayIcon: showTrayIcon ?? this.showTrayIcon,
      storedMinimizeToTray: minimizeToTray ?? storedMinimizeToTray,
      storedCloseToTray: closeToTray ?? storedCloseToTray,
      storedStartMinimized: startMinimized ?? storedStartMinimized,
      rememberWindowState: rememberWindowState ?? this.rememberWindowState,
      coloredTrayIcon: coloredTrayIcon ?? this.coloredTrayIcon,
      monochromeTrayIconTone:
          monochromeTrayIconTone ?? this.monochromeTrayIconTone,
      unreadLauncherBadge: unreadLauncherBadge ?? this.unreadLauncherBadge,
      darkTaskbarBadge: darkTaskbarBadge ?? this.darkTaskbarBadge,
      useNativeTitleBar: useNativeTitleBar ?? this.useNativeTitleBar,
    );
  }

  @override
  bool operator ==(Object other) =>
      other is DesktopBehaviorPreferencesState &&
      other.showTrayIcon == showTrayIcon &&
      other.storedMinimizeToTray == storedMinimizeToTray &&
      other.storedCloseToTray == storedCloseToTray &&
      other.storedStartMinimized == storedStartMinimized &&
      other.rememberWindowState == rememberWindowState &&
      other.coloredTrayIcon == coloredTrayIcon &&
      other.monochromeTrayIconTone == monochromeTrayIconTone &&
      other.unreadLauncherBadge == unreadLauncherBadge &&
      other.darkTaskbarBadge == darkTaskbarBadge &&
      other.useNativeTitleBar == useNativeTitleBar;

  @override
  int get hashCode => Object.hash(
    showTrayIcon,
    storedMinimizeToTray,
    storedCloseToTray,
    storedStartMinimized,
    rememberWindowState,
    coloredTrayIcon,
    monochromeTrayIconTone,
    unreadLauncherBadge,
    darkTaskbarBadge,
    useNativeTitleBar,
  );
}

Future<DesktopBehaviorPreferencesState> readDesktopBehaviorPreferences() async {
  final SharedPreferences preferences = await SharedPreferences.getInstance();
  return DesktopBehaviorPreferencesState(
    showTrayIcon: preferences.getBool(_kShowTrayIconKey) ?? true,
    storedMinimizeToTray: preferences.getBool(_kMinimizeToTrayKey) ?? false,
    storedCloseToTray: preferences.getBool(_kCloseToTrayKey) ?? true,
    storedStartMinimized: preferences.getBool(_kStartMinimizedKey) ?? false,
    rememberWindowState: preferences.getBool(_kRememberWindowStateKey) ?? true,
    coloredTrayIcon: preferences.getBool(_kColoredTrayIconKey) ?? false,
    monochromeTrayIconTone: MonochromeTrayIconTone.fromStorage(
      preferences.getString(_kMonochromeTrayIconToneKey),
    ),
    unreadLauncherBadge: preferences.getBool(_kUnreadLauncherBadgeKey) ?? false,
    darkTaskbarBadge: preferences.getBool(_kDarkTaskbarBadgeKey) ?? false,
    useNativeTitleBar: preferences.getBool(_kUseNativeTitleBarKey) ?? false,
  );
}

@Riverpod(keepAlive: true)
class DesktopBehaviorPreferences extends _$DesktopBehaviorPreferences {
  @override
  DesktopBehaviorPreferencesState build() =>
      const DesktopBehaviorPreferencesState();

  Future<void> load() async {
    state = await readDesktopBehaviorPreferences();
  }

  Future<void> _setBool(String key, bool value) async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setBool(key, value);
  }

  Future<void> setShowTrayIcon({required bool value}) async {
    state = state.copyWith(showTrayIcon: value);
    await _setBool(_kShowTrayIconKey, value);
  }

  Future<void> setMinimizeToTray({required bool value}) async {
    state = state.copyWith(minimizeToTray: value);
    await _setBool(_kMinimizeToTrayKey, value);
  }

  Future<void> setCloseToTray({required bool value}) async {
    state = state.copyWith(closeToTray: value);
    await _setBool(_kCloseToTrayKey, value);
  }

  Future<void> setStartMinimized({required bool value}) async {
    state = state.copyWith(startMinimized: value);
    await _setBool(_kStartMinimizedKey, value);
  }

  Future<void> setRememberWindowState({required bool value}) async {
    state = state.copyWith(rememberWindowState: value);
    await _setBool(_kRememberWindowStateKey, value);
  }

  Future<void> setColoredTrayIcon({required bool value}) async {
    state = state.copyWith(coloredTrayIcon: value);
    await _setBool(_kColoredTrayIconKey, value);
  }

  Future<void> setMonochromeTrayIconTone(MonochromeTrayIconTone value) async {
    state = state.copyWith(monochromeTrayIconTone: value);
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setString(
      _kMonochromeTrayIconToneKey,
      value.storageValue,
    );
  }

  Future<void> setUnreadLauncherBadge({required bool value}) async {
    state = state.copyWith(unreadLauncherBadge: value);
    await _setBool(_kUnreadLauncherBadgeKey, value);
  }

  Future<void> setDarkTaskbarBadge({required bool value}) async {
    state = state.copyWith(darkTaskbarBadge: value);
    await _setBool(_kDarkTaskbarBadgeKey, value);
  }

  Future<void> setUseNativeTitleBar({required bool value}) async {
    state = state.copyWith(useNativeTitleBar: value);
    await _setBool(_kUseNativeTitleBarKey, value);
  }
}
