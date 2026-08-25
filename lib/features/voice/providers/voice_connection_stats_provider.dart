import 'dart:async';

import 'package:fluxer_app/features/voice/providers/voice_session_provider.dart';
import 'package:fluxer_app/features/voice/providers/voice_session_state.dart';
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

  @override
  VoiceConnectionStats build() {
    ref.onDispose(() {
      _timer?.cancel();
      unawaited(_listener?.dispose());
    });
    ref.listen<VoiceSessionState>(voiceSessionProvider, (
      VoiceSessionState? previous,
      VoiceSessionState next,
    ) {
      if (next.isConnected && !(previous?.isConnected ?? false)) {
        _connectedAt = DateTime.now();
      }
      if (!next.isConnected) {
        _connectedAt = null;
      }
      if (next.isInVoice) {
        _attachToRoom(next.liveKitRoom);
        _startPolling();
      } else {
        _timer?.cancel();
        _timer = null;
        _detachListener();
        state = const VoiceConnectionStats();
      }
    });
    final VoiceSessionState voice = ref.read(voiceSessionProvider);
    if (voice.isConnected) {
      _connectedAt ??= DateTime.now();
    }
    if (voice.isInVoice) {
      _attachToRoom(voice.liveKitRoom);
      _startPolling();
    }
    return const VoiceConnectionStats();
  }

  void _attachToRoom(Room? room) {
    _detachListener();
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
  }

  void _startPolling() {
    if (_timer != null) {
      return;
    }
    _timer = Timer.periodic(const Duration(seconds: 2), (_) {
      final Room? room = ref.read(voiceSessionProvider).liveKitRoom;
      if (room != null) {
        _refreshFromRoom(room);
      }
    });
    final Room? room = ref.read(voiceSessionProvider).liveKitRoom;
    if (room != null) {
      _refreshFromRoom(room);
    }
  }

  void _refreshFromRoom(Room room) {
    final VoiceSessionState voice = ref.read(voiceSessionProvider);
    if (!voice.isConnected) {
      return;
    }
    final LocalParticipant? local = room.localParticipant;
    final int? rtt = _latencyFromQuality(local?.connectionQuality);
    final List<int> history = List<int>.from(state.latencyHistory);
    if (rtt != null) {
      history.add(rtt);
      if (history.length > 30) {
        history.removeAt(0);
      }
    }
    state = VoiceConnectionStats(
      currentLatencyMs: rtt ?? state.currentLatencyMs,
      latencyHistory: history,
      sessionDuration: _connectedAt == null
          ? null
          : DateTime.now().difference(_connectedAt!),
      participantCount: room.remoteParticipants.length + 1,
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
