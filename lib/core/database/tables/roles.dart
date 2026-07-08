import 'package:drift/drift.dart';

@TableIndex(name: 'idx_roles_guild', columns: {#guildId})
class Roles extends Table {
  TextColumn get id => text()();
  TextColumn get guildId => text()();
  TextColumn get name => text()();
  IntColumn get color => integer().withDefault(const Constant(0))();
  IntColumn get position => integer().withDefault(const Constant(0))();
  BoolColumn get hoist => boolean().withDefault(const Constant(false))();
  BoolColumn get mentionable => boolean().withDefault(const Constant(false))();
  TextColumn get permissions => text().withDefault(const Constant('0'))();
  IntColumn get hoistPosition => integer().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}
