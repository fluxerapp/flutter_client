import 'dart:convert';

import 'package:fluxer_app/core/permissions/permission.dart';
import 'package:fluxer_app/features/members/domain/member.dart';

final BigInt _channelPermissionMask = BigInt.from(allPermissions);

BigInt _parsePermissionString(String raw) {
  if (raw.isEmpty) {
    return BigInt.zero;
  }
  return BigInt.parse(raw);
}

class ChannelOverwriteEntry {
  const ChannelOverwriteEntry({
    required this.id,
    required this.isRoleType,
    required this.allow,
    required this.deny,
  });

  final String id;
  final bool isRoleType;
  final BigInt allow;
  final BigInt deny;
}

List<ChannelOverwriteEntry> parseChannelPermissionOverwritesJson(String? json) {
  if (json == null || json.isEmpty) {
    return const <ChannelOverwriteEntry>[];
  }
  final Object? decoded = jsonDecode(json);
  if (decoded is! List<dynamic>) {
    return const <ChannelOverwriteEntry>[];
  }
  return <ChannelOverwriteEntry>[
    for (final Object? item in decoded)
      if (item is Map) _parseOverwriteMap(Map<String, dynamic>.from(item)),
  ];
}

int _overwriteType(Object? raw) {
  if (raw is num) {
    return raw.toInt();
  }
  if (raw is String) {
    return int.tryParse(raw) ?? 0;
  }
  return 0;
}

ChannelOverwriteEntry _parseOverwriteMap(Map<String, dynamic> m) {
  final int type = _overwriteType(m['type']);
  return ChannelOverwriteEntry(
    id: m['id']?.toString() ?? '',
    isRoleType: type == 0,
    allow: _parsePermissionString(m['allow']?.toString() ?? '0'),
    deny: _parsePermissionString(m['deny']?.toString() ?? '0'),
  );
}

BigInt applyChannelOverwriteStage(
  BigInt base,
  List<ChannelOverwriteEntry> entries, {
  required String guildId,
  required String userId,
  required Set<String> memberRoleIds,
  required bool memberRecordPresent,
}) {
  ChannelOverwriteEntry? everyoneOverwrite;
  BigInt roleAllow = BigInt.zero;
  BigInt roleDeny = BigInt.zero;
  ChannelOverwriteEntry? memberOverwrite;
  for (final ChannelOverwriteEntry e in entries) {
    if (e.isRoleType && e.id == guildId) {
      everyoneOverwrite = e;
    } else if (e.isRoleType && memberRoleIds.contains(e.id)) {
      roleAllow |= e.allow;
      roleDeny |= e.deny;
    } else if (!e.isRoleType && e.id == userId) {
      memberOverwrite = e;
    }
  }
  BigInt resolved = base;
  if (everyoneOverwrite != null) {
    resolved = (resolved & ~everyoneOverwrite.deny) | everyoneOverwrite.allow;
  }
  resolved = (resolved & ~roleDeny) | roleAllow;
  if (memberRecordPresent && memberOverwrite != null) {
    resolved = (resolved & ~memberOverwrite.deny) | memberOverwrite.allow;
  }
  return resolved & _channelPermissionMask;
}

int evaluateChannelEffectivePermissionBits({
  required String guildOwnerId,
  required String guildId,
  required String currentUserId,
  required int everyonePermissions,
  required List<MemberRole> memberRoles,
  required bool memberRecordPresent,
  required List<String?> overwriteJsonLayersRootToLeaf,
}) {
  if (currentUserId == guildOwnerId) {
    return allPermissions;
  }
  int baseInt = everyonePermissions;
  for (final MemberRole r in memberRoles) {
    baseInt |= r.permissions;
  }
  if ((baseInt & Permission.administrator.value) != 0) {
    return allPermissions;
  }
  BigInt mask = BigInt.from(baseInt);
  for (final String? layerJson in overwriteJsonLayersRootToLeaf) {
    if (layerJson == null) {
      continue;
    }
    final List<ChannelOverwriteEntry> entries =
        parseChannelPermissionOverwritesJson(layerJson);
    mask = applyChannelOverwriteStage(
      mask,
      entries,
      guildId: guildId,
      userId: currentUserId,
      memberRoleIds: <String>{for (final MemberRole r in memberRoles) r.id},
      memberRecordPresent: memberRecordPresent,
    );
  }
  final int result = (mask & _channelPermissionMask).toInt();
  if (hasPermission(result, Permission.administrator)) {
    return allPermissions;
  }
  return result;
}
