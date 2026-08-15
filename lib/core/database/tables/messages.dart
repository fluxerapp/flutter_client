import 'package:drift/drift.dart';

@TableIndex(name: 'idx_messages_channel', columns: {#channelId})
@TableIndex(name: 'idx_messages_author', columns: {#authorId})
@TableIndex(
  name: 'idx_messages_channel_timestamp',
  columns: {#channelId, #timestamp},
)
class Messages extends Table {
  TextColumn get id => text()();
  TextColumn get channelId => text()();
  TextColumn get authorId => text()();
  TextColumn get authorName => text().withDefault(const Constant(''))();
  TextColumn get authorAvatar => text().nullable()();
  IntColumn get authorAvatarColor => integer().nullable()();
  BoolColumn get authorIsBot => boolean().withDefault(const Constant(false))();
  BoolColumn get authorIsSystem =>
      boolean().withDefault(const Constant(false))();
  IntColumn get authorPublicFlags => integer().withDefault(const Constant(0))();
  TextColumn get webhookId => text().nullable()();
  TextColumn get content => text()();
  DateTimeColumn get timestamp => dateTime()();
  DateTimeColumn get editedTimestamp => dateTime().nullable()();
  TextColumn get embedsJson => text().withDefault(const Constant('[]'))();
  TextColumn get attachmentsJson => text().withDefault(const Constant('[]'))();
  TextColumn get stickersJson => text().withDefault(const Constant('[]'))();
  TextColumn get reactionsJson => text().withDefault(const Constant('[]'))();
  TextColumn get replyToId => text().nullable()();
  TextColumn get forwardedFrom => text().nullable()();
  TextColumn get messageReferenceJson => text().nullable()();
  TextColumn get messageSnapshotsJson =>
      text().withDefault(const Constant('[]'))();
  BoolColumn get pinned => boolean().withDefault(const Constant(false))();
  BoolColumn get isMentioned => boolean().withDefault(const Constant(false))();
  TextColumn get mentionedUserIdsJson =>
      text().withDefault(const Constant('[]'))();
  TextColumn get mentionChannelsJson =>
      text().withDefault(const Constant('[]'))();
  IntColumn get type => integer().withDefault(const Constant(0))();
  IntColumn get flags => integer().withDefault(const Constant(0))();
  IntColumn get deliveryState => integer().withDefault(const Constant(1))();
  TextColumn get clientNonce => text().nullable()();
  TextColumn get sendError => text().nullable()();
  TextColumn get callJson => text().nullable()();
  TextColumn get translatedContent => text().nullable()();
  TextColumn get translationSourceLanguage => text().nullable()();
  TextColumn get translatedSourceContent => text().nullable()();
  TextColumn get translationTargetLanguage => text().nullable()();
  BoolColumn get translationShowOriginal =>
      boolean().withDefault(const Constant(false))();

  @override
  Set<Column> get primaryKey => {id};
}
