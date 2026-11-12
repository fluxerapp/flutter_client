// LiveKit audio session APIs are marked @experimental.
// ignore_for_file: experimental_member_use

import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/talker.dart';
import 'package:fluxer_app/features/settings/providers/preferences/voice_settings_provider.dart';
import 'package:fluxer_app/features/voice/domain/voice_settings_state.dart';
import 'package:fluxer_voice/fluxer_voice.dart';
import 'package:livekit_client/livekit_client.dart';

final FluxerVoiceAudioSession _voiceAudioSession =
    FluxerVoiceAudioSession.instance;

const List<Duration> _kVoiceRouteLogDelays = <Duration>[
  Duration(milliseconds: 1500),
  Duration(seconds: 10),
];

final List<Timer> _voiceRouteLogTimers = <Timer>[];

const String kVoiceCallAudioOwner = 'voice';
const String kVoiceMicTestAudioOwner = 'mic_test';

bool get _isAndroid => defaultTargetPlatform == TargetPlatform.android;

Future<void> ensureAndroidAppOwnsVoiceAudioSession() async {
  if (!_isAndroid ||
      AudioManager.instance.managementMode ==
          AudioSessionManagementMode.manual) {
    return;
  }
  try {
    await AudioManager.instance.setAudioSessionManagementMode(
      AudioSessionManagementMode.manual,
    );
  } on Object catch (error) {
    talker.warning('[VoiceRoute] LiveKit manual audio mode failed: $error');
  }
}

Future<void> acquireNativeVoiceAudioSession(String owner) async {
  if (!_isAndroid) {
    return;
  }
  try {
    await _voiceAudioSession.acquire(owner);
  } on Object catch (error) {
    talker.warning('[VoiceRoute] acquire $owner failed: $error');
  }
}

Future<void> releaseNativeVoiceAudioSession(String owner) async {
  if (!_isAndroid) {
    return;
  }
  _cancelVoiceRouteLogs();
  try {
    await _voiceAudioSession.release(owner);
  } on Object catch (error) {
    talker.warning('[VoiceRoute] release $owner failed: $error');
  }
}

Future<void> refreshNativeVoiceOutputRoute() async {
  if (!_isAndroid) {
    return;
  }
  try {
    await _voiceAudioSession.refreshRoute();
  } on Object catch (error) {
    talker.warning('[VoiceRoute] refresh failed: $error');
  }
}

Stream<VoiceAudioSessionEvent> nativeVoiceAudioSessionEvents() {
  if (!_isAndroid) {
    return const Stream<VoiceAudioSessionEvent>.empty();
  }
  return _voiceAudioSession.events;
}

Stream<Object?> _voiceOutputRefreshTriggers() {
  if (_isAndroid) {
    return nativeVoiceAudioSessionEvents();
  }
  return Hardware.instance.onDeviceChange.stream;
}

bool showNativeVoiceAudioRoutePicker() {
  return defaultTargetPlatform == TargetPlatform.iOS;
}

Future<void> applyNativeVoiceOutputRoute(
  VoiceOutputRoute route, {
  int? deviceId,
  bool explicit = false,
}) async {
  if (!_isAndroid) {
    return;
  }
  try {
    await _voiceAudioSession.setPreferredRoute(
      route,
      deviceId: deviceId,
      explicit: explicit,
    );
  } on Object {
    return;
  }
  _scheduleVoiceRouteLogs(route);
}

void _cancelVoiceRouteLogs() {
  for (final Timer timer in _voiceRouteLogTimers) {
    timer.cancel();
  }
  _voiceRouteLogTimers.clear();
}

void _scheduleVoiceRouteLogs(VoiceOutputRoute route) {
  _cancelVoiceRouteLogs();
  for (final Duration delay in _kVoiceRouteLogDelays) {
    _voiceRouteLogTimers.add(
      Timer(delay, () => unawaited(_logVoiceRoute(route, delay))),
    );
  }
}

Future<void> _logVoiceRoute(VoiceOutputRoute route, Duration delay) async {
  try {
    final String diagnostics = await _voiceAudioSession.diagnostics();
    talker.info(
      '[VoiceRoute] requested=${route.name} '
      'after=${delay.inMilliseconds}ms $diagnostics',
    );
  } on Object catch (error) {
    talker.warning('[VoiceRoute] diagnostics failed: $error');
  }
}

Future<VoiceActiveOutputRoute?> readNativeActiveVoiceOutputRoute() async {
  if (defaultTargetPlatform != TargetPlatform.iOS) {
    return null;
  }
  try {
    return await _voiceAudioSession.activeRoute();
  } on Object {
    return null;
  }
}

Future<void> syncVoiceSettingsFromNativeRoute({
  required VoiceSettings settingsNotifier,
  required VoiceSettingsState current,
  required VoiceOutputRoute route,
}) async {
  if (current.outputRoute != route) {
    await settingsNotifier.setOutputRoute(route);
  }
  if (current.inputDeviceId != kDefaultVoiceDeviceId) {
    await settingsNotifier.setInputDeviceId(kDefaultVoiceDeviceId);
  }
}

Future<Set<VoiceOutputRoute>> readAvailableVoiceOutputRoutes() async {
  if (!_isAndroid) {
    return kPhoneVoiceOutputRoutes;
  }
  try {
    return await _voiceAudioSession.availableRoutes() ??
        kPhoneVoiceOutputRoutes;
  } on Object {
    return kPhoneVoiceOutputRoutes;
  }
}

Future<List<VoiceOutputDevice>> readVoiceOutputDevices() async {
  if (defaultTargetPlatform != TargetPlatform.android) {
    return const <VoiceOutputDevice>[];
  }
  try {
    return await _voiceAudioSession.outputDevices();
  } on Object {
    return const <VoiceOutputDevice>[];
  }
}

class VoiceIosNativeRouteSync extends Notifier<VoiceActiveOutputRoute?> {
  @override
  VoiceActiveOutputRoute? build() {
    if (defaultTargetPlatform != TargetPlatform.iOS) {
      return null;
    }
    final StreamSubscription<VoiceActiveOutputRoute> subscription =
        _voiceAudioSession.activeRouteChanges.listen((
          VoiceActiveOutputRoute route,
        ) {
          unawaited(_syncFromRouteChange(route));
        });
    ref.onDispose(subscription.cancel);
    unawaited(refresh());
    return null;
  }

  Future<void> refresh() async {
    final VoiceActiveOutputRoute? route =
        await readNativeActiveVoiceOutputRoute();
    if (!ref.mounted || route == null) {
      return;
    }
    state = route;
  }

  Future<void> _syncFromRouteChange(VoiceActiveOutputRoute route) async {
    if (!ref.mounted) {
      return;
    }
    state = route;
    await syncVoiceSettingsFromNativeRoute(
      settingsNotifier: ref.read(voiceSettingsProvider.notifier),
      current: ref.read(voiceSettingsProvider),
      route: route.route,
    );
  }
}

final NotifierProvider<VoiceIosNativeRouteSync, VoiceActiveOutputRoute?>
voiceIosNativeRouteSyncProvider =
    NotifierProvider<VoiceIosNativeRouteSync, VoiceActiveOutputRoute?>(
      VoiceIosNativeRouteSync.new,
    );

class VoiceAvailableOutputRoutes extends Notifier<Set<VoiceOutputRoute>> {
  @override
  Set<VoiceOutputRoute> build() {
    final StreamSubscription<Object?> subscription =
        _voiceOutputRefreshTriggers().listen((_) {
          unawaited(_refresh());
        });
    ref.onDispose(subscription.cancel);
    unawaited(_refresh());
    return kPhoneVoiceOutputRoutes;
  }

  Future<void> _refresh() async {
    final Set<VoiceOutputRoute> routes = await readAvailableVoiceOutputRoutes();
    if (!ref.mounted) {
      return;
    }
    state = routes;
  }
}

final NotifierProvider<VoiceAvailableOutputRoutes, Set<VoiceOutputRoute>>
voiceAvailableOutputRoutesProvider =
    NotifierProvider<VoiceAvailableOutputRoutes, Set<VoiceOutputRoute>>(
      VoiceAvailableOutputRoutes.new,
    );

class VoiceOutputDevices extends Notifier<List<VoiceOutputDevice>> {
  @override
  List<VoiceOutputDevice> build() {
    final StreamSubscription<Object?> subscription =
        _voiceOutputRefreshTriggers().listen((_) {
          unawaited(refresh());
        });
    ref.onDispose(subscription.cancel);
    unawaited(refresh());
    return const <VoiceOutputDevice>[];
  }

  Future<void> refresh() async {
    final List<VoiceOutputDevice> devices = await readVoiceOutputDevices();
    if (!ref.mounted || listEquals(devices, state)) {
      return;
    }
    state = devices;
  }
}

final NotifierProvider<VoiceOutputDevices, List<VoiceOutputDevice>>
voiceOutputDevicesProvider =
    NotifierProvider<VoiceOutputDevices, List<VoiceOutputDevice>>(
      VoiceOutputDevices.new,
    );
