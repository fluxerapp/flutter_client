import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:flutter/foundation.dart';
import 'package:fluxer_app/core/database/daos/auth_session_dao.dart';
import 'package:fluxer_app/core/database/daos/channel_dao.dart';
import 'package:fluxer_app/core/database/daos/composer_draft_dao.dart';
import 'package:fluxer_app/core/database/daos/dm_channel_dao.dart';
import 'package:fluxer_app/core/database/daos/dm_folder_settings_dao.dart';
import 'package:fluxer_app/core/database/daos/emoji_usage_dao.dart';
import 'package:fluxer_app/core/database/daos/favorite_channels_dao.dart';
import 'package:fluxer_app/core/database/daos/favorite_memes_dao.dart';
import 'package:fluxer_app/core/database/daos/guild_dao.dart';
import 'package:fluxer_app/core/database/daos/guild_emoji_dao.dart';
import 'package:fluxer_app/core/database/daos/guild_last_channel_dao.dart';
import 'package:fluxer_app/core/database/daos/guild_sticker_dao.dart';
import 'package:fluxer_app/core/database/daos/member_dao.dart';
import 'package:fluxer_app/core/database/daos/message_dao.dart';
import 'package:fluxer_app/core/database/daos/mobile_push_registration_dao.dart';
import 'package:fluxer_app/core/database/daos/notification_dao.dart';
import 'package:fluxer_app/core/database/daos/pinned_dms_dao.dart';
import 'package:fluxer_app/core/database/daos/read_state_dao.dart';
import 'package:fluxer_app/core/database/daos/recent_instances_dao.dart';
import 'package:fluxer_app/core/database/daos/relationship_dao.dart';
import 'package:fluxer_app/core/database/daos/role_dao.dart';
import 'package:fluxer_app/core/database/daos/rtc_regions_dao.dart';
import 'package:fluxer_app/core/database/daos/saved_message_dao.dart';
import 'package:fluxer_app/core/database/daos/user_dao.dart';
import 'package:fluxer_app/core/database/daos/user_guild_settings_dao.dart';
import 'package:fluxer_app/core/database/daos/user_notes_dao.dart';
import 'package:fluxer_app/core/database/daos/user_preferences_dao.dart';
import 'package:fluxer_app/core/database/daos/user_settings_dao.dart';
import 'package:fluxer_app/core/database/tables/auth_sessions.dart';
import 'package:fluxer_app/core/database/tables/channels.dart';
import 'package:fluxer_app/core/database/tables/composer_drafts.dart';
import 'package:fluxer_app/core/database/tables/dm_channels.dart';
import 'package:fluxer_app/core/database/tables/dm_folder_settings.dart';
import 'package:fluxer_app/core/database/tables/emoji_usage.dart';
import 'package:fluxer_app/core/database/tables/favorite_categories.dart';
import 'package:fluxer_app/core/database/tables/favorite_channels.dart';
import 'package:fluxer_app/core/database/tables/favorite_memes.dart';
import 'package:fluxer_app/core/database/tables/favorite_settings.dart';
import 'package:fluxer_app/core/database/tables/guild_emojis.dart';
import 'package:fluxer_app/core/database/tables/guild_last_channels.dart';
import 'package:fluxer_app/core/database/tables/guild_stickers.dart';
import 'package:fluxer_app/core/database/tables/member_cache_access.dart';
import 'package:fluxer_app/core/database/tables/members.dart';
import 'package:fluxer_app/core/database/tables/messages.dart';
import 'package:fluxer_app/core/database/tables/mobile_push_registrations.dart';
import 'package:fluxer_app/core/database/tables/notification_mention_feed.dart';
import 'package:fluxer_app/core/database/tables/notification_mention_prefs.dart';
import 'package:fluxer_app/core/database/tables/notification_unread_collapsed.dart';
import 'package:fluxer_app/core/database/tables/pinned_dms.dart';
import 'package:fluxer_app/core/database/tables/read_states.dart';
import 'package:fluxer_app/core/database/tables/recent_instances.dart';
import 'package:fluxer_app/core/database/tables/relationships.dart';
import 'package:fluxer_app/core/database/tables/roles.dart';
import 'package:fluxer_app/core/database/tables/rtc_regions.dart';
import 'package:fluxer_app/core/database/tables/saved_messages.dart';
import 'package:fluxer_app/core/database/tables/servers.dart';
import 'package:fluxer_app/core/database/tables/user_guild_settings.dart';
import 'package:fluxer_app/core/database/tables/user_notes.dart';
import 'package:fluxer_app/core/database/tables/user_preferences.dart';
import 'package:fluxer_app/core/database/tables/user_settings.dart';
import 'package:fluxer_app/core/database/tables/users.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

part 'fluxer_database.g.dart';

@DriftDatabase(
  tables: [
    AuthSessions,
    Users,
    Servers,
    Channels,
    Messages,
    Roles,
    Members,
    MemberCacheAccess,
    Relationships,
    DmChannels,
    ReadStates,
    UserPreferencesTable,
    EmojiUsage,
    GuildLastChannels,
    UserSettingsTable,
    UserGuildSettingsTable,
    UserNotesTable,
    PinnedDmsTable,
    FavoriteMemesTable,
    RtcRegionsTable,
    GuildEmojis,
    GuildStickers,
    SavedMessages,
    DmFolderSettingsTable,
    NotificationUnreadCollapsed,
    NotificationMentionFeed,
    NotificationMentionPrefs,
    FavoriteChannels,
    FavoriteCategories,
    FavoriteSettings,
    MobilePushRegistrations,
    ComposerDrafts,
    RecentInstances,
  ],
  daos: [
    AuthSessionDao,
    MobilePushRegistrationDao,
    UserDao,
    GuildDao,
    ChannelDao,
    MessageDao,
    RoleDao,
    MemberDao,
    RelationshipDao,
    DmChannelDao,
    ReadStateDao,
    UserPreferencesDao,
    EmojiUsageDao,
    GuildLastChannelDao,
    ComposerDraftDao,
    UserSettingsDao,
    UserGuildSettingsDao,
    UserNotesDao,
    PinnedDmsDao,
    FavoriteMemesDao,
    RtcRegionsDao,
    GuildEmojiDao,
    GuildStickerDao,
    SavedMessageDao,
    DmFolderSettingsDao,
    NotificationDao,
    FavoriteChannelsDao,
    RecentInstancesDao,
  ],
)
class FluxerDatabase extends _$FluxerDatabase {
  FluxerDatabase() : super(_openConnection());

  FluxerDatabase.forTesting(super.e);

  @override
  int get schemaVersion => 61;

  @override
  MigrationStrategy get migration => MigrationStrategy(
    onCreate: (m) => m.createAll(),
    onUpgrade: (m, from, to) async {
      if (from < 2) {
        // v2: Add author metadata columns to messages, add indexes.
        await m.addColumn(messages, messages.authorName);
        await m.addColumn(messages, messages.authorAvatar);
        await m.addColumn(messages, messages.authorAvatarColor);

        await m.createIndex(
          Index(
            'idx_messages_channel',
            'CREATE INDEX idx_messages_channel ON messages (channel_id)',
          ),
        );
        await m.createIndex(
          Index(
            'idx_messages_author',
            'CREATE INDEX idx_messages_author ON messages (author_id)',
          ),
        );
        await m.createIndex(
          Index(
            'idx_channels_server',
            'CREATE INDEX idx_channels_server ON channels (server_id)',
          ),
        );
        await m.createIndex(
          Index(
            'idx_roles_server',
            'CREATE INDEX idx_roles_server ON roles (server_id)',
          ),
        );
        await m.createIndex(
          Index(
            'idx_members_server',
            'CREATE INDEX idx_members_server ON members (server_id)',
          ),
        );
      }
      if (from < 3) {
        await m.createTable(userPreferencesTable);
      }
      if (from < 4) {
        await m.addColumn(messages, messages.type);
      }
      if (from < 5) {
        await m.createTable(emojiUsage);
      }
      if (from < 6) {
        await m.addColumn(dmChannels, dmChannels.type);
        await m.addColumn(dmChannels, dmChannels.name);
        await m.addColumn(dmChannels, dmChannels.recipientCount);
      }
      if (from < 7) {
        await m.addColumn(servers, servers.featuresJson);
      }
      if (from < 8) {
        await m.createTable(guildLastChannels);
      }
      if (from < 9) {
        await m.addColumn(dmChannels, dmChannels.lastMessageAuthorId);
      }
      if (from < 10) {
        await m.createTable(userSettingsTable);
        await m.createTable(userGuildSettingsTable);
        await m.createTable(userNotesTable);
        await m.createTable(pinnedDmsTable);
        await m.createTable(favoriteMemesTable);
        await m.createTable(rtcRegionsTable);
      }
      if (from < 11) {
        await m.createTable(guildEmojis);
        await m.createTable(guildStickers);
        await m.createTable(savedMessages);
        await m.addColumn(readStates, readStates.lastPinTimestamp);
      }
      if (from < 12) {
        await m.addColumn(servers, servers.unavailable);
      }
      if (from < 13) {
        await m.addColumn(channels, channels.lastMessageId);
      }
      if (from < 14) {
        await m.addColumn(users, users.memberSince);
        await m.addColumn(authSessions, authSessions.username);
        await m.addColumn(authSessions, authSessions.discriminator);
        await m.addColumn(authSessions, authSessions.avatar);
        await m.addColumn(authSessions, authSessions.isValid);
        await m.addColumn(authSessions, authSessions.lastActive);
      }
      if (from < 15) {
        await m.addColumn(roles, roles.permissions);
      }
      if (from < 16) {
        await m.createTable(dmFolderSettingsTable);
      }
      if (from < 17) {
        // v17: Rename columns to match SDK naming conventions.
        // serverId → guildId on channels, members, roles.
        await m.renameColumn(channels, 'server_id', channels.guildId);
        await m.renameColumn(members, 'server_id', members.guildId);
        await m.renameColumn(roles, 'server_id', roles.guildId);
        // nickname → nick on members.
        await m.renameColumn(members, 'nickname', members.nick);
        // isHoisted → hoist on roles.
        await m.renameColumn(roles, 'is_hoisted', roles.hoist);
        // isBot → bot on users.
        await m.renameColumn(users, 'is_bot', users.bot);
        // isPinned → pinned on messages.
        await m.renameColumn(messages, 'is_pinned', messages.pinned);

        // Recreate indexes with updated names.
        await customStatement('DROP INDEX IF EXISTS idx_channels_server');
        await customStatement('DROP INDEX IF EXISTS idx_members_server');
        await customStatement('DROP INDEX IF EXISTS idx_roles_server');
        await m.createIndex(
          Index(
            'idx_channels_guild',
            'CREATE INDEX idx_channels_guild ON channels (guild_id)',
          ),
        );
        await m.createIndex(
          Index(
            'idx_members_guild',
            'CREATE INDEX idx_members_guild ON members (guild_id)',
          ),
        );
        await m.createIndex(
          Index(
            'idx_roles_guild',
            'CREATE INDEX idx_roles_guild ON roles (guild_id)',
          ),
        );
      }
      if (from < 18) {
        // v18: Add system column to users.
        await m.addColumn(users, users.system);
      }
      if (from < 19) {
        // v19: Add icon and recipientIds columns to dmChannels.
        await m.addColumn(dmChannels, dmChannels.icon);
        await m.addColumn(dmChannels, dmChannels.recipientIds);
      }
      if (from < 20) {
        // v20: Add plutoniumUpsellDismissed
        await m.addColumn(
          userPreferencesTable,
          userPreferencesTable.plutoniumUpsellDismissed,
        );
      }
      if (from < 21) {
        // v21: Add emojiSkinTone
        await m.addColumn(
          userPreferencesTable,
          userPreferencesTable.emojiSkinTone,
        );
      }
      if (from < 22) {
        // v22: Add message reference and snapshot JSON columns
        await m.addColumn(messages, messages.messageReferenceJson);
        await m.addColumn(messages, messages.messageSnapshotsJson);
      }
      if (from < 23) {
        // v23: Add profile columns to users
        await m.addColumn(users, users.bio);
        await m.addColumn(users, users.pronouns);
        await m.addColumn(users, users.accentColor);
        await m.addColumn(users, users.banner);
      }
      if (from < 24) {
        await m.addColumn(users, users.premiumBadgeHidden);
        await m.addColumn(users, users.premiumBadgeMasked);
        await m.addColumn(users, users.premiumBadgeTimestampHidden);
        await m.addColumn(users, users.premiumBadgeSequenceHidden);
      }
      if (from < 25) {
        await m.addColumn(channels, channels.url);
      }
      if (from < 26) {
        await m.addColumn(channels, channels.rateLimitPerUser);
      }
      if (from < 27) {
        await m.addColumn(
          userPreferencesTable,
          userPreferencesTable.chatFontSize,
        );
        await m.addColumn(
          userPreferencesTable,
          userPreferencesTable.syncAcrossDevices,
        );
        await m.addColumn(
          userPreferencesTable,
          userPreferencesTable.channelTypingIndicatorMode,
        );
        await m.addColumn(
          userPreferencesTable,
          userPreferencesTable.showSelectedChannelTypingIndicator,
        );
        await m.addColumn(
          userPreferencesTable,
          userPreferencesTable.collapseDMs,
        );
        await m.addColumn(
          userPreferencesTable,
          userPreferencesTable.showFadedUnreadOnMutedChannels,
        );
        await m.addColumn(
          userPreferencesTable,
          userPreferencesTable.showActiveNow,
        );
        await m.addColumn(
          userPreferencesTable,
          userPreferencesTable.showFavorites,
        );
      }
      if (from < 28) {
        await m.addColumn(
          userPreferencesTable,
          userPreferencesTable.hideKeyboardHints,
        );
      }
      if (from < 29) {
        await m.addColumn(channels, channels.permissionOverwritesJson);
      }
      if (from < 30) {
        await m.addColumn(
          userPreferencesTable,
          userPreferencesTable.embedMediaDimensionSize,
        );
        await m.addColumn(
          userPreferencesTable,
          userPreferencesTable.attachmentMediaDimensionSize,
        );
        await m.addColumn(
          userPreferencesTable,
          userPreferencesTable.autoSendKlipyGifs,
        );
        await m.addColumn(
          userPreferencesTable,
          userPreferencesTable.showDefaultEmojisInExpressionAutocomplete,
        );
        await m.addColumn(
          userPreferencesTable,
          userPreferencesTable.showCustomEmojisInExpressionAutocomplete,
        );
        await m.addColumn(
          userPreferencesTable,
          userPreferencesTable.showStickersInExpressionAutocomplete,
        );
        await m.addColumn(
          userPreferencesTable,
          userPreferencesTable.showMemesInExpressionAutocomplete,
        );
        await m.addColumn(
          userPreferencesTable,
          userPreferencesTable.preserveEditDraft,
        );
      }
      if (from < 31) {
        await m.addColumn(messages, messages.flags);
      }
      if (from < 32) {
        await m.addColumn(messages, messages.stickersJson);
        await m.createTable(notificationUnreadCollapsed);
        await m.createTable(notificationMentionFeed);
        await m.createTable(notificationMentionPrefs);
        await into(
          notificationMentionPrefs,
        ).insert(NotificationMentionPrefsCompanion.insert(id: const Value(1)));
      }
      if (from < 33) {
        final List<QueryRow> messageColumns = await customSelect(
          'PRAGMA table_info(messages)',
        ).get();
        final bool hasStickersJson = messageColumns.any(
          (QueryRow row) => row.read<String?>('name') == 'stickers_json',
        );
        if (!hasStickersJson) {
          await m.addColumn(messages, messages.stickersJson);
        }
        await customStatement(
          'UPDATE messages SET stickers_json = ? WHERE stickers_json IS NULL',
          ['[]'],
        );
      }
      if (from < 34) {
        await m.addColumn(messages, messages.deliveryState);
        await m.addColumn(messages, messages.clientNonce);
        await m.addColumn(messages, messages.sendError);
      }
      if (from < 35) {
        await m.addColumn(channels, channels.lastPinTimestamp);
      }
      if (from < 36) {
        await m.addColumn(dmChannels, dmChannels.lastMessageId);
      }
      if (from < 37) {
        await m.addColumn(
          userPreferencesTable,
          userPreferencesTable.favoriteEmojiKeysJson,
        );
        await m.addColumn(
          userPreferencesTable,
          userPreferencesTable.favoriteStickerKeysJson,
        );
        await m.addColumn(
          userPreferencesTable,
          userPreferencesTable.collapsedEmojiPickerCategoriesJson,
        );
        await m.addColumn(
          userPreferencesTable,
          userPreferencesTable.collapsedStickerPickerCategoriesJson,
        );
      }
      if (from < 38) {
        await m.addColumn(readStates, readStates.manual);
      }
      if (from < 39) {
        await m.createTable(favoriteChannels);
        await m.createTable(favoriteCategories);
        await m.createTable(favoriteSettings);
        await into(
          favoriteSettings,
        ).insert(const FavoriteSettingsCompanion(id: Value(1)));
      }
      if (from < 40) {
        await m.addColumn(userPreferencesTable, userPreferencesTable.showNeko);
      }
      if (from < 41) {
        await m.addColumn(
          userPreferencesTable,
          userPreferencesTable.sanitizeUrls,
        );
      }
      if (from < 42) {
        await m.addColumn(roles, roles.mentionable);
      }
      if (from < 43) {
        await m.addColumn(channels, channels.nsfw);
      }
      if (from < 44) {
        await m.addColumn(readStates, readStates.stickyUnreadMessageId);
      }
      if (from < 45) {
        await m.createTable(mobilePushRegistrations);
      }
      if (from < 46) {
        await m.createTable(composerDrafts);
      }
      if (from < 47) {
        final List<QueryRow> messageColumns = await customSelect(
          'PRAGMA table_info(messages)',
        ).get();
        final bool hasReactionsJson = messageColumns.any(
          (QueryRow row) => row.read<String?>('name') == 'reactions_json',
        );
        if (!hasReactionsJson) {
          await m.addColumn(messages, messages.reactionsJson);
        }
        await customStatement(
          'UPDATE messages SET reactions_json = ? WHERE reactions_json IS NULL',
          ['[]'],
        );
      }
      if (from < 48) {
        // Drop the dead forward-from-message draft column (clean cutover).
        // Composer drafts are disposable local cache, so recreate the table.
        await m.deleteTable('composer_drafts');
        await m.createTable(composerDrafts);
      }
      if (from < 49) {
        await m.addColumn(servers, servers.disabledOperations);
        await m.addColumn(members, members.communicationDisabledUntil);
      }
      if (from < 50) {
        await m.addColumn(messages, messages.authorIsBot);
        await m.addColumn(messages, messages.webhookId);
        await customStatement('''
          UPDATE messages
          SET author_is_bot = (
            SELECT COALESCE(users.bot, 0)
            FROM users
            WHERE users.id = messages.author_id
          )
          WHERE EXISTS (
            SELECT 1 FROM users WHERE users.id = messages.author_id
          )
          ''');
      }
      if (from < 51) {
        // v51: legacy tokens remain in SQLite until app startup migration.
      }
      if (from < 52 && from >= 51) {
        final List<QueryRow> columns = await customSelect(
          'PRAGMA table_info(auth_sessions)',
        ).get();
        final bool hasTokenColumn = columns.any(
          (QueryRow row) => row.read<String>('name') == 'token',
        );
        if (hasTokenColumn) {
          await customStatement('ALTER TABLE auth_sessions DROP COLUMN token');
        }
      }
      if (from < 53) {
        await m.addColumn(users, users.mentionFlags);
        await m.addColumn(members, members.mentionFlags);
      }
      if (from < 54) {
        await m.addColumn(channels, channels.nsfwOverride);
        await m.addColumn(channels, channels.contentWarningLevel);
        await m.addColumn(channels, channels.contentWarningText);
        await m.addColumn(servers, servers.nsfw);
        await m.addColumn(servers, servers.contentWarningLevel);
        await m.addColumn(servers, servers.contentWarningText);
        await m.addColumn(
          userPreferencesTable,
          userPreferencesTable.matureContentAgreedChannelIdsJson,
        );
        await m.addColumn(
          userPreferencesTable,
          userPreferencesTable.matureContentAgreedCategoryIdsJson,
        );
        await m.addColumn(
          userPreferencesTable,
          userPreferencesTable.matureContentAgreedGuildIdsJson,
        );
      }
      if (from < 55) {
        await m.addColumn(servers, servers.verificationLevel);
      }
      if (from < 56) {
        await m.createTable(memberCacheAccess);
      }
      if (from < 57) {
        await m.addColumn(channels, channels.userLimit);
      }
      if (from < 58) {
        await m.addColumn(messages, messages.authorIsSystem);
        await customStatement('''
          UPDATE messages
          SET author_is_system = (
            SELECT COALESCE(users.system, 0)
            FROM users
            WHERE users.id = messages.author_id
          )
          WHERE EXISTS (
            SELECT 1 FROM users WHERE users.id = messages.author_id
          )
          ''');
      }
      if (from < 59) {
        await m.createTable(recentInstances);
        await m.addColumn(
          authSessions,
          authSessions.instanceSnapshotJson,
        );
      }
      if (from < 60) {
        await m.addColumn(messages, messages.mentionedUserIdsJson);
      }
      if (from < 61) {
        await m.addColumn(members, members.profileFlags);
      }
    },
  );

  /// Clears all tables except auth sessions.
  Future<void> clearUserData() async {
    await transaction(() async {
      await userDao.clearAll();
      await guildDao.clearAll();
      await channelDao.clearAll();
      await messageDao.clearAll();
      await roleDao.clearAll();
      await memberDao.clearAll();
      await relationshipDao.clearAll();
      await dmChannelDao.clearAll();
      await userPreferencesDao.clearAll();
      await readStateDao.clearAll();
      await emojiUsageDao.clearAll();
      await guildLastChannelDao.clearAll();
      await composerDraftDao.clearAll();
      await userSettingsDao.clearAll();
      await userGuildSettingsDao.clearAll();
      await userNotesDao.clearAll();
      await pinnedDmsDao.clearAll();
      await favoriteMemesDao.clearAll();
      await rtcRegionsDao.clearAll();
      await guildEmojiDao.clearAll();
      await guildStickerDao.clearAll();
      await savedMessageDao.clearAll();
      await notificationDao.clearAllUserData();
      await favoriteChannelsDao.clearAll();
    });
  }

  /// Clears everything including auth sessions (full logout).
  Future<void> clearAll() async {
    await transaction(() async {
      await authSessionDao.clearSession();
      await clearUserData();
    });
  }
}

QueryExecutor _openConnection() {
  if (!kIsWeb && (Platform.isLinux || Platform.isMacOS || Platform.isWindows)) {
    return LazyDatabase(() async {
      final dir = await getApplicationDocumentsDirectory();
      final file = File(p.join(dir.path, 'fluxer_app', 'fluxer.db'));
      await file.parent.create(recursive: true);
      return NativeDatabase.createInBackground(file);
    });
  }
  return driftDatabase(name: 'fluxer');
}
