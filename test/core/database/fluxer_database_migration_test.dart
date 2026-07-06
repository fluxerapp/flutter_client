import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart';
import 'package:sqlite3/sqlite3.dart';

/// Columns added by the guarded migration steps 68-71, per table.
const Map<String, List<String>> _guardedColumns = <String, List<String>>{
  'user_preferences': <String>[
    'voice_settings_json',
    'saturation_factor',
    'custom_theme_css',
  ],
  'messages': <String>['call_json'],
  'dm_channels': <String>['nicks_json'],
};

List<String> _tableColumns(Database raw, String table) => raw
    .select('PRAGMA table_info($table)')
    .map((Row row) => row['name'] as String)
    .toList();

int _userVersion(Database raw) =>
    raw.select('PRAGMA user_version').single['user_version'] as int;

/// Creates the full current schema on [raw] via `onCreate`, then stamps
/// `user_version` back to 67 — the drift state where the database already
/// has the new columns but a version below the steps that add them.
Future<void> _stampCurrentSchemaAsVersion67(Database raw) async {
  final FluxerDatabase db1 = FluxerDatabase.forTesting(
    NativeDatabase.opened(raw, closeUnderlyingOnClose: false),
  );
  // Any statement forces the lazy open, which runs onCreate -> createAll.
  await db1.customSelect('SELECT 1').get();
  await db1.customStatement('PRAGMA user_version = 67');
  await db1.close();
}

void main() {
  group('FluxerDatabase migration', () {
    test(
      'upgrade from 67 skips re-adding columns that already exist',
      () async {
        final Database raw = sqlite3.openInMemory();
        addTearDown(raw.close);
        await _stampCurrentSchemaAsVersion67(raw);

        // Sanity: tables already have the new columns, but the version lies.
        for (final MapEntry<String, List<String>> entry
            in _guardedColumns.entries) {
          expect(_tableColumns(raw, entry.key), containsAll(entry.value));
        }
        expect(_userVersion(raw), 67);

        final FluxerDatabase db2 = FluxerDatabase.forTesting(
          NativeDatabase.opened(raw, closeUnderlyingOnClose: false),
        );
        addTearDown(db2.close);

        // Forces the open, running onUpgrade(from: 67). Without the
        // _tableHasColumn guards the ALTER TABLE ... ADD COLUMN statements
        // would throw SqliteException(1): duplicate column name.
        final UserPreferencesTableData? prefs = await db2.userPreferencesDao
            .getPreferences('user-1');
        expect(prefs, isNull);

        expect(_userVersion(raw), db2.schemaVersion);
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

    test('upgrade from 67 adds the guarded columns when missing', () async {
      final Database raw = sqlite3.openInMemory();
      addTearDown(raw.close);
      await _stampCurrentSchemaAsVersion67(raw);

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

      final FluxerDatabase db2 = FluxerDatabase.forTesting(
        NativeDatabase.opened(raw, closeUnderlyingOnClose: false),
      );
      addTearDown(db2.close);

      // The generated select references all current columns, so this would
      // throw "no such column" if the migration had not added them.
      final UserPreferencesTableData? prefs = await db2.userPreferencesDao
          .getPreferences('user-1');
      expect(prefs, isNull);

      expect(_userVersion(raw), db2.schemaVersion);
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
  });
}
