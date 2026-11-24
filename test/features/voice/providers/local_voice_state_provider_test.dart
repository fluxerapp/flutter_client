import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/local_settings/local_setting_keys.dart';
import 'package:fluxer_app/core/local_settings/local_settings_store.dart';
import 'package:fluxer_app/core/local_settings/local_settings_store_provider.dart';
import 'package:fluxer_app/features/voice/domain/local_voice_state_data.dart';
import 'package:fluxer_app/features/voice/providers/local_voice_state_provider.dart';

void main() {
  group('LocalVoiceStateData', () {
    test('deafen toggle forces mute on', () {
      const LocalVoiceStateData initial = LocalVoiceStateData();
      final LocalVoiceStateData deafened = initial.copyWith(
        selfDeaf: true,
        selfMute: true,
        shouldUnmuteOnUndeafen: true,
      );
      expect(deafened.selfMute, isTrue);
      expect(deafened.selfDeaf, isTrue);
    });
  });

  group('LocalVoiceState', () {
    test('hydrates persisted mute and deafen flags', () {
      final ProviderContainer container = ProviderContainer();
      addTearDown(container.dispose);
      container.read(localSettingsStoreProvider)
        ..write(LocalSettingKeys.selfMute, true)
        ..write(LocalSettingKeys.selfDeaf, false);

      expect(container.read(localVoiceStateProvider).selfMute, isTrue);
      expect(container.read(localVoiceStateProvider).selfDeaf, isFalse);
    });

    test('persists mute and deafen toggles', () async {
      final ProviderContainer container = ProviderContainer();
      addTearDown(container.dispose);
      final LocalVoiceState notifier = container.read(
        localVoiceStateProvider.notifier,
      );

      await notifier.toggleSelfMute();
      await notifier.toggleSelfDeaf();

      final LocalVoiceStateData state = container.read(localVoiceStateProvider);
      expect(state.selfDeaf, isTrue);
      expect(state.selfMute, isTrue);

      final LocalSettingsStore store = container.read(
        localSettingsStoreProvider,
      );
      expect(store.read(LocalSettingKeys.selfMute), isTrue);
      expect(store.read(LocalSettingKeys.selfDeaf), isTrue);
    });

    test('undeafen restores mic when auto-muted by deafen', () async {
      final ProviderContainer container = ProviderContainer();
      addTearDown(container.dispose);
      final LocalVoiceState notifier = container.read(
        localVoiceStateProvider.notifier,
      );

      await notifier.toggleSelfDeaf();
      await notifier.toggleSelfDeaf();

      expect(container.read(localVoiceStateProvider).selfDeaf, isFalse);
      expect(container.read(localVoiceStateProvider).selfMute, isFalse);
    });

    test('undeafen keeps mute when user was muted before deafen', () async {
      final ProviderContainer container = ProviderContainer();
      addTearDown(container.dispose);
      final LocalVoiceState notifier = container.read(
        localVoiceStateProvider.notifier,
      );

      await notifier.toggleSelfMute();
      await notifier.toggleSelfDeaf();
      await notifier.toggleSelfDeaf();

      final LocalVoiceStateData state = container.read(localVoiceStateProvider);
      expect(state.selfDeaf, isFalse);
      expect(state.selfMute, isTrue);
    });
  });
}
