import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/gateway/providers/gateway_event_providers.dart';
import 'package:fluxer_app/features/voice/providers/voice_session_provider.dart';
import 'package:fluxer_app/features/voice/providers/voice_session_state.dart';
import 'package:fluxer_dart/gateway.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'active_self_voice_state_provider.g.dart';

@riverpod
VoiceState? activeSelfVoiceState(Ref ref) {
  final String? connectionId = ref.watch(
    voiceSessionProvider.select((VoiceSessionState s) => s.activeConnectionId),
  );
  if (connectionId == null) {
    return null;
  }
  return ref.watch(voiceStateForConnectionProvider(connectionId));
}
