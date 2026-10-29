import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/voice/domain/voice_output_route.dart';
import 'package:fluxer_app/features/voice/utils/audio/speaker_route.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  const MethodChannel channel = MethodChannel('fluxer_app/voice_speaker_route');

  setUp(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(channel, null);
  });

  tearDown(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(channel, null);
    debugDefaultTargetPlatformOverride = null;
  });

  group('presentNativeVoiceRoutePicker', () {
    test('invokes presentRoutePicker on iOS', () async {
      debugDefaultTargetPlatformOverride = TargetPlatform.iOS;
      String? method;
      TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
          .setMockMethodCallHandler(channel, (MethodCall call) async {
            method = call.method;
            return 'speaker';
          });
      final String? picked = await presentNativeVoiceRoutePicker();
      expect(method, 'presentRoutePicker');
      expect(picked, 'speaker');
    });

    test('is a no-op on Android', () async {
      debugDefaultTargetPlatformOverride = TargetPlatform.android;
      var called = false;
      TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
          .setMockMethodCallHandler(channel, (MethodCall call) async {
            called = true;
            return null;
          });
      final String? picked = await presentNativeVoiceRoutePicker();
      expect(called, isFalse);
      expect(picked, isNull);
    });
  });

  group('readNativeActiveVoiceOutputRoute', () {
    test('maps activeRoute response on iOS', () async {
      debugDefaultTargetPlatformOverride = TargetPlatform.iOS;
      TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
          .setMockMethodCallHandler(channel, (MethodCall call) async {
            if (call.method == 'activeRoute') {
              return 'earpiece';
            }
            return null;
          });
      final VoiceOutputRoute? route = await readNativeActiveVoiceOutputRoute();
      expect(route, VoiceOutputRoute.earpiece);
    });
  });

  group('applyNativeVoiceOutputRoute', () {
    test('passes hold when setting route on Android', () async {
      debugDefaultTargetPlatformOverride = TargetPlatform.android;
      Object? arguments;
      TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
          .setMockMethodCallHandler(channel, (MethodCall call) async {
            if (call.method == 'setRoute') {
              arguments = call.arguments;
            }
            return null;
          });
      await applyNativeVoiceOutputRoute(VoiceOutputRoute.earpiece, hold: true);
      expect(arguments, isA<Map<Object?, Object?>>());
      final Map<Object?, Object?> args = arguments! as Map<Object?, Object?>;
      expect(args['route'], 'earpiece');
      expect(args['hold'], isTrue);
    });
  });

  group('clearNativeVoiceOutputRouteHold', () {
    test('invokes clearRouteHold on Android', () async {
      debugDefaultTargetPlatformOverride = TargetPlatform.android;
      String? method;
      TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
          .setMockMethodCallHandler(channel, (MethodCall call) async {
            method = call.method;
            return null;
          });
      await clearNativeVoiceOutputRouteHold();
      expect(method, 'clearRouteHold');
    });
  });
}
