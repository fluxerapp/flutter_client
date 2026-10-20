import 'package:drift/drift.dart';
import 'package:fluxer_app/core/database/drift_stream_utils.dart';

import 'package:fluxer_app/core/database/fluxer_database.dart';
import 'package:fluxer_app/core/database/tables/messages.dart';
import 'package:fluxer_app/features/chat/domain/message.dart'
    show MessageDeliveryState;
import 'package:fluxer_app/features/chat/domain/message_translation.dart';

part 'message_dao.g.dart';

typedef MessageKey = ({String channelId, String id});

@DriftAccessor(tables: [Messages])
class MessageDao extends DatabaseAccessor<FluxerDatabase>
    with _$MessageDaoMixin {
  MessageDao(super.attachedDatabase);

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
      final beforeMsg = await getMessage(channelId, beforeId);
      if (beforeMsg != null) {
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

  Future<void> upsertMessage(MessagesCompanion message) =>
      upsertMessages(<MessagesCompanion>[message]);

  Future<void> upsertMessages(
    List<MessagesCompanion> messageList, {
    Map<MessageKey, MessageTranslationSnapshot>? snapshots,
  }) async {
    if (messageList.isEmpty) {
      return;
    }
    final List<MessageKey> keys = <MessageKey>[
      for (final MessagesCompanion message in messageList)
        if (_keyOf(message) case final MessageKey key) key,
    ];
    final Map<MessageKey, MessageTranslationSnapshot> existing =
        snapshots ?? await getTranslationSnapshots(keys);
    final List<MessageKey> nonceLookupKeys = <MessageKey>[
      for (final MessagesCompanion message in messageList)
        if (_keyOf(message) case final MessageKey key
            when !message.clientNonce.present ||
                message.clientNonce.value == null)
          key,
    ];
    final Map<MessageKey, String> existingNonces = await _clientNonces(
      nonceLookupKeys,
    );
    final List<MessagesCompanion> companions = <MessagesCompanion>[
      for (final MessagesCompanion message in messageList)
        _keepExistingNonce(
          _clearStaleTranslation(message, existing[_keyOf(message)]?.content),
          existingNonces[_keyOf(message)],
        ),
    ];
    await batch((b) {
      for (final MessagesCompanion message in companions) {
        b.insert(messages, message, onConflict: DoUpdate((_) => message));
      }
    });
  }

  MessageKey? _keyOf(MessagesCompanion message) =>
      message.channelId.present && message.id.present
      ? (channelId: message.channelId.value, id: message.id.value)
      : null;

  Expression<bool> _matchesKeys(Iterable<MessageKey> keys) {
    final Map<String, List<String>> idsByChannel = <String, List<String>>{};
    for (final MessageKey key in keys) {
      (idsByChannel[key.channelId] ??= <String>[]).add(key.id);
    }
    return Expression.or(<Expression<bool>>[
      for (final MapEntry<String, List<String>> entry in idsByChannel.entries)
        messages.channelId.equals(entry.key) & messages.id.isIn(entry.value),
    ]);
  }

  Expression<bool> _matchesKey(String channelId, String id) =>
      messages.channelId.equals(channelId) & messages.id.equals(id);

  Future<void> saveTranslation({
    required String channelId,
    required String messageId,
    required MessageTranslation? translation,
  }) {
    return (update(
      messages,
    )..where((_) => _matchesKey(channelId, messageId))).write(
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

  Future<Map<MessageKey, MessageTranslationSnapshot>> getTranslationSnapshots(
    List<MessageKey> keys,
  ) async {
    if (keys.isEmpty) {
      return <MessageKey, MessageTranslationSnapshot>{};
    }
    final query = selectOnly(messages)
      ..addColumns([
        messages.channelId,
        messages.id,
        messages.content,
        messages.translatedContent,
        messages.translationSourceLanguage,
        messages.translatedSourceContent,
        messages.translationTargetLanguage,
        messages.translationShowOriginal,
      ])
      ..where(_matchesKeys(keys));
    final List<TypedResult> rows = await query.get();
    return <MessageKey, MessageTranslationSnapshot>{
      for (final TypedResult row in rows)
        (
          channelId: row.read(messages.channelId)!,
          id: row.read(messages.id)!,
        ): MessageTranslationSnapshot(
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

  MessagesCompanion _keepExistingNonce(
    MessagesCompanion message,
    String? existingNonce,
  ) {
    if (existingNonce == null || existingNonce.isEmpty) {
      return message;
    }
    if (message.clientNonce.present && message.clientNonce.value != null) {
      return message;
    }
    return message.copyWith(clientNonce: Value(existingNonce));
  }

  Future<Map<MessageKey, String>> _clientNonces(List<MessageKey> keys) async {
    if (keys.isEmpty) {
      return const <MessageKey, String>{};
    }
    final query = selectOnly(messages)
      ..addColumns([messages.channelId, messages.id, messages.clientNonce])
      ..where(_matchesKeys(keys) & messages.clientNonce.isNotNull());
    final List<TypedResult> rows = await query.get();
    final Map<MessageKey, String> nonces = <MessageKey, String>{};
    for (final TypedResult row in rows) {
      final String? nonce = row.read(messages.clientNonce);
      if (nonce == null || nonce.isEmpty) {
        continue;
      }
      nonces[(
            channelId: row.read(messages.channelId)!,
            id: row.read(messages.id)!,
          )] =
          nonce;
    }
    return nonces;
  }

  Future<Message?> getMessage(String channelId, String id) => (select(
    messages,
  )..where((_) => _matchesKey(channelId, id))).getSingleOrNull();

  Future<Set<MessageKey>> getExistingMessageKeys(
    Iterable<MessageKey> keys,
  ) async {
    if (keys.isEmpty) {
      return const <MessageKey>{};
    }
    final query = selectOnly(messages)
      ..addColumns([messages.channelId, messages.id])
      ..where(_matchesKeys(keys));
    return <MessageKey>{
      for (final TypedResult row in await query.get())
        (channelId: row.read(messages.channelId)!, id: row.read(messages.id)!),
    };
  }

  Stream<Message?> watchMessage(String channelId, String id) =>
      (select(messages)..where((_) => _matchesKey(channelId, id)))
          .watchSingleOrNull()
          .suppressDriftCancellation;

  Future<Message?> getLastMessage(String channelId) =>
      (select(messages)
            ..where((m) => m.channelId.equals(channelId))
            ..orderBy([
              (m) => OrderingTerm.desc(m.timestamp),
              (m) => OrderingTerm.desc(m.id.cast<int>()),
            ])
            ..limit(1))
          .getSingleOrNull();

  Future<String?> newestServerMessageId(String channelId) async {
    final Message? row =
        await (select(messages)
              ..where(
                (m) =>
                    m.channelId.equals(channelId) &
                    m.deliveryState.equals(MessageDeliveryState.sent.index),
              )
              ..orderBy([
                (m) => OrderingTerm.desc(m.timestamp),
                (m) => OrderingTerm.desc(m.id.cast<int>()),
              ])
              ..limit(1))
            .getSingleOrNull();
    return row?.id;
  }

  Future<Map<String, String>> getLastMessageIds(List<String> channelIds) async {
    if (channelIds.isEmpty) {
      return <String, String>{};
    }
    final String values = List<String>.filled(
      channelIds.length,
      '(?)',
    ).join(', ');
    final List<QueryRow> rows = await customSelect(
      'WITH ids(channel_id) AS (VALUES $values) '
      'SELECT ids.channel_id AS channel_id, ( '
      'SELECT m.id FROM "messages" m WHERE m.channel_id = ids.channel_id '
      'ORDER BY m.timestamp DESC, CAST(m.id AS INTEGER) DESC LIMIT 1 '
      ') AS last_id FROM ids',
      variables: <Variable<Object>>[
        for (final String channelId in channelIds) Variable<String>(channelId),
      ],
      readsFrom: <TableInfo<Table, Object?>>{messages},
    ).get();
    return <String, String>{
      for (final QueryRow row in rows)
        if (row.readNullable<String>('last_id') case final String id)
          row.read<String>('channel_id'): id,
    };
  }

  Stream<int> watchServerMessageCountAfter(String channelId, String afterId) {
    final Expression<int> count = messages.id.count();
    final query = selectOnly(messages)
      ..addColumns([count])
      ..where(
        messages.channelId.equals(channelId) &
            messages.deliveryState.equals(MessageDeliveryState.sent.index) &
            messages.id.cast<int>().isBiggerThanValue(int.parse(afterId)),
      );
    return query
        .map((TypedResult row) => row.read(count) ?? 0)
        .watchSingle()
        .suppressDriftCancellation;
  }

  Future<List<Message>> getMessagesAfter(
    String channelId,
    String afterId, {
    int limit = 30,
  }) async {
    final afterMsg = await getMessage(channelId, afterId);
    final query = select(messages)
      ..where((m) => m.channelId.equals(channelId))
      ..orderBy([
        (m) => OrderingTerm.asc(m.timestamp),
        (m) => OrderingTerm.asc(m.id.cast<int>()),
      ])
      ..limit(limit);
    if (afterMsg != null) {
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
    final reference = await getMessage(channelId, beforeId);
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

  Future<void> updateReactions(
    String channelId,
    String messageId,
    String json,
  ) => (update(messages)..where((_) => _matchesKey(channelId, messageId)))
      .write(MessagesCompanion(reactionsJson: Value(json)));

  Future<void> updateThreadJson({
    required String messageId,
    required String channelId,
    required String? json,
  }) => (update(messages)..where((_) => _matchesKey(channelId, messageId)))
      .write(MessagesCompanion(threadJson: Value(json)));

  Future<void> deleteMessages(String channelId, List<String> ids) {
    if (ids.isEmpty) {
      return Future.value();
    }
    return (delete(
      messages,
    )..where((m) => m.channelId.equals(channelId) & m.id.isIn(ids))).go();
  }

  // Drops tail rows deleted on the server while offline: https://feedback.fluxer.com/p/1863
  Future<void> deleteServerMessagesBetween(
    String channelId, {
    required String afterId,
    required String upToId,
  }) {
    final int afterSnowflake = int.parse(afterId);
    final int upToSnowflake = int.parse(upToId);
    return (delete(messages)..where(
          (m) =>
              m.channelId.equals(channelId) &
              m.id.cast<int>().isBiggerThanValue(afterSnowflake) &
              m.id.cast<int>().isSmallerOrEqualValue(upToSnowflake) &
              m.deliveryState.equals(MessageDeliveryState.sent.index),
        ))
        .go();
  }

  Future<void> deleteMessagesForChannel(String channelId) =>
      (delete(messages)..where((m) => m.channelId.equals(channelId))).go();

  Future<void> deleteSentMessagesForChannel(String channelId) =>
      (delete(messages)..where(
            (m) =>
                m.channelId.equals(channelId) &
                m.deliveryState.equals(MessageDeliveryState.sent.index),
          ))
          .go();

  Future<void> deleteMessagesForChannels(List<String> channelIds) {
    if (channelIds.isEmpty) {
      return Future.value();
    }
    return (delete(messages)..where((m) => m.channelId.isIn(channelIds))).go();
  }

  Future<void> deleteMessagesOutsideKnownChannels() {
    final $ChannelsTable channels = attachedDatabase.channels;
    final $DmChannelsTable dmChannels = attachedDatabase.dmChannels;
    return (delete(messages)..where(
          (m) =>
              m.channelId.isNotInQuery(
                selectOnly(channels)
                  ..addColumns(<Expression<Object>>[channels.id]),
              ) &
              m.channelId.isNotInQuery(
                selectOnly(dmChannels)
                  ..addColumns(<Expression<Object>>[dmChannels.id]),
              ),
        ))
        .go();
  }

  Future<int> keepNewestMessagesPerChannel(int limit) => customUpdate(
    '''
    DELETE FROM messages WHERE rowid IN (
      SELECT rowid FROM (
        SELECT rowid, ROW_NUMBER() OVER (
          PARTITION BY channel_id
          ORDER BY timestamp DESC, CAST(id AS INTEGER) DESC
        ) AS position
        FROM messages
      )
      WHERE position > ?
    )
    ''',
    variables: <Variable<Object>>[Variable<int>(limit)],
    updates: <TableInfo<Table, dynamic>>{messages},
    updateKind: UpdateKind.delete,
  );

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
