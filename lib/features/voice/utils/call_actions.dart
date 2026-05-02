import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/api/fluxer_client_provider.dart';
import 'package:fluxer_app/features/voice/providers/voice_session_provider.dart';
import 'package:fluxer_app/features/voice/utils/camera_permission.dart';
import 'package:fluxer_app/features/voice/utils/microphone_permission.dart';
import 'package:fluxer_app/features/voice/utils/voice_connection_actions.dart';
import 'package:fluxer_dart/export.dart';

typedef StartDirectVoiceCallResult = ({
  bool ok,
  bool microphoneDenied,
  bool cameraDenied,
  bool notEligible,
  bool joinAttemptFailed,
});

/// When `microphoneDenied` or `cameraDenied` is true, the voice session
/// notifier already surfaced permission UI; avoid redundant snack bars.
/// When neither flag is true: `notEligible` is server ringability failure;
/// `joinAttemptFailed` is an unexpected exception from join; otherwise
/// the user likely navigated away (no snack — `ok` stays false silently).
Future<StartDirectVoiceCallResult> startDirectVoiceCall(
  WidgetRef ref,
  BuildContext context,
  String channelId, {
  List<String>? outboundRingRecipients,
  bool startWithVideo = false,
}) async {
  final bool micOk = await requestMicrophonePermissionForVoice();
  if (!micOk) {
    ref.read(voiceSessionProvider.notifier).reportMicrophonePermissionDenied();
    return (
      ok: false,
      microphoneDenied: true,
      cameraDenied: false,
      notEligible: false,
      joinAttemptFailed: false,
    );
  }
  if (startWithVideo) {
    final bool camOk = await requestCameraPermissionForVoice();
    if (!camOk) {
      ref.read(voiceSessionProvider.notifier).reportCameraPermissionDenied();
      return (
        ok: false,
        microphoneDenied: false,
        cameraDenied: true,
        notEligible: false,
        joinAttemptFailed: false,
      );
    }
  }
  final FluxerClient client = ref.read(fluxerClientProvider);
  final response = await client.channels.getCallEligibility(
    channelId: channelId,
  );
  if (!response.ringable) {
    return (
      ok: false,
      microphoneDenied: false,
      cameraDenied: false,
      notEligible: true,
      joinAttemptFailed: false,
    );
  }
  if (!context.mounted) {
    return (
      ok: false,
      microphoneDenied: false,
      cameraDenied: false,
      notEligible: false,
      joinAttemptFailed: false,
    );
  }
  try {
    await joinVoiceChannelWithConfirmation(
      ref: ref,
      context: context,
      guildId: null,
      channelId: channelId,
      startOutgoingCall: true,
      ringSilently: response.silent,
      outboundRingRecipients: outboundRingRecipients,
      initialSelfVideo: startWithVideo,
    );
  } on Object {
    return (
      ok: false,
      microphoneDenied: false,
      cameraDenied: false,
      notEligible: false,
      joinAttemptFailed: true,
    );
  }
  return (
    ok: true,
    microphoneDenied: false,
    cameraDenied: false,
    notEligible: false,
    joinAttemptFailed: false,
  );
}
