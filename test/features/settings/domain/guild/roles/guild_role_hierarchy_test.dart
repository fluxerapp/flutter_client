import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/permissions/permission.dart';
import 'package:fluxer_app/features/members/domain/member.dart';
import 'package:fluxer_app/features/settings/domain/guild/roles/guild_role_hierarchy.dart';

void main() {
  group('isGuildRoleLocked', () {
    const String guildId = 'guild-1';
    const MemberRole everyone = MemberRole(
      id: guildId,
      name: '@everyone',
      color: 0,
    );
    const MemberRole lowerRole = MemberRole(
      id: '100',
      name: 'Member',
      color: 0,
      position: 1,
    );
    const MemberRole higherRole = MemberRole(
      id: '200',
      name: 'Admin',
      color: 0,
      position: 5,
    );

    test('owner can edit any non-everyone role', () {
      expect(
        isGuildRoleLocked(
          role: higherRole,
          guildId: guildId,
          isGuildOwner: true,
          canManageRoles: true,
          currentUserHighestRole: lowerRole,
        ),
        isFalse,
      );
    });

    test('locked when target role is above viewer highest role', () {
      expect(
        isGuildRoleLocked(
          role: higherRole,
          guildId: guildId,
          isGuildOwner: false,
          canManageRoles: true,
          currentUserHighestRole: lowerRole,
        ),
        isTrue,
      );
    });

    test('locked when target is viewer highest role', () {
      expect(
        isGuildRoleLocked(
          role: lowerRole,
          guildId: guildId,
          isGuildOwner: false,
          canManageRoles: true,
          currentUserHighestRole: lowerRole,
        ),
        isTrue,
      );
    });

    test('locked when target outranks viewer at same position', () {
      const MemberRole viewerRole = MemberRole(
        id: '200',
        name: 'Moderator',
        color: 0,
        position: 5,
      );
      const MemberRole strongerRole = MemberRole(
        id: '100',
        name: 'Admin',
        color: 0,
        position: 5,
      );
      expect(
        isGuildRoleLocked(
          role: strongerRole,
          guildId: guildId,
          isGuildOwner: false,
          canManageRoles: true,
          currentUserHighestRole: viewerRole,
        ),
        isTrue,
      );
    });

    test('unlocked when target is below viewer at same position', () {
      const MemberRole viewerRole = MemberRole(
        id: '100',
        name: 'Admin',
        color: 0,
        position: 5,
      );
      const MemberRole weakerRole = MemberRole(
        id: '200',
        name: 'Moderator',
        color: 0,
        position: 5,
      );
      expect(
        isGuildRoleLocked(
          role: weakerRole,
          guildId: guildId,
          isGuildOwner: false,
          canManageRoles: true,
          currentUserHighestRole: viewerRole,
        ),
        isFalse,
      );
    });

    test('@everyone is never locked by hierarchy', () {
      expect(
        isGuildRoleLocked(
          role: everyone,
          guildId: guildId,
          isGuildOwner: false,
          canManageRoles: false,
          currentUserHighestRole: lowerRole,
        ),
        isFalse,
      );
    });
  });

  group('parseCurrentUserRoleIds', () {
    test('parses json role id arrays', () {
      expect(parseCurrentUserRoleIds('["200","100"]'), <String>{'200', '100'});
    });

    test('returns empty set for invalid json', () {
      expect(parseCurrentUserRoleIds('not-json'), isEmpty);
    });
  });

  group('resolveCurrentUserHighestRole', () {
    const String guildId = 'guild-1';
    final Map<String, MemberRole> rolesById = <String, MemberRole>{
      guildId: const MemberRole(id: guildId, name: '@everyone', color: 0),
      '100': const MemberRole(id: '100', name: 'Admin', color: 0, position: 5),
      '200': const MemberRole(id: '200', name: 'Mod', color: 0, position: 3),
    };

    test('ignores @everyone when resolving highest role', () {
      expect(
        resolveCurrentUserHighestRole(
          guildId: guildId,
          currentUserRoleIds: <String>{guildId, '200', '100'},
          rolesById: rolesById,
        ),
        rolesById['100'],
      );
    });
  });

  group('wouldRemoveOwnGuildRolePermission', () {
    const String guildId = 'guild-1';
    const String userId = 'user-1';
    final Map<String, MemberRole> rolesById = <String, MemberRole>{
      guildId: const MemberRole(id: guildId, name: '@everyone', color: 0),
      'role-1': MemberRole(
        id: 'role-1',
        name: 'Mod',
        color: 0,
        permissions: Permission.manageMessages.value,
      ),
    };

    test('returns false for guild owner', () {
      expect(
        wouldRemoveOwnGuildRolePermission(
          guildId: guildId,
          currentUserId: userId,
          isGuildOwner: true,
          currentUserRoleIds: <String>{'role-1'},
          rolesById: rolesById,
          roleId: 'role-1',
          permission: Permission.manageMessages,
        ),
        isFalse,
      );
    });

    test('returns true when revoking would remove permission from self', () {
      expect(
        wouldRemoveOwnGuildRolePermission(
          guildId: guildId,
          currentUserId: userId,
          isGuildOwner: false,
          currentUserRoleIds: <String>{'role-1'},
          rolesById: rolesById,
          roleId: 'role-1',
          permission: Permission.manageMessages,
        ),
        isTrue,
      );
    });
  });

  group('canGrantGuildRolePermission', () {
    test('owner can grant any permission', () {
      expect(
        canGrantGuildRolePermission(
          isGuildOwner: true,
          currentUserPermissions: 0,
          permission: Permission.administrator,
        ),
        isTrue,
      );
    });

    test('non-owner needs the permission themselves', () {
      expect(
        canGrantGuildRolePermission(
          isGuildOwner: false,
          currentUserPermissions: Permission.manageMessages.value,
          permission: Permission.manageMessages,
        ),
        isTrue,
      );
      expect(
        canGrantGuildRolePermission(
          isGuildOwner: false,
          currentUserPermissions: 0,
          permission: Permission.administrator,
        ),
        isFalse,
      );
    });
  });
}
