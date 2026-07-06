import 'package:drift/drift.dart';

class DmChannels extends Table {
  TextColumn get id => text()();
  IntColumn get type => integer().withDefault(const Constant(1))();
  TextColumn get recipientId => text()();
  TextColumn get name => text().nullable()();
  TextColumn get icon => text().nullable()();
  IntColumn get recipientCount => integer().withDefault(const Constant(2))();
  TextColumn get recipientIds => text().withDefault(const Constant('[]'))();
  TextColumn get nicksJson => text().withDefault(const Constant('{}'))();
  TextColumn get lastMessage => text().withDefault(const Constant(''))();
  TextColumn get lastMessageId => text().nullable()();
  TextColumn get lastMessageAuthorId => text().nullable()();
  DateTimeColumn get lastMessageTime =>
      dateTime().withDefault(currentDateAndTime)();
  IntColumn get unreadCount => integer().withDefault(const Constant(0))();

  @override
  Set<Column> get primaryKey => {id};
}
