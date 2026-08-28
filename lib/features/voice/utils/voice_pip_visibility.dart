import 'package:fluxer_app/core/router/route_kind.dart';
import 'package:fluxer_app/features/voice/providers/voice_session_state.dart';

bool showsEmbeddedDmVoicePanel({
  required String channelId,
  required VoiceSessionState voice,
}) {
  final bool isPrivate = voice.guildId == null || voice.guildId!.isEmpty;
  return isPrivate &&
      voice.channelId == channelId &&
      voice.isConnected &&
      voice.errorMessage == null;
}

bool voicePipIsOnSessionCallRoute({
  required VoiceSessionState voice,
  required String location,
  required String? routeGuildId,
  required String? routeChannelId,
  bool callViewObscured = false,
}) {
  if (!voice.isInVoice || callViewObscured) {
    return false;
  }
  if (classifyRoute(location) == RouteKind.dmCall) {
    return extractChannelId(location) == voice.channelId;
  }
  final bool isGuild = voice.guildId != null && voice.guildId!.isNotEmpty;
  if (!isGuild) {
    return false;
  }
  return routeGuildId == voice.guildId && routeChannelId == voice.channelId;
}

bool voicePipShouldShowCollapsed({
  required VoiceSessionState voice,
  required bool onSessionCallRoute,
  required bool showsEmbeddedDmPanel,
  required bool hasFeaturedVisual,
  required bool incomingCallBlocking,
}) {
  if (!voice.isInVoice || voice.errorMessage != null) {
    return false;
  }
  if (!hasFeaturedVisual) {
    return false;
  }
  if (onSessionCallRoute || showsEmbeddedDmPanel || incomingCallBlocking) {
    return false;
  }
  return true;
}
