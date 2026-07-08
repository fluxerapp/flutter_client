import 'package:fluxer_app/features/members/domain/member.dart';

enum GuildRoleReorderPosition { before, after }

class GuildRoleMoveOperation {
  const GuildRoleMoveOperation({
    required this.roleId,
    required this.precedingRoleId,
  });

  final String roleId;
  final String? precedingRoleId;
}

class GuildRoleMovePreview {
  const GuildRoleMovePreview({required this.order, required this.operation});

  final List<MemberRole> order;
  final GuildRoleMoveOperation operation;
}

GuildRoleMovePreview? createGuildRoleMovePreview({
  required List<MemberRole> roles,
  required String guildId,
  required String draggedRoleId,
  required String? targetRoleId,
  required GuildRoleReorderPosition position,
  required bool Function(MemberRole role) isRoleLocked,
}) {
  if (draggedRoleId == targetRoleId) {
    return null;
  }
  final MemberRole? draggedRole = roles
      .where((MemberRole role) => role.id == draggedRoleId)
      .firstOrNull;
  if (draggedRole == null) {
    return null;
  }
  if (draggedRole.isEveryoneRole(guildId)) {
    return null;
  }
  if (isRoleLocked(draggedRole)) {
    return null;
  }
  if (targetRoleId == null) {
    final int draggedIndex = roles.indexWhere(
      (MemberRole role) => role.id == draggedRoleId,
    );
    if (draggedIndex == -1 || draggedIndex == 0) {
      return null;
    }
    for (int index = 0; index < draggedIndex; index++) {
      final MemberRole role = roles[index];
      if (role.id == draggedRoleId) {
        continue;
      }
      if (isRoleLocked(role)) {
        return null;
      }
    }
    final List<MemberRole> remaining = roles
        .where((MemberRole role) => role.id != draggedRoleId)
        .toList();
    remaining.insert(0, draggedRole);
    return GuildRoleMovePreview(
      order: remaining,
      operation: GuildRoleMoveOperation(
        roleId: draggedRoleId,
        precedingRoleId: null,
      ),
    );
  }
  final MemberRole? targetRole = roles
      .where((MemberRole role) => role.id == targetRoleId)
      .firstOrNull;
  if (targetRole == null) {
    return null;
  }
  if (targetRole.isEveryoneRole(guildId) &&
      position == GuildRoleReorderPosition.after) {
    return null;
  }
  final int draggedIndex = roles.indexWhere(
    (MemberRole role) => role.id == draggedRoleId,
  );
  final int targetIndex = roles.indexWhere(
    (MemberRole role) => role.id == targetRoleId,
  );
  if (draggedIndex == -1 || targetIndex == -1) {
    return null;
  }
  final int destinationIndex = position == GuildRoleReorderPosition.before
      ? targetIndex
      : targetIndex + 1;
  final int normalizedDestination = destinationIndex > draggedIndex
      ? destinationIndex - 1
      : destinationIndex;
  if (normalizedDestination == draggedIndex) {
    return null;
  }
  if (normalizedDestination < draggedIndex) {
    for (int index = normalizedDestination; index < draggedIndex; index++) {
      final MemberRole role = roles[index];
      if (role.id == draggedRoleId) {
        continue;
      }
      if (isRoleLocked(role)) {
        return null;
      }
    }
  }
  final List<MemberRole> remaining = roles
      .where((MemberRole role) => role.id != draggedRoleId)
      .toList();
  int insertIndex = destinationIndex;
  if (destinationIndex > draggedIndex) {
    insertIndex = destinationIndex - 1;
  }
  if (insertIndex < 0) {
    insertIndex = 0;
  }
  if (insertIndex > remaining.length) {
    insertIndex = remaining.length;
  }
  remaining.insert(insertIndex, draggedRole);
  final MemberRole? precedingRole = insertIndex > 0
      ? remaining[insertIndex - 1]
      : null;
  return GuildRoleMovePreview(
    order: remaining,
    operation: GuildRoleMoveOperation(
      roleId: draggedRoleId,
      precedingRoleId: precedingRole?.id,
    ),
  );
}
