import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart' as db;
import 'package:fluxer_app/features/members/domain/member_list_group_names.dart';
import 'package:fluxer_app/features/members/domain/member_list_layout.dart';
import 'package:fluxer_dart/gateway.dart';

void main() {
  group('resolveMemberListGroupName', () {
    test('returns online and offline labels', () {
      expect(
        resolveMemberListGroupName(
          groupId: 'online',
          rolesById: const <String, db.Role>{},
        ),
        'Online',
      );
      expect(
        resolveMemberListGroupName(
          groupId: 'offline',
          rolesById: const <String, db.Role>{},
        ),
        'Offline',
      );
    });

    test('returns role name when role is cached', () {
      const String roleId = '1473045383154057326';
      final Map<String, db.Role> rolesById = <String, db.Role>{
        roleId: const db.Role(
          id: roleId,
          guildId: 'guild',
          name: 'Moderator',
          color: 0xFF123456,
          position: 1,
          hoist: true,
          mentionable: false,
          permissions: '0',
        ),
      };
      expect(
        resolveMemberListGroupName(groupId: roleId, rolesById: rolesById),
        'Moderator',
      );
    });
  });

  group('resolveMemberHighestRoleColor', () {
    test('returns highest-position role with a non-zero color', () {
      const String lowRoleId = 'role-low';
      const String highRoleId = 'role-high';
      final Map<String, db.Role> rolesById = <String, db.Role>{
        lowRoleId: const db.Role(
          id: lowRoleId,
          guildId: 'guild',
          name: 'Member',
          color: 0xFF111111,
          position: 1,
          hoist: false,
          mentionable: false,
          permissions: '0',
        ),
        highRoleId: const db.Role(
          id: highRoleId,
          guildId: 'guild',
          name: 'Admin',
          color: 0x3498DB,
          position: 10,
          hoist: true,
          mentionable: true,
          permissions: '0',
        ),
      };
      expect(
        resolveMemberHighestRoleColor(
          roleIds: <String>[lowRoleId, highRoleId],
          rolesById: rolesById,
        ),
        0xFF3498DB,
      );
    });

    test('skips higher roles with zero color', () {
      const String highRoleId = 'role-high';
      const String lowRoleId = 'role-low';
      final Map<String, db.Role> rolesById = <String, db.Role>{
        highRoleId: const db.Role(
          id: highRoleId,
          guildId: 'guild',
          name: 'Admin',
          color: 0,
          position: 10,
          hoist: true,
          mentionable: true,
          permissions: '0',
        ),
        lowRoleId: const db.Role(
          id: lowRoleId,
          guildId: 'guild',
          name: 'Member',
          color: 0xFFABCDEF,
          position: 1,
          hoist: false,
          mentionable: false,
          permissions: '0',
        ),
      };
      expect(
        resolveMemberHighestRoleColor(
          roleIds: <String>[highRoleId, lowRoleId],
          rolesById: rolesById,
        ),
        0xFFABCDEF,
      );
    });

    test('returns null when no colored roles exist', () {
      const String roleId = 'role-id';
      final Map<String, db.Role> rolesById = <String, db.Role>{
        roleId: const db.Role(
          id: roleId,
          guildId: 'guild',
          name: 'Member',
          color: 0,
          position: 1,
          hoist: false,
          mentionable: false,
          permissions: '0',
        ),
      };
      expect(
        resolveMemberHighestRoleColor(
          roleIds: <String>[roleId],
          rolesById: rolesById,
        ),
        isNull,
      );
    });
  });

  group('resolveMemberListGroupHeader', () {
    test('resolves header from layout when group metadata is missing', () {
      const List<MemberListGroup> groups = <MemberListGroup>[
        MemberListGroup(id: 'online', count: 1),
      ];
      final List<MemberListGroupLayout> layouts =
          buildMemberListLayout(<MemberListGroup>[
            const MemberListGroup(id: '1473045383154057326', count: 2),
            const MemberListGroup(id: 'online', count: 1),
          ]);
      final Map<String, db.Role> rolesById = <String, db.Role>{
        '1473045383154057326': const db.Role(
          id: '1473045383154057326',
          guildId: 'guild',
          name: 'Admin',
          color: 0xFFABCDEF,
          position: 10,
          hoist: true,
          mentionable: true,
          permissions: '0',
        ),
      };
      final MemberListGroupHeaderData? header = resolveMemberListGroupHeader(
        groups: groups,
        layouts: layouts,
        rowIndex: 0,
        rolesById: rolesById,
      );
      expect(header, isNotNull);
      expect(header!.name, 'Admin');
      expect(header.count, 2);
    });
  });
}
