import 'package:fake_async/fake_async.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/accessibility/providers/screen_reader_active_provider.dart';
import 'package:fluxer_app/features/voice/providers/voice_call_overlay_provider.dart';
import 'package:fluxer_app/features/voice/providers/voice_session_provider.dart';
import 'package:fluxer_app/features/voice/providers/voice_session_state.dart';

class _IdleVoiceSession extends VoiceSession {
  @override
  VoiceSessionState build() => const VoiceSessionState();
}

class _ScreenReaderOn extends ScreenReaderActive {
  @override
  bool build() => true;
}

ProviderContainer _overlayContainer({bool screenReader = false}) {
  final ProviderContainer container = ProviderContainer(
    overrides: [
      voiceSessionProvider.overrideWith(_IdleVoiceSession.new),
      if (screenReader)
        screenReaderActiveProvider.overrideWith(_ScreenReaderOn.new),
    ],
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

    test('keeps the overlay visible while the participant menu is pinned', () {
      final ProviderContainer container = _overlayContainer();
      container.read(voiceCallOverlayProvider.notifier)
        ..setMenuPinned(value: true)
        ..hide();
      expect(container.read(voiceCallOverlayProvider).showsOverlay, isTrue);
      expect(container.read(voiceCallOverlayProvider).isMenuPinned, isTrue);
    });

    test('ignores touch hover and reveals on mouse move', () {
      final ProviderContainer container = _overlayContainer();
      final VoiceCallOverlay overlay = container.read(
        voiceCallOverlayProvider.notifier,
      )..hide();
      expect(container.read(voiceCallOverlayProvider).showsOverlay, isFalse);
      overlay.notePointerActivity(kind: PointerDeviceKind.touch);
      expect(container.read(voiceCallOverlayProvider).showsOverlay, isFalse);
      overlay.notePointerActivity(kind: PointerDeviceKind.mouse);
      expect(container.read(voiceCallOverlayProvider).showsOverlay, isTrue);
    });
  });

  group('VoiceCallOverlay with a screen reader', () {
    test('stays visible when hidden, toggled or auto-hidden', () {
      fakeAsync((FakeAsync async) {
        final ProviderContainer container = _overlayContainer(
          screenReader: true,
        );
        final VoiceCallOverlay overlay = container.read(
          voiceCallOverlayProvider.notifier,
        );
        expect(
          container.read(voiceCallOverlayProvider).isScreenReaderPinned,
          isTrue,
        );
        overlay
          ..reveal()
          ..hide()
          ..toggle()
          ..scheduleAutoHide();
        async.elapse(kVoiceCallOverlayAutoHideDelay * 2);
        expect(container.read(voiceCallOverlayProvider).showsOverlay, isTrue);
      });
    });

    test('keeps the pin through armJoinOverlay and reset', () {
      final ProviderContainer container = _overlayContainer(screenReader: true);
      final VoiceCallOverlay overlay = container.read(
        voiceCallOverlayProvider.notifier,
      )..armJoinOverlay();
      expect(container.read(voiceCallOverlayProvider).showsOverlay, isTrue);
      overlay.reset();
      expect(container.read(voiceCallOverlayProvider).showsOverlay, isTrue);
    });

    test('playPhoneExit still hides the overlay', () async {
      final ProviderContainer container = _overlayContainer(screenReader: true);
      final VoiceCallOverlay overlay = container.read(
        voiceCallOverlayProvider.notifier,
      )..registerPhoneExitHost();
      final Future<void> exit = overlay.playPhoneExit();
      expect(container.read(voiceCallOverlayProvider).showsOverlay, isFalse);
      overlay.completePhoneExit();
      await exit;
      expect(container.read(voiceCallOverlayProvider).showsOverlay, isTrue);
    });

    test('auto-hide resumes when the screen reader turns off', () {
      fakeAsync((FakeAsync async) {
        final ProviderContainer container = _overlayContainer();
        final VoiceCallOverlay overlay = container.read(
          voiceCallOverlayProvider.notifier,
        );
        container.read(screenReaderActiveProvider.notifier).set(value: true);
        overlay.hide();
        expect(container.read(voiceCallOverlayProvider).showsOverlay, isTrue);
        container.read(screenReaderActiveProvider.notifier).set(value: false);
        async.elapse(kVoiceCallOverlayAutoHideDelay * 2);
        expect(container.read(voiceCallOverlayProvider).showsOverlay, isFalse);
      });
    });
  });
}
