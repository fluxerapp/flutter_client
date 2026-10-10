import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/experiments/experiments_provider.dart';
import 'package:fluxer_app/core/gateway/providers/gateway_event_providers.dart';
import 'package:fluxer_app/core/platform/fluxer_platform.dart';
import 'package:fluxer_app/core/providers/gateway_connection_provider.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/core/talker.dart';
import 'package:fluxer_app/features/channels/domain/channel.dart';
import 'package:fluxer_app/features/mature_content/utils/channel_gate_navigator.dart';
import 'package:fluxer_app/features/settings/providers/advanced_preferences_provider.dart';
import 'package:fluxer_app/features/settings/providers/voice_settings_provider.dart';
import 'package:fluxer_app/features/ui/button/fluxer_button.dart';
import 'package:fluxer_app/features/ui/modal/fluxer_modal.dart';
import 'package:fluxer_app/features/ui/settings/fluxer_settings_confirm_sheet.dart';
import 'package:fluxer_app/features/voice/presentation/sheets/voice_p2p_sheets.dart';
import 'package:fluxer_app/features/voice/presentation/widgets/voice_connection_confirm_modal.dart';
import 'package:fluxer_app/features/voice/providers/voice_join_eligibility_provider.dart';
import 'package:fluxer_app/features/voice/providers/voice_p2p_mode_provider.dart';
import 'package:fluxer_app/features/voice/providers/voice_session_provider.dart';
import 'package:fluxer_app/features/voice/providers/voice_session_state.dart';
import 'package:fluxer_app/features/voice/utils/channel_e2ee_status.dart';
import 'package:fluxer_app/features/voice/utils/voice_p2p_mode.dart';
import 'package:fluxer_app/features/voice/voice_session_errors.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_dart/gateway.dart';

const Duration _kOtherDeviceDisconnectTimeout = Duration(seconds: 3);
const Duration _kOtherDeviceDisconnectPollInterval = Duration(
  milliseconds: 100,
);

enum VoiceJoinResult {
  cancelled,
  succeeded,
  failed,
  gated;

  bool get shouldOpenChannel => switch (this) {
    succeeded || gated => true,
    cancelled || failed => false,
  };
}

void sendVoiceStateDisconnect(
  ProviderContainer container, {
  required String? guildId,
  required String connectionId,
}) {
  container
      .read(gatewayConnectionProvider)
      .updateVoiceState(
        GatewayVoiceStateUpdate(
          guildId: guildId,
          selfMute: true,
          selfDeaf: true,
          selfVideo: false,
          selfStream: false,
          connectionId: connectionId,
          isMobile: isFluxerMobileOs,
        ),
      );
}

BuildContext? _modalContext(BuildContext? context) {
  if (context != null && context.mounted) {
    return context;
  }
  return rootNavigatorKey.currentContext;
}

ProviderContainer? _providerContainer(BuildContext? context) {
  final BuildContext? scopeContext = _modalContext(context);
  if (scopeContext == null) {
    return null;
  }
  return ProviderScope.containerOf(scopeContext, listen: false);
}

Future<void> _showVoiceJoinFailedModal(
  BuildContext? context, {
  required String message,
}) async {
  final BuildContext? modalContext = _modalContext(context);
  if (modalContext == null) {
    return;
  }
  final FluxerLocalizations l10n = FluxerLocalizations.of(modalContext);
  await FluxerModal.show<void>(
    modalContext,
    title: l10n.voiceJoinFailedTitle,
    description: message,
    builder: (BuildContext dialogContext, VoidCallback close) {
      return const SizedBox.shrink();
    },
    actionsBuilder: (void Function([void result]) pop) => <Widget>[
      FluxerButton.primary(onPressed: pop, label: l10n.uiClose),
    ],
  );
}

Future<bool> _disconnectSelfConnections({
  required ProviderContainer container,
  required String? guildId,
  required String channelId,
  required String currentUserId,
  required List<VoiceState> connections,
}) async {
  final Set<String> connectionIdsToClear = <String>{};
  for (final VoiceState vs in connections) {
    final String? connectionId = vs.connectionId;
    if (connectionId == null) {
      continue;
    }
    connectionIdsToClear.add(connectionId);
    sendVoiceStateDisconnect(
      container,
      guildId: guildId,
      connectionId: connectionId,
    );
  }
  if (connectionIdsToClear.isEmpty) {
    return true;
  }
  return _waitForOtherConnectionsCleared(
    container: container,
    guildId: guildId,
    channelId: channelId,
    currentUserId: currentUserId,
    connectionIdsToClear: connectionIdsToClear,
  );
}

Future<bool> _waitForOtherConnectionsCleared({
  required ProviderContainer container,
  required String? guildId,
  required String channelId,
  required String currentUserId,
  required Set<String> connectionIdsToClear,
}) async {
  final DateTime deadline = DateTime.now().add(_kOtherDeviceDisconnectTimeout);
  while (DateTime.now().isBefore(deadline)) {
    final Map<String, VoiceState> voiceStates = container.read(
      voiceStatesMapProvider,
    );
    final String? localConnectionId = container
        .read(voiceSessionProvider)
        .activeConnectionId;
    final List<VoiceState> others = otherUserConnectionsInChannel(
      voiceStates: voiceStates,
      guildId: guildId,
      channelId: channelId,
      currentUserId: currentUserId,
      localConnectionId: localConnectionId,
    );
    final bool stillPresent = others.any(
      (VoiceState vs) =>
          vs.connectionId != null &&
          connectionIdsToClear.contains(vs.connectionId),
    );
    if (!stillPresent) {
      return true;
    }
    await Future<void>.delayed(_kOtherDeviceDisconnectPollInterval);
  }
  return false;
}

Future<void> _prepareForVoiceJoinAfterDeviceSwitch({
  required ProviderContainer container,
  required String? guildId,
}) async {
  final VoiceSession notifier = container.read(voiceSessionProvider.notifier);
  final VoiceSessionState session = container.read(voiceSessionProvider);
  if (session.isInVoice || session.isConnecting) {
    await notifier.leaveVoice(endCall: false);
  }
}

int _otherVoiceConnectionCount({
  required ProviderContainer container,
  required String? guildId,
  required String channelId,
}) {
  return occupiedVoiceConnectionsForJoinLimit(
    voiceStates: voiceStatesForChannel(
      voiceStates: container.read(voiceStatesMapProvider),
      channelId: channelId,
      guildId: guildId == null || guildId.isEmpty ? null : guildId,
    ),
    currentConnectionId: container
        .read(voiceSessionProvider)
        .activeConnectionId,
  );
}

Future<bool?> _resolveJoinP2p({
  required ProviderContainer container,
  required BuildContext? context,
  required String? guildId,
  required String channelId,
  required Channel? channel,
  required bool startP2p,
}) async {
  if (startP2p) {
    return true;
  }
  final VoiceChannelMode mode = container.read(
    voiceChannelModeForProvider(guildId: guildId, channelId: channelId),
  );
  final bool pinned = channel?.rtcP2p ?? false;
  final bool needsAgreement =
      mode == VoiceChannelMode.p2p ||
      (mode == VoiceChannelMode.empty &&
          pinned &&
          container.read(voiceP2pEnabledProvider));
  if (!needsAgreement) {
    return false;
  }
  final BuildContext? modalContext = _modalContext(context);
  if (modalContext == null) {
    return null;
  }
  if (mode == VoiceChannelMode.p2p &&
      _otherVoiceConnectionCount(
            container: container,
            guildId: guildId,
            channelId: channelId,
          ) >=
          container.read(voiceP2pMaxParticipantsProvider)) {
    await _showVoiceJoinFailedModal(
      modalContext,
      message: FluxerLocalizations.of(modalContext).voiceChannelFullError,
    );
    return null;
  }
  final bool agreed = await confirmVoiceP2pJoin(modalContext, pinned: pinned);
  return agreed ? true : null;
}

Future<VoiceJoinResult> joinVoiceChannelWithConfirmation({
  required WidgetRef ref,
  required String? guildId,
  required String channelId,
  BuildContext? context,
  Channel? channel,
  bool startOutgoingCall = false,
  bool ringSilently = false,
  List<String>? outboundRingRecipients,
  bool initialSelfMute = false,
  bool initialSelfDeaf = false,
  bool initialSelfVideo = false,
  bool startP2p = false,
}) async {
  final ProviderContainer? container = _providerContainer(context);
  if (container == null) {
    talker.warning(
      '[Voice] Join aborted: no provider scope '
      '(channelId=$channelId).',
    );
    return VoiceJoinResult.failed;
  }
  final AdvancedPreferencesState advancedPrefs = container.read(
    advancedPreferencesProvider,
  );
  if (advancedPrefs.confirmBeforeJoiningVoiceChannels) {
    final BuildContext? modalContext = _modalContext(context);
    if (modalContext == null) {
      return VoiceJoinResult.failed;
    }
    final FluxerLocalizations l10n = FluxerLocalizations.of(modalContext);
    final bool? confirmed = await showFluxerSettingsConfirmSheet(
      modalContext,
      title: l10n.voiceChannelJoin,
      description: l10n.voiceChannelJoinConnect,
      confirmLabel: l10n.voiceChannelJoinConnect,
    );
    if (confirmed != true) {
      return VoiceJoinResult.cancelled;
    }
  }
  final bool blockedByGate = await isChannelGateBlocking(
    container: container,
    channelId: channelId,
    channel: channel,
  );
  if (blockedByGate) {
    return VoiceJoinResult.gated;
  }
  final bool? p2p = await _resolveJoinP2p(
    container: container,
    context: context != null && context.mounted ? context : null,
    guildId: guildId,
    channelId: channelId,
    channel: channel,
    startP2p: startP2p,
  );
  if (p2p == null) {
    return VoiceJoinResult.cancelled;
  }
  final String? currentUserId = container.read(currentUserIdProvider);
  if (currentUserId == null) {
    return _connectAndResolveJoinResult(
      container: container,
      guildId: guildId,
      channelId: channelId,
      channel: channel,
      startOutgoingCall: startOutgoingCall,
      ringSilently: ringSilently,
      outboundRingRecipients: outboundRingRecipients,
      initialSelfMute: initialSelfMute,
      initialSelfDeaf: initialSelfDeaf,
      initialSelfVideo: initialSelfVideo,
      p2p: p2p,
    );
  }
  final VoiceSessionState session = container.read(voiceSessionProvider);
  final Map<String, VoiceState> voiceStates = container.read(
    voiceStatesMapProvider,
  );
  final SelfVoiceConnectionsForJoin partitioned =
      partitionSelfVoiceConnectionsForJoin(
        voiceStates: voiceStates,
        guildId: guildId,
        channelId: channelId,
        currentUserId: currentUserId,
        session: session,
      );
  if (partitioned.stale.isNotEmpty) {
    final bool cleared = await _disconnectSelfConnections(
      container: container,
      guildId: guildId,
      channelId: channelId,
      currentUserId: currentUserId,
      connections: partitioned.stale,
    );
    if (!cleared) {
      talker.warning(
        '[Voice] Timed out clearing stale voice connections before join '
        '(channelId=$channelId, connections=${partitioned.stale.length}).',
      );
    }
  }
  final List<VoiceState> others = partitioned.otherDevices;
  if (others.isEmpty) {
    return _connectAndResolveJoinResult(
      container: container,
      guildId: guildId,
      channelId: channelId,
      channel: channel,
      startOutgoingCall: startOutgoingCall,
      ringSilently: ringSilently,
      outboundRingRecipients: outboundRingRecipients,
      initialSelfMute: initialSelfMute,
      initialSelfDeaf: initialSelfDeaf,
      initialSelfVideo: initialSelfVideo,
      p2p: p2p,
    );
  }
  if (context == null || !context.mounted) {
    return VoiceJoinResult.failed;
  }
  final BuildContext? modalContext = _modalContext(context);
  if (modalContext == null) {
    talker.warning(
      '[Voice] Multi-device join modal skipped: no mounted context '
      '(channelId=$channelId, otherDevices=${others.length}).',
    );
    return VoiceJoinResult.failed;
  }
  final bool suppressNewDeviceAlerts = container.read(
    voiceSettingsProvider.select((state) => state.suppressNewDeviceAlerts),
  );
  VoiceConnectionConfirmResult? choice;
  if (suppressNewDeviceAlerts) {
    choice = VoiceConnectionConfirmResult.justJoin;
  } else {
    if (!modalContext.mounted) {
      return VoiceJoinResult.failed;
    }
    choice = await showVoiceConnectionConfirmModal(
      modalContext,
      otherDeviceCount: others.length,
    );
  }
  if (choice == null) {
    talker.info(
      '[Voice] Join cancelled from multi-device modal '
      '(channelId=$channelId).',
    );
    return VoiceJoinResult.cancelled;
  }
  const bool forceJoin = true;
  if (choice == VoiceConnectionConfirmResult.switchToThisDevice) {
    final bool cleared = await _disconnectSelfConnections(
      container: container,
      guildId: guildId,
      channelId: channelId,
      currentUserId: currentUserId,
      connections: others,
    );
    if (!cleared) {
      talker.warning(
        '[Voice] Timed out waiting for other devices to disconnect '
        '(channelId=$channelId, devices=${others.length}).',
      );
      container
          .read(voiceSessionProvider.notifier)
          .reportJoinError(kVoiceSessionErrorMultiDeviceDisconnectFailed);
      await _showJoinFailureIfNeeded(container, null);
      return VoiceJoinResult.failed;
    }
    await _prepareForVoiceJoinAfterDeviceSwitch(
      container: container,
      guildId: guildId,
    );
  }
  return _connectAndResolveJoinResult(
    container: container,
    guildId: guildId,
    channelId: channelId,
    channel: channel,
    startOutgoingCall: startOutgoingCall,
    ringSilently: ringSilently,
    outboundRingRecipients: outboundRingRecipients,
    initialSelfMute: initialSelfMute,
    initialSelfDeaf: initialSelfDeaf,
    initialSelfVideo: initialSelfVideo,
    forceJoin: forceJoin,
    p2p: p2p,
  );
}

Future<VoiceJoinResult> _connectAndResolveJoinResult({
  required ProviderContainer container,
  required String? guildId,
  required String channelId,
  Channel? channel,
  bool startOutgoingCall = false,
  bool ringSilently = false,
  List<String>? outboundRingRecipients,
  bool initialSelfMute = false,
  bool initialSelfDeaf = false,
  bool initialSelfVideo = false,
  bool forceJoin = false,
  bool p2p = false,
}) async {
  final bool joined = await container
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
        forceJoin: forceJoin,
        p2p: p2p,
      );
  if (joined) {
    return VoiceJoinResult.succeeded;
  }
  if (await isChannelGateBlocking(
    container: container,
    channelId: channelId,
    channel: channel,
  )) {
    return VoiceJoinResult.gated;
  }
  await _showJoinFailureIfNeeded(container, null);
  return VoiceJoinResult.failed;
}

Future<void> _showJoinFailureIfNeeded(
  ProviderContainer container,
  BuildContext? context,
) async {
  final String? errorMessage = container
      .read(voiceSessionProvider)
      .errorMessage;
  final BuildContext? modalContext = _modalContext(context);
  if (modalContext == null) {
    return;
  }
  final FluxerLocalizations l10n = FluxerLocalizations.of(modalContext);
  final String message = errorMessage == null
      ? l10n.voiceJoinCallFailed
      : resolveVoiceSessionErrorMessage(errorMessage, l10n);
  await _showVoiceJoinFailedModal(modalContext, message: message);
}
