import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_voice/fluxer_voice.dart';
import 'package:fluxer_voice/src/screen_share_service.g.dart';

class _FakeScreenShareServiceApi extends VoiceScreenShareServiceHostApi {
  final List<String> calls = <String>[];
  Future<bool> Function() onStart = () async => true;
  Future<bool> Function() onIsRunning = () async => true;
  Future<void> Function() onStop = () async {};

  @override
  Future<bool> start(NativeScreenShareNotification notification) {
    calls.add('start ${notification.title}/${notification.text}');
    return onStart();
  }

  @override
  Future<void> stop() {
    calls.add('stop');
    return onStop();
  }

  @override
  Future<bool> isRunning() {
    calls.add('isRunning');
    return onIsRunning();
  }
}

void main() {
  final FluxerVoiceScreenShareService service =
      FluxerVoiceScreenShareService.instance;
  late _FakeScreenShareServiceApi api;

  setUp(() {
    api = _FakeScreenShareServiceApi();
    service.debugOverridePlatform(api: api);
    debugDefaultTargetPlatformOverride = TargetPlatform.android;
  });

  tearDown(() => debugDefaultTargetPlatformOverride = null);

  test('Android starts, queries and stops the native service', () async {
    expect(await service.start(title: 'Fluxer', text: 'Sharing'), isTrue);
    expect(await service.isRunning(), isTrue);
    await service.stop();

    expect(api.calls, <String>['start Fluxer/Sharing', 'isRunning', 'stop']);
  });

  test('running state always comes from the native side', () async {
    await service.start(title: 'Fluxer', text: 'Sharing');
    api.onIsRunning = () async => false;

    expect(await service.isRunning(), isFalse);
  });

  test('native failures report a stopped service', () async {
    Future<bool> fail() async => throw PlatformException(code: 'failed');
    api
      ..onStart = fail
      ..onIsRunning = fail
      ..onStop = () async => throw PlatformException(code: 'failed');

    expect(await service.start(title: 'Fluxer', text: 'Sharing'), isFalse);
    expect(await service.isRunning(), isFalse);
    await service.stop();
  });

  testWidgets('a start that never completes times out', (
    WidgetTester tester,
  ) async {
    api.onStart = () => Completer<bool>().future;
    bool? started;
    unawaited(
      service
          .start(title: 'Fluxer', text: 'Sharing')
          .then((bool value) => started = value),
    );

    await tester.pump(const Duration(seconds: 11));

    expect(started, isFalse);
    debugDefaultTargetPlatformOverride = null;
  });

  test('other platforms never reach the native api', () async {
    debugDefaultTargetPlatformOverride = TargetPlatform.iOS;

    expect(await service.start(title: 'Fluxer', text: 'Sharing'), isTrue);
    expect(await service.isRunning(), isTrue);
    await service.stop();

    expect(api.calls, isEmpty);
  });
}
