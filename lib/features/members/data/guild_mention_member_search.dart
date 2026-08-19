import 'dart:async';

import 'package:fluxer_app/core/database/fluxer_database.dart' as db;
import 'package:fluxer_app/features/chat/utils/composer_mention_query.dart';
import 'package:fluxer_app/features/members/data/member_repository.dart';
import 'package:fluxer_app/features/members/domain/member.dart';
import 'package:fluxer_app/features/members/providers/guild_member_chunk_waiter.dart';
import 'package:fluxer_dart/gateway.dart';

const Duration kGuildMentionGatewayFetchDedup = Duration(milliseconds: 750);
const Duration kGuildMentionGatewayDebounce = Duration(milliseconds: 300);

class GuildMentionSnapshot {
  GuildMentionSnapshot({
    required this.guildId,
    required this.members,
    required this.discriminators,
  });

  final String guildId;
  final List<Member> members;
  final Map<String, String> discriminators;
}

class GuildMentionMemberSearch {
  GuildMentionMemberSearch({
    required this._memberRepository,
    required this._chunkWaiter,
    required this._gateway,
    required this._database,
  });

  final MemberRepository _memberRepository;
  final GuildMemberChunkWaiter _chunkWaiter;
  final GatewayConnection _gateway;
  final db.FluxerDatabase _database;
  final Map<String, DateTime> _lastGatewayFetchAt = <String, DateTime>{};
  final Map<String, Future<void>> _inFlightGatewayFetches =
      <String, Future<void>>{};
  final Map<String, GuildMentionSnapshot> _snapshots =
      <String, GuildMentionSnapshot>{};
  final Map<String, Future<GuildMentionSnapshot>> _snapshotLoads =
      <String, Future<GuildMentionSnapshot>>{};
  final Map<String, Timer> _gatewayDebounceTimers = <String, Timer>{};
  final Map<String, String> _pendingGatewayQueries = <String, String>{};
  final Map<String, Set<String>> _remoteMemberIdsByGuild =
      <String, Set<String>>{};

  Set<String> remoteMemberIdsFor(String guildId) {
    return _remoteMemberIdsByGuild[guildId] ?? const <String>{};
  }

  void invalidateSnapshot(String guildId) {
    _snapshots.remove(guildId);
  }

  Future<GuildMentionSnapshot> ensureSnapshot(String guildId) async {
    final GuildMentionSnapshot? cached = _snapshots[guildId];
    if (cached != null) {
      return cached;
    }
    final Future<GuildMentionSnapshot>? inFlight = _snapshotLoads[guildId];
    if (inFlight != null) {
      return inFlight;
    }
    final Future<GuildMentionSnapshot> load = _loadSnapshot(guildId);
    _snapshotLoads[guildId] = load;
    try {
      final GuildMentionSnapshot snapshot = await load;
      _snapshots[guildId] = snapshot;
      return snapshot;
    } finally {
      final Future<GuildMentionSnapshot>? removed = _snapshotLoads.remove(
        guildId,
      );
      if (removed != null) {
        unawaited(removed);
      }
    }
  }

  Future<GuildMentionSnapshot> refreshSnapshot(String guildId) {
    invalidateSnapshot(guildId);
    return ensureSnapshot(guildId);
  }

  Future<GuildMentionSnapshot> _loadSnapshot(String guildId) async {
    final List<Member> members = await _memberRepository
        .getCachedMembersForGuild(guildId);
    final Map<String, String> discriminators = await discriminatorsFor(members);
    return GuildMentionSnapshot(
      guildId: guildId,
      members: members,
      discriminators: discriminators,
    );
  }

  List<Member> filterSnapshotMembers({
    required GuildMentionSnapshot snapshot,
    required ParsedMentionQuery parsed,
    required int limit,
    Map<String, String?> friendNicknameById = const <String, String?>{},
    MentionAutocompleteSession? stableSession,
    Set<String>? prioritizeMemberIds,
  }) {
    return filterGuildMembersForAutocomplete(
      members: snapshot.members,
      parsed: parsed,
      limit: limit,
      discriminatorByUserId: snapshot.discriminators,
      friendNicknameById: friendNicknameById,
      stableSession: stableSession,
      prioritizeMemberIds: prioritizeMemberIds,
    );
  }

  void cancelGatewaySearch(String guildId) {
    _gatewayDebounceTimers.remove(guildId)?.cancel();
    _pendingGatewayQueries.remove(guildId);
    _remoteMemberIdsByGuild.remove(guildId);
  }

  void scheduleGatewaySearch({
    required String guildId,
    required String query,
    required void Function() onComplete,
  }) {
    final String trimmed = query.trim();
    _pendingGatewayQueries[guildId] = trimmed;
    _gatewayDebounceTimers.remove(guildId)?.cancel();
    if (trimmed.isEmpty) {
      _remoteMemberIdsByGuild.remove(guildId);
      return;
    }
    _gatewayDebounceTimers[guildId] = Timer(kGuildMentionGatewayDebounce, () {
      unawaited(
        _runDebouncedGatewaySearch(guildId: guildId, onComplete: onComplete),
      );
    });
  }

  Future<void> _runDebouncedGatewaySearch({
    required String guildId,
    required void Function() onComplete,
  }) async {
    _gatewayDebounceTimers.remove(guildId);
    final String query = (_pendingGatewayQueries[guildId] ?? '').trim();
    if (query.isEmpty) {
      return;
    }
    if (!await shouldFetchFromGateway(guildId, query)) {
      return;
    }
    await _ensureGatewaySearch(guildId, query);
    final List<String> scopeUserIds = _chunkWaiter.lastChunkUserIds(guildId);
    _remoteMemberIdsByGuild[guildId] = scopeUserIds.toSet();
    await refreshSnapshot(guildId);
    onComplete();
  }

  Future<List<Member>> searchCached({
    required String guildId,
    required ParsedMentionQuery parsed,
    Map<String, String>? discriminatorByUserId,
    Map<String, String?> friendNicknameById = const <String, String?>{},
    MentionAutocompleteSession? stableSession,
  }) async {
    final GuildMentionSnapshot snapshot = await ensureSnapshot(guildId);
    if (discriminatorByUserId != null) {
      return filterGuildMembersForAutocomplete(
        members: snapshot.members,
        parsed: parsed,
        limit: kMentionMemberSearchLimit,
        discriminatorByUserId: discriminatorByUserId,
        friendNicknameById: friendNicknameById,
        stableSession: stableSession,
      );
    }
    return filterSnapshotMembers(
      snapshot: snapshot,
      parsed: parsed,
      limit: kMentionMemberSearchLimit,
      friendNicknameById: friendNicknameById,
      stableSession: stableSession,
    );
  }

  Future<bool> shouldFetchFromGateway(String guildId, String query) async {
    final String trimmed = query.trim();
    if (trimmed.isEmpty) {
      return false;
    }
    if (await _memberRepository.isGuildMemberCacheComplete(guildId)) {
      return false;
    }
    return true;
  }

  bool _shouldDedupGatewayFetch(String guildId, String query) {
    final String key = '$guildId:$query';
    final DateTime? last = _lastGatewayFetchAt[key];
    if (last == null) {
      return false;
    }
    return DateTime.now().difference(last) < kGuildMentionGatewayFetchDedup;
  }

  void _recordGatewayFetch(String guildId, String query) {
    _lastGatewayFetchAt['$guildId:$query'] = DateTime.now();
  }

  Future<({List<Member> members, Set<String> remoteMemberIds})>
  fetchGatewayAndMerge({
    required String guildId,
    required String query,
    required ParsedMentionQuery parsed,
    Map<String, String>? discriminatorByUserId,
    Map<String, String?> friendNicknameById = const <String, String?>{},
    MentionAutocompleteSession? stableSession,
  }) async {
    final String trimmed = query.trim();
    if (trimmed.isEmpty) {
      final List<Member> cached = await searchCached(
        guildId: guildId,
        parsed: parsed,
        discriminatorByUserId: discriminatorByUserId,
        friendNicknameById: friendNicknameById,
        stableSession: stableSession,
      );
      return (members: cached, remoteMemberIds: const <String>{});
    }
    await _ensureGatewaySearch(guildId, trimmed);
    final List<String> scopeUserIds = _chunkWaiter.lastChunkUserIds(guildId);
    final List<Member> remote = scopeUserIds.isEmpty
        ? const <Member>[]
        : await _memberRepository.searchMembersForAutocomplete(
            guildId: guildId,
            query: trimmed,
            scopeUserIds: scopeUserIds,
          );
    final Set<String> remoteMemberIds = <String>{
      for (final Member member in remote) member.id,
    };
    _remoteMemberIdsByGuild[guildId] = remoteMemberIds;
    final GuildMentionSnapshot snapshot = await refreshSnapshot(guildId);
    final List<Member> ranked = filterSnapshotMembers(
      snapshot: snapshot,
      parsed: parsed,
      limit: kMentionMemberSearchLimit,
      friendNicknameById: friendNicknameById,
      stableSession: stableSession,
      prioritizeMemberIds: remoteMemberIds,
    );
    return (members: ranked, remoteMemberIds: remoteMemberIds);
  }

  Future<({List<Member> members, Set<String> remoteMemberIds})>
  searchCachedThenGateway({
    required String guildId,
    required String query,
    required ParsedMentionQuery parsed,
    Map<String, String>? discriminatorByUserId,
    Map<String, String?> friendNicknameById = const <String, String?>{},
    MentionAutocompleteSession? stableSession,
  }) async {
    if (!await shouldFetchFromGateway(guildId, query)) {
      final List<Member> cached = await searchCached(
        guildId: guildId,
        parsed: parsed,
        discriminatorByUserId: discriminatorByUserId,
        friendNicknameById: friendNicknameById,
        stableSession: stableSession,
      );
      return (members: cached, remoteMemberIds: const <String>{});
    }
    return fetchGatewayAndMerge(
      guildId: guildId,
      query: query,
      parsed: parsed,
      discriminatorByUserId: discriminatorByUserId,
      friendNicknameById: friendNicknameById,
      stableSession: stableSession,
    );
  }

  Future<List<Member>> cachedMembersAfterGatewayQueries({
    required String guildId,
    required Iterable<String> queries,
  }) async {
    for (final String query in queries) {
      final String trimmed = query.trim();
      if (trimmed.isEmpty ||
          trimmed.toLowerCase() == '@me' ||
          trimmed.toLowerCase() == 'everyone' ||
          trimmed.toLowerCase() == 'here') {
        continue;
      }
      if (RegExp(r'^\d{17,20}$').hasMatch(trimmed)) {
        continue;
      }
      if (!await shouldFetchFromGateway(guildId, trimmed)) {
        continue;
      }
      await _ensureGatewaySearch(guildId, trimmed);
    }
    return _memberRepository.getCachedMembersForGuild(guildId);
  }

  Future<void> _ensureGatewaySearch(String guildId, String query) async {
    if (!await shouldFetchFromGateway(guildId, query)) {
      return;
    }
    final String key = '$guildId:$query';
    final Future<void>? inFlight = _inFlightGatewayFetches[key];
    if (inFlight != null) {
      await inFlight;
      return;
    }
    if (_shouldDedupGatewayFetch(guildId, query)) {
      return;
    }
    final Future<void> fetch = _requestGuildMembers(guildId, query);
    _inFlightGatewayFetches[key] = fetch;
    try {
      await fetch;
    } finally {
      final Future<void>? removed = _inFlightGatewayFetches.remove(key);
      assert(
        removed == null || identical(removed, fetch),
        'in-flight gateway fetch map was corrupted',
      );
    }
  }

  Future<void> _requestGuildMembers(String guildId, String query) async {
    _recordGatewayFetch(guildId, query);
    final int requestId = _chunkWaiter.beginRequest(guildId);
    try {
      _gateway.requestGuildMembers(
        guildId: guildId,
        query: query,
        limit: kMentionMemberSearchLimit,
        nonce: GuildMemberChunkWaiter.nonceFor(requestId),
      );
      await _chunkWaiter.waitForChunk(guildId, requestId: requestId);
    } on Object {
      return;
    }
  }

  Future<Map<String, String>> discriminatorsFor(List<Member> members) async {
    if (members.isEmpty) {
      return const <String, String>{};
    }
    final List<String> ids = members.map((Member m) => m.id).toList();
    final List<db.User> users = await _database.userDao.getUsersByIds(ids);
    return <String, String>{
      for (final db.User u in users) u.id: u.discriminator,
    };
  }
}
