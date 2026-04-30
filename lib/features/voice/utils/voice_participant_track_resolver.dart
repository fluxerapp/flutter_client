import 'package:fluxer_dart/gateway.dart';
import 'package:livekit_client/livekit_client.dart';

Participant? resolveVoiceParticipant({
  required Room? room,
  required VoiceState voice,
  required String userId,
  required String? currentUserId,
  required String? localConnectionId,
}) {
  final Room? resolvedRoom = room;
  if (resolvedRoom == null) {
    return null;
  }
  final String? connectionId = voice.connectionId;
  if (currentUserId != null &&
      userId == currentUserId &&
      localConnectionId != null &&
      connectionId != null &&
      connectionId == localConnectionId) {
    return resolvedRoom.localParticipant;
  }
  final Map<String, RemoteParticipant> remoteParticipants =
      resolvedRoom.remoteParticipants;
  if (connectionId != null && connectionId.isNotEmpty) {
    final RemoteParticipant? byConnectionId = remoteParticipants[connectionId];
    if (byConnectionId != null) {
      return byConnectionId;
    }
  }
  final String? sessionId = voice.sessionId;
  if (sessionId != null && sessionId.isNotEmpty) {
    final RemoteParticipant? bySessionId = remoteParticipants[sessionId];
    if (bySessionId != null) {
      return bySessionId;
    }
  }
  if (userId.isNotEmpty) {
    final RemoteParticipant? byUserId = remoteParticipants[userId];
    if (byUserId != null) {
      return byUserId;
    }
  }
  for (final RemoteParticipant participant in remoteParticipants.values) {
    if (matchesParticipantIdentity(
      participant: participant,
      userId: userId,
      connectionId: connectionId,
      sessionId: sessionId,
    )) {
      return participant;
    }
  }
  return null;
}

bool matchesParticipantIdentity({
  required RemoteParticipant participant,
  required String userId,
  required String? connectionId,
  required String? sessionId,
}) {
  final String identity = participant.identity;
  final String sid = participant.sid;
  if (connectionId != null && connectionId.isNotEmpty) {
    if (identity == connectionId || sid == connectionId) {
      return true;
    }
    if (identity.endsWith('_$connectionId')) {
      return true;
    }
  }
  if (sessionId != null && sessionId.isNotEmpty) {
    if (identity == sessionId || sid == sessionId) {
      return true;
    }
    if (identity.endsWith('_$sessionId')) {
      return true;
    }
  }
  if (identity == userId || sid == userId) {
    return true;
  }
  return identity.startsWith('user_${userId}_');
}

bool hasUnmutedScreenSharePublication(Participant participant) {
  for (final Object publication in participant.videoTrackPublications) {
    if (publication is! TrackPublication<VideoTrack>) {
      continue;
    }
    if (!publication.isScreenShare) {
      continue;
    }
    if (publication.muted) {
      continue;
    }
    return true;
  }
  return false;
}

String? buildViewerStreamKey({
  required VoiceState voice,
  required bool isScreenShareTile,
}) {
  if (!isScreenShareTile) {
    return null;
  }
  final String? connectionId = voice.connectionId;
  if (connectionId == null || connectionId.isEmpty) {
    return null;
  }
  final String? channelId = voice.channelId;
  final String? guildId = voice.guildId;
  if (channelId != null &&
      channelId.isNotEmpty &&
      guildId != null &&
      guildId.isNotEmpty) {
    return '$guildId:$channelId:$connectionId';
  }
  if (channelId != null && channelId.isNotEmpty) {
    return 'dm:$channelId:$connectionId';
  }
  return 'stream:$connectionId';
}

String? buildViewerStreamPreviewUrl({
  required String? baseUrl,
  required VoiceState voice,
  required bool isScreenShareTile,
}) {
  if (baseUrl == null || baseUrl.isEmpty) {
    return null;
  }
  final String? streamKey = buildViewerStreamKey(
    voice: voice,
    isScreenShareTile: isScreenShareTile,
  );
  if (streamKey == null) {
    return null;
  }
  return '$baseUrl/streams/$streamKey/preview';
}

TrackPublication? resolveCameraPublication(Participant participant) {
  for (final Object publication in participant.videoTrackPublications) {
    if (publication is! TrackPublication) {
      continue;
    }
    if (publication.isScreenShare) {
      continue;
    }
    if (publication.muted) {
      continue;
    }
    if (publication.track != null) {
      return publication;
    }
  }
  return null;
}

TrackPublication? resolveScreenShareVideoPublication({
  required Participant participant,
  required bool requireTrack,
}) {
  final TrackPublication? publication = participant.getTrackPublicationBySource(
    TrackSource.screenShareVideo,
  );
  if (publication == null || publication.muted) {
    return null;
  }
  if (requireTrack && publication.track == null) {
    return null;
  }
  return publication;
}

TrackPublication? resolveScreenShareAudioPublication({
  required Participant participant,
  required bool requireTrack,
}) {
  final TrackPublication? publication = participant.getTrackPublicationBySource(
    TrackSource.screenShareAudio,
  );
  if (publication == null || publication.muted) {
    return null;
  }
  if (requireTrack && publication.track == null) {
    return null;
  }
  return publication;
}
