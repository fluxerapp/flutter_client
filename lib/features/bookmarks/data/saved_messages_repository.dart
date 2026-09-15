import 'package:fluxer_app/core/database/fluxer_database.dart' as db;
import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_dart/export.dart';

const String _kSavedMessagesFetchLimit = '100';

class SavedMessagesRepository {
  SavedMessagesRepository({
    required this._database,
    required this._client,
    required this._currentUserId,
  });

  final db.FluxerDatabase _database;
  final FluxerClient _client;
  final String? _currentUserId;

  Future<void> syncFromApi() async {
    final List<SavedMessageEntryResponse> entries = await _client.users
        .listSavedMessages(limit: _kSavedMessagesFetchLimit);
    await _database.savedMessageDao.clearAll();
    final List<db.MessagesCompanion> messagesToUpsert =
        <db.MessagesCompanion>[];
    for (final SavedMessageEntryResponse entry in entries) {
      await _database.savedMessageDao.addSavedMessage(entry.messageId);
      final MessageResponseSchema? schema = entry.message;
      if (entry.status == SavedMessageEntryResponseStatusStatus.available &&
          schema != null) {
        messagesToUpsert.add(
          Message.fromSdk(schema, currentUserId: _currentUserId).toCompanion(),
        );
      }
    }
    if (messagesToUpsert.isNotEmpty) {
      await _database.messageDao.upsertMessages(messagesToUpsert);
    }
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
