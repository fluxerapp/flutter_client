import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/permissions/channel_permission_cache_provider.dart';
import 'package:fluxer_app/features/voice/utils/voice_channel_permissions.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'voice_channel_permissions_provider.g.dart';

@Riverpod(keepAlive: true)
VoiceChannelPermissions? voiceChannelPermissions(Ref ref, String channelId) {
  if (channelId.isEmpty) {
    return null;
  }
  final int? bits = ref.watch(
    channelPermissionCacheProvider.select(
      (ChannelPermissionCaches caches) => caches[channelId],
    ),
  );
  return resolveVoiceChannelPermissionsForChannel(
    channelId: channelId,
    permissionBits: bits,
  );
}
