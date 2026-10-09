import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/voice/providers/voice_callkit_engine_gate_provider.dart';

void main() {
  group('VoiceCallKitEngineGate', () {
    test('starts with engine available', () {
      final ProviderContainer container = ProviderContainer();
      addTearDown(container.dispose);

      expect(container.read(voiceCallKitEngineSuppressedProvider), isFalse);
    });

    test('tracks CallKit engine suppression', () {
      final ProviderContainer container = ProviderContainer();
      addTearDown(container.dispose);

      container
          .read(voiceCallKitEngineSuppressedProvider.notifier)
          .setSuppressed(suppressed: true);
      expect(container.read(voiceCallKitEngineSuppressedProvider), isTrue);
      expect(container.read(voiceCallKitEngineSuppressedProvider), isTrue);

      container
          .read(voiceCallKitEngineSuppressedProvider.notifier)
          .setSuppressed(suppressed: false);
      expect(container.read(voiceCallKitEngineSuppressedProvider), isFalse);
    });
  });
}
