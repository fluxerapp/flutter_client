import 'package:flutter/foundation.dart';
import 'package:fluxer_app/core/permissions/permission.dart';

@immutable
class VoiceChannelPermissions {
  const VoiceChannelPermissions({
    required this.canSpeak,
    required this.canStream,
    required this.canUseVideo,
    required this.canConnect,
    required this.canPrioritySpeaker,
  });

  final bool canSpeak;
  final bool canStream;
  final bool canUseVideo;
  final bool canConnect;
  final bool canPrioritySpeaker;

  @override
  bool operator ==(Object other) {
    return other is VoiceChannelPermissions &&
        canSpeak == other.canSpeak &&
        canStream == other.canStream &&
        canUseVideo == other.canUseVideo &&
        canConnect == other.canConnect &&
        canPrioritySpeaker == other.canPrioritySpeaker;
  }

  @override
  int get hashCode => Object.hash(
    canSpeak,
    canStream,
    canUseVideo,
    canConnect,
    canPrioritySpeaker,
  );
}

const VoiceChannelPermissions kDefaultVoiceChannelPermissions =
    VoiceChannelPermissions(
      canSpeak: true,
      canStream: true,
      canUseVideo: true,
      canConnect: true,
      canPrioritySpeaker: false,
    );

VoiceChannelPermissions resolveVoiceChannelPermissions(int permissionBits) {
  return VoiceChannelPermissions(
    canSpeak: hasPermission(permissionBits, Permission.speak),
    canStream: hasPermission(permissionBits, Permission.stream),
    canUseVideo: hasPermission(permissionBits, Permission.stream),
    canConnect: hasPermission(permissionBits, Permission.connect),
    canPrioritySpeaker: hasPermission(
      permissionBits,
      Permission.prioritySpeaker,
    ),
  );
}

VoiceChannelPermissions? resolveVoiceChannelPermissionsForChannel({
  required String? channelId,
  required int? permissionBits,
}) {
  if (channelId == null || channelId.isEmpty || permissionBits == null) {
    return null;
  }
  return resolveVoiceChannelPermissions(permissionBits);
}
