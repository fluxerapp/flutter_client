import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/settings/providers/preferences/voice_settings_provider.dart';
import 'package:fluxer_app/features/voice/domain/voice_output_route.dart';
import 'package:fluxer_app/features/voice/utils/audio/speaker_route.dart';
import 'package:fluxer_voice/fluxer_voice.dart' show FluxerVoiceAudioSession;

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  const MethodChannel channel = MethodChannel('fluxer_app/voice_speaker_route');
  const EventChannel events = EventChannel(
    'fluxer_app/voice_speaker_route_events',
  );

  setUp(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(channel, null);
  });

  tearDown(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(channel, null);
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockStreamHandler(events, null);
    debugDefaultTargetPlatformOverride = null;
  });

  group('VoiceIosNativeRouteSync', () {
    test('follows a return to headphones right after the speaker', () async {
      debugDefaultTargetPlatformOverride = TargetPlatform.iOS;
      TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
          .setMockMethodCallHandler(channel, (MethodCall call) async {
            return call.method == 'activeRoute'
                ? <String, String>{'route': 'speaker'}
                : null;
          });
      final StreamController<Map<String, String>> routes =
          StreamController<Map<String, String>>();
      TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
          .setMockStreamHandler(
            events,
            MockStreamHandler.inline(
              onListen: (Object? _, MockStreamHandlerEventSink sink) {
                routes.stream.listen(sink.success);
              },
            ),
          );
      final ProviderContainer container = ProviderContainer();
      addTearDown(container.dispose);
      addTearDown(routes.close);
      container.read(voiceIosNativeRouteSyncProvider);
      await pumpEventQueue();
      expect(
        container.read(voiceIosNativeRouteSyncProvider),
        const VoiceActiveOutputRoute(VoiceOutputRoute.speaker),
      );
      routes
        ..add(<String, String>{'route': 'speaker'})
        ..add(<String, String>{'route': 'headset'});
      await pumpEventQueue();
      expect(
        container.read(voiceIosNativeRouteSyncProvider),
        const VoiceActiveOutputRoute(VoiceOutputRoute.headset),
      );
      expect(
        container.read(voiceSettingsProvider).outputRoute,
        VoiceOutputRoute.headset,
      );
    });
  });

  group('readNativeActiveVoiceOutputRoute', () {
    test('maps activeRoute response on iOS', () async {
      debugDefaultTargetPlatformOverride = TargetPlatform.iOS;
      TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
          .setMockMethodCallHandler(channel, (MethodCall call) async {
            if (call.method == 'activeRoute') {
              return <String, String>{'route': 'earpiece'};
            }
            return null;
          });
      final VoiceActiveOutputRoute? route =
          await readNativeActiveVoiceOutputRoute();
      expect(route, const VoiceActiveOutputRoute(VoiceOutputRoute.earpiece));
    });
  });

  group('voiceActiveOutputRouteFromNative', () {
    test('keeps the device name iOS reports for an output with a name', () {
      expect(
        voiceActiveOutputRouteFromNative(<Object?, Object?>{
          'route': 'headset',
          'name': 'Car Audio',
        }),
        const VoiceActiveOutputRoute(
          VoiceOutputRoute.headset,
          deviceName: 'Car Audio',
        ),
      );
    });

    test('has no device name for headphones', () {
      expect(
        voiceActiveOutputRouteFromNative(<Object?, Object?>{
          'route': 'headset',
        }),
        const VoiceActiveOutputRoute(VoiceOutputRoute.headset),
      );
      expect(
        voiceActiveOutputRouteFromNative(<Object?, Object?>{
          'route': 'headset',
          'name': '',
        }),
        const VoiceActiveOutputRoute(VoiceOutputRoute.headset),
      );
    });

    test('ignores a payload without a route', () {
      expect(voiceActiveOutputRouteFromNative(null), isNull);
      expect(voiceActiveOutputRouteFromNative('headset'), isNull);
      expect(
        voiceActiveOutputRouteFromNative(<Object?, Object?>{'name': 'TV'}),
        isNull,
      );
    });
  });

  group('applyNativeVoiceOutputRoute', () {
    test('sets the preferred route on Android', () async {
      debugDefaultTargetPlatformOverride = TargetPlatform.android;
      final List<MethodCall> calls = <MethodCall>[];
      TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
          .setMockMethodCallHandler(channel, (MethodCall call) async {
            calls.add(call);
            return null;
          });
      await applyNativeVoiceOutputRoute(
        VoiceOutputRoute.bluetooth,
        deviceId: 3,
        hold: true,
        explicit: true,
      );
      expect(calls.single.method, 'setPreferredRoute');
      expect(calls.single.arguments, <String, Object>{
        'route': 'bluetooth',
        'deviceId': 3,
        'explicit': true,
      });
    });

    test('passes hold when setting route on iOS', () async {
      debugDefaultTargetPlatformOverride = TargetPlatform.iOS;
      Object? arguments;
      TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
          .setMockMethodCallHandler(channel, (MethodCall call) async {
            if (call.method == 'setRoute') {
              arguments = call.arguments;
            }
            return null;
          });
      await applyNativeVoiceOutputRoute(VoiceOutputRoute.earpiece, hold: true);
      final Map<Object?, Object?> args = arguments! as Map<Object?, Object?>;
      expect(args['route'], 'earpiece');
      expect(args['hold'], isTrue);
    });
  });

  group('native voice audio session', () {
    test('acquires and releases owners on Android', () async {
      debugDefaultTargetPlatformOverride = TargetPlatform.android;
      final List<MethodCall> calls = <MethodCall>[];
      TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
          .setMockMethodCallHandler(channel, (MethodCall call) async {
            calls.add(call);
            return null;
          });
      await acquireNativeVoiceAudioSession(kVoiceCallAudioOwner);
      expect(FluxerVoiceAudioSession.instance.isActive, isTrue);
      await releaseNativeVoiceAudioSession(kVoiceCallAudioOwner);
      expect(FluxerVoiceAudioSession.instance.isActive, isFalse);
      expect(calls.map((MethodCall call) => call.method), <String>[
        'acquire',
        'release',
      ]);
      expect(calls.first.arguments, <String, Object>{'owner': 'voice'});
    });

    test('does nothing on iOS', () async {
      debugDefaultTargetPlatformOverride = TargetPlatform.iOS;
      final List<MethodCall> calls = <MethodCall>[];
      TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
          .setMockMethodCallHandler(channel, (MethodCall call) async {
            calls.add(call);
            return null;
          });
      await acquireNativeVoiceAudioSession(kVoiceCallAudioOwner);
      await releaseNativeVoiceAudioSession(kVoiceCallAudioOwner);
      expect(calls, isEmpty);
    });
  });
}
