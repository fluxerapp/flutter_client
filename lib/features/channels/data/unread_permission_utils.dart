import 'dart:convert';

import 'package:fluxer_app/core/database/fluxer_database.dart' as db;
import 'package:fluxer_app/core/permissions/channel_permission_resolver.dart';
import 'package:fluxer_app/core/permissions/permission.dart';
import 'package:fluxer_app/features/channels/data/read_state_utils.dart';
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

Future<int> guildChannelFallbackAckMs({
  required db.FluxerDatabase database,
  required db.Channel channel,
  required String? currentUserId,
}) async {
  if (currentUserId != null && currentUserId.isNotEmpty) {
    final member = await database.memberDao.getMemberByUserId(
      currentUserId,
      channel.guildId,
    );
    final joinedAt = member?.joinedAt;
    if (joinedAt != null) {
      return joinedAt.millisecondsSinceEpoch;
    }
  }
  return snowflakeTimestampMs(channel.id);
}
