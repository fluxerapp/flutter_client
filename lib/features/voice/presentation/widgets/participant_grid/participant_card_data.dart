import 'package:fluxer_app/features/voice/domain/participant_tile_source.dart';
import 'package:fluxer_app/features/voice/domain/voice_media_participant.dart';
import 'package:fluxer_app/features/voice/presentation/widgets/participant_grid/grid_card_slot.dart';
import 'package:fluxer_app/features/voice/utils/audio/voice_state_audio.dart';
import 'package:fluxer_app/features/voice/utils/grid_layout/grid_tile.dart';
import 'package:fluxer_app/features/voice/utils/media/watched_video_tile.dart';
import 'package:fluxer_app/shared/utils/guild_user_display.dart';
import 'package:fluxer_dart/gateway.dart';

class VoiceParticipantCardData {
  const VoiceParticipantCardData({
    required this.tile,
    required this.slot,
    required this.voice,
    required this.display,
    required this.userDisplay,
    required this.participant,
    required this.isOwnScreenShare,
    required this.isWatching,
    required this.isFullscreen,
    required this.omitVideoTrack,
  });

  final VoiceGridTile tile;
  final VoiceGridCardSlot slot;
  final VoiceState voice;
  final String display;
  final GuildUserDisplay? userDisplay;
  final VoiceMediaParticipant? participant;
  final bool isOwnScreenShare;
  final bool isWatching;
  final bool isFullscreen;
  final bool omitVideoTrack;

  String get userId => tile.data.userId;

  VoiceParticipantTileSource get source => tile.source;

  bool get isScreenShare => tile.isScreenShare;

  bool get canWatch => isScreenShare && !isOwnScreenShare && !isWatching;

  bool get canStopWatching => isScreenShare && !isOwnScreenShare && isWatching;

  bool get tapOpensFullscreen => voiceTileTapOpensFullscreen(
    source: source,
    selfVideo: voice.selfVideo,
    isOwnScreenShare: isOwnScreenShare,
  );

  bool get speakingRingEnabled => !isScreenShare && !isVoiceStateMuted(voice);

  bool get ringAroundAvatar => omitVideoTrack || !voice.selfVideo;

  String get speakingIdentity => participant?.identity ?? userId;

  int? get accentColor =>
      userDisplay?.avatarColor ?? tile.data.user?.avatarColor;
}
