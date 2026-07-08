import 'dart:convert';

import 'package:fluxer_app/core/permissions/permission.dart';
import 'package:fluxer_app/features/members/domain/member.dart';
import 'package:fluxer_app/features/profile/utils/profile_menu_capabilities.dart';

bool isGuildRoleLocked({
  required MemberRole role,
  required String guildId,
  required bool isGuildOwner,
  required bool canManageRoles,
  required MemberRole? currentUserHighestRole,
}) {
  if (isGuildOwner) {
    return false;
  }
  if (role.isEveryoneRole(guildId)) {
    return false;
  }
  if (!canManageRoles) {
    return true;
  }
  if (currentUserHighestRole == null) {
    return true;
  }
  if (currentUserHighestRole.position > role.position) {
    return false;
  }
  if (currentUserHighestRole.position < role.position) {
    return true;
  }
  return BigInt.parse(currentUserHighestRole.id) >= BigInt.parse(role.id);
}

bool wouldRemoveOwnGuildRolePermission({
  required String guildId,
  required String currentUserId,
  required bool isGuildOwner,
  required Set<String> currentUserRoleIds,
  required Map<String, MemberRole> rolesById,
  required String roleId,
  required Permission permission,
}) {
  if (isGuildOwner) {
    return false;
  }
  final bool userHasRole =
      currentUserRoleIds.contains(roleId) || roleId == guildId;
  if (!userHasRole) {
    return false;
  }
  final MemberRole? role = rolesById[roleId];
  if (role == null) {
    return false;
  }
  if (!hasPermission(role.permissions, permission)) {
    return false;
  }
  int permissionsWithoutThisRole = rolesById[guildId]?.permissions ?? 0;
  for (final String memberRoleId in currentUserRoleIds) {
    if (memberRoleId == roleId) {
      continue;
    }
    final MemberRole? memberRole = rolesById[memberRoleId];
    if (memberRole != null) {
      permissionsWithoutThisRole |= memberRole.permissions;
    }
  }
  if (hasPermission(permissionsWithoutThisRole, Permission.administrator)) {
    return false;
  }
  return !hasPermission(permissionsWithoutThisRole, permission);
}

Set<String> parseCurrentUserRoleIds(String? roleIdsJson) {
  if (roleIdsJson == null || roleIdsJson.isEmpty) {
    return <String>{};
  }
  try {
    final Object? decoded = jsonDecode(roleIdsJson);
    if (decoded is List<dynamic>) {
      return decoded
          .whereType<String>()
          .map((String id) => id.trim())
          .where((String id) => id.isNotEmpty)
          .toSet();
    }
  } on Object {
    // Fall through to empty set.
  }
  return <String>{};
}

MemberRole? resolveCurrentUserHighestRole({
  required String guildId,
  required Set<String> currentUserRoleIds,
  required Map<String, MemberRole> rolesById,
}) {
  final List<MemberRole> memberRoles = currentUserRoleIds
      .where((String roleId) => roleId != guildId)
      .map((String roleId) => rolesById[roleId])
      .whereType<MemberRole>()
      .toList();
  return highestRole(memberRoles);
}

int computeCurrentUserGuildPermissions({
  required String guildId,
  required Set<String> currentUserRoleIds,
  required Map<String, MemberRole> rolesById,
}) {
  int permissions = rolesById[guildId]?.permissions ?? 0;
  for (final String roleId in currentUserRoleIds) {
    final MemberRole? role = rolesById[roleId];
    if (role != null) {
      permissions |= role.permissions;
    }
  }
  return permissions;
}

bool canGrantGuildRolePermission({
  required bool isGuildOwner,
  required int currentUserPermissions,
  required Permission permission,
}) {
  if (isGuildOwner) {
    return true;
  }
  return hasPermission(currentUserPermissions, permission);
}
