import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/gateway/providers/gateway_event_providers.dart';
import 'package:fluxer_app/features/voice/providers/voice_channel_member_count_provider.dart';
import 'package:fluxer_app/features/voice/providers/voice_channel_participants_provider.dart';
import 'package:fluxer_dart/gateway.dart';

void main() {
  ProviderContainer makeContainer() {
    final container = ProviderContainer();
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
    connectionId: connectionId ?? '$userId-$channelId',
  );

  int count(ProviderContainer container, String guildId, String channelId) =>
      container.read(
        voiceChannelMemberCountProvider(
          voiceChannelParticipantsFamilyKey(guildId, channelId),
        ),
      );

  test('counts distinct connected users per guild channel', () {
    final container = makeContainer();
    container.read(voiceStatesMapProvider.notifier).updateBulk([
      voiceState(userId: 'u1', channelId: 'A', guildId: 'g1'),
      voiceState(userId: 'u2', channelId: 'A', guildId: 'g1'),
      voiceState(userId: 'u3', channelId: 'B', guildId: 'g1'),
    ]);

    expect(count(container, 'g1', 'A'), 2);
    expect(count(container, 'g1', 'B'), 1);
    expect(count(container, 'g1', 'C'), 0);
  });

  test(
    'does not count users from a different guild in the same channel id',
    () {
      final container = makeContainer();
      container.read(voiceStatesMapProvider.notifier).updateBulk([
        voiceState(userId: 'u1', channelId: 'A', guildId: 'g1'),
        voiceState(userId: 'u2', channelId: 'A', guildId: 'g2'),
      ]);

      expect(count(container, 'g1', 'A'), 1);
      expect(count(container, 'g2', 'A'), 1);
    },
  );

  test('collapses multiple connections from a single user', () {
    final container = makeContainer();
    container.read(voiceStatesMapProvider.notifier).updateBulk([
      voiceState(
        userId: 'u1',
        channelId: 'A',
        guildId: 'g1',
        connectionId: 'conn-1',
      ),
      voiceState(
        userId: 'u1',
        channelId: 'A',
        guildId: 'g1',
        connectionId: 'conn-2',
      ),
    ]);

    expect(count(container, 'g1', 'A'), 1);
  });

  test('unrelated channel update does not change count for channel A', () {
    final container = makeContainer();
    container.read(voiceStatesMapProvider.notifier).updateBulk([
      voiceState(userId: 'u1', channelId: 'A', guildId: 'g1'),
      voiceState(userId: 'u2', channelId: 'A', guildId: 'g1'),
    ]);
    expect(count(container, 'g1', 'A'), 2);

    container
        .read(voiceStatesMapProvider.notifier)
        .update(voiceState(userId: 'u3', channelId: 'B', guildId: 'g1'));
    expect(count(container, 'g1', 'A'), 2);
  });

  test('removing a user from a channel decrements count', () {
    final container = makeContainer();
    final VoiceState joined = voiceState(
      userId: 'u1',
      channelId: 'A',
      guildId: 'g1',
      connectionId: 'conn-1',
    );
    container.read(voiceStatesMapProvider.notifier).update(joined);
    expect(count(container, 'g1', 'A'), 1);

    container
        .read(voiceStatesMapProvider.notifier)
        .update(
          VoiceState(userId: 'u1', guildId: 'g1', connectionId: 'conn-1'),
        );
    expect(count(container, 'g1', 'A'), 0);
  });
}
