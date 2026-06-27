import 'package:drift/drift.dart' show Value;
import 'package:drift/native.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart';
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/features/gateway/providers/gateway_event_providers.dart';
import 'package:fluxer_app/features/voice/providers/voice_channel_participants_provider.dart';
import 'package:fluxer_dart/gateway.dart';

void main() {
  ProviderContainer makeContainer(FluxerDatabase db) {
    final ProviderContainer container = ProviderContainer(
      overrides: [fluxerDatabaseProvider.overrideWithValue(db)],
    );
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

  test('returns empty list when channel has no voice states', () async {
    final FluxerDatabase db = FluxerDatabase.forTesting(
      NativeDatabase.memory(),
    );
    addTearDown(db.close);
    final ProviderContainer container = makeContainer(db);

    final List<VoiceChannelParticipantData> participants = await container.read(
      voiceChannelParticipantsProvider(
        voiceChannelParticipantsFamilyKey('g1', 'A'),
      ).future,
    );

    expect(participants, isEmpty);
  });

  test(
    'resolves display users for participants in the target channel',
    () async {
      final FluxerDatabase db = FluxerDatabase.forTesting(
        NativeDatabase.memory(),
      );
      addTearDown(db.close);
      await db.userDao.upsertUser(
        UsersCompanion.insert(id: 'u1', username: 'alice'),
      );
      final ProviderContainer container = makeContainer(db);
      container
          .read(voiceStatesMapProvider.notifier)
          .update(voiceState(userId: 'u1', channelId: 'A', guildId: 'g1'));

      final List<VoiceChannelParticipantData> participants = await container
          .read(
            voiceChannelParticipantsProvider(
              voiceChannelParticipantsFamilyKey('g1', 'A'),
            ).future,
          );

      expect(participants, hasLength(1));
      expect(participants.single.userId, 'u1');
      expect(participants.single.user?.username, 'alice');
    },
  );

  test('does not invalidate channel states when another channel changes', () {
    final FluxerDatabase db = FluxerDatabase.forTesting(
      NativeDatabase.memory(),
    );
    addTearDown(db.close);
    final ProviderContainer container = makeContainer(db);
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
}
