import 'package:fluxer_app/features/ui/voice/voice_participant_media_tile.dart';
import 'package:fluxer_dart/gateway.dart';

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
}) {
  if (!screenShareExpanded) {
    return false;
  }
  switch (source) {
    case VoiceParticipantTileSource.screenShare:
      return isWatching && !isOwnScreenShare;
    case VoiceParticipantTileSource.camera:
      return voice.selfVideo && isFocusMain;
  }
}
