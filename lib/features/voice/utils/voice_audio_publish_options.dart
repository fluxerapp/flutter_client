import 'package:fluxer_app/features/voice/domain/voice_settings_state.dart';
import 'package:livekit_client/livekit_client.dart';

const int kOpusMaxAudioBitrateBps = 510000;
const int kVoiceChannelMinAudioBitrateBps = 8000;

int? normaliseAudioBitrateBps(int? value) {
  if (value == null || value <= 0) {
    return null;
  }
  final int bitsPerSecond = value >= 8 && value <= 512 ? value * 1000 : value;
  return bitsPerSecond.clamp(
    kVoiceChannelMinAudioBitrateBps,
    kOpusMaxAudioBitrateBps,
  );
}

AudioPublishOptions? buildMicrophonePublishOptions({
  required int? channelBitrate,
  required VoiceProcessingMode processingMode,
}) {
  final int? maxBitrate = normaliseAudioBitrateBps(channelBitrate);
  if (maxBitrate == null) {
    return null;
  }
  final bool studioMode = processingMode == VoiceProcessingMode.studio;
  return AudioPublishOptions(
    encoding: AudioEncoding(
      maxBitrate: maxBitrate,
      bitratePriority: Priority.high,
    ),
    dtx: !studioMode,
  );
}

const AudioPublishOptions kScreenShareAudioPublishOptions = AudioPublishOptions(
  encoding: AudioEncoding(
    maxBitrate: kOpusMaxAudioBitrateBps,
    bitratePriority: Priority.high,
  ),
  dtx: false,
  stream: 'screen_share',
);
