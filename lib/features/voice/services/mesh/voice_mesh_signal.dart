import 'dart:convert';

const int kVoiceSignalMaxJsonBytes = 16000;

enum VoiceMeshSource {
  microphone('microphone', 'audio'),
  camera('camera', 'video'),
  screenShare('screen_share', 'video'),
  screenShareAudio('screen_share_audio', 'audio');

  const VoiceMeshSource(this.wire, this.kind);

  final String wire;
  final String kind;

  static VoiceMeshSource? fromWire(Object? value) {
    for (final VoiceMeshSource source in values) {
      if (source.wire == value) {
        return source;
      }
    }
    return null;
  }
}

enum VoiceMeshSendResult { sent, oversized, unsent }

String voiceMeshTrackSid(String connectionId, VoiceMeshSource source) {
  return 'TR_${connectionId}_${source.wire}';
}

class VoiceMeshTrackInfo {
  const VoiceMeshTrackInfo({
    required this.source,
    required this.sid,
    required this.muted,
    this.width,
    this.height,
  });

  final VoiceMeshSource source;
  final String sid;
  final bool muted;
  final int? width;
  final int? height;

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'src': source.wire,
      'sid': sid,
      'm': muted,
      'w': ?width,
      'h': ?height,
    };
  }
}

class VoiceMeshCandidate {
  const VoiceMeshCandidate({
    required this.candidate,
    this.sdpMid,
    this.sdpMLineIndex,
  });

  final String candidate;
  final String? sdpMid;
  final int? sdpMLineIndex;

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'candidate': candidate,
      'sdpMid': sdpMid,
      'sdpMLineIndex': sdpMLineIndex,
    };
  }
}

sealed class VoiceMeshSignal {
  const VoiceMeshSignal();

  Map<String, Object?> toJson();
}

final class VoiceMeshOffer extends VoiceMeshSignal {
  const VoiceMeshOffer({required this.g, required this.sdp});

  final int g;
  final String sdp;

  @override
  Map<String, Object?> toJson() {
    return <String, Object?>{'t': 'offer', 'g': g, 'sdp': sdp};
  }
}

final class VoiceMeshAnswer extends VoiceMeshSignal {
  const VoiceMeshAnswer({required this.g, required this.sdp});

  final int g;
  final String sdp;

  @override
  Map<String, Object?> toJson() {
    return <String, Object?>{'t': 'answer', 'g': g, 'sdp': sdp};
  }
}

final class VoiceMeshIce extends VoiceMeshSignal {
  const VoiceMeshIce({required this.g, required this.candidate});

  final int g;
  final VoiceMeshCandidate? candidate;

  @override
  Map<String, Object?> toJson() {
    return <String, Object?>{'t': 'ice', 'g': g, 'c': candidate?.toJson()};
  }
}

final class VoiceMeshNeedOffer extends VoiceMeshSignal {
  const VoiceMeshNeedOffer({required this.g, this.restart = false});

  final int g;
  final bool restart;

  @override
  Map<String, Object?> toJson() {
    return <String, Object?>{
      't': 'need-offer',
      'g': g,
      if (restart) 'restart': true,
    };
  }
}

final class VoiceMeshTracks extends VoiceMeshSignal {
  const VoiceMeshTracks({required this.v, required this.tracks});

  final int v;
  final List<VoiceMeshTrackInfo> tracks;

  @override
  Map<String, Object?> toJson() {
    return <String, Object?>{
      't': 'tracks',
      'v': v,
      'tracks': <Map<String, Object?>>[
        for (final VoiceMeshTrackInfo track in tracks) track.toJson(),
      ],
    };
  }
}

final class VoiceMeshWant extends VoiceMeshSignal {
  const VoiceMeshWant({required this.v, required this.sids});

  final int v;
  final List<String> sids;

  @override
  Map<String, Object?> toJson() {
    return <String, Object?>{'t': 'want', 'v': v, 'sids': sids};
  }
}

int? _counter(Object? value) {
  return value is int && value >= 0 ? value : null;
}

bool _isOptionalString(Object? value) => value == null || value is String;

int? _dimension(Object? value) {
  if (value is! num || !value.isFinite || value < 0) {
    return null;
  }
  return value.round();
}

VoiceMeshTrackInfo? _parseTrack(Object? value) {
  if (value is! Map<String, dynamic>) {
    return null;
  }
  final VoiceMeshSource? source = VoiceMeshSource.fromWire(value['src']);
  final Object? sid = value['sid'];
  final Object? muted = value['m'];
  if (source == null || sid is! String || muted is! bool) {
    return null;
  }
  final Object? w = value['w'];
  final Object? h = value['h'];
  final int? width = _dimension(w);
  final int? height = _dimension(h);
  if ((w != null && width == null) || (h != null && height == null)) {
    return null;
  }
  return VoiceMeshTrackInfo(
    source: source,
    sid: sid,
    muted: muted,
    width: width,
    height: height,
  );
}

VoiceMeshSignal? parseVoiceMeshSignal(Map<String, dynamic> value) {
  final int? g = _counter(value['g']);
  final int? v = _counter(value['v']);
  final Object? sdp = value['sdp'];
  switch (value['t']) {
    case 'offer':
      return g == null || sdp is! String
          ? null
          : VoiceMeshOffer(g: g, sdp: sdp);
    case 'answer':
      return g == null || sdp is! String
          ? null
          : VoiceMeshAnswer(g: g, sdp: sdp);
    case 'ice':
      if (g == null) {
        return null;
      }
      final Object? c = value['c'];
      if (c == null) {
        return VoiceMeshIce(g: g, candidate: null);
      }
      if (c is! Map<String, dynamic>) {
        return null;
      }
      final Object? candidate = c['candidate'];
      final Object? sdpMid = c['sdpMid'];
      final Object? sdpMLineIndex = c['sdpMLineIndex'];
      if (candidate is! String ||
          !_isOptionalString(sdpMid) ||
          !_isOptionalString(c['usernameFragment']) ||
          (sdpMLineIndex != null && _counter(sdpMLineIndex) == null)) {
        return null;
      }
      return VoiceMeshIce(
        g: g,
        candidate: VoiceMeshCandidate(
          candidate: candidate,
          sdpMid: sdpMid as String?,
          sdpMLineIndex: sdpMLineIndex as int?,
        ),
      );
    case 'need-offer':
      final Object? restart = value['restart'];
      if (g == null || (restart != null && restart != true)) {
        return null;
      }
      return VoiceMeshNeedOffer(g: g, restart: restart == true);
    case 'tracks':
      final Object? rawTracks = value['tracks'];
      if (v == null || rawTracks is! List<dynamic>) {
        return null;
      }
      final List<VoiceMeshTrackInfo> tracks = <VoiceMeshTrackInfo>[];
      for (final Object? entry in rawTracks) {
        final VoiceMeshTrackInfo? track = _parseTrack(entry);
        if (track == null) {
          return null;
        }
        tracks.add(track);
      }
      return VoiceMeshTracks(v: v, tracks: tracks);
    case 'want':
      final Object? sids = value['sids'];
      if (v == null ||
          sids is! List<dynamic> ||
          !sids.every((Object? sid) => sid is String)) {
        return null;
      }
      return VoiceMeshWant(v: v, sids: sids.cast<String>());
    default:
      return null;
  }
}

int voiceSignalFrameBytes({
  required String? guildId,
  required String channelId,
  required String to,
  required Map<String, Object?> data,
}) {
  final String json = jsonEncode(<String, Object?>{
    'op': 13,
    'd': <String, Object?>{
      'guild_id': guildId,
      'channel_id': channelId,
      'to': to,
      'data': data,
    },
  });
  return utf8.encode(json).length;
}

String voiceMeshAssignRemoteStreams(String sdp, String remoteConnectionId) {
  final List<String> lines = sdp.split(RegExp(r'\r?\n'));
  if (lines.isNotEmpty && lines.last.isEmpty) {
    lines.removeLast();
  }
  final List<String> out = <String>[];
  int section = -1;
  bool sectionHasMsid = false;
  String? sectionSid;

  void closeSection() {
    final String? sid = sectionSid;
    if (sid != null && !sectionHasMsid) {
      out.add('a=msid:$sid $sid');
    }
  }

  for (final String line in lines) {
    if (line.startsWith('m=')) {
      closeSection();
      section++;
      sectionHasMsid = false;
      sectionSid = section < VoiceMeshSource.values.length
          ? voiceMeshTrackSid(
              remoteConnectionId,
              VoiceMeshSource.values[section],
            )
          : null;
      out.add(line);
      continue;
    }
    final String? sid = sectionSid;
    if (sid != null && line.startsWith('a=msid:')) {
      final List<String> parts = line.substring(7).split(' ');
      final String trackId = parts.length > 1 ? parts[1] : sid;
      out.add('a=msid:$sid $trackId');
      sectionHasMsid = true;
      continue;
    }
    final RegExpMatch? ssrcMsid = sid == null
        ? null
        : RegExp(r'^a=ssrc:(\d+) msid:\S+ (\S+)$').firstMatch(line);
    if (ssrcMsid != null) {
      out.add('a=ssrc:${ssrcMsid.group(1)} msid:$sid ${ssrcMsid.group(2)}');
      continue;
    }
    out.add(line);
  }
  closeSection();
  return '${out.join('\r\n')}\r\n';
}
