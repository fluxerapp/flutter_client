import 'package:fluxer_app/core/database/fluxer_database.dart';
import 'package:fluxer_app/core/permissions/channel_effective_permissions.dart';
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
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

@Riverpod(keepAlive: true)
class ChannelPermissionCache extends _$ChannelPermissionCache {
  @override
  ChannelPermissionCaches build() {
    ref.watch(currentUserIdProvider);
    return const ChannelPermissionCaches();
  }

  int? getChannelBits(String channelId) => state.effective[channelId];

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

  Future<void> rebuildGuild(
    String guildId, {
    Set<String>? onlyChannelIds,
  }) async {
    if (guildId.isEmpty) {
      return;
    }
    final Map<String, ChannelPermissionBitsOutcome> outcomes =
        await computeEffectiveGuildChannelPermissionBitsOutcomesForGuild(
          ref: ref,
          guildId: guildId,
          onlyChannelIds: onlyChannelIds,
        );
    if (!ref.mounted || outcomes.isEmpty) {
      return;
    }
    final Map<String, int> nextEffective = Map<String, int>.from(
      state.effective,
    );
    var changed = false;
    for (final MapEntry<String, ChannelPermissionBitsOutcome> entry
        in outcomes.entries) {
      if (entry.value.shouldCache) {
        if (nextEffective[entry.key] != entry.value.value) {
          nextEffective[entry.key] = entry.value.value;
          changed = true;
        }
      } else if (nextEffective.remove(entry.key) != null) {
        changed = true;
      }
    }
    if (changed) {
      state = ChannelPermissionCaches(
        effective: nextEffective,
        local: state.local,
      );
    }
  }

  Future<void> rebuildAfterReady({
    String? priorityGuildId,
    String? priorityChannelId,
  }) async {
    if (priorityChannelId != null && priorityChannelId.isNotEmpty) {
      await rebuildChannel(priorityChannelId);
      if (!ref.mounted) {
        return;
      }
    }
    final db = ref.read(fluxerDatabaseProvider);
    final List<String> guildIds = <String>[
      for (final Server guild in await db.guildDao.getServers()) guild.id,
    ];
    if (!ref.mounted) {
      return;
    }
    if (priorityGuildId != null && guildIds.remove(priorityGuildId)) {
      guildIds.insert(0, priorityGuildId);
    }
    for (var index = 0; index < guildIds.length; index++) {
      if (!ref.mounted) {
        return;
      }
      if (index > 0) {
        await Future<void>.delayed(const Duration(milliseconds: 15));
      }
      await rebuildGuild(guildIds[index]);
    }
  }

  void evictChannel(String channelId) {
    if (channelId.isEmpty) {
      return;
    }
    if (!state.effective.containsKey(channelId) &&
        !state.local.containsKey(channelId)) {
      return;
    }
    final Map<String, int> nextEffective = Map<String, int>.from(
      state.effective,
    )..remove(channelId);
    final Map<String, int> nextLocal = Map<String, int>.from(state.local)
      ..remove(channelId);
    state = ChannelPermissionCaches(effective: nextEffective, local: nextLocal);
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
    if (state.effective[channelId] == outcome.value) {
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
    if (state.local[channelId] == outcome.value) {
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
