import 'package:flutter/foundation.dart';

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
}

@immutable
class VoiceOutputDevice {
  const VoiceOutputDevice({
    required this.kind,
    this.id,
    this.name,
    this.active = false,
  });

  final VoiceOutputDeviceKind kind;
  final int? id;
  final String? name;
  final bool active;

  VoiceOutputRoute get route => kind.route;

  static VoiceOutputDevice? fromNative(Object? value) {
    if (value is! Map) {
      return null;
    }
    final Object? kindName = value['kind'];
    final VoiceOutputDeviceKind? kind = VoiceOutputDeviceKind.values
        .where((VoiceOutputDeviceKind kind) => kind.name == kindName)
        .firstOrNull;
    if (kind == null) {
      return null;
    }
    final Object? id = value['id'];
    final Object? name = value['name'];
    return VoiceOutputDevice(
      kind: kind,
      id: id is int ? id : null,
      name: name is String && name.isNotEmpty ? name : null,
      active: value['active'] == true,
    );
  }

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
