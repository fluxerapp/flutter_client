import 'package:drift/drift.dart' as drift;
import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart';
import 'package:sqlite3/sqlite3.dart';

/// Last schema version known to the test suite. Bump this when adding a new
/// migration and extend the tests below if the new step introduces guarded
/// columns or tables.
const int _expectedSchemaVersion = 85;

/// First version whose migration steps are written to be re-entrant against
/// the current schema. Stamp the current schema at each version in this
/// range and run onUpgrade to verify that the migration does not fail when
/// objects it creates already exist.
const int _guardedBaselineVersion = 67;

/// Columns added by guarded migration steps, per table.
const Map<String, List<String>> _guardedColumns = <String, List<String>>{
  'user_preferences': <String>[
    'voice_settings_json',
    'saturation_factor',
    'custom_theme_css',
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
  ],
  'messages': <String>[
    'call_json',
    'translated_content',
    'translation_source_language',
    'translated_source_content',
    'translation_target_language',
    'translation_show_original',
  ],
  'dm_channels': <String>['nicks_json'],
};

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

/// Creates the full current schema on [raw] via `onCreate`, then stamps
/// `user_version` back to [version]. This simulates a database that already
/// contains the objects a migration step will create.
Future<void> _stampCurrentSchemaAsVersion(Database raw, int version) async {
  final FluxerDatabase db = FluxerDatabase.forTesting(
    NativeDatabase.opened(raw, closeUnderlyingOnClose: false),
  );
  // Any statement forces the lazy open, which runs onCreate -> createAll.
  await db.customSelect('SELECT 1').get();
  await db.customStatement('PRAGMA user_version = $version');
  await db.close();
}

void main() {
  // Tests intentionally open the same raw database twice (stamp, then
  // migrate); drift's shared-instance warning is expected here.
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

        // Sanity: tables already have the new columns, but the version lies.
        for (final MapEntry<String, List<String>> entry
            in _guardedColumns.entries) {
          expect(_tableColumns(raw, entry.key), containsAll(entry.value));
        }
        expect(_userVersion(raw), _guardedBaselineVersion);

        final FluxerDatabase db = FluxerDatabase.forTesting(
          NativeDatabase.opened(raw, closeUnderlyingOnClose: false),
        );
        addTearDown(db.close);

        // Forces the open, running onUpgrade. Without the guards the
        // ALTER TABLE ... ADD COLUMN statements would throw
        // SqliteException(1): duplicate column name.
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

    test('upgrade from guarded baseline adds columns when missing', () async {
      final Database raw = sqlite3.openInMemory();
      addTearDown(raw.close);
      await _stampCurrentSchemaAsVersion(raw, _guardedBaselineVersion);

      // Rebuild the genuine pre-68 shape by dropping the drifted columns
      // again (DROP COLUMN needs the host libsqlite3 to be >= 3.35).
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

      // The generated select references all current columns, so this would
      // throw "no such column" if the migration had not added them.
      final UserPreferencesTableData? prefs = await db.userPreferencesDao
          .getPreferences('user-1');
      expect(prefs, isNull);

      expect(_userVersion(raw), db.schemaVersion);
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

        // Forces the open and runs onUpgrade(from: $from). The migration
        // steps must tolerate objects that already exist because the
        // current schema was created by onCreate before stamping.
        await db.customSelect('SELECT 1').get();

        expect(_userVersion(raw), db.schemaVersion);
        expect(_userVersion(raw), _expectedSchemaVersion);
      });
    }

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
