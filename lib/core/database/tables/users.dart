import 'package:drift/drift.dart';

class Users extends Table {
  TextColumn get id => text()();
  TextColumn get username => text()();
  TextColumn get discriminator => text().withDefault(const Constant('0'))();
  TextColumn get globalName => text().nullable()();
  TextColumn get avatar => text().nullable()();
  IntColumn get avatarColor => integer().nullable()();
  BoolColumn get bot => boolean().withDefault(const Constant(false))();
  BoolColumn get system => boolean().withDefault(const Constant(false))();
  TextColumn get status => text().withDefault(const Constant('offline'))();
  BoolColumn get mobile => boolean().withDefault(const Constant(false))();
  TextColumn get customStatus => text().nullable()();
  DateTimeColumn get memberSince => dateTime().nullable()();
  TextColumn get bio => text().nullable()();
  TextColumn get pronouns => text().nullable()();
  IntColumn get accentColor => integer().nullable()();
  TextColumn get banner => text().nullable()();
  BoolColumn get premiumBadgeHidden => boolean().nullable()();
  BoolColumn get premiumBadgeMasked => boolean().nullable()();
  BoolColumn get premiumBadgeTimestampHidden => boolean().nullable()();
  BoolColumn get premiumBadgeSequenceHidden => boolean().nullable()();
  IntColumn get mentionFlags => integer().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}
