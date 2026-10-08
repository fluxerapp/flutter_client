import 'package:fluxer_app/core/database/fluxer_database.dart';

/// Clears guild channels, messages, and related data but keeps the server row.
Future<void> clearGuildContentButKeepServer(
  FluxerDatabase db,
  String guildId,
) async {
  final channels = await db.channelDao.getChannels(
    guildId,
    includeThreads: true,
  );
  final channelIds = channels.map((channel) => channel.id).toList();
  await db.messageDao.deleteMessagesForChannels(channelIds);
  await db.readStateDao.deleteReadStatesForChannels(channelIds);
  await db.channelDao.deleteChannelsForGuild(guildId);
  await db.threadDao.deleteMembersForGuild(guildId);
  await db.memberDao.deleteMembersForGuild(guildId);
  await db.roleDao.deleteRolesForGuild(guildId);
  await db.guildEmojiDao.replaceForGuild(guildId, const []);
  await db.guildStickerDao.replaceForGuild(guildId, const []);
  await db.userGuildSettingsDao.deleteForGuild(guildId);
  await db.guildLastChannelDao.removeGuild(guildId);
}

Future<void> removeGuildFromLocalDb(FluxerDatabase db, String guildId) async {
  final channels = await db.channelDao.getChannels(
    guildId,
    includeThreads: true,
  );
  final channelIds = channels.map((channel) => channel.id).toList();
  await db.messageDao.deleteMessagesForChannels(channelIds);
  await db.readStateDao.deleteReadStatesForChannels(channelIds);
  await db.channelDao.deleteChannelsForGuild(guildId);
  await db.threadDao.deleteMembersForGuild(guildId);
  await db.memberDao.deleteMembersForGuild(guildId);
  await db.roleDao.deleteRolesForGuild(guildId);
  await db.guildEmojiDao.replaceForGuild(guildId, const []);
  await db.guildStickerDao.replaceForGuild(guildId, const []);
  await db.userGuildSettingsDao.deleteForGuild(guildId);
  await db.guildLastChannelDao.removeGuild(guildId);
  await db.guildDao.deleteServer(guildId);
}

/// Ids to keep after a membership refresh.
///
/// Communities inserted after [localGuildIdsBeforeFetch] was captured stay,
/// so a join that lands while the fetch is in flight is not removed.
Set<String> guildIdsKeptAfterMembershipSync({
  required Set<String> apiGuildIds,
  required Set<String> localGuildIdsBeforeFetch,
  required Iterable<String> localGuildIdsAfterUpsert,
}) {
  return {
    ...apiGuildIds,
    for (final String id in localGuildIdsAfterUpsert)
      if (!localGuildIdsBeforeFetch.contains(id)) id,
  };
}

Future<List<String>> removeGuildsNotInLocalDb(
  FluxerDatabase db,
  Set<String> keepIds,
) async {
  final local = await db.guildDao.getServers();
  final removed = <String>[];
  for (final server in local) {
    if (keepIds.contains(server.id)) {
      continue;
    }
    await removeGuildFromLocalDb(db, server.id);
    removed.add(server.id);
  }
  return removed;
}
