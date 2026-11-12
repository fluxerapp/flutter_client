import 'dart:async';
import 'dart:ui';

import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_voice/fluxer_voice.dart';

class _RecordingPipApi extends VoicePipHostApi {
  final List<String> calls = <String>[];
  final List<NativePipConfig> configs = <NativePipConfig>[];
  bool supported = true;
  bool failArm = false;

  @override
  Future<bool> isSupported() async {
    calls.add('isSupported');
    return supported;
  }

  @override
  Future<void> arm(NativePipConfig config) async {
    calls.add('arm');
    configs.add(config);
    if (failArm) {
      throw StateError('arm failed');
    }
  }

  @override
  Future<void> disarm() async {
    calls.add('disarm');
  }

  @override
  Future<void> stop() async {
    calls.add('stop');
  }
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late _RecordingPipApi api;
  late StreamController<NativePipEvent> events;

  setUp(() {
    api = _RecordingPipApi();
    events = StreamController<NativePipEvent>.broadcast();
    FluxerVoicePip.instance.debugOverridePlatform(
      api: api,
      events: () => events.stream,
    );
  });

  tearDown(() async {
    FluxerVoicePip.instance.debugOverridePlatform();
    await events.close();
  });

  const VoicePipRequest request = VoicePipRequest(
    source: VoicePipVideoSource.webRtcTrack('track-1'),
    aspect: Size(1920, 1080),
    sourceRect: Rect.fromLTWH(0, 100, 320, 180),
  );

  test('arm sends the config once per distinct request', () async {
    final FluxerVoicePip pip = FluxerVoicePip.instance;
    await pip.arm(request);
    await pip.arm(
      const VoicePipRequest(
        source: VoicePipVideoSource.webRtcTrack('track-1'),
        aspect: Size(1280, 720),
        sourceRect: Rect.fromLTWH(0, 100, 320, 180),
      ),
    );
    expect(api.calls, <String>['arm']);

    final NativePipConfig config = api.configs.single;
    expect(config.source.kind, NativePipVideoSourceKind.webRtcTrack);
    expect(config.source.trackId, 'track-1');
    expect(config.aspectWidth / config.aspectHeight, closeTo(16 / 9, 0.001));
    expect(config.sourceRect?.top, 100);
    expect(config.sourceRect?.width, 320);

    await pip.arm(
      const VoicePipRequest(
        source: VoicePipVideoSource.webRtcTrack('track-2'),
        aspect: Size(1920, 1080),
      ),
    );
    expect(api.calls, <String>['arm', 'arm']);
    expect(api.configs.last.sourceRect, isNull);
  });

  test('disarm only reaches the platform when armed', () async {
    final FluxerVoicePip pip = FluxerVoicePip.instance;
    await pip.disarm();
    expect(api.calls, isEmpty);

    await pip.arm(request);
    await pip.disarm();
    await pip.disarm();
    expect(api.calls, <String>['arm', 'disarm']);
    expect(pip.armed, isNull);
  });

  test('a failed arm can be retried', () async {
    final FluxerVoicePip pip = FluxerVoicePip.instance;
    api.failArm = true;
    await expectLater(pip.arm(request), throwsStateError);
    expect(pip.armed, isNull);

    api.failArm = false;
    await pip.arm(request);
    expect(api.calls, <String>['arm', 'arm']);
  });

  test('invalid aspect falls back to 16:9', () {
    const VoicePipRequest empty = VoicePipRequest(
      source: VoicePipVideoSource.webRtcTrack('track-1'),
      aspect: Size.zero,
    );
    expect(empty.aspectRatio, (16, 9));
  });

  test('support is cached', () async {
    final FluxerVoicePip pip = FluxerVoicePip.instance;
    expect(await pip.isSupported(), isTrue);
    expect(await pip.isSupported(), isTrue);
    expect(api.calls, <String>['isSupported']);
  });

  test('events map sizes', () async {
    final Future<VoicePipEvent> next = FluxerVoicePip.instance.events.first;
    events.add(
      NativePipEvent(
        active: true,
        restoreRequested: false,
        width: 320,
        height: 180,
      ),
    );
    final VoicePipEvent event = await next;
    expect(event.active, isTrue);
    expect(event.size, const Size(320, 180));
  });
}
