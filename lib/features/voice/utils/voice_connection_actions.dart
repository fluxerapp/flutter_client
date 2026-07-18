import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/providers/gateway_connection_provider.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/core/system_permissions/system_permission_kind.dart';
import 'package:fluxer_app/core/system_permissions/system_permission_service.dart';
import 'package:fluxer_app/core/talker.dart';
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

Future<void> _connectToVoiceChannel({
  required WidgetRef ref,
  required String? guildId,
  required String channelId,
  bool startOutgoingCall = false,
  bool ringSilently = false,
  List<String>? outboundRingRecipients,
  bool initialSelfMute = false,
  bool initialSelfDeaf = false,
  bool initialSelfVideo = false,
}) async {
  final BuildContext? permissionContext = _modalContext(null);
  final bool micOk = await ensureSystemPermission(
    permissionContext,
    SystemPermissionKind.microphone,
  );
  if (!micOk) {
    talker.warning(
      '[Voice] Join aborted: microphone permission denied '
      '(channelId=$channelId).',
    );
    return;
  }
  if (initialSelfVideo) {
    final bool camOk = await ensureSystemPermission(
      permissionContext,
      SystemPermissionKind.camera,
    );
    if (!camOk) {
      talker.warning(
        '[Voice] Join aborted: camera permission denied '
        '(channelId=$channelId).',
      );
      return;
    }
  }
  return ref
      .read(voiceSessionProvider.notifier)
      .connectToVoiceChannel(
        guildId: guildId,
        channelId: channelId,
        startOutgoingCall: startOutgoingCall,
        ringSilently: ringSilently,
        outboundRingRecipients: outboundRingRecipients,
        initialSelfMute: initialSelfMute,
        initialSelfDeaf: initialSelfDeaf,
        initialSelfVideo: initialSelfVideo,
      );
}

BuildContext? _modalContext(BuildContext? context) {
  if (context != null && context.mounted) {
    return context;
  }
  return rootNavigatorKey.currentContext;
}

Future<void> joinVoiceChannelWithConfirmation({
  required WidgetRef ref,
  required String? guildId,
  required String channelId,
  BuildContext? context,
  bool startOutgoingCall = false,
  bool ringSilently = false,
  List<String>? outboundRingRecipients,
  bool initialSelfMute = false,
  bool initialSelfDeaf = false,
  bool initialSelfVideo = false,
}) async {
  final String? currentUserId = ref.read(currentUserIdProvider);
  if (currentUserId == null) {
    await _connectToVoiceChannel(
      ref: ref,
      guildId: guildId,
      channelId: channelId,
      startOutgoingCall: startOutgoingCall,
      ringSilently: ringSilently,
      outboundRingRecipients: outboundRingRecipients,
      initialSelfMute: initialSelfMute,
      initialSelfDeaf: initialSelfDeaf,
      initialSelfVideo: initialSelfVideo,
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
    await _connectToVoiceChannel(
      ref: ref,
      guildId: guildId,
      channelId: channelId,
      startOutgoingCall: startOutgoingCall,
      ringSilently: ringSilently,
      outboundRingRecipients: outboundRingRecipients,
      initialSelfMute: initialSelfMute,
      initialSelfDeaf: initialSelfDeaf,
      initialSelfVideo: initialSelfVideo,
    );
    return;
  }
  final BuildContext? modalContext = _modalContext(context);
  if (modalContext == null) {
    talker.warning(
      '[Voice] Multi-device join modal skipped: no mounted context '
      '(channelId=$channelId, otherDevices=${others.length}).',
    );
    return;
  }
  final VoiceConnectionConfirmResult? choice =
      await showVoiceConnectionConfirmModal(
        modalContext,
        otherDeviceCount: others.length,
      );
  if (choice == null) {
    talker.info(
      '[Voice] Join cancelled from multi-device modal '
      '(channelId=$channelId).',
    );
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
  await _connectToVoiceChannel(
    ref: ref,
    guildId: guildId,
    channelId: channelId,
    startOutgoingCall: startOutgoingCall,
    ringSilently: ringSilently,
    outboundRingRecipients: outboundRingRecipients,
    initialSelfMute: initialSelfMute,
    initialSelfDeaf: initialSelfDeaf,
    initialSelfVideo: initialSelfVideo,
  );
}
