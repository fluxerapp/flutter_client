import 'package:flutter_test/flutter_test.dart';

import 'package:fluxer_app/core/permissions/permission.dart';
import 'package:fluxer_app/core/permissions/permission_resolver.dart';
import 'package:fluxer_app/features/members/domain/member.dart';

void main() {
  group('PermissionResolver', () {
    test('owner gets all permissions', () {
      final result = resolveGuildPermissions(
        guildOwnerId: 'user1',
        currentUserId: 'user1',
        everyonePermissions: 0,
        memberRoles: const [],
      );
      expect(result, equals(allPermissions));
    });

    test('administrator role gets all permissions', () {
      final result = resolveGuildPermissions(
        guildOwnerId: 'owner',
        currentUserId: 'user1',
        everyonePermissions: 0,
        memberRoles: const [
          MemberRole(id: 'role1', name: 'Admin', color: 0, permissions: 1 << 3),
        ],
      );
      expect(result, equals(allPermissions));
    });

    test('unions permissions from multiple roles', () {
      final result = resolveGuildPermissions(
        guildOwnerId: 'owner',
        currentUserId: 'user1',
        everyonePermissions: Permission.viewChannel.value,
        memberRoles: [
          MemberRole(
            id: 'role1',
            name: 'Mod',
            color: 0,
            permissions: Permission.manageMessages.value,
          ),
          MemberRole(
            id: 'role2',
            name: 'Helper',
            color: 0,
            permissions: Permission.kickMembers.value,
          ),
        ],
      );
      expect(hasPermission(result, Permission.viewChannel), isTrue);
      expect(hasPermission(result, Permission.manageMessages), isTrue);
      expect(hasPermission(result, Permission.kickMembers), isTrue);
      expect(hasPermission(result, Permission.manageGuild), isFalse);
    });

    test('everyone permissions are included as base', () {
      final result = resolveGuildPermissions(
        guildOwnerId: 'owner',
        currentUserId: 'user1',
        everyonePermissions:
            Permission.sendMessages.value | Permission.viewChannel.value,
        memberRoles: const [],
      );
      expect(hasPermission(result, Permission.sendMessages), isTrue);
      expect(hasPermission(result, Permission.viewChannel), isTrue);
      expect(hasPermission(result, Permission.manageGuild), isFalse);
    });

    test('non-owner non-admin gets only assigned permissions', () {
      final result = resolveGuildPermissions(
        guildOwnerId: 'owner',
        currentUserId: 'user1',
        everyonePermissions: 0,
        memberRoles: const [
          MemberRole(
            id: 'role1',
            name: 'Custom',
            color: 0,
            permissions: 1 << 5,
          ),
        ],
      );
      expect(hasPermission(result, Permission.manageGuild), isTrue);
      expect(hasPermission(result, Permission.administrator), isFalse);
    });

    test('bypassesSlowmode includes administrator and bypass permission', () {
      expect(bypassesSlowmode(Permission.bypassSlowmode.value), isTrue);
      expect(bypassesSlowmode(Permission.administrator.value), isTrue);
      expect(bypassesSlowmode(Permission.sendMessages.value), isFalse);
    });
  });
}
