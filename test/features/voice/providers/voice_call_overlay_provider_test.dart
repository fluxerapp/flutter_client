import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/voice/providers/voice_call_overlay_provider.dart';

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
}
