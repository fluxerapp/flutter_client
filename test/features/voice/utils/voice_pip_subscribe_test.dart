import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/voice/utils/voice_participant_track_resolver.dart';
import 'package:fluxer_app/features/voice/utils/voice_pip_subscribe.dart';
import 'package:livekit_client/livekit_client.dart';

void main() {
  group('syncCollapsedVoiceVideoSubscriptions', () {
    test('returns early when session guard is false', () async {
      final Room room = Room();
      await syncCollapsedVoiceVideoSubscriptions(
        media: VoiceLiveKitMediaRoom.of(room),
        featuredTileId: 'user:abc:camera',
        isSessionCurrent: () => false,
      );
    });
  });
}
