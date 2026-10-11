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

  group('resolveDockedComposerPanel', () {
    test('docks the open attachment panel over the expression panel', () {
      expect(
        resolveDockedComposerPanel(
          expressionPanelOpen: true,
          attachmentPanelOpen: true,
          keyboardTakingOver: false,
          previous: null,
        ),
        DockedComposerPanel.attachment,
      );
    });

    test('docks the open expression panel', () {
      expect(
        resolveDockedComposerPanel(
          expressionPanelOpen: true,
          attachmentPanelOpen: false,
          keyboardTakingOver: false,
          previous: null,
        ),
        DockedComposerPanel.expression,
      );
    });

    test('keeps the closed panel docked while the keyboard takes over', () {
      expect(
        resolveDockedComposerPanel(
          expressionPanelOpen: false,
          attachmentPanelOpen: false,
          keyboardTakingOver: true,
          previous: DockedComposerPanel.attachment,
        ),
        DockedComposerPanel.attachment,
      );
    });

    test('drops the closed panel once the keyboard has taken over', () {
      expect(
        resolveDockedComposerPanel(
          expressionPanelOpen: false,
          attachmentPanelOpen: false,
          keyboardTakingOver: false,
          previous: DockedComposerPanel.expression,
        ),
        isNull,
      );
    });
  });
}
