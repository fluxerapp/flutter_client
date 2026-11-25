import 'package:fluxer_app/features/voice/domain/participant_tile_source.dart';
import 'package:fluxer_app/features/voice/providers/voice_channel_participants_provider.dart';
import 'package:fluxer_app/features/voice/utils/grid_layout/participant_tile_id.dart';

class VoiceGridTile {
  const VoiceGridTile({
    required this.data,
    required this.source,
    this.extraDeviceCount = 0,
    this.expandedDeviceCount = 0,
  });

  final VoiceChannelParticipantData data;
  final VoiceParticipantTileSource source;
  final int extraDeviceCount;
  final int expandedDeviceCount;

  bool get isScreenShare => source == VoiceParticipantTileSource.screenShare;

  String get tileId => voiceParticipantTileId(
    voice: data.voice,
    userId: data.userId,
    source: source,
  );
}

extension VoiceGridTiles on List<VoiceGridTile> {
  VoiceGridTile? byId(String? tileId) {
    if (tileId == null) {
      return null;
    }
    for (final VoiceGridTile tile in this) {
      if (tile.tileId == tileId) {
        return tile;
      }
    }
    return null;
  }

  List<VoiceGridTile> without(String tileId) => <VoiceGridTile>[
    for (final VoiceGridTile tile in this)
      if (tile.tileId != tileId) tile,
  ];
}
