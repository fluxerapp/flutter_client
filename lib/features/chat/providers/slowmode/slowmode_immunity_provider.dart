import 'package:fluxer_app/core/permissions/channel_effective_permissions.dart';
import 'package:fluxer_app/core/permissions/channel_permission_cache_provider.dart';
import 'package:fluxer_app/core/permissions/permission.dart';
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'slowmode_immunity_provider.g.dart';

@riverpod
Future<bool> isSlowmodeImmune(Ref ref, String channelId) async {
  if (channelId.isEmpty) {
    return false;
  }

  ref.watch(channelPermissionCacheProvider);

  final db = ref.read(fluxerDatabaseProvider);
  final channelRow = await db.channelDao.getChannelById(channelId);
  if (!ref.mounted) {
    return false;
  }
  if (channelRow == null) {
    return false;
  }
  if (channelRow.guildId.isEmpty) {
    return true;
  }

  int? cachedBits = ref
      .read(channelPermissionCacheProvider.notifier)
      .getChannelBits(channelId);
  if (cachedBits == null) {
    await ref
        .read(channelPermissionCacheProvider.notifier)
        .rebuildChannel(channelId);
    cachedBits = ref
        .read(channelPermissionCacheProvider.notifier)
        .getChannelBits(channelId);
  }
  if (cachedBits != null) {
    return bypassesSlowmode(cachedBits);
  }

  final ChannelPermissionBitsOutcome outcome =
      await computeEffectiveGuildChannelPermissionBitsOutcome(
        ref: ref,
        channelId: channelId,
      );
  if (!outcome.shouldCache) {
    return false;
  }
  return bypassesSlowmode(outcome.value);
}
