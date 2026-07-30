import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/voice/utils/voice_participant_moderation.dart';

void main() {
  group('buildDisconnectVoiceParticipantBody', () {
    test('includes explicit null channel_id for disconnect', () {
      expect(
        buildDisconnectVoiceParticipantBody(connectionId: 'conn-1'),
        <String, dynamic>{'channel_id': null, 'connection_id': 'conn-1'},
      );
    });

    test('omits connection_id when disconnecting all devices', () {
      expect(buildDisconnectVoiceParticipantBody(), <String, dynamic>{
        'channel_id': null,
      });
    });
  });
}
