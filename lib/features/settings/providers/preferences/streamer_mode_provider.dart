import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:fluxer_app/core/desktop/windows/windows_process_names.dart';
import 'package:fluxer_app/shared/utils/shared_preferences_or_null.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'streamer_mode_provider.g.dart';

const String _kManualEnabledKey = 'streamer_mode_manual_enabled';
const String _kAutoEnableKey = 'streamer_mode_auto_enable';
const String _kHidePersonalInformationKey = 'streamer_mode_hide_personal';
const String _kHideInviteLinksKey = 'streamer_mode_hide_invite_links';
const String _kDisableSoundsKey = 'streamer_mode_disable_sounds';
const String _kDisableNotificationsKey = 'streamer_mode_disable_notifications';
const Duration _kCaptureAppPollInterval = Duration(seconds: 15);
const Set<String> _kCaptureProcessNames = <String>{
  'obs',
  'obs.exe',
  'obs32.exe',
  'obs64.exe',
  'obs-studio',
  'obs-studio.exe',
  'xsplit',
  'xsplit.exe',
  'xsplit.core.exe',
  'xsplit.broadcaster.exe',
};

bool get streamerModeAutoDetectSupported =>
    defaultTargetPlatform == TargetPlatform.windows ||
    defaultTargetPlatform == TargetPlatform.macOS ||
    defaultTargetPlatform == TargetPlatform.linux;

@immutable
class StreamerModeState {
  const StreamerModeState({
    this.manualEnabled = false,
    this.autoEnable = true,
    this.hidePersonalInformation = true,
    this.hideInviteLinks = true,
    this.disableSounds = true,
    this.disableNotifications = true,
    this.captureAppDetected = false,
    this.nagbarDismissed = false,
  });

  final bool manualEnabled;
  final bool autoEnable;
  final bool hidePersonalInformation;
  final bool hideInviteLinks;
  final bool disableSounds;
  final bool disableNotifications;
  final bool captureAppDetected;
  final bool nagbarDismissed;

  bool get shouldShowNagbar => enabled && !nagbarDismissed;

  bool get enabled => manualEnabled || (autoEnable && captureAppDetected);
  bool get shouldHidePersonalInformation => enabled && hidePersonalInformation;
  bool get shouldHideInviteLinks => enabled && hideInviteLinks;
  bool get shouldDisableSounds => enabled && disableSounds;
  bool get shouldDisableNotifications => enabled && disableNotifications;

  StreamerModeState copyWith({
    bool? manualEnabled,
    bool? autoEnable,
    bool? hidePersonalInformation,
    bool? hideInviteLinks,
    bool? disableSounds,
    bool? disableNotifications,
    bool? captureAppDetected,
    bool? nagbarDismissed,
  }) {
    return StreamerModeState(
      manualEnabled: manualEnabled ?? this.manualEnabled,
      autoEnable: autoEnable ?? this.autoEnable,
      hidePersonalInformation:
          hidePersonalInformation ?? this.hidePersonalInformation,
      hideInviteLinks: hideInviteLinks ?? this.hideInviteLinks,
      disableSounds: disableSounds ?? this.disableSounds,
      disableNotifications: disableNotifications ?? this.disableNotifications,
      captureAppDetected: captureAppDetected ?? this.captureAppDetected,
      nagbarDismissed: nagbarDismissed ?? this.nagbarDismissed,
    );
  }

  @override
  bool operator ==(Object other) =>
      other is StreamerModeState &&
      other.manualEnabled == manualEnabled &&
      other.autoEnable == autoEnable &&
      other.hidePersonalInformation == hidePersonalInformation &&
      other.hideInviteLinks == hideInviteLinks &&
      other.disableSounds == disableSounds &&
      other.disableNotifications == disableNotifications &&
      other.captureAppDetected == captureAppDetected &&
      other.nagbarDismissed == nagbarDismissed;

  @override
  int get hashCode => Object.hash(
    manualEnabled,
    autoEnable,
    hidePersonalInformation,
    hideInviteLinks,
    disableSounds,
    disableNotifications,
    captureAppDetected,
    nagbarDismissed,
  );
}

@Riverpod(keepAlive: true)
class StreamerMode extends _$StreamerMode {
  Timer? _pollTimer;
  bool _pollInFlight = false;

  @override
  StreamerModeState build() {
    ref.onDispose(() => _pollTimer?.cancel());
    unawaited(_load());
    return const StreamerModeState();
  }

  Future<void> _load() async {
    final SharedPreferences? preferences = await sharedPreferencesOrNull();
    if (preferences == null || !ref.mounted) {
      return;
    }
    state = state.copyWith(
      manualEnabled: preferences.getBool(_kManualEnabledKey) ?? false,
      autoEnable: preferences.getBool(_kAutoEnableKey) ?? true,
      hidePersonalInformation:
          preferences.getBool(_kHidePersonalInformationKey) ?? true,
      hideInviteLinks: preferences.getBool(_kHideInviteLinksKey) ?? true,
      disableSounds: preferences.getBool(_kDisableSoundsKey) ?? true,
      disableNotifications:
          preferences.getBool(_kDisableNotificationsKey) ?? true,
    );
    _updatePolling();
  }

  Future<void> _setBool(String key, bool value) async {
    final SharedPreferences? preferences = await sharedPreferencesOrNull();
    if (preferences == null) {
      return;
    }
    await preferences.setBool(key, value);
  }

  void dismissNagbar() {
    state = state.copyWith(nagbarDismissed: true);
  }

  Future<void> setManualEnabled({required bool value}) async {
    state = state.copyWith(manualEnabled: value, nagbarDismissed: false);
    await _setBool(_kManualEnabledKey, value);
  }

  Future<void> setAutoEnable({required bool value}) async {
    state = state.copyWith(autoEnable: value);
    _updatePolling();
    await _setBool(_kAutoEnableKey, value);
  }

  Future<void> setHidePersonalInformation({required bool value}) async {
    state = state.copyWith(hidePersonalInformation: value);
    await _setBool(_kHidePersonalInformationKey, value);
  }

  Future<void> setHideInviteLinks({required bool value}) async {
    state = state.copyWith(hideInviteLinks: value);
    await _setBool(_kHideInviteLinksKey, value);
  }

  Future<void> setDisableSounds({required bool value}) async {
    state = state.copyWith(disableSounds: value);
    await _setBool(_kDisableSoundsKey, value);
  }

  Future<void> setDisableNotifications({required bool value}) async {
    state = state.copyWith(disableNotifications: value);
    await _setBool(_kDisableNotificationsKey, value);
  }

  Future<void> disable() async {
    state = state.copyWith(
      manualEnabled: false,
      autoEnable: false,
      captureAppDetected: false,
    );
    _updatePolling();
    await _setBool(_kManualEnabledKey, false);
    await _setBool(_kAutoEnableKey, false);
  }

  void _updatePolling() {
    if (!state.autoEnable || !streamerModeAutoDetectSupported) {
      _pollTimer?.cancel();
      _pollTimer = null;
      if (state.captureAppDetected) {
        state = state.copyWith(captureAppDetected: false);
      }
      return;
    }
    _pollTimer ??= Timer.periodic(
      _kCaptureAppPollInterval,
      (_) => unawaited(_refreshCaptureApp()),
    );
    unawaited(_refreshCaptureApp());
  }

  Future<void> _refreshCaptureApp() async {
    if (_pollInFlight || !state.autoEnable) {
      return;
    }
    _pollInFlight = true;
    try {
      final bool detected = await detectStreamingCaptureApp();
      if (ref.mounted && detected != state.captureAppDetected) {
        state = state.copyWith(
          captureAppDetected: detected,
          nagbarDismissed: detected ? false : null,
        );
      }
    } on Object {
      return;
    } finally {
      _pollInFlight = false;
    }
  }
}

Future<bool> detectStreamingCaptureApp() async {
  if (Platform.isWindows) {
    return windowsRunningProcessNames().any(_kCaptureProcessNames.contains);
  }
  final ProcessResult result = await Process.run('ps', <String>[
    '-A',
    '-o',
    'comm=',
  ]);
  if (result.exitCode != 0) {
    return false;
  }
  return (result.stdout as String)
      .split('\n')
      .map((String line) => line.trim().split('/').last.toLowerCase())
      .any(_kCaptureProcessNames.contains);
}
