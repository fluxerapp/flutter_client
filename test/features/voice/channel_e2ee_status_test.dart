import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/voice/utils/e2ee/e2ee_status.dart';
import 'package:fluxer_dart/gateway.dart';

VoiceState _voiceState({
  String userId = 'user-1',
  String? connectionId = 'connection-1',
  String channelId = 'channel-1',
  String? guildId = 'guild-1',
  bool? e2eeCapable,
}) {
  return VoiceState(
    userId: userId,
    channelId: channelId,
    guildId: guildId,
    connectionId: connectionId,
    e2eeCapable: e2eeCapable,
  );
}

void main() {
  group('computeChannelE2eeStatusFromStates', () {
    test('empty channel uses emptyChannelStatus encrypted', () {
      expect(
        computeChannelE2eeStatusFromStates(
          connectedStates: const <VoiceState>[],
          emptyChannelStatus: ChannelE2eeStatus.encrypted,
        ),
        ChannelE2eeStatus.encrypted,
      );
    });

    test('empty channel defaults to none', () {
      expect(
        computeChannelE2eeStatusFromStates(
          connectedStates: const <VoiceState>[],
        ),
        ChannelE2eeStatus.none,
      );
    });

    test('encrypted when every connected state is E2EE capable', () {
      expect(
        computeChannelE2eeStatusFromStates(
          connectedStates: <VoiceState>[
            _voiceState(e2eeCapable: true),
            _voiceState(
              userId: 'user-2',
              connectionId: 'connection-2',
              e2eeCapable: true,
            ),
          ],
        ),
        ChannelE2eeStatus.encrypted,
      );
    });

    test('broken when connected voice states mix E2EE support', () {
      expect(
        computeChannelE2eeStatusFromStates(
          connectedStates: <VoiceState>[
            _voiceState(e2eeCapable: true),
            _voiceState(
              userId: 'user-2',
              connectionId: 'connection-2',
              e2eeCapable: false,
            ),
          ],
        ),
        ChannelE2eeStatus.broken,
      );
    });
  });

  group('computeChannelE2eeStatus', () {
    test('returns none when guild lacks VOICE_E2EE feature', () {
      final Map<String, VoiceState> map = <String, VoiceState>{
        'c1': _voiceState(e2eeCapable: true),
      };
      expect(
        computeChannelE2eeStatus(
          voiceStates: map,
          guildId: 'guild-1',
          channelId: 'channel-1',
          guildHasVoiceE2ee: false,
        ),
        ChannelE2eeStatus.none,
      );
    });

    test('DM channels ignore guild feature gate', () {
      final Map<String, VoiceState> map = <String, VoiceState>{
        'c1': _voiceState(guildId: null, e2eeCapable: true),
      };
      expect(
        computeChannelE2eeStatus(
          voiceStates: map,
          guildId: null,
          channelId: 'channel-1',
          guildHasVoiceE2ee: false,
        ),
        ChannelE2eeStatus.encrypted,
      );
    });
  });
}
