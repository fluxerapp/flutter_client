import 'package:drift/drift.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart';
import 'package:fluxer_app/core/database/tables/local_message_sends.dart';

part 'local_message_sends_dao.g.dart';

@DriftAccessor(tables: [LocalMessageSends])
class LocalMessageSendsDao extends DatabaseAccessor<FluxerDatabase>
    with _$LocalMessageSendsDaoMixin {
  LocalMessageSendsDao(super.attachedDatabase);

  Future<List<LocalMessageSend>> getForAuthor(String authorId) => (select(
    localMessageSends,
  )..where((t) => t.authorId.equals(authorId))).get();

  Future<void> upsert({
    required String clientNonce,
    required String channelId,
    required String authorId,
    required String payloadJson,
  }) => into(localMessageSends).insertOnConflictUpdate(
    LocalMessageSendsCompanion.insert(
      clientNonce: clientNonce,
      channelId: channelId,
      authorId: authorId,
      payloadJson: payloadJson,
    ),
  );

  Future<void> remove(String clientNonce) => (delete(
    localMessageSends,
  )..where((t) => t.clientNonce.equals(clientNonce))).go();

  Future<void> clearAll() => delete(localMessageSends).go();
}
