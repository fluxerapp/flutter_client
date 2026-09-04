import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/voice/providers/voice_channel_participants_provider.dart';
import 'package:fluxer_dart/gateway.dart';

void main() {
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
}
