import 'dart:async';

import 'package:drift/drift.dart' show Value;
import 'package:flutter/foundation.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart';
import 'package:fluxer_app/core/gateway/channel_last_message_index.dart';
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/core/providers/gateway_performance_providers.dart';
import 'package:fluxer_app/core/providers/gateway_ready_provider.dart';
import 'package:fluxer_app/core/providers/gateway_session_recovery_provider.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/features/channels/data/channel_unread_presentation.dart';
import 'package:fluxer_app/features/channels/data/read_state_effective.dart';
import 'package:fluxer_app/features/channels/data/read_state_utils.dart';
import 'package:fluxer_app/features/channels/data/unread_permission_utils.dart';
import 'package:fluxer_app/features/channels/data/unread_settings_resolver.dart';
import 'package:fluxer_app/features/channels/domain/channel.dart'
    show isThreadChannelType, tracksGuildChannelUnreadSnapshot;
import 'package:fluxer_app/features/channels/domain/unread_state.dart';
import 'package:fluxer_app/features/channels/providers/guild_channel_unread_snapshot_provider.dart';
import 'package:fluxer_app/features/channels/providers/read_state_write_batcher_provider.dart';
import 'package:fluxer_app/features/guilds/providers/guild_read_state_ready_provider.dart';
import 'package:fluxer_app/features/guilds/utils/guild_notification_resolution.dart';
import 'package:fluxer_dart/export.dart' hide ChannelType;
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'guild_read_state_provider.g.dart';

@immutable
class GuildReadStateEntry {
  const GuildReadStateEntry({
    required this.hasUnread,
    required this.hasPlainUnread,
    required this.mentionCount,
    required this.mentionCountByChannel,
    required this.unreadChannelId,
    required this.sentinel,
  });

  final bool hasUnread;
  final bool hasPlainUnread;
  final int mentionCount;
  final Map<String, int> mentionCountByChannel;
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
    return mapEquals(mentionCountByChannel, other.mentionCountByChannel);
  }

  GuildReadStateEntry copyWith({
    bool? hasUnread,
    bool? hasPlainUnread,
    int? mentionCount,
    Map<String, int>? mentionCountByChannel,
    Object? unreadChannelId = _sentinel,
    int? sentinel,
  }) => GuildReadStateEntry(
    hasUnread: hasUnread ?? this.hasUnread,
    hasPlainUnread: hasPlainUnread ?? this.hasPlainUnread,
    mentionCount: mentionCount ?? this.mentionCount,
    mentionCountByChannel: mentionCountByChannel ?? this.mentionCountByChannel,
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
  Future<void>? _seedInFlight;
  bool _reseedRequested = false;
  bool _isInitialSeedComplete = false;
  int _recomputeGeneration = 0;
  Future<void>? _pendingRecompute;
  final Set<String> _pendingSeedChannelIds = <String>{};
  final Set<String> _pendingChannelIds = <String>{};
  final Set<String> _pendingLatestRefresh = <String>{};
  final Set<String> _pendingReadStateRefresh = <String>{};
  Set<String> _overlayChannelIds = <String>{};
  final Map<String, _Contribution> _channelContributions =
      <String, _Contribution>{};
  final Map<String, String> _contributionGuild = <String, String>{};
  final Map<String, String?> _latestMessageIdByChannel = <String, String?>{};
  final Map<String, bool> _channelLastExistsInCacheByChannel = <String, bool>{};
  final Map<String, int?> _guildJoinedAtMs = <String, int?>{};
  final Set<String> _guildJoinedAtFetched = <String>{};
  final Map<String, UserGuildSettingsResponse?> _guildSettings =
      <String, UserGuildSettingsResponse?>{};
  final Map<String, String> _guildSettingsRaw = <String, String>{};
  final Map<String, GuildNotificationContext> _guildNotificationContexts =
      <String, GuildNotificationContext>{};
  final Set<String> _pendingTrustIndex = <String>{};
  StreamSubscription<Map<String, String>>? _lastMessageIndexSub;
  Map<String, ThreadMember> _joinedThreadMembers = <String, ThreadMember>{};
  final Map<String, List<String>> _channelIdsByGuild = <String, List<String>>{};
  Map<String, String> _roleSignatureByGuild = <String, String>{};
  Map<String, String> _memberSignatureByGuild = <String, String>{};
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
      for (final String channelId in touched) {
        if (_readStateAckOrMentionsChanged(
          _readStateSnapshot[channelId],
          next[channelId],
        )) {
          _pendingLatestRefresh.add(channelId);
        }
      }
      _readStateSnapshot = next;
      if (touched.isNotEmpty) {
        _enqueueChannels(touched, db, currentUserId, refreshLatest: false);
      }
    });

    final joinedThreadSub = db.threadDao.watchJoinedMembers().listen((
      List<ThreadMember> rows,
    ) {
      final Map<String, ThreadMember> joined = <String, ThreadMember>{
        for (final ThreadMember row in rows) row.threadId: row,
      };
      final Set<String> touched = <String>{
        for (final MapEntry<String, ThreadMember> entry in joined.entries)
          if (_joinedThreadMembers[entry.key] != entry.value) entry.key,
        for (final String id in _joinedThreadMembers.keys)
          if (!joined.containsKey(id)) id,
      };
      _joinedThreadMembers = joined;
      if (touched.isNotEmpty) {
        _enqueueChannels(touched, db, currentUserId, refreshLatest: false);
      }
    });

    final channelSub = db.channelDao
        .watchAllChannels(includeThreads: true)
        .listen((channels) {
          final next = <String, Channel>{for (final c in channels) c.id: c};
          final touched = _diffChannels(
            _channelSnapshot,
            next,
            ignoreLastMessageOnly: true,
          );
          final staleLastMessageIds = _diffLastMessageIds(
            _channelSnapshot,
            next,
          );
          _channelSnapshot = next;
          _rebuildChannelIdsByGuild();
          final allTouched = <String>{
            ..._withDescendants(touched),
            ...staleLastMessageIds,
          };
          if (allTouched.isNotEmpty) {
            _enqueueChannels(
              allTouched,
              db,
              currentUserId,
              refreshLatest: true,
            );
          }
        });

    _lastMessageIndexSub = lastMessageIndex.flushStream.listen((
      Map<String, String> updates,
    ) {
      if (updates.isEmpty) {
        return;
      }
      for (final MapEntry<String, String> update in updates.entries) {
        final Channel? channel = _channelSnapshot[update.key];
        if (channel != null &&
            compareSnowflakeIds(update.value, channel.lastMessageId) >= 0) {
          _channelSnapshot[update.key] = channel.copyWith(
            lastMessageId: Value(update.value),
          );
        }
      }
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
              _tracksUnread(channel.type))
            channel.id,
      };
      if (channelIds.isNotEmpty) {
        _enqueueChannels(channelIds, db, currentUserId, refreshLatest: false);
      }
    });

    final roleSub = db.roleDao.watchAllRoles().listen((List<Role> rows) {
      final Map<String, String> next = _accessSignatureByGuild(
        rows.map(
          (Role role) => (role.guildId, '${role.id}:${role.permissions}'),
        ),
      );
      final Set<String> changed = _diffSignatures(_roleSignatureByGuild, next);
      _roleSignatureByGuild = next;
      _enqueueGuilds(changed, db, currentUserId);
    });

    final memberSub = currentUserId == null || currentUserId.isEmpty
        ? null
        : db.memberDao.watchMembersForUser(currentUserId).listen((
            List<Member> rows,
          ) {
            final Map<String, String> next = <String, String>{
              for (final Member member in rows)
                member.guildId: member.roleIdsJson,
            };
            final Set<String> changed = _diffSignatures(
              _memberSignatureByGuild,
              next,
            );
            _memberSignatureByGuild = next;
            _enqueueGuilds(changed, db, currentUserId);
          });

    final guildSub = db.guildDao.watchServers().listen((guilds) {
      _guildNotificationContexts
        ..clear()
        ..addEntries(
          guilds.map(
            (Server guild) => MapEntry<String, GuildNotificationContext>(
              guild.id,
              GuildNotificationContext.fromServer(guild),
            ),
          ),
        );
      _pruneRemovedGuilds(guilds.map((g) => g.id).toSet());
    });

    ref.listen<bool>(gatewayReadyProvider, (prev, next) {
      if (!(prev ?? false) && next) {
        _requestSeed(db, currentUserId);
      }
    });

    ref.listen<int>(gatewayFullRecoveryProvider, (int? prev, int next) {
      if ((prev ?? 0) > 0 && prev != next && ref.read(gatewayReadyProvider)) {
        _requestSeed(db, currentUserId);
      }
    });

    if (ref.read(gatewayReadyProvider)) {
      _requestSeed(db, currentUserId);
    }

    ref.listen<int>(readStateOverlayVersionProvider, (int? prev, int next) {
      final Set<String> overlayIds = ref
          .read(readStateWriteBatcherProvider)
          .overlayChannelIds();
      final Set<String> released = _overlayChannelIds.difference(overlayIds);
      _overlayChannelIds = overlayIds;
      if (released.isNotEmpty) {
        _pendingReadStateRefresh.addAll(released);
        _enqueueChannels(released, db, currentUserId, refreshLatest: true);
      }
      if (overlayIds.isNotEmpty) {
        _enqueueChannels(
          overlayIds,
          db,
          currentUserId,
          refreshLatest: false,
          trustIndex: true,
        );
      }
    });

    ref.onDispose(() {
      unawaited(readStateSub.cancel());
      unawaited(channelSub.cancel());
      unawaited(joinedThreadSub.cancel());
      unawaited(_lastMessageIndexSub?.cancel());
      unawaited(settingsSub.cancel());
      unawaited(guildSub.cancel());
      unawaited(roleSub.cancel());
      unawaited(memberSub?.cancel());
      _clearCaches();
      _pendingSeedChannelIds.clear();
    });

    return <String, GuildReadStateEntry>{};
  }

  void _requestSeed(FluxerDatabase db, String? currentUserId) {
    if (_seedInFlight != null) {
      _reseedRequested = true;
      return;
    }
    _seedInFlight = _seedAll(db, currentUserId).whenComplete(() {
      _seedInFlight = null;
      if (_reseedRequested) {
        _reseedRequested = false;
        _requestSeed(db, currentUserId);
      }
    });
  }

  Future<void> _seedAll(FluxerDatabase db, String? currentUserId) async {
    _isInitialSeedComplete = false;
    _recomputeGeneration++;
    _clearCaches();
    final guilds = await db.guildDao.getServers();
    final allChannels = await db.channelDao.getAllChannels(
      includeThreads: true,
    );
    _joinedThreadMembers = <String, ThreadMember>{
      for (final ThreadMember row in await db.threadDao.getJoinedMembers())
        row.threadId: row,
    };
    final allReadStates = await db.readStateDao.getReadStates();
    final allSettings = await db.userGuildSettingsDao.getAll();
    _channelSnapshot = {for (final c in allChannels) c.id: c};
    ref.read(channelLastMessageIndexProvider).seedAll(<String, String?>{
      for (final Channel c in allChannels) c.id: c.lastMessageId,
    });
    _readStateSnapshot = {for (final r in allReadStates) r.channelId: r};
    _updateGuildSettings(allSettings);
    _guildNotificationContexts
      ..clear()
      ..addEntries(
        guilds.map(
          (Server guild) => MapEntry<String, GuildNotificationContext>(
            guild.id,
            GuildNotificationContext.fromServer(guild),
          ),
        ),
      );
    if (currentUserId != null && currentUserId.isNotEmpty) {
      for (final Server guild in guilds) {
        if (_guildJoinedAtFetched.contains(guild.id)) {
          continue;
        }
        final Member? member = await db.memberDao.getMemberByUserId(
          currentUserId,
          guild.id,
        );
        _guildJoinedAtMs[guild.id] = member?.joinedAt?.millisecondsSinceEpoch;
        _guildJoinedAtFetched.add(guild.id);
      }
    }

    final List<Channel> trackableChannels = <Channel>[
      for (final Channel channel in _channelSnapshot.values)
        if (_tracksUnread(channel.type)) channel,
    ];
    _rebuildChannelIdsByGuild();
    final ChannelUnreadPermissionSeedCache permissionCache =
        await buildChannelUnreadPermissionSeedCache(
          database: db,
          currentUserId: currentUserId,
          channels: trackableChannels,
          guilds: guilds,
          channelSnapshot: _channelSnapshot,
        );
    final Map<String, ChannelLatestMessageResolution> latestByChannel =
        await resolveLatestMessageIdsForChannelsBulk(db, trackableChannels);
    final now = DateTime.now();
    final Map<String, UnreadState> unreadPatch = <String, UnreadState>{};
    for (final Channel channel in trackableChannels) {
      if (!permissionCache.canReadForUnread(channel)) {
        _channelContributions[channel.id] = const _Contribution(
          unreadEligible: false,
          hasPlainUnread: false,
          hasUnreadMessages: false,
          mentions: 0,
        );
        _contributionGuild[channel.id] = channel.guildId;
        unreadPatch[channel.id] = const UnreadState();
        continue;
      }
      final ChannelLatestMessageResolution resolved =
          latestByChannel[channel.id] ?? (id: null, existsInCache: false);
      _latestMessageIdByChannel[channel.id] = resolved.id;
      _channelLastExistsInCacheByChannel[channel.id] = resolved.existsInCache;
      final int fallbackAckMs = _fallbackAckMsForChannel(channel);
      final ChannelGuildUnreadPresentation presentation =
          _computeChannelPresentation(
            channel: channel,
            readState: _effectiveReadState(channel.id),
            guildSettings: _guildSettings[channel.guildId],
            now: now,
            fallbackAckMs: fallbackAckMs,
            strictLatestMessageId: resolved.id,
            channelLastMessageExistsInCache: resolved.existsInCache,
          );
      _channelContributions[channel.id] = _contributionFromPresentation(
        presentation,
      );
      _contributionGuild[channel.id] = channel.guildId;
      unreadPatch[channel.id] = presentation.snapshotUnread;
    }
    ref.read(guildChannelUnreadSnapshotProvider.notifier).replace(unreadPatch);
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
    _pendingRecompute ??= Future<void>.microtask(() async {
      try {
        while (_pendingChannelIds.isNotEmpty) {
          await _runRecompute(db: db, currentUserId: currentUserId);
        }
      } finally {
        _pendingRecompute = null;
      }
    });
  }

  Future<void> _runRecompute({
    required FluxerDatabase db,
    required String? currentUserId,
  }) async {
    final int generation = _recomputeGeneration;
    final ChannelLastMessageIndex lastMessageIndex = ref.read(
      channelLastMessageIndexProvider,
    );
    if (_pendingReadStateRefresh.isNotEmpty) {
      final List<String> refreshIds = _pendingReadStateRefresh.toList();
      _pendingReadStateRefresh.clear();
      for (final String id in refreshIds) {
        final ReadState? row = await db.readStateDao.getReadState(id);
        if (row == null) {
          _readStateSnapshot.remove(id);
        } else {
          _readStateSnapshot[id] = row;
        }
      }
    }
    if (_pendingLatestRefresh.isNotEmpty) {
      final latestIds = _pendingLatestRefresh.toList();
      _pendingLatestRefresh.clear();
      final trustedFromRefresh = <String>[];
      for (final id in latestIds) {
        final channel = _channelSnapshot[id];
        if (channel != null && _tracksUnread(channel.type)) {
          if (_pendingTrustIndex.remove(id)) {
            trustedFromRefresh.add(id);
          } else {
            final Channel? fresh = await db.channelDao.getChannelById(id);
            final String? pointer = fresh == null
                ? channel.lastMessageId
                : fresh.lastMessageId;
            final Channel? current = _channelSnapshot[id];
            if (fresh != null && current != null) {
              _channelSnapshot[id] = current.copyWith(
                lastMessageId: Value(pointer),
              );
            }
            final resolved = await resolveLatestMessageIdForChannel(
              db,
              id,
              channelLastMessageId: pointer,
            );
            _latestMessageIdByChannel[id] = resolved.id;
            _channelLastExistsInCacheByChannel[id] = resolved.existsInCache;
          }
        } else {
          _latestMessageIdByChannel.remove(id);
          _channelLastExistsInCacheByChannel.remove(id);
        }
      }
      _applyTrustedIndexLatestIds(trustedFromRefresh, lastMessageIndex);
    }
    final pendingTrust = _pendingTrustIndex.toSet();
    _pendingTrustIndex.clear();
    _applyTrustedIndexLatestIds(pendingTrust, lastMessageIndex);
    final pending = _pendingChannelIds.toList();
    _pendingChannelIds.clear();
    if (pending.isEmpty) {
      return;
    }
    final now = DateTime.now();
    final affectedGuilds = <String>{};
    final Map<String, UnreadState> unreadPatch = <String, UnreadState>{};
    for (final id in pending) {
      final channel = _channelSnapshot[id];
      final guildId = channel?.guildId ?? _contributionGuild[id];
      if (guildId != null) {
        affectedGuilds.add(guildId);
      }
      if (channel == null || !_tracksUnread(channel.type)) {
        _channelContributions.remove(id);
        _contributionGuild.remove(id);
        unreadPatch[id] = const UnreadState();
        continue;
      }
      final canRead = await canReadChannelForUnread(
        database: db,
        channel: channel,
        currentUserId: currentUserId,
      );
      if (!canRead) {
        _channelContributions[id] = const _Contribution(
          unreadEligible: false,
          hasPlainUnread: false,
          hasUnreadMessages: false,
          mentions: 0,
        );
        _contributionGuild[id] = channel.guildId;
        unreadPatch[id] = const UnreadState();
        continue;
      }
      final fallbackAckMs = await _resolveFallbackAckMs(
        channel,
        db,
        currentUserId,
      );
      final ChannelGuildUnreadPresentation presentation =
          _computeChannelPresentation(
            channel: channel,
            readState: _effectiveReadState(channel.id),
            guildSettings: _guildSettings[channel.guildId],
            now: now,
            fallbackAckMs: fallbackAckMs,
            strictLatestMessageId: _latestMessageIdByChannel[id],
            channelLastMessageExistsInCache:
                _channelLastExistsInCacheByChannel[id] ?? false,
          );
      _channelContributions[id] = _contributionFromPresentation(presentation);
      _contributionGuild[id] = channel.guildId;
      unreadPatch[id] = presentation.snapshotUnread;
    }
    if (generation != _recomputeGeneration) {
      if (_isInitialSeedComplete) {
        _pendingChannelIds.addAll(pending);
      } else {
        _pendingSeedChannelIds.addAll(pending);
      }
      return;
    }
    _publishChannelUnreadPatch(unreadPatch);
    _emitForGuilds(affectedGuilds);
  }

  void _publishChannelUnreadPatch(Map<String, UnreadState> patch) {
    if (patch.isEmpty) {
      return;
    }
    ref.read(guildChannelUnreadSnapshotProvider.notifier).apply(patch);
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

  void _applyTrustedIndexLatestIds(
    Iterable<String> channelIds,
    ChannelLastMessageIndex lastMessageIndex,
  ) {
    for (final id in channelIds) {
      final channel = _channelSnapshot[id];
      if (channel == null || !_tracksUnread(channel.type)) {
        continue;
      }
      final indexId =
          lastMessageIndex.lastMessageIdFor(id) ?? channel.lastMessageId;
      if (indexId == null) {
        continue;
      }
      final currentLatest = _latestMessageIdByChannel[id];
      if (currentLatest != null &&
          compareSnowflakeIds(indexId, currentLatest) <= 0) {
        continue;
      }
      _latestMessageIdByChannel[id] = indexId;
      _channelLastExistsInCacheByChannel[id] = true;
    }
  }

  GuildReadStateEntry _aggregateGuild(String guildId) {
    var anyUnread = false;
    var anyPlainUnread = false;
    var totalMentions = 0;
    String? firstUnreadChannelId;
    var firstUnreadPosition = 0;
    final mentionCountByChannel = <String, int>{};
    final List<String> channelIds =
        _channelIdsByGuild[guildId] ?? const <String>[];
    for (final String channelId in channelIds) {
      final Channel? channel = _channelSnapshot[channelId];
      if (channel == null) {
        continue;
      }
      final _Contribution? contribution = _channelContributions[channelId];
      if (contribution == null) {
        continue;
      }
      if (contribution.mentions > 0) {
        mentionCountByChannel[channelId] = contribution.mentions;
        totalMentions += contribution.mentions;
      }
      if (contribution.unreadEligible) {
        anyUnread = true;
        if (!isThreadChannelType(channel.type) &&
            (firstUnreadChannelId == null ||
                channel.position < firstUnreadPosition)) {
          firstUnreadChannelId = channelId;
          firstUnreadPosition = channel.position;
        }
      }
      if (contribution.hasPlainUnread) {
        anyPlainUnread = true;
      }
    }
    return GuildReadStateEntry(
      hasUnread: anyUnread,
      hasPlainUnread: anyPlainUnread,
      mentionCount: totalMentions,
      mentionCountByChannel: mentionCountByChannel,
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
      _guildNotificationContexts.remove(guildId);
    }
    _latestMessageIdByChannel.removeWhere(
      (channelId, _) => !_channelSnapshot.containsKey(channelId),
    );
    _channelLastExistsInCacheByChannel.removeWhere(
      (channelId, _) => !_channelSnapshot.containsKey(channelId),
    );
    state = Map<String, GuildReadStateEntry>.from(state)
      ..removeWhere((id, _) => removed.contains(id));
  }

  void _clearCaches() {
    _channelContributions.clear();
    _contributionGuild.clear();
    _latestMessageIdByChannel.clear();
    _channelLastExistsInCacheByChannel.clear();
    _channelIdsByGuild.clear();
    _guildJoinedAtMs.clear();
    _guildJoinedAtFetched.clear();
    _guildSettings.clear();
    _guildSettingsRaw.clear();
    _guildNotificationContexts.clear();
    _pendingChannelIds.clear();
    _pendingLatestRefresh.clear();
    _pendingTrustIndex.clear();
  }

  void _enqueueGuilds(
    Set<String> guildIds,
    FluxerDatabase db,
    String? currentUserId,
  ) {
    final Set<String> channelIds = <String>{
      for (final String guildId in guildIds) ...?_channelIdsByGuild[guildId],
    };
    if (channelIds.isNotEmpty) {
      _enqueueChannels(channelIds, db, currentUserId, refreshLatest: false);
    }
  }

  Set<String> _withDescendants(Set<String> channelIds) {
    final Set<String> result = <String>{...channelIds};
    var frontier = channelIds;
    while (frontier.isNotEmpty) {
      final Set<String> children = <String>{
        for (final Channel channel in _channelSnapshot.values)
          if (frontier.contains(channel.parentId) &&
              !result.contains(channel.id))
            channel.id,
      };
      result.addAll(children);
      frontier = children;
    }
    return result;
  }

  void _rebuildChannelIdsByGuild() {
    _channelIdsByGuild.clear();
    for (final Channel channel in _channelSnapshot.values) {
      if (channel.guildId.isEmpty || !_tracksUnread(channel.type)) {
        continue;
      }
      (_channelIdsByGuild[channel.guildId] ??= <String>[]).add(channel.id);
    }
  }

  int _fallbackAckMsForChannel(Channel channel) {
    final int? ms = _guildJoinedAtMs[channel.guildId];
    if (ms != null) {
      return ms;
    }
    return snowflakeTimestampMs(channel.id);
  }

  ReadState? _effectiveReadState(String channelId) {
    final ReadState? persisted = _readStateSnapshot[channelId];
    final ReadStateEffectiveFields effective = ref
        .read(readStateWriteBatcherProvider)
        .effectiveFields(channelId, persisted);
    if (persisted == null &&
        effective.mentionCount == 0 &&
        (effective.lastMessageId == null || effective.lastMessageId!.isEmpty)) {
      return null;
    }
    if (persisted == null) {
      return ReadState(
        channelId: channelId,
        lastMessageId: effective.lastMessageId,
        mentionCount: effective.mentionCount,
        manual: false,
      );
    }
    return persisted.copyWith(
      lastMessageId: Value(effective.lastMessageId),
      mentionCount: effective.mentionCount,
    );
  }

  ChannelGuildUnreadPresentation _computeChannelPresentation({
    required Channel channel,
    required ReadState? readState,
    required UserGuildSettingsResponse? guildSettings,
    required DateTime now,
    required int fallbackAckMs,
    required String? strictLatestMessageId,
    required bool channelLastMessageExistsInCache,
  }) {
    final bool isThread = isThreadChannelType(channel.type);
    return computeChannelGuildUnreadPresentation(
      channel: channel,
      readState: readState,
      guildSettings: guildSettings,
      guildContext: _guildNotificationContexts[channel.guildId],
      now: now,
      fallbackAckMs: fallbackAckMs,
      strictLatestMessageId: strictLatestMessageId,
      channelLastMessageExistsInCache: channelLastMessageExistsInCache,
      threadJoined: _joinedThreadMembers.containsKey(channel.id),
      threadMuted: isThread && _isThreadMuted(channel, guildSettings, now),
    );
  }

  _Contribution _contributionFromPresentation(
    ChannelGuildUnreadPresentation presentation,
  ) {
    return _Contribution(
      unreadEligible: presentation.unreadEligible,
      hasPlainUnread: presentation.hasPlainUnread,
      hasUnreadMessages: presentation.hasUnreadMessages,
      mentions: presentation.guildMentionCount,
    );
  }

  bool _isThreadMuted(
    Channel thread,
    UserGuildSettingsResponse? guildSettings,
    DateTime now,
  ) {
    if (isThreadMemberMuted(_joinedThreadMembers[thread.id], now)) {
      return true;
    }
    final Channel? parent = thread.parentId == null
        ? null
        : _channelSnapshot[thread.parentId!];
    return parent != null &&
        isGuildOrCategoryOrChannelMuted(
          channel: parent,
          guildSettings: guildSettings,
          now: now,
        );
  }
}

bool _tracksUnread(int type) => tracksGuildChannelUnreadSnapshot(type);

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

bool _readStateAckOrMentionsChanged(ReadState? previous, ReadState? next) {
  if (previous?.lastMessageId != next?.lastMessageId) {
    return true;
  }
  return (previous?.mentionCount ?? 0) != (next?.mentionCount ?? 0);
}

Set<String> _diffLastMessageIds(
  Map<String, Channel> previous,
  Map<String, Channel> next,
) {
  final changed = <String>{};
  for (final entry in next.entries) {
    final Channel? old = previous[entry.key];
    if (old != null && old.lastMessageId != entry.value.lastMessageId) {
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

Map<String, String> _accessSignatureByGuild(
  Iterable<(String, String)> entries,
) {
  final Map<String, List<String>> parts = <String, List<String>>{};
  for (final (String guildId, String part) in entries) {
    (parts[guildId] ??= <String>[]).add(part);
  }
  return <String, String>{
    for (final MapEntry<String, List<String>> entry in parts.entries)
      entry.key: (entry.value..sort()).join(','),
  };
}

Set<String> _diffSignatures(
  Map<String, String> previous,
  Map<String, String> next,
) => <String>{
  for (final MapEntry<String, String> entry in next.entries)
    if (previous.containsKey(entry.key) && previous[entry.key] != entry.value)
      entry.key,
};

bool _channelEqualsExceptLastMessage(Channel a, Channel b) =>
    a.guildId == b.guildId &&
    a.permissionOverwritesJson == b.permissionOverwritesJson &&
    a.lastPinTimestamp == b.lastPinTimestamp &&
    a.type == b.type &&
    a.parentId == b.parentId &&
    a.position == b.position;

bool _channelEquals(Channel a, Channel b) =>
    a.guildId == b.guildId &&
    a.permissionOverwritesJson == b.permissionOverwritesJson &&
    a.lastMessageId == b.lastMessageId &&
    a.lastPinTimestamp == b.lastPinTimestamp &&
    a.type == b.type &&
    a.parentId == b.parentId;

class _Contribution {
  const _Contribution({
    required this.unreadEligible,
    required this.hasPlainUnread,
    required this.hasUnreadMessages,
    required this.mentions,
  });

  final bool unreadEligible;
  final bool hasPlainUnread;
  final bool hasUnreadMessages;
  final int mentions;
}
