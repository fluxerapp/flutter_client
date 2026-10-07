import 'package:fluxer_app/core/permissions/channel_effective_permissions.dart';
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'channel_permission_cache_provider.g.dart';

class ChannelPermissionCaches {
  const ChannelPermissionCaches({
    this.effective = const <String, int>{},
    this.local = const <String, int>{},
  });

  final Map<String, int> effective;
  final Map<String, int> local;

  int? operator [](String channelId) => effective[channelId];

  bool get isEmpty => effective.isEmpty && local.isEmpty;

  bool hasEffectiveBits(String channelId) => effective.containsKey(channelId);
}

/// Precomputed effective and local permission bitfields per guild channel,
/// refreshed from gateway events.
@Riverpod(keepAlive: true)
class ChannelPermissionCache extends _$ChannelPermissionCache {
  @override
  ChannelPermissionCaches build() => const ChannelPermissionCaches();

  /// Cached effective bits for [channelId], or `null` when not resolved yet.
  int? getChannelBits(String channelId) => state.effective[channelId];

  /// Cached channel-local bits for [channelId], or `null` when not resolved yet.
  int? getLocalChannelBits(String channelId) => state.local[channelId];

  Future<void> rebuildChannel(
    String channelId, {
    bool localOnly = false,
  }) async {
    if (channelId.isEmpty) {
      return;
    }
    final ChannelPermissionBitsOutcome outcome = localOnly
        ? await computeChannelLocalGuildChannelPermissionBitsOutcome(
            ref: ref,
            channelId: channelId,
          )
        : await computeEffectiveGuildChannelPermissionBitsOutcome(
            ref: ref,
            channelId: channelId,
          );
    if (!ref.mounted) {
      return;
    }
    if (localOnly) {
      _setLocalBits(channelId: channelId, outcome: outcome);
      return;
    }
    _setEffectiveBits(channelId: channelId, outcome: outcome);
  }

  Future<void> rebuildGuild(String guildId) async {
    if (guildId.isEmpty) {
      return;
    }
    final db = ref.read(fluxerDatabaseProvider);
    final channels = await db.channelDao.getChannels(
      guildId,
      includeThreads: true,
    );
    if (!ref.mounted) {
      return;
    }
    for (final channel in channels) {
      await rebuildChannel(channel.id);
    }
  }

  Future<void> rebuildAfterReady({String? priorityGuildId}) async {
    final db = ref.read(fluxerDatabaseProvider);
    final channels = await db.channelDao.getAllChannels(includeThreads: true);
    if (!ref.mounted) {
      return;
    }

    final Map<String, List<String>> channelIdsByGuild =
        <String, List<String>>{};
    for (final channel in channels) {
      if (channel.guildId.isEmpty) {
        continue;
      }
      channelIdsByGuild
          .putIfAbsent(channel.guildId, () => <String>[])
          .add(channel.id);
    }

    final List<String> guildIds = channelIdsByGuild.keys.toList();
    if (priorityGuildId != null &&
        channelIdsByGuild.containsKey(priorityGuildId)) {
      guildIds
        ..remove(priorityGuildId)
        ..insert(0, priorityGuildId);
    }

    var priorityRemaining = priorityGuildId == null
        ? 0
        : (channelIdsByGuild[priorityGuildId]?.length ?? 0);
    for (final String guildId in guildIds) {
      for (final String channelId in channelIdsByGuild[guildId]!) {
        if (!ref.mounted) {
          return;
        }
        await rebuildChannel(channelId);
        if (priorityRemaining > 0) {
          priorityRemaining--;
          await Future<void>.delayed(Duration.zero);
        } else {
          // Pure prefetch (misses rebuild on demand); pacing keeps the reads
          // from starving the first channel switch racing this loop.
          await Future<void>.delayed(const Duration(milliseconds: 15));
        }
      }
    }
  }

  Future<void> evictGuild(String guildId) async {
    if (guildId.isEmpty || state.isEmpty) {
      return;
    }
    final db = ref.read(fluxerDatabaseProvider);
    final channels = await db.channelDao.getChannels(
      guildId,
      includeThreads: true,
    );
    if (!ref.mounted) {
      return;
    }
    final Map<String, int> nextEffective = Map<String, int>.from(
      state.effective,
    );
    final Map<String, int> nextLocal = Map<String, int>.from(state.local);
    for (final channel in channels) {
      nextEffective.remove(channel.id);
      nextLocal.remove(channel.id);
    }
    state = ChannelPermissionCaches(effective: nextEffective, local: nextLocal);
  }

  void clearAll() {
    if (state.isEmpty) {
      return;
    }
    state = const ChannelPermissionCaches();
  }

  void cacheEffectiveBits({
    required String channelId,
    required ChannelPermissionBitsOutcome outcome,
  }) {
    _setEffectiveBits(channelId: channelId, outcome: outcome);
  }

  void _setEffectiveBits({
    required String channelId,
    required ChannelPermissionBitsOutcome outcome,
  }) {
    if (!outcome.shouldCache) {
      if (!state.effective.containsKey(channelId)) {
        return;
      }
      final Map<String, int> nextEffective = Map<String, int>.from(
        state.effective,
      )..remove(channelId);
      state = ChannelPermissionCaches(
        effective: nextEffective,
        local: state.local,
      );
      return;
    }
    final Map<String, int> nextEffective = Map<String, int>.from(
      state.effective,
    );
    nextEffective[channelId] = outcome.value;
    state = ChannelPermissionCaches(
      effective: nextEffective,
      local: state.local,
    );
  }

  void _setLocalBits({
    required String channelId,
    required ChannelPermissionBitsOutcome outcome,
  }) {
    if (!outcome.shouldCache) {
      if (!state.local.containsKey(channelId)) {
        return;
      }
      final Map<String, int> nextLocal = Map<String, int>.from(state.local)
        ..remove(channelId);
      state = ChannelPermissionCaches(
        effective: state.effective,
        local: nextLocal,
      );
      return;
    }
    final Map<String, int> nextLocal = Map<String, int>.from(state.local);
    nextLocal[channelId] = outcome.value;
    state = ChannelPermissionCaches(
      effective: state.effective,
      local: nextLocal,
    );
  }
}
