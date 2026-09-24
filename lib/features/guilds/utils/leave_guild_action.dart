import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/api/fluxer_client_provider.dart';
import 'package:fluxer_app/core/permissions/channel_permission_cache_provider.dart';
import 'package:fluxer_app/core/providers/instance_runtime_config_provider.dart';
import 'package:fluxer_app/core/talker.dart';
import 'package:fluxer_app/features/guilds/data/guild_repository.dart';
import 'package:fluxer_app/features/guilds/providers/guild_permissions_provider.dart';
import 'package:fluxer_app/features/guilds/providers/guild_providers.dart';
import 'package:fluxer_dart/export.dart';

Future<void> leaveGuildAndCleanup(WidgetRef ref, String guildId) async {
  if (ref.read(instanceRuntimeConfigProvider).isStockCommunityGuild(guildId)) {
    talker.info('[Guild] Leave skipped for stock community guild');
    return;
  }
  final client = ref.read(fluxerClientProvider);
  final guildRepository = ref.read(guildRepositoryProvider);
  final guildPermissions = ref.read(guildPermissionsProvider.notifier);
  final channelPermissionCache = ref.read(
    channelPermissionCacheProvider.notifier,
  );

  await client.guilds.leaveGuild(
    guildId: guildId,
    body: const SudoVerificationSchema(),
  );
  await _removeGuildLocallyAndEvict(
    guildId: guildId,
    guildRepository: guildRepository,
    guildPermissions: guildPermissions,
    channelPermissionCache: channelPermissionCache,
  );
}

Future<void> deleteGuildAndCleanup(WidgetRef ref, String guildId) async {
  if (ref.read(instanceRuntimeConfigProvider).isStockCommunityGuild(guildId)) {
    talker.info('[Guild] Delete skipped for stock community guild');
    return;
  }
  final client = ref.read(fluxerClientProvider);
  final guildRepository = ref.read(guildRepositoryProvider);
  final guildPermissions = ref.read(guildPermissionsProvider.notifier);
  final channelPermissionCache = ref.read(
    channelPermissionCacheProvider.notifier,
  );

  await client.guilds.deleteGuild(
    guildId: guildId,
    body: const GuildDeleteRequest(),
  );
  await _removeGuildLocallyAndEvict(
    guildId: guildId,
    guildRepository: guildRepository,
    guildPermissions: guildPermissions,
    channelPermissionCache: channelPermissionCache,
  );
}

Future<void> removeGuildLocallyAndEvict(WidgetRef ref, String guildId) async {
  await _removeGuildLocallyAndEvict(
    guildId: guildId,
    guildRepository: ref.read(guildRepositoryProvider),
    guildPermissions: ref.read(guildPermissionsProvider.notifier),
    channelPermissionCache: ref.read(channelPermissionCacheProvider.notifier),
  );
}

Future<void> _removeGuildLocallyAndEvict({
  required String guildId,
  required GuildRepository guildRepository,
  required GuildPermissions guildPermissions,
  required ChannelPermissionCache channelPermissionCache,
}) async {
  await guildRepository.removeGuildLocally(guildId);
  guildPermissions.evict(guildId);
  unawaited(channelPermissionCache.evictGuild(guildId));
}
