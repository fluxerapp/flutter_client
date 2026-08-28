import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/voice/utils/voice_video_subscription.dart';
import 'package:livekit_client/livekit_client.dart';

void main() {
  group('shouldSubscribeRemoteCamera', () {
    test('subscribes only when visible and not omitted', () {
      expect(
        shouldSubscribeRemoteCamera(tileVisible: true, omitVideoTrack: false),
        isTrue,
      );
      expect(
        shouldSubscribeRemoteCamera(tileVisible: false, omitVideoTrack: false),
        isFalse,
      );
      expect(
        shouldSubscribeRemoteCamera(tileVisible: true, omitVideoTrack: true),
        isFalse,
      );
    });
  });

  group('shouldSubscribeRemoteScreenShare', () {
    test('subscribes only when the share is watched', () {
      expect(
        shouldSubscribeRemoteScreenShare(isActiveScreenShare: true),
        isTrue,
      );
      expect(
        shouldSubscribeRemoteScreenShare(isActiveScreenShare: false),
        isFalse,
      );
    });
  });

  test('camera subscribe quality starts low', () {
    expect(kVoiceCameraSubscribeQuality, VideoQuality.LOW);
  });
}
