import 'package:flutter/gestures.dart';
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

    test('keeps chrome visible while the participant menu is pinned', () {
      final ProviderContainer container = _overlayContainer();
      final VoiceCallOverlay overlay = container.read(
        voiceCallOverlayProvider.notifier,
      );
      overlay.setMenuPinned(value: true);
      overlay.hide();
      expect(container.read(voiceCallOverlayProvider).showsOverlay, isTrue);
      expect(container.read(voiceCallOverlayProvider).isMenuPinned, isTrue);
    });

    test('ignores touch hover and reveals on mouse move', () {
      final ProviderContainer container = _overlayContainer();
      final VoiceCallOverlay overlay = container.read(
        voiceCallOverlayProvider.notifier,
      );
      overlay.hide();
      expect(container.read(voiceCallOverlayProvider).showsOverlay, isFalse);
      overlay.notePointerActivity(kind: PointerDeviceKind.touch);
      expect(container.read(voiceCallOverlayProvider).showsOverlay, isFalse);
      overlay.notePointerActivity(kind: PointerDeviceKind.mouse);
      expect(container.read(voiceCallOverlayProvider).showsOverlay, isTrue);
    });
  });
}
