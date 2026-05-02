import 'dart:async';
import 'dart:io';

import 'package:fluxer_app/core/api/fluxer_client_provider.dart';
import 'package:fluxer_app/core/providers/gateway_connection_provider.dart';
import 'package:fluxer_app/core/talker.dart';
import 'package:fluxer_app/features/gateway/providers/gateway_event_providers.dart';
import 'package:fluxer_app/features/voice/providers/voice_screen_share_watch_tile_provider.dart';
import 'package:fluxer_app/features/voice/providers/voice_session_state.dart';
import 'package:fluxer_app/features/voice/utils/camera_permission.dart';
import 'package:fluxer_app/features/voice/utils/microphone_permission.dart';
import 'package:fluxer_app/features/voice/voice_session_errors.dart';
import 'package:fluxer_dart/export.dart';
import 'package:fluxer_dart/gateway.dart';
import 'package:livekit_client/livekit_client.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'voice_session_provider.g.dart';

/// Cleared when a [VoiceServerUpdateEvent] is accepted and [_connectLiveKit]
/// is scheduled (voice server responded). Covers slow gateway only, not
/// LiveKit [Room.connect] duration.
const Duration _kVoiceJoinWatchdogDuration = Duration(seconds: 15);

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

  @override
  VoiceSessionState build() {
    ref.onDispose(() {
      _cancelConnectWatchdog();
      _detachLocalParticipantListener();
      unawaited(_disconnectRoomOnly());
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
    _connectGeneration++;
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
    final bool selfMute = initialSelfDeaf || initialSelfMute;
    final bool selfDeaf = initialSelfDeaf;
    final bool joinSent = gateway.updateVoiceState(
      GatewayVoiceStateUpdate(
        guildId: _expectedGuildId,
        channelId: channelId,
        selfMute: selfMute,
        selfDeaf: selfDeaf,
        selfVideo: false,
        selfStream: false,
        viewerStreamKeys: const <String>[],
        connectionId: null,
        isMobile:
            !Platform.isLinux && !Platform.isMacOS && !Platform.isWindows,
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
    final bool guildMatches = expectedGuildNorm == incomingGuildNorm ||
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
    if (event.e2eeEnabled ?? false) {
      talker.warning(
        '[Voice] Server requested E2EE; Flutter client does not support '
        'voice E2EE yet.',
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
    talker.info(
      '[Voice] VOICE_SERVER_UPDATE accepted; starting LiveKit '
      '(channelId=$resolvedChannelId, connectionId=${event.connectionId}).',
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

  Future<void> _connectLiveKit({
    required VoiceServerUpdateEvent event,
    required String resolvedChannelId,
    required int attempt,
  }) async {
    await _disconnectRoomOnly();
    if (attempt != _connectGeneration) {
      return;
    }
    final Room room = Room(
      roomOptions: const RoomOptions(
        adaptiveStream: true,
        dynacast: true,
        defaultCameraCaptureOptions: CameraCaptureOptions(
          params: VideoParametersPresets.h1080_169,
        ),
        defaultScreenShareCaptureOptions: ScreenShareCaptureOptions(
          useiOSBroadcastExtension: true,
          captureScreenAudio: true,
          params: VideoParametersPresets.screenShareH1080FPS30,
        ),
      ),
    );
    state = state.copyWith(
      isConnecting: true,
      voiceServerEndpoint: event.endpoint,
      activeConnectionId: event.connectionId,
      liveKitRoom: room,
    );
    try {
      await room.connect(
        event.endpoint,
        event.token,
        connectOptions: const ConnectOptions(autoSubscribe: true),
      );
      if (attempt != _connectGeneration) {
        talker.warning(
          '[Voice] LiveKit connect superseded after room.connect '
          '(attempt=$attempt, generation=$_connectGeneration).',
        );
        _detachLocalParticipantListener();
        unawaited(room.disconnect());
        if (identical(state.liveKitRoom, room)) {
          state = state.copyWith(clearRoom: true);
        }
        return;
      }
      await room.localParticipant?.setMicrophoneEnabled(true);
      _attachLocalParticipantListener(room.localParticipant);
      if (attempt != _connectGeneration) {
        talker.warning(
          '[Voice] LiveKit connect superseded after mic/listener setup '
          '(attempt=$attempt, generation=$_connectGeneration).',
        );
        _detachLocalParticipantListener();
        unawaited(room.disconnect());
        if (identical(state.liveKitRoom, room)) {
          state = state.copyWith(clearRoom: true);
        }
        return;
      }
      final String? resolvedGuildId =
          _normalizeVoiceGuildId(event.guildId) ?? _expectedGuildId;
      state = state.copyWith(
        isConnecting: false,
        isConnected: true,
        channelId: resolvedChannelId,
        guildId: resolvedGuildId,
        activeConnectionId: event.connectionId,
      );
      if (_pendingRingAfterConnect) {
        unawaited(
          _ringAfterConnect(resolvedChannelId, silently: _pendingRingSilently),
        );
        _pendingRingAfterConnect = false;
        _pendingRingSilently = false;
      }
      if (_startWithVideoAfterConnect && attempt == _connectGeneration) {
        _startWithVideoAfterConnect = false;
        await _enableCameraAfterLiveKitConnect(room: room, attempt: attempt);
      }
      if (attempt != _connectGeneration) {
        talker.warning(
          '[Voice] LiveKit connect superseded after joining session '
          '(attempt=$attempt, generation=$_connectGeneration).',
        );
        _detachLocalParticipantListener();
        unawaited(room.disconnect());
        if (identical(state.liveKitRoom, room)) {
          state = state.copyWith(clearRoom: true);
        }
        return;
      }
    } on Object catch (e) {
      talker.error('[Voice] LiveKit connect failed: $e');
      _detachLocalParticipantListener();
      if (attempt == _connectGeneration) {
        _startWithVideoAfterConnect = false;
        _cancelConnectWatchdog();
        _outboundRingRecipients = null;
        _clearOutgoingCallInitiator(resolvedChannelId);
        state = state.copyWith(
          isConnecting: false,
          isConnected: false,
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
    ref.read(outgoingVoiceCallInitiatorProvider.notifier).clearChannel(channelId);
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
        state = state.copyWith(errorMessage: kVoiceSessionErrorCameraPermission);
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
    } finally {
      _togglingVideo = false;
    }
  }

  Future<void> leaveVoice({bool endCall = true}) async {
    _cancelConnectWatchdog();
    _startWithVideoAfterConnect = false;
    ref.read(voiceScreenShareWatchTileProvider.notifier).setActiveTileId(null);
    final String? channelId = state.channelId;
    final String? guildId = state.guildId;
    final String? connectionId = state.activeConnectionId;
    _connectGeneration++;
    _expectedGuildId = null;
    _expectedChannelId = null;
    _pendingRingAfterConnect = false;
    _pendingRingSilently = false;
    _outboundRingRecipients = null;
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
    _detachLocalParticipantListener();
    final VoiceSessionState sessionState = state;
    final Room? roomToDisconnect = sessionState.liveKitRoom;
    if (roomToDisconnect != null) {
      _sendVoiceDisconnectState(
        guildId: guildId ?? sessionState.guildId,
        connectionId: connectionId ?? sessionState.activeConnectionId,
      );
      state = state.copyWith(clearRoom: true);
      try {
        await roomToDisconnect.disconnect();
      } on Object catch (e) {
        talker.warning('[Voice] failed to disconnect: $e');
      }
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
            channelId: null,
            selfMute: true,
            selfDeaf: true,
            selfVideo: false,
            selfStream: false,
            viewerStreamKeys: const <String>[],
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
    final bool nextDeaf = vs?.selfDeaf ?? false;
    await _applySelfVoiceState(
      selfMute: nextMute,
      selfDeaf: nextDeaf,
      selfVideo: vs?.selfVideo ?? false,
    );
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
    } else {
      await _applySelfVoiceState(
        selfMute: true,
        selfDeaf: true,
        selfVideo: vs?.selfVideo ?? false,
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
    } finally {
      _togglingVideo = false;
    }
  }

  Future<void> toggleSelfStream() async {
    final VoiceSessionState s = state;
    if (!s.isInVoice || s.channelId == null || !s.isConnected) {
      return;
    }
    if (_togglingScreenShare) {
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
      try {
        await lp.setScreenShareEnabled(nextSelfStream);
      } on Object catch (e) {
        talker.error('[Voice] setScreenShareEnabled: $e');
        state = state.copyWith(
          errorMessage: kVoiceSessionErrorScreenShareToggle,
        );
        return;
      }
      talker.debug('[Voice] setScreenShareEnabled completed: enable=$nextSelfStream');
      await _reconcileSelfStreamState(
        reason: nextSelfStream ? 'toggle_enable' : 'toggle_disable',
        waitForPublication: nextSelfStream,
      );
      if (nextSelfStream &&
          !_hasPublishedLocalScreenShareVideo(requireTrack: true)) {
        state = state.copyWith(errorMessage: kVoiceSessionErrorScreenShareToggle);
      }
    } finally {
      _togglingScreenShare = false;
    }
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
    if (lp != null) {
      final bool micOn = !selfMute && !selfDeaf;
      unawaited(lp.setMicrophoneEnabled(micOn));
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
      final bool currentSelfStream = _selfConnectionVoiceState()?.selfStream ?? false;
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
    unawaited(
      _reconcileSelfStreamState(reason: 'local_participant_changed'),
    );
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
