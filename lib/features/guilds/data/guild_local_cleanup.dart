import 'package:fluxer_app/core/database/fluxer_database.dart';

Future<List<String>> _deleteGuildContent(
  FluxerDatabase db,
  String guildId,
) async {
  final List<String> channelIds = <String>[
    for (final Channel channel in await db.channelDao.getChannels(
      guildId,
      includeThreads: true,
    ))
      channel.id,
  ];
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
  return channelIds;
}

Future<List<String>> _deleteGuild(FluxerDatabase db, String guildId) async {
  final List<String> channelIds = await _deleteGuildContent(db, guildId);
  await db.composerDraftDao.deleteDraftsForChannels(channelIds);
  await db.notificationDao.deleteMentionRowsForChannels(channelIds);
  await db.guildDao.deleteServer(guildId);
  return channelIds;
}

Future<List<String>> clearGuildContentButKeepServer(
  FluxerDatabase db,
  String guildId,
) => db.transaction(() async {
  final List<String> channelIds = await _deleteGuildContent(db, guildId);
  await db.guildDao.markUnavailable(guildId);
  return channelIds;
});

Future<List<String>> removeGuildFromLocalDb(
  FluxerDatabase db,
  String guildId,
) => db.transaction(() => _deleteGuild(db, guildId));

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

Future<Map<String, List<String>>> removeGuildsNotInLocalDb(
  FluxerDatabase db,
  Set<String> keepIds,
) => db.transaction(() async {
  final Map<String, List<String>> removed = <String, List<String>>{};
  for (final Server server in await db.guildDao.getServers()) {
    if (!keepIds.contains(server.id)) {
      removed[server.id] = await _deleteGuild(db, server.id);
    }
  }
  return removed;
});
