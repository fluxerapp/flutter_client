import 'package:flutter/foundation.dart';
import 'package:fluxer_dart/gateway.dart';
import 'package:livekit_client/livekit_client.dart';

abstract interface class VoiceMediaParticipant implements Listenable {
  String get identity;

  String? get userId;

  bool get hasCamera;

  VideoTrack? get cameraTrack;

  bool get hasScreenShare;

  VideoTrack? get screenShareTrack;

  bool get hasScreenShareAudio;

  AudioTrack? get screenShareAudioTrack;

  VideoDimensions? get screenShareDimensions;

  Iterable<AudioTrack> get voiceAudioTracks;

  bool get directConnectionFailed;

  Future<void> setVideoWanted(
    TrackSource source, {
    required bool wanted,
    VideoQuality? quality,
  });

  Future<void> setScreenShareAudioWanted({required bool wanted});
}

abstract interface class VoiceMediaRoom {
  Iterable<VoiceMediaParticipant> get participants;

  VoiceMediaParticipant? participantFor({
    required VoiceState voice,
    required String userId,
    required String? currentUserId,
    required String? localConnectionId,
  });
}
