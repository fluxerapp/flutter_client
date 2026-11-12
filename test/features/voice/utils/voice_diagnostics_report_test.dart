import 'dart:async';
import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart' show StatsReport;
import 'package:fluxer_app/core/build/app_build_environment.dart';
import 'package:fluxer_app/core/build/push_provider_kind.dart';
import 'package:fluxer_app/core/providers/app_runtime_info.dart';
import 'package:fluxer_app/features/voice/domain/voice_settings_state.dart';
import 'package:fluxer_app/features/voice/providers/voice_connection_stats_provider.dart';
import 'package:fluxer_app/features/voice/providers/voice_session_state.dart';
import 'package:fluxer_app/features/voice/utils/voice_diagnostics_report.dart';
import 'package:livekit_client/livekit_client.dart' show MediaDevice;

const AppRuntimeInfo _kInfo = AppRuntimeInfo(
  packageName: 'app.fluxer',
  version: '1.2.3',
  buildNumber: '42',
  environment: AppBuildEnvironment.canary,
  pushProvider: PushProviderKind.unifiedPush,
  buildTimestamp: '2026-11-10T00:00:00Z',
  deviceModel: 'Pixel 9',
  osVersionLabel: '16',
);

Future<Map<String, Object?>> _collect({
  VoiceSessionState session = const VoiceSessionState(),
  VoiceSettingsState settings = const VoiceSettingsState(),
  Future<AppRuntimeInfo> Function()? appInfo,
  Future<List<MediaDevice>> Function()? devices,
  Future<Object?> Function()? audioRoute,
  Map<String, VoiceDiagnosticsStatsSource> statsSources =
      const <String, VoiceDiagnosticsStatsSource>{},
}) async {
  final Map<String, Object?> payload = await collectVoiceDiagnostics(
    session: session,
    connectionStats: const VoiceConnectionStats(),
    settings: settings,
    appInfo: appInfo ?? () async => _kInfo,
    enumerateDevices: devices ?? () async => <MediaDevice>[],
    audioRoute: audioRoute ?? () async => null,
    statsSources: statsSources,
    now: DateTime.utc(2026, 11, 10, 12),
    timeout: const Duration(milliseconds: 50),
  );
  return jsonDecode(encodeVoiceDiagnostics(payload)) as Map<String, Object?>;
}

void main() {
  test('idle session produces valid JSON with web-compatible header', () async {
    final Map<String, Object?> json = await _collect();

    expect(json['schemaVersion'], 1);
    expect(json['createdAt'], '2026-11-10T12:00:00.000Z');
    expect(json['client'], 'flutter');
    final Map<String, Object?> session =
        json['voiceSession']! as Map<String, Object?>;
    expect(session['isConnected'], isFalse);
    expect(session['transport'], isNull);
    expect(json['webrtc'], isNull);
    final Map<String, Object?> app = json['app']! as Map<String, Object?>;
    expect(app['version'], '1.2.3');
    expect(app['pushProvider'], 'unifiedPush');
  });

  test('failing and hanging collectors become error entries', () async {
    final Map<String, Object?> json = await _collect(
      appInfo: () => Future<AppRuntimeInfo>.error(StateError('boom')),
      devices: () => Completer<List<MediaDevice>>().future,
    );

    expect((json['app']! as Map<String, Object?>)['error'], contains('boom'));
    expect(
      (json['mediaDevices']! as Map<String, Object?>)['error'],
      contains('timed out'),
    );
  });

  test('settings hide device ids and per-user maps', () async {
    final Map<String, Object?> json = await _collect(
      settings: const VoiceSettingsState(
        inputDeviceId: 'secret-mic-id',
        participantVolumes: <String, int>{'u1': 50, 'u2': 80},
      ),
      devices: () async => <MediaDevice>[
        const MediaDevice('secret-mic-id', 'USB Mic', 'audioinput', null),
      ],
    );

    final Map<String, Object?> settings =
        json['voiceSettings']! as Map<String, Object?>;
    expect(settings['inputDeviceId'], 'custom');
    expect(settings['outputDeviceId'], kDefaultVoiceDeviceId);
    expect(settings['participantVolumes'], 2);
    final Map<String, Object?> devices =
        json['mediaDevices']! as Map<String, Object?>;
    final Map<String, Object?> device =
        (devices['devices']! as List<Object?>).single! as Map<String, Object?>;
    expect(device['label'], 'USB Mic');
    expect(device['selected'], isTrue);
    expect(jsonEncode(json), isNot(contains('secret-mic-id')));
  });

  test('webrtc stats keep relevant reports and redact candidates', () async {
    final Map<String, Object?> json = await _collect(
      statsSources: <String, VoiceDiagnosticsStatsSource>{
        'publisher': () async => <StatsReport>[
          StatsReport('cp', 'candidate-pair', 1, <String, Object?>{
            'currentRoundTripTime': 0.042,
            'state': 'succeeded',
          }),
          StatsReport('lc', 'local-candidate', 1, <String, Object?>{
            'address': '192.168.1.5',
            'candidateType': 'host',
          }),
          StatsReport('cert', 'certificate', 1, <String, Object?>{}),
          StatsReport('o', 'outbound-rtp', 1, <String, Object?>{
            'bytesSent': double.nan,
          }),
        ],
      },
    );

    final List<Object?> reports =
        (json['webrtc']! as Map<String, Object?>)['publisher']!
            as List<Object?>;
    final List<Object?> types = <Object?>[
      for (final Object? r in reports) (r! as Map<String, Object?>)['type'],
    ];
    expect(types, <String>[
      'candidate-pair',
      'local-candidate',
      'outbound-rtp',
    ]);
    expect(jsonEncode(json), isNot(contains('192.168.1.5')));
    final Map<String, Object?> outbound = reports[2]! as Map<String, Object?>;
    expect((outbound['values']! as Map<String, Object?>)['bytesSent'], 'NaN');
  });

  test('includes the native audio route diagnostics', () async {
    final Map<String, Object?> payload = await _collect(
      audioRoute: () async => <String, Object?>{
        'native': 'mode=3 owners=[voice]',
      },
    );
    final Map<String, Object?> route =
        payload['audioRoute']! as Map<String, Object?>;
    expect(route['native'], 'mode=3 owners=[voice]');
  });
}
