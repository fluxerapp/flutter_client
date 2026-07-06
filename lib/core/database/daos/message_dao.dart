import 'package:drift/drift.dart';
import 'package:fluxer_app/core/database/drift_stream_utils.dart';

import 'package:fluxer_app/core/database/fluxer_database.dart';
import 'package:fluxer_app/core/database/tables/messages.dart';

part 'message_dao.g.dart';

@DriftAccessor(tables: [Messages])
class MessageDao extends DatabaseAccessor<FluxerDatabase>
    with _$MessageDaoMixin {
  MessageDao(super.attachedDatabase);

  Stream<List<Message>> watchMessages(String channelId) =>
      (select(messages)
            ..where((m) => m.channelId.equals(channelId))
            ..orderBy([(m) => OrderingTerm.asc(m.timestamp)]))
          .watch()
          .suppressDriftCancellation;

  Future<List<Message>> getMessages(
    String channelId, {
    int limit = 50,
    String? beforeId,
  }) async {
    final query = select(messages)
      ..where((m) => m.channelId.equals(channelId))
      ..orderBy([(m) => OrderingTerm.desc(m.timestamp)])
      ..limit(limit);

    if (beforeId != null) {
      final beforeMsg = await (select(
        messages,
      )..where((m) => m.id.equals(beforeId))).getSingleOrNull();
      if (beforeMsg != null) {
        query.where((m) => m.timestamp.isSmallerThanValue(beforeMsg.timestamp));
      }
    }

    final results = await query.get();
    return results.reversed.toList();
  }

  Future<void> upsertMessage(MessagesCompanion message) =>
      into(messages).insertOnConflictUpdate(message);

  Future<void> upsertMessages(List<MessagesCompanion> messageList) async {
    await batch((b) {
      for (final message in messageList) {
        b.insert(messages, message, onConflict: DoUpdate((_) => message));
      }
    });
  }

  Future<Message?> getMessage(String id) =>
      (select(messages)..where((m) => m.id.equals(id))).getSingleOrNull();

  Future<List<Message>> getAllMessagesForChannel(String channelId) =>
      (select(messages)
            ..where((m) => m.channelId.equals(channelId))
            ..orderBy([(m) => OrderingTerm.asc(m.timestamp)]))
          .get();

  Future<Message?> getLastMessage(String channelId) =>
      (select(messages)
            ..where((m) => m.channelId.equals(channelId))
            ..orderBy([(m) => OrderingTerm.desc(m.timestamp)])
            ..limit(1))
          .getSingleOrNull();

  Stream<Message?> watchLastMessage(String channelId) =>
      (select(messages)
            ..where((m) => m.channelId.equals(channelId))
            ..orderBy([(m) => OrderingTerm.desc(m.timestamp)])
            ..limit(1))
          .watchSingleOrNull()
          .suppressDriftCancellation;

  Future<List<Message>> getMessagesAfter(
    String channelId,
    String afterId, {
    int limit = 30,
  }) async {
    final afterMsg = await (select(
      messages,
    )..where((m) => m.id.equals(afterId))).getSingleOrNull();
    final query = select(messages)
      ..where((m) => m.channelId.equals(channelId))
      ..orderBy([(m) => OrderingTerm.asc(m.timestamp)])
      ..limit(limit);
    if (afterMsg != null) {
      query.where((m) => m.timestamp.isBiggerThanValue(afterMsg.timestamp));
    }
    return query.get();
  }

  Future<List<Message>> getMessagesInTimestampRange(
    String channelId,
    DateTime oldest,
    DateTime newest,
  ) =>
      (select(messages)
            ..where(
              (m) =>
                  m.channelId.equals(channelId) &
                  m.timestamp.isBiggerOrEqualValue(oldest) &
                  m.timestamp.isSmallerOrEqualValue(newest),
            )
            ..orderBy([(m) => OrderingTerm.asc(m.timestamp)]))
          .get();

  Future<Message?> getPreviousMessage(String channelId, String beforeId) async {
    final reference = await (select(
      messages,
    )..where((m) => m.id.equals(beforeId))).getSingleOrNull();
    if (reference == null) {
      return null;
    }
    return (select(messages)
          ..where(
            (m) =>
                m.channelId.equals(channelId) &
                m.timestamp.isSmallerThanValue(reference.timestamp),
          )
          ..orderBy([(m) => OrderingTerm.desc(m.timestamp)])
          ..limit(1))
        .getSingleOrNull();
  }

  Future<void> updateReactions(String messageId, String json) =>
      (update(messages)..where((m) => m.id.equals(messageId))).write(
        MessagesCompanion(reactionsJson: Value(json)),
      );

  Future<void> deleteMessage(String id) =>
      (delete(messages)..where((m) => m.id.equals(id))).go();

  Future<void> deleteMessages(List<String> ids) {
    if (ids.isEmpty) {
      return Future.value();
    }
    return (delete(messages)..where((m) => m.id.isIn(ids))).go();
  }

  Future<void> deleteMessagesForChannel(String channelId) =>
      (delete(messages)..where((m) => m.channelId.equals(channelId))).go();

  Future<Map<String, Message>> getLastMessageForChannels(
    List<String> channelIds,
  ) async {
    if (channelIds.isEmpty) {
      return {};
    }
    final result = <String, Message>{};
    for (final channelId in channelIds) {
      final msg =
          await (select(messages)
                ..where((m) => m.channelId.equals(channelId))
                ..orderBy([(m) => OrderingTerm.desc(m.timestamp)])
                ..limit(1))
              .getSingleOrNull();
      if (msg != null) {
        result[channelId] = msg;
      }
    }
    return result;
  }

  Future<void> clearAll() => delete(messages).go();
}
