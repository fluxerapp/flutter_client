import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:fluxer_app/core/desktop/windows/windows_process_names.dart';
import 'package:fluxer_app/core/local_settings/local_setting_key.dart';
import 'package:fluxer_app/core/local_settings/local_setting_keys.dart';
import 'package:fluxer_app/core/local_settings/local_settings_store.dart';
import 'package:fluxer_app/core/local_settings/local_settings_store_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'streamer_mode_provider.g.dart';

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
    final LocalSettingsStore store = ref.watch(localSettingsStoreProvider);
    scheduleMicrotask(() {
      if (ref.mounted) {
        _updatePolling();
      }
    });
    return StreamerModeState(
      manualEnabled: store.read(LocalSettingKeys.streamerModeManualEnabled),
      autoEnable: store.read(LocalSettingKeys.streamerModeAutoEnable),
      hidePersonalInformation: store.read(
        LocalSettingKeys.streamerModeHidePersonalInformation,
      ),
      hideInviteLinks: store.read(LocalSettingKeys.streamerModeHideInviteLinks),
      disableSounds: store.read(LocalSettingKeys.streamerModeDisableSounds),
      disableNotifications: store.read(
        LocalSettingKeys.streamerModeDisableNotifications,
      ),
    );
  }

  void _write(DeviceFlag key, {required bool value}) =>
      ref.read(localSettingsStoreProvider).write(key, value);

  void dismissNagbar() {
    state = state.copyWith(nagbarDismissed: true);
  }

  Future<void> setManualEnabled({required bool value}) async {
    state = state.copyWith(manualEnabled: value, nagbarDismissed: false);
    _write(LocalSettingKeys.streamerModeManualEnabled, value: value);
  }

  Future<void> setAutoEnable({required bool value}) async {
    state = state.copyWith(autoEnable: value);
    _updatePolling();
    _write(LocalSettingKeys.streamerModeAutoEnable, value: value);
  }

  Future<void> setHidePersonalInformation({required bool value}) async {
    state = state.copyWith(hidePersonalInformation: value);
    _write(LocalSettingKeys.streamerModeHidePersonalInformation, value: value);
  }

  Future<void> setHideInviteLinks({required bool value}) async {
    state = state.copyWith(hideInviteLinks: value);
    _write(LocalSettingKeys.streamerModeHideInviteLinks, value: value);
  }

  Future<void> setDisableSounds({required bool value}) async {
    state = state.copyWith(disableSounds: value);
    _write(LocalSettingKeys.streamerModeDisableSounds, value: value);
  }

  Future<void> setDisableNotifications({required bool value}) async {
    state = state.copyWith(disableNotifications: value);
    _write(LocalSettingKeys.streamerModeDisableNotifications, value: value);
  }

  Future<void> disable() async {
    state = state.copyWith(
      manualEnabled: false,
      autoEnable: false,
      captureAppDetected: false,
    );
    _updatePolling();
    _write(LocalSettingKeys.streamerModeManualEnabled, value: false);
    _write(LocalSettingKeys.streamerModeAutoEnable, value: false);
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
