import 'package:drift/drift.dart';

class LocalMessageSends extends Table {
  TextColumn get clientNonce => text()();
  TextColumn get channelId => text()();
  TextColumn get authorId => text()();
  TextColumn get payloadJson => text()();

  @override
  String get tableName => 'local_message_sends';

  @override
  Set<Column> get primaryKey => {clientNonce};
}
