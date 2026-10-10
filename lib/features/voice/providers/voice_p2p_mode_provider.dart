import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/gateway/providers/gateway_event_providers.dart';
import 'package:fluxer_app/features/voice/providers/voice_session_provider.dart';
import 'package:fluxer_app/features/voice/providers/voice_session_state.dart';
import 'package:fluxer_app/features/voice/utils/channel_e2ee_status.dart';
import 'package:fluxer_app/features/voice/utils/voice_p2p_mode.dart';
import 'package:fluxer_dart/gateway.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'voice_p2p_mode_provider.g.dart';

VoiceChannelMode _voiceChannelModeIn(
  Map<String, VoiceState> voiceStates, {
  required String? guildId,
  required String channelId,
}) {
  return voiceChannelMode(
    voiceStatesForChannel(
      voiceStates: voiceStates,
      channelId: channelId,
      guildId: guildId == null || guildId.isEmpty ? null : guildId,
    ),
  );
}

@riverpod
VoiceChannelMode voiceChannelModeFor(
  Ref ref, {
  required String? guildId,
  required String channelId,
}) {
  return ref.watch(
    voiceStatesMapProvider.select(
      (Map<String, VoiceState> map) =>
          _voiceChannelModeIn(map, guildId: guildId, channelId: channelId),
    ),
  );
}

@Riverpod(keepAlive: true)
VoiceChannelMode activeVoiceChannelMode(Ref ref) {
  final (String? guildId, String? channelId) = ref.watch(
    voiceSessionProvider.select(
      (VoiceSessionState s) =>
          (s.isInVoice ? s.guildId : null, s.isInVoice ? s.channelId : null),
    ),
  );
  if (channelId == null) {
    return VoiceChannelMode.empty;
  }
  return ref.watch(
    voiceStatesMapProvider.select(
      (Map<String, VoiceState> map) =>
          _voiceChannelModeIn(map, guildId: guildId, channelId: channelId),
    ),
  );
}
