import 'package:drift/drift.dart';

import 'package:fluxer_app/core/database/fluxer_database.dart';
import 'package:fluxer_app/core/database/tables/channels.dart';

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

  Future<List<Channel>> getChannels(String guildId) =>
      (select(channels)
            ..where((c) => c.guildId.equals(guildId))
            ..orderBy([(c) => OrderingTerm.asc(c.position)]))
          .get();

  Future<Channel?> getChannelById(String id) =>
      (select(channels)..where((c) => c.id.equals(id))).getSingleOrNull();

  Stream<Channel?> watchChannelById(String id) =>
      (select(channels)..where((c) => c.id.equals(id))).watchSingleOrNull();

  Future<void> upsertChannel(ChannelsCompanion channel) =>
      into(channels).insertOnConflictUpdate(channel);

  Future<void> upsertChannels(List<ChannelsCompanion> channelList) async {
    await batch((b) {
      for (final channel in channelList) {
        b.insert(channels, channel, onConflict: DoUpdate((_) => channel));
      }
    });
  }

  Future<void> updateLastMessageId(String channelId, String messageId) =>
      (update(channels)..where((c) => c.id.equals(channelId))).write(
        ChannelsCompanion(lastMessageId: Value(messageId)),
      );

  Future<void> deleteChannel(String id) =>
      (delete(channels)..where((c) => c.id.equals(id))).go();

  Future<void> deleteChannelsForGuild(String guildId) =>
      (delete(channels)..where((c) => c.guildId.equals(guildId))).go();

  Future<void> clearAll() => delete(channels).go();
}
