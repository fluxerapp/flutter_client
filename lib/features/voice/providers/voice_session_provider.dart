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

@Riverpod(keepAlive: true)
class VoiceSession extends _$VoiceSession {
  int _connectGeneration = 0;
  String? _expectedGuildId;
  String? _expectedChannelId;
  bool _pendingRingAfterConnect = false;
  bool _pendingRingSilently = false;
  bool _togglingVideo = false;
  bool _togglingScreenShare = false;
  DateTime? _lastCameraOrientationRefresh;

  @override
  VoiceSessionState build() {
    ref.onDispose(() {
      unawaited(_disconnectRoomOnly());
    });
    return const VoiceSessionState();
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
    bool initialSelfMute = false,
    bool initialSelfDeaf = false,
  }) async {
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
    _connectGeneration++;
    _expectedGuildId = guildId;
    _expectedChannelId = channelId;
    _pendingRingAfterConnect = startOutgoingCall;
    _pendingRingSilently = startOutgoingCall && ringSilently;
    state = state.copyWith(
      isConnecting: true,
      isConnected: false,
      clearError: true,
      guildId: guildId,
      channelId: channelId,
    );
    final bool selfMute = initialSelfDeaf || initialSelfMute;
    final bool selfDeaf = initialSelfDeaf;
    ref
        .read(gatewayConnectionProvider)
        .updateVoiceState(
          GatewayVoiceStateUpdate(
            guildId: guildId,
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
  }

  void handleVoiceServerUpdate(VoiceServerUpdateEvent event) {
    if (_expectedChannelId == null) {
      return;
    }
    if (event.guildId != _expectedGuildId) {
      return;
    }
    if (event.e2eeEnabled ?? false) {
      talker.warning(
        '[Voice] Server requested E2EE; Flutter client does not support voice E2EE yet.',
      );
    }
    final String resolvedChannelId = event.channelId ?? _expectedChannelId!;
    if (resolvedChannelId != _expectedChannelId) {
      return;
    }
    if (event.token.isEmpty || event.endpoint.isEmpty) {
      state = state.copyWith(
        isConnecting: false,
        errorMessage: 'Voice server did not return connection details.',
      );
      return;
    }
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
        unawaited(room.disconnect());
        state = state.copyWith(clearRoom: true);
        return;
      }
      await room.localParticipant?.setMicrophoneEnabled(true);
      if (attempt != _connectGeneration) {
        return;
      }
      state = state.copyWith(
        isConnecting: false,
        isConnected: true,
        channelId: resolvedChannelId,
        guildId: _expectedGuildId,
        activeConnectionId: event.connectionId,
      );
      if (_pendingRingAfterConnect) {
        unawaited(
          _ringAfterConnect(resolvedChannelId, silently: _pendingRingSilently),
        );
        _pendingRingAfterConnect = false;
        _pendingRingSilently = false;
      }
    } on Object catch (e) {
      talker.error('[Voice] LiveKit connect failed: $e');
      if (attempt == _connectGeneration) {
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
    try {
      final FluxerClient client = ref.read(fluxerClientProvider);
      await client.channels.ringCallRecipients(
        channelId: channelId,
        body: CallRingBodySchema(recipients: silently ? <String>[] : null),
      );
    } on Object catch (e) {
      talker.warning('[Voice] ringCallRecipients: $e');
    }
  }

  Future<void> leaveVoice({bool endCall = true}) async {
    ref.read(voiceScreenShareWatchTileProvider.notifier).setActiveTileId(null);
    final String? channelId = state.channelId;
    final String? guildId = state.guildId;
    final String? connectionId = state.activeConnectionId;
    _connectGeneration++;
    _expectedGuildId = null;
    _expectedChannelId = null;
    _pendingRingAfterConnect = false;
    _pendingRingSilently = false;
    state = const VoiceSessionState();
    await _disconnectRoomOnly(guildId: guildId, connectionId: connectionId);
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
    final VoiceSessionState sessionState = state;
    _sendVoiceDisconnectState(
      guildId: guildId ?? sessionState.guildId,
      connectionId: connectionId ?? sessionState.activeConnectionId,
    );
    final Room? r = state.liveKitRoom;
    if (r != null) {
      state = state.copyWith(clearRoom: true);
      try {
        await r.disconnect();
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
    final VoiceState? vs = _selfConnectionVoiceState();
    final bool nextSelfStream = !(vs?.selfStream ?? false);
    final LocalParticipant? lp = s.liveKitRoom?.localParticipant;
    if (lp == null) {
      return;
    }
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
      await _applySelfStreamState(selfStream: nextSelfStream);
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
