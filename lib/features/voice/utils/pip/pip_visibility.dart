import 'package:fluxer_app/core/router/route_kind.dart';
import 'package:fluxer_app/features/voice/providers/voice_session_state.dart';

typedef VoicePipVisibilityInputs = ({
  bool isConnecting,
  bool isConnected,
  String? guildId,
  String? channelId,
  String? errorMessage,
});

extension VoicePipVisibilityInputsX on VoicePipVisibilityInputs {
  bool get isInVoice =>
      (isConnecting || isConnected) &&
      channelId != null &&
      channelId!.isNotEmpty;
}

VoicePipVisibilityInputs voicePipVisibilityInputs(VoiceSessionState voice) {
  return (
    isConnecting: voice.isConnecting,
    isConnected: voice.isConnected,
    guildId: voice.guildId,
    channelId: voice.channelId,
    errorMessage: voice.errorMessage,
  );
}

bool showsEmbeddedDmVoicePanel({
  required String channelId,
  required VoicePipVisibilityInputs voice,
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
  required VoicePipVisibilityInputs voice,
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
