import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/features/settings/providers/voice_settings_provider.dart';
import 'package:fluxer_app/features/voice/domain/voice_output_route.dart';
import 'package:fluxer_app/features/voice/domain/voice_settings_state.dart';
import 'package:livekit_client/livekit_client.dart';

const MethodChannel _voiceSpeakerRouteChannel = MethodChannel(
  'fluxer_app/voice_speaker_route',
);

const EventChannel _voiceSpeakerRouteEventsChannel = EventChannel(
  'fluxer_app/voice_speaker_route_events',
);

const Duration _kNativeRouteSyncDebounce = Duration(milliseconds: 200);

const Duration _kNativeRoutePickerFollowUpDelay = Duration(milliseconds: 400);

bool showNativeVoiceAudioRoutePicker() {
  return defaultTargetPlatform == TargetPlatform.iOS;
}

Future<void> applyNativeVoiceOutputRoute(VoiceOutputRoute route) async {
  if (defaultTargetPlatform != TargetPlatform.android &&
      defaultTargetPlatform != TargetPlatform.iOS) {
    return;
  }
  try {
    await _voiceSpeakerRouteChannel.invokeMethod<void>(
      'setRoute',
      <String, Object>{'route': route.name},
    );
  } on Object {
    return;
  }
}

Map<String, double>? voiceRoutePickerAnchorArguments(Rect? anchor) {
  if (anchor == null) {
    return null;
  }
  return <String, double>{
    'x': anchor.left,
    'y': anchor.top,
    'width': anchor.width,
    'height': anchor.height,
  };
}

Future<String?> presentNativeVoiceRoutePicker({Rect? anchor}) async {
  if (defaultTargetPlatform != TargetPlatform.iOS) {
    return null;
  }
  try {
    final Map<String, double>? anchorArgs = voiceRoutePickerAnchorArguments(
      anchor,
    );
    return await _voiceSpeakerRouteChannel.invokeMethod<String>(
      'presentRoutePicker',
      anchorArgs == null ? null : <String, Object>{'anchor': anchorArgs},
    );
  } on Object {
    return null;
  }
}

Future<VoiceOutputRoute?> readNativeActiveVoiceOutputRoute() async {
  if (defaultTargetPlatform != TargetPlatform.iOS) {
    return null;
  }
  try {
    final String? name = await _voiceSpeakerRouteChannel.invokeMethod<String>(
      'activeRoute',
    );
    if (name == null || name.isEmpty) {
      return null;
    }
    return voiceOutputRouteFromName(name);
  } on Object {
    return null;
  }
}

Future<void> syncVoiceSettingsFromNativeRoute({
  required VoiceSettings settingsNotifier,
  required VoiceSettingsState current,
  VoiceOutputRoute? route,
}) async {
  final VoiceOutputRoute? resolved =
      route ?? await readNativeActiveVoiceOutputRoute();
  if (resolved == null) {
    return;
  }
  if (current.outputRoute != resolved) {
    await settingsNotifier.setOutputRoute(resolved);
  }
  if (current.inputDeviceId != kDefaultVoiceDeviceId) {
    await settingsNotifier.setInputDeviceId(kDefaultVoiceDeviceId);
  }
}

Future<void> syncVoiceSettingsAfterNativeRoutePicker({
  required VoiceSettings settingsNotifier,
  required VoiceSettingsState currentBeforePicker,
  String? pickedRouteName,
  VoiceSettingsState Function()? readCurrentState,
}) async {
  if (pickedRouteName != null && pickedRouteName.isNotEmpty) {
    await syncVoiceSettingsFromNativeRoute(
      settingsNotifier: settingsNotifier,
      current: currentBeforePicker,
      route: voiceOutputRouteFromName(pickedRouteName),
    );
    return;
  }
  await syncVoiceSettingsFromNativeRoute(
    settingsNotifier: settingsNotifier,
    current: currentBeforePicker,
  );
  if (readCurrentState == null) {
    return;
  }
  await Future<void>.delayed(_kNativeRoutePickerFollowUpDelay);
  await syncVoiceSettingsFromNativeRoute(
    settingsNotifier: settingsNotifier,
    current: readCurrentState(),
  );
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

class VoiceIosNativeRouteSync extends Notifier<int> {
  Timer? _debounce;

  @override
  int build() {
    if (defaultTargetPlatform != TargetPlatform.iOS) {
      return 0;
    }
    final StreamSubscription<dynamic> subscription =
        _voiceSpeakerRouteEventsChannel.receiveBroadcastStream().listen((
          dynamic event,
        ) {
          final VoiceOutputRoute? route = event is String
              ? voiceOutputRouteFromName(event)
              : null;
          _debounce?.cancel();
          _debounce = Timer(_kNativeRouteSyncDebounce, () {
            if (!ref.mounted) {
              return;
            }
            unawaited(
              syncVoiceSettingsFromNativeRoute(
                settingsNotifier: ref.read(voiceSettingsProvider.notifier),
                current: ref.read(voiceSettingsProvider),
                route: route,
              ),
            );
          });
        });
    ref.onDispose(() {
      _debounce?.cancel();
      unawaited(subscription.cancel());
    });
    return 0;
  }
}

final NotifierProvider<VoiceIosNativeRouteSync, int>
voiceIosNativeRouteSyncProvider =
    NotifierProvider<VoiceIosNativeRouteSync, int>(VoiceIosNativeRouteSync.new);

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
