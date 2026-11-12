import 'package:flutter/foundation.dart';

import 'package:fluxer_voice/src/messages.g.dart';

enum VoiceOutputRoute { speaker, earpiece, headset, bluetooth }

const Set<VoiceOutputRoute> kPhoneVoiceOutputRoutes = <VoiceOutputRoute>{
  VoiceOutputRoute.speaker,
  VoiceOutputRoute.earpiece,
};

VoiceOutputRoute voiceOutputRouteFromName(String? name) {
  for (final VoiceOutputRoute route in VoiceOutputRoute.values) {
    if (route.name == name) {
      return route;
    }
  }
  return VoiceOutputRoute.speaker;
}

VoiceOutputRoute voiceOutputRouteFromMessage(NativeVoiceRoute route) {
  return switch (route) {
    NativeVoiceRoute.speaker => VoiceOutputRoute.speaker,
    NativeVoiceRoute.earpiece => VoiceOutputRoute.earpiece,
    NativeVoiceRoute.headset => VoiceOutputRoute.headset,
    NativeVoiceRoute.bluetooth => VoiceOutputRoute.bluetooth,
  };
}

extension VoiceOutputRouteMessage on VoiceOutputRoute {
  NativeVoiceRoute toMessage() {
    return switch (this) {
      VoiceOutputRoute.speaker => NativeVoiceRoute.speaker,
      VoiceOutputRoute.earpiece => NativeVoiceRoute.earpiece,
      VoiceOutputRoute.headset => NativeVoiceRoute.headset,
      VoiceOutputRoute.bluetooth => NativeVoiceRoute.bluetooth,
    };
  }
}

VoiceOutputRoute voiceOutputRouteFromSpeakerPreference({
  required bool? preferSpeaker,
}) {
  if (preferSpeaker == false) {
    return VoiceOutputRoute.earpiece;
  }
  return VoiceOutputRoute.speaker;
}

VoiceOutputRoute resolveVoiceOutputRoute({
  required VoiceOutputRoute preference,
  required Set<VoiceOutputRoute> available,
}) {
  if (available.contains(preference)) {
    return preference;
  }
  if (available.contains(VoiceOutputRoute.speaker)) {
    return VoiceOutputRoute.speaker;
  }
  if (available.contains(VoiceOutputRoute.headset)) {
    return VoiceOutputRoute.headset;
  }
  return VoiceOutputRoute.earpiece;
}

VoiceOutputRoute resolveVoiceCallOutputRoute({
  required VoiceOutputRoute preference,
  required VoiceOutputRoute? override,
  required Set<VoiceOutputRoute> available,
}) {
  if (override != null && available.contains(override)) {
    return override;
  }
  if (available.contains(VoiceOutputRoute.bluetooth)) {
    return VoiceOutputRoute.bluetooth;
  }
  if (available.contains(VoiceOutputRoute.headset)) {
    return VoiceOutputRoute.headset;
  }
  if (isBuiltInVoiceOutputRoute(preference) && available.contains(preference)) {
    return preference;
  }
  if (available.contains(VoiceOutputRoute.speaker)) {
    return VoiceOutputRoute.speaker;
  }
  return VoiceOutputRoute.earpiece;
}

bool isBuiltInVoiceOutputRoute(VoiceOutputRoute route) {
  return route == VoiceOutputRoute.speaker ||
      route == VoiceOutputRoute.earpiece;
}

bool didConnectExternalVoiceOutputRoute({
  required Set<VoiceOutputRoute>? previous,
  required Set<VoiceOutputRoute> current,
}) {
  if (previous == null) {
    return false;
  }
  return current.any(
    (VoiceOutputRoute route) =>
        !isBuiltInVoiceOutputRoute(route) && !previous.contains(route),
  );
}

bool liveKitPrefersSpeaker(VoiceOutputRoute route) {
  return route == VoiceOutputRoute.speaker;
}

enum VoiceOutputDeviceKind {
  earpiece(VoiceOutputRoute.earpiece),
  speaker(VoiceOutputRoute.speaker),
  wired(VoiceOutputRoute.headset),
  usb(VoiceOutputRoute.headset),
  bluetooth(VoiceOutputRoute.bluetooth),
  bluetoothLe(VoiceOutputRoute.bluetooth),
  hearingAid(VoiceOutputRoute.bluetooth);

  const VoiceOutputDeviceKind(this.route);

  final VoiceOutputRoute route;

  static VoiceOutputDeviceKind forRoute(VoiceOutputRoute route) {
    switch (route) {
      case VoiceOutputRoute.speaker:
        return VoiceOutputDeviceKind.speaker;
      case VoiceOutputRoute.earpiece:
        return VoiceOutputDeviceKind.earpiece;
      case VoiceOutputRoute.headset:
        return VoiceOutputDeviceKind.wired;
      case VoiceOutputRoute.bluetooth:
        return VoiceOutputDeviceKind.bluetooth;
    }
  }

  static VoiceOutputDeviceKind fromMessage(NativeVoiceDeviceKind kind) {
    return switch (kind) {
      NativeVoiceDeviceKind.earpiece => VoiceOutputDeviceKind.earpiece,
      NativeVoiceDeviceKind.speaker => VoiceOutputDeviceKind.speaker,
      NativeVoiceDeviceKind.wired => VoiceOutputDeviceKind.wired,
      NativeVoiceDeviceKind.usb => VoiceOutputDeviceKind.usb,
      NativeVoiceDeviceKind.bluetooth => VoiceOutputDeviceKind.bluetooth,
      NativeVoiceDeviceKind.bluetoothLe => VoiceOutputDeviceKind.bluetoothLe,
      NativeVoiceDeviceKind.hearingAid => VoiceOutputDeviceKind.hearingAid,
    };
  }
}

@immutable
class VoiceOutputDevice {
  const VoiceOutputDevice({
    required this.kind,
    this.id,
    this.name,
    this.active = false,
  });

  factory VoiceOutputDevice.fromMessage(NativeVoiceDevice device) {
    final String? name = device.name;
    return VoiceOutputDevice(
      kind: VoiceOutputDeviceKind.fromMessage(device.kind),
      id: device.id,
      name: name != null && name.isNotEmpty ? name : null,
      active: device.active,
    );
  }

  final VoiceOutputDeviceKind kind;
  final int? id;
  final String? name;
  final bool active;

  VoiceOutputRoute get route => kind.route;

  @override
  bool operator ==(Object other) =>
      other is VoiceOutputDevice &&
      other.kind == kind &&
      other.id == id &&
      other.name == name &&
      other.active == active;

  @override
  int get hashCode => Object.hash(kind, id, name, active);
}

List<VoiceOutputDevice> voiceOutputDeviceOptions({
  required List<VoiceOutputDevice> devices,
  required Set<VoiceOutputRoute> available,
}) {
  final List<VoiceOutputDevice> options = devices
      .where((VoiceOutputDevice device) => available.contains(device.route))
      .toList();
  for (final VoiceOutputRoute route in available) {
    if (!options.any((VoiceOutputDevice device) => device.route == route)) {
      options.add(
        VoiceOutputDevice(kind: VoiceOutputDeviceKind.forRoute(route)),
      );
    }
  }
  options.sort(
    (VoiceOutputDevice a, VoiceOutputDevice b) =>
        a.kind.index.compareTo(b.kind.index),
  );
  return options;
}

VoiceOutputDevice? selectedVoiceOutputDevice({
  required List<VoiceOutputDevice> options,
  required VoiceOutputRoute route,
  required int? overrideDeviceId,
}) {
  final List<VoiceOutputDevice> candidates = options
      .where((VoiceOutputDevice device) => device.route == route)
      .toList();
  return candidates
          .where(
            (VoiceOutputDevice device) =>
                overrideDeviceId != null && device.id == overrideDeviceId,
          )
          .firstOrNull ??
      candidates
          .where((VoiceOutputDevice device) => device.active)
          .firstOrNull ??
      candidates.firstOrNull;
}

Set<int> voiceOutputDeviceIds(List<VoiceOutputDevice> devices) {
  return <int>{for (final VoiceOutputDevice device in devices) ?device.id};
}

VoiceOutputDevice? newlyConnectedExternalVoiceOutputDevice({
  required Set<int>? previousIds,
  required List<VoiceOutputDevice> devices,
}) {
  if (previousIds == null) {
    return null;
  }
  return devices
      .where(
        (VoiceOutputDevice device) =>
            !isBuiltInVoiceOutputRoute(device.route) &&
            device.id != null &&
            !previousIds.contains(device.id),
      )
      .firstOrNull;
}

bool isVoiceOutputOverrideGone({
  required VoiceOutputRoute? overrideRoute,
  required int? overrideDeviceId,
  required Set<VoiceOutputRoute> routes,
  required List<VoiceOutputDevice> devices,
}) {
  if (overrideRoute == null) {
    return false;
  }
  if (!routes.contains(overrideRoute)) {
    return true;
  }
  if (overrideDeviceId == null || devices.isEmpty) {
    return false;
  }
  return !devices.any(
    (VoiceOutputDevice device) => device.id == overrideDeviceId,
  );
}

bool isExplicitVoiceOutputRoute({
  required VoiceOutputRoute route,
  required VoiceOutputRoute preference,
  required VoiceOutputRoute? override,
}) {
  if (override != null) {
    return override == route;
  }
  return isBuiltInVoiceOutputRoute(route) && route == preference;
}
