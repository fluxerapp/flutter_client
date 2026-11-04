import 'package:fluxer_app/features/members/domain/member.dart';
import 'package:fluxer_app/shared/utils/display_name.dart';

const int kMentionMemberSearchLimit = 25;
const int kMentionResultLimit = 10;

class ParsedMentionQuery {
  const ParsedMentionQuery({
    required this.usernameQuery,
    required this.tagQuery,
    required this.hasTagSeparator,
  });

  final String usernameQuery;
  final String? tagQuery;
  final bool hasTagSeparator;
}

ParsedMentionQuery parseMentionQuery(String query) {
  final int hashIndex = query.indexOf('#');
  if (hashIndex == -1) {
    return ParsedMentionQuery(
      usernameQuery: query,
      tagQuery: null,
      hasTagSeparator: false,
    );
  }
  return ParsedMentionQuery(
    usernameQuery: query.substring(0, hashIndex),
    tagQuery: query.substring(hashIndex + 1),
    hasTagSeparator: true,
  );
}

String memberDisplayLabel(Member member, {String? friendNickname}) =>
    resolveDisplayName(
      guildNickname: member.nickname,
      friendNickname: friendNickname,
      globalName: member.globalName,
      username: member.username,
    );

class MemberMentionSearchFields {
  const MemberMentionSearchFields({
    required this.displayLabel,
    required this.guildNickname,
    required this.friendNickname,
    required this.accountGlobalName,
    required this.username,
    required this.tag,
  });

  final String displayLabel;
  final String guildNickname;
  final String friendNickname;
  final String accountGlobalName;
  final String username;
  final String tag;
}

MemberMentionSearchFields memberMentionSearchFields(
  Member member, {
  String? friendNickname,
  String? discriminator,
}) {
  final String disc = discriminator ?? '0';
  final String? tag = disc.isNotEmpty && disc != '0'
      ? '${member.username}#$disc'
      : null;
  return MemberMentionSearchFields(
    displayLabel: memberDisplayLabel(member, friendNickname: friendNickname),
    guildNickname: member.nickname ?? '',
    friendNickname: friendNickname ?? '',
    accountGlobalName: member.globalName ?? '',
    username: member.username,
    tag: tag ?? '',
  );
}

enum MentionMatchRank {
  noMatch(0),
  fuzzy(1),
  acronym(2),
  contains(3),
  wordStartsWith(4),
  startsWith(5),
  equal(6),
  caseSensitiveEqual(7);

  const MentionMatchRank(this.score);
  final int score;
}

MentionMatchRank _matchRankForValue(String query, String value) {
  if (value.isEmpty) {
    return MentionMatchRank.noMatch;
  }
  if (query.length > value.length) {
    return MentionMatchRank.noMatch;
  }
  if (value == query) {
    return MentionMatchRank.caseSensitiveEqual;
  }
  final String valueLower = value.toLowerCase();
  final String queryLower = query.toLowerCase();
  if (valueLower == queryLower) {
    return MentionMatchRank.equal;
  }
  if (valueLower.startsWith(queryLower)) {
    return MentionMatchRank.startsWith;
  }
  if (valueLower.contains(' $queryLower')) {
    return MentionMatchRank.wordStartsWith;
  }
  if (valueLower.contains(queryLower)) {
    return MentionMatchRank.contains;
  }
  if (queryLower.length == 1) {
    return MentionMatchRank.noMatch;
  }
  if (_acronym(valueLower).contains(queryLower)) {
    return MentionMatchRank.acronym;
  }
  if (_isSubsequence(queryLower, valueLower)) {
    return MentionMatchRank.fuzzy;
  }
  return MentionMatchRank.noMatch;
}

String _acronym(String value) {
  final StringBuffer buffer = StringBuffer();
  for (final String word in value.split(' ')) {
    if (word.isNotEmpty) {
      buffer.write(word[0]);
    }
    for (final String part in word.split('-')) {
      if (part.isNotEmpty) {
        buffer.write(part[0]);
      }
    }
  }
  return buffer.toString();
}

bool _isSubsequence(String query, String value) {
  int queryIndex = 0;
  for (int i = 0; i < value.length && queryIndex < query.length; i++) {
    if (value[i] == query[queryIndex]) {
      queryIndex++;
    }
  }
  return queryIndex == query.length;
}

MentionMatchRank mentionMatchRankForMember(
  Member member,
  String query, {
  String? friendNickname,
  String? discriminator,
}) {
  final MemberMentionSearchFields fields = memberMentionSearchFields(
    member,
    friendNickname: friendNickname,
    discriminator: discriminator,
  );
  MentionMatchRank best = MentionMatchRank.noMatch;
  for (final String key in <String>[
    fields.displayLabel,
    fields.guildNickname,
    fields.friendNickname,
    fields.accountGlobalName,
    fields.username,
    fields.tag,
  ]) {
    final MentionMatchRank rank = _matchRankForValue(query, key);
    if (rank.score > best.score) {
      best = rank;
    }
  }
  return best;
}

bool memberMatchesMentionQuery(
  Member member,
  ParsedMentionQuery parsed,
  String? discriminator, {
  String? friendNickname,
}) {
  final String trimmedUsername = parsed.usernameQuery.trim();
  final String disc = discriminator ?? '0';
  if (parsed.hasTagSeparator) {
    final String uq = parsed.usernameQuery.toLowerCase();
    final String tq = (parsed.tagQuery ?? '').toLowerCase();
    final MemberMentionSearchFields fields = memberMentionSearchFields(
      member,
      friendNickname: friendNickname,
      discriminator: discriminator,
    );
    final bool matchesUsername =
        uq.isEmpty ||
        fields.username.toLowerCase().startsWith(uq) ||
        fields.accountGlobalName.toLowerCase().startsWith(uq) ||
        fields.guildNickname.toLowerCase().startsWith(uq) ||
        fields.friendNickname.toLowerCase().startsWith(uq) ||
        fields.displayLabel.toLowerCase().startsWith(uq);
    final bool matchesTag = tq.isEmpty || disc.toLowerCase().startsWith(tq);
    return matchesUsername && matchesTag;
  }
  if (trimmedUsername.isEmpty) {
    return true;
  }
  return mentionMatchRankForMember(
        member,
        trimmedUsername.toLowerCase(),
        friendNickname: friendNickname,
        discriminator: disc,
      ).score >=
      MentionMatchRank.fuzzy.score;
}

bool memberMentionHaystackContainsQuery(
  Member member,
  String queryLower, {
  String? friendNickname,
  String? discriminator,
}) {
  if (queryLower.isEmpty) {
    return true;
  }
  return mentionMatchRankForMember(
        member,
        queryLower,
        friendNickname: friendNickname,
        discriminator: discriminator,
      ).score >=
      MentionMatchRank.contains.score;
}

class MentionAutocompleteSession {
  MentionAutocompleteSession({required this.sessionKey});

  final String sessionKey;
  final Map<String, int> _order = <String, int>{};
  int _nextRank = 0;

  int rankFor(String userId) {
    return _order.putIfAbsent(userId, () => _nextRank++);
  }

  void recordMembers(Iterable<Member> members) {
    for (final Member member in members) {
      rankFor(member.id);
    }
  }
}

List<Member> rankMembersForMentionQuery(
  List<Member> members,
  ParsedMentionQuery parsed, {
  required int limit,
  Map<String, String>? discriminatorByUserId,
  Set<String>? prioritizeMemberIds,
  Map<String, String?> friendNicknameById = const <String, String?>{},
  MentionAutocompleteSession? stableSession,
}) {
  final String trimmed = parsed.usernameQuery.trim();
  final bool ranksByMatch = trimmed.isNotEmpty && !parsed.hasTagSeparator;
  final String q = trimmed.toLowerCase();
  final Set<String> prefer = prioritizeMemberIds ?? const <String>{};
  final List<_RankedMember> filtered = <_RankedMember>[];
  for (final Member member in members) {
    final String? friendNickname = friendNicknameById[member.id];
    final String? discriminator = discriminatorByUserId?[member.id];
    int score = 0;
    if (ranksByMatch) {
      score = mentionMatchRankForMember(
        member,
        q,
        friendNickname: friendNickname,
        discriminator: discriminator ?? '0',
      ).score;
      if (score < MentionMatchRank.fuzzy.score) {
        continue;
      }
    } else if (!memberMatchesMentionQuery(
      member,
      parsed,
      discriminator,
      friendNickname: friendNickname,
    )) {
      continue;
    }
    filtered.add(
      _RankedMember(
        member: member,
        preferred: prefer.contains(member.id),
        score: score,
        sessionRank: stableSession?.rankFor(member.id) ?? 0,
        labelLower: memberDisplayLabel(
          member,
          friendNickname: friendNickname,
        ).toLowerCase(),
      ),
    );
  }
  filtered.sort((_RankedMember a, _RankedMember b) {
    if (a.preferred != b.preferred) {
      return a.preferred ? -1 : 1;
    }
    if (a.score != b.score) {
      return b.score.compareTo(a.score);
    }
    if (a.sessionRank != b.sessionRank) {
      return a.sessionRank.compareTo(b.sessionRank);
    }
    return a.labelLower.compareTo(b.labelLower);
  });
  return <Member>[
    for (final _RankedMember ranked in filtered.take(limit)) ranked.member,
  ];
}

class _RankedMember {
  const _RankedMember({
    required this.member,
    required this.preferred,
    required this.score,
    required this.sessionRank,
    required this.labelLower,
  });

  final Member member;
  final bool preferred;
  final int score;
  final int sessionRank;
  final String labelLower;
}

List<Member> filterGuildMembersForAutocomplete({
  required List<Member> members,
  required ParsedMentionQuery parsed,
  required int limit,
  Map<String, String>? discriminatorByUserId,
  Set<String>? prioritizeMemberIds,
  Map<String, String?> friendNicknameById = const <String, String?>{},
  MentionAutocompleteSession? stableSession,
}) {
  stableSession?.recordMembers(members);
  return rankMembersForMentionQuery(
    members,
    parsed,
    limit: limit,
    discriminatorByUserId: discriminatorByUserId,
    prioritizeMemberIds: prioritizeMemberIds,
    friendNicknameById: friendNicknameById,
    stableSession: stableSession,
  );
}

class RoleMentionSearchTarget {
  const RoleMentionSearchTarget({
    required this.id,
    required this.name,
    required this.position,
    required this.mentionable,
  });

  final String id;
  final String name;
  final int position;
  final bool mentionable;
}

bool roleNameMatchesMentionQuery(String roleName, String query) {
  final String trimmed = query.trim().toLowerCase();
  if (trimmed.isEmpty) {
    return true;
  }
  return roleName.toLowerCase().contains(trimmed);
}

MentionMatchRank mentionMatchRankForRoleName(String roleName, String query) {
  final String trimmed = query.trim();
  if (trimmed.isEmpty) {
    return MentionMatchRank.equal;
  }
  return _matchRankForValue(trimmed.toLowerCase(), roleName);
}

List<RoleMentionSearchTarget> rankRolesForMentionQuery(
  List<RoleMentionSearchTarget> roles, {
  required String guildId,
  required String query,
  required bool canMentionEveryone,
  int limit = kMentionResultLimit,
}) {
  final String trimmed = query.trim();
  final String q = trimmed.toLowerCase();
  final List<({RoleMentionSearchTarget role, MentionMatchRank rank})>
  candidates = <({RoleMentionSearchTarget role, MentionMatchRank rank})>[];
  for (final RoleMentionSearchTarget role in roles) {
    if (role.id == guildId) {
      continue;
    }
    if (!(canMentionEveryone || role.mentionable)) {
      continue;
    }
    if (q.isNotEmpty && !roleNameMatchesMentionQuery(role.name, q)) {
      continue;
    }
    final MentionMatchRank rank = mentionMatchRankForRoleName(role.name, q);
    candidates.add((role: role, rank: rank));
  }
  candidates.sort((
    ({RoleMentionSearchTarget role, MentionMatchRank rank}) a,
    ({RoleMentionSearchTarget role, MentionMatchRank rank}) b,
  ) {
    if (q.isNotEmpty && a.rank.score != b.rank.score) {
      return b.rank.score.compareTo(a.rank.score);
    }
    return b.role.position.compareTo(a.role.position);
  });
  if (candidates.length <= limit) {
    return candidates.map((e) => e.role).toList();
  }
  return candidates.take(limit).map((e) => e.role).toList();
}
