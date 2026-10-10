import 'package:flutter_webrtc/flutter_webrtc.dart';
import 'package:fluxer_app/features/voice/domain/voice_media_participant.dart';
import 'package:fluxer_app/features/voice/domain/voice_settings_state.dart';
import 'package:fluxer_app/features/voice/utils/voice_volume_utils.dart';
import 'package:livekit_client/livekit_client.dart';

String? parseUserIdFromParticipantIdentity(String identity) {
  final RegExpMatch? match = RegExp(r'^user_(\d+)').firstMatch(identity);
  return match?.group(1);
}

double resolveParticipantTrackVolume({
  required int participantVolumePercent,
  required int outputVolumePercent,
  bool locallyMuted = false,
}) {
  if (locallyMuted) {
    return 0;
  }
  return composedBoostedVoiceTrackVolume(<int>[
    participantVolumePercent,
    outputVolumePercent,
  ]);
}

Future<void> applyParticipantVolumeToTrack({
  required AudioTrack track,
  required int participantVolumePercent,
  required int outputVolumePercent,
  bool locallyMuted = false,
}) async {
  final double volume = resolveParticipantTrackVolume(
    participantVolumePercent: participantVolumePercent,
    outputVolumePercent: outputVolumePercent,
    locallyMuted: locallyMuted,
  );
  await Helper.setVolume(volume, track.mediaStreamTrack);
}

Future<void> applyParticipantVolumeToMedia({
  required VoiceMediaRoom? media,
  required String userId,
  required int participantVolumePercent,
  required int outputVolumePercent,
  bool locallyMuted = false,
}) async {
  if (media == null || userId.isEmpty) {
    return;
  }
  for (final VoiceMediaParticipant participant in media.participants) {
    if (participant.userId != userId) {
      continue;
    }
    for (final AudioTrack track in participant.voiceAudioTracks) {
      await applyParticipantVolumeToTrack(
        track: track,
        participantVolumePercent: participantVolumePercent,
        outputVolumePercent: outputVolumePercent,
        locallyMuted: locallyMuted,
      );
    }
  }
}

Future<void> applyAllParticipantVolumesToMedia({
  required VoiceMediaRoom? media,
  required Map<String, int> participantVolumes,
  required Map<String, bool> participantLocalMutes,
  required int outputVolumePercent,
}) async {
  if (media == null) {
    return;
  }
  for (final VoiceMediaParticipant participant in media.participants) {
    final String? userId = participant.userId;
    if (userId == null) {
      continue;
    }
    for (final AudioTrack track in participant.voiceAudioTracks) {
      await applyParticipantVolumeToTrack(
        track: track,
        participantVolumePercent: defaultParticipantVolumeForUser(
          participantVolumes: participantVolumes,
          userId: userId,
        ),
        outputVolumePercent: outputVolumePercent,
        locallyMuted: participantLocalMutes[userId] ?? false,
      );
    }
  }
}

int defaultParticipantVolumeForUser({
  required Map<String, int> participantVolumes,
  required String userId,
}) {
  return participantVolumes[userId] ?? kDefaultVoiceVolumePercent;
}
