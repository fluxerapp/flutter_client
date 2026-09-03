import 'package:fluxer_app/core/router/route_kind.dart';
import 'package:fluxer_app/core/router/route_state_providers.dart';
import 'package:fluxer_app/features/voice/providers/voice_session_state.dart';
import 'package:fluxer_app/features/voice/utils/voice_pip_visibility.dart';

bool voiceWakelockShouldBeEnabled({
  required VoiceSessionState voice,
  required String? watchedTileId,
  required RouteState route,
  required bool showsOverlay,
}) {
  if (!voice.isInVoice || !voice.isConnected) {
    return false;
  }
  if (watchedTileId != null) {
    return true;
  }
  if (!voicePipIsOnSessionCallRoute(
    voice: voice,
    location: route.location,
    routeGuildId: route.guildId,
    routeChannelId: route.channelId,
  )) {
    return false;
  }
  return classifyRoute(route.location) == RouteKind.dmCall || !showsOverlay;
}
