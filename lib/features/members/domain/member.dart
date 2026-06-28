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

  const MemberRole({
    required this.id,
    required this.name,
    required this.color,
    this.position = 0,
    this.hoist = false,
    this.mentionable = false,
    this.permissions = 0,
  });

  factory MemberRole.fromRow(db.Role row) {
    return MemberRole(
      id: row.id,
      name: row.name,
      color: row.color,
      position: row.position,
      hoist: row.hoist,
      mentionable: row.mentionable,
      permissions: int.tryParse(row.permissions) ?? 0,
    );
  }
}

class RoleGroup {
  final MemberRole? role;
  final String displayName;
  final List<Member> members;

  const RoleGroup({
    required this.displayName,
    required this.members,
    this.role,
  });
}

class Member {
  final String id;
  final String username;
  final String? globalName;
  final String? avatar;
  final int? avatarColor;
  final String? nickname;
  final List<MemberRole> roles;
  final String status;
  final bool isOwner;
  final bool isBot;
  final String? customStatus;
  final DateTime? communicationDisabledUntil;

  const Member({
    required this.id,
    required this.username,
    this.globalName,
    this.avatar,
    this.avatarColor,
    this.nickname,
    this.roles = const [],
    this.status = 'offline',
    this.isOwner = false,
    this.isBot = false,
    this.customStatus,
    this.communicationDisabledUntil,
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
    final String? avatar = isAvatarUnset
        ? null
        : row.serverAvatar ?? user?.avatar;

    return Member(
      id: row.userId,
      username: user?.username ?? '',
      globalName: row.nick ?? user?.globalName,
      avatar: avatar,
      avatarColor: user?.avatarColor,
      nickname: row.nick,
      roles: memberRoles,
      status: user?.status ?? 'offline',
      isBot: user?.bot ?? false,
      customStatus: user?.customStatus,
      communicationDisabledUntil: row.communicationDisabledUntil,
    );
  }

  String get displayName => resolveDisplayName(
    guildNickname: nickname,
    globalName: globalName,
    username: username,
  );

  /// Whether the member is currently timed out (communication disabled).
  bool get isTimedOut =>
      communicationDisabledUntil != null &&
      communicationDisabledUntil!.isAfter(DateTime.now());

  /// Color of the highest-positioned role, or null.
  int? get roleColor {
    if (roles.isEmpty) {
      return null;
    }
    final sorted = [...roles]..sort((a, b) => b.position.compareTo(a.position));
    return sorted.first.color;
  }

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

/// Groups members by their highest hoisted role.
List<RoleGroup> groupMembersIntoRoles(List<Member> members) {
  final grouped = <String, List<Member>>{};
  final roleForGroup = <String, MemberRole>{};

  for (final member in members) {
    final hoisted = member.roles.where((r) => r.hoist).toList()
      ..sort((a, b) => b.position.compareTo(a.position));

    final groupKey = hoisted.isNotEmpty ? hoisted.first.name : 'Online';

    if (hoisted.isNotEmpty) {
      roleForGroup[groupKey] = hoisted.first;
    }

    grouped.putIfAbsent(groupKey, () => <Member>[]).add(member);
  }

  final groups = <RoleGroup>[];
  for (final entry in grouped.entries) {
    groups.add(
      RoleGroup(
        role: roleForGroup[entry.key],
        displayName: '${entry.key} \u2014 ${entry.value.length}',
        members: entry.value,
      ),
    );
  }

  return groups;
}
