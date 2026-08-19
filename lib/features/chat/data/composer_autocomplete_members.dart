import 'package:fluxer_app/core/database/fluxer_database.dart' as db;
import 'package:fluxer_app/core/permissions/channel_permission_resolver.dart';
import 'package:fluxer_app/core/permissions/permission.dart';
import 'package:fluxer_app/features/dm/domain/dm_conversation.dart';
import 'package:fluxer_app/features/members/domain/member.dart';

Member dmRecipientMentionMember({
  required DmConversation dm,
  db.User? recipientUser,
}) {
  return Member(
    id: dm.recipientId,
    username:
        recipientUser?.username ?? dm.recipientUsername ?? dm.recipientName,
    globalName: recipientUser?.globalName ?? dm.recipientName,
    avatar: dm.recipientAvatar ?? recipientUser?.avatar,
    avatarColor: recipientUser?.avatarColor,
    status: recipientUser?.status ?? dm.recipientStatus,
    isBot: recipientUser?.bot ?? dm.isBot,
  );
}

Member dmGroupParticipantMentionMember({
  required String participantId,
  db.User? user,
  GroupMemberInfo? cached,
}) {
  return Member(
    id: participantId,
    username: user?.username ?? cached?.name ?? '',
    globalName: user?.globalName ?? cached?.name,
    avatar: user?.avatar ?? cached?.avatar,
    avatarColor: user?.avatarColor,
    status: user?.status ?? 'offline',
    isBot: user?.bot ?? false,
  );
}

class ViewChannelFilterContext {
  ViewChannelFilterContext({
    required this.guildOwnerId,
    required this.everyonePermissions,
    required this.overwriteJsonLayersRootToLeaf,
  });

  final String guildOwnerId;
  final int everyonePermissions;
  final List<String?> overwriteJsonLayersRootToLeaf;
}

Future<ViewChannelFilterContext?> loadViewChannelFilterContext({
  required db.FluxerDatabase database,
  required String channelId,
  required String guildId,
}) async {
  final db.Server? guildRow = await database.guildDao.getServerById(guildId);
  if (guildRow == null) {
    return null;
  }
  final String ownerId = guildRow.ownerId ?? '';
  final List<db.Role> allRoles = await database.roleDao.getRoles(guildId);
  db.Role? everyoneRole;
  for (final db.Role r in allRoles) {
    if (r.id == guildId) {
      everyoneRole = r;
      break;
    }
  }
  final int everyonePermissions =
      int.tryParse(everyoneRole?.permissions ?? '0') ?? 0;
  final List<String?> layers = await database.channelDao
      .getPermissionOverwriteLayersRootToLeaf(channelId);
  return ViewChannelFilterContext(
    guildOwnerId: ownerId,
    everyonePermissions: everyonePermissions,
    overwriteJsonLayersRootToLeaf: layers,
  );
}

List<Member> filterMembersByViewChannelWithContext({
  required ViewChannelFilterContext context,
  required String guildId,
  required List<Member> members,
  Set<String> assumeVisibleForUserIds = const <String>{},
}) {
  final List<Member> visible = <Member>[];
  for (final Member m in members) {
    if (assumeVisibleForUserIds.contains(m.id)) {
      visible.add(m);
      continue;
    }
    final int bits = evaluateChannelEffectivePermissionBits(
      guildOwnerId: context.guildOwnerId,
      guildId: guildId,
      currentUserId: m.id,
      everyonePermissions: context.everyonePermissions,
      memberRoles: m.roles,
      memberRecordPresent: true,
      overwriteJsonLayersRootToLeaf: context.overwriteJsonLayersRootToLeaf,
    );
    if (hasPermission(bits, Permission.viewChannel)) {
      visible.add(m);
    }
  }
  return visible;
}

Future<List<Member>> filterMembersByViewChannel({
  required db.FluxerDatabase database,
  required String channelId,
  required String guildId,
  required List<Member> members,
  Set<String> assumeVisibleForUserIds = const <String>{},
}) async {
  final ViewChannelFilterContext? context = await loadViewChannelFilterContext(
    database: database,
    channelId: channelId,
    guildId: guildId,
  );
  if (context == null) {
    return members;
  }
  return filterMembersByViewChannelWithContext(
    context: context,
    guildId: guildId,
    members: members,
    assumeVisibleForUserIds: assumeVisibleForUserIds,
  );
}
