import 'package:drift/native.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart';
import 'package:fluxer_app/core/local_settings/local_setting_keys.dart';
import 'package:fluxer_app/core/local_settings/local_settings_store_provider.dart';
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/features/input/providers/keybind_preferences_provider.dart';
import 'package:fluxer_app/features/settings/domain/tts_notification_mode.dart';
import 'package:fluxer_app/features/settings/providers/preferences/desktop_behavior_preferences_provider.dart';
import 'package:fluxer_app/features/settings/providers/preferences/interface_extras_preferences_provider.dart';
import 'package:fluxer_app/features/settings/providers/preferences/local_settings_provider.dart';
import 'package:fluxer_app/features/settings/providers/preferences/notification_preferences_provider.dart';
import 'package:fluxer_app/features/settings/providers/preferences/streamer_mode_provider.dart';
import 'package:fluxer_app/features/settings/providers/preferences/synced_extras_preferences_provider.dart';
import 'package:fluxer_app/features/settings/providers/preferences/voice_settings_provider.dart';
import 'package:fluxer_app/features/voice/domain/voice_settings_state.dart';
import 'package:fluxer_app/features/voice/providers/local_voice_state_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late FluxerDatabase db;

  setUp(() {
    SharedPreferences.setMockInitialValues(<String, Object>{});
    db = FluxerDatabase.forTesting(NativeDatabase.memory());
  });

  tearDown(() => db.close());

  Future<ProviderContainer> start() async {
    final ProviderContainer container = ProviderContainer(
      overrides: [fluxerDatabaseProvider.overrideWithValue(db)],
    );
    addTearDown(container.dispose);
    await container.read(localSettingsStoreProvider).load();
    return container;
  }

  Future<void> stop(ProviderContainer container) =>
      container.read(localSettingsStoreProvider).flush();

  test('noise suppression survives a restart and an account switch', () async {
    final ProviderContainer first = await start();
    await first.read(voiceSettingsProvider.notifier).load('a');
    await first
        .read(voiceSettingsProvider.notifier)
        .setNoiseSuppressionBackend(NoiseSuppressionBackend.gate);
    await first
        .read(voiceSettingsProvider.notifier)
        .setParticipantVolume('x', 40);
    await stop(first);

    final ProviderContainer second = await start();
    expect(
      second.read(voiceSettingsProvider).noiseSuppressionBackend,
      NoiseSuppressionBackend.gate,
    );
    await second.read(voiceSettingsProvider.notifier).load('b');
    expect(
      second.read(voiceSettingsProvider).noiseSuppressionBackend,
      NoiseSuppressionBackend.gate,
    );
    expect(second.read(voiceSettingsProvider).participantVolumes, isEmpty);
    await second.read(voiceSettingsProvider.notifier).load('a');
    expect(second.read(voiceSettingsProvider).participantVolumes, <String, int>{
      'x': 40,
    });
  });

  test(
    'each account keeps its own voice choices until it changes them',
    () async {
      final ProviderContainer container = await start();
      container.read(localSettingsStoreProvider)
        ..write(LocalSettingKeys.voiceDevice, <String, Object?>{
          'inputDeviceId': 'mic-b',
          'inputVolume': 100,
        })
        ..writeAccount(LocalSettingKeys.voiceDeviceOverrides, <String, Object?>{
          'inputDeviceId': 'mic-a',
          'inputVolume': 40,
        }, userId: 'a');
      final VoiceSettings notifier = container.read(
        voiceSettingsProvider.notifier,
      );

      await notifier.load('a');
      expect(container.read(voiceSettingsProvider).inputDeviceId, 'mic-a');
      expect(container.read(voiceSettingsProvider).inputVolume, 40);
      await notifier.setEchoCancellation(value: false);
      await notifier.setInputVolume(70);

      await notifier.load('b');
      expect(container.read(voiceSettingsProvider).inputDeviceId, 'mic-b');
      expect(container.read(voiceSettingsProvider).inputVolume, 70);
      expect(container.read(voiceSettingsProvider).echoCancellation, isFalse);
      await notifier.setInputVolume(90);

      await notifier.load('a');
      expect(container.read(voiceSettingsProvider).inputDeviceId, 'mic-a');
      expect(container.read(voiceSettingsProvider).inputVolume, 90);
    },
  );

  test('flags are restored synchronously', () async {
    final ProviderContainer first = await start();
    await first
        .read(interfaceExtrasPreferencesProvider.notifier)
        .set(InterfaceExtraFlag.hideBlockedMessages, value: true);
    await stop(first);
    final ProviderContainer second = await start();
    expect(
      second.read(
        interfaceExtrasPreferencesProvider,
      )[InterfaceExtraFlag.hideBlockedMessages],
      isTrue,
    );
  });

  test('incoming messages are not read aloud by default', () async {
    final ProviderContainer container = await start();
    expect(
      container.read(notificationPreferencesProvider).ttsNotificationMode,
      TtsNotificationMode.never,
    );
  });

  test('every tts notification mode survives a restart', () async {
    for (final TtsNotificationMode mode in TtsNotificationMode.values) {
      final ProviderContainer first = await start();
      await first
          .read(notificationPreferencesProvider.notifier)
          .setTtsNotificationMode(mode);
      await stop(first);
      final ProviderContainer second = await start();
      expect(
        second.read(notificationPreferencesProvider).ttsNotificationMode,
        mode,
      );
    }
  });

  test('synced extras are kept per account', () async {
    final ProviderContainer container = await start();
    container.read(currentUserIdProvider.notifier).set('a');
    await container
        .read(syncedExtrasPreferencesProvider.notifier)
        .applyConvertEmoticons(enabled: true);
    container.read(currentUserIdProvider.notifier).set('b');
    expect(
      container.read(syncedExtrasPreferencesProvider).convertEmoticons,
      isFalse,
    );
    container.read(currentUserIdProvider.notifier).set('a');
    expect(
      container.read(syncedExtrasPreferencesProvider).convertEmoticons,
      isTrue,
    );
  });

  test('tray settings are mirrored for the native close handler', () async {
    final ProviderContainer container = await start();
    final DesktopBehaviorPreferences notifier = container.read(
      desktopBehaviorPreferencesProvider.notifier,
    );
    await notifier.setShowTrayIcon(value: false);
    await notifier.setCloseToTray(value: false);
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    expect(preferences.getBool('desktop_show_tray_icon'), isFalse);
    expect(preferences.getBool('desktop_close_to_tray'), isFalse);
  });

  test('native title bar is mirrored for the linux runner', () async {
    final ProviderContainer container = await start();
    await container
        .read(desktopBehaviorPreferencesProvider.notifier)
        .setUseNativeTitleBar(value: true);
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    expect(preferences.getBool('desktop_use_native_title_bar'), isTrue);
  });

  test('an empty store keeps every default', () async {
    final ProviderContainer container = await start();
    container.read(currentUserIdProvider.notifier).set('a');
    await container.read(voiceSettingsProvider.notifier).load('a');

    final NotificationPreferencesState notifications = container.read(
      notificationPreferencesProvider,
    );
    expect(notifications.notificationsEnabled, isTrue);
    expect(notifications.unreadMessageBadgeEnabled, isTrue);

    final LocalSettingsState local = container.read(localSettingsProvider);
    expect(local.hapticsEnabled, isTrue);
    expect(local.splashQuotesEnabled, isFalse);
    expect(local.openCommunitiesToLastChannel, isFalse);

    final StreamerModeState streamer = container.read(streamerModeProvider);
    expect(streamer.manualEnabled, isFalse);
    expect(streamer.autoEnable, isTrue);
    expect(streamer.hidePersonalInformation, isTrue);
    expect(streamer.hideInviteLinks, isTrue);
    expect(streamer.disableSounds, isTrue);
    expect(streamer.disableNotifications, isTrue);

    final InterfaceExtrasState extras = container.read(
      interfaceExtrasPreferencesProvider,
    );
    expect(
      <InterfaceExtraFlag>[
        for (final InterfaceExtraFlag flag in InterfaceExtraFlag.values)
          if (extras[flag]) flag,
      ],
      <InterfaceExtraFlag>[InterfaceExtraFlag.animateGifPicker],
    );

    final SyncedExtrasState synced = container.read(
      syncedExtrasPreferencesProvider,
    );
    expect(synced.spellcheckEnabled, isTrue);
    expect(synced.convertEmoticons, isFalse);
    expect(synced.hideHelpButton, isFalse);
    expect(synced.hideDownloadButton, isFalse);

    expect(
      container.read(desktopBehaviorPreferencesProvider),
      const DesktopBehaviorPreferencesState(),
    );
    expect(
      container.read(keybindPreferencesProvider),
      const KeybindPreferencesState(),
    );
    expect(container.read(localVoiceStateProvider).selfMute, isFalse);
    expect(container.read(localVoiceStateProvider).selfDeaf, isFalse);
    expect(
      container.read(voiceSettingsProvider).toJson(),
      const VoiceSettingsState().toJson(),
    );
  });
}
