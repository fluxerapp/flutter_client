import 'package:flutter_test/flutter_test.dart';

import 'package:fluxer_app/core/permissions/channel_permission_resolver.dart';
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

    test('bypassesSlowmode needs the bypass slowmode bit', () {
      expect(bypassesSlowmode(Permission.bypassSlowmode.value), isTrue);
      expect(bypassesSlowmode(allPermissions), isTrue);
      expect(bypassesSlowmode(Permission.administrator.value), isFalse);
      expect(bypassesSlowmode(Permission.sendMessages.value), isFalse);
    });
  });

  group('guild MFA restriction', () {
    final MemberRole modRole = MemberRole(
      id: 'mod',
      name: 'Mod',
      color: 0,
      permissions:
          Permission.manageRoles.value |
          Permission.kickMembers.value |
          Permission.sendMessages.value,
    );

    test('restricts only when elevated, not owner, and user lacks MFA', () {
      expect(
        isGuildMfaRestricted(
          guildMfaLevel: guildMfaLevelElevated,
          isGuildOwner: false,
          userLacksMfa: true,
        ),
        isTrue,
      );
      expect(
        isGuildMfaRestricted(
          guildMfaLevel: 0,
          isGuildOwner: false,
          userLacksMfa: true,
        ),
        isFalse,
      );
      expect(
        isGuildMfaRestricted(
          guildMfaLevel: guildMfaLevelElevated,
          isGuildOwner: true,
          userLacksMfa: true,
        ),
        isFalse,
      );
      expect(
        isGuildMfaRestricted(
          guildMfaLevel: guildMfaLevelElevated,
          isGuildOwner: false,
          userLacksMfa: false,
        ),
        isFalse,
      );
    });

    test('strips elevated guild permissions and keeps the rest', () {
      final int result = resolveGuildPermissions(
        guildOwnerId: 'owner',
        currentUserId: 'user1',
        everyonePermissions: Permission.viewChannel.value,
        memberRoles: <MemberRole>[modRole],
        guildMfaRestricted: true,
      );
      expect(hasPermission(result, Permission.manageRoles), isFalse);
      expect(hasPermission(result, Permission.kickMembers), isFalse);
      expect(hasPermission(result, Permission.sendMessages), isTrue);
      expect(hasPermission(result, Permission.viewChannel), isTrue);
    });

    test('strips elevated permissions from administrators', () {
      final int result = resolveGuildPermissions(
        guildOwnerId: 'owner',
        currentUserId: 'user1',
        everyonePermissions: 0,
        memberRoles: <MemberRole>[
          MemberRole(
            id: 'admin',
            name: 'Admin',
            color: 0,
            permissions: Permission.administrator.value,
          ),
        ],
        guildMfaRestricted: true,
      );
      expect(result & elevatedPermissions, 0);
      expect(hasPermission(result, Permission.sendMessages), isTrue);
    });

    test('owner keeps all permissions', () {
      final int result = resolveGuildPermissions(
        guildOwnerId: 'user1',
        currentUserId: 'user1',
        everyonePermissions: 0,
        memberRoles: const <MemberRole>[],
        guildMfaRestricted: true,
      );
      expect(result, allPermissions);
    });

    test('channel overwrites cannot grant elevated permissions back', () {
      final int result = evaluateChannelPermissionBitsWithOverwrites(
        guildOwnerId: 'owner',
        guildId: 'guild',
        currentUserId: 'user1',
        everyonePermissions: Permission.viewChannel.value,
        memberRoles: <MemberRole>[modRole],
        memberRecordPresent: true,
        overwriteLayersRootToLeaf: <List<ChannelOverwriteEntry>>[
          <ChannelOverwriteEntry>[
            ChannelOverwriteEntry(
              id: 'user1',
              isRoleType: false,
              allow: BigInt.from(Permission.manageMessages.value),
              deny: BigInt.zero,
            ),
          ],
        ],
        guildMfaRestricted: true,
      );
      expect(hasPermission(result, Permission.manageMessages), isFalse);
      expect(hasPermission(result, Permission.manageRoles), isFalse);
      expect(hasPermission(result, Permission.sendMessages), isTrue);
    });
  });
}
