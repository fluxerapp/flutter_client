import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart';
import 'package:fluxer_app/core/talker.dart';
import 'package:fluxer_app/features/voice/domain/voice_media_participant.dart';
import 'package:fluxer_app/features/voice/services/mesh/voice_mesh_signal.dart';
import 'package:fluxer_app/features/voice/services/mesh/voice_mesh_transport.dart';
import 'package:fluxer_dart/export.dart';
import 'package:livekit_client/livekit_client.dart';

const Duration _kSetupDeadline = Duration(seconds: 15);
const Duration _kDisconnectedGrace = Duration(seconds: 5);
const Duration _kRestartDeadline = Duration(seconds: 10);
const int _kMaxPendingRemoteCandidates = 64;

enum VoiceMeshPeerStatus { connecting, connected, failed }

typedef VoiceMeshSelectedPath = ({
  VoiceP2pConnectionReportsRequestReportsLocalCandidateTypeLocalCandidateType?
  localType,
  VoiceP2pConnectionReportsRequestReportsRemoteCandidateTypeRemoteCandidateType?
  remoteType,
  VoiceP2pConnectionReportsRequestReportsIpFamilyIpFamily? ipFamily,
  VoiceP2pConnectionReportsRequestReportsProtocolProtocol? protocol,
});

const VoiceMeshSelectedPath _kNoSelectedPath = (
  localType: null,
  remoteType: null,
  ipFamily: null,
  protocol: null,
);

T? _wireEnum<T extends Enum>(
  Iterable<T> values,
  String? Function(T) json,
  Object? raw,
) {
  if (raw is! String) {
    return null;
  }
  final String value = raw.toLowerCase();
  return values.where((T entry) => json(entry) == value).firstOrNull;
}

VoiceP2pConnectionReportsRequestReportsIpFamilyIpFamily? _ipFamily(
  Object? address,
) {
  if (address is! String) {
    return null;
  }
  return switch (InternetAddress.tryParse(address)?.type) {
    InternetAddressType.IPv4 =>
      VoiceP2pConnectionReportsRequestReportsIpFamilyIpFamily.ipv4,
    InternetAddressType.IPv6 =>
      VoiceP2pConnectionReportsRequestReportsIpFamilyIpFamily.ipv6,
    _ => null,
  };
}

VoiceMeshSelectedPath voiceMeshSelectedPath(List<StatsReport> stats) {
  final Map<String, StatsReport> byId = <String, StatsReport>{
    for (final StatsReport report in stats) report.id: report,
  };
  StatsReport? pair;
  for (final StatsReport report in stats) {
    if (report.type == 'transport') {
      pair ??= byId[report.values['selectedCandidatePairId']];
    }
  }
  pair ??= stats
      .where(
        (StatsReport report) =>
            report.type == 'candidate-pair' &&
            report.values['state'] == 'succeeded' &&
            report.values['nominated'] == true,
      )
      .firstOrNull;
  if (pair == null) {
    return _kNoSelectedPath;
  }
  final Map<dynamic, dynamic>? local =
      byId[pair.values['localCandidateId']]?.values;
  final Map<dynamic, dynamic>? remote =
      byId[pair.values['remoteCandidateId']]?.values;
  return (
    localType: _wireEnum(
      VoiceP2pConnectionReportsRequestReportsLocalCandidateTypeLocalCandidateType
          .$valuesDefined,
      (
        VoiceP2pConnectionReportsRequestReportsLocalCandidateTypeLocalCandidateType
        entry,
      ) => entry.json,
      local?['candidateType'],
    ),
    remoteType: _wireEnum(
      VoiceP2pConnectionReportsRequestReportsRemoteCandidateTypeRemoteCandidateType
          .$valuesDefined,
      (
        VoiceP2pConnectionReportsRequestReportsRemoteCandidateTypeRemoteCandidateType
        entry,
      ) => entry.json,
      remote?['candidateType'],
    ),
    ipFamily:
        _ipFamily(local?['address'] ?? local?['ip']) ??
        _ipFamily(remote?['address'] ?? remote?['ip']),
    protocol: _wireEnum(
      VoiceP2pConnectionReportsRequestReportsProtocolProtocol.$valuesDefined,
      (VoiceP2pConnectionReportsRequestReportsProtocolProtocol entry) =>
          entry.json,
      local?['protocol'],
    ),
  );
}

class VoiceMeshPeer extends ChangeNotifier implements VoiceMediaParticipant {
  VoiceMeshPeer({
    required VoiceMeshTransport transport,
    required this.connectionId,
    required this.remoteUserId,
    required this._deafened,
    required this._serverMuted,
  }) : _transport = transport,
       isOfferer = transport.connectionId.compareTo(connectionId) < 0;

  final VoiceMeshTransport _transport;
  final String connectionId;
  final String remoteUserId;
  final bool isOfferer;

  int _g = 0;
  RTCPeerConnection? _pc;
  List<RTCRtpTransceiver> _transceivers = const <RTCRtpTransceiver>[];
  final Map<VoiceMeshSource, String?> _sentTrackIds =
      <VoiceMeshSource, String?>{};
  bool _remoteDescriptionSet = false;
  bool _hasAnswer = false;
  bool _localDescriptionSent = false;
  final List<RTCIceCandidate> _pendingRemoteCandidates = <RTCIceCandidate>[];
  final List<VoiceMeshCandidate> _pendingLocalCandidates =
      <VoiceMeshCandidate>[];
  Future<void> _queue = Future<void>.value();
  bool _closed = false;
  VoiceMeshPeerStatus _status = VoiceMeshPeerStatus.connecting;
  bool _restartUsed = false;
  bool _iceRestarted = false;
  bool _settled = false;
  final Stopwatch _setupClock = Stopwatch()..start();
  Timer? _setupTimer;
  Timer? _disconnectedTimer;
  Timer? _restartTimer;

  int _remoteTracksVersion = -1;
  Map<VoiceMeshSource, VoiceMeshTrackInfo> _published =
      <VoiceMeshSource, VoiceMeshTrackInfo>{};
  int _remoteWantVersion = -1;
  Set<String> _remoteWants = <String>{};

  final Map<VoiceMeshSource, Track> _remoteTracks = <VoiceMeshSource, Track>{};
  final Set<VoiceMeshSource> _attached = <VoiceMeshSource>{};
  AudioVisualizer? _visualizer;
  EventsListener<AudioVisualizerEvent>? _visualizerListener;

  bool _cameraWanted = false;
  bool _screenWanted = false;
  bool _screenAudioWanted = false;
  bool _deafened;
  bool _serverMuted;
  String? _lastSentWant;

  VoiceMeshPeerStatus get status => _status;

  bool get _isFailed => _status == VoiceMeshPeerStatus.failed;

  bool wantsFromMe(VoiceMeshSource source) {
    return _remoteWants.contains(
      voiceMeshTrackSid(_transport.connectionId, source),
    );
  }

  @override
  String get identity => connectionId;

  @override
  String? get userId => remoteUserId;

  @override
  bool get hasCamera => _published.containsKey(VoiceMeshSource.camera);

  @override
  VideoTrack? get cameraTrack => _attachedTrack(VoiceMeshSource.camera);

  @override
  bool get hasScreenShare =>
      _published.containsKey(VoiceMeshSource.screenShare);

  @override
  VideoTrack? get screenShareTrack =>
      _attachedTrack(VoiceMeshSource.screenShare);

  @override
  bool get hasScreenShareAudio =>
      _published.containsKey(VoiceMeshSource.screenShareAudio);

  @override
  AudioTrack? get screenShareAudioTrack =>
      _attachedTrack(VoiceMeshSource.screenShareAudio);

  @override
  VideoDimensions? get screenShareDimensions {
    final VoiceMeshTrackInfo? info = _published[VoiceMeshSource.screenShare];
    final int? width = info?.width;
    final int? height = info?.height;
    if (width == null || height == null) {
      return null;
    }
    return VideoDimensions(width, height);
  }

  @override
  Iterable<AudioTrack> get voiceAudioTracks sync* {
    final Track? track = _remoteTracks[VoiceMeshSource.microphone];
    if (track is AudioTrack) {
      yield track;
    }
  }

  @override
  bool get directConnectionFailed => _isFailed;

  T? _attachedTrack<T extends Track>(VoiceMeshSource source) {
    if (!_attached.contains(source)) {
      return null;
    }
    final Track? track = _remoteTracks[source];
    return track is T ? track : null;
  }

  @override
  Future<void> setVideoWanted(
    TrackSource source, {
    required bool wanted,
    VideoQuality? quality,
  }) async {
    if (source == TrackSource.camera) {
      _cameraWanted = wanted;
    } else if (source == TrackSource.screenShareVideo) {
      _screenWanted = wanted;
    } else {
      return;
    }
    _syncWant();
  }

  @override
  Future<void> setScreenShareAudioWanted({required bool wanted}) async {
    _screenAudioWanted = wanted;
    _syncWant();
  }

  void setDeafened({required bool deafened}) {
    _deafened = deafened;
    _syncWant();
  }

  void setServerMuted({required bool muted}) {
    if (_serverMuted == muted) {
      return;
    }
    _serverMuted = muted;
    _syncReceivers();
  }

  bool _locallyWanted(VoiceMeshSource source) {
    return switch (source) {
      VoiceMeshSource.microphone => !_deafened,
      VoiceMeshSource.camera => _cameraWanted,
      VoiceMeshSource.screenShare => _screenWanted,
      VoiceMeshSource.screenShareAudio => _screenAudioWanted,
    };
  }

  void start({required List<VoiceMeshSignal> inbox}) {
    _armSetupDeadline();
    sendTracks(_transport.tracksSnapshot());
    _syncWant(force: true);
    for (final VoiceMeshSignal signal in inbox) {
      handleSignal(signal);
    }
    _enqueue(() async {
      if (isOfferer && _pc == null) {
        await _startGeneration();
      } else if (!isOfferer && _g == 0) {
        _send(const VoiceMeshNeedOffer(g: 0));
      }
    });
  }

  void handleGatewayResumed() {
    if (_closed || _isFailed) {
      return;
    }
    sendTracks(_transport.tracksSnapshot());
    _syncWant(force: true);
    if (_status == VoiceMeshPeerStatus.connected) {
      return;
    }
    _enqueue(() async {
      if (isOfferer) {
        await _startGeneration();
      } else {
        _send(const VoiceMeshNeedOffer(g: 0));
      }
    });
  }

  void sendTracks(VoiceMeshTracks tracks) {
    if (_closed) {
      return;
    }
    _send(tracks);
  }

  void _syncWant({bool force = false}) {
    if (_closed) {
      return;
    }
    final List<String> sids = <String>[
      for (final VoiceMeshSource source in VoiceMeshSource.values)
        if (_locallyWanted(source)) voiceMeshTrackSid(connectionId, source),
    ];
    final String key = sids.join(',');
    _syncReceivers();
    if (!force && key == _lastSentWant) {
      return;
    }
    _lastSentWant = key;
    _send(VoiceMeshWant(v: _transport.nextVersion(), sids: sids));
  }

  void handleSignal(VoiceMeshSignal signal) {
    if (_closed) {
      return;
    }
    switch (signal) {
      case VoiceMeshTracks():
        _handleTracks(signal);
      case VoiceMeshWant():
        _handleWant(signal);
      case VoiceMeshOffer():
        _enqueue(() => _handleOffer(signal));
      case VoiceMeshAnswer():
        _enqueue(() => _handleAnswer(signal));
      case VoiceMeshIce():
        _enqueue(() => _handleIce(signal));
      case VoiceMeshNeedOffer():
        _enqueue(() => _handleNeedOffer(signal));
    }
  }

  void _handleTracks(VoiceMeshTracks signal) {
    if (signal.v <= _remoteTracksVersion) {
      return;
    }
    _remoteTracksVersion = signal.v;
    _published = <VoiceMeshSource, VoiceMeshTrackInfo>{
      for (final VoiceMeshTrackInfo track in signal.tracks)
        if (track.sid == voiceMeshTrackSid(connectionId, track.source))
          track.source: track,
    };
    _syncReceivers(force: true);
  }

  void _handleWant(VoiceMeshWant signal) {
    if (signal.v <= _remoteWantVersion) {
      return;
    }
    _remoteWantVersion = signal.v;
    _remoteWants = signal.sids.toSet();
    _transport.onPeerWantsChanged();
  }

  void _enqueue(Future<void> Function() task) {
    _queue = _queue.then((_) async {
      if (_closed) {
        return;
      }
      try {
        await task();
      } on Object catch (error, stackTrace) {
        talker.warning(
          '[Voice][Mesh] Peer task failed (peer=$connectionId): $error',
          error,
          stackTrace,
        );
      }
    });
  }

  bool _isCurrent(RTCPeerConnection pc) => !_closed && identical(pc, _pc);

  Future<RTCPeerConnection?> _openPeerConnection() async {
    await _closePeerConnection();
    final RTCPeerConnection pc = await createPeerConnection(<String, dynamic>{
      'iceServers': _transport.iceServers,
      'bundlePolicy': 'max-bundle',
      'sdpSemantics': 'unified-plan',
    });
    if (_closed) {
      await pc.close();
      await pc.dispose();
      return null;
    }
    _pc = pc;
    _remoteDescriptionSet = false;
    _hasAnswer = false;
    _localDescriptionSent = false;
    _pendingRemoteCandidates.clear();
    _pendingLocalCandidates.clear();
    _sentTrackIds.clear();
    _restartUsed = false;
    _setStatus(VoiceMeshPeerStatus.connecting);
    _armSetupDeadline();
    pc
      ..onIceCandidate = (RTCIceCandidate candidate) {
        if (!_isCurrent(pc)) {
          return;
        }
        _onLocalCandidate(candidate);
      }
      ..onConnectionState = (RTCPeerConnectionState state) {
        if (!_isCurrent(pc)) {
          return;
        }
        _onConnectionState(state);
      }
      ..onTrack = (RTCTrackEvent event) {
        if (!_isCurrent(pc)) {
          return;
        }
        unawaited(_onRemoteTrack(pc, event));
      };
    return pc;
  }

  Future<void> _startGeneration() async {
    _g = _g == 0 ? DateTime.now().millisecondsSinceEpoch : _g + 1;
    final RTCPeerConnection? pc = await _openPeerConnection();
    if (pc == null) {
      return;
    }
    final List<RTCRtpTransceiver> transceivers = <RTCRtpTransceiver>[];
    for (final VoiceMeshSource source in VoiceMeshSource.values) {
      final RTCRtpTransceiver transceiver = await pc.addTransceiver(
        kind: source.kind == 'audio'
            ? RTCRtpMediaType.RTCRtpMediaTypeAudio
            : RTCRtpMediaType.RTCRtpMediaTypeVideo,
        init: RTCRtpTransceiverInit(direction: TransceiverDirection.SendRecv),
      );
      if (!_isCurrent(pc)) {
        return;
      }
      transceivers.add(transceiver);
    }
    _transceivers = transceivers;
    await _applyCodecPreferences(pc);
    await _syncSendersNow(pc);
    if (!_isCurrent(pc)) {
      return;
    }
    final RTCSessionDescription offer = await pc.createOffer();
    if (!_isCurrent(pc)) {
      return;
    }
    await pc.setLocalDescription(offer);
    if (!_isCurrent(pc)) {
      return;
    }
    _sendDescription(VoiceMeshOffer(g: _g, sdp: offer.sdp ?? ''));
  }

  Future<void> _iceRestart() async {
    final RTCPeerConnection? pc = _pc;
    if (pc == null || !isOfferer) {
      return;
    }
    _localDescriptionSent = false;
    await pc.restartIce();
    final RTCSessionDescription offer = await pc.createOffer();
    if (!_isCurrent(pc)) {
      return;
    }
    await pc.setLocalDescription(offer);
    if (!_isCurrent(pc)) {
      return;
    }
    _hasAnswer = false;
    _sendDescription(VoiceMeshOffer(g: _g, sdp: offer.sdp ?? ''));
  }

  Future<void> _handleOffer(VoiceMeshOffer signal) async {
    if (isOfferer || _isFailed || signal.g < _g) {
      return;
    }
    final bool fresh = signal.g > _g || _pc == null;
    RTCPeerConnection? pc = _pc;
    if (fresh) {
      _g = signal.g;
      pc = await _openPeerConnection();
    } else {
      _iceRestarted = true;
    }
    if (pc == null || !_isCurrent(pc)) {
      return;
    }
    _localDescriptionSent = false;
    await pc.setRemoteDescription(
      RTCSessionDescription(
        voiceMeshAssignRemoteStreams(signal.sdp, connectionId),
        'offer',
      ),
    );
    if (!_isCurrent(pc)) {
      return;
    }
    if (fresh) {
      final List<RTCRtpTransceiver> all = await pc.getTransceivers();
      if (!_isCurrent(pc)) {
        return;
      }
      if (all.length < VoiceMeshSource.values.length) {
        talker.warning(
          '[Voice][Mesh] Offer has ${all.length} media sections '
          '(peer=$connectionId).',
        );
        _fail();
        return;
      }
      _transceivers = all.take(VoiceMeshSource.values.length).toList();
      for (final RTCRtpTransceiver transceiver in _transceivers) {
        await transceiver.setDirection(TransceiverDirection.SendRecv);
      }
      await _applyCodecPreferences(pc);
    }
    await _applyPendingRemoteCandidates(pc);
    await _syncSendersNow(pc);
    if (!_isCurrent(pc)) {
      return;
    }
    final RTCSessionDescription answer = await pc.createAnswer();
    if (!_isCurrent(pc)) {
      return;
    }
    await pc.setLocalDescription(answer);
    if (!_isCurrent(pc)) {
      return;
    }
    _sendDescription(VoiceMeshAnswer(g: _g, sdp: answer.sdp ?? ''));
  }

  Future<void> _handleAnswer(VoiceMeshAnswer signal) async {
    final RTCPeerConnection? pc = _pc;
    if (!isOfferer || pc == null || signal.g != _g || _hasAnswer) {
      return;
    }
    await pc.setRemoteDescription(
      RTCSessionDescription(
        voiceMeshAssignRemoteStreams(signal.sdp, connectionId),
        'answer',
      ),
    );
    if (!_isCurrent(pc)) {
      return;
    }
    _hasAnswer = true;
    await _applyPendingRemoteCandidates(pc);
  }

  Future<void> _handleIce(VoiceMeshIce signal) async {
    final RTCPeerConnection? pc = _pc;
    final VoiceMeshCandidate? candidate = signal.candidate;
    if (pc == null || signal.g != _g || candidate == null) {
      return;
    }
    final RTCIceCandidate iceCandidate = RTCIceCandidate(
      candidate.candidate,
      candidate.sdpMid,
      candidate.sdpMLineIndex,
    );
    if (!_remoteDescriptionSet) {
      if (_pendingRemoteCandidates.length < _kMaxPendingRemoteCandidates) {
        _pendingRemoteCandidates.add(iceCandidate);
      }
      return;
    }
    await pc.addCandidate(iceCandidate);
  }

  Future<void> _handleNeedOffer(VoiceMeshNeedOffer signal) async {
    if (!isOfferer || _isFailed) {
      return;
    }
    if (signal.restart) {
      if (_pc != null && signal.g == _g) {
        _onTransportTrouble();
      }
      return;
    }
    if (signal.g == _g && _hasAnswer) {
      return;
    }
    await _startGeneration();
  }

  Future<void> _applyPendingRemoteCandidates(RTCPeerConnection pc) async {
    _remoteDescriptionSet = true;
    final List<RTCIceCandidate> pending = List<RTCIceCandidate>.of(
      _pendingRemoteCandidates,
    );
    _pendingRemoteCandidates.clear();
    for (final RTCIceCandidate candidate in pending) {
      if (!_isCurrent(pc)) {
        return;
      }
      await pc.addCandidate(candidate);
    }
  }

  void _sendDescription(VoiceMeshSignal description) {
    _send(description);
    _localDescriptionSent = true;
    final List<VoiceMeshCandidate> pending = List<VoiceMeshCandidate>.of(
      _pendingLocalCandidates,
    );
    _pendingLocalCandidates.clear();
    for (final VoiceMeshCandidate candidate in pending) {
      _send(VoiceMeshIce(g: _g, candidate: candidate));
    }
  }

  void _onLocalCandidate(RTCIceCandidate candidate) {
    final String? value = candidate.candidate;
    if (value == null || value.isEmpty) {
      return;
    }
    final VoiceMeshCandidate meshCandidate = VoiceMeshCandidate(
      candidate: value,
      sdpMid: candidate.sdpMid,
      sdpMLineIndex: candidate.sdpMLineIndex,
    );
    if (!_localDescriptionSent) {
      _pendingLocalCandidates.add(meshCandidate);
      return;
    }
    _send(VoiceMeshIce(g: _g, candidate: meshCandidate));
  }

  void _send(VoiceMeshSignal signal) {
    if (_closed || _isFailed) {
      return;
    }
    final VoiceMeshSendResult result = _transport.send(connectionId, signal);
    if (result == VoiceMeshSendResult.oversized) {
      talker.warning(
        '[Voice][Mesh] Signal over $kVoiceSignalMaxJsonBytes bytes '
        '(peer=$connectionId).',
      );
      _fail();
    }
  }

  Future<void> _applyCodecPreferences(RTCPeerConnection pc) async {
    final List<RTCRtpCodecCapability> video = await _transport
        .videoCodecPreferences();
    final List<RTCRtpCodecCapability> audio = await _transport
        .audioCodecPreferences();
    for (int i = 0; i < _transceivers.length; i++) {
      if (!_isCurrent(pc)) {
        return;
      }
      final List<RTCRtpCodecCapability> codecs =
          VoiceMeshSource.values[i].kind == 'video' ? video : audio;
      if (codecs.isEmpty) {
        continue;
      }
      try {
        await _transceivers[i].setCodecPreferences(codecs);
      } on Object catch (error) {
        talker.warning('[Voice][Mesh] setCodecPreferences failed: $error');
      }
    }
  }

  void syncSenders() {
    final RTCPeerConnection? pc = _pc;
    if (pc == null || _closed) {
      return;
    }
    _enqueue(() => _syncSendersNow(pc));
  }

  Future<void> _syncSendersNow(RTCPeerConnection pc) async {
    for (int i = 0; i < _transceivers.length; i++) {
      if (!_isCurrent(pc)) {
        return;
      }
      final VoiceMeshSource source = VoiceMeshSource.values[i];
      final RTCRtpSender sender = _transceivers[i].sender;
      final LocalTrack? local = _transport.localTrack(source);
      final MediaStreamTrack? target = local != null && wantsFromMe(source)
          ? local.mediaStreamTrack
          : null;
      if (!_sentTrackIds.containsKey(source) ||
          _sentTrackIds[source] != target?.id) {
        await sender.replaceTrack(target);
        _sentTrackIds[source] = target?.id;
      }
      final RTCRtpEncoding? encoding = target == null
          ? null
          : _transport.encodingFor(source);
      if (encoding == null) {
        continue;
      }
      try {
        await sender.setParameters(
          RTCRtpParameters(encodings: <RTCRtpEncoding>[encoding]),
        );
      } on Object catch (error) {
        talker.debug('[Voice][Mesh] setParameters failed: $error');
      }
    }
  }

  Future<void> _onRemoteTrack(RTCPeerConnection pc, RTCTrackEvent event) async {
    if (event.streams.isEmpty) {
      return;
    }
    final String streamId = event.streams.first.id;
    VoiceMeshSource? source;
    for (final VoiceMeshSource candidate in VoiceMeshSource.values) {
      if (voiceMeshTrackSid(connectionId, candidate) == streamId) {
        source = candidate;
      }
    }
    if (source == null) {
      return;
    }
    final Track track = switch (source) {
      VoiceMeshSource.microphone => RemoteAudioTrack(
        TrackSource.microphone,
        event.streams.first,
        event.track,
        receiver: event.receiver,
      ),
      VoiceMeshSource.screenShareAudio => RemoteAudioTrack(
        TrackSource.screenShareAudio,
        event.streams.first,
        event.track,
        receiver: event.receiver,
      ),
      VoiceMeshSource.camera => RemoteVideoTrack(
        TrackSource.camera,
        event.streams.first,
        event.track,
        receiver: event.receiver,
      ),
      VoiceMeshSource.screenShare => RemoteVideoTrack(
        TrackSource.screenShareVideo,
        event.streams.first,
        event.track,
        receiver: event.receiver,
      ),
    };
    await _releaseRemoteTrack(source);
    await track.start();
    if (!_isCurrent(pc)) {
      await track.dispose();
      return;
    }
    if (track is AudioTrack) {
      track.mediaStreamTrack.enabled = false;
    }
    _remoteTracks[source] = track;
    _attached.remove(source);
    _syncReceivers(force: true);
    if (track case final RemoteAudioTrack audio
        when source == VoiceMeshSource.microphone) {
      await _startVisualizer(audio);
      _transport.onPeerAudioTrackAdded(this);
    }
  }

  Future<void> _startVisualizer(AudioTrack track) async {
    final AudioVisualizer visualizer = createVisualizer(
      track,
      options: const AudioVisualizerOptions(barCount: 8),
    );
    _visualizer = visualizer;
    _visualizerListener = visualizer.createListener()
      ..on<AudioVisualizerEvent>((AudioVisualizerEvent event) {
        _transport.reportLevel(connectionId, voiceMeshVisualizerLevel(event));
      });
    try {
      await visualizer.start();
    } on Object catch (error) {
      talker.debug('[Voice][Mesh] Remote visualizer failed: $error');
    }
  }

  Future<void> _stopVisualizer() async {
    final AudioVisualizer? visualizer = _visualizer;
    final EventsListener<AudioVisualizerEvent>? listener = _visualizerListener;
    _visualizer = null;
    _visualizerListener = null;
    await listener?.dispose();
    if (visualizer != null) {
      await visualizer.stop();
      await visualizer.dispose();
    }
    _transport.clearSpeaking(connectionId);
  }

  Future<void> _releaseRemoteTrack(VoiceMeshSource source) async {
    final Track? previous = _remoteTracks.remove(source);
    _attached.remove(source);
    if (previous == null) {
      return;
    }
    if (source == VoiceMeshSource.microphone) {
      await _stopVisualizer();
    }
    await previous.dispose();
  }

  void _syncReceivers({bool force = false}) {
    bool changed = force;
    for (final VoiceMeshSource source in VoiceMeshSource.values) {
      final Track? track = _remoteTracks[source];
      final bool attach =
          track != null &&
          _published.containsKey(source) &&
          _locallyWanted(source) &&
          !(source == VoiceMeshSource.microphone && _serverMuted);
      if (attach == _attached.contains(source)) {
        continue;
      }
      if (attach) {
        _attached.add(source);
      } else {
        _attached.remove(source);
      }
      if (track is AudioTrack) {
        track.mediaStreamTrack.enabled = attach;
      }
      changed = true;
    }
    if (changed && !_closed) {
      notifyListeners();
    }
  }

  void _setStatus(VoiceMeshPeerStatus next) {
    if (_status == next) {
      return;
    }
    _status = next;
    if (!_closed) {
      notifyListeners();
      _transport.onPeerStatusChanged();
    }
  }

  void _armSetupDeadline() {
    _setupTimer?.cancel();
    _setupTimer = Timer(_kSetupDeadline, () {
      if (_status != VoiceMeshPeerStatus.connected) {
        talker.warning(
          '[Voice][Mesh] Setup deadline passed (peer=$connectionId).',
        );
        _fail();
      }
    });
  }

  void _onConnectionState(RTCPeerConnectionState state) {
    switch (state) {
      case RTCPeerConnectionState.RTCPeerConnectionStateConnected:
        _setupTimer?.cancel();
        _restartTimer?.cancel();
        _disconnectedTimer?.cancel();
        _restartUsed = false;
        _setStatus(VoiceMeshPeerStatus.connected);
        _reportConnected();
      case RTCPeerConnectionState.RTCPeerConnectionStateFailed:
        _onTransportTrouble();
      case RTCPeerConnectionState.RTCPeerConnectionStateDisconnected:
        _disconnectedTimer?.cancel();
        _disconnectedTimer = Timer(_kDisconnectedGrace, _onTransportTrouble);
      case RTCPeerConnectionState.RTCPeerConnectionStateClosed:
      case RTCPeerConnectionState.RTCPeerConnectionStateNew:
      case RTCPeerConnectionState.RTCPeerConnectionStateConnecting:
        break;
    }
  }

  void _onTransportTrouble() {
    _disconnectedTimer?.cancel();
    if (_closed || _isFailed || (_restartTimer?.isActive ?? false)) {
      return;
    }
    if (_restartUsed) {
      _fail();
      return;
    }
    _restartUsed = true;
    _iceRestarted = true;
    _restartTimer = Timer(_kRestartDeadline, () {
      if (_pc?.connectionState !=
          RTCPeerConnectionState.RTCPeerConnectionStateConnected) {
        _fail();
        return;
      }
      _restartUsed = false;
    });
    if (isOfferer) {
      _enqueue(_iceRestart);
    } else {
      _send(VoiceMeshNeedOffer(g: _g, restart: true));
    }
  }

  void _fail() {
    if (_closed || _isFailed) {
      return;
    }
    talker.warning('[Voice][Mesh] Peer failed (peer=$connectionId).');
    if (!_settled) {
      _settled = true;
      _queueReport(
        outcome: VoiceP2pConnectionReportsRequestReportsOutcomeOutcome.failed,
        setupMs: null,
        path: _kNoSelectedPath,
      );
    }
    _cancelTimers();
    unawaited(_closePeerConnection());
    _setStatus(VoiceMeshPeerStatus.failed);
  }

  void _reportConnected() {
    final RTCPeerConnection? pc = _pc;
    if (_settled || pc == null) {
      return;
    }
    _settled = true;
    final int setupMs = _setupClock.elapsedMilliseconds;
    unawaited(
      pc
          .getStats()
          .then(voiceMeshSelectedPath)
          .catchError((Object _) => _kNoSelectedPath)
          .then(
            (VoiceMeshSelectedPath path) => _queueReport(
              outcome: VoiceP2pConnectionReportsRequestReportsOutcomeOutcome
                  .connected,
              setupMs: setupMs,
              path: path,
            ),
          ),
    );
  }

  void _queueReport({
    required VoiceP2pConnectionReportsRequestReportsOutcomeOutcome outcome,
    required int? setupMs,
    required VoiceMeshSelectedPath path,
  }) {
    if (_closed) {
      return;
    }
    _transport.queueConnectionReport(
      VoiceP2pConnectionReportsRequestReports(
        channelId: _transport.channelId,
        guildId: _transport.guildId,
        participantCount: _transport.participantCount,
        outcome: outcome,
        localCandidateType: path.localType,
        remoteCandidateType: path.remoteType,
        ipFamily: path.ipFamily,
        protocol: path.protocol,
        setupMs: setupMs,
        iceRestarted: _iceRestarted,
      ),
    );
  }

  void _cancelTimers() {
    _setupTimer?.cancel();
    _setupTimer = null;
    _disconnectedTimer?.cancel();
    _disconnectedTimer = null;
    _restartTimer?.cancel();
    _restartTimer = null;
  }

  Future<void> _closePeerConnection() async {
    final RTCPeerConnection? pc = _pc;
    _pc = null;
    _transceivers = const <RTCRtpTransceiver>[];
    for (final VoiceMeshSource source in VoiceMeshSource.values) {
      await _releaseRemoteTrack(source);
    }
    if (!_closed) {
      notifyListeners();
    }
    if (pc == null) {
      return;
    }
    try {
      await pc.close();
      await pc.dispose();
    } on Object catch (error) {
      talker.debug('[Voice][Mesh] Peer connection close failed: $error');
    }
  }

  Future<void> close() async {
    if (_closed) {
      return;
    }
    _closed = true;
    _cancelTimers();
    await _closePeerConnection();
  }

  Future<List<StatsReport>> getStats() async {
    final RTCPeerConnection? pc = _pc;
    if (pc == null) {
      return const <StatsReport>[];
    }
    return pc.getStats();
  }
}
