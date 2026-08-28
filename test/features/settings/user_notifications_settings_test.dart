import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/instance/instance_runtime_config.dart';
import 'package:fluxer_app/core/providers/instance_runtime_config_provider.dart';
import 'package:fluxer_app/core/synced_preferences/engine/synced_preference_field.dart';
import 'package:fluxer_app/core/synced_preferences/engine/synced_preferences_store.dart';
import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_text_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme.dart';
import 'package:fluxer_app/core/theme/themes/dark.dart';
import 'package:fluxer_app/features/profile/providers/user_settings_status_provider.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/user_notifications_settings.dart';
import 'package:fluxer_app/features/settings/providers/mention_preference_provider.dart';
import 'package:fluxer_app/features/settings/providers/notification_preferences_provider.dart';
import 'package:fluxer_app/features/settings/providers/sound_preferences_provider.dart';
import 'package:fluxer_app/features/settings/providers/user_settings_sync_service.dart';
import 'package:fluxer_app/features/shell/providers/push_notification_permission_status_provider.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_dart/export.dart';

import '../../helpers/test_l10n.dart';

class _InertSyncedPreferencesStore extends SyncedPreferencesStore {
  // Test stub does not use super parameters.
  // ignore: use_super_parameters
  _InertSyncedPreferencesStore(Ref ref) : super(ref);

  @override
  void markDirty(SyncedPreferenceField field) {}

  @override
  void scheduleFlush() {}
}

class _NoopUserSettingsSyncService extends UserSettingsSyncService {
  _NoopUserSettingsSyncService(super.ref);

  @override
  Future<void> pushAfkTimeout(int minutes) async {}
}

UserSettingsResponse _settingsResponse() {
  return UserSettingsResponse.fromJson(<String, Object?>{
    'status': 'online',
    'theme': 'dark',
    'locale': 'en-US',
    'time_format': 0,
    'render_embeds': true,
    'render_reactions': true,
    'inline_attachment_media': true,
    'inline_embed_media': true,
    'gif_auto_play': true,
    'animate_emoji': true,
    'animate_stickers': 0,
    'render_spoilers': 0,
    'message_display_compact': false,
    'friend_source_flags': 0,
    'incoming_call_flags': 0,
    'group_dm_add_permission_flags': 0,
    'guild_folders': <Map<String, Object?>>[],
    'custom_status': null,
    'afk_timeout': 300,
    'default_share_voice_activity': false,
    'developer_mode': false,
    'trusted_domains': <String>[],
    'default_hide_muted_channels': false,
    'sensitive_content_friend_dm_filter': 0,
    'sensitive_content_non_friend_dm_filter': 0,
    'sensitive_content_guild_filter': 0,
    'suppress_unprivileged_self_mentions': false,
    'suppress_unprivileged_self_mentions_bypass_user_ids': <String>[],
    'staff_dm_access_user_ids': <String>[],
    'profile_privacy': 0,
    'synced_preferences': '',
    'restricted_guilds': <String>[],
    'bot_restricted_guilds': <String>[],
    'default_guilds_restricted': false,
    'bot_default_guilds_restricted': false,
  });
}

Widget _wrap(Widget child) {
  final colorTheme = buildDarkColorTheme();
  final ProviderContainer container = ProviderContainer(
    overrides: [
      instanceRuntimeConfigProvider.overrideWithValue(
        InstanceRuntimeConfig.defaults,
      ),
      syncedPreferencesStoreProvider.overrideWith(
        _InertSyncedPreferencesStore.new,
      ),
      userSettingsSyncProvider.overrideWith(_NoopUserSettingsSyncService.new),
      userSettingsStatusProvider.overrideWithValue(_settingsResponse()),
      notificationPreferencesProvider.overrideWith(
        _TestNotificationPreferences.new,
      ),
      soundPreferencesProvider.overrideWith(_TestSoundPreferences.new),
      mentionReplyPreferenceProvider.overrideWith(
        _TestMentionReplyPreference.new,
      ),
      pushNotificationPermissionGrantedProvider.overrideWith((Ref ref) => true),
      pushNotificationRequiresSystemSettingsProvider.overrideWith(
        (Ref ref) => false,
      ),
    ],
  );
  return UncontrolledProviderScope(
    container: container,
    child: MaterialApp(
      locale: kTestLocale,
      localizationsDelegates: FluxerLocalizations.localizationsDelegates,
      supportedLocales: FluxerLocalizations.supportedLocales,
      theme: buildFluxerTheme(
        colorTheme: colorTheme,
        textTheme: FluxerTextTheme.fromColors(colorTheme),
        layoutTheme: FluxerLayoutTheme.scaled(),
      ),
      home: Scaffold(body: child),
    ),
  );
}

class _TestNotificationPreferences extends NotificationPreferences {
  @override
  NotificationPreferencesState build() {
    return const NotificationPreferencesState(isLoaded: true);
  }
}

class _TestSoundPreferences extends SoundPreferences {
  @override
  SoundPreferencesState build() {
    return const SoundPreferencesState();
  }
}

class _TestMentionReplyPreference extends MentionReplyPreference {
  @override
  Stream<MentionReplyPreferences> build() async* {
    yield MentionReplyPreferences.noPreference;
  }
}

void main() {
  testWidgets('renders notifications sections and key descriptions', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(_wrap(const UserNotificationsSettings()));
    await tester.pumpAndSettle();

    expect(find.text('General'), findsOneWidget);
    expect(find.text('Mention preference'), findsOneWidget);
    expect(find.text('Sounds'), findsOneWidget);
    expect(
      find.text(
        "Respect the sender's intent, with no warning when they toggle the @ mention",
      ),
      findsOneWidget,
    );
    expect(
      find.text(
        'Sets the level for every sound effect. Per-sound overrides ignore this.',
      ),
      findsOneWidget,
    );
    expect(
      find.text('Your existing notification sound settings will be preserved.'),
      findsOneWidget,
    );
  });
}
