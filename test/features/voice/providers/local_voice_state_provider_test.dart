import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/voice/domain/local_voice_state_data.dart';
import 'package:fluxer_app/features/voice/providers/local_voice_state_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
    Future<void> waitForHydration(ProviderContainer container) async {
      container.read(localVoiceStateProvider);
      await Future<void>.delayed(Duration.zero);
      await Future<void>.delayed(Duration.zero);
    }

    test('hydrates persisted mute and deafen flags', () async {
      SharedPreferences.setMockInitialValues(<String, Object>{
        kPersistedSelfMuteKey: true,
        kPersistedSelfDeafKey: false,
      });
      final ProviderContainer container = ProviderContainer();
      addTearDown(container.dispose);

      await waitForHydration(container);

      expect(container.read(localVoiceStateProvider).selfMute, isTrue);
      expect(container.read(localVoiceStateProvider).selfDeaf, isFalse);
    });

    test('persists mute and deafen toggles', () async {
      SharedPreferences.setMockInitialValues(<String, Object>{});
      final ProviderContainer container = ProviderContainer();
      addTearDown(container.dispose);

      await waitForHydration(container);
      final LocalVoiceState notifier = container.read(
        localVoiceStateProvider.notifier,
      );

      await notifier.toggleSelfMute();
      await notifier.toggleSelfDeaf();

      final LocalVoiceStateData state = container.read(localVoiceStateProvider);
      expect(state.selfDeaf, isTrue);
      expect(state.selfMute, isTrue);

      final SharedPreferences prefs = await SharedPreferences.getInstance();
      expect(prefs.getBool(kPersistedSelfMuteKey), isTrue);
      expect(prefs.getBool(kPersistedSelfDeafKey), isTrue);
    });

    test('undeafen restores mic when auto-muted by deafen', () async {
      SharedPreferences.setMockInitialValues(<String, Object>{});
      final ProviderContainer container = ProviderContainer();
      addTearDown(container.dispose);

      await waitForHydration(container);
      final LocalVoiceState notifier = container.read(
        localVoiceStateProvider.notifier,
      );

      await notifier.toggleSelfDeaf();
      await notifier.toggleSelfDeaf();

      expect(container.read(localVoiceStateProvider).selfDeaf, isFalse);
      expect(container.read(localVoiceStateProvider).selfMute, isFalse);
    });

    test('undeafen keeps mute when user was muted before deafen', () async {
      SharedPreferences.setMockInitialValues(<String, Object>{});
      final ProviderContainer container = ProviderContainer();
      addTearDown(container.dispose);

      await waitForHydration(container);
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
