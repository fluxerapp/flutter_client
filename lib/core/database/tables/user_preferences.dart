import 'package:drift/drift.dart';

class UserPreferencesTable extends Table {
  TextColumn get userId => text()();
  TextColumn get theme => text().withDefault(const Constant('dark'))();
  RealColumn get scaleFactor => real().withDefault(const Constant(1))();
  BoolColumn get plutoniumUpsellDismissed =>
      boolean().withDefault(const Constant(false))();
  TextColumn get emojiSkinTone => text().withDefault(const Constant(''))();

  @override
  String get tableName => 'user_preferences';

  @override
  Set<Column> get primaryKey => {userId};
}
