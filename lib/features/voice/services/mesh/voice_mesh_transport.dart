import 'dart:async';
import 'dart:io';
import 'dart:math' as math;

// LiveKit audio session APIs are marked @experimental.
// ignore_for_file: experimental_member_use

import 'package:flutter/foundation.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart';
import 'package:fluxer_app/core/platform/fluxer_platform.dart';
import 'package:fluxer_app/core/talker.dart';
import 'package:fluxer_app/features/voice/domain/voice_media_participant.dart';
import 'package:fluxer_app/features/voice/services/mesh/voice_mesh_peer.dart';
import 'package:fluxer_app/features/voice/services/mesh/voice_mesh_signal.dart';
import 'package:fluxer_app/features/voice/utils/camera_resolution_presets.dart';
import 'package:fluxer_app/features/voice/utils/voice_audio_publish_options.dart';
import 'package:fluxer_app/features/voice/utils/voice_camera_platform.dart';
import 'package:fluxer_dart/export.dart';
import 'package:fluxer_dart/gateway.dart';
import 'package:livekit_client/livekit_client.dart';

const int _kInboxLimit = 64;
const int _kCameraBudgetBps = 4000000;
const int _kScreenShareBudgetBps = 12000000;
const int _kPhoneCameraMaxFrameRate = 30;
const int _kPhoneCameraMaxShortSide = 720;
const double _kSpeakingLevel = 0.2;
const Duration _kSpeakingRelease = Duration(milliseconds: 300);
const int _kConnectionReportBatchLimit = 8;
const Duration _kConnectionReportDelay = Duration(seconds: 10);

typedef VoiceMeshSignalSink =
    bool Function({
      required String? guildId,
      required String channelId,
      required String to,
      required Map<String, Object?> data,
    });

typedef VoiceMeshConnectionReportSink =
    void Function(List<VoiceP2pConnectionReportsRequestReports> reports);

double voiceMeshVisualizerLevel(AudioVisualizerEvent event) {
  double level = 0;
  for (final Object? entry in event.event) {
    if (entry is num && entry > level) {
      level = entry.toDouble();
    }
  }
  return level.clamp(0, 1);
}

List<RTCRtpCodecCapability> _codecsByMime(
  List<RTCRtpCodecCapability> codecs,
  List<String> mimeTypes,
) {
  return <RTCRtpCodecCapability>[
    for (final String mimeType in mimeTypes)
      ...codecs.where(
        (RTCRtpCodecCapability codec) =>
            codec.mimeType.toLowerCase() == mimeType,
      ),
  ];
}

Future<void> restoreAutomaticAudioSessionAfterMesh() async {
  if (Platform.isAndroid &&
      AudioManager.instance.managementMode ==
          AudioSessionManagementMode.manual) {
    await AudioManager.instance.setAudioSessionManagementMode(
      AudioSessionManagementMode.automatic,
    );
  }
}

const Map<String, int> _kH264ProfileRanks = <String, int>{
  '6400': 0,
  '640c': 1,
  '42e0': 2,
  '4d00': 3,
  '4200': 4,
};
const int _kH264UnrankedProfileScore = 5;
const int _kH264MissingProfileScore = 6;
const int _kH264PacketizationMode0Score = 20;

String? _fmtpParameter(String? fmtpLine, String key) {
  for (final String part in (fmtpLine ?? '').split(';')) {
    final int separator = part.indexOf('=');
    final String name = separator < 0 ? part : part.substring(0, separator);
    if (name.trim().toLowerCase() != key) {
      continue;
    }
    final String value = separator < 0
        ? ''
        : part.substring(separator + 1).trim().toLowerCase();
    return value.isEmpty ? null : value;
  }
  return null;
}

int _h264CodecScore(RTCRtpCodecCapability codec) {
  final String? profileLevelId = _fmtpParameter(
    codec.sdpFmtpLine,
    'profile-level-id',
  );
  final int packetizationScore =
      _fmtpParameter(codec.sdpFmtpLine, 'packetization-mode') == '1'
      ? 0
      : _kH264PacketizationMode0Score;
  if (profileLevelId == null) {
    return packetizationScore + _kH264MissingProfileScore;
  }
  final String profile = profileLevelId.substring(
    0,
    math.min(4, profileLevelId.length),
  );
  return packetizationScore +
      (_kH264ProfileRanks[profile] ?? _kH264UnrankedProfileScore);
}

List<RTCRtpCodecCapability> _rankedH264Codecs(
  List<RTCRtpCodecCapability> codecs,
) {
  final List<RTCRtpCodecCapability> h264 = _codecsByMime(codecs, const <String>[
    'video/h264',
  ]);
  final List<int> order = List<int>.generate(h264.length, (int i) => i)
    ..sort((int a, int b) {
      final int byScore = _h264CodecScore(
        h264[a],
      ).compareTo(_h264CodecScore(h264[b]));
      return byScore != 0 ? byScore : a.compareTo(b);
    });
  return <RTCRtpCodecCapability>[for (final int i in order) h264[i]];
}

class VoiceMeshTransport extends ChangeNotifier implements VoiceMediaRoom {
  VoiceMeshTransport({
    required this.connectionId,
    required this.userId,
    required this.guildId,
    required this.channelId,
    required List<VoiceIceServer> iceServers,
    required this._sendSignal,
    required this._sendConnectionReports,
    required this._onRemoteAudioTrack,
  }) : iceServers = <Map<String, Object?>>[
         for (final VoiceIceServer server in iceServers)
           <String, Object?>{'urls': server.urls},
       ] {
    local = VoiceMeshLocalParticipant._(this);
  }

  final String connectionId;
  final String? userId;
  final String? guildId;
  final String channelId;
  final List<Map<String, Object?>> iceServers;
  final VoiceMeshSignalSink _sendSignal;
  final VoiceMeshConnectionReportSink _sendConnectionReports;
  final void Function(String userId) _onRemoteAudioTrack;
  late final VoiceMeshLocalParticipant local;

  final Map<String, VoiceMeshPeer> _peers = <String, VoiceMeshPeer>{};
  final Map<String, List<VoiceMeshSignal>> _inbox =
      <String, List<VoiceMeshSignal>>{};
  final Map<VoiceMeshSource, LocalTrack> _localTracks =
      <VoiceMeshSource, LocalTrack>{};
  CameraCaptureOptions? _cameraOptions;
  ScreenShareCaptureOptions? _screenShareOptions;
  int? _micMaxBitrate;
  bool _micMuted = true;
  bool _deafened = false;
  int _version = DateTime.now().millisecondsSinceEpoch;
  bool _closed = false;
  Future<List<RTCRtpCodecCapability>>? _videoCodecs;
  Future<List<RTCRtpCodecCapability>>? _audioCodecs;
  AudioVisualizer? _micVisualizer;
  EventsListener<AudioVisualizerEvent>? _micVisualizerListener;
  final Set<String> _speaking = <String>{};
  final Map<String, Timer> _speakingRelease = <String, Timer>{};
  final List<VoiceP2pConnectionReportsRequestReports> _connectionReports =
      <VoiceP2pConnectionReportsRequestReports>[];
  Timer? _connectionReportTimer;

  Iterable<VoiceMeshPeer> get peers => _peers.values;

  int get participantCount => _peers.length + 1;

  Set<String> get speakingKeys => Set<String>.unmodifiable(_speaking);

  bool get hasScreenShare =>
      _localTracks.containsKey(VoiceMeshSource.screenShare);

  LocalTrack? localTrack(VoiceMeshSource source) => _localTracks[source];

  int nextVersion() => ++_version;

  @override
  Iterable<VoiceMediaParticipant> get participants => <VoiceMediaParticipant>[
    local,
    ..._peers.values,
  ];

  @override
  VoiceMediaParticipant? participantFor({
    required VoiceState voice,
    required String userId,
    required String? currentUserId,
    required String? localConnectionId,
  }) {
    final String? id = voice.connectionId;
    if (id == null) {
      return null;
    }
    if (id == connectionId) {
      return local;
    }
    return _peers[id];
  }

  Future<void> start() async {
    if (Platform.isAndroid) {
      await AudioManager.instance.setAudioSessionOptions(
        const AudioSessionOptions.communication(),
      );
    }
  }

  ({int added, int removed}) syncRoster(Iterable<VoiceState> states) {
    if (_closed) {
      return (added: 0, removed: 0);
    }
    final Map<String, VoiceState> inChannel = <String, VoiceState>{
      for (final VoiceState state in states)
        if (state.channelId == channelId && state.connectionId != null)
          state.connectionId!: state,
    };
    final VoiceState? own = inChannel[connectionId];
    final Map<String, VoiceState> next = own == null || !own.p2p
        ? const <String, VoiceState>{}
        : <String, VoiceState>{
            for (final MapEntry<String, VoiceState> entry in inChannel.entries)
              if (entry.key != connectionId && entry.value.p2p)
                entry.key: entry.value,
          };
    int removed = 0;
    for (final String id in _peers.keys.toList()) {
      if (next.containsKey(id)) {
        continue;
      }
      final VoiceMeshPeer peer = _peers.remove(id)!;
      clearSpeaking(id);
      unawaited(peer.close());
      removed++;
    }
    int added = 0;
    for (final MapEntry<String, VoiceState> entry in next.entries) {
      final VoiceMeshPeer? existing = _peers[entry.key];
      if (existing != null) {
        existing.setServerMuted(muted: entry.value.mute);
        continue;
      }
      final VoiceMeshPeer peer = VoiceMeshPeer(
        transport: this,
        connectionId: entry.key,
        remoteUserId: entry.value.userId,
        deafened: _deafened,
        serverMuted: entry.value.mute,
      );
      _peers[entry.key] = peer;
      peer.start(inbox: _inbox.remove(entry.key) ?? const <VoiceMeshSignal>[]);
      added++;
    }
    if (added > 0 || removed > 0) {
      _syncAllSenders();
      notifyListeners();
    }
    return (added: added, removed: removed);
  }

  void handleSignal(VoiceSignalEvent event) {
    if (_closed || event.channelId != channelId) {
      return;
    }
    final VoiceMeshSignal? signal = parseVoiceMeshSignal(event.data);
    if (signal == null) {
      talker.debug(
        '[Voice][Mesh] Dropped malformed signal from ${event.from}.',
      );
      return;
    }
    final VoiceMeshPeer? peer = _peers[event.from];
    if (peer != null) {
      peer.handleSignal(signal);
      return;
    }
    final List<VoiceMeshSignal> inbox = _inbox.putIfAbsent(
      event.from,
      () => <VoiceMeshSignal>[],
    );
    if (inbox.length < _kInboxLimit) {
      inbox.add(signal);
    }
  }

  void handleGatewayResumed() {
    for (final VoiceMeshPeer peer in _peers.values) {
      peer.handleGatewayResumed();
    }
  }

  VoiceMeshSendResult send(String to, VoiceMeshSignal signal) {
    if (_closed) {
      return VoiceMeshSendResult.unsent;
    }
    final Map<String, Object?> data = signal.toJson();
    final int bytes = voiceSignalFrameBytes(
      guildId: guildId,
      channelId: channelId,
      to: to,
      data: data,
    );
    if (bytes > kVoiceSignalMaxJsonBytes) {
      return VoiceMeshSendResult.oversized;
    }
    final bool sent = _sendSignal(
      guildId: guildId,
      channelId: channelId,
      to: to,
      data: data,
    );
    return sent ? VoiceMeshSendResult.sent : VoiceMeshSendResult.unsent;
  }

  VoiceMeshTracks tracksSnapshot() {
    return VoiceMeshTracks(
      v: nextVersion(),
      tracks: <VoiceMeshTrackInfo>[
        for (final VoiceMeshSource source in VoiceMeshSource.values)
          if (_localTracks.containsKey(source))
            VoiceMeshTrackInfo(
              source: source,
              sid: voiceMeshTrackSid(connectionId, source),
              muted: source == VoiceMeshSource.microphone && _micMuted,
              width: _videoDimensions(source)?.width,
              height: _videoDimensions(source)?.height,
            ),
      ],
    );
  }

  VideoDimensions? _videoDimensions(VoiceMeshSource source) {
    return switch (source) {
      VoiceMeshSource.camera => _cameraOptions?.params.dimensions,
      VoiceMeshSource.screenShare => _screenShareOptions?.params.dimensions,
      VoiceMeshSource.microphone || VoiceMeshSource.screenShareAudio => null,
    };
  }

  RTCRtpEncoding? encodingFor(VoiceMeshSource source) {
    switch (source) {
      case VoiceMeshSource.microphone:
        final int? maxBitrate = _micMaxBitrate;
        return maxBitrate == null
            ? null
            : RTCRtpEncoding(
                maxBitrate: maxBitrate,
                numTemporalLayers: null,
                scaleResolutionDownBy: null,
              );
      case VoiceMeshSource.screenShareAudio:
        return RTCRtpEncoding(
          maxBitrate: kOpusMaxAudioBitrateBps,
          numTemporalLayers: null,
          scaleResolutionDownBy: null,
        );
      case VoiceMeshSource.camera:
        final VideoParameters? params = _cameraOptions?.params;
        final int budget = _kCameraBudgetBps ~/ math.max(1, _peers.length);
        int? frameRate = params?.encoding?.maxFramerate;
        double scale = 1;
        if (isFluxerMobileOs) {
          frameRate = math.min(
            frameRate ?? _kPhoneCameraMaxFrameRate,
            _kPhoneCameraMaxFrameRate,
          );
          final VideoDimensions? dimensions = params?.dimensions;
          final int shortSide = dimensions == null
              ? 0
              : math.min(dimensions.width, dimensions.height);
          if (shortSide > _kPhoneCameraMaxShortSide) {
            scale = shortSide / _kPhoneCameraMaxShortSide;
          }
        }
        return RTCRtpEncoding(
          maxBitrate: math.min(params?.encoding?.maxBitrate ?? budget, budget),
          maxFramerate: frameRate,
          scaleResolutionDownBy: scale,
        );
      case VoiceMeshSource.screenShare:
        final VideoParameters? params = _screenShareOptions?.params;
        final int watchers = _peers.values
            .where(
              (VoiceMeshPeer peer) =>
                  peer.wantsFromMe(VoiceMeshSource.screenShare),
            )
            .length;
        final int budget = _kScreenShareBudgetBps ~/ math.max(1, watchers);
        return RTCRtpEncoding(
          maxBitrate: math.min(params?.encoding?.maxBitrate ?? budget, budget),
          maxFramerate: params?.encoding?.maxFramerate,
        );
    }
  }

  Future<List<RTCRtpCodecCapability>> videoCodecPreferences() {
    return _videoCodecs ??= getRtpReceiverCapabilities('video').then((
      RTCRtpCapabilities capabilities,
    ) {
      final List<RTCRtpCodecCapability> codecs =
          capabilities.codecs ?? const <RTCRtpCodecCapability>[];
      return <RTCRtpCodecCapability>[
        ..._rankedH264Codecs(codecs),
        ..._codecsByMime(codecs, const <String>['video/vp8', 'video/rtx']),
      ];
    });
  }

  Future<List<RTCRtpCodecCapability>> audioCodecPreferences() {
    return _audioCodecs ??= getRtpReceiverCapabilities('audio').then(
      (RTCRtpCapabilities capabilities) => _codecsByMime(
        capabilities.codecs ?? const <RTCRtpCodecCapability>[],
        const <String>['audio/red', 'audio/opus'],
      ),
    );
  }

  void onPeerWantsChanged() {
    _syncAllSenders();
  }

  void onPeerStatusChanged() {
    if (!_closed) {
      notifyListeners();
    }
  }

  void onPeerAudioTrackAdded(VoiceMeshPeer peer) {
    if (!_closed) {
      _onRemoteAudioTrack(peer.remoteUserId);
    }
  }

  void queueConnectionReport(VoiceP2pConnectionReportsRequestReports report) {
    if (_closed) {
      return;
    }
    _connectionReports.add(report);
    if (_connectionReports.length >= _kConnectionReportBatchLimit) {
      _flushConnectionReports();
      return;
    }
    _connectionReportTimer ??= Timer(
      _kConnectionReportDelay,
      _flushConnectionReports,
    );
  }

  void _flushConnectionReports() {
    _connectionReportTimer?.cancel();
    _connectionReportTimer = null;
    if (_connectionReports.isEmpty) {
      return;
    }
    final List<VoiceP2pConnectionReportsRequestReports> reports =
        List<VoiceP2pConnectionReportsRequestReports>.of(_connectionReports);
    _connectionReports.clear();
    _sendConnectionReports(reports);
  }

  void _syncAllSenders() {
    for (final VoiceMeshPeer peer in _peers.values) {
      peer.syncSenders();
    }
  }

  void _publishLocalChange() {
    if (_closed) {
      return;
    }
    local._notify();
    final VoiceMeshTracks tracks = tracksSnapshot();
    for (final VoiceMeshPeer peer in _peers.values) {
      peer.sendTracks(tracks);
    }
    _syncAllSenders();
  }

  void reportLevel(String key, double level) {
    if (_closed) {
      return;
    }
    if (level >= _kSpeakingLevel) {
      _speakingRelease.remove(key)?.cancel();
      if (_speaking.add(key)) {
        notifyListeners();
      }
      return;
    }
    if (!_speaking.contains(key) || _speakingRelease.containsKey(key)) {
      return;
    }
    _speakingRelease[key] = Timer(_kSpeakingRelease, () {
      _speakingRelease.remove(key);
      if (!_closed && _speaking.remove(key)) {
        notifyListeners();
      }
    });
  }

  void clearSpeaking(String key) {
    _speakingRelease.remove(key)?.cancel();
    if (_speaking.remove(key) && !_closed) {
      notifyListeners();
    }
  }

  void setDeafened({required bool deafened}) {
    _deafened = deafened;
    for (final VoiceMeshPeer peer in _peers.values) {
      peer.setDeafened(deafened: deafened);
    }
  }

  Future<void> setMicrophoneEnabled({
    required bool enabled,
    required AudioCaptureOptions options,
    required double inputGain,
    required int? maxBitrate,
  }) async {
    _micMaxBitrate = maxBitrate;
    final LocalTrack? existing = _localTracks[VoiceMeshSource.microphone];
    if (!enabled) {
      if (existing != null) {
        existing.mediaStreamTrack.enabled = false;
      }
      if (!_micMuted) {
        _micMuted = true;
        _publishLocalChange();
      }
      return;
    }
    if (existing == null) {
      await _openMicrophone(options: options, inputGain: inputGain);
    } else {
      existing.mediaStreamTrack.enabled = true;
    }
    _micMuted = false;
    _publishLocalChange();
  }

  Future<void> refreshMicrophone({
    required AudioCaptureOptions options,
    required double inputGain,
  }) async {
    if (!_localTracks.containsKey(VoiceMeshSource.microphone)) {
      return;
    }
    await _openMicrophone(options: options, inputGain: inputGain);
    _localTracks[VoiceMeshSource.microphone]?.mediaStreamTrack.enabled =
        !_micMuted;
    _publishLocalChange();
  }

  Future<void> applyInputGain(double inputGain) async {
    final LocalTrack? track = _localTracks[VoiceMeshSource.microphone];
    if (track == null) {
      return;
    }
    await Helper.setVolume(inputGain, track.mediaStreamTrack);
  }

  Future<void> _openMicrophone({
    required AudioCaptureOptions options,
    required double inputGain,
  }) async {
    final LocalAudioTrack track = await LocalAudioTrack.create(options);
    if (_closed) {
      await track.dispose();
      return;
    }
    await track.start();
    await Helper.setVolume(inputGain, track.mediaStreamTrack);
    await _stopMicVisualizer();
    await _replaceLocalTrack(VoiceMeshSource.microphone, track);
    if (_closed) {
      return;
    }
    final AudioVisualizer visualizer = createVisualizer(
      track,
      options: const AudioVisualizerOptions(barCount: 8),
    );
    _micVisualizer = visualizer;
    _micVisualizerListener = visualizer.createListener()
      ..on<AudioVisualizerEvent>((AudioVisualizerEvent event) {
        reportLevel(connectionId, voiceMeshVisualizerLevel(event));
      });
    try {
      await visualizer.start();
    } on Object catch (error) {
      talker.debug('[Voice][Mesh] Local visualizer failed: $error');
    }
  }

  Future<void> _stopMicVisualizer() async {
    final AudioVisualizer? visualizer = _micVisualizer;
    final EventsListener<AudioVisualizerEvent>? listener =
        _micVisualizerListener;
    _micVisualizer = null;
    _micVisualizerListener = null;
    await listener?.dispose();
    if (visualizer != null) {
      await visualizer.stop();
      await visualizer.dispose();
    }
    clearSpeaking(connectionId);
  }

  Future<void> setCamera(CameraCaptureOptions? options) async {
    if (options == null) {
      _cameraOptions = null;
      await _replaceLocalTrack(VoiceMeshSource.camera, null);
      _publishLocalChange();
      return;
    }
    if (_localTracks.containsKey(VoiceMeshSource.camera)) {
      await applyCameraOptions(options);
      return;
    }
    await _openCamera(options);
  }

  Future<void> applyCameraOptions(CameraCaptureOptions options) async {
    final LocalTrack? track = _localTracks[VoiceMeshSource.camera];
    if (track is! LocalVideoTrack) {
      return;
    }
    final VideoCaptureOptions current = track.currentOptions;
    if (current is CameraCaptureOptions) {
      if (cameraCaptureOptionsMatch(current, options)) {
        return;
      }
      if (isNativeMobileVoiceCameraPlatform() &&
          isCameraFacingOnlyChange(current: current, next: options)) {
        await Helper.switchCamera(track.mediaStreamTrack);
        track.currentOptions = current.copyWith(
          cameraPosition: options.cameraPosition,
        );
        _cameraOptions = options;
        return;
      }
    }
    await _openCamera(options);
  }

  Future<void> restartCamera(CameraCaptureOptions options) async {
    if (!_localTracks.containsKey(VoiceMeshSource.camera)) {
      return;
    }
    await _openCamera(options);
  }

  Future<void> _openCamera(CameraCaptureOptions options) async {
    final LocalVideoTrack track = await LocalVideoTrack.createCameraTrack(
      options,
    );
    if (_closed) {
      await track.dispose();
      return;
    }
    await track.start();
    _cameraOptions = options;
    await _replaceLocalTrack(VoiceMeshSource.camera, track);
    _publishLocalChange();
  }

  Future<void> setScreenShare(ScreenShareCaptureOptions? options) async {
    if (options == null) {
      _screenShareOptions = null;
      await _replaceLocalTrack(VoiceMeshSource.screenShare, null);
      await _replaceLocalTrack(VoiceMeshSource.screenShareAudio, null);
      _publishLocalChange();
      return;
    }
    final List<LocalTrack> tracks =
        await LocalVideoTrack.createScreenShareTracksWithAudio(options);
    if (_closed) {
      for (final LocalTrack track in tracks) {
        await track.dispose();
      }
      return;
    }
    LocalVideoTrack? video;
    LocalAudioTrack? audio;
    for (final LocalTrack track in tracks) {
      await track.start();
      if (track is LocalVideoTrack) {
        video = track;
      } else if (track is LocalAudioTrack) {
        audio = track;
      }
    }
    _screenShareOptions = options;
    await _replaceLocalTrack(VoiceMeshSource.screenShare, video);
    await _replaceLocalTrack(VoiceMeshSource.screenShareAudio, audio);
    if (video != null) {
      final LocalVideoTrack shared = video;
      shared.mediaStreamTrack.onEnded = () {
        if (identical(_localTracks[VoiceMeshSource.screenShare], shared)) {
          unawaited(setScreenShare(null));
        }
      };
    }
    _publishLocalChange();
  }

  Future<void> _replaceLocalTrack(
    VoiceMeshSource source,
    LocalTrack? track,
  ) async {
    if (_closed && track != null) {
      await track.dispose();
      return;
    }
    final LocalTrack? previous = track == null
        ? _localTracks.remove(source)
        : _localTracks[source];
    if (track != null) {
      _localTracks[source] = track;
    }
    if (previous != null && !identical(previous, track)) {
      try {
        await previous.dispose();
      } on Object catch (error) {
        talker.debug('[Voice][Mesh] Local track dispose failed: $error');
      }
    }
  }

  Future<int?> roundTripMs() async {
    int? worst;
    for (final VoiceMeshPeer peer in _peers.values.toList()) {
      for (final StatsReport report in await peer.getStats()) {
        if (report.type != 'candidate-pair' ||
            report.values['state'] != 'succeeded') {
          continue;
        }
        final Object? rtt = report.values['currentRoundTripTime'];
        if (rtt is num) {
          final int ms = (rtt * 1000).round();
          worst = worst == null ? ms : math.max(worst, ms);
        }
      }
    }
    return worst;
  }

  Future<void> close({bool handOffAudioSession = false}) async {
    if (_closed) {
      return;
    }
    _flushConnectionReports();
    _closed = true;
    if (Platform.isAndroid && handOffAudioSession) {
      unawaited(
        AudioManager.instance.setAudioSessionManagementMode(
          AudioSessionManagementMode.automatic,
        ),
      );
    }
    for (final Timer timer in _speakingRelease.values) {
      timer.cancel();
    }
    _speakingRelease.clear();
    _speaking.clear();
    _inbox.clear();
    final List<VoiceMeshPeer> peers = _peers.values.toList();
    _peers.clear();
    await _stopMicVisualizer();
    for (final VoiceMeshPeer peer in peers) {
      await peer.close();
    }
    for (final VoiceMeshSource source in VoiceMeshSource.values) {
      await _replaceLocalTrack(source, null);
    }
    if (Platform.isAndroid && !handOffAudioSession) {
      await AudioManager.instance.deactivateAudioSession();
    }
  }
}

class VoiceMeshLocalParticipant extends ChangeNotifier
    implements VoiceMediaParticipant {
  VoiceMeshLocalParticipant._(this._transport);

  final VoiceMeshTransport _transport;

  void _notify() => notifyListeners();

  LocalVideoTrack? _videoTrack(VoiceMeshSource source) {
    final LocalTrack? track = _transport.localTrack(source);
    return track is LocalVideoTrack ? track : null;
  }

  @override
  String get identity => _transport.connectionId;

  @override
  String? get userId => _transport.userId;

  @override
  bool get hasCamera => cameraTrack != null;

  @override
  VideoTrack? get cameraTrack => _videoTrack(VoiceMeshSource.camera);

  @override
  bool get hasScreenShare => screenShareTrack != null;

  @override
  VideoTrack? get screenShareTrack => _videoTrack(VoiceMeshSource.screenShare);

  @override
  bool get hasScreenShareAudio => screenShareAudioTrack != null;

  @override
  AudioTrack? get screenShareAudioTrack {
    final LocalTrack? track = _transport.localTrack(
      VoiceMeshSource.screenShareAudio,
    );
    return track is LocalAudioTrack ? track : null;
  }

  @override
  VideoDimensions? get screenShareDimensions =>
      _transport._videoDimensions(VoiceMeshSource.screenShare);

  @override
  Iterable<AudioTrack> get voiceAudioTracks => const <AudioTrack>[];

  @override
  bool get directConnectionFailed => false;

  @override
  Future<void> setVideoWanted(
    TrackSource source, {
    required bool wanted,
    VideoQuality? quality,
  }) async {}

  @override
  Future<void> setScreenShareAudioWanted({required bool wanted}) async {}
}
