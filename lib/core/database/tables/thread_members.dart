import 'package:drift/drift.dart';

@TableIndex(name: 'idx_thread_members_guild', columns: {#guildId})
class ThreadMembers extends Table {
  TextColumn get threadId => text()();
  TextColumn get guildId => text()();
  TextColumn get joinTimestamp => text().nullable()();
  IntColumn get flags => integer().withDefault(const Constant(0))();
  BoolColumn get muted => boolean().withDefault(const Constant(false))();
  TextColumn get muteConfigJson => text().nullable()();

  @override
  Set<Column> get primaryKey => {threadId};
}
