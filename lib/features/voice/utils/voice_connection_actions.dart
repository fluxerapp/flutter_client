
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/providers/gateway_connection_provider.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/features/gateway/providers/gateway_event_providers.dart';
import 'package:fluxer_app/features/voice/presentation/widgets/voice_connection_confirm_modal.dart';
import 'package:fluxer_app/features/voice/providers/voice_session_provider.dart';
import 'package:fluxer_dart/gateway.dart';

void sendVoiceStateDisconnect(
  WidgetRef ref, {
  required String? guildId,
  required String connectionId,
}) {
  ref
      .read(gatewayConnectionProvider)
      .updateVoiceState(
        GatewayVoiceStateUpdate(
          guildId: guildId,
          selfMute: true,
          selfDeaf: true,
          selfVideo: false,
          selfStream: false,
          connectionId: connectionId,
        ),
      );
}

Future<void> joinVoiceChannelWithConfirmation({
  required WidgetRef ref,
  required BuildContext context,
  required String? guildId,
  required String channelId,
  bool startOutgoingCall = false,
  bool ringSilently = false,
}) async {
  final String? currentUserId = ref.read(currentUserIdProvider);
  if (currentUserId == null) {
    await ref
        .read(voiceSessionProvider.notifier)
        .connectToVoiceChannel(
          guildId: guildId,
          channelId: channelId,
          startOutgoingCall: startOutgoingCall,
          ringSilently: ringSilently,
        );
    return;
  }
  final String? localConnectionId = ref
      .read(voiceSessionProvider)
      .activeConnectionId;
  final Map<String, VoiceState> voiceStates = ref.read(voiceStatesMapProvider);
  final List<VoiceState> others = otherUserConnectionsInChannel(
    voiceStates: voiceStates,
    guildId: guildId,
    channelId: channelId,
    currentUserId: currentUserId,
    localConnectionId: localConnectionId,
  );
  if (others.isEmpty) {
    await ref
        .read(voiceSessionProvider.notifier)
        .connectToVoiceChannel(
          guildId: guildId,
          channelId: channelId,
          startOutgoingCall: startOutgoingCall,
          ringSilently: ringSilently,
        );
    return;
  }
  if (!context.mounted) {
    return;
  }
  final VoiceConnectionConfirmResult? choice =
      await showVoiceConnectionConfirmModal(
        context,
        otherDeviceCount: others.length,
      );
  if (!context.mounted) {
    return;
  }
  if (choice == null) {
    return;
  }
  if (choice == VoiceConnectionConfirmResult.switchToThisDevice) {
    for (final VoiceState vs in others) {
      final String? cid = vs.connectionId;
      if (cid != null) {
        sendVoiceStateDisconnect(ref, guildId: guildId, connectionId: cid);
      }
    }
  }
  await ref
      .read(voiceSessionProvider.notifier)
      .connectToVoiceChannel(
        guildId: guildId,
        channelId: channelId,
        startOutgoingCall: startOutgoingCall,
        ringSilently: ringSilently,
      );
}
