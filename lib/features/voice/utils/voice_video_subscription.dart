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

VideoQuality voiceCameraSubscribeQuality({
  required bool isFilmstrip,
  required bool isFocusMain,
  double tileWidth = 0,
  double tileHeight = 0,
}) {
  if (isFilmstrip) {
    return VideoQuality.LOW;
  }
  if (isFocusMain) {
    return VideoQuality.HIGH;
  }
  final double width = tileWidth.isFinite ? tileWidth : 0;
  final double height = tileHeight.isFinite ? tileHeight : 0;
  if (width > 640 && height > 360) {
    return VideoQuality.HIGH;
  }
  if (width > 320 && height > 180) {
    return VideoQuality.MEDIUM;
  }
  return VideoQuality.LOW;
}

Future<void> syncRemoteVideoSubscription({
  required RemoteTrackPublication publication,
  required bool shouldSubscribe,
  VideoQuality quality = kVoiceCameraSubscribeQuality,
}) async {
  if (shouldSubscribe) {
    if (publication.subscribed) {
      await publication.setVideoQuality(quality);
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
