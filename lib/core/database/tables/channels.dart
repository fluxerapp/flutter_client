import 'package:drift/drift.dart';

@TableIndex(name: 'idx_channels_guild', columns: {#guildId})
@TableIndex(
  name: 'idx_channels_guild_parent_type',
  columns: {#guildId, #parentId, #type},
)
class Channels extends Table {
  TextColumn get id => text()();
  TextColumn get guildId => text()();
  TextColumn get name => text()();
  TextColumn get url => text().nullable()();
  IntColumn get type => integer().withDefault(const Constant(0))();
  TextColumn get topic => text().nullable()();
  TextColumn get parentId => text().nullable()();
  IntColumn get position => integer().withDefault(const Constant(0))();
  TextColumn get lastMessageId => text().nullable()();
  TextColumn get lastPinTimestamp => text().nullable()();
  IntColumn get rateLimitPerUser => integer().withDefault(const Constant(0))();
  BoolColumn get nsfw => boolean().withDefault(const Constant(false))();
  BoolColumn get nsfwOverride => boolean().nullable()();
  IntColumn get contentWarningLevel =>
      integer().withDefault(const Constant(0))();
  TextColumn get contentWarningText => text().nullable()();
  TextColumn get permissionOverwritesJson => text().nullable()();
  IntColumn get userLimit => integer().nullable()();
  IntColumn get bitrate => integer().nullable()();
  TextColumn get rtcRegion => text().nullable()();
  IntColumn get voiceConnectionLimit => integer().nullable()();
  TextColumn get ownerId => text().nullable()();
  IntColumn get flags => integer().nullable()();
  BoolColumn get threadArchived => boolean().nullable()();
  BoolColumn get threadLocked => boolean().nullable()();
  BoolColumn get threadInvitable => boolean().nullable()();
  IntColumn get threadAutoArchiveDuration => integer().nullable()();
  TextColumn get threadArchiveTimestamp => text().nullable()();
  TextColumn get threadCreateTimestamp => text().nullable()();
  IntColumn get messageCount => integer().nullable()();
  IntColumn get totalMessageSent => integer().nullable()();
  IntColumn get memberCount => integer().nullable()();
  TextColumn get appliedTagsJson => text().nullable()();
  IntColumn get defaultAutoArchiveDuration => integer().nullable()();
  IntColumn get defaultThreadRateLimitPerUser => integer().nullable()();
  TextColumn get availableTagsJson => text().nullable()();
  TextColumn get defaultReactionEmojiJson => text().nullable()();
  IntColumn get defaultSortOrder => integer().nullable()();
  IntColumn get defaultForumLayout => integer().nullable()();
  TextColumn get defaultTagSetting => text().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}
