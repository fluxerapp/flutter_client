import 'dart:async';
import 'dart:io';

import 'package:flutter/scheduler.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart';
import 'package:fluxer_app/core/api/fluxer_client_provider.dart';
import 'package:fluxer_app/core/audio/enums/fluxer_sfx_clip.dart';
import 'package:fluxer_app/core/permissions/channel_effective_permissions.dart';
import 'package:fluxer_app/core/permissions/channel_permission_cache_provider.dart';
import 'package:fluxer_app/core/permissions/permission.dart';
import 'package:fluxer_app/core/providers/fluxer_sfx_provider.dart';
import 'package:fluxer_app/core/providers/gateway_connection_provider.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/core/talker.dart';
import 'package:fluxer_app/features/gateway/providers/gateway_event_providers.dart';
import 'package:fluxer_app/features/guilds/providers/guild_list_view_model.dart';
import 'package:fluxer_app/features/voice/providers/screen_share_capability_provider.dart';
import 'package:fluxer_app/features/voice/providers/voice_call_layout_provider.dart';
import 'package:fluxer_app/features/voice/providers/voice_screen_share_watch_tile_provider.dart';
import 'package:fluxer_app/features/voice/providers/voice_session_state.dart';
import 'package:fluxer_app/features/voice/utils/android_screen_share_background.dart';
import 'package:fluxer_app/features/voice/utils/camera_permission.dart';
import 'package:fluxer_app/features/voice/utils/channel_e2ee_status.dart';
import 'package:fluxer_app/features/voice/utils/microphone_permission.dart';
import 'package:fluxer_app/features/voice/utils/voice_effective_audio_state.dart';
import 'package:fluxer_app/features/voice/voice_session_errors.dart';
import 'package:fluxer_dart/export.dart';
import 'package:fluxer_dart/gateway.dart';
import 'package:livekit_client/livekit_client.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'voice_session_provider.g.dart';

/// Cleared when a voice server update is accepted and LiveKit connection is
/// scheduled. Covers slow gateway only, not LiveKit [Room.connect] duration.
const Duration _kVoiceJoinWatchdogDuration = Duration(seconds: 15);
const Duration _kDeferredServerDisconnectDuration = Duration(seconds: 5);
const List<Duration> _kMicPublishRetryDelays = <Duration>[
  Duration(seconds: 2),
  Duration(seconds: 5),
];
const Timeouts _kE2eeConnectTimeouts = Timeouts(
  connection: Duration(seconds: 10),
  debounce: Duration(milliseconds: 20),
  publish: Duration(seconds: 20),
  subscribe: Duration(seconds: 10),
  peerConnection: Duration(seconds: 10),
  iceRestart: Duration(seconds: 10),
);

String? _normalizeVoiceGuildId(String? value) {
  if (value == null || value.isEmpty) {
    return null;
  }
  return value;
}

@Riverpod(keepAlive: true)
class VoiceSession extends _$VoiceSession {
  int _connectGeneration = 0;
  String? _expectedGuildId;
  String? _expectedChannelId;
  Timer? _connectWatchdogTimer;
  int _connectWatchdogArmedGeneration = 0;
  DateTime? _lastConnectRequestAt;
  bool _pendingRingAfterConnect = false;
  bool _pendingRingSilently = false;
  List<String>? _outboundRingRecipients;
  bool _togglingVideo = false;
  bool _togglingScreenShare = false;
  bool _reconcilingSelfStream = false;
  bool _startWithVideoAfterConnect = false;
  DateTime? _lastCameraOrientationRefresh;
  LocalParticipant? _observedLocalParticipant;
  EventsListener<RoomEvent>? _roomEventsListener;
  String? _voiceMovePreviousChannelId;
  bool _intentionalLiveKitTeardown = false;
  ChannelE2eeStatus? _lastLoggedE2eeChannelStatus;
  Future<void>? _connectLiveKitInFlight;
  Timer? _deferredServerDisconnectTimer;
  String? _pendingServerDisconnectConnectionId;
  int? _boundRoomAttemptId;
  bool _lobbySelfMute = false;
  bool _lobbySelfDeaf = false;
  bool _ensuringMicrophone = false;

  @override
  VoiceSessionState build() {
    ref
      ..onDispose(() {
        _cancelConnectWatchdog();
        _cancelDeferredServerDisconnect();
        _detachLocalParticipantListener();
        unawaited(_disconnectRoomOnly());
      })
      ..listen<Map<String, int>>(channelPermissionCacheProvider, (
        Map<String, int>? _,
        Map<String, int> _,
      ) {
        unawaited(_onChannelPermissionsChanged());
      });
    return const VoiceSessionState();
  }

  void _cancelConnectWatchdog() {
    _connectWatchdogTimer?.cancel();
    _connectWatchdogTimer = null;
  }

  void _armConnectWatchdog(int generation) {
    _cancelConnectWatchdog();
    _connectWatchdogArmedGeneration = generation;
    _connectWatchdogTimer = Timer(_kVoiceJoinWatchdogDuration, () {
      if (_connectWatchdogArmedGeneration != generation) {
        return;
      }
      if (_connectGeneration != generation) {
        return;
      }
      if (!state.isConnecting || state.isConnected) {
        return;
      }
      talker.warning(
        '[Voice] Join timed out after '
        '${_kVoiceJoinWatchdogDuration.inSeconds}s '
        '(generation=$generation, channelId=$_expectedChannelId, '
        'guildId=$_expectedGuildId).',
      );
      _connectGeneration++;
      _expectedGuildId = null;
      _expectedChannelId = null;
      _pendingRingAfterConnect = false;
      _pendingRingSilently = false;
      _outboundRingRecipients = null;
      _clearOutgoingCallInitiator(_expectedChannelId);
      _detachLocalParticipantListener();
      unawaited(_disconnectRoomOnly());
      state = state.copyWith(
        isConnecting: false,
        isConnected: false,
        errorMessage: 'Voice connection timed out.',
        clearRoom: true,
      );
    });
  }

  Room? get _room => state.liveKitRoom;

  /// Joins a voice channel; the gateway responds with [VoiceServerUpdateEvent],
  /// which is forwarded to [handleVoiceServerUpdate].
  ///
  /// [ringSilently] (with [startOutgoingCall]): POST
  /// ring with an empty recipient list.
  Future<void> connectToVoiceChannel({
    required String? guildId,
    required String channelId,
    bool startOutgoingCall = false,
    bool ringSilently = false,
    List<String>? outboundRingRecipients,
    bool initialSelfMute = false,
    bool initialSelfDeaf = false,
    bool initialSelfVideo = false,
  }) async {
    _startWithVideoAfterConnect = false;
    if (state.isConnected && state.channelId == channelId) {
      return;
    }
    final bool micOk = await requestMicrophonePermissionForVoice();
    if (!micOk) {
      state = state.copyWith(
        errorMessage: 'Microphone permission is required for voice.',
      );
      return;
    }
    if (guildId != null) {
      int? permissionBits = ref
          .read(channelPermissionCacheProvider.notifier)
          .getChannelBits(channelId);
      if (permissionBits == null) {
        await ref
            .read(channelPermissionCacheProvider.notifier)
            .rebuildChannel(channelId);
        permissionBits = ref
            .read(channelPermissionCacheProvider.notifier)
            .getChannelBits(channelId);
      }
      final int? localConnectBits = await ref.read(
        channelLocalGuildChannelPermissionBitsProvider(channelId).future,
      );
      if ((localConnectBits ?? permissionBits) != null &&
          !hasPermission(
            localConnectBits ?? permissionBits!,
            Permission.connect,
          )) {
        state = state.copyWith(
          errorMessage: kVoiceSessionErrorNoConnectPermission,
        );
        return;
      }
    }
    final DateTime now = DateTime.now();
    if (_lastConnectRequestAt != null &&
        now.difference(_lastConnectRequestAt!) < const Duration(seconds: 1)) {
      talker.warning(
        '[Voice] Connect request throttled (< 1s since last attempt).',
      );
      return;
    }
    final GatewayConnection gateway = ref.read(gatewayConnectionProvider);
    if (gateway.state != GatewayState.connected) {
      talker.warning(
        '[Voice] Cannot join voice: gateway state is '
        '${gateway.state.name} (${GatewayState.connected.name} '
        'required). Voice join opcode was not sent — no '
        '`VOICE_SERVER_UPDATE` will follow.',
      );
      state = state.copyWith(
        errorMessage:
            'Chat is reconnecting. Please wait until you are online, then try '
            'again.',
      );
      return;
    }
    _lastConnectRequestAt = now;
    _startWithVideoAfterConnect = initialSelfVideo;
    bool resolvedSelfMute = initialSelfDeaf || initialSelfMute;
    final bool resolvedSelfDeaf = initialSelfDeaf;
    if (guildId != null) {
      final int? permissionBits = ref
          .read(channelPermissionCacheProvider.notifier)
          .getChannelBits(channelId);
      if (permissionBits != null &&
          !hasPermission(permissionBits, Permission.speak)) {
        resolvedSelfMute = true;
      }
    }
    _lobbySelfMute = resolvedSelfMute;
    _lobbySelfDeaf = resolvedSelfDeaf;
    _connectGeneration++;
    _voiceMovePreviousChannelId =
        state.isConnected &&
            state.channelId != null &&
            state.channelId != channelId
        ? state.channelId
        : null;
    _expectedGuildId = _normalizeVoiceGuildId(guildId);
    _expectedChannelId = channelId;
    _pendingRingAfterConnect = startOutgoingCall;
    _pendingRingSilently = startOutgoingCall && ringSilently;
    if (startOutgoingCall && !ringSilently) {
      _outboundRingRecipients =
          outboundRingRecipients == null || outboundRingRecipients.isEmpty
          ? null
          : List<String>.from(outboundRingRecipients);
    } else {
      _outboundRingRecipients = null;
    }
    if (startOutgoingCall) {
      ref
          .read(outgoingVoiceCallInitiatorProvider.notifier)
          .markInitiated(
            channelId: channelId,
            outboundRingRecipients: outboundRingRecipients ?? const [],
          );
    }
    state = state.copyWith(
      isConnecting: true,
      isConnected: false,
      clearError: true,
      guildId: _expectedGuildId,
      channelId: channelId,
    );
    final bool selfMute = resolvedSelfMute;
    final bool selfDeaf = resolvedSelfDeaf;
    final bool joinSent = gateway.updateVoiceState(
      GatewayVoiceStateUpdate(
        guildId: _expectedGuildId,
        channelId: channelId,
        selfMute: selfMute,
        selfDeaf: selfDeaf,
        selfVideo: false,
        selfStream: false,
        isMobile: !Platform.isLinux && !Platform.isMacOS && !Platform.isWindows,
      ),
    );
    if (!joinSent) {
      talker.warning(
        '[Voice] Voice join opcode dropped (gateway disconnected between '
        'check and send, state=${gateway.state}).',
      );
      _connectGeneration--;
      _expectedGuildId = null;
      _expectedChannelId = null;
      _pendingRingAfterConnect = false;
      _pendingRingSilently = false;
      _outboundRingRecipients = null;
      _startWithVideoAfterConnect = false;
      _voiceMovePreviousChannelId = null;
      _clearOutgoingCallInitiator(channelId);
      state = state.copyWith(
        isConnecting: false,
        isConnected: false,
        errorMessage:
            'Lost connection before joining voice. Please try again in a '
            'moment.',
      );
      return;
    }
    _armConnectWatchdog(_connectGeneration);
  }

  void handleVoiceServerUpdate(VoiceServerUpdateEvent event) {
    if (_expectedChannelId == null) {
      talker.warning(
        '[Voice] Ignoring VOICE_SERVER_UPDATE: no expected channel '
        '(event guildId=${event.guildId} channelId=${event.channelId}).',
      );
      return;
    }
    final String resolvedChannelId = event.channelId ?? _expectedChannelId!;
    if (resolvedChannelId != _expectedChannelId) {
      talker.warning(
        '[Voice] Ignoring VOICE_SERVER_UPDATE: channelId mismatch '
        '(expected=$_expectedChannelId, '
        'resolved=$resolvedChannelId, '
        'event.channelId=${event.channelId}).',
      );
      return;
    }
    final String? expectedGuildNorm = _normalizeVoiceGuildId(_expectedGuildId);
    final String? incomingGuildNorm = _normalizeVoiceGuildId(event.guildId);
    final bool guildMatches =
        expectedGuildNorm == incomingGuildNorm ||
        expectedGuildNorm == null ||
        incomingGuildNorm == null;
    if (!guildMatches) {
      talker.warning(
        '[Voice] Ignoring VOICE_SERVER_UPDATE: guildId mismatch '
        '(expected=$_expectedGuildId, event=${event.guildId}, '
        'channel expected=$_expectedChannelId, '
        'event channel=${event.channelId}).',
      );
      return;
    }
    if (expectedGuildNorm == null && incomingGuildNorm != null) {
      talker.info(
        '[Voice] Accepting VOICE_SERVER_UPDATE guild from server for '
        'null-guild join (channelId=$resolvedChannelId, '
        'guildId=$incomingGuildNorm).',
      );
    } else if (expectedGuildNorm != null && incomingGuildNorm == null) {
      talker.debug(
        '[Voice] Accepting VOICE_SERVER_UPDATE with omitted guild_id; '
        'using expected guildId=$expectedGuildNorm '
        '(channelId=$resolvedChannelId).',
      );
    }
    if (event.token.isEmpty || event.endpoint.isEmpty) {
      talker.warning(
        '[Voice] VOICE_SERVER_UPDATE missing token or endpoint '
        '(guildId=${event.guildId}, channelId=$resolvedChannelId).',
      );
      _cancelConnectWatchdog();
      state = state.copyWith(
        isConnecting: false,
        errorMessage: 'Voice server did not return connection details.',
      );
      return;
    }
    if (!state.isConnected &&
        state.isConnecting &&
        event.connectionId.isNotEmpty &&
        state.activeConnectionId != null &&
        event.connectionId == state.activeConnectionId &&
        state.voiceServerEndpoint != null &&
        state.voiceServerEndpoint == event.endpoint) {
      talker.debug('[Voice] Ignoring duplicate VOICE_SERVER_UPDATE in-flight.');
      return;
    }
    _cancelDeferredServerDisconnect();
    final bool hasE2eeKey = event.e2eeKey != null && event.e2eeKey!.isNotEmpty;
    talker.info(
      '[Voice] VOICE_SERVER_UPDATE accepted; starting LiveKit '
      '(channelId=$resolvedChannelId, connectionId=${event.connectionId}, '
      'e2eeKey=$hasE2eeKey).',
    );
    _cancelConnectWatchdog();
    final int attempt = _connectGeneration;
    unawaited(
      _connectLiveKit(
        event: event,
        resolvedChannelId: resolvedChannelId,
        attempt: attempt,
      ),
    );
  }

  bool _guildHasVoiceE2ee(String? guildId) {
    if (guildId == null) {
      return true;
    }
    return ref
        .read(guildListViewModelProvider)
        .guilds
        .any((g) => g.id == guildId && g.hasVoiceE2ee);
  }

  void _logVoiceE2eeSnapshot(
    String reason, {
    Room? room,
    String? channelId,
    String? guildId,
  }) {
    final Room? activeRoom = room ?? state.liveKitRoom;
    final String? resolvedChannelId = channelId ?? state.channelId;
    final String? resolvedGuildId = guildId ?? state.guildId;
    final bool hasServerKey =
        state.e2eeKey != null && state.e2eeKey!.isNotEmpty;
    final bool liveKitManagerReady = activeRoom?.e2eeManager != null;
    ChannelE2eeStatus? channelStatus;
    if (resolvedChannelId != null) {
      channelStatus = computeChannelE2eeStatus(
        voiceStates: ref.read(voiceStatesMapProvider),
        guildId: resolvedGuildId,
        channelId: resolvedChannelId,
        guildHasVoiceE2ee: _guildHasVoiceE2ee(resolvedGuildId),
      );
    }
    talker.info(
      '[Voice][E2EE] $reason | '
      'serverKey=$hasServerKey '
      'liveKitManager=$liveKitManagerReady '
      'channelStatus=${channelStatus?.name ?? 'n/a'} '
      'connected=${state.isConnected} '
      'channelId=$resolvedChannelId',
    );
  }

  void syncE2eeFromVoiceStates() {
    if (!state.isConnected || state.channelId == null) {
      return;
    }
    final Room? room = state.liveKitRoom;
    if (room == null) {
      return;
    }
    final String channelId = state.channelId!;
    final String? guildId = state.guildId;
    final ChannelE2eeStatus status = computeChannelE2eeStatus(
      voiceStates: ref.read(voiceStatesMapProvider),
      guildId: guildId,
      channelId: channelId,
      guildHasVoiceE2ee: _guildHasVoiceE2ee(guildId),
    );
    if (_lastLoggedE2eeChannelStatus != status) {
      _lastLoggedE2eeChannelStatus = status;
      switch (status) {
        case ChannelE2eeStatus.encrypted:
          talker.info(
            '[Voice][E2EE] Channel is fully E2EE-capable; '
            'ensuring LiveKit encryption stays on.',
          );
        case ChannelE2eeStatus.broken:
          talker.warning(
            '[Voice][E2EE] Mixed E2EE capability in channel; '
            'falling back to plaintext for interop.',
          );
        case ChannelE2eeStatus.none:
          talker.debug('[Voice][E2EE] Channel has no active E2EE mix.');
      }
    }
    if (status == ChannelE2eeStatus.encrypted && state.e2eeKey != null) {
      unawaited(
        room
            .setE2EEEnabled(true)
            .then((_) {
              talker.info(
                '[Voice][E2EE] LiveKit encryption enabled (runtime sync).',
              );
            })
            .catchError((Object error) {
              talker.warning(
                '[Voice][E2EE] Failed to enable LiveKit E2EE: $error',
              );
            }),
      );
    } else if (status == ChannelE2eeStatus.broken) {
      final bool keepE2eeOnGuildChannel =
          state.e2eeKey != null &&
          state.e2eeKey!.isNotEmpty &&
          _guildHasVoiceE2ee(guildId);
      if (keepE2eeOnGuildChannel) {
        talker.debug(
          '[Voice][E2EE] Mixed capability but keeping encryption on '
          'active guild E2EE session.',
        );
        return;
      }
      unawaited(
        room
            .setE2EEEnabled(false)
            .then((_) {
              talker.info(
                '[Voice][E2EE] LiveKit encryption disabled (runtime sync).',
              );
            })
            .catchError((Object error) {
              talker.warning(
                '[Voice][E2EE] Failed to disable LiveKit E2EE: $error',
              );
            }),
      );
    }
  }

  void handleSelfVoiceStateUpdate(VoiceState voiceState) {
    final String? userId = ref.read(currentUserIdProvider);
    if (userId == null || voiceState.userId != userId) {
      return;
    }
    final String? connectionId = state.activeConnectionId;
    if (connectionId == null) {
      return;
    }
    if (voiceState.connectionId != null &&
        voiceState.connectionId != connectionId) {
      return;
    }
    if (voiceState.channelId == null) {
      _scheduleDeferredServerDisconnect(connectionId);
      return;
    }
    _cancelDeferredServerDisconnect();
    if (state.isConnected) {
      unawaited(_reconcileLocalAudioPublish(reason: 'voice_state_update'));
    }
  }

  void handleGatewayError(GatewayErrorEvent event) {
    if (event.code != 'VOICE_E2EE_REQUIRED') {
      return;
    }
    if (!state.isConnecting || state.isConnected) {
      return;
    }
    talker.warning('[Voice] Join rejected: ${event.code}');
    _cancelConnectWatchdog();
    _connectGeneration++;
    _expectedGuildId = null;
    _expectedChannelId = null;
    _pendingRingAfterConnect = false;
    _pendingRingSilently = false;
    _outboundRingRecipients = null;
    _detachRoomEventsListener();
    _detachLocalParticipantListener();
    unawaited(_disconnectRoomOnly());
    state = state.copyWith(
      isConnecting: false,
      isConnected: false,
      isReconnecting: false,
      errorMessage: kVoiceSessionErrorE2eeRequired,
      clearRoom: true,
      clearE2eeKey: true,
    );
  }

  Future<void> _connectLiveKit({
    required VoiceServerUpdateEvent event,
    required String resolvedChannelId,
    required int attempt,
  }) async {
    while (_connectLiveKitInFlight != null) {
      await _connectLiveKitInFlight;
      if (attempt != _connectGeneration) {
        return;
      }
    }
    final Completer<void> inFlightCompleter = Completer<void>();
    _connectLiveKitInFlight = inFlightCompleter.future;
    try {
      await _connectLiveKitImpl(
        event: event,
        resolvedChannelId: resolvedChannelId,
        attempt: attempt,
      );
    } finally {
      if (!inFlightCompleter.isCompleted) {
        inFlightCompleter.complete();
      }
      _connectLiveKitInFlight = null;
    }
  }

  Future<void> _connectLiveKitImpl({
    required VoiceServerUpdateEvent event,
    required String resolvedChannelId,
    required int attempt,
  }) async {
    final String? moveFromChannelId = _voiceMovePreviousChannelId;
    _voiceMovePreviousChannelId = null;
    await _disconnectRoomOnly();
    if (attempt != _connectGeneration) {
      return;
    }
    if (moveFromChannelId != null &&
        moveFromChannelId.isNotEmpty &&
        moveFromChannelId != resolvedChannelId) {
      unawaited(
        ref.read(fluxerSfxProvider).playOneShot(FluxerSfxClip.userMove),
      );
    }
    final String? e2eeKey = event.e2eeKey;
    final bool useE2ee = e2eeKey != null && e2eeKey.isNotEmpty;
    BaseKeyProvider? keyProvider;
    if (useE2ee) {
      try {
        keyProvider = await BaseKeyProvider.create();
        await keyProvider.setSharedKey(e2eeKey);
        talker.info('[Voice][E2EE] Shared key configured on BaseKeyProvider.');
      } on Object catch (e) {
        talker.error('[Voice][E2EE] Key provider setup failed: $e');
        if (attempt == _connectGeneration) {
          _cancelConnectWatchdog();
          state = state.copyWith(
            isConnecting: false,
            errorMessage: 'Could not connect to voice.',
          );
        }
        return;
      }
    }
    final RoomOptions roomOptions = RoomOptions(
      adaptiveStream: true,
      dynacast: true,
      encryption: keyProvider != null
          ? E2EEOptions(keyProvider: keyProvider)
          : null,
      defaultCameraCaptureOptions: const CameraCaptureOptions(
        params: VideoParametersPresets.h1080_169,
      ),
      defaultScreenShareCaptureOptions: const ScreenShareCaptureOptions(
        useiOSBroadcastExtension: true,
        captureScreenAudio: true,
        params: VideoParametersPresets.screenShareH1080FPS30,
      ),
    );
    final Room room = Room(roomOptions: roomOptions);
    final String? resolvedGuildId =
        _normalizeVoiceGuildId(event.guildId) ?? _expectedGuildId;
    state = state.copyWith(
      isConnecting: true,
      isReconnecting: false,
      voiceServerEndpoint: event.endpoint,
      activeConnectionId: event.connectionId,
      liveKitRoom: room,
      e2eeKey: e2eeKey,
      channelId: resolvedChannelId,
      guildId: resolvedGuildId,
    );
    _bindVoiceRoomEvents(
      room: room,
      attempt: attempt,
      resolvedChannelId: resolvedChannelId,
      resolvedGuildId: resolvedGuildId,
      connectionId: event.connectionId,
    );
    final ConnectOptions connectOptions = ConnectOptions(
      autoSubscribe: false,
      timeouts: useE2ee ? _kE2eeConnectTimeouts : Timeouts.defaultTimeouts,
    );
    try {
      await room.connect(
        event.endpoint,
        event.token,
        connectOptions: connectOptions,
      );
      if (keyProvider != null) {
        await room.setE2EEEnabled(true);
        _logVoiceE2eeSnapshot(
          'LiveKit transport connected with E2EE',
          room: room,
          channelId: resolvedChannelId,
          guildId: resolvedGuildId,
        );
        talker.info(
          '[Voice][E2EE] Transport connected: end-to-end encryption is active.',
        );
      } else {
        talker.info(
          '[Voice][E2EE] Transport connected: plaintext voice '
          '(gateway did not send e2ee_key).',
        );
      }
      if (attempt != _connectGeneration) {
        talker.warning(
          '[Voice] LiveKit connect superseded after room.connect '
          '(attempt=$attempt, generation=$_connectGeneration).',
        );
        _detachRoomEventsListener();
        _detachLocalParticipantListener();
        unawaited(room.disconnect());
        if (identical(state.liveKitRoom, room)) {
          state = state.copyWith(clearRoom: true);
        }
        return;
      }
      if (room.connectionState == ConnectionState.connected) {
        await _onLiveKitRoomConnected(
          room: room,
          attempt: attempt,
          resolvedChannelId: resolvedChannelId,
          resolvedGuildId: resolvedGuildId,
          connectionId: event.connectionId,
        );
      }
      if (_startWithVideoAfterConnect && attempt == _connectGeneration) {
        _startWithVideoAfterConnect = false;
        await _enableCameraAfterLiveKitConnect(room: room, attempt: attempt);
      }
    } on Object catch (e) {
      talker.error('[Voice] LiveKit transport connect failed: $e');
      if (useE2ee) {
        talker.error(
          '[Voice][E2EE] Encrypted transport failed. '
          'Check logs above for key setup or LiveKit E2EE errors.',
        );
      }
      _detachRoomEventsListener();
      _detachLocalParticipantListener();
      if (attempt == _connectGeneration) {
        _startWithVideoAfterConnect = false;
        _cancelConnectWatchdog();
        _outboundRingRecipients = null;
        _clearOutgoingCallInitiator(resolvedChannelId);
        state = state.copyWith(
          isConnecting: false,
          isConnected: false,
          isReconnecting: false,
          errorMessage: 'Could not connect to voice.',
          clearRoom: true,
        );
      }
    }
  }

  Future<void> _ringAfterConnect(
    String channelId, {
    required bool silently,
  }) async {
    final List<String>? explicitRecipients = silently
        ? null
        : _outboundRingRecipients;
    _outboundRingRecipients = null;
    try {
      final FluxerClient client = ref.read(fluxerClientProvider);
      final List<String>? bodyRecipients = silently
          ? <String>[]
          : (explicitRecipients != null && explicitRecipients.isNotEmpty
                ? explicitRecipients
                : null);
      await client.channels.ringCallRecipients(
        channelId: channelId,
        body: CallRingBodySchema(recipients: bodyRecipients),
      );
    } on Object catch (e) {
      talker.warning('[Voice] ringCallRecipients: $e');
    }
  }

  void _clearOutgoingCallInitiator(String? channelId) {
    if (channelId == null) {
      return;
    }
    ref
        .read(outgoingVoiceCallInitiatorProvider.notifier)
        .clearChannel(channelId);
  }

  Future<void> _enableCameraAfterLiveKitConnect({
    required Room room,
    required int attempt,
  }) async {
    if (_togglingVideo) {
      return;
    }
    final LocalParticipant? lp = room.localParticipant;
    if (lp == null) {
      return;
    }
    final bool camOk = await requestCameraPermissionForVoice();
    if (!camOk || attempt != _connectGeneration) {
      if (attempt == _connectGeneration) {
        state = state.copyWith(
          errorMessage: kVoiceSessionErrorCameraPermission,
        );
      }
      return;
    }
    _togglingVideo = true;
    try {
      try {
        await lp.setCameraEnabled(true);
      } on Object catch (e) {
        talker.error('[Voice] setCameraEnabled on connect: $e');
        return;
      }
      if (attempt != _connectGeneration) {
        return;
      }
      final VoiceState? vs = _selfConnectionVoiceState();
      await _applySelfVoiceState(
        selfMute: vs?.selfMute ?? false,
        selfDeaf: vs?.selfDeaf ?? false,
        selfVideo: true,
      );
      unawaited(
        ref.read(fluxerSfxProvider).playOneShot(FluxerSfxClip.cameraOn),
      );
    } finally {
      _togglingVideo = false;
    }
  }

  Future<void> leaveVoice({bool endCall = true}) async {
    _cancelConnectWatchdog();
    _cancelDeferredServerDisconnect();
    _startWithVideoAfterConnect = false;
    unawaited(
      ref.read(fluxerSfxProvider).playOneShot(FluxerSfxClip.voiceDisconnect),
    );
    ref.read(voiceScreenShareWatchTileProvider.notifier).setActiveTileId(null);
    ref.read(voiceCallLayoutProvider.notifier).reset();
    await disableAndroidScreenShareBackground();
    final String? channelId = state.channelId;
    final String? guildId = state.guildId;
    final String? connectionId = state.activeConnectionId;
    _connectGeneration++;
    _expectedGuildId = null;
    _expectedChannelId = null;
    _pendingRingAfterConnect = false;
    _pendingRingSilently = false;
    _outboundRingRecipients = null;
    _lastLoggedE2eeChannelStatus = null;
    if (channelId != null) {
      _clearOutgoingCallInitiator(channelId);
    }
    await _disconnectRoomOnly(guildId: guildId, connectionId: connectionId);
    state = const VoiceSessionState();
    if (endCall && channelId != null) {
      try {
        final FluxerClient client = ref.read(fluxerClientProvider);
        await client.channels.endCall(channelId: channelId);
      } on Object catch (e) {
        talker.warning('[Voice] endCall: $e');
      }
    }
  }

  Future<void> _disconnectRoomOnly({
    String? guildId,
    String? connectionId,
  }) async {
    _intentionalLiveKitTeardown = true;
    _detachRoomEventsListener();
    _detachLocalParticipantListener();
    final VoiceSessionState sessionState = state;
    final Room? roomToDisconnect = sessionState.liveKitRoom;
    if (roomToDisconnect == null) {
      _intentionalLiveKitTeardown = false;
      return;
    }
    _sendVoiceDisconnectState(
      guildId: guildId ?? sessionState.guildId,
      connectionId: connectionId ?? sessionState.activeConnectionId,
    );
    state = state.copyWith(clearRoom: true, clearE2eeKey: true);
    try {
      await roomToDisconnect.disconnect();
    } on Object catch (e) {
      talker.warning('[Voice] failed to disconnect: $e');
    } finally {
      try {
        await roomToDisconnect.dispose();
      } on Object catch (e) {
        talker.warning('[Voice] failed to dispose room: $e');
      }
      _intentionalLiveKitTeardown = false;
    }
  }

  void _sendVoiceDisconnectState({
    required String? guildId,
    required String? connectionId,
  }) {
    if (guildId == null || connectionId == null) {
      return;
    }
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
            isMobile:
                !Platform.isLinux && !Platform.isMacOS && !Platform.isWindows,
          ),
        );
  }

  void reportMicrophonePermissionDenied() {
    state = state.copyWith(
      errorMessage: 'Microphone permission is required for voice.',
    );
  }

  void clearError() {
    if (state.errorMessage == null) {
      return;
    }
    if (!state.isConnected) {
      _connectGeneration++;
      _expectedGuildId = null;
      _expectedChannelId = null;
      _pendingRingAfterConnect = false;
      _pendingRingSilently = false;
      _outboundRingRecipients = null;
      final String? ch = state.channelId;
      if (ch != null) {
        _clearOutgoingCallInitiator(ch);
      }
      _cancelConnectWatchdog();
    }
    state = state.copyWith(clearError: true, isConnecting: false);
  }

  VoiceState? _selfConnectionVoiceState() {
    final String? id = state.activeConnectionId;
    if (id == null) {
      return null;
    }
    return ref.read(voiceStatesMapProvider)[id];
  }

  Future<void> toggleSelfMute() async {
    final VoiceSessionState s = state;
    if (!s.isInVoice || s.channelId == null) {
      return;
    }
    final VoiceState? vs = _selfConnectionVoiceState();
    final bool nextMute = !(vs?.selfMute ?? false);
    await setSelfMute(isMuted: nextMute, playSound: true);
  }

  Future<void> setSelfMute({
    required bool isMuted,
    bool playSound = false,
  }) async {
    final VoiceSessionState s = state;
    if (!s.isInVoice || s.channelId == null) {
      return;
    }
    final VoiceState? vs = _selfConnectionVoiceState();
    if ((vs?.selfMute ?? false) == isMuted) {
      return;
    }
    final bool nextDeaf = vs?.selfDeaf ?? false;
    await _applySelfVoiceState(
      selfMute: isMuted,
      selfDeaf: nextDeaf,
      selfVideo: vs?.selfVideo ?? false,
    );
    if (playSound) {
      unawaited(
        ref
            .read(fluxerSfxProvider)
            .playOneShot(isMuted ? FluxerSfxClip.mute : FluxerSfxClip.unmute),
      );
    }
  }

  Future<void> toggleSelfDeafen() async {
    final VoiceSessionState s = state;
    if (!s.isInVoice || s.channelId == null) {
      return;
    }
    final VoiceState? vs = _selfConnectionVoiceState();
    final bool isDeaf = vs?.selfDeaf ?? false;
    if (isDeaf) {
      await _applySelfVoiceState(
        selfMute: false,
        selfDeaf: false,
        selfVideo: vs?.selfVideo ?? false,
      );
      unawaited(ref.read(fluxerSfxProvider).playOneShot(FluxerSfxClip.undeaf));
    } else {
      await _applySelfVoiceState(
        selfMute: true,
        selfDeaf: true,
        selfVideo: vs?.selfVideo ?? false,
      );
      unawaited(ref.read(fluxerSfxProvider).playOneShot(FluxerSfxClip.deaf));
    }
  }

  Future<void> toggleSelfVideo() async {
    final VoiceSessionState s = state;
    if (!s.isInVoice || s.channelId == null || !s.isConnected) {
      return;
    }
    if (_togglingVideo) {
      return;
    }
    final VoiceState? vs = _selfConnectionVoiceState();
    final bool nextVideo = !(vs?.selfVideo ?? false);
    final LocalParticipant? lp = state.liveKitRoom?.localParticipant;
    if (lp == null) {
      return;
    }
    if (nextVideo) {
      final bool camOk = await requestCameraPermissionForVoice();
      if (!camOk) {
        state = state.copyWith(
          errorMessage: kVoiceSessionErrorCameraPermission,
        );
        return;
      }
    }
    _togglingVideo = true;
    try {
      try {
        await lp.setCameraEnabled(nextVideo);
      } on Object catch (e) {
        talker.error('[Voice] setCameraEnabled: $e');
        return;
      }
      await _applySelfVoiceState(
        selfMute: vs?.selfMute ?? false,
        selfDeaf: vs?.selfDeaf ?? false,
        selfVideo: nextVideo,
      );
      unawaited(
        ref
            .read(fluxerSfxProvider)
            .playOneShot(
              nextVideo ? FluxerSfxClip.cameraOn : FluxerSfxClip.cameraOff,
            ),
      );
    } finally {
      _togglingVideo = false;
    }
  }

  Future<void> toggleSelfStream({
    required String screenShareNotificationText,
  }) async {
    final VoiceSessionState s = state;
    if (!s.isInVoice || s.channelId == null || !s.isConnected) {
      return;
    }
    if (_togglingScreenShare) {
      return;
    }
    final bool isSupported = ref
        .read(screenShareCapabilityProvider)
        .maybeWhen(data: (bool value) => value, orElse: () => false);
    if (!isSupported) {
      talker.warning(
        '[Voice] toggleSelfStream blocked: screen sharing is not supported '
        'on this platform/device.',
      );
      state = state.copyWith(
        errorMessage: kVoiceSessionErrorScreenShareUnsupported,
      );
      return;
    }
    final bool nextSelfStream = !_hasPublishedLocalScreenShareVideo(
      requireTrack: false,
    );
    final LocalParticipant? lp = s.liveKitRoom?.localParticipant;
    if (lp == null) {
      return;
    }
    talker.debug('[Voice] toggleSelfStream requested: enable=$nextSelfStream');
    _togglingScreenShare = true;
    try {
      final bool hasCapturePermission = await _requestScreenCapturePermission(
        shouldEnableScreenShare: nextSelfStream,
      );
      if (!hasCapturePermission) {
        state = state.copyWith(
          errorMessage: kVoiceSessionErrorScreenSharePermissionDenied,
        );
        return;
      }
      if (nextSelfStream) {
        final bool hasBackground = await enableAndroidScreenShareBackground(
          notificationText: screenShareNotificationText,
        );
        if (!hasBackground) {
          talker.warning(
            '[Voice] Screen-share background service could not be started.',
          );
          state = state.copyWith(
            errorMessage: kVoiceSessionErrorScreenShareToggle,
          );
          return;
        }
      }
      try {
        await lp.setScreenShareEnabled(
          nextSelfStream,
          captureScreenAudio: nextSelfStream,
        );
      } on Object catch (e, st) {
        talker.error('[Voice] setScreenShareEnabled failed', e, st);
        if (nextSelfStream) {
          await disableAndroidScreenShareBackground();
        }
        state = state.copyWith(errorMessage: _classifyScreenShareException(e));
        return;
      }
      if (!nextSelfStream) {
        await disableAndroidScreenShareBackground();
      }
      talker.debug(
        '[Voice] setScreenShareEnabled completed: enable=$nextSelfStream',
      );
      await _reconcileSelfStreamState(
        reason: nextSelfStream ? 'toggle_enable' : 'toggle_disable',
        waitForPublication: nextSelfStream,
      );
      final bool published = _hasPublishedLocalScreenShareVideo(
        requireTrack: true,
      );
      if (nextSelfStream && !published) {
        await disableAndroidScreenShareBackground();
        return;
      }
      unawaited(
        ref
            .read(fluxerSfxProvider)
            .playOneShot(
              nextSelfStream
                  ? FluxerSfxClip.streamStart
                  : FluxerSfxClip.streamStop,
            ),
      );
    } finally {
      _togglingScreenShare = false;
    }
  }

  Future<bool> _requestScreenCapturePermission({
    required bool shouldEnableScreenShare,
  }) async {
    final bool requiresCapturePermission =
        Platform.isAndroid || Platform.isMacOS;
    if (!shouldEnableScreenShare || !requiresCapturePermission) {
      return true;
    }
    final bool hasCapturePermission = await Helper.requestCapturePermission();
    if (!hasCapturePermission) {
      talker.warning('[Voice] Screen-share capture permission denied by user.');
    }
    return hasCapturePermission;
  }

  String _classifyScreenShareException(Object error) {
    final String msg = error.toString().toLowerCase();
    if (msg.contains('permission') && msg.contains('deni')) {
      return kVoiceSessionErrorScreenSharePermissionDenied;
    }
    if (msg.contains('not allowed') || msg.contains('user cancel')) {
      return kVoiceSessionErrorScreenSharePermissionDenied;
    }
    return kVoiceSessionErrorScreenShareToggle;
  }

  void reportCameraPermissionDenied() {
    state = state.copyWith(errorMessage: kVoiceSessionErrorCameraPermission);
  }

  Future<void> _applySelfVoiceState({
    required bool selfMute,
    required bool selfDeaf,
    required bool selfVideo,
  }) async {
    final VoiceSessionState s = state;
    if (!s.isInVoice || s.channelId == null) {
      return;
    }
    final String? connectionId = s.activeConnectionId;
    final VoiceState? current = _selfConnectionVoiceState();
    final bool selfStream = current?.selfStream ?? false;
    ref
        .read(gatewayConnectionProvider)
        .updateVoiceState(
          GatewayVoiceStateUpdate(
            guildId: s.guildId,
            channelId: s.channelId,
            selfMute: selfMute,
            selfDeaf: selfDeaf,
            selfVideo: selfVideo,
            selfStream: selfStream,
            connectionId: connectionId,
            isMobile:
                !Platform.isLinux && !Platform.isMacOS && !Platform.isWindows,
          ),
        );
    final Room? room = _room;
    final LocalParticipant? lp = room?.localParticipant;
    if (lp == null || !state.isConnected) {
      return;
    }
    final EffectiveAudioState audio = computeEffectiveAudioState(
      selfMute: selfMute,
      selfDeaf: selfDeaf,
      serverMute: (current?.mute ?? false) || (current?.suppress ?? false),
      serverDeaf: current?.deaf ?? false,
    );
    final bool micOn = audio.micShouldPublish && _canPublishAudioInChannel();
    try {
      await lp.setMicrophoneEnabled(micOn);
    } on Object catch (e) {
      if (isTrackPublishFailure(e)) {
        talker.warning('[Voice] setMicrophoneEnabled failed: $e');
        state = state.copyWith(errorMessage: kVoiceSessionErrorMicPublish);
      } else {
        talker.error('[Voice] setMicrophoneEnabled: $e');
      }
    }
    unawaited(
      _reconcileRemoteAudioSubscriptions(
        deaf: audio.effectiveDeaf,
        reason: 'self_voice_state',
      ),
    );
  }

  Future<void> _applySelfStreamState({required bool selfStream}) async {
    final VoiceSessionState s = state;
    if (!s.isInVoice || s.channelId == null) {
      return;
    }
    final VoiceState? current = _selfConnectionVoiceState();
    if (current?.selfStream == selfStream) {
      return;
    }
    ref
        .read(gatewayConnectionProvider)
        .updateVoiceState(
          GatewayVoiceStateUpdate(
            guildId: s.guildId,
            channelId: s.channelId,
            selfMute: current?.selfMute ?? false,
            selfDeaf: current?.selfDeaf ?? false,
            selfVideo: current?.selfVideo ?? false,
            selfStream: selfStream,
            connectionId: s.activeConnectionId,
            isMobile:
                !Platform.isLinux && !Platform.isMacOS && !Platform.isWindows,
          ),
        );
  }

  bool _hasPublishedLocalScreenShareVideo({required bool requireTrack}) {
    final LocalParticipant? lp = state.liveKitRoom?.localParticipant;
    if (lp == null) {
      return false;
    }
    for (final LocalTrackPublication<LocalVideoTrack> publication
        in lp.videoTrackPublications) {
      if (!publication.isScreenShare || publication.muted) {
        continue;
      }
      if (requireTrack && publication.track == null) {
        continue;
      }
      return true;
    }
    return false;
  }

  Future<void> _reconcileSelfStreamState({
    required String reason,
    bool waitForPublication = false,
  }) async {
    if (_reconcilingSelfStream) {
      return;
    }
    _reconcilingSelfStream = true;
    try {
      if (waitForPublication) {
        for (int i = 0; i < 15; i++) {
          if (_hasPublishedLocalScreenShareVideo(requireTrack: true)) {
            break;
          }
          await Future<void>.delayed(const Duration(milliseconds: 200));
        }
      }
      final bool actualSelfStream = _hasPublishedLocalScreenShareVideo(
        requireTrack: false,
      );
      final bool currentSelfStream =
          _selfConnectionVoiceState()?.selfStream ?? false;
      if (actualSelfStream == currentSelfStream) {
        return;
      }
      talker.debug(
        '[Voice] selfStream reconcile ($reason): '
        '$currentSelfStream -> $actualSelfStream',
      );
      await _applySelfStreamState(selfStream: actualSelfStream);
    } finally {
      _reconcilingSelfStream = false;
    }
  }

  void _handleLocalParticipantChanged() {
    unawaited(_reconcileSelfStreamState(reason: 'local_participant_changed'));
  }

  void _attachLocalParticipantListener(LocalParticipant? participant) {
    if (participant == _observedLocalParticipant) {
      return;
    }
    _detachLocalParticipantListener();
    if (participant == null) {
      return;
    }
    _observedLocalParticipant = participant;
    participant.addListener(_handleLocalParticipantChanged);
  }

  void _detachLocalParticipantListener() {
    final LocalParticipant? participant = _observedLocalParticipant;
    if (participant == null) {
      return;
    }
    participant.removeListener(_handleLocalParticipantChanged);
    _observedLocalParticipant = null;
  }

  bool _isLatestRoomAttempt(int attempt) {
    return attempt == _connectGeneration && attempt == _boundRoomAttemptId;
  }

  void _cancelDeferredServerDisconnect() {
    _deferredServerDisconnectTimer?.cancel();
    _deferredServerDisconnectTimer = null;
    _pendingServerDisconnectConnectionId = null;
  }

  void _scheduleDeferredServerDisconnect(String connectionId) {
    _cancelDeferredServerDisconnect();
    if (!state.isConnected && !state.isConnecting) {
      return;
    }
    _pendingServerDisconnectConnectionId = connectionId;
    _deferredServerDisconnectTimer = Timer(
      _kDeferredServerDisconnectDuration,
      () {
        if (_pendingServerDisconnectConnectionId != connectionId) {
          return;
        }
        if (state.activeConnectionId != connectionId) {
          return;
        }
        if (!state.isConnected) {
          return;
        }
        talker.info(
          '[Voice] Deferred server disconnect executing '
          '(connectionId=$connectionId).',
        );
        unawaited(leaveVoice(endCall: false));
      },
    );
  }

  Future<void> _onLiveKitRoomConnected({
    required Room room,
    required int attempt,
    required String resolvedChannelId,
    required String? resolvedGuildId,
    required String connectionId,
  }) async {
    if (!_isLatestRoomAttempt(attempt)) {
      return;
    }
    if (state.isConnected && state.channelId == resolvedChannelId) {
      unawaited(
        _reconcileLocalAudioPublish(reason: 'room_connected_duplicate'),
      );
      return;
    }
    _attachLocalParticipantListener(room.localParticipant);
    state = state.copyWith(
      isConnecting: false,
      isConnected: true,
      isReconnecting: false,
      channelId: resolvedChannelId,
      guildId: resolvedGuildId,
      activeConnectionId: connectionId,
      clearError: true,
    );
    SchedulerBinding.instance.addPostFrameCallback((_) {
      unawaited(
        ref.read(fluxerSfxProvider).playOneShot(FluxerSfxClip.userJoin),
      );
    });
    if (_pendingRingAfterConnect) {
      unawaited(
        _ringAfterConnect(resolvedChannelId, silently: _pendingRingSilently),
      );
      _pendingRingAfterConnect = false;
      _pendingRingSilently = false;
    }
    await _subscribeExistingRemoteAudio(room);
    unawaited(
      _ensureLocalMicrophone(reason: 'room_connected', attempt: attempt),
    );
  }

  Future<void> _subscribeExistingRemoteAudio(Room room) async {
    final VoiceState? selfVs = _selfConnectionVoiceState();
    final EffectiveAudioState audio = effectiveAudioStateFromVoiceState(
      voiceState: selfVs,
      fallbackSelfMute: _lobbySelfMute,
      fallbackSelfDeaf: _lobbySelfDeaf,
    );
    if (audio.effectiveDeaf) {
      return;
    }
    for (final RemoteParticipant participant
        in room.remoteParticipants.values) {
      for (final RemoteTrackPublication publication
          in participant.audioTrackPublications) {
        if (publication.source == TrackSource.microphone) {
          try {
            await publication.subscribe();
          } on Object catch (e) {
            talker.warning(
              '[Voice] Failed to subscribe remote mic '
              '(participant=${participant.identity}): $e',
            );
          }
        }
      }
    }
  }

  Future<void> _subscribeRemotePublicationIfNeeded(
    RemoteTrackPublication publication,
  ) async {
    if (publication.source != TrackSource.microphone) {
      return;
    }
    final VoiceState? selfVs = _selfConnectionVoiceState();
    final EffectiveAudioState audio = effectiveAudioStateFromVoiceState(
      voiceState: selfVs,
      fallbackSelfMute: _lobbySelfMute,
      fallbackSelfDeaf: _lobbySelfDeaf,
    );
    if (audio.effectiveDeaf) {
      return;
    }
    try {
      await publication.subscribe();
    } on Object catch (e) {
      talker.warning('[Voice] Failed to subscribe remote track: $e');
    }
  }

  Future<void> _reconcileRemoteAudioSubscriptions({
    required bool deaf,
    required String reason,
  }) async {
    final Room? room = state.liveKitRoom;
    if (room == null || !state.isConnected) {
      return;
    }
    for (final RemoteParticipant participant
        in room.remoteParticipants.values) {
      for (final RemoteTrackPublication publication
          in participant.audioTrackPublications) {
        if (publication.source != TrackSource.microphone) {
          continue;
        }
        try {
          if (deaf && publication.subscribed) {
            await publication.unsubscribe();
          } else if (!deaf && !publication.subscribed) {
            await publication.subscribe();
          }
        } on Object catch (e) {
          talker.warning(
            '[Voice] Failed to reconcile remote audio ($reason, '
            'participant=${participant.identity}): $e',
          );
        }
      }
    }
  }

  Future<void> _ensureLocalMicrophone({
    required String reason,
    required int attempt,
  }) async {
    if (!_isLatestRoomAttempt(attempt) || !state.isConnected) {
      return;
    }
    if (_ensuringMicrophone) {
      return;
    }
    _ensuringMicrophone = true;
    try {
      await _reconcileLocalAudioPublish(reason: reason, attempt: attempt);
    } finally {
      _ensuringMicrophone = false;
    }
  }

  Future<void> _reconcileLocalAudioPublish({
    required String reason,
    int? attempt,
  }) async {
    final Room? room = state.liveKitRoom;
    final LocalParticipant? lp = room?.localParticipant;
    if (room == null || lp == null || !state.isConnected) {
      return;
    }
    if (attempt != null && !_isLatestRoomAttempt(attempt)) {
      return;
    }
    if (!_canPublishAudioInChannel()) {
      await lp.setMicrophoneEnabled(false);
      final VoiceState? vs = _selfConnectionVoiceState();
      if (vs != null && !vs.selfMute) {
        await _applySelfVoiceState(
          selfMute: true,
          selfDeaf: vs.selfDeaf,
          selfVideo: vs.selfVideo,
        );
      }
      return;
    }
    final VoiceState? vs = _selfConnectionVoiceState();
    final EffectiveAudioState audio = effectiveAudioStateFromVoiceState(
      voiceState: vs,
      fallbackSelfMute: _lobbySelfMute,
      fallbackSelfDeaf: _lobbySelfDeaf,
    );
    talker.debug(
      '[Voice] Reconcile audio ($reason): micShouldPublish=${audio.micShouldPublish} '
      'effectiveMute=${audio.effectiveMute}',
    );
    if (!audio.micShouldPublish) {
      await lp.setMicrophoneEnabled(false);
      return;
    }
    Object? lastError;
    for (int i = 0; i <= _kMicPublishRetryDelays.length; i++) {
      if (attempt != null && !_isLatestRoomAttempt(attempt)) {
        return;
      }
      try {
        await lp.setMicrophoneEnabled(true);
        if (state.errorMessage == kVoiceSessionErrorMicPublish) {
          state = state.copyWith(clearError: true);
        }
        return;
      } on Object catch (e) {
        lastError = e;
        if (!isTrackPublishFailure(e)) {
          rethrow;
        }
        if (i < _kMicPublishRetryDelays.length) {
          talker.warning(
            '[Voice] Mic publish retry ${i + 1} after failure: $e',
          );
          await Future<void>.delayed(_kMicPublishRetryDelays[i]);
        }
      }
    }
    talker.warning(
      '[Voice] Microphone publish failed (staying in channel listen-only): '
      '$lastError',
    );
    await lp.setMicrophoneEnabled(false);
    final VoiceState? current = _selfConnectionVoiceState();
    await _applySelfVoiceState(
      selfMute: true,
      selfDeaf: current?.selfDeaf ?? _lobbySelfDeaf,
      selfVideo: current?.selfVideo ?? false,
    );
    state = state.copyWith(errorMessage: kVoiceSessionErrorMicPublish);
  }

  bool _canPublishAudioInChannel() {
    final String? channelId = state.channelId;
    final String? guildId = state.guildId;
    if (channelId == null) {
      return true;
    }
    if (guildId == null) {
      return true;
    }
    final int? bits = ref
        .read(channelPermissionCacheProvider.notifier)
        .getChannelBits(channelId);
    if (bits == null) {
      return true;
    }
    return hasPermission(bits, Permission.speak);
  }

  Future<void> _onChannelPermissionsChanged() async {
    if (!state.isConnected || state.channelId == null) {
      return;
    }
    await _reconcileLocalAudioPublish(reason: 'permission_cache_changed');
  }

  void _bindVoiceRoomEvents({
    required Room room,
    required int attempt,
    required String resolvedChannelId,
    required String? resolvedGuildId,
    required String connectionId,
  }) {
    _detachRoomEventsListener();
    _boundRoomAttemptId = attempt;
    final EventsListener<RoomEvent> listener = room.createListener();
    _roomEventsListener = listener;
    final String? selfIdentity = room.localParticipant?.identity;
    listener
      ..on<RoomConnectedEvent>((RoomConnectedEvent evt) {
        if (!_isLatestRoomAttempt(attempt) || _intentionalLiveKitTeardown) {
          return;
        }
        unawaited(
          _onLiveKitRoomConnected(
            room: room,
            attempt: attempt,
            resolvedChannelId: resolvedChannelId,
            resolvedGuildId: resolvedGuildId,
            connectionId: connectionId,
          ),
        );
      })
      ..on<RoomDisconnectedEvent>((RoomDisconnectedEvent evt) {
        if (!_isLatestRoomAttempt(attempt) || _intentionalLiveKitTeardown) {
          return;
        }
        talker.warning('[Voice] LiveKit room disconnected: ${evt.reason}');
        unawaited(leaveVoice(endCall: false));
      })
      ..on<RoomReconnectingEvent>((RoomReconnectingEvent _) {
        if (!_isLatestRoomAttempt(attempt)) {
          return;
        }
        state = state.copyWith(isReconnecting: true);
      })
      ..on<RoomReconnectedEvent>((RoomReconnectedEvent _) {
        if (!_isLatestRoomAttempt(attempt)) {
          return;
        }
        state = state.copyWith(isReconnecting: false);
        unawaited(_subscribeExistingRemoteAudio(room));
        unawaited(
          _reconcileLocalAudioPublish(
            reason: 'room_reconnected',
            attempt: attempt,
          ),
        );
      })
      ..on<TrackPublishedEvent>((TrackPublishedEvent evt) {
        if (!_isLatestRoomAttempt(attempt) || _intentionalLiveKitTeardown) {
          return;
        }
        unawaited(_subscribeRemotePublicationIfNeeded(evt.publication));
      })
      ..on<ParticipantConnectedEvent>((ParticipantConnectedEvent evt) {
        if (_intentionalLiveKitTeardown) {
          return;
        }
        if (selfIdentity != null && evt.participant.identity == selfIdentity) {
          return;
        }
        final bool isUserParticipant = evt.participant.identity.startsWith(
          'user_',
        );
        unawaited(
          ref
              .read(fluxerSfxProvider)
              .playOneShot(
                isUserParticipant
                    ? FluxerSfxClip.userJoin
                    : FluxerSfxClip.viewerJoin,
              ),
        );
      })
      ..on<ParticipantDisconnectedEvent>((ParticipantDisconnectedEvent evt) {
        if (_intentionalLiveKitTeardown) {
          return;
        }
        if (selfIdentity != null && evt.participant.identity == selfIdentity) {
          return;
        }
        final bool isUserParticipant = evt.participant.identity.startsWith(
          'user_',
        );
        unawaited(
          ref
              .read(fluxerSfxProvider)
              .playOneShot(
                isUserParticipant
                    ? FluxerSfxClip.userLeave
                    : FluxerSfxClip.viewerLeave,
              ),
        );
      });
  }

  void _detachRoomEventsListener() {
    _boundRoomAttemptId = null;
    final EventsListener<RoomEvent>? listener = _roomEventsListener;
    _roomEventsListener = null;
    if (listener != null) {
      unawaited(listener.dispose());
    }
  }

  void updateViewerStreamKeys(List<String> viewerStreamKeys) {
    final VoiceSessionState s = state;
    if (!s.isInVoice || s.channelId == null) {
      return;
    }
    final VoiceState? current = _selfConnectionVoiceState();
    ref
        .read(gatewayConnectionProvider)
        .updateVoiceState(
          GatewayVoiceStateUpdate(
            guildId: s.guildId,
            channelId: s.channelId,
            selfMute: current?.selfMute ?? false,
            selfDeaf: current?.selfDeaf ?? false,
            selfVideo: current?.selfVideo ?? false,
            selfStream: current?.selfStream ?? false,
            viewerStreamKeys: viewerStreamKeys,
            connectionId: s.activeConnectionId,
            isMobile:
                !Platform.isLinux && !Platform.isMacOS && !Platform.isWindows,
          ),
        );
  }

  Future<void> refreshLocalCameraAfterOrientationChange() async {
    final Room? room = state.liveKitRoom;
    if (room == null || !state.isConnected) {
      return;
    }
    final DateTime now = DateTime.now();
    if (_lastCameraOrientationRefresh != null) {
      if (now.difference(_lastCameraOrientationRefresh!) <
          const Duration(milliseconds: 300)) {
        return;
      }
    }
    _lastCameraOrientationRefresh = now;
    final LocalParticipant? lp = room.localParticipant;
    if (lp == null) {
      return;
    }
    final CameraCaptureOptions opts =
        room.roomOptions.defaultCameraCaptureOptions;
    for (final LocalTrackPublication<LocalVideoTrack> pub
        in lp.videoTrackPublications) {
      if (pub.isScreenShare) {
        continue;
      }
      final LocalVideoTrack? track = pub.track;
      if (track == null) {
        continue;
      }
      try {
        await track.restartTrack(opts);
      } on Object catch (e) {
        talker.warning('[Voice] restartTrack after orientation: $e');
      }
      return;
    }
  }
}
