import 'package:fluxer_app/features/ui/voice/voice_participant_media_tile.dart';
import 'package:fluxer_app/features/voice/domain/voice_media_participant.dart';
import 'package:fluxer_app/features/voice/utils/voice_participant_tile_id.dart';
import 'package:livekit_client/livekit_client.dart';

bool voicePipParticipantMatchesIdentity(
  VoiceMediaParticipant participant,
  String identity,
) {
  if (identity.isEmpty) {
    return false;
  }
  final String pid = participant.identity;
  return pid == identity ||
      pid.endsWith('_$identity') ||
      pid.startsWith('user_${identity}_');
}

Future<void> syncCollapsedVoiceVideoSubscriptions({
  required VoiceMediaRoom media,
  required String? featuredTileId,
  bool Function()? isSessionCurrent,
}) async {
  if (isSessionCurrent != null && !isSessionCurrent()) {
    return;
  }
  final parsed = featuredTileId == null
      ? null
      : parseVoiceParticipantTileId(featuredTileId);
  final VoiceParticipantTileSource? featuredSource = parsed?.source;
  final List<Future<void>> pending = <Future<void>>[];
  for (final VoiceMediaParticipant participant in media.participants) {
    if (isSessionCurrent != null && !isSessionCurrent()) {
      return;
    }
    final bool isFeaturedParticipant =
        parsed != null &&
        voicePipParticipantMatchesIdentity(participant, parsed.identity);
    final bool featuredScreen =
        isFeaturedParticipant &&
        featuredSource == VoiceParticipantTileSource.screenShare;
    pending
      ..add(
        _ignoreFailure(
          participant.setVideoWanted(
            TrackSource.camera,
            wanted:
                isFeaturedParticipant &&
                featuredSource == VoiceParticipantTileSource.camera,
          ),
        ),
      )
      ..add(
        _ignoreFailure(
          participant.setVideoWanted(
            TrackSource.screenShareVideo,
            wanted: featuredScreen,
          ),
        ),
      )
      ..add(
        _ignoreFailure(
          participant.setScreenShareAudioWanted(wanted: featuredScreen),
        ),
      );
  }
  await Future.wait(pending);
}

Future<void> _ignoreFailure(Future<void> operation) async {
  try {
    await operation;
  } on Object {
    return;
  }
}
