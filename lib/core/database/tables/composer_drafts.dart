import 'package:drift/drift.dart';

class ComposerDrafts extends Table {
  TextColumn get channelId => text()();
  TextColumn get content => text().withDefault(const Constant(''))();
  TextColumn get replyToMessageId => text().nullable()();
  BoolColumn get replyMentioning => boolean().nullable()();

  @override
  Set<Column> get primaryKey => {channelId};
}
