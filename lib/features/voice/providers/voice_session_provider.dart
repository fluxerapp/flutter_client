import 'dart:async';
import 'dart:io';

import 'package:flutter/scheduler.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart';
import 'package:fluxer_app/core/api/fluxer_client_provider.dart';
import 'package:fluxer_app/core/audio/enums/fluxer_sfx_clip.dart';
import 'package:fluxer_app/core/permissions/channel_permission_cache_provider.dart';
import 'package:fluxer_app/core/permissions/channel_permission_reads.dart';
import 'package:fluxer_app/core/permissions/permission.dart';
import 'package:fluxer_app/core/platform/fluxer_platform.dart';
import 'package:fluxer_app/core/providers/fluxer_sfx_provider.dart';
import 'package:fluxer_app/core/providers/gateway_connection_provider.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/core/system_permissions/system_permission_kind.dart';
import 'package:fluxer_app/core/system_permissions/system_permission_result.dart';
import 'package:fluxer_app/core/system_permissions/system_permission_service.dart';
import 'package:fluxer_app/core/talker.dart';
import 'package:fluxer_app/features/gateway/providers/gateway_event_providers.dart';
import 'package:fluxer_app/features/guilds/providers/guild_list_view_model.dart';
import 'package:fluxer_app/features/settings/providers/sound_preferences_provider.dart';
import 'package:fluxer_app/features/settings/providers/voice_settings_provider.dart';
import 'package:fluxer_app/features/settings/utils/sound_sfx_playback.dart';
import 'package:fluxer_app/features/voice/domain/voice_connect_failed_target.dart';
import 'package:fluxer_app/features/voice/domain/voice_settings_state.dart';
import 'package:fluxer_app/features/voice/providers/local_voice_state_provider.dart';
import 'package:fluxer_app/features/voice/providers/screen_share_capability_provider.dart';
import 'package:fluxer_app/features/voice/providers/voice_call_display_preferences_provider.dart';
import 'package:fluxer_app/features/voice/providers/voice_call_layout_provider.dart';
import 'package:fluxer_app/features/voice/providers/voice_noise_filter_provider.dart';
import 'package:fluxer_app/features/voice/providers/voice_screen_share_watch_tile_provider.dart';
import 'package:fluxer_app/features/voice/providers/voice_session_state.dart';
import 'package:fluxer_app/features/voice/services/voice_settings_applicator.dart';
import 'package:fluxer_app/features/voice/utils/android_screen_share_background.dart';
import 'package:fluxer_app/features/voice/utils/channel_e2ee_status.dart';
import 'package:fluxer_app/features/voice/utils/microphone_permission.dart';
import 'package:fluxer_app/features/voice/utils/voice_camera_platform.dart';
import 'package:fluxer_app/features/voice/utils/voice_channel_join_guard.dart';
import 'package:fluxer_app/features/voice/utils/voice_connection_voice_state.dart';
import 'package:fluxer_app/features/voice/utils/voice_effective_audio_state.dart';
import 'package:fluxer_app/features/voice/utils/voice_participant_volume_utils.dart';
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
const int _kScreenSharePublicationWaitIterations = 50;
const Duration _kScreenSharePublicationWaitInterval = Duration(
  milliseconds: 200,
);
const Timeouts _kE2eeConnectTimeouts = Timeouts(
  connection: Duration(seconds: 20),
  debounce: Duration(milliseconds: 20),
  publish: Duration(seconds: 30),
  subscribe: Duration(seconds: 15),
  peerConnection: Duration(seconds: 30),
  iceRestart: Duration(seconds: 15),
);
const Duration _kLiveKitConnectWatchdogDuration = Duration(seconds: 35);

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
  Timer? _liveKitConnectWatchdogTimer;
  int _liveKitConnectWatchdogArmedGeneration = 0;
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
  Room? _managedLiveKitRoom;
  String? _voiceMovePreviousChannelId;
  bool _intentionalLiveKitTeardown = false;
  ChannelE2eeStatus? _lastLoggedE2eeChannelStatus;
  Future<void>? _connectLiveKitInFlight;
  Timer? _deferredServerDisconnectTimer;
  String? _pendingServerDisconnectConnectionId;
  int? _boundRoomAttemptId;
  bool _pendingSelfMute = false;
  bool _pendingSelfDeaf = false;
  bool _ensuringMicrophone = false;

  @override
  VoiceSessionState build() {
    ref
      ..onDispose(_teardownOnDispose)
      ..listen<ChannelPermissionCaches>(channelPermissionCacheProvider, (
        ChannelPermissionCaches? _,
        ChannelPermissionCaches _,
      ) {
        unawaited(_onChannelPermissionsChanged());
      })
      ..listen<VoiceSettingsState>(voiceSettingsProvider, (
        VoiceSettingsState? previous,
        VoiceSettingsState next,
      ) {
        if (previous == next) {
          return;
        }
        unawaited(_onVoiceSettingsChanged(previous, next));
      })
      ..read(voiceNoiseFilterProvider);
    return const VoiceSessionState();
  }

  void _cancelConnectWatchdog() {
    _connectWatchdogTimer?.cancel();
    _connectWatchdogTimer = null;
  }

  void _cancelLiveKitConnectWatchdog() {
    _liveKitConnectWatchdogTimer?.cancel();
    _liveKitConnectWatchdogTimer = null;
  }

  void _armLiveKitConnectWatchdog(int generation) {
    _cancelLiveKitConnectWatchdog();
    _liveKitConnectWatchdogArmedGeneration = generation;
    _liveKitConnectWatchdogTimer = Timer(_kLiveKitConnectWatchdogDuration, () {
      if (_liveKitConnectWatchdogArmedGeneration != generation) {
        return;
      }
      if (_connectGeneration != generation) {
        return;
      }
      if (!state.isConnecting || state.isConnected) {
        return;
      }
      talker.warning(
        '[Voice] LiveKit connect timed out after '
        '${_kLiveKitConnectWatchdogDuration.inSeconds}s '
        '(generation=$generation, channelId=${state.channelId}).',
      );
      unawaited(
        _handleLiveKitConnectFailure(
          generation: generation,
          errorMessage: kVoiceSessionErrorTransportFailed,
          reason: 'livekit_watchdog',
        ),
      );
    });
  }

  bool _isRoomConnected() {
    final Room? room = state.liveKitRoom;
    return room != null && room.connectionState == ConnectionState.connected;
  }

  bool _hasLiveKitRoom() => state.liveKitRoom != null;

  bool _hasLiveConnectionToChannel(String channelId) {
    return voiceSessionHasLiveConnection(
      state: state,
      channelId: channelId,
      hasLiveKitRoom: _hasLiveKitRoom(),
      isRoomConnected: _isRoomConnected(),
    );
  }

  bool _shouldSkipDuplicateJoin(String channelId) {
    return shouldSkipVoiceChannelJoin(
      state: state,
      channelId: channelId,
      hasLiveKitRoom: _hasLiveKitRoom(),
      isRoomConnected: _isRoomConnected(),
      expectedChannelId: _expectedChannelId,
      liveKitConnectInFlight: _connectLiveKitInFlight != null,
    );
  }

  Future<void> _clearStaleVoiceSessionIfNeeded(String channelId) async {
    if (!shouldClearStaleVoiceSession(
      state: state,
      channelId: channelId,
      hasLiveKitRoom: _hasLiveKitRoom(),
      isRoomConnected: _isRoomConnected(),
      expectedChannelId: _expectedChannelId,
      liveKitConnectInFlight: _connectLiveKitInFlight != null,
    )) {
      return;
    }
    talker.warning(
      '[Voice] Clearing stale voice session before reconnect '
      '(channelId=$channelId, isConnected=${state.isConnected}, '
      'isConnecting=${state.isConnecting}, '
      'room=${state.liveKitRoom?.connectionState.name ?? 'null'}).',
    );
    await leaveVoice(endCall: false);
  }

  Future<void> _handleLiveKitConnectFailure({
    required int generation,
    required String errorMessage,
    required String reason,
  }) async {
    if (generation != _connectGeneration) {
      return;
    }
    _cancelLiveKitConnectWatchdog();
    _cancelConnectWatchdog();
    _connectGeneration++;
    _expectedGuildId = null;
    _expectedChannelId = null;
    _pendingRingAfterConnect = false;
    _pendingRingSilently = false;
    _outboundRingRecipients = null;
    _resetPendingSelfAudioFlags();
    final String? channelId = state.channelId;
    final String? guildId = state.guildId;
    final String? connectionId = state.activeConnectionId;
    if (channelId != null) {
      _clearOutgoingCallInitiator(channelId);
    }
    _detachRoomEventsListener();
    _detachLocalParticipantListener();
    final Room? roomToDisconnect = _managedLiveKitRoom ?? state.liveKitRoom;
    _managedLiveKitRoom = null;
    if (roomToDisconnect != null) {
      _sendVoiceDisconnectState(guildId: guildId, connectionId: connectionId);
      await _disconnectAndDisposeRoom(roomToDisconnect, reason: reason);
    }
    state = state.copyWith(
      isConnecting: false,
      isConnected: false,
      isReconnecting: false,
      errorMessage: errorMessage,
      clearRoom: true,
      clearActiveConnectionId: true,
      clearE2eeKey: true,
      connectFailed: true,
      connectFailedTarget: channelId == null
          ? null
          : VoiceConnectFailedTarget(channelId: channelId, guildId: guildId),
      guildId: guildId,
      channelId: channelId,
    );
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
      _resetPendingSelfAudioFlags();
      _clearOutgoingCallInitiator(_expectedChannelId);
      _detachLocalParticipantListener();
      unawaited(_disconnectRoomOnly());
      state = state.copyWith(
        isConnecting: false,
        isConnected: false,
        errorMessage: 'Voice connection timed out.',
        clearRoom: true,
        clearChannel: true,
        clearActiveConnectionId: true,
      );
    });
  }

  void _resetPendingSelfAudioFlags() {
    final local = ref.read(localVoiceStateProvider);
    _pendingSelfMute = local.selfMute;
    _pendingSelfDeaf = local.selfDeaf;
  }

  void _syncPendingSelfAudioFlags({
    required bool selfMute,
    required bool selfDeaf,
  }) {
    _pendingSelfMute = selfMute;
    _pendingSelfDeaf = selfDeaf;
  }

  EffectiveAudioState _effectiveAudioStateForSelfConnection() {
    return effectiveAudioStateFromVoiceState(
      voiceState: _selfConnectionVoiceState(),
      fallbackSelfMute: _pendingSelfMute,
      fallbackSelfDeaf: _pendingSelfDeaf,
    );
  }

  Future<void> _reconcileRemoteAudioForSelfConnection({
    required String reason,
  }) async {
    final EffectiveAudioState audio = _effectiveAudioStateForSelfConnection();
    await _reconcileRemoteAudioSubscriptions(
      deaf: audio.effectiveDeaf,
      reason: reason,
    );
  }

  Room? get _room => state.liveKitRoom;

  void reportJoinError(String errorMessage) {
    final String? channelId = state.channelId ?? _expectedChannelId;
    final String? guildId = state.guildId ?? _expectedGuildId;
    state = state.copyWith(
      errorMessage: errorMessage,
      isConnecting: false,
      isConnected: false,
      connectFailed: channelId != null,
      connectFailedTarget: channelId == null
          ? null
          : VoiceConnectFailedTarget(channelId: channelId, guildId: guildId),
    );
  }

  Future<void> retryFailedVoiceConnection() async {
    final VoiceConnectFailedTarget? target = state.connectFailedTarget;
    if (target == null) {
      return;
    }
    state = state.copyWith(
      clearError: true,
      clearConnectFailed: true,
      clearConnectFailedTarget: true,
    );
    await connectToVoiceChannel(
      guildId: target.guildId,
      channelId: target.channelId,
      forceJoin: true,
    );
  }

  void dismissFailedVoiceConnection() {
    if (!state.connectFailed) {
      return;
    }
    state = state.copyWith(
      clearError: true,
      clearChannel: true,
      clearConnectFailed: true,
      clearConnectFailedTarget: true,
    );
  }

  /// Joins a voice channel; the gateway responds with [VoiceServerUpdateEvent],
  /// which is forwarded to [handleVoiceServerUpdate].
  ///
  /// [ringSilently] (with [startOutgoingCall]): POST
  /// ring with an empty recipient list.
  Future<bool> connectToVoiceChannel({
    required String? guildId,
    required String channelId,
    bool startOutgoingCall = false,
    bool ringSilently = false,
    List<String>? outboundRingRecipients,
    bool initialSelfMute = false,
    bool initialSelfDeaf = false,
    bool initialSelfVideo = false,
    bool forceJoin = false,
  }) async {
    _startWithVideoAfterConnect = false;
    talker.info(
      '[Voice] Join requested (guildId=$guildId, channelId=$channelId, '
      'startOutgoingCall=$startOutgoingCall, forceJoin=$forceJoin).',
    );
    if (forceJoin) {
      await _clearStaleVoiceSessionIfNeeded(channelId);
      if (_hasLiveConnectionToChannel(channelId)) {
        talker.info(
          '[Voice] Force join skipped: already live on channelId=$channelId.',
        );
        return true;
      }
      if (voiceSessionIsJoinInFlight(
        state: state,
        channelId: channelId,
        expectedChannelId: _expectedChannelId,
        liveKitConnectInFlight: _connectLiveKitInFlight != null,
      )) {
        talker.warning(
          '[Voice] Force join: clearing in-flight session for '
          'channelId=$channelId.',
        );
        await leaveVoice(endCall: false);
      }
    } else if (_shouldSkipDuplicateJoin(channelId)) {
      if (_hasLiveConnectionToChannel(channelId)) {
        talker.info(
          '[Voice] Join skipped: already connected to channelId=$channelId.',
        );
      } else {
        talker.info(
          '[Voice] Join skipped: join already in progress for '
          'channelId=$channelId.',
        );
      }
      return false;
    }
    if (!forceJoin) {
      await _clearStaleVoiceSessionIfNeeded(channelId);
    }
    final bool micOk = await _ensureSystemPermissionForVoice(
      SystemPermissionKind.microphone,
      deniedErrorCode: kVoiceSessionErrorMicPermission,
    );
    if (!micOk) {
      talker.warning(
        '[Voice] Join aborted: microphone permission denied '
        '(channelId=$channelId).',
      );
      return false;
    }
    if (guildId != null) {
      int? permissionBits = ref
          .read(channelPermissionCacheProvider.notifier)
          .getChannelBits(channelId);
      if (permissionBits == null) {
        await ref
            .read(channelPermissionCacheProvider.notifier)
            .rebuildChannel(channelId);
        if (!ref.mounted) {
          return false;
        }
        permissionBits = ref
            .read(channelPermissionCacheProvider.notifier)
            .getChannelBits(channelId);
      }
      final int localConnectBits = await readLocalGuildChannelPermissionBitsRef(
        ref: ref,
        channelId: channelId,
      );
      if (!ref.mounted) {
        return false;
      }
      if (!hasPermission(localConnectBits, Permission.connect)) {
        talker.warning(
          '[Voice] Join aborted: missing Connect permission '
          '(channelId=$channelId, guildId=$guildId).',
        );
        state = state.copyWith(
          errorMessage: kVoiceSessionErrorNoConnectPermission,
        );
        return false;
      }
    }
    final DateTime now = DateTime.now();
    if (!forceJoin &&
        _lastConnectRequestAt != null &&
        now.difference(_lastConnectRequestAt!) < const Duration(seconds: 1)) {
      talker.warning(
        '[Voice] Connect request throttled (< 1s since last attempt).',
      );
      return false;
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
      return false;
    }
    _lastConnectRequestAt = now;
    _startWithVideoAfterConnect = initialSelfVideo;
    final local = ref.read(localVoiceStateProvider);
    bool resolvedSelfMute = initialSelfDeaf || initialSelfMute;
    bool resolvedSelfDeaf = initialSelfDeaf;
    if (!initialSelfMute && !initialSelfDeaf) {
      resolvedSelfMute = local.selfDeaf || local.selfMute;
      resolvedSelfDeaf = local.selfDeaf;
    }
    if (guildId != null) {
      final int? permissionBits = ref
          .read(channelPermissionCacheProvider.notifier)
          .getChannelBits(channelId);
      if (permissionBits != null &&
          !hasPermission(permissionBits, Permission.speak)) {
        resolvedSelfMute = true;
      }
    }
    _pendingSelfMute = resolvedSelfMute;
    _pendingSelfDeaf = resolvedSelfDeaf;
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
        isMobile: isFluxerMobileOs,
      ),
    );
    talker.info(
      '[Voice] Voice join opcode sent (channelId=$channelId, '
      'guildId=$_expectedGuildId, generation=$_connectGeneration).',
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
        clearChannel: true,
        clearActiveConnectionId: true,
        clearRoom: true,
      );
      return false;
    }
    _armConnectWatchdog(_connectGeneration);
    return true;
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
    if (shouldIgnoreVoiceServerUpdateWhenConnected(
      state: state,
      resolvedChannelId: resolvedChannelId,
      hasLiveKitRoom: _hasLiveKitRoom(),
      isRoomConnected: _isRoomConnected(),
    )) {
      talker.info(
        '[Voice] Ignoring VOICE_SERVER_UPDATE: already connected to '
        'channelId=$resolvedChannelId.',
      );
      return;
    }
    if (isDuplicateVoiceServerUpdateInFlight(
      state: state,
      connectionId: event.connectionId,
      endpoint: event.endpoint,
    )) {
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
    _cancelLiveKitConnectWatchdog();
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
    _syncPendingSelfAudioFlags(
      selfMute: voiceState.selfMute,
      selfDeaf: voiceState.selfDeaf,
    );
    if (state.isConnected || state.isConnecting) {
      unawaited(
        _reconcileRemoteAudioSubscriptions(
          deaf: effectiveAudioStateFromVoiceState(
            voiceState: voiceState,
            fallbackSelfMute: _pendingSelfMute,
            fallbackSelfDeaf: _pendingSelfDeaf,
          ).effectiveDeaf,
          reason: 'voice_state_update',
        ),
      );
    }
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
    _resetPendingSelfAudioFlags();
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
      clearChannel: true,
      clearActiveConnectionId: true,
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
    if (_hasLiveConnectionToChannel(resolvedChannelId)) {
      talker.info(
        '[Voice] Skipping LiveKit reconnect: already connected to '
        'channelId=$resolvedChannelId.',
      );
      return;
    }
    await _disconnectRoomOnly();
    if (attempt != _connectGeneration) {
      return;
    }
    if (moveFromChannelId != null &&
        moveFromChannelId.isNotEmpty &&
        moveFromChannelId != resolvedChannelId) {
      unawaited(
        playFluxerSoundEffect(
          prefs: ref.read(soundPreferencesProvider),
          sfx: ref.read(fluxerSfxProvider),
          clip: FluxerSfxClip.userMove,
        ),
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
    final VoiceSettingsState voiceSettings = ref.read(voiceSettingsProvider);
    final VoiceSettingsApplicator applicator = ref.read(
      voiceSettingsApplicatorProvider,
    );
    final RoomOptions baseRoomOptions = applicator.buildRoomOptions(
      voiceSettings,
    );
    final RoomOptions roomOptions = RoomOptions(
      adaptiveStream: baseRoomOptions.adaptiveStream,
      dynacast: baseRoomOptions.dynacast,
      encryption: keyProvider != null
          ? E2EEOptions(keyProvider: keyProvider)
          : null,
      defaultAudioCaptureOptions: baseRoomOptions.defaultAudioCaptureOptions,
      defaultCameraCaptureOptions: baseRoomOptions.defaultCameraCaptureOptions,
      defaultScreenShareCaptureOptions:
          baseRoomOptions.defaultScreenShareCaptureOptions,
    );
    final Room room = Room(roomOptions: roomOptions);
    _managedLiveKitRoom = room;
    if (attempt != _connectGeneration) {
      talker.warning(
        '[Voice] LiveKit connect superseded after room creation '
        '(attempt=$attempt, generation=$_connectGeneration).',
      );
      _managedLiveKitRoom = null;
      await _disconnectAndDisposeRoom(room, reason: 'superseded_after_create');
      if (identical(state.liveKitRoom, room)) {
        state = state.copyWith(clearRoom: true);
      }
      return;
    }
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
    _armLiveKitConnectWatchdog(attempt);
    try {
      try {
        await room.prepareConnection(event.endpoint, event.token);
      } on Object catch (e) {
        talker.debug('[Voice] prepareConnection failed (non-fatal): $e');
      }
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
        if (identical(_managedLiveKitRoom, room)) {
          _managedLiveKitRoom = null;
        }
        if (identical(state.liveKitRoom, room)) {
          state = state.copyWith(clearRoom: true);
        }
        return;
      }
      if (room.connectionState == ConnectionState.connected) {
        _cancelLiveKitConnectWatchdog();
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
      if (attempt == _connectGeneration) {
        _startWithVideoAfterConnect = false;
        await _handleLiveKitConnectFailure(
          generation: attempt,
          errorMessage: kVoiceSessionErrorTransportFailed,
          reason: 'livekit_connect',
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
    final SystemPermissionOutcome cameraOutcome = await requestSystemPermission(
      SystemPermissionKind.camera,
    );
    if (cameraOutcome != SystemPermissionOutcome.granted ||
        attempt != _connectGeneration) {
      if (attempt == _connectGeneration) {
        if (cameraOutcome == SystemPermissionOutcome.denied) {
          state = state.copyWith(
            errorMessage: kVoiceSessionErrorCameraPermission,
          );
        } else if (cameraOutcome == SystemPermissionOutcome.requiresSettings) {
          await ensureSystemPermission(
            resolveSystemPermissionContext(null),
            SystemPermissionKind.camera,
          );
        }
      }
      return;
    }
    _togglingVideo = true;
    try {
      try {
        await lp.setCameraEnabled(
          true,
          cameraCaptureOptions: _cameraCaptureOptions(),
        );
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
        playFluxerSoundEffect(
          prefs: ref.read(soundPreferencesProvider),
          sfx: ref.read(fluxerSfxProvider),
          clip: FluxerSfxClip.cameraOn,
        ),
      );
    } finally {
      _togglingVideo = false;
    }
  }

  Future<void> leaveVoice({bool endCall = true}) async {
    _cancelConnectWatchdog();
    _cancelLiveKitConnectWatchdog();
    _cancelDeferredServerDisconnect();
    _startWithVideoAfterConnect = false;
    unawaited(
      playFluxerSoundEffect(
        prefs: ref.read(soundPreferencesProvider),
        sfx: ref.read(fluxerSfxProvider),
        clip: FluxerSfxClip.voiceDisconnect,
      ),
    );
    ref.read(voiceScreenShareWatchTileProvider.notifier).setActiveTileId(null);
    ref.read(voiceCallLayoutProvider.notifier).reset();
    ref.read(voiceCallDisplayPreferencesProvider.notifier).reset();
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
    _resetPendingSelfAudioFlags();
    if (channelId != null) {
      _clearOutgoingCallInitiator(channelId);
    }
    if (connectionId != null && guildId != null) {
      _sendVoiceDisconnectState(guildId: guildId, connectionId: connectionId);
    } else if (channelId != null) {
      _sendVoiceLeaveChannelState(guildId: guildId);
    }
    await _disconnectRoomOnly(
      guildId: guildId,
      connectionId: connectionId,
      skipGatewayDisconnect: true,
    );
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

  void _teardownOnDispose() {
    // Prevent stale in-flight connects from creating a room after disposal.
    _connectGeneration++;
    _cancelConnectWatchdog();
    _cancelLiveKitConnectWatchdog();
    _cancelDeferredServerDisconnect();
    _detachLocalParticipantListener();
    _detachRoomEventsListener();
    final Room? roomToDisconnect = _managedLiveKitRoom;
    _managedLiveKitRoom = null;
    if (roomToDisconnect == null) {
      return;
    }
    unawaited(_disconnectAndDisposeRoom(roomToDisconnect));
  }

  Future<void> _disconnectAndDisposeRoom(Room room, {String? reason}) async {
    _intentionalLiveKitTeardown = true;
    final String reasonSuffix = reason == null ? '' : ' after $reason';
    try {
      await room.disconnect();
    } on Object catch (e) {
      talker.warning('[Voice] failed to disconnect$reasonSuffix: $e');
    } finally {
      try {
        await room.dispose();
      } on Object catch (e) {
        talker.warning('[Voice] failed to dispose room$reasonSuffix: $e');
      }
      _intentionalLiveKitTeardown = false;
    }
  }

  Future<void> _disconnectRoomOnly({
    String? guildId,
    String? connectionId,
    bool skipGatewayDisconnect = false,
  }) async {
    _detachRoomEventsListener();
    _detachLocalParticipantListener();
    final VoiceSessionState sessionState = state;
    final Room? roomToDisconnect =
        _managedLiveKitRoom ?? sessionState.liveKitRoom;
    _managedLiveKitRoom = null;
    if (roomToDisconnect == null) {
      return;
    }
    if (!skipGatewayDisconnect) {
      _sendVoiceDisconnectState(
        guildId: guildId ?? sessionState.guildId,
        connectionId: connectionId ?? sessionState.activeConnectionId,
      );
    }
    state = state.copyWith(clearRoom: true, clearE2eeKey: true);
    await _disconnectAndDisposeRoom(roomToDisconnect);
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
            isMobile: isFluxerMobileOs,
          ),
        );
  }

  void _sendVoiceLeaveChannelState({required String? guildId}) {
    ref
        .read(gatewayConnectionProvider)
        .updateVoiceState(
          GatewayVoiceStateUpdate(
            guildId: guildId,
            selfMute: false,
            selfDeaf: false,
            selfVideo: false,
            selfStream: false,
            isMobile: isFluxerMobileOs,
          ),
        );
  }

  Future<bool> _ensureSystemPermissionForVoice(
    SystemPermissionKind kind, {
    required String deniedErrorCode,
  }) async {
    final SystemPermissionOutcome outcome = await requestSystemPermission(kind);
    if (outcome == SystemPermissionOutcome.granted) {
      return true;
    }
    if (outcome == SystemPermissionOutcome.requiresSettings) {
      await ensureSystemPermission(resolveSystemPermissionContext(null), kind);
      return false;
    }
    state = state.copyWith(errorMessage: deniedErrorCode);
    return false;
  }

  void clearError() {
    if (state.errorMessage == null && !state.connectFailed) {
      return;
    }
    if (!state.isConnected) {
      _connectGeneration++;
      _expectedGuildId = null;
      _expectedChannelId = null;
      _pendingRingAfterConnect = false;
      _pendingRingSilently = false;
      _outboundRingRecipients = null;
      _resetPendingSelfAudioFlags();
      final String? ch = state.channelId;
      if (ch != null) {
        _clearOutgoingCallInitiator(ch);
      }
      _cancelConnectWatchdog();
    }
    state = state.copyWith(
      clearError: true,
      isConnecting: false,
      clearConnectFailed: true,
      clearConnectFailedTarget: true,
      clearChannel: state.connectFailed,
    );
  }

  VoiceState? _selfConnectionVoiceState() {
    return resolveSelfConnectionVoiceState(
      voiceStates: ref.read(voiceStatesMapProvider),
      activeConnectionId: state.activeConnectionId,
      userId: ref.read(currentUserIdProvider),
      channelId: state.channelId,
    );
  }

  Future<void> toggleSelfMute() async {
    final VoiceSessionState s = state;
    if (!s.isInVoice || s.channelId == null) {
      await ref.read(localVoiceStateProvider.notifier).toggleSelfMute();
      final bool muted = ref.read(localVoiceStateProvider).selfMute;
      unawaited(
        playFluxerSoundEffect(
          prefs: ref.read(soundPreferencesProvider),
          sfx: ref.read(fluxerSfxProvider),
          clip: muted ? FluxerSfxClip.mute : FluxerSfxClip.unmute,
        ),
      );
      return;
    }
    final VoiceState? vs = _selfConnectionVoiceState();
    final bool nextMute = !(vs?.selfMute ?? false);
    await setSelfMute(isMuted: nextMute, playSound: true);
    await ref
        .read(localVoiceStateProvider.notifier)
        .setSelfMute(muted: nextMute);
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
        playFluxerSoundEffect(
          prefs: ref.read(soundPreferencesProvider),
          sfx: ref.read(fluxerSfxProvider),
          clip: isMuted ? FluxerSfxClip.mute : FluxerSfxClip.unmute,
        ),
      );
    }
  }

  Future<void> toggleSelfDeafen() async {
    final VoiceSessionState s = state;
    if (!s.isInVoice || s.channelId == null) {
      final bool wasDeaf = ref.read(localVoiceStateProvider).selfDeaf;
      await ref.read(localVoiceStateProvider.notifier).toggleSelfDeaf();
      unawaited(
        playFluxerSoundEffect(
          prefs: ref.read(soundPreferencesProvider),
          sfx: ref.read(fluxerSfxProvider),
          clip: wasDeaf ? FluxerSfxClip.undeaf : FluxerSfxClip.deaf,
        ),
      );
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
      await ref
          .read(localVoiceStateProvider.notifier)
          .setSelfDeaf(deafened: false);
      unawaited(
        playFluxerSoundEffect(
          prefs: ref.read(soundPreferencesProvider),
          sfx: ref.read(fluxerSfxProvider),
          clip: FluxerSfxClip.undeaf,
        ),
      );
    } else {
      await _applySelfVoiceState(
        selfMute: true,
        selfDeaf: true,
        selfVideo: vs?.selfVideo ?? false,
      );
      await ref
          .read(localVoiceStateProvider.notifier)
          .setSelfDeaf(deafened: true);
      unawaited(
        playFluxerSoundEffect(
          prefs: ref.read(soundPreferencesProvider),
          sfx: ref.read(fluxerSfxProvider),
          clip: FluxerSfxClip.deaf,
        ),
      );
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
      final bool camOk = await _ensureSystemPermissionForVoice(
        SystemPermissionKind.camera,
        deniedErrorCode: kVoiceSessionErrorCameraPermission,
      );
      if (!camOk) {
        return;
      }
    }
    _togglingVideo = true;
    try {
      try {
        await lp.setCameraEnabled(
          nextVideo,
          cameraCaptureOptions: _cameraCaptureOptions(),
        );
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
        playFluxerSoundEffect(
          prefs: ref.read(soundPreferencesProvider),
          sfx: ref.read(fluxerSfxProvider),
          clip: nextVideo ? FluxerSfxClip.cameraOn : FluxerSfxClip.cameraOff,
        ),
      );
    } finally {
      _togglingVideo = false;
    }
  }

  Future<void> flipCamera() async {
    if (!isMobileVoiceCameraPlatform()) {
      return;
    }
    final VoiceSessionState s = state;
    if (!s.isInVoice || s.channelId == null || !s.isConnected) {
      return;
    }
    final VoiceState? vs = _selfConnectionVoiceState();
    if (!(vs?.selfVideo ?? false)) {
      return;
    }
    if (_togglingVideo) {
      return;
    }
    final VoiceSettingsState settings = ref.read(voiceSettingsProvider);
    final VoiceCameraFacing nextFacing = settings.cameraFacing.switched();
    await ref.read(voiceSettingsProvider.notifier).setCameraFacing(nextFacing);
    final Room? room = s.liveKitRoom;
    if (room != null) {
      await ref
          .read(voiceSettingsApplicatorProvider)
          .refreshCamera(
            room: room,
            settings: ref.read(voiceSettingsProvider),
            cameraEnabled: true,
          );
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
        final bool hasScreenShareAudioPermission =
            await _ensureScreenShareAudioPermission();
        if (!hasScreenShareAudioPermission) {
          state = state.copyWith(
            errorMessage: kVoiceSessionErrorScreenSharePermissionDenied,
          );
          return;
        }
        final bool hasBackground = await enableAndroidScreenShareBackground(
          notificationText: screenShareNotificationText,
        );
        if (!hasBackground || !await isAndroidScreenShareBackgroundRunning()) {
          talker.warning(
            '[Voice] Screen-share background service could not be started '
            'or is not running.',
          );
          await disableAndroidScreenShareBackground();
          state = state.copyWith(
            errorMessage: kVoiceSessionErrorScreenShareToggle,
          );
          return;
        }
        talker.debug('[Voice] Screen-share background service is running.');
      }
      try {
        await lp.setScreenShareEnabled(
          nextSelfStream,
          captureScreenAudio: nextSelfStream,
        );
      } on Object catch (e, st) {
        talker.error(
          '[Voice] setScreenShareEnabled failed '
          '(enable=$nextSelfStream): $e',
          e,
          st,
        );
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
        talker.warning(
          '[Voice] Screen-share track did not publish within the wait window.',
        );
        await disableAndroidScreenShareBackground();
        state = state.copyWith(
          errorMessage: kVoiceSessionErrorScreenShareToggle,
        );
        return;
      }
      unawaited(
        playFluxerSoundEffect(
          prefs: ref.read(soundPreferencesProvider),
          sfx: ref.read(fluxerSfxProvider),
          clip: nextSelfStream
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
        Platform.isAndroid ||
        Platform.isMacOS ||
        (Platform.isLinux && !isFluxerRuntimeMobileFormFactor);
    if (!shouldEnableScreenShare || !requiresCapturePermission) {
      return true;
    }
    final bool hasCapturePermission = await Helper.requestCapturePermission();
    if (!hasCapturePermission) {
      talker.warning('[Voice] Screen-share capture permission denied by user.');
    }
    return hasCapturePermission;
  }

  Future<bool> _ensureScreenShareAudioPermission() async {
    if (!Platform.isAndroid) {
      return true;
    }
    final bool hasMicrophonePermission =
        await hasMicrophonePermissionForVoice();
    if (hasMicrophonePermission) {
      return true;
    }
    talker.warning(
      '[Voice] Screen-share audio requires microphone permission; requesting.',
    );
    return _ensureSystemPermissionForVoice(
      SystemPermissionKind.microphone,
      deniedErrorCode: kVoiceSessionErrorScreenSharePermissionDenied,
    );
  }

  String _classifyScreenShareException(Object error) {
    final String msg = error.toString().toLowerCase();
    talker.debug('[Voice] classifying screen share exception: $msg');
    if (msg.contains('permission') && msg.contains('deni')) {
      return kVoiceSessionErrorScreenSharePermissionDenied;
    }
    if (msg.contains('mediaprojection') ||
        msg.contains('media projection') ||
        msg.contains('projection') && msg.contains('denied')) {
      return kVoiceSessionErrorScreenSharePermissionDenied;
    }
    if (msg.contains('securityexception') ||
        msg.contains('not allowed') ||
        msg.contains('user cancel') ||
        msg.contains('user denied')) {
      return kVoiceSessionErrorScreenSharePermissionDenied;
    }
    if (msg.contains('foreground') && msg.contains('service') ||
        msg.contains('background execution') ||
        msg.contains('media_projection')) {
      return kVoiceSessionErrorScreenShareToggle;
    }
    return kVoiceSessionErrorScreenShareToggle;
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
    _syncPendingSelfAudioFlags(selfMute: selfMute, selfDeaf: selfDeaf);
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
            isMobile: isFluxerMobileOs,
          ),
        );
    final EffectiveAudioState audio = computeEffectiveAudioState(
      selfMute: selfMute,
      selfDeaf: selfDeaf,
      serverMute: (current?.mute ?? false) || (current?.suppress ?? false),
      serverDeaf: current?.deaf ?? false,
    );
    final Room? room = _room;
    final LocalParticipant? lp = room?.localParticipant;
    if (lp != null && state.isConnected) {
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
    }
    if (room != null && (state.isConnected || state.isConnecting)) {
      unawaited(
        _reconcileRemoteAudioSubscriptions(
          deaf: audio.effectiveDeaf,
          reason: 'self_voice_state',
        ),
      );
    }
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
            isMobile: isFluxerMobileOs,
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
        for (int i = 0; i < _kScreenSharePublicationWaitIterations; i++) {
          if (_hasPublishedLocalScreenShareVideo(requireTrack: true)) {
            break;
          }
          await Future<void>.delayed(_kScreenSharePublicationWaitInterval);
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
    _cancelLiveKitConnectWatchdog();
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
        playFluxerSoundEffect(
          prefs: ref.read(soundPreferencesProvider),
          sfx: ref.read(fluxerSfxProvider),
          clip: FluxerSfxClip.userJoin,
        ),
      );
    });
    if (_pendingRingAfterConnect) {
      unawaited(
        _ringAfterConnect(resolvedChannelId, silently: _pendingRingSilently),
      );
      _pendingRingAfterConnect = false;
      _pendingRingSilently = false;
    }
    await _reconcileRemoteAudioForSelfConnection(reason: 'room_connected');
    await ref
        .read(voiceSettingsApplicatorProvider)
        .applySpeakerOutput(settings: ref.read(voiceSettingsProvider));
    unawaited(
      _ensureLocalMicrophone(reason: 'room_connected', attempt: attempt),
    );
  }

  Future<void> _applyAudioOutputDevice(String outputDeviceId) async {
    if (outputDeviceId == kDefaultVoiceDeviceId || outputDeviceId.isEmpty) {
      return;
    }
    try {
      await Helper.selectAudioOutput(outputDeviceId);
    } on Object {
      return;
    }
  }

  Future<void> _onVoiceSettingsChanged(
    VoiceSettingsState? previous,
    VoiceSettingsState next,
  ) async {
    final VoiceSettingsApplicator applicator = ref.read(
      voiceSettingsApplicatorProvider,
    );
    await applicator.applySpeakerOutput(settings: next);
    final bool outputDeviceChanged =
        previous == null || previous.outputDeviceId != next.outputDeviceId;
    if (outputDeviceChanged) {
      await _applyAudioOutputDevice(next.outputDeviceId);
    }
    final Room? room = state.liveKitRoom;
    if (room == null || !state.isConnected) {
      return;
    }
    final bool audioChanged =
        previous == null ||
        previous.inputDeviceId != next.inputDeviceId ||
        previous.voiceProcessingMode != next.voiceProcessingMode ||
        previous.noiseSuppressionTier != next.noiseSuppressionTier ||
        previous.echoCancellation != next.echoCancellation ||
        previous.noiseSuppression != next.noiseSuppression ||
        previous.autoGainControl != next.autoGainControl;
    final bool cameraChanged =
        previous == null ||
        previous.videoDeviceId != next.videoDeviceId ||
        previous.cameraFacing != next.cameraFacing ||
        previous.cameraResolution != next.cameraResolution;
    if (audioChanged) {
      final VoiceState? vs = _selfConnectionVoiceState();
      final bool micEnabled =
          !(vs?.selfMute ?? false) && !(vs?.selfDeaf ?? false);
      await applicator.refreshMicrophone(
        room: room,
        settings: next,
        microphoneEnabled: micEnabled,
      );
    }
    if (cameraChanged) {
      final VoiceState? vs = _selfConnectionVoiceState();
      await applicator.refreshCamera(
        room: room,
        settings: next,
        cameraEnabled: vs?.selfVideo ?? false,
      );
    }
    final bool participantVolumesChanged =
        previous == null ||
        previous.participantVolumes != next.participantVolumes;
    final bool outputVolumeChanged =
        previous == null || previous.outputVolume != next.outputVolume;
    if (participantVolumesChanged || outputVolumeChanged) {
      await applyAllParticipantVolumes();
    }
  }

  Future<void> applyParticipantVolume(String userId) async {
    final VoiceSettingsState settings = ref.read(voiceSettingsProvider);
    await applyParticipantVolumeToRoom(
      room: state.liveKitRoom,
      userId: userId,
      participantVolumePercent: defaultParticipantVolumeForUser(
        participantVolumes: settings.participantVolumes,
        userId: userId,
      ),
      outputVolumePercent: settings.outputVolume,
    );
  }

  Future<void> applyAllParticipantVolumes() async {
    final VoiceSettingsState settings = ref.read(voiceSettingsProvider);
    await applyAllParticipantVolumesToRoom(
      room: state.liveKitRoom,
      participantVolumes: settings.participantVolumes,
      outputVolumePercent: settings.outputVolume,
    );
  }

  Future<void> _applyParticipantVolumeForPublication(
    RemoteTrackPublication publication,
  ) async {
    if (publication.source != TrackSource.microphone) {
      return;
    }
    final Participant participant = publication.participant;
    final String? userId = parseUserIdFromParticipantIdentity(
      participant.identity,
    );
    if (userId == null) {
      return;
    }
    final Track? track = publication.track;
    if (track is! RemoteAudioTrack) {
      return;
    }
    final VoiceSettingsState settings = ref.read(voiceSettingsProvider);
    try {
      await applyParticipantVolumeToTrack(
        track: track,
        participantVolumePercent: defaultParticipantVolumeForUser(
          participantVolumes: settings.participantVolumes,
          userId: userId,
        ),
        outputVolumePercent: settings.outputVolume,
      );
    } on Object catch (error) {
      talker.warning('[Voice] Failed to apply participant volume: $error');
    }
  }

  CameraCaptureOptions _cameraCaptureOptions() {
    return ref
        .read(voiceSettingsApplicatorProvider)
        .buildCameraCaptureOptions(ref.read(voiceSettingsProvider));
  }

  Future<void> _subscribeRemotePublicationIfNeeded(
    RemoteTrackPublication publication,
  ) async {
    if (publication.source != TrackSource.microphone) {
      return;
    }
    if (_effectiveAudioStateForSelfConnection().effectiveDeaf) {
      return;
    }
    try {
      await publication.subscribe();
      await _applyParticipantVolumeForPublication(publication);
    } on Object catch (e) {
      talker.warning('[Voice] Failed to subscribe remote track: $e');
    }
  }

  Future<void> _reconcileRemoteAudioSubscriptions({
    required bool deaf,
    required String reason,
  }) async {
    final Room? room = state.liveKitRoom;
    if (room == null) {
      return;
    }
    if (!state.isConnected && !state.isConnecting) {
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
    if (room == null ||
        lp == null ||
        !state.isConnected ||
        room.connectionState != ConnectionState.connected) {
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
    final EffectiveAudioState audio = _effectiveAudioStateForSelfConnection();
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
      selfDeaf: current?.selfDeaf ?? _pendingSelfDeaf,
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
        unawaited(
          _reconcileRemoteAudioForSelfConnection(reason: 'room_reconnected'),
        );
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
          playFluxerSoundEffect(
            prefs: ref.read(soundPreferencesProvider),
            sfx: ref.read(fluxerSfxProvider),
            clip: isUserParticipant
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
          playFluxerSoundEffect(
            prefs: ref.read(soundPreferencesProvider),
            sfx: ref.read(fluxerSfxProvider),
            clip: isUserParticipant
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
            isMobile: isFluxerMobileOs,
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
