import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_voice/fluxer_voice.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  final List<MethodCall> calls = <MethodCall>[];

  setUp(() {
    calls.clear();
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(FluxerVoiceAudioSession.methodChannel, (
          MethodCall call,
        ) async {
          calls.add(call);
          return null;
        });
  });

  tearDown(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(FluxerVoiceAudioSession.methodChannel, null);
  });

  test('acquire, release and preferred route send their arguments', () async {
    final FluxerVoiceAudioSession session = FluxerVoiceAudioSession.instance;
    await session.acquire('voice');
    await session.setPreferredRoute(VoiceOutputRoute.bluetooth, deviceId: 4);
    await session.release('voice');

    expect(calls.map((MethodCall call) => call.method), <String>[
      'acquire',
      'setPreferredRoute',
      'release',
    ]);
    expect(calls[0].arguments, <String, Object>{'owner': 'voice'});
    expect(calls[1].arguments, <String, Object>{
      'route': 'bluetooth',
      'deviceId': 4,
      'explicit': false,
    });
  });

  test('parses native session events', () {
    final VoiceAudioSessionEvent? event = VoiceAudioSessionEvent.fromNative(
      <String, Object?>{
        'type': 'devicesChanged',
        'active': true,
        'route': 'bluetooth',
        'routes': <Object?>['speaker', 'earpiece', 'bluetooth'],
        'devices': <Object?>[
          <String, Object?>{
            'id': 7,
            'kind': 'bluetooth',
            'name': 'Buds',
            'active': true,
          },
        ],
        'activeDeviceId': 7,
        'telecom': false,
        'micSilenced': true,
      },
    );

    expect(event, isNotNull);
    expect(event!.devicesChanged, isTrue);
    expect(event.route, VoiceOutputRoute.bluetooth);
    expect(event.routes, contains(VoiceOutputRoute.earpiece));
    expect(event.devices.single.name, 'Buds');
    expect(event.activeDeviceId, 7);
    expect(event.micSilenced, isTrue);
  });

  test('ignores malformed native events', () {
    expect(VoiceAudioSessionEvent.fromNative(null), isNull);
    expect(
      VoiceAudioSessionEvent.fromNative(<String, Object?>{'type': 'x'}),
      isNull,
    );
  });
}
