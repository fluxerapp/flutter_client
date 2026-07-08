import 'package:fluxer_app/core/database/fluxer_database.dart' as db;
import 'package:fluxer_app/features/chat/utils/composer_mention_query.dart';
import 'package:fluxer_app/features/members/data/member_repository.dart';
import 'package:fluxer_app/features/members/domain/member.dart';
import 'package:fluxer_app/features/members/providers/guild_member_chunk_waiter.dart';
import 'package:fluxer_dart/gateway.dart';

const Duration kGuildMentionGatewayFetchDedup = Duration(milliseconds: 750);

class GuildMentionMemberSearch {
  GuildMentionMemberSearch({
    required MemberRepository memberRepository,
    required GuildMemberChunkWaiter chunkWaiter,
    required GatewayConnection gateway,
    required db.FluxerDatabase database,
  }) : _memberRepository = memberRepository,
       _chunkWaiter = chunkWaiter,
       _gateway = gateway,
       _database = database;

  final MemberRepository _memberRepository;
  final GuildMemberChunkWaiter _chunkWaiter;
  final GatewayConnection _gateway;
  final db.FluxerDatabase _database;
  final Map<String, DateTime> _lastGatewayFetchAt = <String, DateTime>{};

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
    final List<Member> cached = await _memberRepository
        .getCachedMembersForGuild(guildId);
    List<Member> remote = const <Member>[];
    if (!_shouldDedupGatewayFetch(guildId, trimmed)) {
      _recordGatewayFetch(guildId, trimmed);
      final int requestId = _chunkWaiter.beginRequest(guildId);
      try {
        _gateway.requestGuildMembers(
          guildId: guildId,
          query: trimmed,
          limit: kMentionMemberSearchLimit,
        );
        await _chunkWaiter.waitForChunk(guildId, requestId: requestId);
        final List<String> scopeUserIds = _chunkWaiter.lastChunkUserIds(
          guildId,
        );
        remote = await _memberRepository.searchMembersForAutocomplete(
          guildId: guildId,
          query: trimmed,
          scopeUserIds: scopeUserIds,
        );
      } on Object {
        remote = const <Member>[];
      }
    }
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
