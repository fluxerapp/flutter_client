import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/settings/providers/preferences/voice_settings_provider.dart';
import 'package:fluxer_app/features/voice/domain/voice_output_route.dart';
import 'package:fluxer_app/features/voice/utils/audio/speaker_route.dart';
import 'package:fluxer_voice/fluxer_voice.dart'
    show
        FluxerVoiceAudioSession,
        NativeVoiceActiveRoute,
        NativeVoiceRoute,
        VoiceActiveOutputRoute,
        VoiceActiveRouteHostApi,
        VoiceAudioSessionHostApi;

class _FakeVoiceAudioSessionHostApi extends VoiceAudioSessionHostApi {
  final List<String> calls = <String>[];
  final Map<String, Map<String, Object?>> arguments =
      <String, Map<String, Object?>>{};
  @override
  Future<void> acquire(String owner) async {
    calls.add('acquire');
    arguments['acquire'] = <String, Object?>{'owner': owner};
  }

  @override
  Future<void> release(String owner) async {
    calls.add('release');
    arguments['release'] = <String, Object?>{'owner': owner};
  }

  @override
  Future<void> setPreferredRoute(
    NativeVoiceRoute route, {
    required bool explicit,
    int? deviceId,
  }) async {
    calls.add('setPreferredRoute');
    arguments['setPreferredRoute'] = <String, Object?>{
      'route': route,
      'deviceId': deviceId,
      'explicit': explicit,
    };
  }

  @override
  Future<String> diagnostics() async => '';
}

class _FakeVoiceActiveRouteHostApi extends VoiceActiveRouteHostApi {
  int calls = 0;
  NativeVoiceActiveRoute? active;

  @override
  Future<NativeVoiceActiveRoute?> activeRoute() async {
    calls++;
    return active;
  }
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late _FakeVoiceAudioSessionHostApi api;
  late _FakeVoiceActiveRouteHostApi activeRouteApi;

  setUp(() {
    api = _FakeVoiceAudioSessionHostApi();
    activeRouteApi = _FakeVoiceActiveRouteHostApi();
    FluxerVoiceAudioSession.instance.debugOverridePlatform(
      api: api,
      activeRouteApi: activeRouteApi,
    );
  });

  tearDown(() {
    FluxerVoiceAudioSession.instance.debugReset();
    debugDefaultTargetPlatformOverride = null;
  });

  group('VoiceIosNativeRouteSync', () {
    test('follows a return to headphones right after the speaker', () async {
      debugDefaultTargetPlatformOverride = TargetPlatform.iOS;
      activeRouteApi.active = NativeVoiceActiveRoute(
        route: NativeVoiceRoute.speaker,
      );
      final StreamController<NativeVoiceActiveRoute> routes =
          StreamController<NativeVoiceActiveRoute>.broadcast();
      addTearDown(routes.close);
      FluxerVoiceAudioSession.instance.debugOverridePlatform(
        api: api,
        activeRouteApi: activeRouteApi,
        activeRouteChanges: routes.stream,
      );
      final ProviderContainer container = ProviderContainer();
      addTearDown(container.dispose);
      container.read(voiceIosNativeRouteSyncProvider);
      await pumpEventQueue();
      expect(
        container.read(voiceIosNativeRouteSyncProvider),
        const VoiceActiveOutputRoute(VoiceOutputRoute.speaker),
      );
      routes
        ..add(NativeVoiceActiveRoute(route: NativeVoiceRoute.speaker))
        ..add(NativeVoiceActiveRoute(route: NativeVoiceRoute.headset));
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
      activeRouteApi.active = NativeVoiceActiveRoute(
        route: NativeVoiceRoute.earpiece,
      );
      final VoiceActiveOutputRoute? route =
          await readNativeActiveVoiceOutputRoute();
      expect(route, const VoiceActiveOutputRoute(VoiceOutputRoute.earpiece));
    });

    test(
      'keeps the device name iOS reports for an output with a name',
      () async {
        debugDefaultTargetPlatformOverride = TargetPlatform.iOS;
        activeRouteApi.active = NativeVoiceActiveRoute(
          route: NativeVoiceRoute.headset,
          name: 'Car Audio',
        );
        expect(
          await readNativeActiveVoiceOutputRoute(),
          const VoiceActiveOutputRoute(
            VoiceOutputRoute.headset,
            deviceName: 'Car Audio',
          ),
        );
      },
    );

    test('has no device name for an empty name', () async {
      debugDefaultTargetPlatformOverride = TargetPlatform.iOS;
      activeRouteApi.active = NativeVoiceActiveRoute(
        route: NativeVoiceRoute.headset,
        name: '',
      );
      expect(
        await readNativeActiveVoiceOutputRoute(),
        const VoiceActiveOutputRoute(VoiceOutputRoute.headset),
      );
    });

    test('is null without an active route', () async {
      debugDefaultTargetPlatformOverride = TargetPlatform.iOS;
      expect(await readNativeActiveVoiceOutputRoute(), isNull);
    });

    test('does not ask native on Android', () async {
      debugDefaultTargetPlatformOverride = TargetPlatform.android;
      expect(await readNativeActiveVoiceOutputRoute(), isNull);
      expect(activeRouteApi.calls, 0);
    });
  });

  group('applyNativeVoiceOutputRoute', () {
    test('sets the preferred route on Android', () async {
      debugDefaultTargetPlatformOverride = TargetPlatform.android;
      await applyNativeVoiceOutputRoute(
        VoiceOutputRoute.bluetooth,
        deviceId: 3,
        explicit: true,
      );
      expect(api.calls.single, 'setPreferredRoute');
      expect(api.arguments['setPreferredRoute'], <String, Object?>{
        'route': NativeVoiceRoute.bluetooth,
        'deviceId': 3,
        'explicit': true,
      });
    });

    test('leaves the route to the system picker on iOS', () async {
      debugDefaultTargetPlatformOverride = TargetPlatform.iOS;
      await applyNativeVoiceOutputRoute(VoiceOutputRoute.earpiece);
      expect(api.calls, isEmpty);
    });
  });

  group('native voice audio session', () {
    test('acquires and releases owners on Android', () async {
      debugDefaultTargetPlatformOverride = TargetPlatform.android;
      await acquireNativeVoiceAudioSession(kVoiceCallAudioOwner);
      expect(FluxerVoiceAudioSession.instance.isActive, isTrue);
      await releaseNativeVoiceAudioSession(kVoiceCallAudioOwner);
      expect(FluxerVoiceAudioSession.instance.isActive, isFalse);
      expect(api.calls, <String>['acquire', 'release']);
      expect(api.arguments['acquire'], <String, Object?>{'owner': 'voice'});
    });

    test('does nothing on iOS', () async {
      debugDefaultTargetPlatformOverride = TargetPlatform.iOS;
      await acquireNativeVoiceAudioSession(kVoiceCallAudioOwner);
      await releaseNativeVoiceAudioSession(kVoiceCallAudioOwner);
      expect(api.calls, isEmpty);
    });
  });
}
