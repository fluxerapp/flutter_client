import 'dart:convert';

import 'package:fluxer_app/core/database/fluxer_database.dart';
import 'package:fluxer_app/core/permissions/channel_permission_resolver.dart';
import 'package:fluxer_app/core/permissions/permission.dart';
import 'package:fluxer_app/features/channels/domain/channel.dart'
    show isThreadChannelType;
import 'package:fluxer_app/features/members/domain/member.dart' show MemberRole;

class _PermissionBase {
  _PermissionBase.from({
    required String guildId,
    required Member member,
    required List<Role> roles,
  }) : noRoles = roles.isEmpty,
       everyonePermissions =
           int.tryParse(
             roles
                     .where((Role role) => role.id == guildId)
                     .firstOrNull
                     ?.permissions ??
                 '0',
           ) ??
           0,
       memberRoles = _memberRoles(member, roles);

  final bool noRoles;
  final int everyonePermissions;
  final List<MemberRole> memberRoles;

  static List<MemberRole> _memberRoles(Member member, List<Role> roles) {
    final Set<String> memberRoleIds = member.roleIdsJson.isNotEmpty
        ? Set<String>.from(jsonDecode(member.roleIdsJson) as List<dynamic>)
        : <String>{};
    return roles
        .where((Role role) => memberRoleIds.contains(role.id))
        .map(MemberRole.fromRow)
        .toList();
  }
}

class OwnGuildUnreadPermissions {
  OwnGuildUnreadPermissions({
    required this._db,
    required this._currentUserId,
    required Iterable<Server> servers,
    required this._channelsById,
  }) : _serversById = <String, Server>{
         for (final Server server in servers) server.id: server,
       };

  final FluxerDatabase _db;
  final String? _currentUserId;
  final Map<String, Channel> _channelsById;
  final Map<String, Server> _serversById;
  final Map<String, Member?> _ownMemberByGuildId = <String, Member?>{};
  final Map<String, _PermissionBase?> _baseByGuildId =
      <String, _PermissionBase?>{};

  Future<Member?> ownMember(String guildId) async {
    final String? userId = _currentUserId;
    if (userId == null || userId.isEmpty) {
      return null;
    }
    if (_ownMemberByGuildId.containsKey(guildId)) {
      return _ownMemberByGuildId[guildId];
    }
    return _ownMemberByGuildId[guildId] = await _db.memberDao.getMemberByUserId(
      userId,
      guildId,
    );
  }

  Future<bool> canRead(Channel channel) async {
    final String? userId = _currentUserId;
    if (userId == null || userId.isEmpty) {
      return true;
    }
    final String guildId = channel.guildId;
    final Server? guild = _serversById[guildId];
    if (guild == null || guild.ownerId == userId) {
      return true;
    }
    final _PermissionBase? base;
    if (_baseByGuildId.containsKey(guildId)) {
      base = _baseByGuildId[guildId];
    } else {
      final Member? member = await ownMember(guildId);
      base = _baseByGuildId[guildId] = member == null
          ? null
          : _PermissionBase.from(
              guildId: guildId,
              member: member,
              roles: await _db.roleDao.getRoles(guildId),
            );
    }
    if (base == null || base.noRoles) {
      return true;
    }
    final int bits = evaluateChannelEffectivePermissionBits(
      guildOwnerId: guild.ownerId ?? '',
      guildId: guildId,
      currentUserId: userId,
      everyonePermissions: base.everyonePermissions,
      memberRoles: base.memberRoles,
      memberRecordPresent: true,
      overwriteJsonLayersRootToLeaf: <String?>[
        if (isThreadChannelType(channel.type))
          _channelsById[channel.parentId]?.permissionOverwritesJson
        else
          channel.permissionOverwritesJson,
      ],
    );
    return hasPermission(bits, Permission.viewChannel);
  }
}
