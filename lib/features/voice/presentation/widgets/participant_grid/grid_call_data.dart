import 'package:fluxer_app/features/voice/domain/voice_media_participant.dart';
import 'package:fluxer_app/features/voice/utils/grid_layout/grid_tile.dart';
import 'package:fluxer_app/features/voice/utils/media/participant_track_resolver.dart';
import 'package:fluxer_app/features/voice/utils/pip/pip_morph.dart';

class VoiceGridCallData {
  const VoiceGridCallData({
    required this.guildId,
    required this.channelId,
    required this.media,
    required this.currentUserId,
    required this.localConnectionId,
    required this.baseUrl,
    required this.isConnected,
    required this.watchedTileIds,
    required this.screenShareExpanded,
    required this.featuredTileId,
    required this.pipPhase,
  });

  final String? guildId;
  final String channelId;
  final VoiceMediaRoom? media;
  final String? currentUserId;
  final String? localConnectionId;
  final String? baseUrl;
  final bool isConnected;
  final Set<String> watchedTileIds;
  final bool screenShareExpanded;
  final String? featuredTileId;
  final VoicePipOverlayPhase pipPhase;

  bool isWatching(VoiceGridTile tile) => watchedTileIds.contains(tile.tileId);

  bool isOwnScreenShare(VoiceGridTile tile) =>
      tile.isScreenShare &&
      localConnectionId != null &&
      tile.data.voice.connectionId == localConnectionId;

  VoiceMediaParticipant? participantOf(VoiceGridTile tile) =>
      resolveVoiceParticipant(
        media: media,
        voice: tile.data.voice,
        userId: tile.data.userId,
        currentUserId: currentUserId,
        localConnectionId: localConnectionId,
      );
}
