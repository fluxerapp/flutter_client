import 'package:drift/native.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart';
import 'package:fluxer_app/core/local_settings/local_setting_keys.dart';
import 'package:fluxer_app/core/local_settings/local_settings_store_provider.dart';
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/features/settings/providers/preferences/desktop_behavior_preferences_provider.dart';
import 'package:fluxer_app/features/settings/providers/preferences/interface_extras_preferences_provider.dart';
import 'package:fluxer_app/features/settings/providers/preferences/synced_extras_preferences_provider.dart';
import 'package:fluxer_app/features/settings/providers/preferences/voice_settings_provider.dart';
import 'package:fluxer_app/features/voice/domain/voice_settings_state.dart';
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
}
