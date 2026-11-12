import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'desktop_behavior_preferences_provider.g.dart';

const String _kShowTrayIconKey = 'desktop_show_tray_icon';
const String _kMinimizeToTrayKey = 'desktop_minimize_to_tray';
const String _kCloseToTrayKey = 'desktop_close_to_tray';

@immutable
class DesktopBehaviorPreferencesState {
  const DesktopBehaviorPreferencesState({
    this.showTrayIcon = true,
    this.storedMinimizeToTray = false,
    this.storedCloseToTray = true,
  });

  final bool showTrayIcon;
  final bool storedMinimizeToTray;
  final bool storedCloseToTray;

  bool get minimizeToTray => showTrayIcon && storedMinimizeToTray;
  bool get closeToTray => showTrayIcon && storedCloseToTray;

  DesktopBehaviorPreferencesState copyWith({
    bool? showTrayIcon,
    bool? minimizeToTray,
    bool? closeToTray,
  }) {
    return DesktopBehaviorPreferencesState(
      showTrayIcon: showTrayIcon ?? this.showTrayIcon,
      storedMinimizeToTray: minimizeToTray ?? storedMinimizeToTray,
      storedCloseToTray: closeToTray ?? storedCloseToTray,
    );
  }

  @override
  bool operator ==(Object other) =>
      other is DesktopBehaviorPreferencesState &&
      other.showTrayIcon == showTrayIcon &&
      other.storedMinimizeToTray == storedMinimizeToTray &&
      other.storedCloseToTray == storedCloseToTray;

  @override
  int get hashCode =>
      Object.hash(showTrayIcon, storedMinimizeToTray, storedCloseToTray);
}

@Riverpod(keepAlive: true)
class DesktopBehaviorPreferences extends _$DesktopBehaviorPreferences {
  @override
  DesktopBehaviorPreferencesState build() =>
      const DesktopBehaviorPreferencesState();

  Future<void> load() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    state = DesktopBehaviorPreferencesState(
      showTrayIcon: preferences.getBool(_kShowTrayIconKey) ?? true,
      storedMinimizeToTray: preferences.getBool(_kMinimizeToTrayKey) ?? false,
      storedCloseToTray: preferences.getBool(_kCloseToTrayKey) ?? true,
    );
  }

  Future<void> setShowTrayIcon({required bool value}) async {
    state = state.copyWith(showTrayIcon: value);
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setBool(_kShowTrayIconKey, value);
  }

  Future<void> setMinimizeToTray({required bool value}) async {
    state = state.copyWith(minimizeToTray: value);
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setBool(_kMinimizeToTrayKey, value);
  }

  Future<void> setCloseToTray({required bool value}) async {
    state = state.copyWith(closeToTray: value);
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setBool(_kCloseToTrayKey, value);
  }
}
