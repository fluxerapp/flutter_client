import 'package:fluxer_app/core/permissions/channel_permission_cache_provider.dart';
import 'package:riverpod/riverpod.dart';

/// Resolves effective guild channel permission bits using the keepAlive cache.
///
/// Safe for async call sites that outlive widget-scoped providers.
Future<int> readEffectiveGuildChannelPermissionBits({
  required ProviderContainer container,
  required String channelId,
}) async {
  if (channelId.isEmpty) {
    return 0;
  }
  final ChannelPermissionCache cache = container.read(
    channelPermissionCacheProvider.notifier,
  );
  final int? cached = cache.getChannelBits(channelId);
  if (cached != null) {
    return cached;
  }
  await cache.rebuildChannel(channelId);
  return cache.getChannelBits(channelId) ?? 0;
}

/// Resolves channel-local permission bits (no parent category layers).
///
/// Safe for async call sites that outlive widget-scoped providers.
Future<int> readLocalGuildChannelPermissionBits({
  required ProviderContainer container,
  required String channelId,
}) async {
  if (channelId.isEmpty) {
    return 0;
  }
  final ChannelPermissionCache cache = container.read(
    channelPermissionCacheProvider.notifier,
  );
  final int? cached = cache.getLocalChannelBits(channelId);
  if (cached != null) {
    return cached;
  }
  await cache.rebuildChannel(channelId, localOnly: true);
  final int? local = cache.getLocalChannelBits(channelId);
  if (local != null) {
    return local;
  }
  return readEffectiveGuildChannelPermissionBits(
    container: container,
    channelId: channelId,
  );
}

/// Same as [readEffectiveGuildChannelPermissionBits] for notifier [Ref] call sites.
Future<int> readEffectiveGuildChannelPermissionBitsRef({
  required Ref ref,
  required String channelId,
}) {
  if (!ref.mounted) {
    return Future<int>.value(0);
  }
  return readEffectiveGuildChannelPermissionBits(
    container: ref.container,
    channelId: channelId,
  );
}

/// Same as [readLocalGuildChannelPermissionBits] for notifier [Ref] call sites.
Future<int> readLocalGuildChannelPermissionBitsRef({
  required Ref ref,
  required String channelId,
}) {
  if (!ref.mounted) {
    return Future<int>.value(0);
  }
  return readLocalGuildChannelPermissionBits(
    container: ref.container,
    channelId: channelId,
  );
}
