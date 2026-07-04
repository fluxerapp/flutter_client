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
    bool selfMute = false,
  }) => VoiceState(
    userId: userId,
    channelId: channelId,
    guildId: guildId,
    connectionId: connectionId ?? '$userId-$channelId',
    selfMute: selfMute,
  );

  test(
    'voiceStatesInChannel returns only states for the requested channel',
    () {
      final ProviderContainer container = makeContainer();
      container.read(voiceStatesMapProvider.notifier).updateBulk([
        voiceState(userId: 'u1', channelId: 'A', guildId: 'g1'),
        voiceState(userId: 'u2', channelId: 'B', guildId: 'g1'),
      ]);

      final List<VoiceState> states = container.read(
        voiceStatesInChannelProvider('g1', 'A'),
      );

      expect(states, hasLength(1));
      expect(states.single.userId, 'u1');
    },
  );

  test('voiceStatesInChannel ignores unrelated channel updates', () {
    final ProviderContainer container = makeContainer();
    container
        .read(voiceStatesMapProvider.notifier)
        .update(voiceState(userId: 'u1', channelId: 'A', guildId: 'g1'));

    int notifyCount = 0;
    container.listen(
      voiceStatesInChannelProvider('g1', 'A'),
      (_, _) => notifyCount++,
      fireImmediately: true,
    );
    expect(notifyCount, 1);

    container
        .read(voiceStatesMapProvider.notifier)
        .update(voiceState(userId: 'u2', channelId: 'B', guildId: 'g1'));
    expect(notifyCount, 1);
  });

  test('voiceStatesInChannel reflects new participants in its channel', () {
    final ProviderContainer container = makeContainer();
    container
        .read(voiceStatesMapProvider.notifier)
        .update(voiceState(userId: 'u1', channelId: 'A', guildId: 'g1'));
    expect(
      container.read(voiceStatesInChannelProvider('g1', 'A')),
      hasLength(1),
    );

    container
        .read(voiceStatesMapProvider.notifier)
        .update(voiceState(userId: 'u2', channelId: 'A', guildId: 'g1'));
    expect(
      container.read(voiceStatesInChannelProvider('g1', 'A')),
      hasLength(2),
    );
  });

  test('update removes stale synthetic key when connectionId arrives', () {
    final ProviderContainer container = makeContainer();
    const String userId = 'u1';
    const String channelId = 'A';
    const String guildId = 'g1';
    final String syntheticKey = voiceStateSyntheticStorageKey(
      userId: userId,
      channelId: channelId,
    );
    container
        .read(voiceStatesMapProvider.notifier)
        .update(
          VoiceState(userId: userId, channelId: channelId, guildId: guildId),
        );
    expect(
      container.read(voiceStatesMapProvider).containsKey(syntheticKey),
      isTrue,
    );

    container
        .read(voiceStatesMapProvider.notifier)
        .update(
          VoiceState(
            userId: userId,
            channelId: channelId,
            guildId: guildId,
            connectionId: 'conn-2',
            selfDeaf: true,
          ),
        );

    final Map<String, VoiceState> map = container.read(voiceStatesMapProvider);
    expect(map.containsKey(syntheticKey), isFalse);
    expect(map['conn-2']?.selfDeaf, isTrue);
  });

  test('update removes leave state stored under synthetic key', () {
    final ProviderContainer container = makeContainer();
    const String userId = 'self';
    const String channelId = 'A';
    const String connectionId = 'conn-synthetic';
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
    expect(container.read(voiceStatesMapProvider), isNotEmpty);

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
}
