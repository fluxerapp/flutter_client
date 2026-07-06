import 'package:drift/drift.dart';
import 'package:fluxer_app/core/database/drift_stream_utils.dart';

import 'package:fluxer_app/core/database/fluxer_database.dart';
import 'package:fluxer_app/core/database/tables/saved_messages.dart';

part 'saved_message_dao.g.dart';

@DriftAccessor(tables: [SavedMessages])
class SavedMessageDao extends DatabaseAccessor<FluxerDatabase>
    with _$SavedMessageDaoMixin {
  SavedMessageDao(super.attachedDatabase);

  Stream<List<SavedMessage>> watchAll() =>
      select(savedMessages).watch().suppressDriftCancellation;

  Stream<bool> watchIsSaved(String messageId) =>
      (select(savedMessages)..where((s) => s.messageId.equals(messageId)))
          .watch()
          .map((rows) => rows.isNotEmpty)
          .suppressDriftCancellation;

  Future<bool> isSaved(String messageId) async {
    final row = await (select(
      savedMessages,
    )..where((s) => s.messageId.equals(messageId))).getSingleOrNull();
    return row != null;
  }

  Future<void> addSavedMessage(String messageId) => into(
    savedMessages,
  ).insertOnConflictUpdate(SavedMessagesCompanion.insert(messageId: messageId));

  Future<void> removeSavedMessage(String messageId) =>
      (delete(savedMessages)..where((s) => s.messageId.equals(messageId))).go();

  Future<void> clearAll() => delete(savedMessages).go();
}
