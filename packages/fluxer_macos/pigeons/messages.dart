// ignore_for_file: document_ignores

import 'package:pigeon/pigeon.dart';

@ConfigurePigeon(
  PigeonOptions(
    dartPackageName: 'fluxer_macos',
    dartOut: 'lib/src/messages.g.dart',
    swiftOut: 'macos/fluxer_macos/Sources/fluxer_macos/Messages.g.swift',
    swiftOptions: SwiftOptions(errorClassName: 'FluxerMacosError'),
  ),
)
enum MacPermissionKind { microphone, camera, screen, inputMonitoring }

enum MacPermissionStatus { granted, denied, notDetermined, unsupported }

enum MacPrivacyPane { microphone, camera, screen, inputMonitoring, photos }

enum MacInputHookStartResult { ok, permission, startFailed }

enum MacInputEventType { keyDown, keyUp, mouseDown, mouseUp }

class MacInputEvent {
  MacInputEvent({
    required this.type,
    required this.keycode,
    required this.button,
    required this.ctrl,
    required this.alt,
    required this.shift,
    required this.meta,
  });

  MacInputEventType type;
  int keycode;
  int button;
  bool ctrl;
  bool alt;
  bool shift;
  bool meta;
}

@HostApi()
abstract class MacPermissionsHostApi {
  @async
  MacPermissionStatus status(MacPermissionKind kind, bool liveProbe);

  @async
  MacPermissionStatus request(MacPermissionKind kind);

  void openSettings(MacPrivacyPane pane);
}

@HostApi()
abstract class MacInputHookHostApi {
  @async
  MacInputHookStartResult start();

  @async
  void stop();

  void setFilter(List<int> keycodes, List<int> buttons, bool modifiers);
}

@FlutterApi()
abstract class MacInputHookFlutterApi {
  void onEvent(MacInputEvent event);

  void onReleaseAll();
}
