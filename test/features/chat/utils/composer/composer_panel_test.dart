import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/chat/utils/composer/composer_panel.dart';

void main() {
  group('isComposerPanelOpen', () {
    test('is false when both panels are closed', () {
      expect(
        isComposerPanelOpen(
          expressionPanelOpen: false,
          attachmentPanelOpen: false,
        ),
        isFalse,
      );
    });

    test('is true when the expression panel is open', () {
      expect(
        isComposerPanelOpen(
          expressionPanelOpen: true,
          attachmentPanelOpen: false,
        ),
        isTrue,
      );
    });

    test('is true when the attachment panel is open', () {
      expect(
        isComposerPanelOpen(
          expressionPanelOpen: false,
          attachmentPanelOpen: true,
        ),
        isTrue,
      );
    });
  });

  group('usesInlineAttachmentPanel', () {
    test('is true on native mobile layout', () {
      expect(
        usesInlineAttachmentPanel(isNativeMobileOs: true, isMobileLayout: true),
        isTrue,
      );
    });

    test('is false on tablet or desktop layout', () {
      expect(
        usesInlineAttachmentPanel(
          isNativeMobileOs: true,
          isMobileLayout: false,
        ),
        isFalse,
      );
    });

    test('is false on desktop OS even in a compact window', () {
      expect(
        usesInlineAttachmentPanel(
          isNativeMobileOs: false,
          isMobileLayout: true,
        ),
        isFalse,
      );
    });
  });
}
