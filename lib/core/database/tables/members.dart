import 'package:drift/drift.dart';

@TableIndex(name: 'idx_members_guild', columns: {#guildId})
class Members extends Table {
  TextColumn get userId => text()();
  TextColumn get guildId => text()();
  TextColumn get nick => text().nullable()();
  TextColumn get serverAvatar => text().nullable()();
  TextColumn get roleIdsJson => text().withDefault(const Constant('[]'))();
  DateTimeColumn get joinedAt => dateTime().nullable()();
  DateTimeColumn get communicationDisabledUntil => dateTime().nullable()();
  IntColumn get mentionFlags => integer().nullable()();
  IntColumn get profileFlags => integer().nullable()();

  @override
  Set<Column> get primaryKey => {userId, guildId};
}
