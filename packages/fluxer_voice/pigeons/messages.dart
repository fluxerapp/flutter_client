import 'package:pigeon/pigeon.dart';

@ConfigurePigeon(
  PigeonOptions(
    dartPackageName: 'fluxer_voice',
    dartOut: 'lib/src/messages.g.dart',
    kotlinOut: 'android/src/main/kotlin/com/fluxer/voice/Messages.g.kt',
    kotlinOptions: KotlinOptions(
      package: 'com.fluxer.voice',
      errorClassName: 'FluxerVoiceError',
    ),
    swiftOut: '../../ios/Runner/FluxerVoiceMessages.g.swift',
    swiftOptions: SwiftOptions(errorClassName: 'FluxerVoiceError'),
  ),
)
enum NativeVoiceRoute { speaker, earpiece, headset, bluetooth }

enum NativeVoiceDeviceKind {
  earpiece,
  speaker,
  wired,
  usb,
  bluetooth,
  bluetoothLe,
  hearingAid,
}

class NativeVoiceDevice {
  NativeVoiceDevice({
    required this.id,
    required this.kind,
    required this.active,
    this.name,
  });

  int id;
  NativeVoiceDeviceKind kind;
  String? name;
  bool active;
}

class NativeVoiceSessionState {
  NativeVoiceSessionState({
    required this.type,
    required this.active,
    required this.route,
    required this.routes,
    required this.devices,
    required this.telecom,
    required this.micSilenced,
    this.activeDeviceId,
  });

  String type;
  bool active;
  NativeVoiceRoute route;
  List<NativeVoiceRoute> routes;
  List<NativeVoiceDevice> devices;
  int? activeDeviceId;
  bool telecom;
  bool micSilenced;
}

class NativeVoiceActiveRoute {
  NativeVoiceActiveRoute({required this.route, this.name});

  NativeVoiceRoute route;
  String? name;
}

@HostApi()
abstract class VoiceAudioSessionHostApi {
  @async
  void acquire(String owner);

  @async
  void release(String owner);

  @async
  void setPreferredRoute(
    NativeVoiceRoute route, {
    required bool explicit,
    int? deviceId,
  });

  @async
  void refreshRoute();

  @async
  NativeVoiceSessionState state();

  @async
  String diagnostics();

  @async
  List<NativeVoiceRoute> availableRoutes();

  @async
  List<NativeVoiceDevice> outputDevices();
}

@HostApi()
abstract class VoiceActiveRouteHostApi {
  @async
  NativeVoiceActiveRoute? activeRoute();
}

@HostApi()
abstract class SystemVoiceCallGuardHostApi {
  @async
  bool isExternalCallActive({required bool fluxerOwnsVoice});
}

@EventChannelApi()
abstract class VoiceAudioSessionEventApi {
  NativeVoiceSessionState voiceSessionStates();

  NativeVoiceActiveRoute voiceActiveRouteChanges();
}
