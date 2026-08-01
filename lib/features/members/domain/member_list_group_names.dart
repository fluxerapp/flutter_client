import 'dart:convert';

import 'package:fluxer_app/core/database/fluxer_database.dart' as db;
import 'package:fluxer_app/features/members/domain/member_list_layout.dart';
import 'package:fluxer_app/shared/utils/role_color_utils.dart';
import 'package:fluxer_dart/gateway.dart';

class MemberListGroupHeaderData {
  const MemberListGroupHeaderData({
    required this.groupId,
    required this.count,
    required this.name,
  });

  final String groupId;
  final int count;
  final String name;
}

String resolveMemberListGroupName({
  required String groupId,
  required Map<String, db.Role> rolesById,
  String onlineLabel = 'Online',
  String offlineLabel = 'Offline',
}) {
  if (groupId == 'online') {
    return onlineLabel;
  }
  if (groupId == 'offline') {
    return offlineLabel;
  }
  final String? roleName = rolesById[groupId]?.name;
  if (roleName != null && roleName.isNotEmpty) {
    return roleName;
  }
  return groupId;
}

List<String> parseMemberRoleIds(String roleIdsJson) {
  try {
    final Object? decoded = jsonDecode(roleIdsJson);
    if (decoded is List) {
      return decoded.cast<String>();
    }
  } on Object {}
  return <String>[];
}

int compareMemberRolesByPositionAndId(db.Role a, db.Role b) {
  if (b.position != a.position) {
    return b.position.compareTo(a.position);
  }
  final BigInt? aId = BigInt.tryParse(a.id);
  final BigInt? bId = BigInt.tryParse(b.id);
  if (aId != null && bId != null) {
    return aId.compareTo(bId);
  }
  return a.id.compareTo(b.id);
}

List<db.Role> sortMemberRolesForColor({
  required Iterable<String> roleIds,
  required Map<String, db.Role> rolesById,
}) {
  final List<db.Role> memberRoles = <db.Role>[];
  for (final String roleId in roleIds) {
    final db.Role? role = rolesById[roleId];
    if (role != null) {
      memberRoles.add(role);
    }
  }
  memberRoles.sort(compareMemberRolesByPositionAndId);
  return memberRoles;
}

int? resolveMemberHighestRoleColor({
  required Iterable<String> roleIds,
  required Map<String, db.Role> rolesById,
  String? guildId,
}) {
  for (final db.Role role in sortMemberRolesForColor(
    roleIds: roleIds,
    rolesById: rolesById,
  )) {
    final int? color = opaqueRoleColorInt(role.color);
    if (color != null) {
      return color;
    }
  }
  if (guildId != null && guildId.isNotEmpty) {
    return opaqueRoleColorInt(rolesById[guildId]?.color);
  }
  return null;
}

MemberListGroupHeaderData? resolveMemberListGroupHeader({
  required List<MemberListGroup> groups,
  required List<MemberListGroupLayout> layouts,
  required int rowIndex,
  required Map<String, db.Role> rolesById,
  String onlineLabel = 'Online',
  String offlineLabel = 'Offline',
}) {
  if (!isGroupHeaderRow(layouts, rowIndex)) {
    return null;
  }
  final MemberListGroupLayout? layout = getGroupLayoutForRow(layouts, rowIndex);
  if (layout == null) {
    return null;
  }
  final MemberListGroup? group = groupForRow(groups, layouts, rowIndex);
  final String groupId = group?.id ?? layout.id;
  final int count = group?.count ?? layout.count;
  if (groupId.isEmpty) {
    return null;
  }
  return MemberListGroupHeaderData(
    groupId: groupId,
    count: count,
    name: resolveMemberListGroupName(
      groupId: groupId,
      rolesById: rolesById,
      onlineLabel: onlineLabel,
      offlineLabel: offlineLabel,
    ),
  );
}
