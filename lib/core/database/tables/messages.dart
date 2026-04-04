import 'package:drift/drift.dart';

@TableIndex(name: 'idx_messages_channel', columns: {#channelId})
@TableIndex(name: 'idx_messages_author', columns: {#authorId})
class Messages extends Table {
  TextColumn get id => text()();
  TextColumn get channelId => text()();
  TextColumn get authorId => text()();
  TextColumn get authorName => text().withDefault(const Constant(''))();
  TextColumn get authorAvatar => text().nullable()();
  IntColumn get authorAvatarColor => integer().nullable()();
  TextColumn get content => text()();
  DateTimeColumn get timestamp => dateTime()();
  DateTimeColumn get editedTimestamp => dateTime().nullable()();
  TextColumn get embedsJson => text().withDefault(const Constant('[]'))();
  TextColumn get attachmentsJson => text().withDefault(const Constant('[]'))();
  TextColumn get reactionsJson => text().withDefault(const Constant('[]'))();
  TextColumn get replyToId => text().nullable()();
  TextColumn get forwardedFrom => text().nullable()();
  TextColumn get messageReferenceJson => text().nullable()();
  TextColumn get messageSnapshotsJson =>
      text().withDefault(const Constant('[]'))();
  BoolColumn get pinned => boolean().withDefault(const Constant(false))();
  BoolColumn get isMentioned => boolean().withDefault(const Constant(false))();
  IntColumn get type => integer().withDefault(const Constant(0))();

  @override
  Set<Column> get primaryKey => {id};
}
