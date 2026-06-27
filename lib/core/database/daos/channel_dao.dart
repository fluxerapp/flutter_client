import 'package:drift/drift.dart';

import 'package:fluxer_app/core/database/fluxer_database.dart';
import 'package:fluxer_app/core/database/tables/channels.dart';
import 'package:fluxer_app/features/channels/data/read_state_utils.dart';

part 'channel_dao.g.dart';

@DriftAccessor(tables: [Channels])
class ChannelDao extends DatabaseAccessor<FluxerDatabase>
    with _$ChannelDaoMixin {
  ChannelDao(super.attachedDatabase);

  Stream<List<Channel>> watchChannels(String guildId) =>
      (select(channels)
            ..where((c) => c.guildId.equals(guildId))
            ..orderBy([(c) => OrderingTerm.asc(c.position)]))
          .watch();

  Stream<List<Channel>> watchAllChannels() => select(channels).watch();

  Future<List<Channel>> getAllChannels() => select(channels).get();

  Future<List<Channel>> getChannels(String guildId) =>
      (select(channels)
            ..where((c) => c.guildId.equals(guildId))
            ..orderBy([(c) => OrderingTerm.asc(c.position)]))
          .get();

  Future<Channel?> getChannelById(String id) =>
      (select(channels)..where((c) => c.id.equals(id))).getSingleOrNull();

  /// Root category (or channel without parent) first,
  /// then each child down to [channelId].
  Future<List<String?>> getPermissionOverwriteLayersRootToLeaf(
    String channelId,
  ) async {
    final List<Channel> bottomUp = <Channel>[];
    String? currentId = channelId;
    while (currentId != null) {
      final Channel? row = await getChannelById(currentId);
      if (row == null) {
        break;
      }
      bottomUp.add(row);
      currentId = row.parentId;
    }
    return <String?>[
      for (final Channel row in bottomUp.reversed) row.permissionOverwritesJson,
    ];
  }

  Stream<Channel?> watchChannelById(String id) =>
      (select(channels)..where((c) => c.id.equals(id))).watchSingleOrNull();

  Future<void> upsertChannel(ChannelsCompanion channel) async {
    final channelId = channel.id.value;
    var channelToWrite = channel;
    if (channel.lastMessageId.present) {
      final merged = await mergeLastMessageIdForUpsert(
        channelId,
        channel.lastMessageId.value,
      );
      channelToWrite = channel.copyWith(lastMessageId: Value(merged));
    }
    await into(channels).insertOnConflictUpdate(channelToWrite);
  }

  Future<void> upsertChannels(List<ChannelsCompanion> channelList) async {
    await batch((b) {
      for (final channel in channelList) {
        b.insert(channels, channel, onConflict: DoUpdate((_) => channel));
      }
    });
  }

  Future<void> updateLastMessageId(String channelId, String messageId) =>
      setLastMessageId(channelId, messageId);

  Future<void> setLastMessageId(String channelId, String? messageId) =>
      (update(channels)..where((c) => c.id.equals(channelId))).write(
        ChannelsCompanion(lastMessageId: Value(messageId)),
      );

  Future<String?> mergeLastMessageIdForUpsert(
    String channelId,
    String? incomingLastMessageId,
  ) async {
    final existing = (await getChannelById(channelId))?.lastMessageId;
    if (incomingLastMessageId == null || incomingLastMessageId.isEmpty) {
      return existing;
    }
    final cached = await attachedDatabase.messageDao.getLastMessage(channelId);
    if (cached == null) {
      final incomingExists = await attachedDatabase.messageDao.getMessage(
        incomingLastMessageId,
      );
      if (incomingExists == null) {
        if (existing == null || existing.isEmpty) {
          return incomingLastMessageId;
        }
        return compareSnowflakeIds(incomingLastMessageId, existing) >= 0
            ? incomingLastMessageId
            : existing;
      }
    }
    if (existing == null || existing.isEmpty) {
      return incomingLastMessageId;
    }
    return compareSnowflakeIds(incomingLastMessageId, existing) >= 0
        ? incomingLastMessageId
        : existing;
  }

  Future<void> updateLastPinTimestamp(String channelId, String? timestamp) =>
      (update(channels)..where((c) => c.id.equals(channelId))).write(
        ChannelsCompanion(lastPinTimestamp: Value(timestamp)),
      );

  Future<void> deleteChannel(String id) =>
      (delete(channels)..where((c) => c.id.equals(id))).go();

  Future<void> deleteChannelsForGuild(String guildId) =>
      (delete(channels)..where((c) => c.guildId.equals(guildId))).go();

  Future<void> clearAll() => delete(channels).go();
}
