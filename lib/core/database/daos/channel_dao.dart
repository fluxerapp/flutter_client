import 'package:drift/drift.dart';
import 'package:fluxer_app/core/database/drift_stream_utils.dart';

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
          .watch()
          .suppressDriftCancellation;

  Stream<List<Channel>> watchAllChannels() =>
      select(channels).watch().suppressDriftCancellation;

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
      (select(channels)..where((c) => c.id.equals(id)))
          .watchSingleOrNull()
          .suppressDriftCancellation;

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

  /// Bulk upsert with optional authoritative lastMessageId handling.
  ///
  /// When [authoritativeTails] is true (READY path), each present
  /// `lastMessageId` is taken as-is: the gateway snapshot is server truth at
  /// connect time. Non-typing gateway events are strictly serialized
  /// (GatewayEventDispatcher._drain), so READY finishes before any queued
  /// MESSAGE_CREATE and a genuinely newer tail re-advances via its own event.
  /// Absent `lastMessageId` leaves the local column untouched.
  ///
  /// When false, present tails are max-merged against the existing row
  /// (CHANNEL_UPDATE-style race protection for non-READY callers).
  ///
  /// Fold-forward: duplicate channel ids in one call see earlier decisions.
  Future<void> upsertChannelsMerged(
    List<ChannelsCompanion> channelList, {
    bool authoritativeTails = false,
  }) async {
    if (channelList.isEmpty) {
      return;
    }

    final Map<String, String?> existingLastById = <String, String?>{};
    final bool needsExisting =
        !authoritativeTails &&
        channelList.any(
          (ChannelsCompanion channel) => channel.lastMessageId.present,
        );
    if (needsExisting) {
      // Full table is small (~payload-sized) and avoids bind-limit chunking.
      for (final Channel row in await select(channels).get()) {
        existingLastById[row.id] = row.lastMessageId;
      }
    }

    final List<ChannelsCompanion> merged = <ChannelsCompanion>[];
    for (final ChannelsCompanion channel in channelList) {
      if (!channel.lastMessageId.present) {
        merged.add(channel);
        continue;
      }
      final String id = channel.id.value;
      final String? incoming = channel.lastMessageId.value;
      final String? folded;
      if (authoritativeTails) {
        folded = incoming;
      } else {
        folded = mergeLastMessageIdValues(
          existing: existingLastById[id],
          incomingLastMessageId: incoming,
        );
      }
      existingLastById[id] = folded;
      merged.add(channel.copyWith(lastMessageId: Value(folded)));
    }

    await batch((b) {
      for (final ChannelsCompanion channel in merged) {
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
    final String? existing = (await getChannelById(channelId))?.lastMessageId;
    return mergeLastMessageIdValues(
      existing: existing,
      incomingLastMessageId: incomingLastMessageId,
    );
  }

  /// Max-snowflake merge for single-row CHANNEL_UPDATE-style upserts.
  /// Incoming null/empty preserves existing; otherwise keep the newer id.
  String? mergeLastMessageIdValues({
    required String? existing,
    required String? incomingLastMessageId,
  }) {
    if (incomingLastMessageId == null || incomingLastMessageId.isEmpty) {
      return existing;
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
