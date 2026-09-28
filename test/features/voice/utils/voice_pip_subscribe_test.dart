import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/voice/utils/voice_pip_subscribe.dart';
import 'package:livekit_client/livekit_client.dart';

void main() {
  group('syncCollapsedVoiceVideoSubscriptions', () {
    test('returns early when session guard is false', () async {
      final Room room = Room();
      await syncCollapsedVoiceVideoSubscriptions(
        room: room,
        featuredTileId: 'user:abc:camera',
        isSessionCurrent: () => false,
      );
    });
  });
}
