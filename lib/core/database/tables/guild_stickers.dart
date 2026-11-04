import 'package:drift/drift.dart';

@TableIndex(name: 'idx_guild_stickers_guild', columns: {#guildId})
class GuildStickers extends Table {
  TextColumn get id => text()();
  TextColumn get guildId => text()();
  TextColumn get name => text()();
  TextColumn get description => text().withDefault(const Constant(''))();
  TextColumn get tagsJson => text().withDefault(const Constant('[]'))();
  BoolColumn get animated => boolean().withDefault(const Constant(false))();

  @override
  Set<Column> get primaryKey => {id};
}
