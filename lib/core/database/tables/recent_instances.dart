import 'package:drift/drift.dart';

class RecentInstances extends Table {
  TextColumn get domain => text()();
  TextColumn get name => text().nullable()();
  TextColumn get url => text().nullable()();
  DateTimeColumn get lastUsed => dateTime().withDefault(currentDateAndTime)();

  @override
  Set<Column> get primaryKey => {domain};
}
