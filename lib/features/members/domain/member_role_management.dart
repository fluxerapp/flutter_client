import 'package:fluxer_app/features/members/domain/member.dart';
import 'package:fluxer_app/features/settings/domain/guild/roles/guild_role_hierarchy.dart';

bool canManageMemberRole({
  required MemberRole role,
  required String guildId,
  required bool isGuildOwner,
  required bool canManageRoles,
  required MemberRole? viewerHighestRole,
}) {
  return !isGuildRoleLocked(
    role: role,
    guildId: guildId,
    isGuildOwner: isGuildOwner,
    canManageRoles: canManageRoles,
    currentUserHighestRole: viewerHighestRole,
  );
}

List<MemberRole> resolveAssignableRoles({
  required String guildId,
  required List<MemberRole> allGuildRoles,
}) {
  return sortRolesByPosition(
    allGuildRoles
        .where((MemberRole role) => !role.isEveryoneRole(guildId))
        .toList(growable: false),
  );
}

bool guildHasAssignableRoles({
  required String guildId,
  required List<MemberRole> allGuildRoles,
}) {
  return allGuildRoles.any((MemberRole role) => !role.isEveryoneRole(guildId));
}

bool shouldShowMemberRolesSection({
  required List<MemberRole> memberRoles,
  required bool canManageRoles,
}) {
  return memberRoles.isNotEmpty || canManageRoles;
}

List<MemberRole> resolveMemberRolesFromIds({
  required List<String> roleIds,
  required Map<String, MemberRole> roleById,
}) {
  return sortRolesByPosition(
    roleIds
        .where(roleById.containsKey)
        .map((String roleId) => roleById[roleId]!)
        .toList(growable: false),
  );
}

bool shouldShowRolesSubmenu({
  required bool hasAssignableRoles,
  required bool canManageRoles,
  required bool memberHasRoles,
}) {
  return hasAssignableRoles && (canManageRoles || memberHasRoles);
}
