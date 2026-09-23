import 'package:fluxer_app/core/database/fluxer_database.dart' as db;
import 'package:fluxer_app/features/bookmarks/domain/saved_messages.dart';
import 'package:fluxer_app/features/channels/data/read_state_utils.dart';
import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_dart/export.dart';

const int kSavedMessagesPageSize = 50;

class SavedMessagesRepository {
  SavedMessagesRepository({
    required this._database,
    required this._client,
    required this._currentUserId,
  });

  final db.FluxerDatabase _database;
  final FluxerClient _client;
  final String? _currentUserId;

  Future<SavedMessagesFetchPage> fetch({String? before}) async {
    final List<SavedMessageEntryResponse> entries = await _client.users
        .listSavedMessages(limit: '$kSavedMessagesPageSize', before: before);
    final List<Message> messages = <Message>[];
    final List<SavedMessageMissingEntry> missing = <SavedMessageMissingEntry>[];
    final List<db.MessagesCompanion> toUpsert = <db.MessagesCompanion>[];
    for (final SavedMessageEntryResponse entry in entries) {
      final MessageResponseSchema? schema = entry.message;
      if (entry.status == SavedMessageStatusSchema.available &&
          schema != null) {
        final Message message = Message.fromSdk(
          schema,
          currentUserId: _currentUserId,
        );
        messages.add(message);
        toUpsert.add(message.toCompanion());
      } else {
        missing.add(
          SavedMessageMissingEntry(
            id: entry.id,
            channelId: entry.channelId,
            messageId: entry.messageId,
          ),
        );
      }
    }
    messages.sort((Message a, Message b) => compareSnowflakeIds(b.id, a.id));
    await _database.transaction(() async {
      for (final SavedMessageEntryResponse entry in entries.reversed) {
        await _database.savedMessageDao.addSavedMessage(entry.messageId);
      }
      if (toUpsert.isNotEmpty) {
        await _database.messageDao.upsertMessages(toUpsert);
      }
    });
    return SavedMessagesFetchPage(
      messages: messages,
      missing: missing,
      hasMore: entries.length == kSavedMessagesPageSize,
      cursor: entries.isEmpty ? null : entries.last.messageId,
    );
  }

  Future<void> saveMessage({
    required String channelId,
    required String messageId,
  }) async {
    await _client.users.saveMessage(
      body: SaveMessageRequest(channelId: channelId, messageId: messageId),
    );
    await _database.savedMessageDao.addSavedMessage(messageId);
  }

  Future<void> unsaveMessage(String messageId) async {
    await _database.savedMessageDao.removeSavedMessage(messageId);
    try {
      await _client.users.unsaveMessage(messageId: messageId);
    } on Object {
      await _database.savedMessageDao.addSavedMessage(messageId);
      rethrow;
    }
  }
}
