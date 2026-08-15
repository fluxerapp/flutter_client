import 'package:drift/drift.dart';
import 'package:fluxer_app/core/database/drift_stream_utils.dart';

import 'package:fluxer_app/core/database/fluxer_database.dart';
import 'package:fluxer_app/core/database/tables/messages.dart';
import 'package:fluxer_app/features/chat/domain/message_translation.dart';

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
      ..orderBy([
        (m) => OrderingTerm.desc(m.timestamp),
        (m) => OrderingTerm.desc(m.id.cast<int>()),
      ])
      ..limit(limit);

    if (beforeId != null) {
      final beforeMsg = await (select(
        messages,
      )..where((m) => m.id.equals(beforeId))).getSingleOrNull();
      if (beforeMsg != null) {
        // Composite cursor: pure-timestamp comparison drops or duplicates
        // equal-timestamp messages at page boundaries. Snowflake ids order
        // creation within one timestamp; they fit signed 64-bit.
        final int beforeSnowflake = int.parse(beforeId);
        query.where(
          (m) =>
              m.timestamp.isSmallerThanValue(beforeMsg.timestamp) |
              (m.timestamp.equals(beforeMsg.timestamp) &
                  m.id.cast<int>().isSmallerThanValue(beforeSnowflake)),
        );
      }
    }

    final results = await query.get();
    return results.reversed.toList();
  }

  Future<void> upsertMessage(MessagesCompanion message) async {
    String? existingContent;
    if (message.id.present && message.content.present) {
      existingContent = (await getTranslationSnapshots(<String>[
        message.id.value,
      ]))[message.id.value]?.content;
    }
    await into(
      messages,
    ).insertOnConflictUpdate(_clearStaleTranslation(message, existingContent));
  }

  Future<void> upsertMessages(
    List<MessagesCompanion> messageList, {
    Map<String, MessageTranslationSnapshot>? snapshots,
  }) async {
    if (messageList.isEmpty) {
      return;
    }
    final List<String> ids = <String>[
      for (final MessagesCompanion message in messageList)
        if (message.id.present) message.id.value,
    ];
    final Map<String, MessageTranslationSnapshot> existing =
        snapshots ?? await getTranslationSnapshots(ids);
    final List<MessagesCompanion> companions = <MessagesCompanion>[
      for (final MessagesCompanion message in messageList)
        _clearStaleTranslation(
          message,
          message.id.present ? existing[message.id.value]?.content : null,
        ),
    ];
    await batch((b) {
      for (final MessagesCompanion message in companions) {
        b.insert(messages, message, onConflict: DoUpdate((_) => message));
      }
    });
  }

  Future<void> saveTranslation({
    required String messageId,
    required MessageTranslation? translation,
  }) {
    return (update(messages)..where((m) => m.id.equals(messageId))).write(
      translation == null
          ? const MessagesCompanion(
              translatedContent: Value(null),
              translationSourceLanguage: Value(null),
              translatedSourceContent: Value(null),
              translationTargetLanguage: Value(null),
              translationShowOriginal: Value(false),
            )
          : MessagesCompanion(
              translatedContent: Value(translation.translatedContent),
              translationSourceLanguage: Value(translation.sourceLanguageCode),
              translatedSourceContent: Value(translation.sourceContent),
              translationTargetLanguage: Value(translation.targetLanguageCode),
              translationShowOriginal: Value(translation.showOriginal),
            ),
    );
  }

  Future<Map<String, MessageTranslationSnapshot>> getTranslationSnapshots(
    List<String> ids,
  ) async {
    if (ids.isEmpty) {
      return <String, MessageTranslationSnapshot>{};
    }
    final query = selectOnly(messages)
      ..addColumns([
        messages.id,
        messages.content,
        messages.translatedContent,
        messages.translationSourceLanguage,
        messages.translatedSourceContent,
        messages.translationTargetLanguage,
        messages.translationShowOriginal,
      ])
      ..where(messages.id.isIn(ids));
    final List<TypedResult> rows = await query.get();
    return <String, MessageTranslationSnapshot>{
      for (final TypedResult row in rows)
        row.read(messages.id)!: MessageTranslationSnapshot(
          content: row.read(messages.content)!,
          translation: MessageTranslation.tryParse(
            translatedContent: row.read(messages.translatedContent),
            sourceLanguage: row.read(messages.translationSourceLanguage),
            sourceContent: row.read(messages.translatedSourceContent),
            targetLanguage: row.read(messages.translationTargetLanguage),
            showOriginal: row.read(messages.translationShowOriginal) ?? false,
          ),
        ),
    };
  }

  MessagesCompanion _clearStaleTranslation(
    MessagesCompanion message,
    String? existingContent,
  ) {
    if (!message.content.present ||
        existingContent == null ||
        existingContent == message.content.value) {
      return message;
    }
    return message.copyWith(
      translatedContent: const Value(null),
      translationSourceLanguage: const Value(null),
      translatedSourceContent: const Value(null),
      translationTargetLanguage: const Value(null),
      translationShowOriginal: const Value(false),
    );
  }

  Future<Message?> getMessage(String id) =>
      (select(messages)..where((m) => m.id.equals(id))).getSingleOrNull();

  Future<Map<String, Message>> getMessagesByIds(List<String> ids) async {
    if (ids.isEmpty) {
      return <String, Message>{};
    }
    final List<Message> rows = await (select(
      messages,
    )..where((m) => m.id.isIn(ids))).get();
    return <String, Message>{for (final Message row in rows) row.id: row};
  }

  Future<List<Message>> getAllMessagesForChannel(String channelId) =>
      (select(messages)
            ..where((m) => m.channelId.equals(channelId))
            ..orderBy([(m) => OrderingTerm.asc(m.timestamp)]))
          .get();

  Future<Message?> getLastMessage(String channelId) =>
      (select(messages)
            ..where((m) => m.channelId.equals(channelId))
            ..orderBy([
              (m) => OrderingTerm.desc(m.timestamp),
              (m) => OrderingTerm.desc(m.id.cast<int>()),
            ])
            ..limit(1))
          .getSingleOrNull();

  Stream<Message?> watchLastMessage(String channelId) =>
      (select(messages)
            ..where((m) => m.channelId.equals(channelId))
            ..orderBy([
              (m) => OrderingTerm.desc(m.timestamp),
              (m) => OrderingTerm.desc(m.id.cast<int>()),
            ])
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
      ..orderBy([
        (m) => OrderingTerm.asc(m.timestamp),
        (m) => OrderingTerm.asc(m.id.cast<int>()),
      ])
      ..limit(limit);
    if (afterMsg != null) {
      // Composite cursor - see getMessages.
      final int afterSnowflake = int.parse(afterId);
      query.where(
        (m) =>
            m.timestamp.isBiggerThanValue(afterMsg.timestamp) |
            (m.timestamp.equals(afterMsg.timestamp) &
                m.id.cast<int>().isBiggerThanValue(afterSnowflake)),
      );
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

  Future<List<Message>> getMessagesInSnowflakeRange(
    String channelId,
    String oldestId,
    String newestId,
  ) =>
      (select(messages)
            ..where(
              (m) =>
                  m.channelId.equals(channelId) &
                  m.id.isBiggerOrEqualValue(oldestId) &
                  m.id.isSmallerOrEqualValue(newestId),
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

  Future<void> deleteMessagesForChannels(List<String> channelIds) {
    if (channelIds.isEmpty) {
      return Future.value();
    }
    return (delete(messages)..where((m) => m.channelId.isIn(channelIds))).go();
  }

  Future<Map<String, Message>> getLastMessageForChannels(
    List<String> channelIds,
  ) async {
    if (channelIds.isEmpty) {
      return {};
    }
    final String placeholders = List.filled(channelIds.length, '?').join(', ');
    final List<Variable<String>> channelVariables = channelIds
        .map(Variable<String>.new)
        .toList();
    final List<Message> latestMessages = await customSelect(
      '''
      SELECT m.*
      FROM messages m
      INNER JOIN (
        SELECT channel_id, MAX(timestamp) AS max_timestamp
        FROM messages
        WHERE channel_id IN ($placeholders)
        GROUP BY channel_id
      ) latest
        ON m.channel_id = latest.channel_id
       AND m.timestamp = latest.max_timestamp
      WHERE m.channel_id IN ($placeholders)
      ''',
      variables: <Variable<Object>>[...channelVariables, ...channelVariables],
      readsFrom: <TableInfo<Table, Object?>>{messages},
    ).map((QueryRow row) => messages.map(row.data)).get();
    return <String, Message>{
      for (final Message message in latestMessages) message.channelId: message,
    };
  }

  Future<void> clearAll() => delete(messages).go();
}
