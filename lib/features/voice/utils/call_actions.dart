import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/api/fluxer_client_provider.dart';
import 'package:fluxer_app/features/voice/providers/voice_session_provider.dart';
import 'package:fluxer_app/features/voice/utils/microphone_permission.dart';
import 'package:fluxer_app/features/voice/utils/voice_connection_actions.dart';
import 'package:fluxer_dart/export.dart';

typedef StartDirectVoiceCallResult = ({bool ok, bool microphoneDenied});

/// [microphoneDenied] is true when mic permission request failed; the voice
/// session is updated with an error for the in-call bar.
Future<StartDirectVoiceCallResult> startDirectVoiceCall(
  WidgetRef ref,
  BuildContext context,
  String channelId,
) async {
  final bool micOk = await requestMicrophonePermissionForVoice();
  if (!micOk) {
    ref.read(voiceSessionProvider.notifier).reportMicrophonePermissionDenied();
    return (ok: false, microphoneDenied: true);
  }
  final FluxerClient client = ref.read(fluxerClientProvider);
  final response = await client.channels.getCallEligibility(
    channelId: channelId,
  );
  if (!response.ringable) {
    return (ok: false, microphoneDenied: false);
  }
  if (!context.mounted) {
    return (ok: false, microphoneDenied: false);
  }
  await joinVoiceChannelWithConfirmation(
    ref: ref,
    context: context,
    guildId: null,
    channelId: channelId,
    startOutgoingCall: true,
    ringSilently: response.silent,
  );
  return (ok: true, microphoneDenied: false);
}
