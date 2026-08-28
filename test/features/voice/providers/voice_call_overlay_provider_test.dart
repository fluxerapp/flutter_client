import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/voice/providers/voice_call_overlay_provider.dart';
import 'package:fluxer_app/features/voice/providers/voice_session_provider.dart';
import 'package:fluxer_app/features/voice/providers/voice_session_state.dart';

class _IdleVoiceSession extends VoiceSession {
  @override
  VoiceSessionState build() => const VoiceSessionState();
}

ProviderContainer _overlayContainer() {
  final ProviderContainer container = ProviderContainer(
    overrides: [voiceSessionProvider.overrideWith(_IdleVoiceSession.new)],
  );
  addTearDown(container.dispose);
  return container;
}

void main() {
  group('VoiceCallOverlayState', () {
    test('showsOverlay when visible or sheet expanded', () {
      const VoiceCallOverlayState visible = VoiceCallOverlayState();
      expect(visible.showsOverlay, isTrue);

      const VoiceCallOverlayState hidden = VoiceCallOverlayState(
        isVisible: false,
      );
      expect(hidden.showsOverlay, isFalse);

      const VoiceCallOverlayState expanded = VoiceCallOverlayState(
        isVisible: false,
        isSheetExpanded: true,
      );
      expect(expanded.showsOverlay, isTrue);
    });
  });

  group('VoiceCallOverlay', () {
    test('playPhoneExit completes immediately without a host', () async {
      final ProviderContainer container = _overlayContainer();
      await container.read(voiceCallOverlayProvider.notifier).playPhoneExit();
      expect(container.read(voiceCallOverlayProvider).isExiting, isFalse);
    });
  });
}
