import 'package:fluxer_app/features/ui/voice/voice_participant_media_tile.dart';
import 'package:fluxer_dart/gateway.dart';

String voiceParticipantTileId({
  required VoiceState voice,
  required String userId,
  required VoiceParticipantTileSource source,
}) {
  final String identity = voice.connectionId ?? voice.sessionId ?? userId;
  final String sourceValue = source == VoiceParticipantTileSource.camera
      ? 'camera'
      : 'screen';
  return '$identity|$sourceValue';
}

({String identity, VoiceParticipantTileSource source})?
parseVoiceParticipantTileId(String tileId) {
  final int sep = tileId.lastIndexOf('|');
  if (sep <= 0 || sep == tileId.length - 1) {
    return null;
  }
  final String identity = tileId.substring(0, sep);
  final String sourceValue = tileId.substring(sep + 1);
  if (identity.isEmpty) {
    return null;
  }
  final VoiceParticipantTileSource source;
  switch (sourceValue) {
    case 'camera':
      source = VoiceParticipantTileSource.camera;
    case 'screen':
      source = VoiceParticipantTileSource.screenShare;
    default:
      return null;
  }
  return (identity: identity, source: source);
}
