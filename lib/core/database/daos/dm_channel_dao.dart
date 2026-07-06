import 'dart:convert';

import 'package:drift/drift.dart';
import 'package:fluxer_app/core/database/drift_stream_utils.dart';

import 'package:fluxer_app/core/database/fluxer_database.dart';
import 'package:fluxer_app/core/database/tables/dm_channels.dart';

part 'dm_channel_dao.g.dart';

@DriftAccessor(tables: [DmChannels])
class DmChannelDao extends DatabaseAccessor<FluxerDatabase>
    with _$DmChannelDaoMixin {
  DmChannelDao(super.attachedDatabase);

  Stream<List<DmChannel>> watchDmChannels() =>
      (select(dmChannels)
            ..orderBy([(d) => OrderingTerm.desc(d.lastMessageTime)]))
          .watch()
          .suppressDriftCancellation;

  Future<List<DmChannel>> getDmChannels() => (select(
    dmChannels,
  )..orderBy([(d) => OrderingTerm.desc(d.lastMessageTime)])).get();

  Future<void> upsertDmChannels(List<DmChannelsCompanion> channelList) async {
    await batch((b) {
      for (final channel in channelList) {
        b.insert(dmChannels, channel, onConflict: DoUpdate((_) => channel));
      }
    });
  }

  Future<void> updateLastMessage(
    String channelId,
    String messageId,
    String message,
    String authorId,
    DateTime timestamp,
  ) =>
      (update(dmChannels)..where(
            (d) =>
                d.id.equals(channelId) &
                d.lastMessageTime.isSmallerOrEqualValue(timestamp),
          ))
          .write(
            DmChannelsCompanion(
              lastMessage: Value(message),
              lastMessageId: Value(messageId),
              lastMessageAuthorId: Value(authorId),
              lastMessageTime: Value(timestamp),
            ),
          );

  Future<void> markAsRead(String channelId) => updateUnreadCount(channelId, 0);

  Future<void> updateUnreadCount(String channelId, int count) =>
      (update(dmChannels)..where((d) => d.id.equals(channelId))).write(
        DmChannelsCompanion(unreadCount: Value(count)),
      );

  Future<void> incrementUnreadCount(String channelId) async {
    final row = await getDmChannelById(channelId);
    if (row == null) {
      return;
    }
    await updateUnreadCount(channelId, row.unreadCount + 1);
  }

  Future<void> deleteDmChannel(String channelId) =>
      (delete(dmChannels)..where((d) => d.id.equals(channelId))).go();

  Future<void> clearAll() => delete(dmChannels).go();

  Future<DmChannel?> getDmChannelById(String id) =>
      (select(dmChannels)..where((d) => d.id.equals(id))).getSingleOrNull();

  Future<void> addRecipientId(String channelId, String userId) async {
    final DmChannel? row = await getDmChannelById(channelId);
    if (row == null) {
      return;
    }
    final List<String> recipientIds = _parseRecipientIds(row.recipientIds);
    if (recipientIds.contains(userId)) {
      return;
    }
    final List<String> updated = <String>[...recipientIds, userId];
    await (update(dmChannels)..where((d) => d.id.equals(channelId))).write(
      DmChannelsCompanion(
        recipientIds: Value(jsonEncode(updated)),
        recipientCount: Value(updated.length + 1),
      ),
    );
  }

  Future<void> removeRecipientId(String channelId, String userId) async {
    final DmChannel? row = await getDmChannelById(channelId);
    if (row == null) {
      return;
    }
    final List<String> updated = _parseRecipientIds(
      row.recipientIds,
    ).where((String id) => id != userId).toList();
    await (update(dmChannels)..where((d) => d.id.equals(channelId))).write(
      DmChannelsCompanion(
        recipientIds: Value(jsonEncode(updated)),
        recipientCount: Value(updated.length + 1),
        recipientId: updated.isEmpty
            ? const Value.absent()
            : Value(updated.first),
      ),
    );
  }

  List<String> _parseRecipientIds(String json) {
    try {
      final List<dynamic> raw = jsonDecode(json) as List<dynamic>;
      return raw
          .map((dynamic e) => e.toString())
          .where((String s) => s.isNotEmpty)
          .toList();
    } on Object {
      return <String>[];
    }
  }
}
