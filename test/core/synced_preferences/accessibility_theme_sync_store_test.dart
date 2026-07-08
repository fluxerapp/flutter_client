import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/api/fluxer_client_provider.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart' as db;
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/core/synced_preferences/engine/synced_preference_field.dart';
import 'package:fluxer_app/core/synced_preferences/engine/synced_preferences_store.dart';
import 'package:fluxer_app/core/synced_preferences/generated/fluxer/user/preferences/v1/accessibility.pb.dart'
    as accessibility_pb;
import 'package:fluxer_app/core/synced_preferences/generated/fluxer/user/preferences/v1/preferences.pb.dart'
    as pb;
import 'package:fluxer_app/core/theme/providers/theme_preference_provider.dart';
import 'package:fluxer_app/features/settings/providers/appearance_preferences_provider.dart';
import 'package:fluxer_app/features/settings/providers/user_settings_sync_service.dart';
import 'package:fluxer_dart/export.dart';

import '../../helpers/open_test_database.dart';

class _NoopUserSettingsSyncService extends UserSettingsSyncService {
  _NoopUserSettingsSyncService(super.ref);

  @override
  Future<void> pushTheme(UserSettingsUpdateRequestThemeTheme theme) async {}

  @override
  Future<UserSettingsResponse> fetchCurrentSettings() async =>
      _testUserSettings(syncedPreferences: '');
}

class _FakeUsersApi implements UsersApi {
  _FakeUsersApi();

  UserSettingsUpdateRequest? lastPushBody;
  int pushCount = 0;

  @override
  Future<UserSettingsResponse> updateCurrentUserSettings({
    required UserSettingsUpdateRequest body,
  }) async {
    pushCount++;
    lastPushBody = body;
    return UserSettingsResponse.fromJson({
      'status': 'online',
      'theme': 'dark',
      'locale': 'en-US',
      'synced_preferences': body.syncedPreferences ?? '',
      'render_embeds': true,
      'profile_privacy': 0,
      'restricted_guilds': <String>[],
      'bot_restricted_guilds': <String>[],
      'default_guilds_restricted': false,
      'bot_default_guilds_restricted': false,
      'inline_attachment_media': true,
      'inline_embed_media': true,
      'gif_auto_play': true,
      'render_reactions': true,
      'animate_emoji': true,
      'animate_stickers': 0,
      'render_spoilers': 0,
      'message_display_compact': false,
      'friend_source_flags': 0,
      'incoming_call_flags': 0,
      'group_dm_add_permission_flags': 0,
      'guild_folders': <Map<String, Object?>>[],
      'afk_timeout': 600,
      'time_format': 0,
      'developer_mode': false,
      'trusted_domains': <String>[],
      'default_hide_muted_channels': false,
      'sensitive_content_friend_dm_filter': 0,
      'sensitive_content_non_friend_dm_filter': 0,
      'sensitive_content_guild_filter': 0,
      'suppress_unprivileged_self_mentions': false,
      'suppress_unprivileged_self_mentions_bypass_user_ids': <String>[],
      'staff_dm_access_user_ids': <String>[],
      'default_share_voice_activity': false,
    });
  }

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

class _FakeClient extends FluxerClient {
  _FakeClient(this._usersApi) : super(Dio());

  final UsersApi _usersApi;

  @override
  UsersApi get users => _usersApi;
}

String _settingsWithAccessibility(
  accessibility_pb.AccessibilitySettings settings,
) {
  final synced = pb.SyncedPreferences(accessibility: settings);
  return base64Encode(synced.writeToBuffer());
}

UserSettingsResponse _testUserSettings({required String syncedPreferences}) {
  return UserSettingsResponse.fromJson({
    'status': 'online',
    'theme': 'dark',
    'locale': 'en-US',
    'synced_preferences': syncedPreferences,
    'render_embeds': true,
    'profile_privacy': 0,
    'restricted_guilds': <String>[],
    'bot_restricted_guilds': <String>[],
    'default_guilds_restricted': false,
    'bot_default_guilds_restricted': false,
    'inline_attachment_media': true,
    'inline_embed_media': true,
    'gif_auto_play': true,
    'render_reactions': true,
    'animate_emoji': true,
    'animate_stickers': 0,
    'render_spoilers': 0,
    'message_display_compact': false,
    'friend_source_flags': 0,
    'incoming_call_flags': 0,
    'group_dm_add_permission_flags': 0,
    'guild_folders': <Map<String, Object?>>[],
    'afk_timeout': 600,
    'time_format': 0,
    'developer_mode': false,
    'trusted_domains': <String>[],
    'default_hide_muted_channels': false,
    'sensitive_content_friend_dm_filter': 0,
    'sensitive_content_non_friend_dm_filter': 0,
    'sensitive_content_guild_filter': 0,
    'suppress_unprivileged_self_mentions': false,
    'suppress_unprivileged_self_mentions_bypass_user_ids': <String>[],
    'staff_dm_access_user_ids': <String>[],
    'default_share_voice_activity': false,
  });
}

ProviderContainer _createContainer({
  required db.FluxerDatabase database,
  required _FakeUsersApi usersApi,
}) {
  return ProviderContainer(
    overrides: [
      fluxerDatabaseProvider.overrideWithValue(database),
      fluxerClientProvider.overrideWithValue(_FakeClient(usersApi)),
      userSettingsSyncProvider.overrideWith(_NoopUserSettingsSyncService.new),
    ],
  );
}

Future<void> _waitForDebounce() async {
  await Future<void>.delayed(const Duration(milliseconds: 600));
}

void main() {
  group('SyncedPreferencesStore accessibility theme colors', () {
    late db.FluxerDatabase database;
    late _FakeUsersApi usersApi;
    late ProviderContainer container;

    setUp(() {
      database = openTestDatabase();
      usersApi = _FakeUsersApi();
      container = _createContainer(database: database, usersApi: usersApi);
    });

    tearDown(() {
      container.dispose();
    });

    test('hydrate applies remote custom theme css and saturation', () async {
      const css = ':root { --background-primary: #010203; }';
      final store = container.read(syncedPreferencesStoreProvider);
      await container.read(themePreferenceProvider.notifier).load('u1');
      await container.read(appearancePreferencesProvider.notifier).load('u1');
      await store.hydrateFromUserSettings(
        _testUserSettings(
          syncedPreferences: _settingsWithAccessibility(
            accessibility_pb.AccessibilitySettings(
              saturationFactor: 0.5,
              customThemeCss: css,
            ),
          ),
        ),
      );

      expect(container.read(themePreferenceProvider).saturationFactor, 0.5);
      expect(container.read(themePreferenceProvider).customThemeCss, css);
    });

    test('appearance push preserves custom theme css from wire', () async {
      const css = ':root { --background-primary: #010203; }';
      final store = container.read(syncedPreferencesStoreProvider);
      await container.read(themePreferenceProvider.notifier).load('u1');
      await container.read(appearancePreferencesProvider.notifier).load('u1');
      await store.hydrateFromUserSettings(
        _testUserSettings(
          syncedPreferences: _settingsWithAccessibility(
            accessibility_pb.AccessibilitySettings(
              saturationFactor: 0.75,
              customThemeCss: css,
            ),
          ),
        ),
      );

      await container
          .read(appearancePreferencesProvider.notifier)
          .setHideKeyboardHints(value: true);
      await _waitForDebounce();

      expect(usersApi.pushCount, 1);
      final bytes = base64Decode(usersApi.lastPushBody!.syncedPreferences!);
      final synced = pb.SyncedPreferences.fromBuffer(bytes);
      expect(synced.hasAccessibility(), isTrue);
      expect(synced.accessibility.customThemeCss, css);
      expect(synced.accessibility.saturationFactor, closeTo(0.75, 0.001));
      expect(synced.accessibility.hideKeyboardHints, isTrue);
    });

    test('hydrate applies brand primary into color theme', () async {
      const css = ':root { --brand-primary: #007fff; }';
      final store = container.read(syncedPreferencesStoreProvider);
      await container.read(themePreferenceProvider.notifier).load('u1');
      await container.read(appearancePreferencesProvider.notifier).load('u1');
      await store.hydrateFromUserSettings(
        _testUserSettings(
          syncedPreferences: _settingsWithAccessibility(
            accessibility_pb.AccessibilitySettings(customThemeCss: css),
          ),
        ),
      );

      expect(
        container.read(themePreferenceProvider).darkColorTheme.brandPrimary,
        const Color(0xFF007FFF),
      );
    });

    test(
      'push preserves wire custom theme css when local theme is empty',
      () async {
        const css = ':root { --brand-primary: #007fff; }';
        final store = container.read(syncedPreferencesStoreProvider);
        await container.read(themePreferenceProvider.notifier).load('u1');
        await container.read(appearancePreferencesProvider.notifier).load('u1');
        await store.hydrateFromUserSettings(
          _testUserSettings(
            syncedPreferences: _settingsWithAccessibility(
              accessibility_pb.AccessibilitySettings(customThemeCss: css),
            ),
          ),
        );

        await container
            .read(themePreferenceProvider.notifier)
            .applySyncedThemeCustomization(
              saturationFactor: 1,
              clearCustomThemeCss: true,
            );
        store.markDirty(SyncedPreferenceField.accessibility);
        await container
            .read(appearancePreferencesProvider.notifier)
            .setHideKeyboardHints(value: true);
        await _waitForDebounce();

        expect(usersApi.pushCount, 1);
        final bytes = base64Decode(usersApi.lastPushBody!.syncedPreferences!);
        final synced = pb.SyncedPreferences.fromBuffer(bytes);
        expect(synced.accessibility.customThemeCss, css);
      },
    );

    test(
      'protected inbound still applies remote theme customization',
      () async {
        const css = ':root { --brand-primary: #010203; }';
        final store = container.read(syncedPreferencesStoreProvider);
        await container.read(themePreferenceProvider.notifier).load('u1');
        await container.read(appearancePreferencesProvider.notifier).load('u1');
        await store.hydrateFromUserSettings(
          _testUserSettings(syncedPreferences: ''),
        );

        store.markDirty(SyncedPreferenceField.accessibility);
        await store.hydrateFromUserSettings(
          _testUserSettings(
            syncedPreferences: _settingsWithAccessibility(
              accessibility_pb.AccessibilitySettings(
                customThemeCss: css,
                saturationFactor: 0.6,
              ),
            ),
          ),
        );

        expect(container.read(themePreferenceProvider).customThemeCss, css);
        expect(container.read(themePreferenceProvider).saturationFactor, 0.6);
      },
    );

    test(
      'hydrate without custom theme css field preserves local css',
      () async {
        const css = ':root { --brand-primary: #007fff; }';
        final store = container.read(syncedPreferencesStoreProvider);
        await container.read(themePreferenceProvider.notifier).load('u1');
        await container.read(appearancePreferencesProvider.notifier).load('u1');
        await store.hydrateFromUserSettings(
          _testUserSettings(
            syncedPreferences: _settingsWithAccessibility(
              accessibility_pb.AccessibilitySettings(customThemeCss: css),
            ),
          ),
        );

        await store.hydrateFromUserSettings(
          _testUserSettings(
            syncedPreferences: _settingsWithAccessibility(
              accessibility_pb.AccessibilitySettings(hideKeyboardHints: true),
            ),
          ),
        );

        expect(container.read(themePreferenceProvider).customThemeCss, css);
        expect(
          container.read(themePreferenceProvider).darkColorTheme.brandPrimary,
          const Color(0xFF007FFF),
        );
      },
    );

    test(
      'hydrate with empty custom theme css field preserves local css',
      () async {
        const css = ':root { --brand-primary: #007fff; }';
        final store = container.read(syncedPreferencesStoreProvider);
        await container.read(themePreferenceProvider.notifier).load('u1');
        await container.read(appearancePreferencesProvider.notifier).load('u1');
        await store.hydrateFromUserSettings(
          _testUserSettings(
            syncedPreferences: _settingsWithAccessibility(
              accessibility_pb.AccessibilitySettings(customThemeCss: css),
            ),
          ),
        );

        await store.hydrateFromUserSettings(
          _testUserSettings(
            syncedPreferences: _settingsWithAccessibility(
              accessibility_pb.AccessibilitySettings(customThemeCss: ''),
            ),
          ),
        );

        expect(container.read(themePreferenceProvider).customThemeCss, css);
        expect(
          container.read(themePreferenceProvider).darkColorTheme.brandPrimary,
          const Color(0xFF007FFF),
        );
      },
    );

    test('saturation change pushes updated accessibility field', () async {
      final store = container.read(syncedPreferencesStoreProvider);
      await container.read(themePreferenceProvider.notifier).load('u1');
      await container.read(appearancePreferencesProvider.notifier).load('u1');
      await store.hydrateFromUserSettings(
        _testUserSettings(syncedPreferences: ''),
      );

      await container
          .read(themePreferenceProvider.notifier)
          .setSaturationFactor(0.25);
      await _waitForDebounce();

      expect(usersApi.pushCount, 1);
      final bytes = base64Decode(usersApi.lastPushBody!.syncedPreferences!);
      final synced = pb.SyncedPreferences.fromBuffer(bytes);
      expect(synced.accessibility.saturationFactor, closeTo(0.25, 0.001));
    });
  });
}
