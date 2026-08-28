import 'package:livekit_client/livekit_client.dart';

const VideoQuality kVoiceCameraSubscribeQuality = VideoQuality.LOW;

const Duration kVoiceVideoUnsubscribeGrace = Duration(milliseconds: 400);

bool shouldSubscribeRemoteCamera({
  required bool tileVisible,
  required bool omitVideoTrack,
}) {
  return tileVisible && !omitVideoTrack;
}

bool shouldSubscribeRemoteScreenShare({required bool isActiveScreenShare}) {
  return isActiveScreenShare;
}

Future<void> syncRemoteVideoSubscription({
  required RemoteTrackPublication publication,
  required bool shouldSubscribe,
  VideoQuality quality = kVoiceCameraSubscribeQuality,
}) async {
  if (shouldSubscribe) {
    if (publication.subscribed) {
      return;
    }
    await publication.subscribe();
    await publication.setVideoQuality(quality);
    return;
  }
  if (publication.subscribed) {
    await publication.unsubscribe();
  }
}
