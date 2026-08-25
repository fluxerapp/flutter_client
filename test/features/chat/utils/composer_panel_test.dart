import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/chat/utils/composer_panel.dart';

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
}
