import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/chat/utils/composer_mention_query.dart';
import 'package:fluxer_app/features/members/domain/member.dart';

Member _member({
  required String id,
  required String username,
  String? globalName,
  String? nickname,
}) {
  return Member(
    id: id,
    username: username,
    globalName: globalName,
    nickname: nickname,
  );
}

void main() {
  group('memberMatchesMentionQuery', () {
    final Member alice = _member(
      id: '1',
      username: 'alice123',
      globalName: 'Alice',
      nickname: 'Admin',
    );

    test('matches guild nick', () {
      expect(
        memberMatchesMentionQuery(alice, parseMentionQuery('adm'), '0'),
        isTrue,
      );
    });

    test('matches account global name when guild nick is set', () {
      expect(
        memberMatchesMentionQuery(alice, parseMentionQuery('ali'), '0'),
        isTrue,
      );
    });

    test('matches username', () {
      expect(
        memberMatchesMentionQuery(alice, parseMentionQuery('alice'), '0'),
        isTrue,
      );
    });

    test('matches tag prefix with hash separator', () {
      expect(
        memberMatchesMentionQuery(alice, parseMentionQuery('ali#12'), '1234'),
        isTrue,
      );
    });

    test('does not match unrelated queries', () {
      expect(
        memberMatchesMentionQuery(alice, parseMentionQuery('nobody'), '0'),
        isFalse,
      );
    });
  });

  group('rankMembersForMentionQuery', () {
    test('ranks display prefix above username contains', () {
      final Member byNick = _member(
        id: '1',
        username: 'zzz',
        globalName: 'Zed',
        nickname: 'Alice',
      );
      final Member byUsername = _member(
        id: '2',
        username: 'alice_user',
        globalName: 'Other',
      );
      final List<Member> ranked = rankMembersForMentionQuery(
        <Member>[byUsername, byNick],
        parseMentionQuery('ali'),
        limit: 10,
      );
      expect(ranked.first.id, '1');
    });

    test('stable session preserves first-seen order on ties', () {
      final MentionAutocompleteSession session = MentionAutocompleteSession(
        sessionKey: 'g:ali',
      );
      final Member a = _member(
        id: '1',
        username: 'alice_a',
        globalName: 'Alice',
      );
      final Member b = _member(
        id: '2',
        username: 'alice_b',
        globalName: 'Alice',
      );
      session.recordMembers(<Member>[b, a]);
      final List<Member> ranked = rankMembersForMentionQuery(
        <Member>[a, b],
        parseMentionQuery(''),
        limit: 10,
        stableSession: session,
      );
      expect(ranked.map((Member m) => m.id).toList(), <String>['2', '1']);
    });
  });

  group('unionMembers', () {
    test('prefers remote members and appends cache-only members', () {
      final Member remote = _member(id: '1', username: 'remote');
      final Member cachedOnly = _member(id: '2', username: 'cached');
      final Member shared = _member(id: '3', username: 'shared');
      final List<Member> merged = unionMembers(
        <Member>[remote, shared],
        <Member>[shared, cachedOnly],
      );
      expect(merged.map((Member m) => m.id).toList(), <String>['1', '3', '2']);
    });
  });

  group('rankRolesForMentionQuery', () {
    const List<RoleMentionSearchTarget> roles = <RoleMentionSearchTarget>[
      RoleMentionSearchTarget(
        id: 'guild-1',
        name: 'everyone',
        position: 0,
        mentionable: false,
      ),
      RoleMentionSearchTarget(
        id: 'role-mod',
        name: 'Moderators',
        position: 5,
        mentionable: true,
      ),
      RoleMentionSearchTarget(
        id: 'role-dev',
        name: 'Developers',
        position: 10,
        mentionable: true,
      ),
    ];

    test('filters out the everyone role and non-mentionable roles', () {
      final List<RoleMentionSearchTarget> ranked = rankRolesForMentionQuery(
        roles,
        guildId: 'guild-1',
        query: '',
        canMentionEveryone: false,
      );
      expect(ranked.map((RoleMentionSearchTarget r) => r.id).toList(), <String>[
        'role-dev',
        'role-mod',
      ]);
    });

    test('ranks prefix matches above contains matches', () {
      final List<RoleMentionSearchTarget> ranked = rankRolesForMentionQuery(
        roles,
        guildId: 'guild-1',
        query: 'mod',
        canMentionEveryone: false,
      );
      expect(ranked.single.id, 'role-mod');
    });

    test('matches multi-word role names while typing spaces', () {
      final List<RoleMentionSearchTarget> ranked = rankRolesForMentionQuery(
        const <RoleMentionSearchTarget>[
          RoleMentionSearchTarget(
            id: 'role-android',
            name: 'Android Alpha',
            position: 5,
            mentionable: true,
          ),
        ],
        guildId: 'guild-1',
        query: 'android alpha',
        canMentionEveryone: false,
      );
      expect(ranked.single.name, 'Android Alpha');
    });

    test('matches role names with contains semantics', () {
      expect(roleNameMatchesMentionQuery('Android Alpha', 'android'), isTrue);
      expect(roleNameMatchesMentionQuery('Android Alpha', 'alpha'), isTrue);
      expect(roleNameMatchesMentionQuery('Moderator', 'mod'), isTrue);
      expect(roleNameMatchesMentionQuery('Moderator', 'android'), isFalse);
      expect(roleNameMatchesMentionQuery('Reaction Roles', 'nobody'), isFalse);
    });
  });

  group('shouldPromoteRoleMentionMatches', () {
    test('promotes when role prefix beats weak member match', () {
      expect(
        shouldPromoteRoleMentionMatches(
          query: 'mod',
          bestRoleRank: MentionMatchRank.startsWith,
          bestMemberRank: MentionMatchRank.fuzzy,
        ),
        isTrue,
      );
    });

    test('promotes when member has a stronger exact match', () {
      expect(
        shouldPromoteRoleMentionMatches(
          query: 'android',
          bestRoleRank: MentionMatchRank.startsWith,
          bestMemberRank: MentionMatchRank.equal,
        ),
        isTrue,
      );
    });

    test('does not promote when role does not match query', () {
      expect(
        shouldPromoteRoleMentionMatches(
          query: 'android',
          bestRoleRank: MentionMatchRank.noMatch,
          bestMemberRank: MentionMatchRank.equal,
        ),
        isFalse,
      );
    });

    test('does not promote when query is empty', () {
      expect(
        shouldPromoteRoleMentionMatches(
          query: '',
          bestRoleRank: MentionMatchRank.startsWith,
          bestMemberRank: MentionMatchRank.fuzzy,
        ),
        isFalse,
      );
    });
  });
}
