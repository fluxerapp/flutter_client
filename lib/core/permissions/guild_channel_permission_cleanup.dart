import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/permissions/channel_effective_permissions.dart';
import 'package:fluxer_app/core/permissions/channel_permission_cache_provider.dart';
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/features/channels/providers/channel_sidebar_icon_connect_bits_provider.dart';

Future<void> evictInactiveGuildPermissionState(
  ProviderContainer container,
  String guildId,
) async {
  if (guildId.isEmpty) {
    return;
  }
  final db = container.read(fluxerDatabaseProvider);
  final channels = await db.channelDao.getChannels(guildId);
  await container
      .read(channelPermissionCacheProvider.notifier)
      .evictGuild(guildId);
  for (final channel in channels) {
    container
      ..invalidate(effectiveGuildChannelPermissionBitsProvider(channel.id))
      ..invalidate(channelLocalGuildChannelPermissionBitsProvider(channel.id))
      ..invalidate(channelSidebarIconConnectBitsProvider(channel.id));
  }
}
