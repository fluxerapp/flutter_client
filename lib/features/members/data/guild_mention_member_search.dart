import 'package:fluxer_app/core/database/fluxer_database.dart' as db;
import 'package:fluxer_app/features/chat/utils/composer_mention_query.dart';
import 'package:fluxer_app/features/members/data/member_repository.dart';
import 'package:fluxer_app/features/members/domain/member.dart';
import 'package:fluxer_app/features/members/providers/guild_member_chunk_waiter.dart';
import 'package:fluxer_dart/gateway.dart';

const Duration kGuildMentionGatewayFetchDedup = Duration(milliseconds: 750);

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

  Future<List<Member>> searchCached({
    required String guildId,
    required ParsedMentionQuery parsed,
    Map<String, String>? discriminatorByUserId,
    Map<String, String?> friendNicknameById = const <String, String?>{},
    MentionAutocompleteSession? stableSession,
  }) async {
    final List<Member> cached = await _memberRepository
        .getCachedMembersForGuild(guildId);
    final Map<String, String> discriminators =
        discriminatorByUserId ?? await discriminatorsFor(cached);
    return filterGuildMembersForAutocomplete(
      members: cached,
      parsed: parsed,
      limit: kMentionMemberSearchLimit,
      discriminatorByUserId: discriminators,
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
    final List<Member> cached = await _memberRepository
        .getCachedMembersForGuild(guildId);
    final Set<String> remoteMemberIds = <String>{
      for (final Member member in remote) member.id,
    };
    final List<Member> merged = unionMembers(remote, cached);
    final Map<String, String> discriminators =
        discriminatorByUserId ?? await discriminatorsFor(merged);
    final List<Member> ranked = filterGuildMembersForAutocomplete(
      members: merged,
      parsed: parsed,
      limit: kMentionMemberSearchLimit,
      discriminatorByUserId: discriminators,
      prioritizeMemberIds: remoteMemberIds,
      friendNicknameById: friendNicknameById,
      stableSession: stableSession,
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
      assert(removed == null || identical(removed, fetch));
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
