import 'package:drift/drift.dart';

@TableIndex(name: 'idx_guild_emojis_guild', columns: {#guildId})
class GuildEmojis extends Table {
  TextColumn get id => text()();
  TextColumn get guildId => text()();
  TextColumn get name => text()();
  BoolColumn get animated => boolean().withDefault(const Constant(false))();

  @override
  Set<Column> get primaryKey => {id};
}
