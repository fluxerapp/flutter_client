import 'package:fluxer_app/features/members/domain/member.dart';

class GuildRolePositionPayloadItem {
  const GuildRolePositionPayloadItem({
    required this.id,
    required this.position,
  });

  final String id;
  final int position;
}

class GuildRoleHoistPositionPayloadItem {
  const GuildRoleHoistPositionPayloadItem({
    required this.id,
    required this.hoistPosition,
  });

  final String id;
  final int hoistPosition;
}

List<String> normalizeGuildRoleOrderIds({
  required String guildId,
  required List<String> orderedRoleIds,
}) {
  final Set<String> seen = <String>{};
  final List<String> normalizedIds = <String>[];
  for (final String roleId in orderedRoleIds) {
    if (roleId == guildId || seen.contains(roleId)) {
      continue;
    }
    seen.add(roleId);
    normalizedIds.add(roleId);
  }
  return normalizedIds;
}

bool isValidGuildRoleHierarchyOrder({
  required String guildId,
  required List<String> orderedRoleIds,
}) {
  final int everyoneIndex = orderedRoleIds.indexOf(guildId);
  if (everyoneIndex == -1) {
    return true;
  }
  return everyoneIndex == orderedRoleIds.length - 1;
}

List<String> createSubmittableGuildRoleOrderIds({
  required String guildId,
  required List<String> orderedRoleIds,
  required bool Function(String roleId) isRoleLocked,
}) {
  return normalizeGuildRoleOrderIds(
    guildId: guildId,
    orderedRoleIds: orderedRoleIds,
  ).where((String roleId) => !isRoleLocked(roleId)).toList();
}

List<GuildRolePositionPayloadItem> createGuildRoleOrderPayload({
  required String guildId,
  required List<String> orderedRoleIds,
}) {
  final List<String> orderedIds = normalizeGuildRoleOrderIds(
    guildId: guildId,
    orderedRoleIds: orderedRoleIds,
  );
  return List<GuildRolePositionPayloadItem>.generate(
    orderedIds.length,
    (int index) => GuildRolePositionPayloadItem(
      id: orderedIds[index],
      position: orderedIds.length - index,
    ),
  );
}

List<GuildRoleHoistPositionPayloadItem> createGuildRoleHoistOrderPayload({
  required String guildId,
  required List<String> orderedRoleIds,
}) {
  final List<String> orderedIds = normalizeGuildRoleOrderIds(
    guildId: guildId,
    orderedRoleIds: orderedRoleIds,
  );
  return List<GuildRoleHoistPositionPayloadItem>.generate(
    orderedIds.length,
    (int index) => GuildRoleHoistPositionPayloadItem(
      id: orderedIds[index],
      hoistPosition: orderedIds.length - index,
    ),
  );
}

List<MemberRole> resolveHoistedRoles({
  required String guildId,
  required List<MemberRole> roles,
  required List<String>? pendingHoistOrder,
}) {
  final List<MemberRole> hoisted =
      roles
          .where(
            (MemberRole role) => role.hoist && !role.isEveryoneRole(guildId),
          )
          .toList()
        ..sort((MemberRole a, MemberRole b) {
          final int aPos = a.effectiveHoistPosition(guildId);
          final int bPos = b.effectiveHoistPosition(guildId);
          if (bPos != aPos) {
            return bPos.compareTo(aPos);
          }
          return BigInt.parse(a.id) < BigInt.parse(b.id) ? -1 : 1;
        });
  if (pendingHoistOrder == null) {
    return hoisted;
  }
  final Map<String, MemberRole> hoistedById = <String, MemberRole>{
    for (final MemberRole role in hoisted) role.id: role,
  };
  return pendingHoistOrder
      .map((String id) => hoistedById[id])
      .whereType<MemberRole>()
      .toList();
}

List<MemberRole> resolveDisplayRoles({
  required List<MemberRole> roles,
  required List<String>? pendingRoleOrder,
}) {
  final List<MemberRole> sorted = sortRolesByPosition(roles);
  if (pendingRoleOrder == null) {
    return sorted;
  }
  final Map<String, MemberRole> rolesById = <String, MemberRole>{
    for (final MemberRole role in sorted) role.id: role,
  };
  return pendingRoleOrder
      .map((String id) => rolesById[id])
      .whereType<MemberRole>()
      .toList();
}

bool guildHasCustomHoistOrder(List<MemberRole> roles) {
  return roles.any((MemberRole role) => role.hoistPosition != null);
}
