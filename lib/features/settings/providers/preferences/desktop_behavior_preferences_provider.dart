import 'package:flutter/foundation.dart';
import 'package:fluxer_app/core/local_settings/local_setting_key.dart';
import 'package:fluxer_app/core/local_settings/local_setting_keys.dart';
import 'package:fluxer_app/core/local_settings/local_settings_store.dart';
import 'package:fluxer_app/core/local_settings/local_settings_store_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'desktop_behavior_preferences_provider.g.dart';

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

DesktopBehaviorPreferencesState readDesktopBehaviorPreferences(
  LocalSettingsStore store,
) {
  return DesktopBehaviorPreferencesState(
    showTrayIcon: store.read(LocalSettingKeys.desktopShowTrayIcon),
    storedMinimizeToTray: store.read(LocalSettingKeys.desktopMinimizeToTray),
    storedCloseToTray: store.read(LocalSettingKeys.desktopCloseToTray),
    storedStartMinimized: store.read(LocalSettingKeys.desktopStartMinimized),
    rememberWindowState: store.read(
      LocalSettingKeys.desktopRememberWindowState,
    ),
    coloredTrayIcon: store.read(LocalSettingKeys.desktopColoredTrayIcon),
    monochromeTrayIconTone: MonochromeTrayIconTone.fromStorage(
      store.read(LocalSettingKeys.desktopMonochromeTrayIconTone),
    ),
    unreadLauncherBadge: store.read(
      LocalSettingKeys.desktopUnreadLauncherBadge,
    ),
    darkTaskbarBadge: store.read(LocalSettingKeys.desktopDarkTaskbarBadge),
    useNativeTitleBar: store.read(LocalSettingKeys.desktopUseNativeTitleBar),
  );
}

@Riverpod(keepAlive: true)
class DesktopBehaviorPreferences extends _$DesktopBehaviorPreferences {
  @override
  DesktopBehaviorPreferencesState build() =>
      readDesktopBehaviorPreferences(ref.watch(localSettingsStoreProvider));

  void _write(DeviceFlag key, {required bool value}) =>
      ref.read(localSettingsStoreProvider).write(key, value);

  Future<void> _mirrorForNativeRunner(
    DeviceFlag key, {
    required bool value,
  }) async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setBool(key.name, value);
  }

  Future<void> setShowTrayIcon({required bool value}) async {
    state = state.copyWith(showTrayIcon: value);
    _write(LocalSettingKeys.desktopShowTrayIcon, value: value);
    await _mirrorForNativeRunner(
      LocalSettingKeys.desktopShowTrayIcon,
      value: value,
    );
  }

  Future<void> setMinimizeToTray({required bool value}) async {
    state = state.copyWith(minimizeToTray: value);
    _write(LocalSettingKeys.desktopMinimizeToTray, value: value);
  }

  Future<void> setCloseToTray({required bool value}) async {
    state = state.copyWith(closeToTray: value);
    _write(LocalSettingKeys.desktopCloseToTray, value: value);
    await _mirrorForNativeRunner(
      LocalSettingKeys.desktopCloseToTray,
      value: value,
    );
  }

  Future<void> setStartMinimized({required bool value}) async {
    state = state.copyWith(startMinimized: value);
    _write(LocalSettingKeys.desktopStartMinimized, value: value);
  }

  Future<void> setRememberWindowState({required bool value}) async {
    state = state.copyWith(rememberWindowState: value);
    _write(LocalSettingKeys.desktopRememberWindowState, value: value);
  }

  Future<void> setColoredTrayIcon({required bool value}) async {
    state = state.copyWith(coloredTrayIcon: value);
    _write(LocalSettingKeys.desktopColoredTrayIcon, value: value);
  }

  Future<void> setMonochromeTrayIconTone(MonochromeTrayIconTone value) async {
    state = state.copyWith(monochromeTrayIconTone: value);
    ref
        .read(localSettingsStoreProvider)
        .write(
          LocalSettingKeys.desktopMonochromeTrayIconTone,
          value.storageValue,
        );
  }

  Future<void> setUnreadLauncherBadge({required bool value}) async {
    state = state.copyWith(unreadLauncherBadge: value);
    _write(LocalSettingKeys.desktopUnreadLauncherBadge, value: value);
  }

  Future<void> setDarkTaskbarBadge({required bool value}) async {
    state = state.copyWith(darkTaskbarBadge: value);
    _write(LocalSettingKeys.desktopDarkTaskbarBadge, value: value);
  }

  Future<void> setUseNativeTitleBar({required bool value}) async {
    state = state.copyWith(useNativeTitleBar: value);
    _write(LocalSettingKeys.desktopUseNativeTitleBar, value: value);
    await _mirrorForNativeRunner(
      LocalSettingKeys.desktopUseNativeTitleBar,
      value: value,
    );
  }
}
