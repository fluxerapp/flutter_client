import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/permissions/channel_effective_permissions.dart';
import 'package:fluxer_app/core/permissions/channel_permission_cache_provider.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/features/guilds/domain/guild.dart';
import 'package:fluxer_app/features/guilds/providers/guild_providers.dart';
import 'package:fluxer_app/features/members/utils/member_list_access.dart';

MemberListAccess watchMemberListAccess(
  WidgetRef ref, {
  required String guildId,
  required String channelId,
}) {
  return _resolveMemberListAccess(
    ref,
    guildId: guildId,
    channelId: channelId,
    watch: true,
  );
}

MemberListAccess readMemberListAccess(
  WidgetRef ref, {
  required String guildId,
  required String channelId,
}) {
  return _resolveMemberListAccess(
    ref,
    guildId: guildId,
    channelId: channelId,
    watch: false,
  );
}

MemberListAccess _resolveMemberListAccess(
  WidgetRef ref, {
  required String guildId,
  required String channelId,
  required bool watch,
}) {
  if (watch) {
    ref.watch(effectiveGuildChannelPermissionBitsProvider(channelId));
  }
  final String? currentUserId = watch
      ? ref.watch(currentUserIdProvider)
      : ref.read(currentUserIdProvider);
  final int? permissionBits = watch
      ? ref.watch(
          channelPermissionCacheProvider.select(
            (ChannelPermissionCaches cache) => cache[channelId],
          ),
        )
      : ref.read(
          channelPermissionCacheProvider.select(
            (ChannelPermissionCaches cache) => cache[channelId],
          ),
        );
  final bool permissionBitsResolved = watch
      ? ref.watch(
          channelPermissionCacheProvider.select(
            (ChannelPermissionCaches cache) =>
                cache.hasEffectiveBits(channelId),
          ),
        )
      : ref.read(
          channelPermissionCacheProvider.select(
            (ChannelPermissionCaches cache) =>
                cache.hasEffectiveBits(channelId),
          ),
        );
  final Guild? guild = watch
      ? ref.watch(guildByIdProvider(guildId)).asData?.value
      : ref.read(guildByIdProvider(guildId)).asData?.value;
  return resolveMemberListAccess(
    currentUserId: currentUserId,
    permissionBits: permissionBits,
    permissionBitsResolved: permissionBitsResolved,
    guild: guild,
  );
}
