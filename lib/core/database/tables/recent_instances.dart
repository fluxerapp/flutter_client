import 'package:drift/drift.dart';

class RecentInstances extends Table {
  TextColumn get domain => text()();
  TextColumn get name => text().nullable()();
  DateTimeColumn get lastUsed => dateTime().withDefault(currentDateAndTime)();

  @override
  Set<Column> get primaryKey => {domain};
}
