import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/permissions/permission.dart';
import 'package:fluxer_app/features/members/domain/member.dart';
import 'package:fluxer_app/features/profile/utils/profile_menu_capabilities.dart';

MemberRole _role(String id, int position, {int permissions = 0}) {
  return MemberRole(
    id: id,
    name: 'role-$id',
    color: 0,
    position: position,
    permissions: permissions,
  );
}

int _perms(List<Permission> perms) {
  var value = 0;
  for (final Permission permission in perms) {
    value |= permission.value;
  }
  return value;
}

void main() {
  group('highestRole', () {
    test('returns null for an empty list', () {
      expect(highestRole(const <MemberRole>[]), isNull);
    });

    test('returns the highest-positioned role', () {
      final low = _role('10', 1);
      final high = _role('20', 5);
      expect(highestRole(<MemberRole>[low, high]), same(high));
    });

    test('breaks position ties with the smaller snowflake id', () {
      final larger = _role('200', 3);
      final smaller = _role('100', 3);
      expect(highestRole(<MemberRole>[larger, smaller]), same(smaller));
    });
  });

  group('canManageTarget', () {
    const owner = '1';
    const viewer = '2';
    const target = '3';

    test('the guild owner can manage anyone', () {
      expect(
        canManageTarget(
          currentUserId: owner,
          ownerId: owner,
          viewerHighest: null,
          targetHighest: _role('50', 9),
          targetIsOwner: false,
        ),
        isTrue,
      );
    });

    test('nobody can manage the owner', () {
      expect(
        canManageTarget(
          currentUserId: viewer,
          ownerId: target,
          viewerHighest: _role('50', 9),
          targetHighest: _role('60', 8),
          targetIsOwner: true,
        ),
        isFalse,
      );
    });

    test('a viewer with no roles manages no one', () {
      expect(
        canManageTarget(
          currentUserId: viewer,
          ownerId: owner,
          viewerHighest: null,
          targetHighest: null,
          targetIsOwner: false,
        ),
        isFalse,
      );
    });

    test('a target with no roles is managed by anyone with a role', () {
      expect(
        canManageTarget(
          currentUserId: viewer,
          ownerId: owner,
          viewerHighest: _role('50', 1),
          targetHighest: null,
          targetIsOwner: false,
        ),
        isTrue,
      );
    });

    test('a higher role position outranks a lower one', () {
      expect(
        canManageTarget(
          currentUserId: viewer,
          ownerId: owner,
          viewerHighest: _role('50', 5),
          targetHighest: _role('60', 3),
          targetIsOwner: false,
        ),
        isTrue,
      );
      expect(
        canManageTarget(
          currentUserId: viewer,
          ownerId: owner,
          viewerHighest: _role('50', 3),
          targetHighest: _role('60', 5),
          targetIsOwner: false,
        ),
        isFalse,
      );
    });

    test('equal positions are broken by the lower snowflake id', () {
      expect(
        canManageTarget(
          currentUserId: viewer,
          ownerId: owner,
          viewerHighest: _role('100', 4),
          targetHighest: _role('200', 4),
          targetIsOwner: false,
        ),
        isTrue,
      );
      expect(
        canManageTarget(
          currentUserId: viewer,
          ownerId: owner,
          viewerHighest: _role('200', 4),
          targetHighest: _role('100', 4),
          targetIsOwner: false,
        ),
        isFalse,
      );
    });
  });

  group('resolveProfileMenuCapabilities', () {
    test('a non-manager sees no guild actions', () {
      final caps = resolveProfileMenuCapabilities(
        isCurrentUser: false,
        hasGuildMember: true,
        targetIsTimedOut: false,
        targetIsBot: false,
        viewerIsOwner: false,
        viewerPermissions: _perms(<Permission>[
          Permission.kickMembers,
          Permission.banMembers,
          Permission.moderateMembers,
        ]),
        canManageTarget: false,
        targetHasAdministrator: false,
        hasAssignableRoles: false,
      );
      expect(caps.canKick, isFalse);
      expect(caps.canBan, isFalse);
      expect(caps.showTimeout, isFalse);
      expect(caps.showRemoveTimeout, isFalse);
      expect(caps.canTransfer, isFalse);
    });

    test('an owner sees kick, ban, timeout, transfer, and nickname', () {
      final caps = resolveProfileMenuCapabilities(
        isCurrentUser: false,
        hasGuildMember: true,
        targetIsTimedOut: false,
        targetIsBot: false,
        viewerIsOwner: true,
        viewerPermissions: allPermissions,
        canManageTarget: true,
        targetHasAdministrator: false,
        hasAssignableRoles: false,
      );
      expect(caps.canKick, isTrue);
      expect(caps.canBan, isTrue);
      expect(caps.showTimeout, isTrue);
      expect(caps.showRemoveTimeout, isFalse);
      expect(caps.canTransfer, isTrue);
      expect(caps.canChangeNickname, isTrue);
    });

    test('timeout is suppressed when the target has administrator', () {
      final caps = resolveProfileMenuCapabilities(
        isCurrentUser: false,
        hasGuildMember: true,
        targetIsTimedOut: false,
        targetIsBot: false,
        viewerIsOwner: true,
        viewerPermissions: allPermissions,
        canManageTarget: true,
        targetHasAdministrator: true,
        hasAssignableRoles: false,
      );
      expect(caps.showTimeout, isFalse);
      expect(caps.showRemoveTimeout, isFalse);
      // Kick and ban are unaffected by the target's administrator bit.
      expect(caps.canKick, isTrue);
      expect(caps.canBan, isTrue);
    });

    test('timeout vs remove-timeout flips on the timed-out state', () {
      final active = resolveProfileMenuCapabilities(
        isCurrentUser: false,
        hasGuildMember: true,
        targetIsTimedOut: false,
        targetIsBot: false,
        viewerIsOwner: false,
        viewerPermissions: _perms(<Permission>[Permission.moderateMembers]),
        canManageTarget: true,
        targetHasAdministrator: false,
        hasAssignableRoles: false,
      );
      final timedOut = resolveProfileMenuCapabilities(
        isCurrentUser: false,
        hasGuildMember: true,
        targetIsTimedOut: true,
        targetIsBot: false,
        viewerIsOwner: false,
        viewerPermissions: _perms(<Permission>[Permission.moderateMembers]),
        canManageTarget: true,
        targetHasAdministrator: false,
        hasAssignableRoles: false,
      );
      expect(active.showTimeout, isTrue);
      expect(active.showRemoveTimeout, isFalse);
      expect(timedOut.showTimeout, isFalse);
      expect(timedOut.showRemoveTimeout, isTrue);
    });

    test('ban needs no member row but kick and timeout do', () {
      final caps = resolveProfileMenuCapabilities(
        isCurrentUser: false,
        hasGuildMember: false,
        targetIsTimedOut: false,
        targetIsBot: false,
        viewerIsOwner: false,
        viewerPermissions: _perms(<Permission>[
          Permission.kickMembers,
          Permission.banMembers,
          Permission.moderateMembers,
        ]),
        canManageTarget: true,
        targetHasAdministrator: false,
        hasAssignableRoles: false,
      );
      expect(caps.canBan, isTrue);
      expect(caps.canKick, isFalse);
      expect(caps.showTimeout, isFalse);
    });

    test('self renames only with permission and when not timed out', () {
      final active = resolveProfileMenuCapabilities(
        isCurrentUser: true,
        hasGuildMember: true,
        targetIsTimedOut: false,
        targetIsBot: false,
        viewerIsOwner: false,
        viewerPermissions: _perms(<Permission>[Permission.changeNickname]),
        canManageTarget: false,
        targetHasAdministrator: false,
        hasAssignableRoles: false,
      );
      final timedOut = resolveProfileMenuCapabilities(
        isCurrentUser: true,
        hasGuildMember: true,
        targetIsTimedOut: true,
        targetIsBot: false,
        viewerIsOwner: false,
        viewerPermissions: _perms(<Permission>[Permission.changeNickname]),
        canManageTarget: false,
        targetHasAdministrator: false,
        hasAssignableRoles: false,
      );
      expect(active.canChangeNickname, isTrue);
      expect(timedOut.canChangeNickname, isFalse);
    });

    test('renaming another member needs manageNicknames and hierarchy', () {
      final withHierarchy = resolveProfileMenuCapabilities(
        isCurrentUser: false,
        hasGuildMember: true,
        targetIsTimedOut: false,
        targetIsBot: false,
        viewerIsOwner: false,
        viewerPermissions: _perms(<Permission>[Permission.manageNicknames]),
        canManageTarget: true,
        targetHasAdministrator: false,
        hasAssignableRoles: false,
      );
      expect(withHierarchy.canChangeNickname, isTrue);

      final withoutHierarchy = resolveProfileMenuCapabilities(
        isCurrentUser: false,
        hasGuildMember: true,
        targetIsTimedOut: false,
        targetIsBot: false,
        viewerIsOwner: false,
        viewerPermissions: _perms(<Permission>[Permission.manageNicknames]),
        canManageTarget: false,
        targetHasAdministrator: false,
        hasAssignableRoles: false,
      );
      expect(withoutHierarchy.canChangeNickname, isFalse);
    });

    test('ownership cannot be transferred to a bot or to oneself', () {
      final toBot = resolveProfileMenuCapabilities(
        isCurrentUser: false,
        hasGuildMember: true,
        targetIsTimedOut: false,
        targetIsBot: true,
        viewerIsOwner: true,
        viewerPermissions: allPermissions,
        canManageTarget: true,
        targetHasAdministrator: false,
        hasAssignableRoles: false,
      );
      expect(toBot.canTransfer, isFalse);

      final toSelf = resolveProfileMenuCapabilities(
        isCurrentUser: true,
        hasGuildMember: true,
        targetIsTimedOut: false,
        targetIsBot: false,
        viewerIsOwner: true,
        viewerPermissions: allPermissions,
        canManageTarget: true,
        targetHasAdministrator: false,
        hasAssignableRoles: false,
      );
      expect(toSelf.canTransfer, isFalse);
    });

    test('transfer requires owning the guild', () {
      final caps = resolveProfileMenuCapabilities(
        isCurrentUser: false,
        hasGuildMember: true,
        targetIsTimedOut: false,
        targetIsBot: false,
        viewerIsOwner: false,
        viewerPermissions: allPermissions,
        canManageTarget: true,
        targetHasAdministrator: false,
        hasAssignableRoles: false,
      );
      expect(caps.canTransfer, isFalse);
    });
  });
}
