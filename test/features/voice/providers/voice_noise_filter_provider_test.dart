import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/settings/providers/preferences/voice_settings_provider.dart';
import 'package:fluxer_app/features/voice/domain/voice_settings_state.dart';
import 'package:fluxer_app/features/voice/providers/voice_noise_filter_provider.dart';
import 'package:fluxer_voice/fluxer_voice.dart';

class _FakeApi implements VoiceNoiseFilterHostApi {
  bool attachResult = true;
  Set<NativeNoiseFilterBackend> failing = <NativeNoiseFilterBackend>{};
  final List<NativeNoiseFilterBackend> applied = <NativeNoiseFilterBackend>[];

  @override
  Future<bool> attach() async => attachResult;

  @override
  Future<bool> setBackend(NativeNoiseFilterBackend backend) async {
    if (failing.contains(backend)) {
      return false;
    }
    applied.add(backend);
    return true;
  }

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

class _FakeSettings extends VoiceSettings {
  @override
  VoiceSettingsState build() =>
      const VoiceSettingsState(voiceProcessingMode: VoiceProcessingMode.custom);

  @override
  Future<void> setNoiseSuppressionBackend(NoiseSuppressionBackend value) async {
    state = state.copyWith(noiseSuppressionBackend: value);
  }
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late _FakeApi api;
  late ProviderContainer container;

  setUp(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(
          const MethodChannel('FlutterWebRTC.Method'),
          (MethodCall call) async => null,
        );
    api = _FakeApi();
    FluxerNoiseFilter.instance.debugOverridePlatform(api: api);
    addTearDown(FluxerNoiseFilter.instance.debugOverridePlatform);
    container = ProviderContainer(
      overrides: [voiceSettingsProvider.overrideWith(_FakeSettings.new)],
    );
    addTearDown(container.dispose);
  });

  Future<void> prepare() =>
      container.read(voiceNoiseFilterProvider.notifier).prepareCapture();

  test('applies the requested backend before capture', () async {
    await prepare();
    expect(api.applied, <NativeNoiseFilterBackend>[
      NativeNoiseFilterBackend.rnnoise,
    ]);
    expect(container.read(voiceNoiseFilterProvider), isEmpty);
  });

  test('marks native backends unavailable when attach fails', () async {
    api.attachResult = false;
    await prepare();
    expect(container.read(voiceNoiseFilterProvider), <NoiseSuppressionBackend>{
      NoiseSuppressionBackend.gate,
      NoiseSuppressionBackend.rnnoise,
    });
    api.attachResult = true;
    await prepare();
    expect(container.read(voiceNoiseFilterProvider), isEmpty);
  });

  test('setting changes keep native backends off while detached', () async {
    api.attachResult = false;
    await prepare();
    await container
        .read(voiceSettingsProvider.notifier)
        .setNoiseSuppressionBackend(NoiseSuppressionBackend.gate);
    await container.pump();
    await Future<void>.delayed(Duration.zero);
    expect(
      container.read(voiceNoiseFilterProvider),
      NoiseSuppressionBackend.native,
    );
  });

  test('falls back when a backend cannot start', () async {
    api.failing = <NativeNoiseFilterBackend>{NativeNoiseFilterBackend.rnnoise};
    await prepare();
    expect(container.read(voiceNoiseFilterProvider), <NoiseSuppressionBackend>{
      NoiseSuppressionBackend.rnnoise,
    });
    expect(api.applied.last, NativeNoiseFilterBackend.none);
  });

  test('follows setting changes live', () async {
    await prepare();
    await container
        .read(voiceSettingsProvider.notifier)
        .setNoiseSuppressionBackend(NoiseSuppressionBackend.gate);
    await container.pump();
    await Future<void>.delayed(Duration.zero);
    expect(api.applied.last, NativeNoiseFilterBackend.gate);
    await container
        .read(voiceSettingsProvider.notifier)
        .setNoiseSuppressionBackend(NoiseSuppressionBackend.standard);
    await container.pump();
    await Future<void>.delayed(Duration.zero);
    expect(api.applied.last, NativeNoiseFilterBackend.none);
  });
}
