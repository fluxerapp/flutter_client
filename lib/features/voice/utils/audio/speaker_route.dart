import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/talker.dart';
import 'package:fluxer_app/features/settings/providers/preferences/voice_settings_provider.dart';
import 'package:fluxer_app/features/voice/domain/voice_output_route.dart';
import 'package:fluxer_app/features/voice/domain/voice_settings_state.dart';
import 'package:livekit_client/livekit_client.dart';

const MethodChannel _voiceSpeakerRouteChannel = MethodChannel(
  'fluxer_app/voice_speaker_route',
);

const EventChannel _voiceSpeakerRouteEventsChannel = EventChannel(
  'fluxer_app/voice_speaker_route_events',
);

const List<Duration> _kVoiceRouteLogDelays = <Duration>[
  Duration(milliseconds: 1500),
  Duration(seconds: 10),
];

final List<Timer> _voiceRouteLogTimers = <Timer>[];

bool showNativeVoiceAudioRoutePicker() {
  return defaultTargetPlatform == TargetPlatform.iOS;
}

Future<void> applyNativeVoiceOutputRoute(
  VoiceOutputRoute route, {
  bool hold = false,
}) async {
  if (defaultTargetPlatform != TargetPlatform.android &&
      defaultTargetPlatform != TargetPlatform.iOS) {
    return;
  }
  try {
    await _voiceSpeakerRouteChannel.invokeMethod<void>(
      'setRoute',
      <String, Object>{'route': route.name, 'hold': hold},
    );
  } on Object {
    return;
  }
  if (hold && defaultTargetPlatform == TargetPlatform.android) {
    _scheduleVoiceRouteLogs(route);
  }
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
    final String? diagnostics = await _voiceSpeakerRouteChannel
        .invokeMethod<String>('routeDiagnostics');
    talker.info(
      '[VoiceRoute] requested=${route.name} '
      'after=${delay.inMilliseconds}ms $diagnostics',
    );
  } on Object catch (error) {
    talker.warning('[VoiceRoute] diagnostics failed: $error');
  }
}

Future<void> clearNativeVoiceOutputRouteHold() async {
  if (defaultTargetPlatform != TargetPlatform.android) {
    return;
  }
  _cancelVoiceRouteLogs();
  try {
    await _voiceSpeakerRouteChannel.invokeMethod<void>('clearRouteHold');
  } on Object {
    return;
  }
}

@immutable
class VoiceActiveOutputRoute {
  const VoiceActiveOutputRoute(this.route, {this.deviceName});

  final VoiceOutputRoute route;
  final String? deviceName;

  @override
  bool operator ==(Object other) =>
      other is VoiceActiveOutputRoute &&
      other.route == route &&
      other.deviceName == deviceName;

  @override
  int get hashCode => Object.hash(route, deviceName);
}

VoiceActiveOutputRoute? voiceActiveOutputRouteFromNative(Object? value) {
  if (value is! Map) {
    return null;
  }
  final Object? route = value['route'];
  if (route is! String || route.isEmpty) {
    return null;
  }
  final Object? name = value['name'];
  return VoiceActiveOutputRoute(
    voiceOutputRouteFromName(route),
    deviceName: name is String && name.isNotEmpty ? name : null,
  );
}

Future<VoiceActiveOutputRoute?> readNativeActiveVoiceOutputRoute() async {
  if (defaultTargetPlatform != TargetPlatform.iOS) {
    return null;
  }
  try {
    return voiceActiveOutputRouteFromNative(
      await _voiceSpeakerRouteChannel.invokeMethod<Object?>('activeRoute'),
    );
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
  if (defaultTargetPlatform != TargetPlatform.android &&
      defaultTargetPlatform != TargetPlatform.iOS) {
    return kPhoneVoiceOutputRoutes;
  }
  try {
    final List<Object?>? names = await _voiceSpeakerRouteChannel
        .invokeMethod<List<Object?>>('availableRoutes');
    if (names == null || names.isEmpty) {
      return kPhoneVoiceOutputRoutes;
    }
    return names
        .map((Object? name) => voiceOutputRouteFromName('$name'))
        .toSet();
  } on Object {
    return kPhoneVoiceOutputRoutes;
  }
}

class VoiceIosNativeRouteSync extends Notifier<VoiceActiveOutputRoute?> {
  @override
  VoiceActiveOutputRoute? build() {
    if (defaultTargetPlatform != TargetPlatform.iOS) {
      return null;
    }
    final StreamSubscription<dynamic> subscription =
        _voiceSpeakerRouteEventsChannel.receiveBroadcastStream().listen((
          dynamic event,
        ) {
          final VoiceActiveOutputRoute? route =
              voiceActiveOutputRouteFromNative(event);
          if (route != null) {
            unawaited(_syncFromRouteChange(route));
          }
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
    final StreamSubscription<List<MediaDevice>> subscription = Hardware
        .instance
        .onDeviceChange
        .stream
        .listen((_) {
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
