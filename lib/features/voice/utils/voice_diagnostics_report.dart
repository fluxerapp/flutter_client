import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart'
    show RTCRtpReceiver, RTCRtpSender, StatsReport;
import 'package:fluxer_app/core/build/app_diagnostic_clipboard_text.dart';
import 'package:fluxer_app/core/providers/app_runtime_info_provider.dart';
import 'package:fluxer_app/features/settings/providers/preferences/voice_settings_provider.dart';
import 'package:fluxer_app/features/voice/domain/voice_settings_state.dart';
import 'package:fluxer_app/features/voice/providers/voice_connection_stats_provider.dart';
import 'package:fluxer_app/features/voice/providers/voice_session_provider.dart';
import 'package:fluxer_app/features/voice/providers/voice_session_state.dart';
import 'package:fluxer_app/features/voice/services/mesh/voice_mesh_peer.dart';
import 'package:fluxer_app/features/voice/services/mesh/voice_mesh_transport.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/shared/utils/clipboard_utils.dart';
import 'package:fluxer_voice/fluxer_voice.dart';
import 'package:livekit_client/livekit_client.dart' hide TimeoutException;

const Duration _kCollectTimeout = Duration(seconds: 3);

const Set<String> _kKeptStatsTypes = <String>{
  'candidate-pair',
  'inbound-rtp',
  'outbound-rtp',
  'remote-inbound-rtp',
  'remote-outbound-rtp',
  'codec',
  'transport',
  'local-candidate',
  'remote-candidate',
  'media-source',
};

const Set<String> _kRedactedCandidateKeys = <String>{
  'address',
  'ip',
  'relatedAddress',
  'url',
  'usernameFragment',
};

typedef VoiceDiagnosticsStatsSource = Future<List<StatsReport>> Function();

Future<Map<String, Object?>> collectVoiceDiagnostics({
  required VoiceSessionState session,
  required VoiceConnectionStats connectionStats,
  required VoiceSettingsState settings,
  required Future<AppRuntimeInfo> Function() appInfo,
  Future<List<MediaDevice>> Function()? enumerateDevices,
  Future<Object?> Function()? audioRoute,
  Map<String, VoiceDiagnosticsStatsSource>? statsSources,
  DateTime? now,
  Duration timeout = _kCollectTimeout,
}) async {
  final DateTime createdAt = (now ?? DateTime.now()).toUtc();
  final Future<List<MediaDevice>> Function() devices =
      enumerateDevices ?? Hardware.instance.enumerateDevices;
  final Map<String, VoiceDiagnosticsStatsSource> sources =
      statsSources ?? voiceDiagnosticsStatsSources(session);
  final Future<Object?> Function() route =
      audioRoute ?? readVoiceAudioRouteDiagnostics;
  final (
    Object? app,
    Object? mediaDevices,
    Object? webrtc,
    Object? audioRouteJson,
  ) = await (
    _withTimeout('app info', () async {
      final AppRuntimeInfo info = await appInfo();
      return _appInfoJson(info);
    }, timeout),
    _withTimeout('media devices', () async {
      return _mediaDevicesJson(await devices(), settings);
    }, timeout),
    _collectWebRtc(sources, timeout),
    _withTimeout('audio route', route, timeout),
  ).wait;
  return <String, Object?>{
    'schemaVersion': 1,
    'createdAt': createdAt.toIso8601String(),
    'client': 'flutter',
    'app': app,
    'platform': <String, Object?>{
      'os': Platform.operatingSystem,
      'osVersion': Platform.operatingSystemVersion,
      'processors': Platform.numberOfProcessors,
      'locale': Platform.localeName,
    },
    'voiceSession': _safe(() => _sessionJson(session)),
    'connectionStats': _safe(() => _connectionStatsJson(connectionStats)),
    'voiceSettings': _safe(() => _settingsJson(settings)),
    'mediaDevices': mediaDevices,
    'audioRoute': audioRouteJson,
    'webrtc': webrtc,
  };
}

Future<Object?> readVoiceAudioRouteDiagnostics() async {
  if (!Platform.isAndroid) {
    return null;
  }
  final FluxerVoiceAudioSession session = FluxerVoiceAudioSession.instance;
  return <String, Object?>{
    'dartOwners': session.owners.toList(),
    'native': await session.diagnostics(),
  };
}

String encodeVoiceDiagnostics(Map<String, Object?> payload) {
  return const JsonEncoder.withIndent('  ').convert(_sanitize(payload));
}

Map<String, VoiceDiagnosticsStatsSource> voiceDiagnosticsStatsSources(
  VoiceSessionState session,
) {
  final Map<String, VoiceDiagnosticsStatsSource> sources =
      <String, VoiceDiagnosticsStatsSource>{};
  final VoiceMeshTransport? mesh = session.mesh;
  if (mesh != null) {
    for (final VoiceMeshPeer peer in mesh.peers.toList()) {
      sources['peer:${peer.remoteUserId}'] = peer.getStats;
    }
    return sources;
  }
  final Room? room = session.liveKitRoom;
  if (room == null) {
    return sources;
  }
  final LocalParticipant? local = room.localParticipant;
  if (local != null) {
    for (final LocalTrackPublication<LocalTrack> publication
        in local.trackPublications.values) {
      final RTCRtpSender? sender = publication.track?.sender;
      if (sender != null) {
        sources['local:${publication.source.name}:${publication.sid}'] =
            sender.getStats;
      }
    }
  }
  for (final RemoteParticipant participant in room.remoteParticipants.values) {
    for (final RemoteTrackPublication<RemoteTrack> publication
        in participant.trackPublications.values) {
      final RTCRtpReceiver? receiver = publication.track?.receiver;
      if (receiver != null) {
        sources['remote:${participant.identity}:${publication.source.name}'] =
            receiver.getStats;
      }
    }
  }
  return sources;
}

Future<String> buildVoiceDiagnosticsJson(ProviderContainer container) async {
  Map<String, Object?> payload;
  try {
    payload = await collectVoiceDiagnostics(
      session: container.read(voiceSessionProvider),
      connectionStats: container.read(voiceConnectionStatsProvider),
      settings: container.read(voiceSettingsProvider),
      appInfo: () => container.read(appRuntimeInfoProvider.future),
    );
  } on Object catch (error) {
    payload = <String, Object?>{
      'schemaVersion': 1,
      'createdAt': DateTime.now().toUtc().toIso8601String(),
      'client': 'flutter',
      'error': error.toString(),
    };
  }
  return encodeVoiceDiagnostics(payload);
}

Future<void> copyVoiceDiagnostics(BuildContext context) async {
  final BuildContext host = Navigator.of(context, rootNavigator: true).context;
  final String message = FluxerLocalizations.of(host).voiceDiagnosticsCopied;
  final String json = await buildVoiceDiagnosticsJson(
    ProviderScope.containerOf(host, listen: false),
  );
  if (!host.mounted) {
    return;
  }
  await copyToClipboard(context: host, value: json, message: message);
}

Future<Object?> _withTimeout(
  String label,
  Future<Object?> Function() task,
  Duration timeout,
) async {
  try {
    return await task().timeout(timeout);
  } on TimeoutException {
    return <String, Object?>{
      'error': '$label timed out after ${timeout.inMilliseconds}ms',
    };
  } on Object catch (error) {
    return <String, Object?>{'error': '$label failed: $error'};
  }
}

Object? _safe(Object? Function() collect) {
  try {
    return collect();
  } on Object catch (error) {
    return <String, Object?>{'error': error.toString()};
  }
}

Map<String, Object?> _appInfoJson(AppRuntimeInfo info) {
  return <String, Object?>{
    'summary': _safe(() => formatAppDiagnosticClipboardText(info)),
    'packageName': info.packageName,
    'version': info.version,
    'buildNumber': info.buildNumber,
    'environment': info.environment.name,
    'pushProvider': info.pushProvider.name,
    'buildTimestamp': info.buildTimestamp,
    'deviceModel': info.deviceModel,
    'osVersion': info.osVersionLabel,
  };
}

Map<String, Object?> _sessionJson(VoiceSessionState session) {
  final Room? room = session.liveKitRoom;
  final VoiceMeshTransport? mesh = session.mesh;
  return <String, Object?>{
    'isConnecting': session.isConnecting,
    'isConnected': session.isConnected,
    'isReconnecting': session.isReconnecting,
    'isInVoice': session.isInVoice,
    'connectFailed': session.connectFailed,
    'errorMessage': session.errorMessage,
    'guildId': session.guildId,
    'channelId': session.channelId,
    'voiceServerEndpoint': session.voiceServerEndpoint,
    'connectionId': session.activeConnectionId,
    'transport': mesh != null
        ? 'p2p'
        : room != null
        ? 'livekit'
        : null,
    'e2ee': session.e2eeKey != null,
    if (room != null) 'room': _safe(() => _roomJson(room)),
    if (mesh != null) 'mesh': _safe(() => _meshJson(mesh)),
  };
}

Map<String, Object?> _roomJson(Room room) {
  final LocalParticipant? local = room.localParticipant;
  return <String, Object?>{
    'connectionState': room.connectionState.name,
    'name': room.name,
    'serverVersion': room.serverVersion,
    'serverRegion': room.serverRegion,
    'localParticipant': local == null ? null : _participantJson(local),
    'remoteParticipantCount': room.remoteParticipants.length,
    'remoteParticipants': <Object?>[
      for (final RemoteParticipant participant
          in room.remoteParticipants.values)
        _participantJson(participant),
    ],
  };
}

Map<String, Object?> _participantJson(Participant participant) {
  return <String, Object?>{
    'identity': participant.identity,
    'sid': participant.sid,
    'connectionQuality': participant.connectionQuality.name,
    'isSpeaking': participant.isSpeaking,
    'audioLevel': participant.audioLevel,
    'tracks': <Object?>[
      for (final TrackPublication publication
          in participant.trackPublications.values)
        <String, Object?>{
          'sid': publication.sid,
          'kind': publication.kind.name,
          'source': publication.source.name,
          'muted': publication.muted,
          'subscribed': publication.subscribed,
          'mimeType': publication.mimeType,
          'simulcasted': publication.simulcasted,
          if (publication.dimensions case final VideoDimensions size)
            'dimensions': '${size.width}x${size.height}',
        },
    ],
  };
}

Map<String, Object?> _meshJson(VoiceMeshTransport mesh) {
  return <String, Object?>{
    'peerCount': mesh.peers.length,
    'peers': <Object?>[
      for (final VoiceMeshPeer peer in mesh.peers)
        <String, Object?>{
          'userId': peer.remoteUserId,
          'connectionId': peer.identity,
          'status': peer.status.name,
          'directConnectionFailed': peer.directConnectionFailed,
          'hasCamera': peer.hasCamera,
          'hasScreenShare': peer.hasScreenShare,
          'hasScreenShareAudio': peer.hasScreenShareAudio,
        },
    ],
  };
}

Map<String, Object?> _connectionStatsJson(VoiceConnectionStats stats) {
  return <String, Object?>{
    'currentLatencyMs': stats.currentLatencyMs,
    'latencyHistory': stats.latencyHistory,
    'sessionDurationSeconds': stats.sessionDuration?.inSeconds,
    'participantCount': stats.participantCount,
    'jitterMs': stats.jitterMs,
    'sendBandwidthBps': stats.sendBandwidthBps,
    'receiveBandwidthBps': stats.receiveBandwidthBps,
  };
}

Map<String, Object?> _settingsJson(VoiceSettingsState settings) {
  final Map<String, Object?> json = Map<String, Object?>.of(settings.toJson());
  for (final String key in <String>[
    'inputDeviceId',
    'outputDeviceId',
    'videoDeviceId',
  ]) {
    final Object? value = json[key];
    json[key] = value == kDefaultVoiceDeviceId ? value : 'custom';
  }
  json['participantVolumes'] = settings.participantVolumes.length;
  json['participantLocalMutes'] = settings.participantLocalMutes.length;
  json['streamAudioVolumes'] = settings.streamAudioVolumes.length;
  json['streamAudioMuted'] = settings.streamAudioMuted.length;
  json['outputRouteOverride'] = settings.outputRouteOverride?.name;
  json['outputDeviceOverride'] = settings.outputDeviceOverride;
  return json;
}

Map<String, Object?> _mediaDevicesJson(
  List<MediaDevice> devices,
  VoiceSettingsState settings,
) {
  String? selectedFor(String kind) => switch (kind) {
    'audioinput' => settings.inputDeviceId,
    'audiooutput' => settings.outputDeviceId,
    'videoinput' => settings.videoDeviceId,
    _ => null,
  };
  return <String, Object?>{
    'count': devices.length,
    'devices': <Object?>[
      for (final MediaDevice device in devices)
        <String, Object?>{
          'kind': device.kind,
          'label': device.label,
          'isDefaultDeviceId': device.deviceId == kDefaultVoiceDeviceId,
          'selected': device.deviceId == selectedFor(device.kind),
        },
    ],
  };
}

Future<Object?> _collectWebRtc(
  Map<String, VoiceDiagnosticsStatsSource> sources,
  Duration timeout,
) async {
  if (sources.isEmpty) {
    return null;
  }
  final List<MapEntry<String, VoiceDiagnosticsStatsSource>> entries = sources
      .entries
      .toList();
  final List<Object?> results = await Future.wait(<Future<Object?>>[
    for (final MapEntry<String, VoiceDiagnosticsStatsSource> entry in entries)
      _withTimeout('${entry.key} stats', () async {
        return _statsJson(await entry.value());
      }, timeout),
  ]);
  return <String, Object?>{
    for (int index = 0; index < entries.length; index++)
      entries[index].key: results[index],
  };
}

List<Object?> _statsJson(List<StatsReport> reports) {
  return <Object?>[
    for (final StatsReport report in reports)
      if (_kKeptStatsTypes.contains(report.type))
        <String, Object?>{
          'id': report.id,
          'type': report.type,
          'timestamp': report.timestamp,
          'values': <String, Object?>{
            for (final MapEntry<dynamic, dynamic> entry
                in report.values.entries)
              if (!(report.type.endsWith('candidate') &&
                  _kRedactedCandidateKeys.contains(entry.key)))
                entry.key.toString(): entry.value,
          },
        },
  ];
}

Object? _sanitize(Object? value) {
  if (value == null || value is String || value is bool) {
    return value;
  }
  if (value is num) {
    return value.isFinite ? value : value.toString();
  }
  if (value is Map) {
    return <String, Object?>{
      for (final MapEntry<dynamic, dynamic> entry in value.entries)
        entry.key.toString(): _sanitize(entry.value),
    };
  }
  if (value is Iterable) {
    return <Object?>[for (final Object? item in value) _sanitize(item)];
  }
  return value.toString();
}
