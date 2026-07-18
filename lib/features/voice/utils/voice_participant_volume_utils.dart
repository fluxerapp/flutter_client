import 'package:flutter_webrtc/flutter_webrtc.dart';
import 'package:fluxer_app/features/voice/domain/voice_settings_state.dart';
import 'package:fluxer_app/features/voice/utils/voice_volume_utils.dart';
import 'package:livekit_client/livekit_client.dart';

String? parseUserIdFromParticipantIdentity(String identity) {
  final RegExpMatch? match = RegExp(r'^user_(\d+)').firstMatch(identity);
  return match?.group(1);
}

bool participantIdentityMatchesUserId({
  required String identity,
  required String userId,
}) {
  if (userId.isEmpty) {
    return false;
  }
  if (identity == userId) {
    return true;
  }
  return identity.startsWith('user_${userId}_');
}

double resolveParticipantTrackVolume({
  required int participantVolumePercent,
  required int outputVolumePercent,
}) {
  final double participantGain = boostedVoiceVolumePercentToTrackVolume(
    participantVolumePercent,
  );
  final double outputGain = boostedVoiceVolumePercentToTrackVolume(
    outputVolumePercent,
  );
  return participantGain * outputGain;
}

Future<void> applyParticipantVolumeToTrack({
  required AudioTrack track,
  required int participantVolumePercent,
  required int outputVolumePercent,
}) async {
  final double volume = resolveParticipantTrackVolume(
    participantVolumePercent: participantVolumePercent,
    outputVolumePercent: outputVolumePercent,
  );
  final MediaStreamTrack mediaTrack = track.mediaStreamTrack;
  await Helper.setVolume(volume, mediaTrack);
}

Future<void> applyParticipantVolumeToRoom({
  required Room? room,
  required String userId,
  required int participantVolumePercent,
  required int outputVolumePercent,
}) async {
  if (room == null || userId.isEmpty) {
    return;
  }
  for (final RemoteParticipant participant in room.remoteParticipants.values) {
    if (!participantIdentityMatchesUserId(
      identity: participant.identity,
      userId: userId,
    )) {
      continue;
    }
    for (final RemoteTrackPublication publication
        in participant.audioTrackPublications) {
      if (publication.source != TrackSource.microphone) {
        continue;
      }
      final Track? publishedTrack = publication.track;
      if (publishedTrack is! RemoteAudioTrack) {
        continue;
      }
      await applyParticipantVolumeToTrack(
        track: publishedTrack,
        participantVolumePercent: participantVolumePercent,
        outputVolumePercent: outputVolumePercent,
      );
    }
  }
}

Future<void> applyAllParticipantVolumesToRoom({
  required Room? room,
  required Map<String, int> participantVolumes,
  required int outputVolumePercent,
}) async {
  if (room == null || participantVolumes.isEmpty) {
    return;
  }
  for (final MapEntry<String, int> entry in participantVolumes.entries) {
    await applyParticipantVolumeToRoom(
      room: room,
      userId: entry.key,
      participantVolumePercent: entry.value,
      outputVolumePercent: outputVolumePercent,
    );
  }
}

int defaultParticipantVolumeForUser({
  required Map<String, int> participantVolumes,
  required String userId,
}) {
  return participantVolumes[userId] ?? kDefaultVoiceVolumePercent;
}
