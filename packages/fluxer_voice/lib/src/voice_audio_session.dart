import 'package:flutter/foundation.dart';

import 'package:fluxer_voice/src/messages.g.dart';
import 'package:fluxer_voice/src/voice_output_route.dart';

class FluxerVoiceAudioSession {
  FluxerVoiceAudioSession._();

  static final FluxerVoiceAudioSession instance = FluxerVoiceAudioSession._();

  VoiceAudioSessionHostApi _api = VoiceAudioSessionHostApi();
  VoiceActiveRouteHostApi _activeRouteApi = VoiceActiveRouteHostApi();
  Stream<NativeVoiceSessionState> _sessionStates = voiceSessionStates();
  Stream<NativeVoiceActiveRoute> _activeRouteChanges =
      voiceActiveRouteChanges();

  final Set<String> _owners = <String>{};

  bool get isActive => _owners.isNotEmpty;

  Set<String> get owners => Set<String>.unmodifiable(_owners);

  Stream<VoiceAudioSessionEvent> get events =>
      _sessionStates.map(VoiceAudioSessionEvent.fromMessage);

  Stream<VoiceActiveOutputRoute> get activeRouteChanges =>
      _activeRouteChanges.map(VoiceActiveOutputRoute.fromMessage);

  @visibleForTesting
  void debugOverridePlatform({
    VoiceAudioSessionHostApi? api,
    VoiceActiveRouteHostApi? activeRouteApi,
    Stream<NativeVoiceSessionState>? sessionStates,
    Stream<NativeVoiceActiveRoute>? activeRouteChanges,
  }) {
    _api = api ?? VoiceAudioSessionHostApi();
    _activeRouteApi = activeRouteApi ?? VoiceActiveRouteHostApi();
    _sessionStates = sessionStates ?? voiceSessionStates();
    _activeRouteChanges = activeRouteChanges ?? voiceActiveRouteChanges();
  }

  @visibleForTesting
  void debugReset() {
    _owners.clear();
    debugOverridePlatform();
  }

  Future<void> acquire(String owner) {
    _owners.add(owner);
    return _api.acquire(owner);
  }

  Future<void> release(String owner) {
    _owners.remove(owner);
    return _api.release(owner);
  }

  Future<void> setPreferredRoute(
    VoiceOutputRoute route, {
    int? deviceId,
    bool explicit = false,
  }) {
    return _api.setPreferredRoute(
      route.toMessage(),
      explicit: explicit,
      deviceId: deviceId,
    );
  }

  Future<void> refreshRoute() {
    return _api.refreshRoute();
  }

  Future<VoiceAudioSessionEvent> state() async {
    return VoiceAudioSessionEvent.fromMessage(await _api.state());
  }

  Future<String> diagnostics() {
    return _api.diagnostics();
  }

  Future<VoiceActiveOutputRoute?> activeRoute() async {
    final NativeVoiceActiveRoute? route = await _activeRouteApi.activeRoute();
    return route == null ? null : VoiceActiveOutputRoute.fromMessage(route);
  }

  Future<Set<VoiceOutputRoute>?> availableRoutes() async {
    final List<NativeVoiceRoute> routes = await _api.availableRoutes();
    if (routes.isEmpty) {
      return null;
    }
    return routes.map(voiceOutputRouteFromMessage).toSet();
  }

  Future<List<VoiceOutputDevice>> outputDevices() async {
    final List<NativeVoiceDevice> devices = await _api.outputDevices();
    return devices.map(VoiceOutputDevice.fromMessage).toList();
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

  factory VoiceAudioSessionEvent.fromMessage(NativeVoiceSessionState state) {
    return VoiceAudioSessionEvent(
      type: state.type,
      active: state.active,
      route: voiceOutputRouteFromMessage(state.route),
      routes: state.routes.map(voiceOutputRouteFromMessage).toSet(),
      devices: state.devices.map(VoiceOutputDevice.fromMessage).toList(),
      activeDeviceId: state.activeDeviceId,
      telecom: state.telecom,
      micSilenced: state.micSilenced,
    );
  }

  final String type;
  final bool active;
  final VoiceOutputRoute route;
  final Set<VoiceOutputRoute> routes;
  final List<VoiceOutputDevice> devices;
  final int? activeDeviceId;
  final bool telecom;
  final bool micSilenced;

  bool get devicesChanged => type == 'devicesChanged';
}

@immutable
class VoiceActiveOutputRoute {
  const VoiceActiveOutputRoute(this.route, {this.deviceName});

  factory VoiceActiveOutputRoute.fromMessage(NativeVoiceActiveRoute message) {
    final String? name = message.name;
    return VoiceActiveOutputRoute(
      voiceOutputRouteFromMessage(message.route),
      deviceName: name != null && name.isNotEmpty ? name : null,
    );
  }

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
