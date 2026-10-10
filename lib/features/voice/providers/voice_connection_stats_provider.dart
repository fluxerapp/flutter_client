import 'dart:async';

import 'package:fluxer_app/features/voice/providers/voice_session_provider.dart';
import 'package:fluxer_app/features/voice/providers/voice_session_state.dart';
import 'package:fluxer_app/features/voice/services/mesh/voice_mesh_transport.dart';
import 'package:livekit_client/livekit_client.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'voice_connection_stats_provider.g.dart';

class VoiceConnectionStats {
  const VoiceConnectionStats({
    this.currentLatencyMs,
    this.latencyHistory = const <int>[],
    this.sessionDuration,
    this.participantCount,
    this.jitterMs,
    this.sendBandwidthBps,
    this.receiveBandwidthBps,
  });

  final int? currentLatencyMs;
  final List<int> latencyHistory;
  final Duration? sessionDuration;
  final int? participantCount;
  final double? jitterMs;
  final double? sendBandwidthBps;
  final double? receiveBandwidthBps;
}

@Riverpod(keepAlive: true)
class VoiceConnectionStatsNotifier extends _$VoiceConnectionStatsNotifier {
  Timer? _timer;
  DateTime? _connectedAt;
  EventsListener<RoomEvent>? _listener;
  Room? _listenedRoom;

  @override
  VoiceConnectionStats build() {
    ref.onDispose(() {
      _timer?.cancel();
      unawaited(_listener?.dispose());
    });
    ref.listen<VoiceSessionState>(voiceSessionProvider, _syncSession);
    final VoiceSessionState voice = ref.read(voiceSessionProvider);
    if (voice.isConnected) {
      _connectedAt ??= DateTime.now();
    }
    _syncSession(null, voice, trackConnectEdge: false, resetWhenIdle: false);
    return const VoiceConnectionStats();
  }

  void _syncSession(
    VoiceSessionState? previous,
    VoiceSessionState next, {
    bool trackConnectEdge = true,
    bool resetWhenIdle = true,
  }) {
    if (trackConnectEdge) {
      if (next.isConnected && !(previous?.isConnected ?? false)) {
        _connectedAt = DateTime.now();
      }
      if (!next.isConnected) {
        _connectedAt = null;
      }
    }
    if (!next.isInVoice) {
      _timer?.cancel();
      _timer = null;
      _detachListener();
      if (resetWhenIdle) {
        state = const VoiceConnectionStats();
      }
      return;
    }
    if (!identical(_listenedRoom, next.liveKitRoom)) {
      _attachToRoom(next.liveKitRoom);
    }
    _startPolling();
  }

  void _attachToRoom(Room? room) {
    _detachListener();
    _listenedRoom = room;
    if (room == null) {
      return;
    }
    final EventsListener<RoomEvent> listener = room.createListener();
    _listener = listener;
    listener.on<ParticipantConnectionQualityUpdatedEvent>((
      ParticipantConnectionQualityUpdatedEvent event,
    ) {
      if (event.participant is LocalParticipant) {
        _refreshFromRoom(room);
      }
    });
  }

  void _detachListener() {
    unawaited(_listener?.dispose());
    _listener = null;
    _listenedRoom = null;
  }

  void _startPolling() {
    if (_timer != null) {
      return;
    }
    _timer = Timer.periodic(const Duration(seconds: 2), (_) => _refresh());
    _refresh();
  }

  void _refresh() {
    final VoiceSessionState voice = ref.read(voiceSessionProvider);
    final VoiceMeshTransport? mesh = voice.mesh;
    final Room? room = voice.liveKitRoom;
    if (mesh != null) {
      unawaited(_refreshFromMesh(mesh));
    } else if (room != null) {
      _refreshFromRoom(room);
    }
  }

  Future<void> _refreshFromMesh(VoiceMeshTransport mesh) async {
    final int? rtt = await mesh.roundTripMs();
    if (!ref.mounted || !identical(ref.read(voiceSessionProvider).mesh, mesh)) {
      return;
    }
    _applySample(rtt: rtt, participantCount: mesh.peers.length + 1);
  }

  void _refreshFromRoom(Room room) {
    final LocalParticipant? local = room.localParticipant;
    _applySample(
      rtt: _latencyFromQuality(local?.connectionQuality),
      participantCount: room.remoteParticipants.length + 1,
    );
  }

  void _applySample({required int? rtt, required int participantCount}) {
    final VoiceSessionState voice = ref.read(voiceSessionProvider);
    if (!voice.isConnected) {
      return;
    }
    final int? latency = rtt ?? state.currentLatencyMs;
    final Duration? duration = _connectedAt == null
        ? null
        : DateTime.now().difference(_connectedAt!);
    final VoiceLatencySignalTone tone = voiceLatencySignalTone(
      latencyMs: latency,
    );
    final VoiceLatencySignalTone previousTone = voiceLatencySignalTone(
      latencyMs: state.currentLatencyMs,
      history: state.latencyHistory,
    );
    final bool signalChanged =
        latency != state.currentLatencyMs ||
        participantCount != state.participantCount ||
        tone != previousTone;
    final bool durationChanged =
        duration?.inSeconds != state.sessionDuration?.inSeconds;
    if (!signalChanged && !durationChanged) {
      return;
    }
    List<int> history = state.latencyHistory;
    if (rtt != null && (history.isEmpty || history.last != rtt)) {
      history = List<int>.from(history)..add(rtt);
      if (history.length > 30) {
        history.removeAt(0);
      }
    }
    state = VoiceConnectionStats(
      currentLatencyMs: latency,
      latencyHistory: history,
      sessionDuration: duration,
      participantCount: participantCount,
    );
  }

  int? _latencyFromQuality(ConnectionQuality? quality) {
    return switch (quality) {
      ConnectionQuality.excellent => 35,
      ConnectionQuality.good => 90,
      ConnectionQuality.poor => 180,
      ConnectionQuality.lost => 450,
      _ => null,
    };
  }
}

enum VoiceLatencySignalTone { green, yellow, orange, red, loading }

VoiceLatencySignalTone voiceLatencySignalTone({
  required int? latencyMs,
  List<int> history = const <int>[],
}) {
  if (latencyMs == null) {
    return VoiceLatencySignalTone.loading;
  }
  if (latencyMs < 100) {
    return VoiceLatencySignalTone.green;
  }
  if (latencyMs < 200) {
    return VoiceLatencySignalTone.yellow;
  }
  if (latencyMs < 400) {
    return VoiceLatencySignalTone.orange;
  }
  return VoiceLatencySignalTone.red;
}
