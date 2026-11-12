import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_voice/fluxer_voice.dart';

class _RecordingHostApi extends VoiceAudioSessionHostApi {
  final List<String> calls = <String>[];
  final List<Object?> arguments = <Object?>[];

  @override
  Future<void> acquire(String owner) async {
    calls.add('acquire');
    arguments.add(owner);
  }

  @override
  Future<void> release(String owner) async {
    calls.add('release');
    arguments.add(owner);
  }

  @override
  Future<void> setPreferredRoute(
    NativeVoiceRoute route, {
    required bool explicit,
    int? deviceId,
  }) async {
    calls.add('setPreferredRoute');
    arguments.add(<Object?>[route, deviceId, explicit]);
  }

  @override
  Future<List<NativeVoiceRoute>> availableRoutes() async {
    return <NativeVoiceRoute>[];
  }
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late _RecordingHostApi api;

  setUp(() {
    api = _RecordingHostApi();
    FluxerVoiceAudioSession.instance.debugOverridePlatform(api: api);
  });

  tearDown(FluxerVoiceAudioSession.instance.debugReset);

  test('acquire, release and preferred route send their arguments', () async {
    final FluxerVoiceAudioSession session = FluxerVoiceAudioSession.instance;
    await session.acquire('voice');
    expect(session.isActive, isTrue);
    await session.setPreferredRoute(VoiceOutputRoute.bluetooth, deviceId: 4);
    await session.release('voice');
    expect(session.isActive, isFalse);

    expect(api.calls, <String>['acquire', 'setPreferredRoute', 'release']);
    expect(api.arguments[0], 'voice');
    expect(api.arguments[1], <Object?>[NativeVoiceRoute.bluetooth, 4, false]);
  });

  test('treats an empty route list as unknown', () async {
    expect(await FluxerVoiceAudioSession.instance.availableRoutes(), isNull);
  });

  test('maps native session states to events', () async {
    final StreamController<NativeVoiceSessionState> states =
        StreamController<NativeVoiceSessionState>.broadcast();
    addTearDown(states.close);
    FluxerVoiceAudioSession.instance.debugOverridePlatform(
      api: api,
      sessionStates: states.stream,
    );
    final Future<VoiceAudioSessionEvent> next =
        FluxerVoiceAudioSession.instance.events.first;
    states.add(
      NativeVoiceSessionState(
        type: 'devicesChanged',
        active: true,
        route: NativeVoiceRoute.bluetooth,
        routes: <NativeVoiceRoute>[
          NativeVoiceRoute.speaker,
          NativeVoiceRoute.earpiece,
          NativeVoiceRoute.bluetooth,
        ],
        devices: <NativeVoiceDevice>[
          NativeVoiceDevice(
            id: 7,
            kind: NativeVoiceDeviceKind.bluetooth,
            name: 'Buds',
            active: true,
          ),
        ],
        activeDeviceId: 7,
        telecom: false,
        micSilenced: true,
      ),
    );

    final VoiceAudioSessionEvent event = await next;
    expect(event.devicesChanged, isTrue);
    expect(event.route, VoiceOutputRoute.bluetooth);
    expect(event.routes, contains(VoiceOutputRoute.earpiece));
    expect(event.devices.single.name, 'Buds');
    expect(event.activeDeviceId, 7);
    expect(event.micSilenced, isTrue);
  });

  test('maps native active routes and drops empty device names', () {
    expect(
      VoiceActiveOutputRoute.fromMessage(
        NativeVoiceActiveRoute(
          route: NativeVoiceRoute.headset,
          name: 'Car Audio',
        ),
      ),
      const VoiceActiveOutputRoute(
        VoiceOutputRoute.headset,
        deviceName: 'Car Audio',
      ),
    );
    expect(
      VoiceActiveOutputRoute.fromMessage(
        NativeVoiceActiveRoute(route: NativeVoiceRoute.headset, name: ''),
      ),
      const VoiceActiveOutputRoute(VoiceOutputRoute.headset),
    );
  });
}
