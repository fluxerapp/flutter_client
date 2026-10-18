import 'package:drift/drift.dart' as drift;
import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart';
import 'package:sqlite3/sqlite3.dart';

const int _expectedSchemaVersion = 99;

const int _guardedBaselineVersion = 67;

const Map<String, List<String>> _guardedColumns = <String, List<String>>{
  'user_preferences': <String>[
    'voice_settings_json',
    'saturation_factor',
    'custom_theme_css',
    'sync_theme_colors_from_theme_studio',
    'sync_theme_colors_to_theme_studio',
    'show_media_delete_button',
    'show_media_download_button',
    'show_media_favorite_button',
    'show_suppress_embeds_button',
    'enable_text_selection',
    'show_video_seek_preview_thumbnails',
    'voice_channel_join_requires_double_click',
    'confirm_before_joining_voice_channels',
    'show_gif_indicator',
    'show_attachment_expiry_indicator',
    'show_message_action_bar',
    'show_message_action_bar_quick_reactions',
    'show_message_action_bar_shift_expand',
    'show_message_action_bar_only_more_button',
    'show_gif_button',
    'show_memes_button',
    'show_stickers_button',
    'show_emoji_button',
    'show_message_send_button',
    'scroll_to_bottom_on_message_send',
    'sequential_file_send',
    'skip_mark_all_as_read_confirmation',
    'preupload_message_attachments',
    'disable_stream_previews',
    'save_gif_favorites_as_saved_media',
    'search_engines_json',
    'screen_reader_announce_new_messages',
    'sync_reduced_motion_with_system',
    'reduced_motion_override',
    'enable_tts_command',
    'tts_rate',
    'dm_message_preview_mode',
    'always_underline_links',
    'dim_strikethrough_text',
    'show_textarea_focus_ring',
    'escape_exits_keyboard_mode',
    'show_context_menu_shortcuts',
    'confirm_before_starting_calls',
    'mobile_gif_autoplay_overridden',
    'mobile_animate_emoji_overridden',
    'mobile_sticker_animation_overridden',
    'mobile_gif_autoplay_value',
    'mobile_animate_emoji_value',
    'mobile_sticker_animation_value',
    'keep_animated_emoji_under_reduced_motion',
    'keep_gif_auto_play_under_reduced_motion',
    'keep_sticker_animation_under_reduced_motion',
    'mobile_splash_zoom_animation',
    'hdr_display_mode',
    'chat_wallpaper_json',
    'show_alt_text_on_images',
    'emoji_usage_json',
    'sticker_usage_json',
    'meme_usage_json',
    'favorite_meme_ids_json',
    'collapsed_meme_picker_categories_json',
    'synced_preferences_dirty_fields_json',
  ],
  'messages': <String>[
    'call_json',
    'translated_content',
    'translation_source_language',
    'translated_source_content',
    'translation_target_language',
    'translation_show_original',
    'thread_json',
  ],
  'dm_channels': <String>['nicks_json'],
  'composer_drafts': <String>['reply_mentioning'],
  'servers': <String>['vanity_url_code'],
  'channels': <String>[
    'owner_id',
    'flags',
    'thread_archived',
    'thread_locked',
    'thread_invitable',
    'thread_auto_archive_duration',
    'thread_archive_timestamp',
    'thread_create_timestamp',
    'message_count',
    'total_message_sent',
    'member_count',
    'applied_tags_json',
    'default_auto_archive_duration',
    'default_thread_rate_limit_per_user',
    'available_tags_json',
    'default_reaction_emoji_json',
    'default_sort_order',
    'default_forum_layout',
    'default_tag_setting',
    'rtc_p2p',
  ],
  'read_states': <String>['flags'],
};

const List<String> _guardedTables = <String>['thread_members'];

List<String> _schemaTables(Database raw) => raw
    .select(
      'SELECT name FROM sqlite_master '
      "WHERE type = 'table' AND name NOT LIKE 'sqlite_%' ORDER BY name",
    )
    .map((Row row) => row['name'] as String)
    .toList();

List<String> _schemaIndexes(Database raw) => raw
    .select(
      'SELECT name FROM sqlite_master '
      "WHERE type = 'index' AND name NOT LIKE 'sqlite_%' ORDER BY name",
    )
    .map((Row row) => row['name'] as String)
    .toList();

List<String> _tableColumns(Database raw, String table) => raw
    .select('PRAGMA table_info($table)')
    .map((Row row) => row['name'] as String)
    .toList();

Map<String, Set<String>> _schemaColumns(Database raw) {
  final List<String> tables = _schemaTables(raw);
  final Map<String, Set<String>> result = <String, Set<String>>{};
  for (final String table in tables) {
    result[table] = _tableColumns(raw, table).toSet();
  }
  return result;
}

int _userVersion(Database raw) =>
    raw.select('PRAGMA user_version').single['user_version'] as int;

Future<void> _stampCurrentSchemaAsVersion(Database raw, int version) async {
  final FluxerDatabase db = FluxerDatabase.forTesting(
    NativeDatabase.opened(raw, closeUnderlyingOnClose: false),
  );
  await db.customSelect('SELECT 1').get();
  await db.customStatement('PRAGMA user_version = $version');
  await db.close();
}

void main() {
  drift.driftRuntimeOptions.dontWarnAboutMultipleDatabases = true;

  group('FluxerDatabase migration', () {
    test('onCreate reaches expected schemaVersion', () async {
      final Database raw = sqlite3.openInMemory();
      addTearDown(raw.close);
      final FluxerDatabase db = FluxerDatabase.forTesting(
        NativeDatabase.opened(raw, closeUnderlyingOnClose: false),
      );
      addTearDown(db.close);

      await db.customSelect('SELECT 1').get();

      expect(_userVersion(raw), _expectedSchemaVersion);
      expect(db.schemaVersion, _expectedSchemaVersion);
    });

    test(
      'upgrade from guarded baseline skips re-adding columns that already exist',
      () async {
        final Database raw = sqlite3.openInMemory();
        addTearDown(raw.close);
        await _stampCurrentSchemaAsVersion(raw, _guardedBaselineVersion);

        for (final MapEntry<String, List<String>> entry
            in _guardedColumns.entries) {
          expect(_tableColumns(raw, entry.key), containsAll(entry.value));
        }
        expect(_userVersion(raw), _guardedBaselineVersion);

        final FluxerDatabase db = FluxerDatabase.forTesting(
          NativeDatabase.opened(raw, closeUnderlyingOnClose: false),
        );
        addTearDown(db.close);

        final UserPreferencesTableData? prefs = await db.userPreferencesDao
            .getPreferences('user-1');
        expect(prefs, isNull);

        expect(_userVersion(raw), db.schemaVersion);
        for (final MapEntry<String, List<String>> entry
            in _guardedColumns.entries) {
          final List<String> columns = _tableColumns(raw, entry.key);
          for (final String column in entry.value) {
            expect(
              columns.where((String name) => name == column),
              hasLength(1),
              reason:
                  '${entry.key}.$column must appear exactly once '
                  'after the migration',
            );
          }
        }
      },
    );

    test('upgrade drops the local mention filter table', () async {
      final Database raw = sqlite3.openInMemory();
      addTearDown(raw.close);
      await _stampCurrentSchemaAsVersion(raw, 93);
      raw.execute(
        'CREATE TABLE notification_mention_prefs (id INTEGER PRIMARY KEY)',
      );

      final FluxerDatabase db = FluxerDatabase.forTesting(
        NativeDatabase.opened(raw, closeUnderlyingOnClose: false),
      );
      addTearDown(db.close);
      await db.notificationDao.getMentionFeedOrdered();

      expect(_userVersion(raw), db.schemaVersion);
      expect(_schemaTables(raw), isNot(contains('notification_mention_prefs')));
    });

    test(
      'upgrade moves local expression usage to the active account',
      () async {
        final Database raw = sqlite3.openInMemory();
        addTearDown(raw.close);
        await _stampCurrentSchemaAsVersion(raw, 94);
        for (final String column in <String>[
          'emoji_usage_json',
          'sticker_usage_json',
          'meme_usage_json',
          'favorite_meme_ids_json',
          'collapsed_meme_picker_categories_json',
          'synced_preferences_dirty_fields_json',
        ]) {
          raw.execute('ALTER TABLE user_preferences DROP COLUMN $column');
        }
        raw
          ..execute(
            'CREATE TABLE emoji_usage (key TEXT NOT NULL PRIMARY KEY, '
            'use_count INTEGER NOT NULL DEFAULT 1, '
            'last_used INTEGER NOT NULL)',
          )
          ..execute(
            "INSERT INTO emoji_usage VALUES ('unicode:heart', 4, 1700000000), "
            "('custom:1:2', 2, 1700000100), "
            "('sticker:1:3', 5, 1700000200), "
            "('meme:4', 1, 1700000300)",
          )
          ..execute(
            'INSERT INTO auth_sessions (user_id, is_valid, last_active, '
            "created_at) VALUES ('old', 1, 10, 10), ('me', 1, 20, 20), "
            "('gone', 0, 30, 30)",
          );

        final FluxerDatabase db = FluxerDatabase.forTesting(
          NativeDatabase.opened(raw, closeUnderlyingOnClose: false),
        );
        addTearDown(db.close);

        final UserPreferencesTableData? prefs = await db.userPreferencesDao
            .getPreferences('me');
        expect(
          prefs?.emojiUsageJson,
          '{"unicode:heart":[4,1700000000000],"custom:1:2":[2,1700000100000]}',
        );
        expect(prefs?.stickerUsageJson, '{"1:3":[5,1700000200000]}');
        expect(prefs?.memeUsageJson, '{"4":[1,1700000300000]}');
        expect(
          prefs?.syncedPreferencesDirtyFieldsJson,
          '["emojiPicker","memesPicker","stickerPicker"]',
        );
        expect(await db.userPreferencesDao.getPreferences('old'), isNull);
        expect(_schemaTables(raw), isNot(contains('emoji_usage')));
        expect(_userVersion(raw), db.schemaVersion);
      },
    );

    test('upgrade from guarded baseline adds columns when missing', () async {
      final Database raw = sqlite3.openInMemory();
      addTearDown(raw.close);
      await _stampCurrentSchemaAsVersion(raw, _guardedBaselineVersion);

      for (final String table in _guardedTables) {
        raw.execute('DROP TABLE $table');
      }
      raw.execute('DROP INDEX idx_channels_guild_parent_type');
      for (final MapEntry<String, List<String>> entry
          in _guardedColumns.entries) {
        for (final String column in entry.value) {
          raw.execute('ALTER TABLE ${entry.key} DROP COLUMN $column');
        }
        final List<String> before = _tableColumns(raw, entry.key);
        for (final String column in entry.value) {
          expect(before, isNot(contains(column)));
        }
      }

      final FluxerDatabase db = FluxerDatabase.forTesting(
        NativeDatabase.opened(raw, closeUnderlyingOnClose: false),
      );
      addTearDown(db.close);

      final UserPreferencesTableData? prefs = await db.userPreferencesDao
          .getPreferences('user-1');
      expect(prefs, isNull);

      expect(_userVersion(raw), db.schemaVersion);
      expect(_schemaTables(raw), containsAll(_guardedTables));
      expect(
        _schemaIndexes(raw),
        containsAll(<String>[
          'idx_channels_guild_parent_type',
          'idx_thread_members_guild',
        ]),
      );
      for (final MapEntry<String, List<String>> entry
          in _guardedColumns.entries) {
        final List<String> after = _tableColumns(raw, entry.key);
        for (final String column in entry.value) {
          expect(
            after.where((String name) => name == column),
            hasLength(1),
            reason:
                '${entry.key}.$column must be added exactly once '
                'by the migration',
          );
        }
      }
    });

    for (
      int from = _guardedBaselineVersion + 1;
      from < _expectedSchemaVersion;
      from++
    ) {
      test('upgrade from $from skips already-present objects', () async {
        final Database raw = sqlite3.openInMemory();
        addTearDown(raw.close);
        await _stampCurrentSchemaAsVersion(raw, from);

        final FluxerDatabase db = FluxerDatabase.forTesting(
          NativeDatabase.opened(raw, closeUnderlyingOnClose: false),
        );
        addTearDown(db.close);

        await db.customSelect('SELECT 1').get();

        expect(_userVersion(raw), db.schemaVersion);
        expect(_userVersion(raw), _expectedSchemaVersion);
      });
    }

    test('upgrade from 90 keeps rows', () async {
      const Map<String, List<String>> added = <String, List<String>>{
        'messages': <String>['thread_json'],
        'read_states': <String>['flags'],
      };
      final Database raw = sqlite3.openInMemory();
      addTearDown(raw.close);
      final FluxerDatabase seed = FluxerDatabase.forTesting(
        NativeDatabase.opened(raw, closeUnderlyingOnClose: false),
      );
      await seed.guildDao.upsertServer(
        ServersCompanion.insert(id: 'g1', name: 'Guild'),
      );
      await seed.channelDao.upsertChannels(<ChannelsCompanion>[
        ChannelsCompanion.insert(id: 'c1', guildId: 'g1', name: 'general'),
        ChannelsCompanion.insert(
          id: 'v1',
          guildId: 'g1',
          name: 'voice',
          type: const drift.Value(2),
          position: const drift.Value(1),
        ),
      ]);
      await seed.readStateDao.upsertReadState(
        const ReadStatesCompanion(
          channelId: drift.Value('c1'),
          lastMessageId: drift.Value('10'),
          mentionCount: drift.Value(2),
        ),
      );
      await seed.customStatement('PRAGMA user_version = 90');
      await seed.close();
      raw
        ..execute('DROP TABLE thread_members')
        ..execute('DROP INDEX idx_channels_guild_parent_type');
      for (final MapEntry<String, List<String>> entry in <String, List<String>>{
        ...added,
        'channels': _guardedColumns['channels']!,
      }.entries) {
        for (final String column in entry.value) {
          raw.execute('ALTER TABLE ${entry.key} DROP COLUMN $column');
        }
      }

      final FluxerDatabase db = FluxerDatabase.forTesting(
        NativeDatabase.opened(raw, closeUnderlyingOnClose: false),
      );
      addTearDown(db.close);

      final List<Channel> channels = await db.channelDao.getChannels('g1');
      expect(channels.map((Channel c) => c.id), <String>['c1', 'v1']);
      expect(
        await db.channelDao.getChannels('g1', includeThreads: true),
        channels,
      );
      for (final Channel channel in channels) {
        expect(channel.threadArchived, isNull);
        expect(channel.flags, isNull);
        expect(channel.availableTagsJson, isNull);
      }
      final ReadState? readState = await db.readStateDao.getReadState('c1');
      expect(readState?.lastMessageId, '10');
      expect(readState?.mentionCount, 2);
      expect(readState?.flags, isNull);
      expect(await db.threadDao.getJoinedThreadIds(), isEmpty);
      expect(_userVersion(raw), _expectedSchemaVersion);
    });

    test('upgrade from 96 drops the thread gate column', () async {
      final Database raw = sqlite3.openInMemory();
      addTearDown(raw.close);
      final FluxerDatabase seed = FluxerDatabase.forTesting(
        NativeDatabase.opened(raw, closeUnderlyingOnClose: false),
      );
      await seed.guildDao.upsertServer(
        ServersCompanion.insert(id: 'g1', name: 'Guild'),
      );
      await seed.customStatement('PRAGMA user_version = 96');
      await seed.close();
      raw.execute(
        'ALTER TABLE servers ADD COLUMN thread_channels_active '
        'INTEGER NOT NULL DEFAULT 0',
      );

      final FluxerDatabase db = FluxerDatabase.forTesting(
        NativeDatabase.opened(raw, closeUnderlyingOnClose: false),
      );
      addTearDown(db.close);
      await db.customSelect('SELECT 1').get();

      expect(
        _tableColumns(raw, 'servers'),
        isNot(contains('thread_channels_active')),
      );
      expect((await db.guildDao.getServerById('g1'))?.name, 'Guild');
      expect(_userVersion(raw), _expectedSchemaVersion);
    });

    test('upgrade from 98 drops the read state missing column', () async {
      final Database raw = sqlite3.openInMemory();
      addTearDown(raw.close);
      final FluxerDatabase seed = FluxerDatabase.forTesting(
        NativeDatabase.opened(raw, closeUnderlyingOnClose: false),
      );
      await seed.readStateDao.upsertReadState(
        const ReadStatesCompanion(
          channelId: drift.Value('c1'),
          lastMessageId: drift.Value('10'),
        ),
      );
      await seed.customStatement('PRAGMA user_version = 98');
      await seed.close();
      raw.execute('ALTER TABLE read_states ADD COLUMN missing_since INTEGER');

      final FluxerDatabase db = FluxerDatabase.forTesting(
        NativeDatabase.opened(raw, closeUnderlyingOnClose: false),
      );
      addTearDown(db.close);
      await db.customSelect('SELECT 1').get();

      expect(
        _tableColumns(raw, 'read_states'),
        isNot(contains('missing_since')),
      );
      expect((await db.readStateDao.getReadState('c1'))?.lastMessageId, '10');
      expect(_userVersion(raw), _expectedSchemaVersion);
    });

    test('upgrade from 97 keys messages by channel and id', () async {
      final Database raw = sqlite3.openInMemory();
      addTearDown(raw.close);
      await _stampCurrentSchemaAsVersion(raw, 97);
      raw
        ..execute('DROP TABLE messages')
        ..execute(
          'CREATE TABLE messages (id TEXT NOT NULL PRIMARY KEY, '
          'channel_id TEXT NOT NULL, author_id TEXT NOT NULL, '
          "author_name TEXT NOT NULL DEFAULT '', author_avatar TEXT, "
          'author_avatar_color INTEGER, '
          'author_is_bot INTEGER NOT NULL DEFAULT 0, '
          'author_is_system INTEGER NOT NULL DEFAULT 0, '
          'author_public_flags INTEGER NOT NULL DEFAULT 0, '
          'webhook_id TEXT, content TEXT NOT NULL, '
          'timestamp INTEGER NOT NULL, edited_timestamp INTEGER, '
          "embeds_json TEXT NOT NULL DEFAULT '[]', "
          "attachments_json TEXT NOT NULL DEFAULT '[]', "
          "stickers_json TEXT NOT NULL DEFAULT '[]', "
          "reactions_json TEXT NOT NULL DEFAULT '[]', "
          'reply_to_id TEXT, forwarded_from TEXT, '
          'message_reference_json TEXT, '
          "message_snapshots_json TEXT NOT NULL DEFAULT '[]', "
          'pinned INTEGER NOT NULL DEFAULT 0, '
          'is_mentioned INTEGER NOT NULL DEFAULT 0, '
          "mentioned_user_ids_json TEXT NOT NULL DEFAULT '[]', "
          "mention_channels_json TEXT NOT NULL DEFAULT '[]', "
          'type INTEGER NOT NULL DEFAULT 0, '
          'flags INTEGER NOT NULL DEFAULT 0, '
          'delivery_state INTEGER NOT NULL DEFAULT 1, '
          'client_nonce TEXT, send_error TEXT, call_json TEXT, '
          'thread_json TEXT, translated_content TEXT, '
          'translation_source_language TEXT, '
          'translated_source_content TEXT, '
          'translation_target_language TEXT, '
          'translation_show_original INTEGER NOT NULL DEFAULT 0)',
        )
        ..execute('CREATE INDEX idx_messages_channel ON messages (channel_id)')
        ..execute('CREATE INDEX idx_messages_author ON messages (author_id)')
        ..execute(
          'CREATE INDEX idx_messages_channel_timestamp '
          'ON messages (channel_id, timestamp)',
        )
        ..execute(
          'INSERT INTO messages (id, channel_id, author_id, content, '
          "timestamp, client_nonce) VALUES ('500', 'c1', 'u1', 'kept', "
          "1700000000, 'n1')",
        );

      final FluxerDatabase db = FluxerDatabase.forTesting(
        NativeDatabase.opened(raw, closeUnderlyingOnClose: false),
      );
      addTearDown(db.close);

      final Message? kept = await db.messageDao.getMessage('c1', '500');
      expect(kept?.content, 'kept');
      expect(kept?.clientNonce, 'n1');
      await db.messageDao.upsertMessage(
        MessagesCompanion.insert(
          id: '500',
          channelId: '500',
          authorId: 'u1',
          content: '',
          timestamp: DateTime.utc(2026),
          type: const drift.Value(21),
        ),
      );
      expect((await db.messageDao.getMessage('c1', '500'))?.content, 'kept');
      expect(await db.messageDao.getMessage('500', '500'), isNotNull);
      expect(
        raw
            .select('PRAGMA table_info(messages)')
            .where((Row row) => (row['pk'] as int) > 0)
            .map((Row row) => row['name'] as String),
        <String>['id', 'channel_id'],
      );
      expect(
        _schemaIndexes(raw),
        containsAll(<String>[
          'idx_messages_channel',
          'idx_messages_author',
          'idx_messages_channel_timestamp',
        ]),
      );
      expect(_userVersion(raw), _expectedSchemaVersion);
    });

    test(
      'schema after guarded baseline upgrade matches fresh onCreate',
      () async {
        final Database rawFresh = sqlite3.openInMemory();
        addTearDown(rawFresh.close);
        final FluxerDatabase dbFresh = FluxerDatabase.forTesting(
          NativeDatabase.opened(rawFresh, closeUnderlyingOnClose: false),
        );
        addTearDown(dbFresh.close);
        await dbFresh.customSelect('SELECT 1').get();
        final Map<String, Set<String>> expectedColumns = _schemaColumns(
          rawFresh,
        );
        final List<String> expectedIndexes = _schemaIndexes(rawFresh);

        final Database rawMigrated = sqlite3.openInMemory();
        addTearDown(rawMigrated.close);
        await _stampCurrentSchemaAsVersion(
          rawMigrated,
          _guardedBaselineVersion,
        );
        final FluxerDatabase dbMigrated = FluxerDatabase.forTesting(
          NativeDatabase.opened(rawMigrated, closeUnderlyingOnClose: false),
        );
        addTearDown(dbMigrated.close);
        await dbMigrated.customSelect('SELECT 1').get();
        final Map<String, Set<String>> actualColumns = _schemaColumns(
          rawMigrated,
        );
        final List<String> actualIndexes = _schemaIndexes(rawMigrated);

        expect(actualColumns, equals(expectedColumns));
        expect(actualIndexes, equals(expectedIndexes));
      },
    );
  });
}
