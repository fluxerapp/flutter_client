import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/api/fluxer_client_provider.dart';
import 'package:fluxer_app/core/permissions/channel_permission_cache_provider.dart';
import 'package:fluxer_app/features/guilds/providers/guild_permissions_provider.dart';
import 'package:fluxer_app/features/guilds/providers/guild_providers.dart';
import 'package:fluxer_dart/export.dart';

Future<void> leaveGuildAndCleanup(WidgetRef ref, String guildId) async {
  await ref.read(fluxerClientProvider).guilds.leaveGuild(
    guildId: guildId,
    body: const SudoVerificationSchema(),
  );
  await ref.read(guildRepositoryProvider).removeGuildLocally(guildId);
  ref.read(guildPermissionsProvider.notifier).evict(guildId);
  unawaited(
    ref.read(channelPermissionCacheProvider.notifier).evictGuild(guildId),
  );
}

Future<void> removeGuildLocallyAndEvict(WidgetRef ref, String guildId) async {
  await ref.read(guildRepositoryProvider).removeGuildLocally(guildId);
  ref.read(guildPermissionsProvider.notifier).evict(guildId);
  unawaited(
    ref.read(channelPermissionCacheProvider.notifier).evictGuild(guildId),
  );
}
