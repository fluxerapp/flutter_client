import 'package:drift/drift.dart';

class Servers extends Table {
  TextColumn get id => text()();
  TextColumn get name => text()();
  TextColumn get icon => text().nullable()();
  TextColumn get banner => text().nullable()();
  TextColumn get splash => text().nullable()();
  TextColumn get embedSplash => text().nullable()();
  IntColumn get splashCardAlignment =>
      integer().withDefault(const Constant(0))();
  DateTimeColumn get messageHistoryCutoff => dateTime().nullable()();
  IntColumn get memberCount => integer().withDefault(const Constant(0))();
  IntColumn get onlineCount => integer().withDefault(const Constant(0))();
  TextColumn get description => text().nullable()();
  TextColumn get ownerId => text().nullable()();
  IntColumn get position => integer().withDefault(const Constant(0))();
  TextColumn get featuresJson => text().withDefault(const Constant('[]'))();
  BoolColumn get unavailable => boolean().withDefault(const Constant(false))();
  IntColumn get disabledOperations =>
      integer().withDefault(const Constant(0))();
  IntColumn get verificationLevel => integer().withDefault(const Constant(0))();
  IntColumn get mfaLevel => integer().withDefault(const Constant(0))();
  BoolColumn get nsfw => boolean().withDefault(const Constant(false))();
  IntColumn get contentWarningLevel =>
      integer().withDefault(const Constant(0))();
  TextColumn get contentWarningText => text().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}
