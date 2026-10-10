import 'package:flutter/foundation.dart';
import 'package:fluxer_app/features/voice/domain/voice_media_participant.dart';
import 'package:fluxer_app/features/voice/utils/voice_participant_volume_utils.dart';
import 'package:fluxer_dart/gateway.dart';
import 'package:livekit_client/livekit_client.dart';

VoiceMediaParticipant? resolveVoiceParticipant({
  required VoiceMediaRoom? media,
  required VoiceState voice,
  required String userId,
  required String? currentUserId,
  required String? localConnectionId,
}) {
  return media?.participantFor(
    voice: voice,
    userId: userId,
    currentUserId: currentUserId,
    localConnectionId: localConnectionId,
  );
}

final Expando<VoiceLiveKitMediaRoom> _liveKitRooms =
    Expando<VoiceLiveKitMediaRoom>();
final Expando<VoiceLiveKitParticipant> _liveKitParticipants =
    Expando<VoiceLiveKitParticipant>();

class VoiceLiveKitMediaRoom implements VoiceMediaRoom {
  VoiceLiveKitMediaRoom._(this.room);

  factory VoiceLiveKitMediaRoom.of(Room room) {
    return _liveKitRooms[room] ??= VoiceLiveKitMediaRoom._(room);
  }

  final Room room;

  @override
  Iterable<VoiceMediaParticipant> get participants {
    return <Participant>[
      ?room.localParticipant,
      ...room.remoteParticipants.values,
    ].map(VoiceLiveKitParticipant.of);
  }

  @override
  VoiceMediaParticipant? participantFor({
    required VoiceState voice,
    required String userId,
    required String? currentUserId,
    required String? localConnectionId,
  }) {
    final Participant? participant = _resolveLiveKitParticipant(
      room: room,
      voice: voice,
      userId: userId,
      currentUserId: currentUserId,
      localConnectionId: localConnectionId,
    );
    return participant == null ? null : VoiceLiveKitParticipant.of(participant);
  }
}

class VoiceLiveKitParticipant implements VoiceMediaParticipant {
  VoiceLiveKitParticipant._(this.participant);

  factory VoiceLiveKitParticipant.of(Participant participant) {
    return _liveKitParticipants[participant] ??= VoiceLiveKitParticipant._(
      participant,
    );
  }

  final Participant participant;

  @override
  void addListener(VoidCallback listener) {
    participant.addListener(listener);
  }

  @override
  void removeListener(VoidCallback listener) {
    participant.removeListener(listener);
  }

  @override
  String get identity => participant.identity;

  @override
  String? get userId => parseUserIdFromParticipantIdentity(identity);

  @override
  bool get hasCamera => _cameraPublication(participant) != null;

  @override
  VideoTrack? get cameraTrack {
    final Track? track = _cameraPublication(participant)?.track;
    return track is VideoTrack ? track : null;
  }

  @override
  bool get hasScreenShare {
    for (final Object publication in participant.videoTrackPublications) {
      if (publication is TrackPublication<VideoTrack> &&
          publication.isScreenShare &&
          !publication.muted) {
        return true;
      }
    }
    return false;
  }

  @override
  VideoTrack? get screenShareTrack {
    final Track? track = _sourcePublication(
      participant,
      TrackSource.screenShareVideo,
    )?.track;
    return track is VideoTrack ? track : null;
  }

  @override
  bool get hasScreenShareAudio =>
      _sourcePublication(participant, TrackSource.screenShareAudio) != null;

  @override
  AudioTrack? get screenShareAudioTrack {
    final Track? track = _sourcePublication(
      participant,
      TrackSource.screenShareAudio,
    )?.track;
    return track is AudioTrack ? track : null;
  }

  @override
  VideoDimensions? get screenShareDimensions =>
      _sourcePublication(participant, TrackSource.screenShareVideo)?.dimensions;

  @override
  Iterable<AudioTrack> get voiceAudioTracks sync* {
    for (final TrackPublication<Track> publication
        in participant.audioTrackPublications) {
      final Track? track = publication.track;
      if (publication.source == TrackSource.microphone &&
          track is RemoteAudioTrack) {
        yield track;
      }
    }
  }

  @override
  bool get directConnectionFailed => false;

  @override
  Future<void> setVideoWanted(
    TrackSource source, {
    required bool wanted,
    VideoQuality? quality,
  }) async {
    final TrackPublication? publication = source == TrackSource.camera
        ? _cameraPublication(participant)
        : _sourcePublication(participant, source);
    if (publication is! RemoteTrackPublication) {
      return;
    }
    if (!wanted) {
      if (publication.subscribed) {
        await publication.unsubscribe();
      }
      return;
    }
    if (!publication.subscribed) {
      await publication.subscribe();
    }
    if (quality != null && publication.videoQuality != quality) {
      await publication.setVideoQuality(quality);
    }
  }

  @override
  Future<void> setScreenShareAudioWanted({required bool wanted}) async {
    final TrackPublication? publication = _sourcePublication(
      participant,
      TrackSource.screenShareAudio,
    );
    if (publication is! RemoteTrackPublication) {
      return;
    }
    if (wanted && !publication.subscribed) {
      await publication.subscribe();
    } else if (!wanted && publication.subscribed) {
      await publication.unsubscribe();
    }
  }
}

Participant? _resolveLiveKitParticipant({
  required Room room,
  required VoiceState voice,
  required String userId,
  required String? currentUserId,
  required String? localConnectionId,
}) {
  final String? connectionId = voice.connectionId;
  if (currentUserId != null &&
      userId == currentUserId &&
      localConnectionId != null &&
      connectionId != null &&
      connectionId == localConnectionId) {
    return room.localParticipant;
  }
  final Map<String, RemoteParticipant> remoteParticipants =
      room.remoteParticipants;
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

TrackPublication? _cameraPublication(Participant participant) {
  for (final Object publication in participant.videoTrackPublications) {
    if (publication is! TrackPublication) {
      continue;
    }
    if (publication.isScreenShare || publication.muted) {
      continue;
    }
    return publication;
  }
  return null;
}

TrackPublication? _sourcePublication(
  Participant participant,
  TrackSource source,
) {
  final TrackPublication? publication = participant.getTrackPublicationBySource(
    source,
  );
  if (publication == null || publication.muted) {
    return null;
  }
  return publication;
}
