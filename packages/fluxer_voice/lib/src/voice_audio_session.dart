import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'package:fluxer_voice/src/voice_output_route.dart';

class FluxerVoiceAudioSession {
  FluxerVoiceAudioSession._();

  static final FluxerVoiceAudioSession instance = FluxerVoiceAudioSession._();

  static const MethodChannel methodChannel = MethodChannel(
    'fluxer_app/voice_speaker_route',
  );

  static const EventChannel eventChannel = EventChannel(
    'fluxer_app/voice_speaker_route_events',
  );

  Stream<dynamic> get rawEvents => eventChannel.receiveBroadcastStream();

  Stream<VoiceAudioSessionEvent> get events => rawEvents
      .map(VoiceAudioSessionEvent.fromNative)
      .where((VoiceAudioSessionEvent? event) => event != null)
      .cast<VoiceAudioSessionEvent>();

  final Set<String> _owners = <String>{};

  bool get isActive => _owners.isNotEmpty;

  Set<String> get owners => Set<String>.unmodifiable(_owners);

  Future<void> acquire(String owner) {
    _owners.add(owner);
    return methodChannel.invokeMethod<void>('acquire', <String, Object>{
      'owner': owner,
    });
  }

  Future<void> release(String owner) {
    _owners.remove(owner);
    return methodChannel.invokeMethod<void>('release', <String, Object>{
      'owner': owner,
    });
  }

  Future<void> setPreferredRoute(
    VoiceOutputRoute route, {
    int? deviceId,
    bool explicit = false,
  }) {
    return methodChannel.invokeMethod<void>(
      'setPreferredRoute',
      <String, Object>{
        'route': route.name,
        'deviceId': ?deviceId,
        'explicit': explicit,
      },
    );
  }

  Future<void> refreshRoute() {
    return methodChannel.invokeMethod<void>('refreshRoute');
  }

  Future<VoiceAudioSessionEvent?> state() async {
    return VoiceAudioSessionEvent.fromNative(
      await methodChannel.invokeMethod<Object?>('state'),
    );
  }

  Future<void> setRoute(
    VoiceOutputRoute route, {
    int? deviceId,
    bool hold = false,
  }) {
    return methodChannel.invokeMethod<void>('setRoute', <String, Object>{
      'route': route.name,
      'hold': hold,
      'deviceId': ?deviceId,
    });
  }

  Future<void> clearRouteHold() {
    return methodChannel.invokeMethod<void>('clearRouteHold');
  }

  Future<String?> diagnostics() {
    return methodChannel.invokeMethod<String>('routeDiagnostics');
  }

  Future<Object?> activeRoute() {
    return methodChannel.invokeMethod<Object?>('activeRoute');
  }

  Future<Set<VoiceOutputRoute>?> availableRoutes() async {
    final List<Object?>? names = await methodChannel
        .invokeMethod<List<Object?>>('availableRoutes');
    if (names == null || names.isEmpty) {
      return null;
    }
    return names
        .map((Object? name) => voiceOutputRouteFromName('$name'))
        .toSet();
  }

  Future<List<VoiceOutputDevice>> outputDevices() async {
    final List<Object?>? devices = await methodChannel
        .invokeMethod<List<Object?>>('outputDevices');
    return <VoiceOutputDevice>[
      for (final Object? value in devices ?? const <Object?>[])
        ?VoiceOutputDevice.fromNative(value),
    ];
  }
}

@immutable
class VoiceAudioSessionEvent {
  const VoiceAudioSessionEvent({
    required this.type,
    required this.active,
    required this.route,
    required this.routes,
    required this.devices,
    this.activeDeviceId,
    this.telecom = false,
    this.micSilenced = false,
  });

  final String type;
  final bool active;
  final VoiceOutputRoute route;
  final Set<VoiceOutputRoute> routes;
  final List<VoiceOutputDevice> devices;
  final int? activeDeviceId;
  final bool telecom;
  final bool micSilenced;

  bool get devicesChanged => type == 'devicesChanged';

  static VoiceAudioSessionEvent? fromNative(Object? value) {
    if (value is! Map) {
      return null;
    }
    final Object? type = value['type'];
    final Object? routes = value['routes'];
    final Object? devices = value['devices'];
    if (type is! String || routes is! List || devices is! List) {
      return null;
    }
    final Object? activeDeviceId = value['activeDeviceId'];
    return VoiceAudioSessionEvent(
      type: type,
      active: value['active'] == true,
      route: voiceOutputRouteFromName('${value['route']}'),
      routes: <VoiceOutputRoute>{
        for (final Object? name in routes) voiceOutputRouteFromName('$name'),
      },
      devices: <VoiceOutputDevice>[
        for (final Object? device in devices)
          ?VoiceOutputDevice.fromNative(device),
      ],
      activeDeviceId: activeDeviceId is int ? activeDeviceId : null,
      telecom: value['telecom'] == true,
      micSilenced: value['micSilenced'] == true,
    );
  }
}
