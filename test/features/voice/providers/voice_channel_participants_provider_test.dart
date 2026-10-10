import 'package:drift/drift.dart' show Value;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart' as database;
import 'package:fluxer_app/core/gateway/providers/gateway_event_providers.dart';
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/features/voice/providers/voice_channel_participants_provider.dart';
import 'package:fluxer_dart/gateway.dart';

import '../../../helpers/open_test_database.dart';

void main() {
  test(
    'sidebar shows each guild its own nickname for a user in two guilds',
    () async {
      clearVoiceParticipantUsersCache();
      final database.FluxerDatabase db = openTestDatabase();
      addTearDown(db.close);
      addTearDown(clearVoiceParticipantUsersCache);
      await db.userDao.upsertUser(
        database.UsersCompanion.insert(id: 'u1', username: 'account'),
      );
      await db.memberDao.upsertMembers(<database.MembersCompanion>[
        database.MembersCompanion.insert(
          userId: 'u1',
          guildId: 'g1',
          nick: const Value<String?>('Nick One'),
        ),
        database.MembersCompanion.insert(
          userId: 'u1',
          guildId: 'g2',
          nick: const Value<String?>('Nick Two'),
        ),
      ]);
      final ProviderContainer container = ProviderContainer(
        overrides: [fluxerDatabaseProvider.overrideWithValue(db)],
      );
      addTearDown(container.dispose);
      container.read(voiceStatesMapProvider.notifier).updateBulk(<VoiceState>[
        const VoiceState(
          userId: 'u1',
          guildId: 'g1',
          channelId: 'c1',
          connectionId: 'conn-1',
        ),
        const VoiceState(
          userId: 'u1',
          guildId: 'g2',
          channelId: 'c2',
          connectionId: 'conn-2',
        ),
      ]);
      container
        ..listen(voiceChannelSidebarParticipantsProvider('g1|c1'), (_, _) {})
        ..listen(voiceChannelSidebarParticipantsProvider('g2|c2'), (_, _) {});
      await container.read(friendNicknamesLoaderProvider.future);
      await container.read(voiceParticipantUsersLoaderProvider('u1').future);
      await container.read(voiceGuildMembersLoaderProvider('g1|u1').future);
      await container.read(voiceGuildMembersLoaderProvider('g2|u1').future);
      container
        ..invalidate(voiceChannelSidebarParticipantsProvider('g1|c1'))
        ..invalidate(voiceChannelSidebarParticipantsProvider('g2|c2'));

      expect(
        container
            .read(voiceChannelSidebarParticipantsProvider('g1|c1'))
            .single
            .displayName,
        'Nick One',
      );
      expect(
        container
            .read(voiceChannelSidebarParticipantsProvider('g2|c2'))
            .single
            .displayName,
        'Nick Two',
      );
    },
  );

  test('uniqueVoiceChannelParticipants keeps one entry per user', () {
    const VoiceState first = VoiceState(userId: '1');
    const VoiceState second = VoiceState(userId: '1');
    const VoiceState other = VoiceState(userId: '2');
    final List<VoiceChannelParticipantData> participants =
        <VoiceChannelParticipantData>[
          const VoiceChannelParticipantData(userId: '1', voice: first),
          const VoiceChannelParticipantData(userId: '1', voice: second),
          const VoiceChannelParticipantData(userId: '2', voice: other),
        ];

    final List<VoiceChannelParticipantData> unique =
        uniqueVoiceChannelParticipants(participants);

    expect(unique, hasLength(2));
    expect(unique.map((p) => p.userId), <String>['1', '2']);
    expect(unique.first.voice, first);
  });

  test('connectingSelfVoiceParticipant uses channel identity', () {
    final VoiceChannelParticipantData self = connectingSelfVoiceParticipant(
      currentUserId: 'me',
      channelId: 'voice-1',
      guildId: '',
      connectionId: 'conn-1',
    );

    expect(self.userId, 'me');
    expect(self.voice.channelId, 'voice-1');
    expect(self.voice.guildId, isNull);
    expect(self.voice.connectionId, 'conn-1');
    expect(self.voice.selfVideo, isFalse);
  });

  test('voiceParticipantsWithSelfProfile fills missing self user row', () {
    const VoiceState voice = VoiceState(userId: 'me');
    final List<VoiceChannelParticipantData> participants =
        voiceParticipantsWithSelfProfile(
          participants: const <VoiceChannelParticipantData>[
            VoiceChannelParticipantData(userId: 'me', voice: voice),
          ],
          currentUserId: 'me',
          selfUser: const database.User(
            id: 'me',
            username: 'self',
            discriminator: '0001',
            bot: false,
            system: false,
            status: 'online',
            mobile: false,
          ),
        );

    expect(participants.single.user?.username, 'self');
  });
}
