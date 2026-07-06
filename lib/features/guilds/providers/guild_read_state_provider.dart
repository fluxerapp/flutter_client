import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart';
import 'package:fluxer_app/core/gateway/channel_last_message_index.dart';
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/core/providers/gateway_performance_providers.dart';
import 'package:fluxer_app/core/providers/gateway_ready_provider.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/features/channels/data/read_state_utils.dart';
import 'package:fluxer_app/features/channels/data/unread_settings_resolver.dart';
import 'package:fluxer_app/features/channels/domain/channel.dart'
    show isGuildTextBasedChannel;
import 'package:fluxer_app/features/guilds/domain/guild_read_state_contribution.dart';
import 'package:fluxer_app/features/guilds/providers/guild_read_state_ready_provider.dart';
import 'package:fluxer_dart/export.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'guild_read_state_provider.g.dart';

@immutable
class GuildReadStateEntry {
  const GuildReadStateEntry({
    required this.hasUnread,
    required this.hasPlainUnread,
    required this.mentionCount,
    required this.mentionChannels,
    required this.unreadChannelId,
    required this.sentinel,
  });

  static const GuildReadStateEntry empty = GuildReadStateEntry(
    hasUnread: false,
    hasPlainUnread: false,
    mentionCount: 0,
    mentionChannels: <String>{},
    unreadChannelId: null,
    sentinel: 0,
  );

  final bool hasUnread;
  final bool hasPlainUnread;
  final int mentionCount;
  final Set<String> mentionChannels;
  final String? unreadChannelId;
  final int sentinel;

  bool hasSameFields(GuildReadStateEntry other) {
    if (hasUnread != other.hasUnread) {
      return false;
    }
    if (hasPlainUnread != other.hasPlainUnread) {
      return false;
    }
    if (mentionCount != other.mentionCount) {
      return false;
    }
    if (unreadChannelId != other.unreadChannelId) {
      return false;
    }
    if (mentionChannels.length != other.mentionChannels.length) {
      return false;
    }
    return mentionChannels.containsAll(other.mentionChannels);
  }

  GuildReadStateEntry copyWith({
    bool? hasUnread,
    bool? hasPlainUnread,
    int? mentionCount,
    Set<String>? mentionChannels,
    Object? unreadChannelId = _sentinel,
    int? sentinel,
  }) => GuildReadStateEntry(
    hasUnread: hasUnread ?? this.hasUnread,
    hasPlainUnread: hasPlainUnread ?? this.hasPlainUnread,
    mentionCount: mentionCount ?? this.mentionCount,
    mentionChannels: mentionChannels ?? this.mentionChannels,
    unreadChannelId: identical(unreadChannelId, _sentinel)
        ? this.unreadChannelId
        : unreadChannelId as String?,
    sentinel: sentinel ?? this.sentinel,
  );
}

const Object _sentinel = Object();

@Riverpod(keepAlive: true)
class GuildReadState extends _$GuildReadState {
  Map<String, ReadState> _readStateSnapshot = <String, ReadState>{};
  Map<String, Channel> _channelSnapshot = <String, Channel>{};
  bool _seeded = false;
  bool _isInitialSeedComplete = false;
  int _recomputeGeneration = 0;
  Future<void>? _pendingRecompute;
  final Set<String> _pendingSeedChannelIds = <String>{};
  final Set<String> _pendingChannelIds = <String>{};
  final Set<String> _pendingLatestRefresh = <String>{};
  final Map<String, _Contribution> _channelContributions =
      <String, _Contribution>{};
  final Map<String, String> _contributionGuild = <String, String>{};
  final Map<String, String?> _latestMessageIdByChannel = <String, String?>{};
  final Map<String, int?> _guildJoinedAtMs = <String, int?>{};
  final Set<String> _guildJoinedAtFetched = <String>{};
  final Map<String, UserGuildSettingsResponse?> _guildSettings =
      <String, UserGuildSettingsResponse?>{};
  final Map<String, String> _guildSettingsRaw = <String, String>{};
  final Set<String> _pendingTrustIndex = <String>{};
  StreamSubscription<Map<String, String>>? _lastMessageIndexSub;

  @override
  Map<String, GuildReadStateEntry> build() {
    final db = ref.watch(fluxerDatabaseProvider);
    final currentUserId = ref.watch(currentUserIdProvider);

    final ChannelLastMessageIndex lastMessageIndex = ref.watch(
      channelLastMessageIndexProvider,
    );

    final readStateSub = db.readStateDao.watchReadStates().listen((rows) {
      final next = <String, ReadState>{for (final r in rows) r.channelId: r};
      final touched = _diffReadStates(_readStateSnapshot, next);
      _readStateSnapshot = next;
      if (touched.isNotEmpty) {
        _enqueueChannels(touched, db, currentUserId, refreshLatest: false);
      }
    });

    final channelSub = db.channelDao.watchAllChannels().listen((channels) {
      final next = <String, Channel>{for (final c in channels) c.id: c};
      final touched = _diffChannels(
        _channelSnapshot,
        next,
        ignoreLastMessageOnly: true,
      );
      final staleLastMessageIds = _diffStaleLastMessageIds(
        _channelSnapshot,
        next,
        lastMessageIndex,
      );
      _channelSnapshot = next;
      final allTouched = <String>{...touched, ...staleLastMessageIds};
      if (allTouched.isNotEmpty) {
        _enqueueChannels(allTouched, db, currentUserId, refreshLatest: true);
      }
    });

    _lastMessageIndexSub = lastMessageIndex.flushStream.listen((
      Map<String, String> updates,
    ) {
      if (updates.isEmpty) {
        return;
      }
      _pendingTrustIndex.addAll(updates.keys);
      _enqueueChannels(
        updates.keys,
        db,
        currentUserId,
        refreshLatest: false,
        trustIndex: true,
      );
    });

    final settingsSub = db.userGuildSettingsDao.watchAll().listen((rows) {
      final changedGuilds = _updateGuildSettings(rows);
      if (changedGuilds.isEmpty) {
        return;
      }
      final channelIds = <String>{
        for (final channel in _channelSnapshot.values)
          if (changedGuilds.contains(channel.guildId) &&
              isGuildTextBasedChannel(channel.type))
            channel.id,
      };
      if (channelIds.isNotEmpty) {
        _enqueueChannels(channelIds, db, currentUserId, refreshLatest: false);
      }
    });

    final guildSub = db.guildDao.watchServers().listen((guilds) {
      _pruneRemovedGuilds(guilds.map((g) => g.id).toSet());
    });

    ref.listen<bool>(gatewayReadyProvider, (prev, next) {
      if (!(prev ?? false) && next) {
        _seeded = false;
        unawaited(_seedAll(db, currentUserId));
      }
    });

    if (ref.read(gatewayReadyProvider)) {
      unawaited(_seedAll(db, currentUserId));
    }

    ref.onDispose(() {
      unawaited(readStateSub.cancel());
      unawaited(channelSub.cancel());
      unawaited(_lastMessageIndexSub?.cancel());
      unawaited(settingsSub.cancel());
      unawaited(guildSub.cancel());
      _clearCaches();
      _pendingSeedChannelIds.clear();
    });

    return <String, GuildReadStateEntry>{};
  }

  GuildReadStateEntry entryFor(String guildId) =>
      state[guildId] ?? GuildReadStateEntry.empty;

  Future<void> _seedAll(FluxerDatabase db, String? currentUserId) async {
    if (_seeded) {
      return;
    }
    _seeded = true;
    if (_isInitialSeedComplete) {
      return;
    }
    _recomputeGeneration++;
    _clearCaches();
    final guilds = await db.guildDao.getServers();
    final allChannels = await db.channelDao.getAllChannels();
    final allReadStates = await db.readStateDao.getReadStates();
    final allSettings = await db.userGuildSettingsDao.getAll();
    _channelSnapshot = {for (final c in allChannels) c.id: c};
    ref.read(channelLastMessageIndexProvider).seedAll(<String, String?>{
      for (final Channel c in allChannels) c.id: c.lastMessageId,
    });
    _readStateSnapshot = {for (final r in allReadStates) r.channelId: r};
    _updateGuildSettings(allSettings);
    final now = DateTime.now();
    for (final channel in _channelSnapshot.values) {
      if (!isGuildTextBasedChannel(channel.type)) {
        continue;
      }
      final strictLatestMessageId = await resolveLatestMessageIdForChannel(
        db,
        channel.id,
        channelLastMessageId: channel.lastMessageId,
      );
      _latestMessageIdByChannel[channel.id] = strictLatestMessageId;
      final fallbackAckMs = await _resolveFallbackAckMs(
        channel,
        db,
        currentUserId,
      );
      _channelContributions[channel.id] = _computeChannelContribution(
        channel: channel,
        readState: _readStateSnapshot[channel.id],
        guildSettings: _guildSettings[channel.guildId],
        now: now,
        fallbackAckMs: fallbackAckMs,
        strictLatestMessageId: strictLatestMessageId,
      );
      _contributionGuild[channel.id] = channel.guildId;
    }
    _emitForGuilds(guilds.map((g) => g.id).toSet());
    _isInitialSeedComplete = true;
    if (_pendingSeedChannelIds.isNotEmpty) {
      final buffered = _pendingSeedChannelIds.toSet();
      _pendingSeedChannelIds.clear();
      _enqueueChannels(buffered, db, currentUserId, refreshLatest: false);
    }
    ref.read(guildReadStateReadyProvider.notifier).markReady();
  }

  void _enqueueChannels(
    Iterable<String> channelIds,
    FluxerDatabase db,
    String? currentUserId, {
    required bool refreshLatest,
    bool trustIndex = false,
  }) {
    if (!_isInitialSeedComplete) {
      _pendingSeedChannelIds.addAll(channelIds);
      return;
    }
    var added = false;
    for (final id in channelIds) {
      _pendingChannelIds.add(id);
      if (trustIndex) {
        _pendingTrustIndex.add(id);
      } else if (refreshLatest || !_latestMessageIdByChannel.containsKey(id)) {
        _pendingLatestRefresh.add(id);
      }
      added = true;
    }
    if (!added) {
      return;
    }
    _pendingRecompute ??= Future.microtask(() async {
      _pendingRecompute = null;
      await _runRecompute(db: db, currentUserId: currentUserId);
    });
  }

  Future<void> _runRecompute({
    required FluxerDatabase db,
    required String? currentUserId,
  }) async {
    final generation = ++_recomputeGeneration;
    if (_pendingLatestRefresh.isNotEmpty) {
      final latestIds = _pendingLatestRefresh.toList();
      _pendingLatestRefresh.clear();
      final ChannelLastMessageIndex lastMessageIndex = ref.read(
        channelLastMessageIndexProvider,
      );
      for (final id in latestIds) {
        final channel = _channelSnapshot[id];
        if (channel != null && isGuildTextBasedChannel(channel.type)) {
          if (_pendingTrustIndex.remove(id)) {
            _latestMessageIdByChannel[id] =
                lastMessageIndex.lastMessageIdFor(id) ?? channel.lastMessageId;
          } else {
            _latestMessageIdByChannel[id] =
                await resolveLatestMessageIdForChannel(
                  db,
                  id,
                  channelLastMessageId: channel.lastMessageId,
                );
          }
        } else {
          _latestMessageIdByChannel.remove(id);
        }
      }
    }
    final pendingTrust = _pendingTrustIndex.toSet();
    _pendingTrustIndex.clear();
    for (final id in pendingTrust) {
      if (_latestMessageIdByChannel.containsKey(id)) {
        continue;
      }
      final channel = _channelSnapshot[id];
      if (channel != null && isGuildTextBasedChannel(channel.type)) {
        final ChannelLastMessageIndex lastMessageIndex = ref.read(
          channelLastMessageIndexProvider,
        );
        _latestMessageIdByChannel[id] =
            lastMessageIndex.lastMessageIdFor(id) ?? channel.lastMessageId;
      }
    }
    final pending = _pendingChannelIds.toList();
    _pendingChannelIds.clear();
    if (pending.isEmpty) {
      return;
    }
    final now = DateTime.now();
    final affectedGuilds = <String>{};
    for (final id in pending) {
      final channel = _channelSnapshot[id];
      final guildId = channel?.guildId ?? _contributionGuild[id];
      if (guildId != null) {
        affectedGuilds.add(guildId);
      }
      if (channel == null || !isGuildTextBasedChannel(channel.type)) {
        _channelContributions.remove(id);
        _contributionGuild.remove(id);
        continue;
      }
      final fallbackAckMs = await _resolveFallbackAckMs(
        channel,
        db,
        currentUserId,
      );
      _channelContributions[id] = _computeChannelContribution(
        channel: channel,
        readState: _readStateSnapshot[id],
        guildSettings: _guildSettings[channel.guildId],
        now: now,
        fallbackAckMs: fallbackAckMs,
        strictLatestMessageId: _latestMessageIdByChannel[id],
      );
      _contributionGuild[id] = channel.guildId;
    }
    if (generation != _recomputeGeneration) {
      return;
    }
    _emitForGuilds(affectedGuilds);
  }

  void _emitForGuilds(Set<String> guildIds) {
    if (guildIds.isEmpty) {
      return;
    }
    final next = Map<String, GuildReadStateEntry>.from(state);
    var mutated = false;
    for (final guildId in guildIds) {
      final entry = _aggregateGuild(guildId);
      final existing = next[guildId];
      if (existing == null || !entry.hasSameFields(existing)) {
        next[guildId] = entry.copyWith(sentinel: (existing?.sentinel ?? 0) + 1);
        mutated = true;
      }
    }
    if (mutated) {
      state = next;
    }
  }

  GuildReadStateEntry _aggregateGuild(String guildId) {
    var anyUnread = false;
    var anyPlainUnread = false;
    var totalMentions = 0;
    String? firstUnreadChannelId;
    var firstUnreadPosition = 0;
    final mentionChannels = <String>{};
    for (final channel in _channelSnapshot.values) {
      if (channel.guildId != guildId ||
          !isGuildTextBasedChannel(channel.type)) {
        continue;
      }
      final contribution = _channelContributions[channel.id];
      if (contribution == null) {
        continue;
      }
      if (contribution.mentions > 0) {
        mentionChannels.add(channel.id);
        totalMentions += contribution.mentions;
      }
      if (contribution.unreadEligible) {
        anyUnread = true;
        if (firstUnreadChannelId == null ||
            channel.position < firstUnreadPosition) {
          firstUnreadChannelId = channel.id;
          firstUnreadPosition = channel.position;
        }
      }
      if (contribution.hasPlainUnread) {
        anyPlainUnread = true;
      }
    }
    return GuildReadStateEntry(
      hasUnread: anyUnread || totalMentions > 0,
      hasPlainUnread: anyPlainUnread,
      mentionCount: totalMentions,
      mentionChannels: mentionChannels,
      unreadChannelId: firstUnreadChannelId,
      sentinel: 0,
    );
  }

  Future<int> _resolveFallbackAckMs(
    Channel channel,
    FluxerDatabase db,
    String? currentUserId,
  ) async {
    if (currentUserId != null && currentUserId.isNotEmpty) {
      if (!_guildJoinedAtFetched.contains(channel.guildId)) {
        final member = await db.memberDao.getMemberByUserId(
          currentUserId,
          channel.guildId,
        );
        _guildJoinedAtMs[channel.guildId] =
            member?.joinedAt?.millisecondsSinceEpoch;
        _guildJoinedAtFetched.add(channel.guildId);
      }
      final ms = _guildJoinedAtMs[channel.guildId];
      if (ms != null) {
        return ms;
      }
    }
    return snowflakeTimestampMs(channel.id);
  }

  Set<String> _updateGuildSettings(List<UserGuildSettingsTableData> rows) {
    final changed = <String>{};
    final nextIds = <String>{};
    for (final row in rows) {
      nextIds.add(row.guildId);
      if (_guildSettingsRaw[row.guildId] != row.data) {
        _guildSettingsRaw[row.guildId] = row.data;
        _guildSettings[row.guildId] = decodeUserGuildSettings(row.data);
        changed.add(row.guildId);
      }
    }
    final removed = _guildSettingsRaw.keys
        .where((id) => !nextIds.contains(id))
        .toList();
    for (final id in removed) {
      _guildSettingsRaw.remove(id);
      _guildSettings.remove(id);
      changed.add(id);
    }
    return changed;
  }

  void _pruneRemovedGuilds(Set<String> guildIds) {
    if (!_isInitialSeedComplete) {
      return;
    }
    final removed = state.keys.where((id) => !guildIds.contains(id)).toSet();
    if (removed.isEmpty) {
      return;
    }
    _channelContributions.removeWhere(
      (channelId, _) => removed.contains(_contributionGuild[channelId]),
    );
    _contributionGuild.removeWhere(
      (channelId, guildId) => removed.contains(guildId),
    );
    for (final guildId in removed) {
      _guildJoinedAtMs.remove(guildId);
      _guildJoinedAtFetched.remove(guildId);
      _guildSettings.remove(guildId);
      _guildSettingsRaw.remove(guildId);
    }
    _latestMessageIdByChannel.removeWhere(
      (channelId, _) => !_channelSnapshot.containsKey(channelId),
    );
    state = Map<String, GuildReadStateEntry>.from(state)
      ..removeWhere((id, _) => removed.contains(id));
  }

  void _clearCaches() {
    _channelContributions.clear();
    _contributionGuild.clear();
    _latestMessageIdByChannel.clear();
    _guildJoinedAtMs.clear();
    _guildJoinedAtFetched.clear();
    _guildSettings.clear();
    _guildSettingsRaw.clear();
    _pendingChannelIds.clear();
    _pendingLatestRefresh.clear();
    _pendingTrustIndex.clear();
  }

  _Contribution _computeChannelContribution({
    required Channel channel,
    required ReadState? readState,
    required UserGuildSettingsResponse? guildSettings,
    required DateTime now,
    required int fallbackAckMs,
    required String? strictLatestMessageId,
  }) {
    final rawMentions = readState?.mentionCount ?? 0;
    final latestMessageId = resolveLatestMessageIdForUnread(
      strictLatestMessageId: strictLatestMessageId,
      channelLastMessageId: channel.lastMessageId,
      ackLastMessageId: readState?.lastMessageId,
      mentionCount: rawMentions,
    );
    final hasUnreadMessage = hasUnreadByReadState(
      channelLastMessageId: latestMessageId,
      ackLastMessageId: readState?.lastMessageId,
      fallbackAckMs: fallbackAckMs,
      mentionCount: 0,
      isGuildChannel: true,
    );
    final contribution = resolveGuildReadStateContribution(
      isEligibleTextChannel: isGuildTextBasedChannel(channel.type),
      isPrivate: false,
      unreadBadgesLevel: resolveGuildUnreadBadgesLevel(
        channel: channel,
        guildSettings: guildSettings,
      ),
      isMutedForUnread: isGuildOrCategoryOrChannelMuted(
        channel: channel,
        guildSettings: guildSettings,
        now: now,
      ),
      hasUnread: hasUnreadMessage,
      mentionCount: rawMentions,
    );
    final hasPlainUnread = contribution.unreadAllowed && rawMentions == 0;
    return _Contribution(
      unreadEligible: contribution.mentionAllowed || contribution.unreadAllowed,
      hasPlainUnread: hasPlainUnread,
      mentions: contribution.mentionAllowed ? rawMentions : 0,
    );
  }
}

Set<String> _diffReadStates(
  Map<String, ReadState> previous,
  Map<String, ReadState> next,
) {
  final changed = <String>{};
  for (final entry in next.entries) {
    final old = previous[entry.key];
    if (old == null || !_readStateEquals(old, entry.value)) {
      changed.add(entry.key);
    }
  }
  for (final oldKey in previous.keys) {
    if (!next.containsKey(oldKey)) {
      changed.add(oldKey);
    }
  }
  return changed;
}

bool _readStateEquals(ReadState a, ReadState b) =>
    a.lastMessageId == b.lastMessageId &&
    a.mentionCount == b.mentionCount &&
    a.lastPinTimestamp == b.lastPinTimestamp &&
    a.manual == b.manual &&
    a.stickyUnreadMessageId == b.stickyUnreadMessageId;

Set<String> _diffStaleLastMessageIds(
  Map<String, Channel> previous,
  Map<String, Channel> next,
  ChannelLastMessageIndex lastMessageIndex,
) {
  final changed = <String>{};
  for (final entry in next.entries) {
    final Channel? old = previous[entry.key];
    if (old == null || old.lastMessageId == entry.value.lastMessageId) {
      continue;
    }
    if (lastMessageIndex.lastMessageIdFor(entry.key) !=
        entry.value.lastMessageId) {
      changed.add(entry.key);
    }
  }
  return changed;
}

Set<String> _diffChannels(
  Map<String, Channel> previous,
  Map<String, Channel> next, {
  bool ignoreLastMessageOnly = false,
}) {
  final changed = <String>{};
  for (final entry in next.entries) {
    final old = previous[entry.key];
    if (old == null) {
      changed.add(entry.key);
      continue;
    }
    if (ignoreLastMessageOnly &&
        _channelEqualsExceptLastMessage(old, entry.value)) {
      continue;
    }
    if (!_channelEquals(old, entry.value)) {
      changed.add(entry.key);
    }
  }
  for (final oldKey in previous.keys) {
    if (!next.containsKey(oldKey)) {
      changed.add(oldKey);
    }
  }
  return changed;
}

bool _channelEqualsExceptLastMessage(Channel a, Channel b) =>
    a.guildId == b.guildId &&
    a.lastPinTimestamp == b.lastPinTimestamp &&
    a.type == b.type &&
    a.parentId == b.parentId &&
    a.position == b.position;

bool _channelEquals(Channel a, Channel b) =>
    a.guildId == b.guildId &&
    a.lastMessageId == b.lastMessageId &&
    a.lastPinTimestamp == b.lastPinTimestamp &&
    a.type == b.type &&
    a.parentId == b.parentId;

class _Contribution {
  const _Contribution({
    required this.unreadEligible,
    required this.hasPlainUnread,
    required this.mentions,
  });

  final bool unreadEligible;
  final bool hasPlainUnread;
  final int mentions;
}
