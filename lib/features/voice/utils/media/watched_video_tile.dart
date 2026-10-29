import 'package:fluxer_app/features/ui/voice/voice_participant_media_tile.dart';
import 'package:fluxer_dart/gateway.dart';

bool voiceTileTapOpensFullscreen({
  required VoiceParticipantTileSource source,
  required bool selfVideo,
  required bool isOwnScreenShare,
}) {
  switch (source) {
    case VoiceParticipantTileSource.screenShare:
      return !isOwnScreenShare;
    case VoiceParticipantTileSource.camera:
      return selfVideo;
  }
}

bool voiceFocusMainSupportsVideoFullscreen({
  required VoiceParticipantTileSource source,
  required VoiceState voice,
  required bool isWatching,
}) {
  switch (source) {
    case VoiceParticipantTileSource.screenShare:
      return isWatching;
    case VoiceParticipantTileSource.camera:
      return voice.selfVideo;
  }
}

bool voiceTileVideoFullscreenExpanded({
  required bool screenShareExpanded,
  required VoiceParticipantTileSource source,
  required VoiceState voice,
  required bool isWatching,
  required bool isFocusMain,
  required bool isOwnScreenShare,
  required String tileId,
  String? expandedTileId,
}) {
  if (!screenShareExpanded) {
    return false;
  }
  if (expandedTileId != null) {
    return expandedTileId == tileId;
  }
  switch (source) {
    case VoiceParticipantTileSource.screenShare:
      return isWatching && !isOwnScreenShare;
    case VoiceParticipantTileSource.camera:
      return voice.selfVideo && isFocusMain;
  }
}
