import 'dart:convert';

import 'package:drift/drift.dart' hide isNull;
import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart';
import 'package:fluxer_app/core/local_settings/local_setting_id.dart';
import 'package:fluxer_app/core/local_settings/local_settings_legacy_import.dart';
import 'package:fluxer_app/core/local_settings/local_settings_store.dart';
import 'package:fluxer_app/features/voice/domain/voice_settings_state.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  late FluxerDatabase db;

  setUp(() => db = FluxerDatabase.forTesting(NativeDatabase.memory()));

  tearDown(() => db.close());

  Future<void> addSession(String userId, int lastActive, {bool valid = true}) =>
      db
          .into(db.authSessions)
          .insert(
            AuthSessionsCompanion.insert(
              userId: userId,
              isValid: Value<bool>(valid),
              lastActive: Value<DateTime>(
                DateTime.fromMillisecondsSinceEpoch(lastActive * 1000),
              ),
            ),
          );

  Future<void> addVoice(String userId, Map<String, Object?> json) =>
      db.userPreferencesDao.savePreferences(
        UserPreferencesTableCompanion(
          userId: Value<String>(userId),
          voiceSettingsJson: Value<String>(jsonEncode(json)),
        ),
      );

  Future<Map<LocalSettingId, Object?>> import() async {
    final LocalSettingsStore store = LocalSettingsStore(() => db);
    addTearDown(store.dispose);
    await store.load();
    return <LocalSettingId, Object?>{
      for (final MapEntry<LocalSettingId, String> entry
          in (await db.localSettingsDao.loadAll()).entries)
        entry.key: jsonDecode(entry.value),
    };
  }

  LocalSettingId device(String key) =>
      (scope: kDeviceLocalSettingScope, key: key);
  LocalSettingId account(String userId, String key) =>
      (scope: accountLocalSettingScope(userId), key: key);

  test('imports device, account and prefixed preferences', () async {
    SharedPreferences.setMockInitialValues(<String, Object>{
      'haptics_enabled': false,
      'notification_prefs_tts_mode': 2,
      'desktop_monochrome_tray_icon_tone': 'white',
      'keybind_preferences_v1': '{"syncAcrossDevices":true}',
      'desktop_window_state_v1': 'not json',
      'persistedSelfMute': true,
      'synced_extras_convert_emoticons': true,
      'fluxer:ui:sidebar-width:a': '310',
      'fluxer:ui:sidebar-width:b': 'NaN',
      'notifications_mentions_seen_b': '123',
      'fluxer_recovery_kit_prompt_shown_a': true,
      'fluxer_scheduled_maintenance_dismissed:m1:scheduled': '1',
      'fluxer_scheduled_maintenance_dismissed:m2': '1',
      'observability_reporting_enabled': true,
    });
    await addSession('a', 10);
    await addSession('b', 20);
    await addSession('gone', 30, valid: false);

    final Map<LocalSettingId, Object?> rows = await import();

    expect(rows[device('haptics_enabled')], false);
    expect(rows[device('notification_prefs_tts_mode')], 2);
    expect(rows[device('desktop_monochrome_tray_icon_tone')], 'white');
    expect(rows[device('keybind_preferences_v1')], <String, Object?>{
      'syncAcrossDevices': true,
    });
    expect(rows.containsKey(device('desktop_window_state_v1')), isFalse);
    expect(rows[device('persistedSelfMute')], true);
    expect(rows[account('b', 'synced_extras_convert_emoticons')], true);
    expect(
      rows.containsKey(account('a', 'synced_extras_convert_emoticons')),
      isFalse,
    );
    expect(rows[account('a', 'shell_sidebar_width')], 310);
    expect(rows.containsKey(account('b', 'shell_sidebar_width')), isFalse);
    expect(rows[account('b', 'mention_seen_boundary')], '123');
    expect(rows[account('a', 'recovery_kit_prompt_shown')], true);
    expect(
      rows[device('dismissed_scheduled_maintenance')],
      unorderedEquals(<String>['m1:scheduled', 'm2']),
    );
    expect(
      rows.containsKey(device('observability_reporting_enabled')),
      isFalse,
    );
    expect(rows[kLocalSettingsLegacyImportId], 1);
  });

  test('splits voice settings between device and accounts', () async {
    SharedPreferences.setMockInitialValues(<String, Object>{});
    await addSession('a', 10);
    await addSession('b', 20);
    await addVoice('a', <String, Object?>{
      'inputDeviceId': 'mic-a',
      'participantVolumes': <String, int>{'x': 40},
    });
    await addVoice('b', <String, Object?>{
      'inputDeviceId': 'mic-b',
      'noiseSuppressionTier': 'standard',
      'participantVolumes': <String, int>{'x': 80},
    });

    final Map<LocalSettingId, Object?> rows = await import();

    final Map<String, Object?> voice =
        rows[device('voice_device_settings')]! as Map<String, Object?>;
    expect(voice['inputDeviceId'], 'mic-b');
    expect(
      voice['noiseSuppressionBackend'],
      NoiseSuppressionBackend.standard.name,
    );
    expect(voice.containsKey('participantVolumes'), isFalse);
    expect(rows[account('a', 'voice_device_overrides')], <String, Object?>{
      'inputDeviceId': 'mic-a',
      'noiseSuppressionBackend': null,
    });
    expect(rows.containsKey(account('b', 'voice_device_overrides')), isFalse);
    for (final (String userId, int volume) in <(String, int)>[
      ('a', 40),
      ('b', 80),
    ]) {
      final Map<String, Object?> settings =
          rows[account(userId, 'voice_account_settings')]!
              as Map<String, Object?>;
      expect(settings['participantVolumes'], <String, Object?>{'x': volume});
      expect(settings.containsKey('inputDeviceId'), isFalse);
    }
  });

  test('skips voice settings that cannot be read', () async {
    SharedPreferences.setMockInitialValues(<String, Object>{
      'haptics_enabled': false,
    });
    await addSession('a', 10);
    await addVoice('a', <String, Object?>{'inputDeviceId': 42});

    final Map<LocalSettingId, Object?> rows = await import();

    expect(rows[device('haptics_enabled')], false);
    expect(rows.containsKey(device('voice_device_settings')), isFalse);
  });

  test('keeps existing rows and runs only once', () async {
    SharedPreferences.setMockInitialValues(<String, Object>{
      'haptics_enabled': false,
    });
    await db.localSettingsDao.apply(<LocalSettingId, String?>{
      device('haptics_enabled'): 'true',
    });
    expect((await import())[device('haptics_enabled')], true);

    SharedPreferences.setMockInitialValues(<String, Object>{
      'splash_quotes_enabled': true,
    });
    expect(
      (await import()).containsKey(device('splash_quotes_enabled')),
      isFalse,
    );
  });

  test('a failed import is retried on the next launch', () async {
    SharedPreferences.setMockInitialValues(<String, Object>{
      'haptics_enabled': false,
    });
    await db.customStatement('ALTER TABLE auth_sessions RENAME TO hidden');
    expect(await import(), isEmpty);
    final LocalSettingsStore store = LocalSettingsStore(() => db);
    addTearDown(store.dispose);
    await store.load();
    expect(store.isPersistent, isTrue);

    await db.customStatement('ALTER TABLE hidden RENAME TO auth_sessions');
    expect((await import())[device('haptics_enabled')], false);
  });

  test('a fresh install only writes the marker', () async {
    SharedPreferences.setMockInitialValues(<String, Object>{});
    expect((await import()).keys, <LocalSettingId>[
      kLocalSettingsLegacyImportId,
    ]);
  });
}
