import 'package:drift/drift.dart';

@DataClassName('LocalSettingRow')
class LocalSettingsTable extends Table {
  TextColumn get scope => text()();
  TextColumn get key => text()();
  TextColumn get value => text()();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();

  @override
  String get tableName => 'local_settings';

  @override
  Set<Column> get primaryKey => {scope, key};
}
