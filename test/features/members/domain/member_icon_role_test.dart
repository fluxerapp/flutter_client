import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart' as db;
import 'package:fluxer_app/features/members/domain/member.dart';

void main() {
  group('resolveMemberIconRoleFromRoles', () {
    test('returns highest-position role with an icon', () {
      const MemberRole low = MemberRole(
        id: '100',
        name: 'Member',
        color: 0,
        position: 1,
        unicodeEmoji: '🎉',
      );
      const MemberRole high = MemberRole(
        id: '200',
        name: 'Mod',
        color: 0,
        position: 10,
        unicodeEmoji: '🛡️',
      );
      expect(
        resolveMemberIconRoleFromRoles(<MemberRole>[low, high])?.id,
        '200',
      );
    });

    test('skips roles without icons', () {
      const MemberRole withIcon = MemberRole(
        id: '100',
        name: 'Mod',
        color: 0,
        position: 2,
        unicodeEmoji: '🛡️',
      );
      const MemberRole withoutIcon = MemberRole(
        id: '200',
        name: 'Admin',
        color: 0,
        position: 10,
      );
      expect(
        resolveMemberIconRoleFromRoles(<MemberRole>[withoutIcon, withIcon])?.id,
        '100',
      );
    });

    test('uses role id as tiebreaker at equal position', () {
      const MemberRole lowerId = MemberRole(
        id: '100',
        name: 'A',
        color: 0,
        position: 5,
        unicodeEmoji: '⭐',
      );
      const MemberRole higherId = MemberRole(
        id: '200',
        name: 'B',
        color: 0,
        position: 5,
        unicodeEmoji: '🌙',
      );
      expect(
        resolveMemberIconRoleFromRoles(<MemberRole>[
          higherId,
          lowerId,
        ])?.unicodeEmoji,
        '⭐',
      );
    });
  });

  group('resolveMemberIconRole', () {
    test('maps role ids through the guild role cache', () {
      const String roleId = '300';
      final Map<String, db.Role> rolesById = <String, db.Role>{
        roleId: const db.Role(
          id: roleId,
          guildId: 'guild',
          name: 'VIP',
          color: 0,
          position: 3,
          hoist: false,
          mentionable: false,
          permissions: '0',
          unicodeEmoji: '💎',
        ),
      };
      expect(
        resolveMemberIconRole(
          roleIds: <String>[roleId],
          rolesById: rolesById,
        )?.name,
        'VIP',
      );
    });
  });

  group('Member.iconRole', () {
    test('matches resolveMemberIconRoleFromRoles', () {
      const Member member = Member(
        id: 'user',
        username: 'user',
        roles: <MemberRole>[
          MemberRole(id: '1', name: 'A', color: 0, position: 1),
          MemberRole(
            id: '2',
            name: 'B',
            color: 0,
            position: 5,
            unicodeEmoji: '🔥',
          ),
        ],
      );
      expect(member.iconRole, resolveMemberIconRoleFromRoles(member.roles));
    });
  });
}
