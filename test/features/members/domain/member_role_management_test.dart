import 'package:fluxer_app/features/members/domain/member.dart';
import 'package:fluxer_app/features/members/domain/member_role_management.dart';
import 'package:test/test.dart';

MemberRole role({required String id, int position = 0}) {
  return MemberRole(id: id, name: 'Role $id', color: 0, position: position);
}

void main() {
  group('shouldShowMemberRolesSection', () {
    test('hidden when no roles and viewer cannot manage', () {
      expect(
        shouldShowMemberRolesSection(
          memberRoles: const <MemberRole>[],
          canManageRoles: false,
        ),
        isFalse,
      );
    });

    test('shown when viewer can manage roles', () {
      expect(
        shouldShowMemberRolesSection(
          memberRoles: const <MemberRole>[],
          canManageRoles: true,
        ),
        isTrue,
      );
    });
  });

  group('shouldShowRolesSubmenu', () {
    test('hidden when guild has no assignable roles', () {
      expect(
        shouldShowRolesSubmenu(
          hasAssignableRoles: false,
          canManageRoles: true,
          memberHasRoles: true,
        ),
        isFalse,
      );
    });

    test('shown for read-only viewers when member has roles', () {
      expect(
        shouldShowRolesSubmenu(
          hasAssignableRoles: true,
          canManageRoles: false,
          memberHasRoles: true,
        ),
        isTrue,
      );
    });
  });

  group('resolveMemberRolesFromIds', () {
    test('sorts roles by position', () {
      final Map<String, MemberRole> roleById = <String, MemberRole>{
        '1': role(id: '1', position: 1),
        '2': role(id: '2', position: 3),
        '3': role(id: '3', position: 2),
      };

      expect(
        resolveMemberRolesFromIds(
          roleIds: <String>['1', '2', '3'],
          roleById: roleById,
        ).map((MemberRole role) => role.id),
        <String>['2', '3', '1'],
      );
    });
  });

  group('canManageMemberRole', () {
    const String guildId = '1';

    test('guild owner can manage any role', () {
      expect(
        canManageMemberRole(
          role: role(id: '9', position: 99),
          guildId: guildId,
          isGuildOwner: true,
          canManageRoles: true,
          viewerHighestRole: role(id: '2', position: 1),
        ),
        isTrue,
      );
    });

    test('viewer cannot manage equal or higher roles', () {
      // Equal positions break by snowflake: the LOWER id outranks (pinned by
      // guild_role_hierarchy_test and profile_menu_capabilities_test), so an
      // equal-position role with a lower id sits above this viewer.
      expect(
        canManageMemberRole(
          role: role(id: '2', position: 5),
          guildId: guildId,
          isGuildOwner: false,
          canManageRoles: true,
          viewerHighestRole: role(id: '3', position: 5),
        ),
        isFalse,
      );
    });
  });
}
