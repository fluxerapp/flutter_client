import 'dart:convert';

import 'package:fluxer_app/core/database/fluxer_database.dart' as db;
import 'package:fluxer_app/shared/utils/display_name.dart';
import 'package:fluxer_app/shared/utils/guild_user_display.dart';

class MemberRole {
  final String id;
  final String name;
  final int color;
  final int position;
  final bool hoist;
  final bool mentionable;
  final int permissions;
  final int? hoistPosition;

  const MemberRole({
    required this.id,
    required this.name,
    required this.color,
    this.position = 0,
    this.hoist = false,
    this.mentionable = false,
    this.permissions = 0,
    this.hoistPosition,
  });

  bool isEveryoneRole(String guildId) => id == guildId;

  int effectiveHoistPosition(String guildId) {
    if (!hoist || isEveryoneRole(guildId)) {
      return 0;
    }
    return hoistPosition ?? position;
  }

  factory MemberRole.fromRow(db.Role row) {
    return MemberRole(
      id: row.id,
      name: row.name,
      color: row.color,
      position: row.position,
      hoist: row.hoist,
      mentionable: row.mentionable,
      permissions: int.tryParse(row.permissions) ?? 0,
      hoistPosition: row.hoistPosition,
    );
  }
}

List<MemberRole> sortRolesByPosition(List<MemberRole> roles) {
  return List<MemberRole>.from(roles)..sort((MemberRole a, MemberRole b) {
    if (b.position != a.position) {
      return b.position - a.position;
    }
    return BigInt.parse(a.id) < BigInt.parse(b.id) ? -1 : 1;
  });
}

class Member {
  final String id;
  final String username;
  final String? globalName;
  final String? avatar;
  final String? guildAvatar;
  final int? avatarColor;
  final String? nickname;
  final List<MemberRole> roles;

  const Member({
    required this.id,
    required this.username,
    this.globalName,
    this.avatar,
    this.guildAvatar,
    this.avatarColor,
    this.nickname,
    this.roles = const [],
  });

  factory Member.fromRow(db.Member row, db.User? user, List<db.Role> allRoles) {
    final roleIds = _parseRoleIds(row.roleIdsJson);
    final roleMap = {for (final r in allRoles) r.id: r};
    final memberRoles = <MemberRole>[
      for (final id in roleIds)
        if (roleMap.containsKey(id)) MemberRole.fromRow(roleMap[id]!),
    ];

    final bool isAvatarUnset = hasMemberProfileFlag(
      row.profileFlags,
      guildProfileAvatarUnsetFlag,
    );
    final String? rawGuildAvatar = row.serverAvatar;
    final String? guildAvatar =
        !isAvatarUnset && rawGuildAvatar != null && rawGuildAvatar.isNotEmpty
        ? rawGuildAvatar
        : null;
    final String? avatar = isAvatarUnset ? null : guildAvatar ?? user?.avatar;

    return Member(
      id: row.userId,
      username: user?.username ?? '',
      globalName: user?.globalName,
      avatar: avatar,
      guildAvatar: guildAvatar,
      avatarColor: user?.avatarColor,
      nickname: row.nick,
      roles: memberRoles,
    );
  }

  String get displayName => resolveDisplayName(
    guildNickname: nickname,
    globalName: globalName,
    username: username,
  );

  static List<String> _parseRoleIds(String json) {
    try {
      final decoded = jsonDecode(json);
      if (decoded is List) {
        return decoded.cast<String>();
      }
    } on Object {
      // Fall through to empty list.
    }
    return [];
  }
}
