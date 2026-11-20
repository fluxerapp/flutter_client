import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_voice/fluxer_voice.dart';
import 'package:fluxer_voice/src/process_activity.g.dart';

class _RecordingProcessActivityApi extends VoiceProcessActivityHostApi {
  final List<String> calls = <String>[];

  @override
  Future<void> begin() async => calls.add('begin');

  @override
  Future<void> end() async => calls.add('end');
}

void main() {
  late _RecordingProcessActivityApi api;

  setUp(() {
    api = _RecordingProcessActivityApi();
    FluxerVoiceProcessActivity.instance.debugOverridePlatform(api: api);
  });

  tearDown(() => debugDefaultTargetPlatformOverride = null);

  test('macOS begins and ends the activity once per transition', () async {
    debugDefaultTargetPlatformOverride = TargetPlatform.macOS;
    final FluxerVoiceProcessActivity activity =
        FluxerVoiceProcessActivity.instance;

    await activity.setActive(active: true);
    await activity.setActive(active: true);
    await activity.setActive(active: false);
    await activity.setActive(active: false);

    expect(api.calls, <String>['begin', 'end']);
  });

  test('other platforms never reach the native api', () async {
    debugDefaultTargetPlatformOverride = TargetPlatform.iOS;

    await FluxerVoiceProcessActivity.instance.setActive(active: true);

    expect(api.calls, isEmpty);
  });
}
