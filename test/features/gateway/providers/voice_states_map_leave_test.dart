import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/gateway/providers/gateway_event_providers.dart';
import 'package:fluxer_app/features/voice/utils/voice_connection_voice_state.dart';
import 'package:fluxer_dart/gateway.dart';

void main() {
  ProviderContainer makeContainer() {
    final ProviderContainer container = ProviderContainer();
    addTearDown(container.dispose);
    return container;
  }

  VoiceState voiceState({
    required String userId,
    required String channelId,
    required String guildId,
    String? connectionId,
  }) => VoiceState(
    userId: userId,
    channelId: channelId,
    guildId: guildId,
    connectionId: connectionId,
  );

  group('VoiceStatesMap leave cleanup', () {
    test('removes entry when leave matches stored connectionId value', () {
      final ProviderContainer container = makeContainer();
      const String connectionId = 'conn-mobile';
      container
          .read(voiceStatesMapProvider.notifier)
          .update(
            VoiceState(
              userId: 'self',
              channelId: 'voice-1',
              guildId: 'g1',
              connectionId: connectionId,
            ),
          );
      expect(container.read(voiceStatesMapProvider), isNotEmpty);

      container
          .read(voiceStatesMapProvider.notifier)
          .update(
            VoiceState(
              userId: 'self',
              channelId: null,
              guildId: 'g1',
              connectionId: connectionId,
            ),
          );

      expect(container.read(voiceStatesMapProvider), isEmpty);
    });

    test('removes synthetic key when leave matches nested connectionId', () {
      final ProviderContainer container = makeContainer();
      const String userId = 'self';
      const String channelId = 'voice-1';
      const String connectionId = 'conn-1';
      final String syntheticKey = voiceStateSyntheticStorageKey(
        userId: userId,
        channelId: channelId,
      );
      container
          .read(voiceStatesMapProvider.notifier)
          .update(
            VoiceState(
              userId: userId,
              channelId: channelId,
              guildId: 'g1',
              connectionId: connectionId,
            ),
          );
      expect(
        container.read(voiceStatesMapProvider).containsKey(syntheticKey),
        isFalse,
      );
      expect(
        container.read(voiceStatesMapProvider).containsKey(connectionId),
        isTrue,
      );

      container
          .read(voiceStatesMapProvider.notifier)
          .update(
            VoiceState(
              userId: userId,
              channelId: null,
              guildId: 'g1',
              connectionId: connectionId,
            ),
          );

      expect(container.read(voiceStatesMapProvider), isEmpty);
    });

    test('leaves unrelated connections in the same channel', () {
      final ProviderContainer container = makeContainer();
      container.read(voiceStatesMapProvider.notifier).updateBulk([
        voiceState(
          userId: 'self',
          channelId: 'voice-1',
          guildId: 'g1',
          connectionId: 'conn-mobile',
        ),
        voiceState(
          userId: 'self',
          channelId: 'voice-1',
          guildId: 'g1',
          connectionId: 'conn-desktop',
        ),
      ]);
      expect(container.read(voiceStatesMapProvider), hasLength(2));

      container
          .read(voiceStatesMapProvider.notifier)
          .update(
            VoiceState(
              userId: 'self',
              channelId: null,
              guildId: 'g1',
              connectionId: 'conn-mobile',
            ),
          );

      final Map<String, VoiceState> map = container.read(
        voiceStatesMapProvider,
      );
      expect(map, hasLength(1));
      expect(map.containsKey('conn-desktop'), isTrue);
    });
  });
}
