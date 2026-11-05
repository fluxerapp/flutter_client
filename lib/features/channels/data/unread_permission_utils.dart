import 'dart:convert';

import 'package:fluxer_app/core/database/fluxer_database.dart' as db;
import 'package:fluxer_app/core/permissions/channel_permission_resolver.dart';
import 'package:fluxer_app/core/permissions/permission.dart';
import 'package:fluxer_app/features/members/domain/member.dart';

class ChannelUnreadPermissionOutcome {
  const ChannelUnreadPermissionOutcome({
    required this.canRead,
    required this.isDefinitive,
  });

  final bool canRead;
  final bool isDefinitive;
}

Future<ChannelUnreadPermissionOutcome> evaluateChannelUnreadPermission({
  required db.FluxerDatabase database,
  required db.Channel channel,
  required String? currentUserId,
}) async {
  if (currentUserId == null || currentUserId.isEmpty) {
    return const ChannelUnreadPermissionOutcome(
      canRead: true,
      isDefinitive: true,
    );
  }
  final guild = await database.guildDao.getServerById(channel.guildId);
  if (guild == null) {
    return const ChannelUnreadPermissionOutcome(
      canRead: true,
      isDefinitive: false,
    );
  }
  if (guild.ownerId == currentUserId) {
    return const ChannelUnreadPermissionOutcome(
      canRead: true,
      isDefinitive: true,
    );
  }

  final member = await database.memberDao.getMemberByUserId(
    currentUserId,
    channel.guildId,
  );
  if (member == null) {
    return const ChannelUnreadPermissionOutcome(
      canRead: true,
      isDefinitive: false,
    );
  }

  final roles = await database.roleDao.getRoles(channel.guildId);
  final memberRoleIds = member.roleIdsJson.isNotEmpty
      ? List<String>.from(jsonDecode(member.roleIdsJson) as List<dynamic>)
      : <String>[];
  final everyoneRole = roles
      .where((role) => role.id == channel.guildId)
      .firstOrNull;
  if (everyoneRole == null && roles.isEmpty) {
    return const ChannelUnreadPermissionOutcome(
      canRead: true,
      isDefinitive: true,
    );
  }
  final everyonePermissions =
      int.tryParse(everyoneRole?.permissions ?? '0') ?? 0;
  final memberRoles = roles
      .where((role) => memberRoleIds.contains(role.id))
      .map(MemberRole.fromRow)
      .toList();
  final layers = await database.channelDao.getPermissionOverwriteLayers(
    channel.id,
  );
  final bits = evaluateChannelEffectivePermissionBits(
    guildOwnerId: guild.ownerId ?? '',
    guildId: channel.guildId,
    currentUserId: currentUserId,
    everyonePermissions: everyonePermissions,
    memberRoles: memberRoles,
    memberRecordPresent: true,
    overwriteJsonLayersRootToLeaf: layers,
  );
  return ChannelUnreadPermissionOutcome(
    canRead: hasPermission(bits, Permission.viewChannel),
    isDefinitive: true,
  );
}

List<String?> permissionOverwriteLayersFromSnapshot(
  db.Channel channel,
  Map<String, db.Channel> snapshot,
) {
  final List<db.Channel> bottomUp = <db.Channel>[];
  String? currentId = channel.id;
  while (currentId != null) {
    final db.Channel? row = snapshot[currentId];
    if (row == null) {
      break;
    }
    bottomUp.add(row);
    currentId = row.parentId;
  }
  return <String?>[
    for (final db.Channel row in bottomUp.reversed)
      row.permissionOverwritesJson,
  ];
}

class ChannelUnreadPermissionSeedCache {
  ChannelUnreadPermissionSeedCache(this.byChannelId);

  final Map<String, ChannelUnreadPermissionOutcome> byChannelId;

  bool canReadForUnread(db.Channel channel) {
    final ChannelUnreadPermissionOutcome? outcome = byChannelId[channel.id];
    if (outcome == null || !outcome.isDefinitive) {
      return true;
    }
    return outcome.canRead;
  }
}

typedef UnreadPermissionInputs = ({
  List<db.Server> guilds,
  Map<String, db.Member> ownMemberByGuild,
  Map<String, List<db.Role>> rolesByGuild,
});

Future<UnreadPermissionInputs> loadUnreadPermissionInputs(
  db.FluxerDatabase database,
  String? currentUserId,
) async {
  final List<db.Server> guilds = await database.guildDao.getServers();
  if (currentUserId == null || currentUserId.isEmpty) {
    return (
      guilds: guilds,
      ownMemberByGuild: const <String, db.Member>{},
      rolesByGuild: const <String, List<db.Role>>{},
    );
  }
  final List<db.Member> members = await database.memberDao.getMembersForUser(
    currentUserId,
  );
  final List<db.Role> roles = await database.roleDao.getAllRoles();
  final Map<String, List<db.Role>> rolesByGuild = <String, List<db.Role>>{};
  for (final db.Role role in roles) {
    (rolesByGuild[role.guildId] ??= <db.Role>[]).add(role);
  }
  return (
    guilds: guilds,
    ownMemberByGuild: <String, db.Member>{
      for (final db.Member member in members) member.guildId: member,
    },
    rolesByGuild: rolesByGuild,
  );
}

ChannelUnreadPermissionSeedCache buildChannelUnreadPermissionSeedCache({
  required String? currentUserId,
  required Iterable<db.Channel> channels,
  required UnreadPermissionInputs inputs,
  required Map<String, db.Channel> channelSnapshot,
}) {
  final Map<String, ChannelUnreadPermissionOutcome> byChannelId =
      <String, ChannelUnreadPermissionOutcome>{};
  if (currentUserId == null || currentUserId.isEmpty) {
    for (final db.Channel channel in channels) {
      byChannelId[channel.id] = const ChannelUnreadPermissionOutcome(
        canRead: true,
        isDefinitive: true,
      );
    }
    return ChannelUnreadPermissionSeedCache(byChannelId);
  }

  final Map<String, db.Server> guildById = <String, db.Server>{
    for (final db.Server guild in inputs.guilds) guild.id: guild,
  };
  final Map<String, ({int everyonePermissions, List<MemberRole> memberRoles})>
  baseByGuild =
      <String, ({int everyonePermissions, List<MemberRole> memberRoles})>{};

  for (final db.Channel channel in channels) {
    if (channel.guildId.isEmpty) {
      byChannelId[channel.id] = const ChannelUnreadPermissionOutcome(
        canRead: true,
        isDefinitive: true,
      );
      continue;
    }
    final db.Server? guild = guildById[channel.guildId];
    if (guild == null) {
      byChannelId[channel.id] = const ChannelUnreadPermissionOutcome(
        canRead: true,
        isDefinitive: false,
      );
      continue;
    }
    if (guild.ownerId == currentUserId) {
      byChannelId[channel.id] = const ChannelUnreadPermissionOutcome(
        canRead: true,
        isDefinitive: true,
      );
      continue;
    }
    final db.Member? member = inputs.ownMemberByGuild[channel.guildId];
    if (member == null) {
      byChannelId[channel.id] = const ChannelUnreadPermissionOutcome(
        canRead: true,
        isDefinitive: false,
      );
      continue;
    }
    final List<db.Role> roles =
        inputs.rolesByGuild[channel.guildId] ?? const <db.Role>[];
    if (roles.isEmpty) {
      byChannelId[channel.id] = const ChannelUnreadPermissionOutcome(
        canRead: true,
        isDefinitive: true,
      );
      continue;
    }
    final ({int everyonePermissions, List<MemberRole> memberRoles}) base =
        baseByGuild[channel.guildId] ??= _memberPermissionBase(
          guildId: channel.guildId,
          member: member,
          roles: roles,
        );
    final List<String?> layers = permissionOverwriteLayersFromSnapshot(
      channel,
      channelSnapshot,
    );
    final int bits = evaluateChannelEffectivePermissionBits(
      guildOwnerId: guild.ownerId ?? '',
      guildId: channel.guildId,
      currentUserId: currentUserId,
      everyonePermissions: base.everyonePermissions,
      memberRoles: base.memberRoles,
      memberRecordPresent: true,
      overwriteJsonLayersRootToLeaf: layers,
    );
    byChannelId[channel.id] = ChannelUnreadPermissionOutcome(
      canRead: hasPermission(bits, Permission.viewChannel),
      isDefinitive: true,
    );
  }
  return ChannelUnreadPermissionSeedCache(byChannelId);
}

({int everyonePermissions, List<MemberRole> memberRoles})
_memberPermissionBase({
  required String guildId,
  required db.Member member,
  required List<db.Role> roles,
}) {
  final List<String> memberRoleIds = member.roleIdsJson.isNotEmpty
      ? List<String>.from(jsonDecode(member.roleIdsJson) as List<dynamic>)
      : <String>[];
  final db.Role? everyoneRole = roles
      .where((db.Role role) => role.id == guildId)
      .firstOrNull;
  return (
    everyonePermissions: int.tryParse(everyoneRole?.permissions ?? '0') ?? 0,
    memberRoles: roles
        .where((db.Role role) => memberRoleIds.contains(role.id))
        .map(MemberRole.fromRow)
        .toList(),
  );
}

Future<bool> canReadChannelForUnread({
  required db.FluxerDatabase database,
  required db.Channel channel,
  required String? currentUserId,
}) async {
  final outcome = await evaluateChannelUnreadPermission(
    database: database,
    channel: channel,
    currentUserId: currentUserId,
  );
  if (!outcome.isDefinitive) {
    return true;
  }
  return outcome.canRead;
}
