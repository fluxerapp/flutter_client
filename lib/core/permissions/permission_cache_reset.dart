import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/permissions/channel_effective_permissions.dart';
import 'package:fluxer_app/core/permissions/channel_permission_cache_provider.dart';
import 'package:fluxer_app/core/providers/app/account_user_id.dart';
import 'package:fluxer_app/features/guilds/providers/guild_permissions_provider.dart';

void clearAllPermissionCaches(Ref ref) {
  ref
      .read(guildPermissionsProvider(readAccountUserId(ref)).notifier)
      .clearAll();
  ref
      .read(channelPermissionCacheProvider(readAccountUserId(ref)).notifier)
      .clearAll();
  ref
    ..invalidate(effectiveGuildChannelPermissionBitsProvider)
    ..invalidate(channelLocalGuildChannelPermissionBitsProvider);
}
