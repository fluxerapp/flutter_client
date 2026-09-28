import 'package:fluxer_app/features/ui/voice/voice_participant_media_tile.dart';
import 'package:fluxer_app/features/voice/utils/voice_participant_tile_id.dart';
import 'package:livekit_client/livekit_client.dart';

bool voicePipParticipantMatchesIdentity(
  Participant participant,
  String identity,
) {
  if (identity.isEmpty) {
    return false;
  }
  final String pid = participant.identity;
  final String sid = participant.sid;
  return pid == identity ||
      sid == identity ||
      pid.endsWith('_$identity') ||
      pid.startsWith('user_${identity}_');
}

Future<void> syncCollapsedVoiceVideoSubscriptions({
  required Room room,
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
  final List<Participant> participants = <Participant>[
    ?room.localParticipant,
    ...room.remoteParticipants.values,
  ];
  final List<Future<void>> pending = <Future<void>>[];
  for (final Participant participant in participants) {
    if (isSessionCurrent != null && !isSessionCurrent()) {
      return;
    }
    final bool isFeaturedParticipant =
        parsed != null &&
        voicePipParticipantMatchesIdentity(participant, parsed.identity);
    for (final Object publication in participant.videoTrackPublications) {
      if (publication is! RemoteTrackPublication) {
        continue;
      }
      final bool isScreen = publication.isScreenShare;
      final bool shouldSubscribe =
          isFeaturedParticipant &&
          (isScreen
              ? featuredSource == VoiceParticipantTileSource.screenShare
              : featuredSource == VoiceParticipantTileSource.camera);
      if (shouldSubscribe && !publication.subscribed) {
        pending.add(_safeSubscribe(publication));
      } else if (!shouldSubscribe && publication.subscribed) {
        pending.add(_safeUnsubscribe(publication));
      }
    }
    final bool subscribeScreenAudio =
        isFeaturedParticipant &&
        featuredSource == VoiceParticipantTileSource.screenShare;
    final TrackPublication? audio = participant.getTrackPublicationBySource(
      TrackSource.screenShareAudio,
    );
    if (audio is! RemoteTrackPublication) {
      continue;
    }
    if (subscribeScreenAudio && !audio.subscribed) {
      pending.add(_safeSubscribe(audio));
    } else if (!subscribeScreenAudio && audio.subscribed) {
      pending.add(_safeUnsubscribe(audio));
    }
  }
  if (pending.isNotEmpty) {
    await Future.wait(pending);
  }
}

Future<void> _safeSubscribe(RemoteTrackPublication publication) async {
  try {
    await publication.subscribe();
  } on Object {
    return;
  }
}

Future<void> _safeUnsubscribe(RemoteTrackPublication publication) async {
  try {
    await publication.unsubscribe();
  } on Object {
    return;
  }
}
