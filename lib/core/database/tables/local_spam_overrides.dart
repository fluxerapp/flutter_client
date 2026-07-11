import 'package:drift/drift.dart';

class LocalSpamOverrides extends Table {
  IntColumn get id => integer().withDefault(const Constant(1))();
  TextColumn get spammerUserIdsJson =>
      text().withDefault(const Constant('[]'))();
  TextColumn get notSpammerUserIdsJson =>
      text().withDefault(const Constant('[]'))();

  @override
  String get tableName => 'local_spam_overrides';

  @override
  Set<Column> get primaryKey => {id};
}
