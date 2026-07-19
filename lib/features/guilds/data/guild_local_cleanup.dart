import 'package:fluxer_app/core/database/fluxer_database.dart';

Future<void> removeGuildFromLocalDb(FluxerDatabase db, String guildId) async {
  final channels = await db.channelDao.getChannels(guildId);
  final channelIds = channels.map((channel) => channel.id).toList();
  await db.messageDao.deleteMessagesForChannels(channelIds);
  await db.readStateDao.deleteReadStatesForChannels(channelIds);
  await db.channelDao.deleteChannelsForGuild(guildId);
  await db.memberDao.deleteMembersForGuild(guildId);
  await db.roleDao.deleteRolesForGuild(guildId);
  await db.guildEmojiDao.replaceForGuild(guildId, const []);
  await db.guildStickerDao.replaceForGuild(guildId, const []);
  await db.userGuildSettingsDao.deleteForGuild(guildId);
  await db.guildLastChannelDao.removeGuild(guildId);
  await db.guildDao.deleteServer(guildId);
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
