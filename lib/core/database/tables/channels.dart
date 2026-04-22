import 'package:drift/drift.dart';

@TableIndex(name: 'idx_channels_guild', columns: {#guildId})
class Channels extends Table {
  TextColumn get id => text()();
  TextColumn get guildId => text()();
  TextColumn get name => text()();
  TextColumn get url => text().nullable()();
  IntColumn get type => integer().withDefault(const Constant(0))();
  TextColumn get topic => text().nullable()();
  TextColumn get parentId => text().nullable()();
  IntColumn get position => integer().withDefault(const Constant(0))();
  TextColumn get lastMessageId => text().nullable()();
  IntColumn get rateLimitPerUser =>
      integer().withDefault(const Constant(0))();

  @override
  Set<Column> get primaryKey => {id};
}
