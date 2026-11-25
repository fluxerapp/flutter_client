import 'package:fluxer_app/features/voice/domain/participant_tile_source.dart';
import 'package:fluxer_app/features/voice/domain/voice_media_participant.dart';
import 'package:fluxer_app/features/voice/providers/voice_channel_participants_provider.dart';
import 'package:fluxer_app/features/voice/utils/grid_layout/grid_tile.dart';
import 'package:fluxer_app/features/voice/utils/grid_layout/participant_consolidation.dart';
import 'package:fluxer_app/features/voice/utils/media/participant_track_resolver.dart';

List<VoiceGridTile> buildVoiceGridTiles({
  required List<VoiceChannelParticipantData> participants,
  required VoiceMediaRoom? media,
  required String? currentUserId,
  required String? localConnectionId,
  required bool onlyShowVideos,
  required bool showOwnCamera,
  required Set<String> expandedUserIds,
  String? forceShowUserId,
}) {
  final List<VoiceGridTile> tiles = <VoiceGridTile>[];
  for (final VoiceChannelParticipantData participant in participants) {
    if (_showsCamera(
      participant,
      currentUserId: currentUserId,
      onlyShowVideos: onlyShowVideos,
      showOwnCamera: showOwnCamera,
      forceShowUserId: forceShowUserId,
    )) {
      tiles.add(
        VoiceGridTile(
          data: participant,
          source: VoiceParticipantTileSource.camera,
        ),
      );
    }
    if (_showsScreenShare(
      participant,
      media: media,
      currentUserId: currentUserId,
      localConnectionId: localConnectionId,
    )) {
      tiles.add(
        VoiceGridTile(
          data: participant,
          source: VoiceParticipantTileSource.screenShare,
        ),
      );
    }
  }
  return consolidateVoiceGridTiles<VoiceGridTile>(
        tiles: tiles,
        userId: (VoiceGridTile tile) => tile.data.userId,
        isScreenShare: (VoiceGridTile tile) => tile.isScreenShare,
        expandedUserIds: expandedUserIds,
      )
      .map(
        (VoiceConsolidatedTile<VoiceGridTile> entry) => VoiceGridTile(
          data: entry.tile.data,
          source: entry.tile.source,
          extraDeviceCount: entry.extraDeviceCount,
          expandedDeviceCount: entry.expandedDeviceCount,
        ),
      )
      .toList();
}

bool _showsCamera(
  VoiceChannelParticipantData participant, {
  required String? currentUserId,
  required bool onlyShowVideos,
  required bool showOwnCamera,
  required String? forceShowUserId,
}) {
  final bool isOwn =
      currentUserId != null && participant.userId == currentUserId;
  if (isOwn && !showOwnCamera) {
    return false;
  }
  return !onlyShowVideos ||
      participant.voice.selfVideo ||
      participant.userId == forceShowUserId;
}

bool _showsScreenShare(
  VoiceChannelParticipantData participant, {
  required VoiceMediaRoom? media,
  required String? currentUserId,
  required String? localConnectionId,
}) {
  if (media == null) {
    return participant.voice.selfStream;
  }
  final VoiceMediaParticipant? mediaParticipant = resolveVoiceParticipant(
    media: media,
    voice: participant.voice,
    userId: participant.userId,
    currentUserId: currentUserId,
    localConnectionId: localConnectionId,
  );
  return mediaParticipant?.hasScreenShare ?? false;
}
