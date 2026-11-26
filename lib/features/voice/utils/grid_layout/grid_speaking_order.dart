import 'package:fluxer_app/features/voice/domain/voice_media_participant.dart';
import 'package:fluxer_app/features/voice/providers/voice_active_speakers_provider.dart';
import 'package:fluxer_app/features/voice/utils/audio/voice_state_audio.dart';
import 'package:fluxer_app/features/voice/utils/grid_layout/grid_tile.dart';

typedef VoiceGridParticipantResolver =
    VoiceMediaParticipant? Function(VoiceGridTile tile);

List<T> voiceGridTilesForDisplay<T>({
  required bool prioritizeSpeakingParticipants,
  required List<T> tiles,
  required List<T> Function(List<T> tiles) orderBySpeaking,
}) {
  if (!prioritizeSpeakingParticipants) {
    return tiles;
  }
  return orderBySpeaking(tiles);
}

String voiceGridOrderSignature(Iterable<String> tileIds) => tileIds.join('|');

List<VoiceGridTile> orderVoiceGridTilesBySpeaking({
  required List<VoiceGridTile> tiles,
  required VoiceActiveSpeakersState speakers,
  required VoiceGridParticipantResolver participantOf,
}) {
  final List<int> priorities = <int>[
    for (final VoiceGridTile tile in tiles)
      _speakingPriority(tile, speakers: speakers, participantOf: participantOf),
  ];
  final List<int> order = List<int>.generate(tiles.length, (int i) => i)
    ..sort((int a, int b) {
      if (priorities[a] != priorities[b]) {
        return priorities[b].compareTo(priorities[a]);
      }
      return a.compareTo(b);
    });
  return <VoiceGridTile>[for (final int index in order) tiles[index]];
}

int _speakingPriority(
  VoiceGridTile tile, {
  required VoiceActiveSpeakersState speakers,
  required VoiceGridParticipantResolver participantOf,
}) {
  if (tile.isScreenShare) {
    return 3;
  }
  if (isVoiceStateMuted(tile.data.voice)) {
    return 0;
  }
  final VoiceMediaParticipant? participant = participantOf(tile);
  if (speakers.isParticipantSpeaking(participant)) {
    return 2;
  }
  if (speakers.participantSpokeRecently(participant)) {
    return 1;
  }
  return 0;
}
