import 'package:fluxer_app/core/permissions/permission.dart';
import 'package:fluxer_app/features/members/domain/member.dart';

/// Capabilities that gate the guild-scoped items in the user-profile
/// "more actions" menu.
///
/// Mirrors the web `resolveGuildModerationCapabilities` +
/// `resolveGuildScopedModerationActionKeys`
/// (`features/guild/utils/GuildModerationCapabilityUtils.ts`) combined with the
/// nickname/transfer gating in `UserProfileActionsSheet.tsx`.
class ProfileMenuCapabilities {
  const ProfileMenuCapabilities({
    required this.canChangeNickname,
    required this.canTransfer,
    required this.showTimeout,
    required this.showRemoveTimeout,
    required this.canKick,
    required this.canBan,
    required this.showManageRoles,
  });

  /// Whether the "Change nickname" item is shown.
  final bool canChangeNickname;

  /// Whether the "Transfer ownership" item is shown.
  final bool canTransfer;

  /// Whether the "Timeout" item is shown (mod can timeout, target not already
  /// timed out).
  final bool showTimeout;

  /// Whether the "Remove timeout" item is shown (mod can timeout, target
  /// currently timed out).
  final bool showRemoveTimeout;

  /// Whether the "Kick" item is shown.
  final bool canKick;

  /// Whether the "Ban" item is shown.
  final bool canBan;

  /// Whether the "Manage roles" item is shown.
  final bool showManageRoles;

  static const ProfileMenuCapabilities none = ProfileMenuCapabilities(
    canChangeNickname: false,
    canTransfer: false,
    showTimeout: false,
    showRemoveTimeout: false,
    canKick: false,
    canBan: false,
    showManageRoles: false,
  );
}

/// Highest-authority role from [roles]: maximum [MemberRole.position], ties
/// broken by smallest snowflake id. Returns null for an empty list.
///
/// Mirrors web `PermissionUtils.getHighestRole` (sort descending position, then
/// ascending id, take first). Callers must exclude the `@everyone` role, which
/// is never part of a member's role list on the web.
MemberRole? highestRole(List<MemberRole> roles) {
  MemberRole? highest;
  for (final MemberRole role in roles) {
    if (highest == null ||
        role.position > highest.position ||
        (role.position == highest.position &&
            BigInt.parse(role.id) < BigInt.parse(highest.id))) {
      highest = role;
    }
  }
  return highest;
}

/// Whether [currentUserId] outranks the target and may moderate them.
///
/// Mirrors web `useRoleHierarchy.canManageTarget`: the owner manages everyone;
/// nobody manages the owner; a viewer with no roles manages no one; a target
/// with no roles is managed by anyone with a role; otherwise the higher role
/// position wins, ties broken by the lower snowflake id.
bool canManageTarget({
  required String currentUserId,
  required String? ownerId,
  required MemberRole? viewerHighest,
  required MemberRole? targetHighest,
  required bool targetIsOwner,
}) {
  if (ownerId != null && ownerId == currentUserId) {
    return true;
  }
  if (targetIsOwner) {
    return false;
  }
  if (viewerHighest == null) {
    return false;
  }
  if (targetHighest == null) {
    return true;
  }
  if (viewerHighest.position != targetHighest.position) {
    return viewerHighest.position > targetHighest.position;
  }
  return BigInt.parse(viewerHighest.id) < BigInt.parse(targetHighest.id);
}

/// Resolves the profile menu's guild-scoped capabilities from already-resolved
/// permission bits and the role-hierarchy decision.
ProfileMenuCapabilities resolveProfileMenuCapabilities({
  required bool isCurrentUser,
  required bool hasGuildMember,
  required bool targetIsTimedOut,
  required bool targetIsBot,
  required bool viewerIsOwner,
  required int viewerPermissions,
  required bool canManageTarget,
  required bool targetHasAdministrator,
  required bool hasAssignableRoles,
}) {
  final bool mod = !isCurrentUser && canManageTarget;

  // Ban is guild-scoped: it does not require an active membership row (you can
  // ban someone who already left). Kick and timeout require a member.
  final bool canKick =
      mod &&
      hasGuildMember &&
      hasPermission(viewerPermissions, Permission.kickMembers);
  final bool canBan =
      mod && hasPermission(viewerPermissions, Permission.banMembers);
  final bool canTimeout =
      mod &&
      hasGuildMember &&
      hasPermission(viewerPermissions, Permission.moderateMembers) &&
      !targetHasAdministrator;

  final bool canChangeNickname =
      hasGuildMember &&
      ((isCurrentUser &&
              hasPermission(viewerPermissions, Permission.changeNickname) &&
              !targetIsTimedOut) ||
          (hasPermission(viewerPermissions, Permission.manageNicknames) &&
              canManageTarget));

  final bool canTransfer =
      !isCurrentUser && !targetIsBot && viewerIsOwner && hasGuildMember;

  return ProfileMenuCapabilities(
    canChangeNickname: canChangeNickname,
    canTransfer: canTransfer,
    showTimeout: canTimeout && !targetIsTimedOut,
    showRemoveTimeout: canTimeout && targetIsTimedOut,
    canKick: canKick,
    canBan: canBan,
    showManageRoles:
        hasGuildMember &&
        hasAssignableRoles &&
        hasPermission(viewerPermissions, Permission.manageRoles),
  );
}
