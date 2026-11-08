import 'dart:async';

import 'package:drift/drift.dart' show Value;
import 'package:flutter/foundation.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart';
import 'package:fluxer_app/core/gateway/channel_last_message_index.dart';
import 'package:fluxer_app/core/providers/app/account_user_id.dart';
import 'package:fluxer_app/core/providers/app/startup_gateway_fallback_provider.dart';
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/core/providers/gateway/gateway_performance_providers.dart';
import 'package:fluxer_app/core/providers/gateway/gateway_ready_provider.dart';
import 'package:fluxer_app/core/providers/gateway/gateway_session_recovery_provider.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/features/channels/data/channel_unread_presentation.dart';
import 'package:fluxer_app/features/channels/data/read_state_effective.dart';
import 'package:fluxer_app/features/channels/data/read_state_utils.dart';
import 'package:fluxer_app/features/channels/data/read_state_write_batcher.dart';
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
  Map<String, String> _guildOwnerById = <String, String>{};
  ChannelUnreadPermissionSeedCache? _permissionSeedCache;
  int _permissionInputsRevision = 0;
  int _channelRevision = 0;
  int _readStateRevision = 0;
  int _joinedThreadRevision = 0;
  int _guildSettingsRevision = 0;
  @override
  Map<String, GuildReadStateEntry> build() {
    final db = ref.watch(fluxerDatabaseProvider);
    final currentUserId = ref.watch(currentUserIdProvider);

    final ChannelLastMessageIndex lastMessageIndex = ref.watch(
      channelLastMessageIndexProvider(readAccountUserId(ref)),
    );

    final readStateSub = db.readStateDao.watchReadStates().listen((rows) {
      final next = <String, ReadState>{for (final r in rows) r.channelId: r};
      _readStateRevision++;
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
      _joinedThreadRevision++;
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
          _channelRevision++;
          if (_permissionInputsChanged(_channelSnapshot, next)) {
            _invalidatePermissionSeedCache();
          }
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
      _guildSettingsRevision++;
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
      if (!mapEquals(_roleSignatureByGuild, next)) {
        _invalidatePermissionSeedCache();
      }
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
            if (!mapEquals(_memberSignatureByGuild, next)) {
              _invalidatePermissionSeedCache();
            }
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
      final Map<String, String> owners = <String, String>{
        for (final Server guild in guilds) guild.id: guild.ownerId ?? '',
      };
      if (!mapEquals(_guildOwnerById, owners)) {
        _invalidatePermissionSeedCache();
      }
      final Set<String> ownerChanged = _diffSignatures(_guildOwnerById, owners);
      _guildOwnerById = owners;
      _pruneRemovedGuilds(guilds.map((g) => g.id).toSet());
      _enqueueGuilds(ownerChanged, db, currentUserId);
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

    ref.listen<bool>(shellDataReadyProvider, (bool? prev, bool next) {
      if (!(prev ?? false) && next && !ref.read(gatewayReadyProvider)) {
        _requestSeed(db, currentUserId);
      }
    });

    if (ref.read(shellDataReadyProvider)) {
      _requestSeed(db, currentUserId);
    }

    ref.listen<int>(readStateOverlayVersionProvider, (int? prev, int next) {
      final batcher = ref.read(readStateWriteBatcherProvider);
      final Set<String> overlayIds = batcher.overlayChannelIds();
      final Set<String> released = _overlayChannelIds.difference(overlayIds);
      _overlayChannelIds = overlayIds;
      if (released.isNotEmpty) {
        final List<String> unresolved = <String>[];
        for (final String id in released) {
          final ReadState? persisted = batcher.persistedReadState(id);
          if (persisted == null) {
            unresolved.add(id);
            continue;
          }
          final ReadState? previous = _readStateSnapshot[id];
          _readStateSnapshot[id] = previous == null
              ? persisted
              : previous.copyWith(
                  lastMessageId: Value(persisted.lastMessageId),
                  mentionCount: persisted.mentionCount,
                  manual: persisted.manual,
                  stickyUnreadMessageId: Value(persisted.stickyUnreadMessageId),
                  lastPinTimestamp: Value(persisted.lastPinTimestamp),
                  version: Value(persisted.version),
                  flags: Value(persisted.flags),
                );
        }
        if (unresolved.isNotEmpty) {
          _pendingReadStateRefresh.addAll(unresolved);
          _enqueueChannels(unresolved, db, currentUserId, refreshLatest: true);
        }
        _enqueueChannels(
          released,
          db,
          currentUserId,
          refreshLatest: false,
          trustIndex: true,
        );
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
    _pendingSeedChannelIds.clear();
    final int permissionRevision = _permissionInputsRevision;
    final UnreadPermissionInputs permissionInputs =
        await loadUnreadPermissionInputs(db, currentUserId);
    final List<Server> guilds = permissionInputs.guilds;
    final int channelRevision = _channelRevision;
    final List<Channel> allChannels = await db.channelDao.getAllChannels(
      includeThreads: true,
    );
    if (channelRevision == _channelRevision) {
      _channelSnapshot = {for (final c in allChannels) c.id: c};
    }
    final int joinedThreadRevision = _joinedThreadRevision;
    final List<ThreadMember> joinedThreads = await db.threadDao
        .getJoinedMembers();
    if (joinedThreadRevision == _joinedThreadRevision) {
      _joinedThreadMembers = <String, ThreadMember>{
        for (final ThreadMember row in joinedThreads) row.threadId: row,
      };
    }
    final int readStateRevision = _readStateRevision;
    final List<ReadState> allReadStates = await db.readStateDao.getReadStates();
    if (readStateRevision == _readStateRevision) {
      _readStateSnapshot = {for (final r in allReadStates) r.channelId: r};
    }
    final int guildSettingsRevision = _guildSettingsRevision;
    final List<UserGuildSettingsTableData> allSettings = await db
        .userGuildSettingsDao
        .getAll();
    if (guildSettingsRevision == _guildSettingsRevision) {
      _updateGuildSettings(allSettings);
    }
    ref.read(channelLastMessageIndexProvider(readAccountUserId(ref))).seedAll(
      <String, String?>{
        for (final Channel c in _channelSnapshot.values) c.id: c.lastMessageId,
      },
    );
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
        _guildJoinedAtMs[guild.id] = permissionInputs
            .ownMemberByGuild[guild.id]
            ?.joinedAt
            ?.millisecondsSinceEpoch;
        _guildJoinedAtFetched.add(guild.id);
      }
    }

    final List<Channel> trackableChannels = <Channel>[
      for (final Channel channel in _channelSnapshot.values)
        if (_tracksUnread(channel.type)) channel,
    ];
    _rebuildChannelIdsByGuild();
    final ChannelUnreadPermissionSeedCache permissionCache =
        buildChannelUnreadPermissionSeedCache(
          currentUserId: currentUserId,
          channels: trackableChannels,
          inputs: permissionInputs,
          channelSnapshot: _channelSnapshot,
        );
    if (permissionRevision == _permissionInputsRevision) {
      _permissionSeedCache = permissionCache;
    }
    final Map<String, ChannelLatestMessageResolution> latestByChannel =
        await resolveLatestMessageIdsForChannelsBulk(db, trackableChannels);
    final ReadStateWriteBatcher batcher = ref.read(
      readStateWriteBatcherProvider,
    );
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
            readState: _effectiveReadState(channel.id, batcher),
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
      channelLastMessageIndexProvider(readAccountUserId(ref)),
    );
    if (_pendingReadStateRefresh.isNotEmpty) {
      final List<String> refreshIds = _pendingReadStateRefresh.toList();
      _pendingReadStateRefresh.clear();
      final Map<String, ReadState> rows = <String, ReadState>{
        for (final ReadState row in await db.readStateDao.getReadStatesFor(
          refreshIds,
        ))
          row.channelId: row,
      };
      for (final String id in refreshIds) {
        final ReadState? row = rows[id];
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
      final Map<String, Channel> toResolve = <String, Channel>{};
      for (final id in latestIds) {
        final channel = _channelSnapshot[id];
        if (channel != null && _tracksUnread(channel.type)) {
          if (_pendingTrustIndex.remove(id)) {
            trustedFromRefresh.add(id);
          } else {
            toResolve[id] = channel;
          }
        } else {
          _latestMessageIdByChannel.remove(id);
          _channelLastExistsInCacheByChannel.remove(id);
        }
      }
      if (toResolve.isNotEmpty) {
        final Map<String, Channel> fresh = <String, Channel>{
          for (final Channel row in await db.channelDao.getChannelsByIds(
            toResolve.keys.toList(),
          ))
            row.id: row,
        };
        final List<Channel> pointers = <Channel>[];
        for (final MapEntry<String, Channel> entry in toResolve.entries) {
          final Channel? row = fresh[entry.key];
          final Channel? current = _channelSnapshot[entry.key];
          if (row != null && current != null) {
            _channelSnapshot[entry.key] = current.copyWith(
              lastMessageId: Value(row.lastMessageId),
            );
          }
          pointers.add(row ?? entry.value);
        }
        final Map<String, ChannelLatestMessageResolution> resolved =
            await resolveLatestMessageIdsForChannelsBulk(db, pointers);
        for (final MapEntry<String, ChannelLatestMessageResolution> entry
            in resolved.entries) {
          _latestMessageIdByChannel[entry.key] = entry.value.id;
          _channelLastExistsInCacheByChannel[entry.key] =
              entry.value.existsInCache;
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
    final ChannelUnreadPermissionSeedCache permissionCache =
        await _permissionSeedCacheForRecompute(db, currentUserId);
    final ReadStateWriteBatcher batcher = ref.read(
      readStateWriteBatcherProvider,
    );
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
      final ChannelUnreadPermissionOutcome? permissionOutcome =
          permissionCache.byChannelId[id];
      final bool canRead;
      if (permissionOutcome != null && permissionOutcome.isDefinitive) {
        canRead = permissionOutcome.canRead;
      } else {
        canRead = await canReadChannelForUnread(
          database: db,
          channel: channel,
          currentUserId: currentUserId,
        );
      }
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
            readState: _effectiveReadState(channel.id, batcher),
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

  void _invalidatePermissionSeedCache() {
    _permissionSeedCache = null;
    _permissionInputsRevision++;
  }

  Future<ChannelUnreadPermissionSeedCache> _permissionSeedCacheForRecompute(
    FluxerDatabase db,
    String? currentUserId,
  ) async {
    final ChannelUnreadPermissionSeedCache? cached = _permissionSeedCache;
    if (cached != null) {
      return cached;
    }
    final int revision = _permissionInputsRevision;
    final UnreadPermissionInputs inputs = await loadUnreadPermissionInputs(
      db,
      currentUserId,
    );
    final ChannelUnreadPermissionSeedCache built =
        buildChannelUnreadPermissionSeedCache(
          currentUserId: currentUserId,
          channels: <Channel>[
            for (final Channel channel in _channelSnapshot.values)
              if (_tracksUnread(channel.type)) channel,
          ],
          inputs: inputs,
          channelSnapshot: _channelSnapshot,
        );
    if (revision == _permissionInputsRevision) {
      _permissionSeedCache = built;
    }
    return built;
  }

  void _clearCaches() {
    _invalidatePermissionSeedCache();
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

  ReadState? _effectiveReadState(
    String channelId,
    ReadStateWriteBatcher batcher,
  ) {
    final ReadState? persisted = _readStateSnapshot[channelId];
    if (!batcher.hasOverlay(channelId)) {
      return persisted;
    }
    final ReadStateEffectiveFields effective = batcher.effectiveFields(
      channelId,
      persisted,
    );
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

bool _permissionInputsChanged(
  Map<String, Channel> previous,
  Map<String, Channel> next,
) {
  if (previous.length != next.length) {
    return true;
  }
  for (final MapEntry<String, Channel> entry in next.entries) {
    final Channel? old = previous[entry.key];
    if (old == null ||
        old.guildId != entry.value.guildId ||
        old.type != entry.value.type ||
        old.parentId != entry.value.parentId ||
        old.permissionOverwritesJson != entry.value.permissionOverwritesJson) {
      return true;
    }
  }
  return false;
}

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
